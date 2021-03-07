// ********************************************************************
//  scat_in.pas
//
//  ������������ ������� ������ ��� ����.���
//  ���� ����� ��� ��������� � �������� ���������:
//  FindRoute()			- ����� �������� ������
//  MakeAllSegChanID()  - �������� ��������� ������
//
// ********************************************************************

unit scat_in;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, orlan, Grids, ComCtrls;

type
  TScatForm = class(TForm)
    StringGridAnal: TStringGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet6: TTabSheet;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    StringGridImit: TStringGrid;
    StringGridAnalAll: TStringGrid;
    StringGridImitAll: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MakeAllSegChanID();
    procedure MakeAllSwitchSegID( Node: TOrlan );
    procedure MakeAllHubSegID( Node: TOrlan );
    procedure MakeAllAPSegID(Node: TOrlan);
    function PresentInArrOfVisitNodes( NodeID : integer): boolean;
    function AllPortsAreNotNumbered  ( Node : Torlan): boolean;
    procedure RunScat( nStep : Integer );
    procedure PackRoute( size : integer );
    function ReplacePoints(Data: string):string;
    function ChanIDToPortNum(ChanID, NodeID: integer): integer;
    function PortNumToChanID(Num, NodeID: integer): integer;
    function GetSegID(Node1,Node2: integer): integer;
    function PresentInRoute(ID: integer; Type_: byte): boolean;
    procedure Make_ID(ID1,ID2,ID:integer);
    procedure ResizeResultGrids();
    procedure FindRoute(Node1: integer; // ������ ����
                        Node2: integer; // ��������� ����
                        CurNode: integer; // ������� ����
                        CurPort: integer; // ���� � ������� ����
                        RequestNumb: integer // ����� ������
                        );
  end;

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

var
  ScatForm: TScatForm;
  Route: TList;
  Route_Cur:TList;
  Route_Element: Route_Type;
  Min_S:	integer;
  ModelResult: TmemoryStream;
  MaxSegID: integer;
  ArrOfVisitNodes: array of integer;
implementation

uses math, main, wait, connect, ex_anal, switch, JobsPack;

{$R *.DFM}

procedure TScatForm.FormCreate(Sender: TObject);
begin
 Route:=TList.Create;

 ScatForm.Width:=MainForm.Width-50;
 ScatForm.Height:=MainForm.Height-50;
 ScatForm.Left:=Trunc((Screen.Width-ScatForm.Width)/2);
 ScatForm.Top:=Trunc((Screen.Height-ScatForm.Height)/2);
 ScatForm.PageControl1.Height:=(ScatForm.ClientHeight-16);
 //RichEdit1.Align:=alClient;
 //RichEdit2.Align:=alClient;
end;

//=====================================================
// ���������� ��� �������� ������ ���� ����� ������
// ��������� � ������� ��� �����������
// TODO: ��������� �������� ��� ������������ ����
//=====================================================
procedure TScatForm.MakeAllSegChanID();
	var
	PortEl  : Port_Element;
    El, El2 : TOrLan;
    i, j, k : integer;
    HasSwitches: boolean;
    HasAPs: boolean;
    begin
	Segments.Free;
	Segments:=TStringList.Create;

	// �������������� �������� ��������
	for i:=0 to Nodes.Count-1 do
		begin
		El := TOrLAN(Nodes[i]);
		for j:=0 to El.Ports.Count-1 do
			begin
		    Port_Element(El.Ports[j]).ChannalID:=0;
			Port_Element(El.Ports[j]).SegmentID:=0;
			end;
		end;

    // ������ �������� ����������� � ����� �������?
    HasSwitches:=false;
    HasAPs:=false;
    for i:=0 to Nodes.Count-1 do
    begin
        if TOrlan(Nodes[i]).NodeType='KOMM' then
        begin
        HasSwitches:=true;
        break;
        end;

        if TOrlan(Nodes[i]).NodeType='AP' then
        begin
        HasAPs:=true;
        break;
        end;
    end;
    // ��������� ��������
   	MaxSegID:=0;

    // ���� ���������� ������
    if ((HasSwitches=true) or (HasAPs=true)) then
        begin
        // ��������� ��������������
        ////////////////////////////////////////////////////////////////////////
        for i:=0 to Nodes.Count-1 do
            begin
            El:=TOrlan(Nodes[i]);
            if El.NodeType='KONC' then
                if AllPortsAreNotNumbered(El)=true then
                    begin
                    // ������� ��������� ������������ � ������ ���������� �����
                    SetLength(ArrOfVisitNodes,1);
                    ArrOfVisitNodes[0]:=El.NodeID;

                    // ������� ����������� ��������� ��������� ���������
                    Inc(MaxSegID);
                    MakeAllHubSegID(El);
                    end;
            end;

        // ��������� ������������
        ////////////////////////////////////////////////////////////////////////
        for i:=0 to Nodes.Count-1 do
            begin
            El:=TOrlan(Nodes[i]);
            if El.NodeType='KOMM' then
                    begin
                    // ������� ��������� ���������� � ������ ���������� �����
                    SetLength(ArrOfVisitNodes,1);
                    ArrOfVisitNodes[0]:=El.NodeID;

                    // ������� ����������� ��������� ��������� ���������
                    MakeAllSwitchSegID(El);
                    end;
            end;

        // ��������� ����� �������
        ////////////////////////////////////////////////////////////////////////
        for i:=0 to Nodes.Count-1 do
            begin
            El:=TOrlan(Nodes[i]);
            if El.NodeType='AP' then
                    begin
                    // ������� ��������� ����� ������� � ������ ���������� �����
                    SetLength(ArrOfVisitNodes,1);
                    ArrOfVisitNodes[0]:=El.NodeID;

                    // ������� ����������� ��������� ��������� ���������
                    MakeAllAPSegID(El);
                    end;
            end;
        end
    else
        // ���� ���������� �� ������, �� ������ ����������� ���� �����
        // ������ ���� �������, ������ 1
        begin
        for i:=0 to Nodes.Count-1 do
            begin
            El:=TOrlan(Nodes[i]);
            for j:=0 to El.Ports.Count-1 do
                begin
                PortEl:=Port_Element(El.Ports[j]);
                if ((PortEl.IsUsed=True)  and
                    (PortEl.SegmentID=0)) then
                    begin
                    MaxSegID:=1;
                    PortEl.SegmentID:=MaxSegID;
                    end;
                end;
            end;
        Segments.Add(PortEl.PortType);
        end;

    // ��� ������� ����� ������� ���� ���������� ���� ����������
    // ����� ���������� - �hannalID. ��� ����� ����������� �����
    // ����� ����� ���������� ChannalID
	k:=0;
	for i:=0 to Nodes.Count-1 do
	begin
		El := TOrLAN(Nodes[i]);
		for j:=0 to El.Ports.Count-1 do
			begin
			PortEl := Port_Element(El.Ports[j]);
			if (PortEl.ChannalID = 0) and (PortEl.IsUsed=True) then
				begin
				k:=k+1;
				PortEl.ChannalID := k;
                // ���������� ��� ����� ������������ � ������� ����� �� ChannalID
				Make_ID(El.NodeID, PortEl.ID, k);
				end;
			end;
    end;

	if MaxSegID = 0 then
		raise ScatError.Create('� ���� �� ������ �� ���� �������.');
