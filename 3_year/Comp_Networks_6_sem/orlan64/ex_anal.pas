// ********************************************************************
//  ex_anal.pas
//
//  �������, ��(������) ��������...
// ********************************************************************

unit ex_anal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Buttons, ExtCtrls, ShellApi, OrLAN;

type
  TFormXA = class(TForm)
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel5: TPanel;
    Label10: TLabel;
    Panel8: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Loadings: array [0..1000] of real;
  public
{    procedure MakeSegID(NodeNum, PortNum: integer);}
    procedure Count_Load(Number1:integer;Type_:string;Load_:integer;
                         Number2:integer);
    procedure Load_Count(Number1:integer; // ����� ��
                         Load:integer; // �� ��������
                         Cost:integer; // ��������� �� �� ��
                         Min_Capasity:integer; // ���. ��������. �����������
                         Length:integer; // ����� ��������
                         Row:integer); // ������
    { Public declarations }
  end;

var
  FormXA: TFormXA;

implementation

uses main, wait, connect, report, scat_in, math;

{$R *.DFM}

procedure TFormXA.FormShow(Sender: TObject);
var i,j,z,k,y:integer;
    r,rr:real;
    f1,f2:real;
    s1,s2,s3:string;
    Wait_, CycleTime_: real;
    ModelEl : Model_Element;
begin

 FormWait.LabelMessage.Caption:='������������ ��������-������';
 FormWait.Show;
 Application.ProcessMessages;

 StringGrid1.RowCount:=0;
 StringGrid1.DefaultRowHeight:=1;

 try

 ScatForm.MakeAllSegChanID();

 for i:=0 to Nodes.Count-1 do
 begin
   if TOrLAN(Nodes[i]).NodeType='WS' then
     for j:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
     begin
       Route.Clear;
       ModelEl := Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]);

       try
         Application.ProcessMessages;
         ScatForm.FindRoute(
           TOrLAN(Nodes[i]).NodeID,
           ModelEl.ServID_,
           TOrLAN(Nodes[i]).NodeID,
           0,
           j
           );
       except
         raise ScatError.Create('�� ������ ���� ��� ������.' + #13 + #10 +
               '������� ������: "' + TOrLAN(Nodes[i]).NodeName + '" - "' + FormConnect.IDToName( ModelEl.ServID_ ) + '".');
         Exit;
       end;
       ScatForm.PackRoute(ModelEl.Size_);

       //_ ��� ������������ �������� ���������� ����������� ������
       //_ ��� ������� �������� ������ ����������� ����� ����������
       //_ ������ � ���� ����. �.�. ������������� ��� �������, �������� _���������_
       //_ ����� �������� ������, ������� ������� ��������� �� WS � �� �������..
       Wait_:=0;
       for k:=0 to Route.Count-1 do
         Wait_:=Wait_ + Route_Type(Route[k]).s;

       //_ .. ���� ��� ����� ������ ������� �����, �� ������� ����� �����:..
       //_ ������� ������� �� ������� ����������� � ������� �����..
       CycleTime_ := Max(ModelEl.TimeCycle, Wait_) + 0.0000000001;
       //_ � ���������� � AdjustedTimeCycle
       ModelEl.AdjustedTimeCycle := CycleTime_;
     end;
 end;

 StringGrid1.RowCount:=MaxSegID;
 for i:=0 to MaxSegID - 1 do
 begin
   K:=0;
   r:=0;
   rr:=0;
//   StringGrid1.RowCount:=StringGrid1.RowCount + 1;
   StringGrid1.Objects[0,i]:=TStringList.Create;
   StringGrid1.Objects[7,i]:=TStringList.Create;
   with StringGrid1.Objects[0,i] as TStringList do
     for j:=0 to Nodes.Count-1 do
     if TOrLAN(Nodes[j]).NodeType='WS' then
//       if TOrLAN(Nodes[j]).Tag - 1 = i then
//      if Port_Element(TOrLAN(Nodes[j]).Ports[z]).SegmentID = i then
       begin
         for z:=0 to TOrLAN(Nodes[j]).Ports.Count-1 do
