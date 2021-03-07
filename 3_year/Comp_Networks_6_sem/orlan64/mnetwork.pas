// ********************************************************************
//  mnetwork.pas
//
//  �������� ������ Network
//  ��������� ������ ��������� ������ � �����, ��� ��� ������� � ���������
//  ������� NetJob, NetNode, Domain �������������� + ������ � ���� StatSuccCount
//
//  ���� �� �������, ���� �� ������� � ��� ��� ������, ������� ���������
//  � ������� ������ ����������� ������� � ����� ���������
//
//  ���� �� ������� - OneTic
//  ���� �� ������� - OneStep
// ********************************************************************


unit mnetwork;

interface

uses sysutils, mdomain, mjob, mnetnode, classes, orlan;

type
   Network = class


   public
      Jobs : array of NetJob;
      NetNodes : array of NetNode;
      Domains : array of Domain;

      StatSuccCount : integer; //����� StatSuccCount �� ���� ������� ������

      procedure AddJob(   mHopClient : integer;
                          mReqSize : integer;
                          mReqPrepareTime : int64;
                          mReqsNumber : integer;
                          mHopServer : integer;
                          mAnsSize : integer;
                          mAnsPrepareTime : int64;
                          mAnssNumber : integer;
                          mCategory : integer;
                          mHops : DynIntArray;
                          mHopDelays : DynInt64Array;
                          mCycleTime : int64;
						  mPossibleTime : integer; 	//_ ���������� ����� ��������
						  mPossiblePercent : byte;  //_ ���������� ������� ������ ����. ���������� �����
                          mDistOfServerDelay : DistDelayType;
                          mHopDelay2: int64 );
      procedure CalculateProfile( );
      procedure OneTic( );
      constructor Create( );
      destructor Destroy; override;

   private
      procedure OneStep( var Dom : Domain);
      function FindDomainBetweenNodes( Node1, Node2 : integer ): integer;
      function GetJobsCount( var Dom : Domain; FrameState : FrameStateType ) : integer;
      function GetPreparingJobsCount( Node : integer ) : integer;
      function IsMaxPriority ( Job: NetJob ) : boolean;
      procedure ShiftJobs( Dom : Domain );
      function GetQueueLength ( Dom : Domain ): byte;
   end;

//type
type
 Route_Type = ^R_Type;
 // �������� ������ ����� �� ������� ����� �� � � �
 R_Type = record
  ID:integer;   // NodeID ��� Node, ChannalID ��� Channal
  type_: byte;  // 0 ��� Node, 1 ��� Channal
  s: real;      // ��������
  Port: integer;// PortNumber ��� Node
  SegID:integer // SegmentID ��� Channal
 end;

type
   ScatError = class(Exception);
   NetworkError = class(Exception);

var
	Route: TList;
	Route_Element: Route_Type;

	//������������ ��� ���������� ������������ ����� �������������, ����
	//��� ������ ����� ������������ �����, ������� 1 ��...
	Speeder : integer;

    // circle counter
    counter: byte;

  // ���������� ���������� jump_tics, ����� ����������� ���������
  // ������������� ����� ����������, ������� �� ����� ������������
  jump_tics : int64;

implementation
	uses math, main,wait,connect, ex_anal, switch, JobsPack;

//_========================================
//_ �����������
//_========================================
constructor Network.Create();
begin
   inherited Create();

   StatSuccCount := 0;
   Randomize();
end;

//_========================================
//_ ����������
//_========================================
destructor Network.Destroy;
var i : integer;
    Node : NetNode;
    Dom : Domain;
    Job : NetJob;
begin
//���������� ������, ���������� ��� ������� Jobs
   for i := 0 to Length(Jobs)-1 do
   begin
      Job := Jobs[i];
      Job.Free;
   end;

//���������� ������, ���������� ��� ������� Domains
   for i := 0 to Length(Domains)-1 do
   begin
      Dom := Domains[i];
      Dom.Free;
   end;

//���������� ������, ���������� ��� ������� NetNodes
   for i := 0 to Length(NetNodes)-1 do
   begin
      Node := NetNodes[i];
      Node.Free;
   end;

   inherited Destroy;
end;

//_========================================
//_ ��������� �������� ���������� AverageLoad ��� Domains � NetNodes,
//_ � Network.StatSuccCount
//_========================================
procedure Network.CalculateProfile( );
var i, j, z : integer;
    Node : NetNode;
    Dom : Domain;
    Job : NetJob;