end;

//=====================================================
// ����������� ������ �������� ��� ���� ����� ������
//=====================================================
procedure TScatForm.MakeAllHubSegID(Node: TOrlan);
var
    Node1: TOrlan;
    PortEl : Port_Element;
    i, j : integer;

begin
    // ������� ������� � ������
    PortEl:=Port_Element(Node.Ports[0]);
    Segments.Add(PortEl.PortType);

    for i:=0 to Node.Ports.Count-1 do
        begin
        // ������� ������� ����
        PortEl:=Port_Element(Node.Ports[i]);

        // ���� �� �� ������������ - ���������
        if PortEl.IsUsed=false then continue;

        // ���� �� ������������ - ���������
        if PortEl.SegmentID<>0 then continue;

        // �������� ����� ����� ��������
        PortEl.SegmentID:=MaxSegID;

        // ID ���� -> ����
        Node1:=FormConnect.IDToNode(PortEl.ID);

        // ��������� ����� ���� ����� ��������
        for j:=0 to Node1.Ports.Count-1 do
            if Port_Element(Node1.Ports[j]).ID=Node.NodeID then
            Port_Element(Node1.Ports[j]).SegmentID:=MaxSegID;

        // ���� ���� ��� �������������, �� ���������� ��� ..
        if ((PresentInArrOfVisitNodes(Node1.NodeID)=true) or
            (Node1.NodeType<>'KONC')) then continue;

        // .. ����� ��������� ��� � ������ ���������� ����� � ..
        SetLength(ArrOfVisitNodes,(Length(ArrOfVisitNodes)+1));
        ArrOfVisitNodes[Length(ArrOfVisitNodes)-1]:=Node1.NodeID;

        // .. ��������� ���������� ���������
        MakeAllHubSegID(Node1);
        end;
end;

//=====================================================
// ����������� ������ �������� ��� ���� ����� ������
//=====================================================
procedure TScatForm.MakeAllSwitchSegID(Node: TOrlan);
var
    Node1: TOrlan;
    PortEl : Port_Element;
    i, j : integer;

begin
    for i:=0 to Node.Ports.Count-1 do
        begin
        // ������� ������� ����
        PortEl:=Port_Element(Node.Ports[i]);

        // ���� �� �� ������������ - ���������
        if PortEl.IsUsed=false then continue;

        // ���� �� ������������ - ���������
        if PortEl.SegmentID<>0 then continue;

        //���� ����� �������, ���������
        if Node.NodeType='AP' then continue;

        // ���� ���� - ����������, �� �������� ���������� ���������
        if Node.NodeType='KOMM' then inc(MaxSegID);

        // �������� ����� ����� �������� � ������� ��� ����� � ������ ���������
        PortEl.SegmentID:=MaxSegID;
        Segments.Add(PortEl.PortType);

        // ID ���� -> ����
        Node1:=FormConnect.IDToNode(PortEl.ID);

        // ��������� ����� ���� ����� ��������
        for j:=0 to Node1.Ports.Count-1 do
            if Port_Element(Node1.Ports[j]).ID=Node.NodeID then
            Port_Element(Node1.Ports[j]).SegmentID:=MaxSegID;

        // ���� ���� ��� �������������, �� ���������� ��� ..
        if PresentInArrOfVisitNodes(Node1.NodeID)=true then continue;

        // .. ����� ��������� ��� � ������ ���������� ����� � ..
        SetLength(ArrOfVisitNodes,(Length(ArrOfVisitNodes)+1));
        ArrOfVisitNodes[Length(ArrOfVisitNodes)-1]:=Node1.NodeID;

        // .. ��������� ���������� ���������
        MakeAllSwitchSegID(Node1);
        end;