//          if Port_Element(TOrLAN(Nodes[j]).Ports[z]).PortType=Segments[i] then
          if Port_Element(TOrLAN(Nodes[j]).Ports[z]).SegmentID = i + 1 then
          begin
           if TOrLAN(Nodes[FormConnect.IDToNum(Port_Element(TOrLAN(Nodes[j]).Ports[z]).ID)]).NodeType='WS'
           then
             r:=r + Port_Element(TOrLAN(Nodes[j]).Ports[z]).ChannalLength / 2
           else
             r:=r + Port_Element(TOrLAN(Nodes[j]).Ports[z]).ChannalLength;

           if Port_Element(TOrLAN(Nodes[j]).Ports[z]).ChannalLength > 100 then
            begin
              TStringList(StringGrid1.Objects[7,i]).Add(TOrLAN(Nodes[j]).NodeName);
              StringGrid1.Cells[7,i]:='����������';
            end;

           StringGrid1.Cells[4,i]:=FloatTOStrF(Port_Element(TOrLAN(Nodes[j]).Ports[z]).Speed, ffFixed, 5, 3);
           StringGrid1.Cells[8,i]:='������������';
//
        for y:=0 to TOrLAN(Nodes[j]).WSParameters.RequestClass.Count-1 do
         rr:=rr+
           Model_Element(TOrLAN(Nodes[j]).WSParameters.RequestClass[y]).Size_ * 8 /
           Model_Element(TOrLAN(Nodes[j]).WSParameters.RequestClass[y]).AdjustedTimeCycle / 1000000;

        k := k + ReportForm.Cost_Count(j);
        StringGrid1.Cells[3,i]:=Segments[i];
        Add(TOrLAN(Nodes[j]).NodeName);