begin

	//_ ������
    //_///////////////////////////////
   for i := 0 to Length(Domains)-1 do
   begin
      Dom := Domains[i];

      for z := 0 to Length(Jobs)-1 do
      begin
         Inc( Dom.TotalJobsWaitTics, Dom.JobWaitTics[z] );
         Inc( Dom.TotalJobsWaitTacts, Dom.JobWaitTacts[z] );
         Inc( Dom.TotalJobsServicingTics, Dom.JobServicingTics[z] );
      end;
   end;

	//_ ����
    //_///////////////////////////////
   for i := 0 to Length(NetNodes)-1 do
   begin
      Node := NetNodes[i];

      //�������� ����� ������, ������� ������ ���� ����.
      //���� ���������� ��������� � ���������� �������, ��� ����� ������������.
      //���� ��� �������, ����� ����� ������ ����� ����� ������ ������.
      Node.TotalTacts := 0;
      for j := 0 to MaxNodeConns-1 do
         if Node.Conns[j] <> -1 then
         begin
            Dom := Domains[Node.Conns[j]];
            Inc( Node.TotalTacts, Dom.TotalTacts );
         end;

      if Node.TotalTacts = 0 then
         Node.TotalTacts := 1;

      for z := 0 to Length(Jobs)-1 do
      begin
         Inc( Node.TotalJobsWaitTics, Node.JobWaitTics[z] );
         Inc( Node.TotalJobsWaitTacts, Node.JobWaitTacts[z] );
         Inc( Node.TotalJobsServicingTics, Node.JobServicingTics[z] );
      end;
   end;

   //_ ...
   /////////////////////////////////
   for i := 0 to Length(Jobs)-1 do
   begin
      Job := Jobs[i];
      Inc( StatSuccCount, Job.StatSuccCount );

      if Job.StatSuccCount=0 then
         Job.StatSuccCount := 1;
   end;

   if StatSuccCount=0 then
      StatSuccCount := 1;
end;

//========================================
// ���������:
// Node1, Node2 - ������� ������� Network.NetNodes, ����������� �� ����,
//   ����� �������� ��������� ����� �����.
// ����������: ������ ������� Network.Domains ��� -1, ���� �� ������.
//========================================
function Network.FindDomainBetweenNodes( Node1, Node2 : integer ): integer;
var i, j, k : integer;
    Dom1, Dom2 : integer;
    nn1,nn2 : NetNode ;
begin
   FindDomainBetweenNodes := -1;
   if Node1 = Node2 then
      exit;

   if (Node1<Length(NetNodes))
      then
      nn1:=NetNodes[Node1]
      else
      Dom1:=-1;
   if (Node2<Length(NetNodes))
      then
      nn2:=NetNodes[Node2]
      else
      Dom2:=-1;
   for i := 0 to MaxNodeConns-1 do
    begin
     Dom1 := nn1.Conns[i];
     if Dom1 <> -1 then
     begin
       for j := 0 to MaxNodeConns-1 do
        begin
         Dom2 := nn2.Conns[j];
         if Dom2 <> -1 then
         begin
           if Dom1 = Dom2 then
           begin
             FindDomainBetweenNodes := Dom1;
             Exit;
           end;
         end;
        end;
     end;
    end;
end;

//_========================================
//_ �������� ������ �� ��������� ������ ������
//_========================================
procedure Network.AddJob( mHopClient : integer;
                          mReqSize : integer;
                          mReqPrepareTime : int64;
                          mReqsNumber : integer;
                          mHopServer : integer;
                          mAnsSize : integer;
                          mAnsPrepareTime : int64;
                          mAnssNumber : integer;
                          mCategory : integer;
                          mHops : DynIntArray;
                          mHopDelays : DynInt64Array;
                          mCycleTime : int64;
						  mPossibleTime : integer;
						  mPossiblePercent : byte;
                          mDistOfServerDelay: DistDelayType;
                          mHopDelay2: int64);
var
   Job : NetJob;
   Dom : Domain;
   Node : NetNode;
   i : integer;