end;

//=====================================================
// ����������� ������ �������� ��� ���� ����� ������
//=====================================================
procedure TScatForm.MakeAllAPSegID(Node: TOrlan);
var
    Node1: TOrlan;
    PortEl : Port_Element;
    i, j : integer;

begin

    for i:=0 to Node.Ports.Count-1 do
        begin
        // ������� ������� ����
        PortEl:=Port_Element(Node.Ports[i]);

        // ���� �� �� ������������ - ���������
        if PortEl.IsUsed=false then continue;

        // ���� �� ������������ - ���������
        if PortEl.SegmentID<>0 then continue;

        if PortEl.PortType = '802.11' then continue;

        // ���� ���� - ����� ������� � ��������� ��������� �������, �� �������� ���������� ���������
        if ((Node.NodeType='AP') and (PortEl.PortType<>'802.11'))  then
        begin
         inc(MaxSegID);
         // �������� ����� ����� �������� � ������� ��� ����� � ������ ���������
         PortEl.SegmentID:=MaxSegID;
         Segments.Add(PortEl.PortType);
        end;

        // ID ���� -> ����
        Node1:=FormConnect.IDToNode(PortEl.ID);

        // ��������� ����� ���� ����� ��������
        for j:=0 to Node1.Ports.Count-1 do
            if Port_Element(Node1.Ports[j]).ID=Node.NodeID then
            Port_Element(Node1.Ports[j]).SegmentID:=MaxSegID;

        // ���� ���� ��� �������������, �� ���������� ��� ..
        if PresentInArrOfVisitNodes(Node1.NodeID)=true then continue;

        // .. ����� ��������� ��� � ������ ���������� ����� � ..
        SetLength(ArrOfVisitNodes,(Length(ArrOfVisitNodes)+1));
        ArrOfVisitNodes[Length(ArrOfVisitNodes)-1]:=Node1.NodeID;

        // .. ��������� ���������� ���������
        MakeAllAPSegID(Node1);
        end;

    if Node.NodeType='AP' then
    begin
      inc(MaxSegID);
      Segments.Add('802.11');
    end;

    for i:=0 to Node.Ports.Count-1 do
        begin
        // ������� ������� ����
        PortEl:=Port_Element(Node.Ports[i]);

        // ���� �� �� ������������ - ���������
        if PortEl.IsUsed=false then continue;

        // ���� �� ������������ - ���������
        if PortEl.SegmentID<>0 then continue;

        if PortEl.PortType <> '802.11' then continue;

        // ID ���� -> ����
        Node1:=FormConnect.IDToNode(PortEl.ID);

        // ��������� ����� ���� ����� ��������
        for j:=0 to Node1.Ports.Count-1 do
            if Port_Element(Node1.Ports[j]).ID=Node.NodeID then
            Port_Element(Node1.Ports[j]).SegmentID:=MaxSegID;

        // ���� ���� ��� �������������, �� ���������� ��� ..
        if PresentInArrOfVisitNodes(Node1.NodeID)=true then continue;

        // .. ����� ��������� ��� � ������ ���������� ����� � ..
        SetLength(ArrOfVisitNodes,(Length(ArrOfVisitNodes)+1));
        ArrOfVisitNodes[Length(ArrOfVisitNodes)-1]:=Node1.NodeID;

        // .. ��������� ���������� ���������
        MakeAllAPSegID(Node1);
        end;
end;

//=====================================================
// ���� �� � ������� ���������� ����� ���� � NodeID
// ���� = true, ��� = false
//=====================================================
function TScatForm.PresentInArrOfVisitNodes( NodeID : integer): boolean;
var
    i:integer;

begin
    Result:= false;
    for i:=0 to Length(ArrOfVisitNodes)-1 do
        if ArrOfVisitNodes[i]=NodeID then
            begin
            Result:=true;
            break;
            end;
end;

//=====================================================
// ����������� �� ������ ������� ���� �������� SegmentID
//=====================================================
function TScatForm.AllPortsAreNotNumbered (Node: Torlan): boolean;
var i: integer;
begin
    Result:=True;
    for i:=0 to Node.Ports.Count-1 do
        begin
        if Port_Element(Node.Ports[i]).SegmentID<>0 then
            begin
            Result:=false;
            break;
            end;
        end;
end;

