// ********************************************************************
//  mjob.pas
//
//  �������� ������ Netjob
//  ���������� ������ ��������� ������ ������
// ********************************************************************

unit mjob;

interface

uses mdomain;

type
   FrameStateType = (
//�������� ������ ��������� ������ �������� � ������, ���� ��� �� ����� ������������ ��������� ������� ������������
                      StInBuffer,
//����� ��������� �� �������, ������� ��� ����������� � ��������
                      StNetNode,
//�������� ��������� � ������ ������. � ��� ����� �������� ������������
                      StCanCollide,
//�������� ������� ������
                      StTransmission,
//�������� ������� ������������ ������
                      StPostWait,
//����� � �������� ����� ������������� ������������
                      StRandomWait,
//�������� ������������ ������
                      StWaitForFree,
//�������� ��������� �����, ���� ���������
                      StWaitForCycle );

type
   DynIntArray = array of integer;

type
   DynInt64Array = array of int64;

type
   DistDelayType = (Constant,
                    Exponential);
type
   NetJob = class
   public
      ReqSize : integer;      //������ ������� � ������
      ReqsNumber : integer;   //�� ����� ���� ����� 0. ������� �������������� ��� �������, ����� ��� ������.
      AnsSize : integer;      //������ ������ � ������
      AnssNumber : integer;   //���������� ������� �� ReqsNumber ��������. ����� ���� ����� 0
      Category : byte;		  //��������� ������
      CycleTime : int64;      //����� ����� ������, �� ���� ����������� ����� ����� ���������� ����� ������

      Hops : DynIntArray;       //������� ������: Client->Switch1->...->SwitchN->Server (������� ������� Network.NetNodes)
      HopDelays : DynInt64Array;//������ �������� � �����, � ��� ����� �������� � ������� � �������
      CurrHopIndx : integer;    //������ � Hops � HopDelays - ������� ����, ������� �������� ��� ������
      CurrDomain : Domain;      //������� �����
      ReqsLeft : integer;       //������� �������� �������� �������� � ���� �����
      AnssLeft : integer;       //������� �������� �������� ������� � ���� �����.
      FrameState : FrameStateType;	//������� ��������� ������
      TactsLeft : integer;			//������� ������ �������� ���������� � ���� ���������
      TactsSpentInCycle : int64;	//������� ������ ������ ��� ���������� � ������� �����

      StatTriesCount : integer;		//������� ���� ��������� ������� ��������
      StatSuccCount : integer;		//������� ����� ���� ������� �������� ���� ������� �������

      //------------------------------------------------------------------------
      MaxServTime : integer;			//_ ������������ ����� �������� ��� ������ ������� ������
      CurrServTime: integer;			//_ ������� ����� �������� ��� ������ ������� ������

      PossibleTime : integer;  			//_ ��������� ���������� ����� ��������
      PossiblePercent : byte;	 		//_ ���������� ������� ������, ������� ����� ��������� ���������� �����
      CountOfExcQueries: integer;		//_ ���������� ������ � �������� ��������, ����������� ����������

      DistOfServerDelay: DistDelayType; //_ ������������ �������� �� �������
      HopDelay2: int64;                 //_ ��� ������������ - ������ ��������

      PositionInQueue: byte;			//_ ��������� ������ � �������

   public
      procedure SetNewState( mNewState : FrameStateType );
      constructor Create( mReqSize : integer;
                          mReqsNumber : integer;
                          mAnsSize : integer;
                          mAnssNumber : integer;
                          mCategory : integer;
                          mCycleTime : int64  );
   end;

   function IntToDistr(OrdValue: byte): DistDelayType;

implementation

uses math, mnetwork;

//=============================================================================
// Convert numder to value 
//=============================================================================
function IntToDistr(OrdValue: byte): DistDelayType;
begin
	case OrdValue of
    	0:	Result:=Constant;
        //1: Result:=Uniform;
	    1:	Result:=Exponential;
    end;
end;


constructor NetJob.Create( mReqSize : integer;
                           mReqsNumber : integer;
                           mAnsSize : integer;
                           mAnssNumber : integer;
                           mCategory : integer;
                           mCycleTime : int64  );