begin
   Job := NetJob.Create( mReqSize,
                         mReqsNumber,
                         mAnsSize,
                         mAnssNumber,
                         mCategory,
                         mCycleTime );

   SetLength( Job.Hops, Length(mHops));
   SetLength( Job.HopDelays, Length(mHopDelays));
   for i := 0 to Length(mHops)-1 do
   begin
     Job.Hops[i] := mHops[i];
     Job.HopDelays[i] := mHopDelays[i];
   end;

   Job.HopDelays[0] := mReqPrepareTime; //����� �������
   Job.HopDelays[Length(Job.HopDelays)-1] := mAnsPrepareTime; //����� �������

   Job.CurrHopIndx := 0;
   Job.CurrDomain := Domains[FindDomainBetweenNodes( Job.Hops[0], Job.Hops[1] )];

   Job.ReqsLeft := Job.ReqsNumber;
   Job.AnssLeft := Job.AnssNumber;
   Job.SetNewState( StInBuffer );
	//��������� ������������� - ������ �������� ��������������
	//Job.TactsLeft := Random(Job.TactsLeft);
   Job.TactsLeft := Random(50);

   Job.MaxServTime := 0;
   Job.CurrServTime:= 0;
   Job.PossibleTime:= mPossibleTime;
   Job.PossiblePercent:= mPossiblePercent;
   Job.DistOfServerDelay:=mDistOfServerDelay;
   Job.HopDelay2:=mHopDelay2;

   SetLength( Jobs, Length( Jobs )+1 );
   Jobs[ Length( Jobs )-1 ] := Job;

   //�������� ����� ��� �������� ������� �������� ������ � ������ ����
   for i := 0 to Length(NetNodes)-1 do
   begin
      Node := NetNodes[i];
      SetLength( Node.JobWaitTics, Length(Node.JobWaitTics)+1 );
      Node.JobWaitTics[Length(Node.JobWaitTics)-1] := 0;

      SetLength( Node.JobWaitTacts, Length(Node.JobWaitTacts)+1 );
      Node.JobWaitTacts[Length(Node.JobWaitTacts)-1] := 0;

      SetLength( Node.JobServicingTics, Length(Node.JobServicingTics)+1 );
      Node.JobServicingTics[Length(Node.JobServicingTics)-1] := 0;
   end;

   //�������� ����� ��� �������� ������� �������� ������ � ������ ������
   for i := 0 to Length(Domains)-1 do
   begin
      Dom := Domains[i];
      SetLength( Dom.JobWaitTics, Length(Dom.JobWaitTics)+1 );
      Dom.JobWaitTics[Length(Dom.JobWaitTics)-1] := 0;

      SetLength( Dom.JobWaitTacts, Length(Dom.JobWaitTacts)+1 );
      Dom.JobWaitTacts[Length(Dom.JobWaitTacts)-1] := 0;

      SetLength( Dom.JobServicingTics, Length(Dom.JobServicingTics)+1 );
      Dom.JobServicingTics[Length(Dom.JobServicingTics)-1] := 0;
   end;

end;


//_========================================
//_ ���� ��� - � ����� ����� ����� ���� ��������� �����
//_========================================
procedure Network.OneTic();
var i : integer;
    Dom : Domain;
 begin
	//_ ���� �� ������� - � ������ ������ ����������� ���� ���
   for i := 0 to Length(Domains)-1 do
   begin
      Dom := Domains[i];
      Dec( Dom.TicsLeft, 1 );
      If Dom.TicsLeft = 0 then
      begin
         OneStep( Dom );
         Dom.TicsLeft := Dom.TicsPerTact;
      end;
   end;
end;

//_========================================
//_ ���� ��� ������������� - ����������� ������ ���
//_========================================
procedure Network.OneStep( var Dom : Domain );
var i, _i : integer;
    Colliding : integer;
    Transmitting : integer;
    Preparing : integer;
    Job : NetJob;
    Node1, Node2 : integer;
    nNewState : FrameStateType;