//=====================================================
procedure TScatForm.RunScat( nStep : Integer );
var i,j,k,L,x,tmp: integer;

    s,s1: string;
    tsi: TStartupInfo;
    tpi: TProcessInformation;

    f,fl:boolean;
    Scat_K:integer;
    Scat_M:integer;
    nBeg : integer;
    Nodes_Names: TStringList;
    Wait_, CycleTime_, z: real;
    Double_: Double;
    Time_0: TDateTime;
    Time_1, Time_2: double;

    PortEl : Port_Element;
    PortEl2 : Port_Element;
    El : TOrLan;
    El2 : TOrLan;
    ModelEl : Model_Element;
begin
 FormWait.Gauge1.Progress:=0;
 FormWait.LabelMessage.Caption:='���� �������� ������...';
 FormWait.Show;
 Application.ProcessMessages;

 Nodes_Names:=TStringList.Create;

//������������ �������� ����� ��� scat
 ScatForm.RichEdit1.Clear;
 RichEdit1.Lines.Add('scat');
 RichEdit1.Lines.Add('{');

 // ���� �� ���� ����� � ������������ ���� ������� ������
 /////////////////////////////////////////////////////////
 j:=0;
 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='WS' then
     j:=j + TOrLAN(Nodes[i]).WSParameters.RequestClass.Count;

 RichEdit1.Lines.Add('  K = '+IntToStr(j)+';');
