// ********************************************************************
//  switch.pas
//
//  Матрица переключений между портами коммутатора
//
// ********************************************************************

unit switch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ExtCtrls, Buttons;

type
  TFormSwTime = class(TForm)
    StringGrid1: TStringGrid;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    BitBtnApply: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure BitBtnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CountS(NodeID, Port1, Port2: integer):real;
    function ChannalTypeToKommIndx( ChType : string ): Integer;
    function ChannalTypeToDefaultSpeed( ChType : string ): Integer;
  end;

var
  FormSwTime: TFormSwTime;

implementation

uses main, connect, orlan, scat_in;

{$R *.DFM}

procedure TFormSwTime.FormCreate(Sender: TObject);
var i,j: integer;
begin
 for i:=0 to StringGrid1.ColCount-1 do
  for j:=0 to StringGrid1.RowCount-1 do
   StringGrid1.Cells[i,j]:='0';
end;


procedure TFormSwTime.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
 try
  StrToFloat(StringGrid1.Cells[ACol,ARow]);
 except
  StringGrid1.Cells[ACol,ARow]:='0';
 end;
end;

function TFormSwTime.ChannalTypeToKommIndx( ChType : string ): Integer;
begin
  Result := 1;

  if (ChType = '10 Base T') or
     (ChType = '10 Base FX') or
     (ChType = '10 Base 2') or
     (ChType = '10 Base 5')
     then
    Result := 1;

  if (ChType = '100 Base TX') or
     (ChType = '100 Base FX') or
     (ChType = '100 Base T') or
     (ChType = '100 VG') then
    Result := 2;

  if (ChType = 'Gigabit Ethernet') then
    Result := 3;

  if (ChType = 'FDDI') then
    Result := 4;

  if (ChType = 'ATM') then
    Result := 5;

end;

function TFormSwTime.ChannalTypeToDefaultSpeed( ChType : string ): Integer;
begin
  Result := 10;

  if (ChType = '10 Base T') or
     (ChType = '10 Base FX') or
     (ChType = '10 Base 2') or
     (ChType = '10 Base 5')
     then
    Result := 10;

  if (ChType = '100 Base TX') or
     (ChType = '100 Base FX') or
     (ChType = '100 Base T') or
     (ChType = '100 VG') then
    Result := 100;

  if (ChType = 'Gigabit Ethernet') then
    Result := 1000;

  if (ChType = 'FDDI') then
    Result := 10;

  if (ChType = 'ATM') then
    Result := 10;

  if (ChType = '802.11') then
    Result := 11;

end;

//_==============================================================
//_ Берет время перключения коммутатора из массива Komm_Time
//_ Входные данные: ID узла и ChannalID портов, между кот. находится задержка.
//_==============================================================
function TFormSwTime.CountS(NodeID, Port1, Port2: integer):real;
var
    PortEl : Port_Element;
    PortEl2 : Port_Element;
    El : TOrLan;
    i, j: integer;
begin
 El := TOrLAN(Nodes[FormConnect.IDToNum(NodeID)]);
 PortEl := Port_Element(El.Ports[ScatForm.ChanIDToPortNum(Port1, NodeID)]);
 PortEl2 := Port_Element(El.Ports[ScatForm.ChanIDToPortNum(Port2, NodeID)]);

 i := ChannalTypeToKommIndx( PortEl.ChannalType );
 j := ChannalTypeToKommIndx( PortEl2.ChannalType );

 Result:=El.Komm_Time[i,j];
// Result:=El.Komm_Time[i,1];
end;

procedure TFormSwTime.BitBtnApplyClick(Sender: TObject);
begin
  ModalResult:=1;
end;

end.