//
          end;

       end;
   StringGrid1.Cells[1,i]:=IntToStr(k);
   StringGrid1.Cells[2,i]:=IntToStr(Round( r ));
   StringGrid1.Cells[5,i]:=FloatToStrF(rr, ffFixed, 5, 3);
 end;


 for k:=0 to Nodes.Count-1 do // ������ KOMM
 begin
   if TOrLAN(Nodes[k]).NodeType='KOMM' then
   begin
    Loadings[k] := 0;
    StringGrid1.RowCount:=StringGrid1.RowCount + 1;
    StringGrid1.Objects[0,StringGrid1.RowCount - 1]:=TStringList.Create;
    for i:=0 to Nodes.Count-1 do
     if TOrLAN(Nodes[i]).NodeType='WS' then
      for j:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
       begin
        Route.Clear;
        ScatForm.FindRoute(
          TOrLAN(Nodes[i]).NodeID,
          Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]).ServID_,
          TOrLAN(Nodes[i]).NodeID,
          0,
          j);
        ScatForm.PackRoute(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]).Size_);

       for z:=0 to Route.Count-1 do
         if (Route_Type(Route[z]).ID = TOrLAN(Nodes[k]).NodeID) and
            (Route_Type(Route[z]).type_ = 0) then
            begin
              Loadings[k] := Loadings[k] +
                Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]).Size_ * 8 /
                Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[j]).AdjustedTimeCycle / 1000000;
              StringGrid1.Cells[8,StringGrid1.RowCount-2]:='����������';
            end;
       end;
    with StringGrid1.Objects[0,StringGrid1.RowCount-1] as TStringList do
      Add(TOrLAN(Nodes[k]).NodeName);
    StringGrid1.Cells[4,StringGrid1.RowCount-1]:=FloatToStrF(TOrLAN(Nodes[k]).KommParameters.Int_Bus * 1000, ffFixed, 5, 3);
    StringGrid1.Cells[5,StringGrid1.RowCount-1]:=FloatToStrF(Loadings[k], ffFixed, 5, 3);
    StringGrid1.Cells[1,StringGrid1.RowCount-1]:=IntToStr(TOrLAN(Nodes[k]).KommParameters.Cost);
    StringGrid1.Cells[2,StringGrid1.RowCount-1]:='����';
    StringGrid1.Cells[8,StringGrid1.RowCount-1]:='����������';
   end;

   if TOrLAN(Nodes[k]).NodeType='AP' then
   begin
      StringGrid1.RowCount:=StringGrid1.RowCount + 1;
      StringGrid1.Objects[0,StringGrid1.RowCount - 1]:=TStringList.Create;

      with StringGrid1.Objects[0,StringGrid1.RowCount-1] as TStringList do
      Add(TOrLAN(Nodes[k]).NodeName);
      StringGrid1.Cells[4,StringGrid1.RowCount-1]:=FloatToStrF(TOrLAN(Nodes[k]).AP_Parameters.Int_Bus * 1000, ffFixed, 5, 3);
      //StringGrid1.Cells[5,StringGrid1.RowCount-1]:=FloatToStrF(Loadings[k], ffFixed, 5, 3);
      StringGrid1.Cells[1,StringGrid1.RowCount-1]:=IntToStr(TOrLAN(Nodes[k]).AP_Parameters.Cost);
      StringGrid1.Cells[2,StringGrid1.RowCount-1]:='����';
      StringGrid1.Cells[8,StringGrid1.RowCount-1]:='����� �������';
   end;
  end;
  for i:=0 to StringGrid1.RowCount-1 do
  begin
   s1:=StringGrid1.Cells[5,i];
   s2:=StringGrid1.Cells[4,i];
   s3:=StringGrid1.Cells[8,i];
   if ( (Length(s1)>0) and (Length(s2)>0) ) then
      begin
       f1:=StrToFloat(s1);
       f2:=StrToFloat(s2);
       if (s3 = '����������') then
        if (f1/f2>0.7) and (f1/f2<0.9) then
          begin
            StringGrid1.Objects[6,i]:=TStringList.Create;
            TStringList(StringGrid1.Objects[6,i]).Add('��������');
            TStringList(StringGrid1.Objects[6,i]).Add('�����������');
            TStringList(StringGrid1.Objects[6,i]).Add('����� 70%');
            StringGrid1.Cells[6,i]:='��������';
          end
        else if f1/f2>=0.9 then
          begin
            StringGrid1.Objects[6,i]:=TStringList.Create;
            TStringList(StringGrid1.Objects[6,i]).Add('�����p����');
            TStringList(StringGrid1.Objects[6,i]).Add('�����������');
            TStringList(StringGrid1.Objects[6,i]).Add('(����� 90%)');
            StringGrid1.Cells[6,i]:='�����p����';
          end;
       if (s3 = '������������') then
        if (f1/f2>0.3) and (f1/f2<0.5) then
          begin
            StringGrid1.Objects[6,i]:=TStringList.Create;
            TStringList(StringGrid1.Objects[6,i]).Add('��������');
            TStringList(StringGrid1.Objects[6,i]).Add('�������������');
            TStringList(StringGrid1.Objects[6,i]).Add('����� 30%');
            StringGrid1.Cells[6,i]:='��������';
          end
        else if f1/f2>=0.5 then
          begin
            StringGrid1.Objects[6,i]:=TStringList.Create;
            TStringList(StringGrid1.Objects[6,i]).Add('�����p����');
            TStringList(StringGrid1.Objects[6,i]).Add('�������������');
            TStringList(StringGrid1.Objects[6,i]).Add('(����� 50%)');
            StringGrid1.Cells[6,i]:='�����p����';
          end;
      end;
      stringgrid1.Perform(LB_SETHORIZONTALEXTENT, 1000, Longint(0));
  end;

  except
    on E:Exception do
    begin
      FormWait.Hide;
      MessageDlg('���������� ������ ��������. ' + E.Message, mtError, [mbOk], 0);
    end;
  end;

  FormWait.Hide;
end;

procedure TFormXA.StringGrid1DrawCell(Sender: TObject; Col, Row: Integer;
  Rect: TRect; State: TGridDrawState);
var i:integer;
begin

 if (StringGrid1.Cells[Col,Row]='�����p����') or
    (StringGrid1.Cells[Col,Row]='����������') then
  begin
   StringGrid1.Canvas.Brush.Color:=clRed;
   StringGrid1.Canvas.FillRect(Rect);
   StringGrid1.Canvas.Font.Color:=clWhite;