//K - ����� ������� ������
 Scat_K:=j;

 // � - ����� �������� � ������
 // ������� ����� ��������� �� ���� ����� �� ����������� ������������� ?!
 // ���� �� ���������
 /////////////////////////////////////////////////////////
 Scat_M:=0;
 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType<>'KONC' then
     Inc(Scat_M);

 Scat_M := Scat_M + MaxSegID + 1;

 RichEdit1.Lines.Add('  M = '+IntToStr(Scat_M)+';');

 StringGridAnal.RowCount:=Scat_M;
 //������������� ������� ����� �������������� ��� ������ ID ����, ��������� ������� - ��� ���� (�������/���������)
 StringGridAnal.ColCount:=Scat_K+2;

 // ������ ������ ��������������� ��������
 s:='';
 for i:=1 to Scat_K do
   s := s + '1, ';

 s := Copy(s,1,Length(s)-2);
 RichEdit1.Lines.Add('  N = [ '+s+' ];');

 FormWait.Gauge1.MaxValue:=Nodes.Count;
 FormWait.Gauge1.Progress:=0;

 { ��� ���� � ������ }
 //�������� ��� ������� ���� ��� ��� - fixed/delay/....
 //�����-���� �� ����������� ������������� ������� �� ������ ��������
 for i:=0 to Nodes.Count-1 do
 begin
   FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
   Application.ProcessMessages;

   if TOrLAN(Nodes[i]).NodeType='WS' then
     s:=Setup_.WS;

   if TOrLAN(Nodes[i]).NodeType='SERV' then
     s:=Setup_.Serv;

   if TOrLAN(Nodes[i]).NodeType='KOMM' then
     s:=Setup_.Komm;

   if TOrLAN(Nodes[i]).NodeType<>'KONC' then
   begin
     if i = 0 then
       RichEdit1.Lines.Add('  Q = [ '+s+',')
     else
       RichEdit1.Lines.Add('        '+s+',');

     Nodes_Names.Add(s);
     StringGridAnal.Cells[StringGridAnal.ColCount-2,i] := IntToStr(TOrLAN(Nodes[i]).NodeID);
     StringGridAnal.Cells[StringGridAnal.ColCount-1,i] := '0';
   end;
 end;

 // ������� ��� ����������
 FormWait.Gauge1.MaxValue:=Scat_M;
 FormWait.Gauge1.Progress:=0;
 for i := Scat_M - MaxSegID - 1 to Scat_M - 2 do
 begin
   FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
   Application.ProcessMessages;

   StringGridAnal.Cells[StringGridAnal.ColCount-2,i]:=IntToStr(i-(Scat_M-MaxSegID-2));
   StringGridAnal.Cells[StringGridAnal.ColCount-1,i]:='1';
 end;

 FormWait.Gauge1.MaxValue:=MaxSegID;
 FormWait.Gauge1.Progress:=0;

 { ��� �������� }
 //��� ������� �������� �������� ��� ��� - fixed/delay/....
 for i:=1 to MaxSegID do
 begin
   FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
   Application.ProcessMessages;

   RichEdit1.Lines.Add('        '+Setup_.MC+',');
   Nodes_Names.Add(Setup_.MC);
 end;

 { ��������� ������� }
 //�������� ��� ������� ��������...
 RichEdit1.Lines.Add('        '+Setup_.Wait+' ];');
 Nodes_Names.Add(Setup_.Wait);

 FormWait.Gauge1.MaxValue:=Scat_M;
 FormWait.Gauge1.Progress:=0;

 { ��������� �������� B - ������������ �������� ��� ������� ����}
 s:='  B = [ ';
 for i:=0 to Scat_M-1 do
 begin
   FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
   Application.ProcessMessages;

   //���� ���� - 'delay', �� �������� ��� ���� = ����� ������� ������
   k:=1;
   if Nodes_Names[i]='delay' then
   begin
     for j:=0 to Scat_K-1 do
       k:=k+1;

     s:=s+IntToStr(k-1)+', ';
   end;

   if Nodes_Names[i]='load-dependent' then
     s:=s+'1, ';

   if Nodes_Names[i]='fixed-rate' then
     s:=s+'1, ';
 end;

 s:=Copy(s,1,Length(s)-2);
 RichEdit1.Lines.Add(s+' ];');

 FormWait.Gauge1.MaxValue:=Scat_M;
 FormWait.Gauge1.Progress:=0;

 // ��������� �������� CAP - ������� �����������
 for i:=0 to Scat_M-1 do
 begin
   FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
   Application.ProcessMessages;

   S:='';
   if Nodes_Names[i]='delay' then
   begin
     for j:=0 to Scat_K-1 do
       s:=s+IntToStr(j+1)+', ';
   end;

   if Nodes_Names[i]='fixed-rate' then
   begin
     for j:=0 to Scat_K-1 do
       s:=s+'1, ';
   end;

   if Nodes_Names[i]='load-dependent' then
   begin
     for j:=0 to Scat_K-1 do
       s:=s+'1, ';
   end;

   if i=0 then
     RichEdit1.Lines.Add('  CAP = [ '+s)
   else
   begin
     if i=Scat_M-1 then
       RichEdit1.Lines.Add('          '+Copy(s,1,Length(s)-2)+' ];')
     else
       RichEdit1.Lines.Add('          '+s);
   end;
 end;


 //�������� ��� ������ � StringGridAnal (0.0000000001)
 FormWait.Gauge1.MaxValue:=Scat_M*Scat_K;
 FormWait.Gauge1.Progress:=0;

 for i:=0 to Scat_K-1 do
   for j:=0 to Scat_M-1 do
   begin
     FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
     Application.ProcessMessages;
     StringGridAnal.Cells[i,j]:=FloatToStrF(0.0000000001,ffFixed,10,10);
   end;

 FormWait.Gauge1.MaxValue:=Number_of_Workstations;
 FormWait.Gauge1.Progress:=0;

 //L - ����� �������� ������� � ������ ������.
 L:=0;
 //������� �������� s - ������������� ������� ���������� � ������ ����.
 for i:=0 to Nodes.Count-1 do
 begin
   FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
   Application.ProcessMessages;

   if TOrLAN(Nodes[i]).NodeType='WS' then
     for j:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
     begin

       Route.Clear;
       ModelEl := Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]);

       try
         FormWait.LabelMessage.Caption:='������ ���� ���  "'+TOrLAN(Nodes[i]).NodeName+'"';
         Application.ProcessMessages;
         FindRoute(
           TOrLAN(Nodes[i]).NodeID,
           ModelEl.ServID_,
           TOrLAN(Nodes[i]).NodeID,
           0,
           j
           );
       except
         raise ScatError.Create('�� ������ ���� ��� ������ ��� ������������� �������������.' + #13 + #10 +
               '������� ������: "' + TOrLAN(Nodes[i]).NodeName + '" - "' + FormConnect.IDToName( ModelEl.ServID_ ) + '".');
         Exit;
       end;

       PackRoute(ModelEl.Size_);

       Wait_:=0;
       for k:=0 to Route.Count-1 do
         Wait_:=Wait_ + Route_Type(Route[k]).s;

       //���� ����� �������� ������ ������ ������� �����, ��������� ��� ��
       //������������� ������� ��������. �� ����, ������ ��� �������� ����� ��������� ������.
       CycleTime_ := Max(ModelEl.TimeCycle, Wait_) + 0.0000000001;
       ModelEl.AdjustedTimeCycle := CycleTime_;

       for K:=0 to StringGridAnal.RowCount-1 do
       begin
         for x:=0 to Route.Count-1 do
         begin
           if Route_Type(Route[x]).type_=0 then
           begin
             //Node
             if (IntToStr(Route_Type(Route[x]).ID)=StringGridAnal.Cells[StringGridAnal.ColCount-2,K]) and
               (IntToStr(Route_Type(Route[x]).type_)=StringGridAnal.Cells[StringGridAnal.ColCount-1,K]) then
             begin
               if (Route_Type(Route[x]).s<0.000001)
                  then
                  begin