begin


   Colliding := GetJobsCount( Dom, StCanCollide );
   If Colliding > 1 then
   begin
      for i := 0 to Length(Jobs)-1 do
      begin
         Job := Jobs[i];
         if (Job.CurrDomain = Dom) and (Job.FrameState = StCanCollide) then
             Job.SetNewState( StRandomWait );
      end;
   end;

   for i := 0 to Length( Jobs )-1 do
   begin
       _i:=( counter+i ) mod ( length( Jobs ) );

        Job := Jobs[_i];
       if Job.CurrDomain = Dom then
       begin
          Dec( Job.TactsLeft, 1 );
          if Job.TactsLeft <= 0 then
          begin
             case Job.FrameState of

             	//_ ����� ��������� �� �������, ������� ��� ����������� � ��������
                StNetNode:
                begin
                   //_ ���� ��������� �� ������� � ������� ��� (� ���� �����), ��..
                   if (Job.CurrHopIndx = Length(Job.Hops) - 1) and (Job.AnssLeft = 0) then
                   //_ ��������� ������ �� ������: �� �������, ������ ���. ���� � �����
                   begin
                      Job.ReqsLeft := Job.ReqsNumber;     //_ 1
                      Job.AnssLeft := Job.AnssNumber;     //_ {1,0}
                      Job.CurrHopIndx := 0;               //_ ������

                      Node1 := Job.Hops[0];				  //_ ������
                      Node2 := Job.Hops[1];               //_ ��������� ���� �� ��������
                      Job.CurrDomain := Domains[FindDomainBetweenNodes( Node1, Node2 )];

                     if ((Job.CurrServTime / 1000000 * Speeder) > Job.PossibleTime) then
                      	Inc( Job.CountOfExcQueries );

                      if  Job.CurrServTime >  Job.MaxServTime then
                   		 Job.MaxServTime := Job.CurrServTime;
                      Job.CurrServTime := 0;

                      Inc( Job.StatSuccCount );
                      Job.SetNewState( StNetNode );
                   end
                   else
                   	  begin
                      Job.PositionInQueue := GetQueueLength( Job.CurrDomain ) + 1;
                      Job.SetNewState( StWaitForFree );
                      end
                end;

                StWaitForFree:
                //_ ���� ����� (�����) ��������, �� �������� ���������� � �������
                //_ (StCanCollide), ����� ������� ������������ ������ (������)
                begin
                   Transmitting := GetJobsCount( Dom, StTransmission );

                   if ( Transmitting = 0 ) and
                   	  ( Job.PositionInQueue=1 )	then
                      begin
                      ShiftJobs( Dom );
                      Job.SetNewState( StCanCollide );
                      end
                   else
                      Job.SetNewState( StWaitForFree );
                end;

                StInBuffer:
                begin
                   Node1 := Job.Hops[Job.CurrHopIndx];
                   Preparing := GetPreparingJobsCount( Node1 );
                   if ( NetNodes[ Node1 ].MaxTaskNumber > 1 ) or
                   	  (( Preparing < NetNodes[ Node1 ].MaxTaskNumber) and
                       						(IsMaxPriority(Job)=True))then
                      Job.SetNewState( StNetNode )
                   else
                      Job.SetNewState( StInBuffer );
                end;

                StCanCollide:
                begin
                   Job.SetNewState( StTransmission );
                end;

                StTransmission:
                begin
                   Job.SetNewState( StPostWait );

                   //������ ���������� ����� � ���������� (��� ���. �������� �������� ������)
                   if (Job.ReqsLeft > 0) then
                      Inc( Dom.JobServicingTics[_i], Job.ReqSize * Dom.TicsPerTact )
                   else
                      Inc( Dom.JobServicingTics[_i], Job.AnsSize * Dom.TicsPerTact );
                end;

                StPostWait:
                begin
                   nNewState := StInBuffer;

                   if Job.ReqsLeft = 1 then
                    begin
        						//���� ��� ������...
				        		//��������� ���� - �� �� ��������� �� ������ Hops
        						Inc( Job.CurrHopIndx );
        						//���� ��������� ������� - ������...
        						if Job.CurrHopIndx = Length(Job.Hops) - 1 then
                      begin
                     	//��������: ������ ������!
        							//Inc( Job.StatSuccCount );
        							Job.ReqsLeft := 0;
        							nNewState := StWaitForCycle;
        						  end
                    else
                      begin
                      //������� ������� - ����������, � ����� �������� ������� �����
                      Node1 := Job.Hops[Job.CurrHopIndx];
                      Node2 := Job.Hops[Job.CurrHopIndx+1];
                      Job.CurrDomain := Domains[FindDomainBetweenNodes( Node1, Node2 )];
                      end;
                   end
                   else
                 		begin
                   	//���� ��� �����...
                   	//��������� ���� - ��� ���������� �� ������ Hops,
                   	//������ ������ �������� � �������� �����������.
                   	Dec( Job.CurrHopIndx );
                   	//���� ��������� ������� - ������...
                   	if Job.CurrHopIndx = 0 then
                   		begin
                     	//����� ������!
                     	Inc( Job.StatSuccCount );
                     	Job.ReqsLeft := Job.ReqsNumber;
                     	Job.AnssLeft := Job.AnssNumber;

                     	nNewState := StWaitForCycle;
         							if  Job.CurrServTime >  Job.MaxServTime then
		  	            		Job.MaxServTime := Job.CurrServTime;
         							Job.CurrServTime := 0;
                   		end
                    else
                      begin
                     	//������� ������� - ����������, � ����� �������� ������� �����
                     	Node1 := Job.Hops[Job.CurrHopIndx];
                     	Node2 := Job.Hops[Job.CurrHopIndx-1];
                     	Job.CurrDomain := Domains[FindDomainBetweenNodes( Node1, Node2 )];
                  		end;
                   	end;

                	Job.SetNewState( nNewState );
                end;

                StWaitForCycle:
                begin
                   Job.SetNewState( StInBuffer );
                end;

                StRandomWait:
                begin
                   Job.PositionInQueue := GetQueueLength( Job.CurrDomain ) + 1;
                   Job.SetNewState( StWaitForFree );
                end;

             end;
          end;

          //���������� ��������� ����������
          if (Job.FrameState = StCanCollide) or
             (Job.FrameState = StTransmission) or
             (Job.FrameState = StPostWait) or
             (Job.FrameState = StRandomWait) or
             (Job.FrameState = StWaitForFree) then
             begin
                Inc( Dom.JobWaitTacts[_i] );
                Inc( Dom.JobWaitTics[_i], Dom.TicsPerTact );
             end;

          //���������� ��������� ������� ��� �����
          if (Job.FrameState = StNetNode) or
             (Job.FrameState = StInBuffer) then
          begin
             Node1 := Job.Hops[ Job.CurrHopIndx ];
             Inc( NetNodes[Node1].JobWaitTacts[_i] );
             Inc( NetNodes[Node1].JobWaitTics[_i], Dom.TicsPerTact );

             if Job.FrameState = StNetNode then
             begin
                Inc( NetNodes[Node1].JobServicingTics[_i], Dom.TicsPerTact );
             end;
          end;

          //_ ���������� ��������� ������
          Inc( Job.CurrServTime, Dom.TicsPerTact );
       end;
   end;

   if Length( Jobs )=1 then
		counter:=0
   else
		counter:=( counter+1 ) mod ( length( Jobs )-1 );
   Inc (Dom.TotalTacts );