//   StringGrid1.Canvas.TextOut(
//     trunc((Rect.Right-Rect.Left-StringGrid1.Canvas.TextWidth(StringGrid1.Cells[Col,Row]))/2)+Rect.Left,
//     trunc((Rect.Bottom-Rect.Top-StringGrid1.Canvas.TextHeight(StringGrid1.Cells[Col,Row]))/2)+Rect.Top,
//     StringGrid1.Cells[Col,Row]);
  end;
 if StringGrid1.Cells[Col,Row]='�� �����������' then
  begin
   StringGrid1.Canvas.Brush.Color:=clLime;
   StringGrid1.Canvas.FillRect(Rect);
  end;
 if StringGrid1.Cells[Col,Row]='��������' then
  begin
   StringGrid1.Canvas.Brush.Color:=clYellow;
   StringGrid1.Canvas.FillRect(Rect);
  end;

 if (StringGrid1.Objects[Col,Row] is TStringList) then
  begin
   if (StringGrid1.RowHeights[Row]<
        (StringGrid1.Objects[Col,Row] as TStringList).Count*18)
     then
        StringGrid1.RowHeights[Row]:=
          (StringGrid1.Objects[Col,Row] as TStringList).Count*18;
   for i:=0 to (StringGrid1.Objects[Col,Row] as TStringList).Count-1 do
    begin
     while
       StringGrid1.Canvas.TextWidth
       ((StringGrid1.Objects[Col,Row] as TStringList).Strings[i])>
       StringGrid1.ColWidths[0]-3
     do
       (StringGrid1.Objects[Col,Row] as TStringList).Strings[i]:=
        Copy((StringGrid1.Objects[Col,Row] as TStringList).Strings[i],1,
        Length((StringGrid1.Objects[Col,Row] as TStringList).Strings[i])-1);

       if col <> 0 then
          StringGrid1.Canvas.TextOut(
            trunc((Rect.Right - Rect.Left -
              StringGrid1.Canvas.TextWidth((StringGrid1.Objects[Col,Row] as TStringList).Strings[i])) / 2) +
              Rect.Left,
            trunc((Rect.Bottom - Rect.Top -
              (18 * (StringGrid1.Objects[Col,Row] as TStringList).Count)) / 2) +
              Rect.Top + (i*18) + 2,
            (StringGrid1.Objects[Col,Row] as TStringList).Strings[i])
       else
          StringGrid1.Canvas.TextOut(Rect.Left+2,Rect.Top+(i*18)+2,
            (StringGrid1.Objects[Col,Row] as TStringList).Strings[i]);
    end;
  end;

end;


procedure TFormXA.Count_Load(Number1:integer;Type_:string;Load_:integer;Number2:integer);
begin

end;

procedure TFormXA.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
 for i:=0 to StringGrid1.ColCount-1 do
  for j:=0 to StringGrid1.RowCount-1 do
   begin
    StringGrid1.Cells[i,j]:='';
    StringGrid1.Objects[i,j].Free;
    StringGrid1.Objects[i,j]:=nil;
   end;
end;

procedure TFormXA.Load_Count(Number1:integer; // ����� ��
                             Load:integer; // �� ��������
                             Cost:integer; // ��������� �� �� ��
                             Min_Capasity:integer; // ���. ��������. �����������
                             Length:integer; // ����� ��������
                             Row:integer); // ������
begin

end;

procedure TFormXA.FormCreate(Sender: TObject);
begin
 StringGrid1.ColWidths[0]:=Panel1.Width-2;
 StringGrid1.ColWidths[1]:=Panel2.Width-2;
 StringGrid1.ColWidths[2]:=Panel6.Width-1;
 StringGrid1.ColWidths[3]:=Panel7.Width;
 StringGrid1.ColWidths[4]:=Panel3.Width-1;
 StringGrid1.ColWidths[5]:=Panel4.Width-2;
 StringGrid1.ColWidths[6]:=Panel5.Width;
 StringGrid1.ColWidths[7]:=Panel8.Width-2;
// StringGrid1.ColWidths[8]:=Panel9.Width;
end;

end.