//                  Show;
                  tmp:=0;
                  end;
               StringGridAnal.Cells[L,K]:=FloatToStrF(Route_Type(Route[x]).s {/ CycleTime_} + 0.0000000001, ffFixed,10,10);
             end;
           end
         else
           //Channel
           if (IntToStr(Route_Type(Route[x]).SegID)=StringGridAnal.Cells[StringGridAnal.ColCount-2,K]) and
             (IntToStr(Route_Type(Route[x]).type_)=StringGridAnal.Cells[StringGridAnal.ColCount-1,K]) then
           begin
             StringGridAnal.Cells[L,K]:=FloatToStrF( Route_Type(Route[x]).s {/ CycleTime_} + 0.0000000001, ffFixed,10,10);
           end;
         end;
       end;

       // ������� ��������
       StringGridAnal.Cells[L,StringGridAnal.RowCount-1]:=FloatToStrF((CycleTime_ - Wait_){/ CycleTime_} + 0.0000000001, ffFixed,10,10);
       Inc(L);
     end;
 end;

 FormWait.LabelMessage.Caption:='��������� ���� ������� ����������...';
 FormWait.Gauge1.MaxValue:=StringGridAnal.RowCount*StringGridAnal.ColCount;
 FormWait.Gauge1.Progress:=0;
 Application.ProcessMessages;

 for i:=0 to StringGridAnal.RowCount-1 do
 begin
   s:='';
   for j:=0 to StringGridAnal.ColCount-3 do
   begin
     FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
     Application.ProcessMessages;

     s:=s+ReplacePoints(StringGridAnal.Cells[j,i])+', ';
   end;

   if i=0 then
     RichEdit1.Lines.Add('  s = [ '+s)
   else
   begin
     if i=StringGridAnal.RowCount-1 then
       RichEdit1.Lines.Add('        '+Copy(s,1,Length(s)-2)+' ];')
     else
       RichEdit1.Lines.Add('        '+s);
   end;
 end;

 FormWait.Gauge1.MaxValue:=StringGridAnal.RowCount*StringGridAnal.ColCount;
 FormWait.Gauge1.Progress:=0;
 //��������� ����������� ���������� � ������ ����
 for i:=0 to StringGridAnal.RowCount-1 do
 begin
   s:='';
   for j:=0 to StringGridAnal.ColCount-3 do
   begin
     FormWait.Gauge1.Progress:=FormWait.Gauge1.Progress+1;
     Application.ProcessMessages;

     s:=s+'1.0, ';
   end;
   if i=0 then
     RichEdit1.Lines.Add('  v = [ '+s)
   else
   begin
     if i=StringGridAnal.RowCount-1 then
       RichEdit1.Lines.Add('        '+Copy(s,1,Length(s)-2)+' ];')
     else
       RichEdit1.Lines.Add('        '+s);
   end;
 end;

 RichEdit1.Lines.Add('}');

 try
   ScatForm.RichEdit1.Lines.SaveToFile(Project_Path + Project_Name + '_' + IntToStr(nStep) + '.sci');
 except
   on E:Exception do
   begin
     MessageDlg('������ ������ �������� ����� Scat. ' + E.Message, mtError, [mbOk], 0);
     FormWait.Hide;
     exit;
   end;
 end;

 FormWait.LabelMessage.Caption:='���� ������������� �������������...';
 Application.ProcessMessages;

 GetDir(0,s); // 0 = Current drive
 s:='"'+s+'\scatwexe.exe" "' + Project_Path + Project_Name + '_' + IntToStr(nStep) + '.sci" "'+
    Project_Path + Project_Name + '_' + IntToStr(nStep) + '.sco" "' + Project_Path + Project_Name + '.bin"';

 Time_1:=Time;

 FillChar(TSI,SizeOf(TSI),0);
 tsi.wShowWindow:=SW_HIDE;
 tsi.dwFlags:=STARTF_USESHOWWINDOW;
 FormWait.Gauge1.Progress:=10;
 f:=CreateProcess(nil,PChar(s),nil,nil,false,NORMAL_PRIORITY_CLASS,nil,nil,tsi,tpi);

 if f=False then
 begin
   MessageDlg('��������� ������ ��� ������� ��������� �������������.'+
              '���������� � ������������',
              mtInformation,[mbOk],0);
   Nodes_Names.Free;
   Route.Free;
   Exit;
 end;
 WaitForSingleObject(tpi.hProcess,INFINITE);

 FormWait.Gauge1.Progress:=990;
 Time_2:=Time;
 MainForm.StatusBar1.Panels[4].Text:='����� ������������� (��:��:��) - '+TimeToStr(Time_2-Time_1);
 
 ScatForm.RichEdit2.Lines.LoadFromFile(Project_Path + Project_Name + '_' + IntToStr(nStep) + '.sco');

 ModelResult.Clear;
 ModelResult.LoadFromFile(Project_Path + Project_Name + '.bin');
 DeleteFile(Project_Path + Project_Name + '.bin');

 nBeg := 0;
 for i := 0 to nStep-1 do
    Inc( nBeg, JobsPerStep[i] );

 for i:=0 to StringGridAnalAll.RowCount-1 do
   for j:=nBeg to nBeg + JobsPerStep[nStep]-1 do
   begin
     ModelResult.Read(Double_,SizeOf(Double_));
     StringGridAnalAll.Cells[j,i]:=FloatToStr(Double_);
   end;

 l:=nBeg;
 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='WS' then
     for j:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
     begin
       for k:=Scat_M to Scat_M * 2-1 do
         begin
         CycleTime_ :=Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]).AdjustedTimeCycle;
         StringGridAnalAll.Cells[l,k]:=FloatToStr( {CycleTime_*} 1000 * StrToFloat(StringGridAnalAll.Cells[l,k]));
         end;
       Inc(l);
     end;

 for j:=nBeg to nBeg + JobsPerStep[nStep]-1 do
   for k:=Scat_M * 3 to (Scat_M * 4 - 1) do
   begin
     StringGridAnalAll.Cells[j,k]:=FloatToStr(100 * StrToFloat(StringGridAnalAll.Cells[j,k]));
   end;

 FormWait.Hide;
 Nodes_Names.Free;