end;

//_========================================
//_ ������������ ����� ������, �����������
//_ � ������ ������ � � ��������� ���������
//_========================================
function Network.GetJobsCount( var Dom : Domain; FrameState : FrameStateType ) : integer;
var i : integer;
    Count: integer;
    Job : NetJob;
begin
   Count := 0;
   for i := 0 to Length(Jobs)-1 do
   begin
      Job := Jobs[i];
      if (Job.CurrDomain = Dom) and (Job.FrameState = FrameState) then
         Inc( Count );
   end;

   GetJobsCount := Count;
end;

//_============================================================
//_ ������������ ����� ������, �����������
//_ � ��������� StNetNode �� ������ ����
//_============================================================
function Network.GetPreparingJobsCount( Node : integer ) : integer;
var i : integer;
   Count : integer;
   Job : NetJob;
begin
   Count := 0;
   for i := 0 to Length(Jobs)-1 do
   begin
      Job := Jobs[i];
      if (Job.Hops[Job.CurrHopIndx] = Node) and (Job.FrameState = StNetNode) then
         Inc(Count);
   end;

   GetPreparingJobsCount := Count;
end;

//_============================================================
// ������� ���������� true, ���� ���������� � �������� ���������
// ������, ����� ���������� ��������� ����� ������, �����������
// � ������� � �������� ����; false - � ��������� ������
//_============================================================
function Network.IsMaxPriority ( Job: NetJob ) : boolean;
var i, Node: integer;
    Rezult: boolean;
Begin
	Rezult:=True;
	Node:=Job.Hops[ Job.CurrHopIndx ];
    for i:=0 to Length(Jobs)-1 do
        if ((Jobs[i].Hops[Jobs[i].CurrHopIndx] = Node) and (Jobs[i].FrameState = StInBuffer)
			and ( Job.Category < Jobs[i].Category )) then
            Rezult:=False;

	IsMaxPriority:=Rezult;
End;

//=============================================================
// �������� ������ � ������� - ���������� �� ��� ������ ������
// ����������� �������� PositionInQueue  �, ��� �����, ������
// "������������" � ������
//=============================================================
procedure Network.ShiftJobs( Dom : Domain );
var i: integer;
	Job : NetJob;
begin
	for i := 0 to Length(Jobs)-1 do
	begin
		Job := Jobs[i];
		if (Job.CurrDomain = Dom ) and (Job.FrameState = StWaitForFree) then
			Job.PositionInQueue:=Job.PositionInQueue-1;
   end;
end;

//=============================================================
// �������� ���������� ������, ����������� � ������� � Dom
//=============================================================
function Network.GetQueueLength ( Dom : Domain ): byte;
var i: integer;
	Job : NetJob;
begin
	result:=0;
	for i := 0 to Length(Jobs)-1 do
	begin
		Job := Jobs[i];
        if (Job.CurrDomain = Dom) and (Job.FrameState = StWaitForFree) then
			if result < Job.PositionInQueue then
            	result:=Job.PositionInQueue;
	end;
end;

end.