begin
   inherited Create();

   ReqSize := mReqSize;
   ReqsNumber := mReqsNumber;
   AnsSize := mAnsSize;
   AnssNumber := mAnssNumber;
   Category := mCategory;
   CycleTime := mCycleTime;

   StatTriesCount := 0;
   StatSuccCount := 0;

   TactsSpentInCycle := 0;

   PositionInQueue := 0;
end;

function Exp2( Arg : word ) : word;
var
  i   : byte;
  Res : word;
begin
  Res := 1;
  for i:=0 to Arg do
    Res := Res shl 1;
  Exp2 := Res;
end;

procedure NetJob.SetNewState( mNewState : FrameStateType );

begin
   case mNewState of

       StNetNode:
       begin
          TactsLeft := Round( HopDelays[CurrHopIndx] / CurrDomain.TicsPerTact);
          //���� ������, �� ��������� �������������
          {if CurrHopIndx = Length(Hops) - 1 then
                case DistOfServerDelay of
                    // ����������
                    Constant:
                    TactsLeft:=TactsLeft;

                    // ����������� �������������
                    Uniform:
                    TactsLeft:=Round( TactsLeft+Random*(HopDelay2-TactsLeft));

                    // ����������������
                    Exponential:
                    TactsLeft := Round(-TactsLeft * ln(1 - Random));
                end
          else
          // ��� ��� �� ������ - ����������������}
          TactsLeft := Round(-TactsLeft * ln(1 - Random));

          StatTriesCount := 0;
          Inc(TactsSpentInCycle, TactsLeft);
       end;

       StCanCollide:
       begin
//��� �������� ������� �� ����� ������������
          TactsLeft := CurrDomain.FrameMinLength;
          Inc(TactsSpentInCycle, TactsLeft);
       end;

       StTransmission:
       begin
//��� �������� ������� �� ����� ������
          if (ReqsLeft > 0) then
          		//-------------------------------------------------------------
          		case DistOfServerDelay of
                    // ����������
                    Constant:
                    TactsLeft:= ReqSize - CurrDomain.FrameMinLength;

                    // ����������� �������������
                    //Uniform:
                    //begin
                    //TactsLeft:= ReqSize - CurrDomain.FrameMinLength;
                    //TactsLeft:= Round( TactsLeft+Random*(HopDelay2-TactsLeft));
                    //end;

                    // ����������������
                    Exponential:
                    begin
                    TactsLeft:= ReqSize - CurrDomain.FrameMinLength;
                    TactsLeft := Round(-TactsLeft * ln(1 - Random));
                    end;
                end
                //-------------------------------------------------------------

             //TactsLeft := ReqSize - CurrDomain.FrameMinLength
          else
             TactsLeft := AnsSize - CurrDomain.FrameMinLength;

          Inc(TactsSpentInCycle, TactsLeft);
       end;

       StPostWait:
//��� �������� ��������� � ���������� ���������� Ethernet
       begin
          TactsLeft := Round( 9600 / Speeder / CurrDomain.TicsPerTact); //9.6 �����������
          Inc(TactsSpentInCycle, TactsLeft);
       end;

//���� ����� �������� ������ ��������� ������ ������� �����, ���������...
       StWaitForCycle:
       begin
          TactsLeft := Max(Round(CycleTime / CurrDomain.TicsPerTact) - TactsSpentInCycle, 1);
          TactsSpentInCycle := 0;
       end;

       StRandomWait:
       begin
          Inc( StatTriesCount );
          //�������� ���������������� ��������� �������� ��������
          if StatTriesCount > 9 then
             TactsLeft := Round( Random( Exp2( 10 )) * 51200 / Speeder / CurrDomain.TicsPerTact )
          else
             TactsLeft := Round( Random( Exp2( StatTriesCount )) * 51200 / Speeder / CurrDomain.TicsPerTact );

          Inc(TactsSpentInCycle, TactsLeft);
       end;

//������ ���� ����� ����������� �� ���������,
       StWaitForFree,
//��� ������� ����������� �� ���������
       StInBuffer:
       begin
          TactsLeft := 1;
          Inc(TactsSpentInCycle, TactsLeft);
       end;
   end;

   FrameState := mNewState;
end;

end.