end;

//=================================================
//��������� ChannalID ������ ID ��� ����� ���� ID2, ���������� � ����� ID1...
//=================================================
procedure TScatForm.Make_ID(ID1,ID2,ID:integer);
var i,j:integer;
begin
 for i:=0 to Nodes.Count-1 do
   for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
     if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID=ID1) and        //_ ��������
       (TOrLAN(Nodes[i]).NodeID=ID2) and                            //_ ��������
       (Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed=True) and    //_ ������������
       (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID=0) then   //_ �� �������
     begin
       Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID:=ID;
     end;
end;



//=============================================================================
//_ ��������:	����������� ��������� ������ ���� �� Node1 � Node2
//_ ��� ���� �� �������� ������ �������������
//_
//_ ���������:	CurNode - ������� ����; CurPort - ������� ����
//_ RequestNumb - ����� ������
//_
//_ ���������:	������ (TList) ����� � ������� ����� ������� ��������� ����
//_ �� Node1 � Node2
//=============================================================================
procedure TScatForm.FindRoute(Node1:integer;
                            Node2:integer;
                            CurNode: integer;
                            CurPort: integer;
                            RequestNumb: integer
                            );
var PortNum: integer;
    i:integer;
    CurEl, El1, El2 : TOrlan;
begin
 CurEl := TOrLAN(Nodes[FormConnect.IDToNum(CurNode)]);
 El1 := TOrLAN(Nodes[FormConnect.IDToNum(Node1)]);
 El2 := TOrLAN(Nodes[FormConnect.IDToNum(Node2)]);

 if (CurNode = Node2) then
 begin
   // ���� ����� �������� �������, ��
   new(Route_Element);
   Route_Element^.ID:=El2.NodeID;
   Route_Element^.type_:=0;
   Route_Element^.s:=Model_Element(El1.WSParameters.RequestClass[RequestNumb]).TimeServ;
   Route.Add(Route_Element);

	Exit;
 end
 else
 begin
   PortNum := -1;
   //_ ������� ������ ��������� ����, ������� ��� ���� � �� ���������� � ���� ..
   for i := CurPort to CurEl.Ports.Count-1  do
     if (PresentInRoute(Port_Element(CurEl.Ports[i]).ChannalID, 1) = False) and (Port_Element(CurEl.Ports[i]).IsUsed=True) then
     begin

	//.. ���� �����
       PortNum := i;
       break;
     end;
   if (PortNum <> -1) then
   begin
     // ����� �������� ������� ������� � ������ � Route
     //_ ������ �������� � ����� ������

     new(Route_Element);
     Route_Element^.ID:=CurEl.NodeID;
     Route_Element^.type_:=0;
     Route_Element^.Port:=PortNum;

     Route_Element^.s:=Model_Element(El1.WSParameters.RequestClass[RequestNumb]).TimeWS;
     Route.Add(Route_Element);

     new(Route_Element);
     Route_Element^.ID:=Port_Element(CurEl.Ports[PortNum]).ChannalID;
     Route_Element^.type_:=1;
     Route_Element^.SegID:=Port_Element(CurEl.Ports[PortNum]).SegmentID;
     // TODO: add wifi!!!
     //_ promised 12 bytes
     ///////////////////////////////////////////////////////////////////////////
     if Model_Element(El1.WSParameters.RequestClass[RequestNumb]).AnsSize_ = 0 then
       Route_Element^.s:=
         (Model_Element(El1.WSParameters.RequestClass[RequestNumb]).Size_+12) * 8 /
         Port_Element(CurEl.Ports[ PortNum ]).Speed / 1000000
     else
       Route_Element^.s:=
         ((Model_Element(El1.WSParameters.RequestClass[RequestNumb]).Size_+12) + Model_Element(El1.WSParameters.RequestClass[RequestNumb]).AnsSize_) * 8 {/ 2} /
         Port_Element(CurEl.Ports[ PortNum ]).Speed / 1000000;

     Route.Add(Route_Element);

     FindRoute(
       Node1,
       Node2,
       Port_Element(CurEl.Ports[PortNum]).ID,
       0,
       RequestNumb
      );
   end
   else
   begin
   	 // ��� ���� ��� �������� � ����� ����� � �����
     // ����� ������� 2 ��������� ���� �� Route
     // � ������� �-��� � ��������� ��������� �� ������
     Route.Delete(Route.Count-1);
     Route_Element:=Route[Route.Count-1];
     Route.Delete(Route.Count-1);

     FindRoute(
       Node1,
       Node2,
       Route_Element.ID,
       Route_Element.Port + 1,
       RequestNumb
      );
   end;
 end;
end;

//============================================================================
// ����� ���� ������ ���� NodeID ������� ����� ���� �����, ChannalID �������� = ID.
//============================================================================}
function TScatForm.ChanIDToPortNum(ChanID, NodeID: integer): integer;
var i,j:integer;
begin
 Result:=-1;
 for i:=0 to Nodes.Count-1 do
 begin
   for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
   begin
     if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID = ChanID) and
        (TOrLAN(Nodes[i]).NodeID = NodeID) and
        (Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed = True) then
        begin
           Result:=j;
           break;
        end;
   end;
 end;
end;

function TScatForm.PortNumToChanID(Num, NodeID: integer): integer;
var j:integer;
begin
 Result:=-1;
 for j:=0 to TOrLAN(Nodes[FormConnect.IdToNum(NodeID)]).Ports.Count-1 do
   if (j=Num) and (TOrLAN(Nodes[FormConnect.IdToNum(NodeID)]).NodeID=NodeID) then
     Result:=Port_Element(TOrLAN(Nodes[FormConnect.IdToNum(NodeID)]).Ports[j]).ChannalID;
end;

//============================================================================
// ���������, ���� �� � �������� ������� � �������� ID � �����.
// //_ � ������� � ������ ..?
//============================================================================

function TScatForm.PresentInRoute(ID: integer; Type_: byte): boolean;
var i:integer;
begin
 Result := False;
 for i:=0 to Route.Count-1 do
   if (Route_Type(Route[i]).ID=ID) and (Route_Type(Route[i]).type_=type_) then
   begin
     Result := True;
     break;
   end;
end;


//============================================================================
// ���������� SegmentID ����� Node1 � Node2.
// ��� -1, ���� �� ������.
//============================================================================
function TScatForm.GetSegID(Node1,Node2: integer): integer;
var i:integer;
        El1 : TOrlan;
begin
 Result:=-1;
 El1 := TOrLAN(Nodes[FormConnect.IDToNum(Node1)]);

 for i:=0 to El1.Ports.Count-1 do
   if (Port_Element(El1.Ports[i]).IsUsed = True) and (Port_Element(El1.Ports[i]).ID = Node2) then
   begin
     Result:=Port_Element(El1.Ports[i]).SegmentID;
     break;
   end;
end;


function TScatForm.ReplacePoints(Data: string):string;
var i:integer;
begin
 for i:=1 to Length(Data) do
  if Data[i]=',' then Data[i]:='.';
 Result:=Data;
end;

procedure TScatForm.FormDestroy(Sender: TObject);
begin
 Route.Free;
end;

procedure TScatForm.PackRoute(size: integer);
var i,j,k :integer;
	node: TOrlan;
    channalin, channalout: integer;
    switchtime: real;
    sendtime: real;
begin

	// ���� �� ���� ����� �������� ������
    ////////////////////////////////////////
	for i:=0 to Route.Count-1 do
    	begin
        // ���� ���� - �����, �� ����������
        /////////////////////////////////////////
        if Route_Type(Route[i]).type_=1 then
        	Continue;

    	Node:=TOrLAN(Nodes[FormConnect.IDToNum(Route_Type(Route[i]).ID)]);

        // ��� ����������� �������� ����� ��������
        // �� WS �� ����� ������������
        /////////////////////////////////////////
        if Node.NodeType='KOMM' then
        	begin
            channalin:=Route_Type(Route[i-1]).ID;
            channalout:=Route_Type(Route[i+1]).ID;
            switchtime:=FormSwTime.CountS(node.NodeID,channalin,channalout);
            sendtime:=size * 8 / node.kommparameters.int_bus / 1000000000;
            switchtime:=max(switchtime, sendtime);
            Route_Type(Route[i]).s:=switchtime;
            end;
        end;

 for i:=0 to Route.Count-1 do
   for j:=i to Route.Count-1 do
     if (Route[j]<>nil) and (Route[i]<>nil) then
       if (i<>j) and (Route_Type(Route[i]).type_=1) and (Route_Type(Route[j]).type_=1) and
         (Route_Type(Route[i]).SegID=Route_Type(Route[j]).SegID) then
         for k:=i to j-1 do
           Route[k]:=nil;

 Route.Pack;
end;

procedure TScatForm.ResizeResultGrids();
var i, j, nRows, nTotal : integer;
begin
    nRows:=0;
    for i:=0 to Nodes.Count-1 do
      if TOrLAN(Nodes[i]).NodeType<>'KONC' then
         Inc(nRows);
    nRows := nRows + MaxSegID + 1;

    nTotal := 0;
    for i := 0 to Steps-1 do
      Inc( nTotal, JobsPerStep[i] );

    //_ ���������� ����� = ���������� �����
    //_ ���������� �������� = ���������� �����
    //_ ��������� ��� ���������� 5 �����������, �� ���������� ����� *4=[0..4] (5 ���������)
    StringGridAnalAll.ColCount := nTotal;
    StringGridAnalAll.RowCount := nRows * 4;

    StringGridImitAll.ColCount := nTotal;
	//_ -1 ������ ��� �� ��������� ������������������ ��� ��������
    StringGridImitAll.RowCount := (nRows - 1) * 4;

    for i:=0 to StringGridAnalAll.RowCount-1 do
       for j:=0 to StringGridAnalAll.ColCount-1 do
          StringGridAnalAll.Cells[j,i] := '0';

    for i:=0 to StringGridImitAll.RowCount-1 do
       for j:=0 to StringGridImitAll.ColCount-1 do
          StringGridImitAll.Cells[j,i] := '0';
end;



end.
