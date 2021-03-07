unit server;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, orlan, Grids;

type
  TFormServer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Edit6: TEdit;
    ComboBox3: TComboBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit2: TEdit;
    ComboBox2: TComboBox;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Label9: TLabel;
    ListBoxAvNIC: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StringGridCards: TStringGrid;
    Label7: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ListBoxAvNICDblClick(Sender: TObject);
    procedure StringGridCardsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormServer: TFormServer;

implementation

uses main, user, connect;

{$R *.DFM}


procedure TFormServer.BitBtn2Click(Sender: TObject);
begin
 ModalResult:=1;
end;

procedure TFormServer.FormCreate(Sender: TObject);
begin
 StringGridCards.ColWidths[0]:=0;
 StringGridCards.ColWidths[1]:=50;
 StringGridCards.ColWidths[2]:=StringGridCards.ClientWidth - StringGridCards.ColWidths[1];
 StringGridCards.ColWidths[3]:=0;
 StringGridCards.ColWidths[4]:=0;
 StringGridCards.ColWidths[5]:=0;
 StringGridCards.ColWidths[6]:=0;
 StringGridCards.ColWidths[7]:=0;
 StringGridCards.ColWidths[8]:=0;
 StringGridCards.ColWidths[9]:=0;
 StringGridCards.RowCount:=0;
end;

//Кнопка Применить
procedure TFormServer.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
 Project_Modified:=True;

 try
   StrToInt(Edit2.Text);
 except
  on EConvertError do
  begin
    MessageDlg('Стоимость программного обеспечения должна быть числовой величиной.', mtError,[mbOk], 0);
    Exit;
  end;
 end;

 try
   StrToInt(Edit6.Text);
 except
  on EConvertError do
  begin
    MessageDlg('Количество процессоров должно быть числовой величиной.', mtError,[mbOk], 0);
    Exit;
  end;
 end;

 try
   StrToInt(Edit3.Text);
 except
  on EConvertError do
  begin
    MessageDlg('Объем ОЗУ должен быть числовой величиной.', mtError,[mbOk], 0);
    Exit;
  end;
 end;

 try
   StrToInt(Edit4.Text);
 except
   on EConvertError do
   begin
    MessageDlg('Объем жесткого диска должен быть числовой величиной.', mtError,[mbOk], 0);
    Exit;
   end;
 end;

 if (Edit1.Text='') then
 begin
   MessageDlg('Задайте имя сервера.', mtError,[mbOk], 0);
   Exit;
 end;

 for i:=0 to Nodes.Count-1 do
   if (TOrLAN(Nodes[i]).NodeType='SERV') and (TOrLAN(Nodes[i]).Active=True) then // Находим активный сервер
   begin
     for j:=0 to Nodes.Count-1 do
      if (TOrLAN(Nodes[i]).NodeID<>TOrLAN(Nodes[j]).NodeID) and
         (Edit1.Text=TOrLAN(Nodes[j]).NodeName) then
       begin
        MessageDlg('Невозможно наличие в одном проекте двух'+#10
           +#13+'узлов с одинаковыми именами.',
           mtWarning, [mbOK], 0);
        exit;
       end;


//     TOrLAN(Nodes[i]).Hint:=Edit1.Text // Hint:= имя WS
//     +#13+#10+'ID = '+IntToStr(TOrLAN(Nodes[i]).NodeID);
     with TOrLAN(Nodes[i]).ServParameters do
      begin // сохраняем праметры WS
       TOrLAN(Nodes[i]).NodeName:=Edit1.Text;
       Soft:=ComboBox1.Text;
       Cost:=StrToInt(Edit2.Text);
       NumberProc:=StrToInt(Edit6.Text);
       Processor:=ComboBox3.Text;
       RAM:=StrToInt(Edit3.Text);
       HDD:=StrToInt(Edit4.Text);
       OSType:=ComboBox2.Text;

       for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
         TOrLAN(Nodes[i]).Ports.Items[j]:=nil;
       TOrLAN(Nodes[i]).Ports.Pack;

       for j:=0 to StringGridCards.RowCount-1 do
         if StringGridCards.Cells[1,0]<>'' then
         begin
           New(Ports_);

           Ports_^.PortType:=StringGridCards.Cells[2,j];
           if StringGridCards.Cells[1,j]='Used' then
           begin
             Ports_^.IsUsed:=True;
             Ports_^.ID:=StrToInt(StringGridCards.Cells[3,j]);
             Ports_^.Speed:=StrToInt(StringGridCards.Cells[4,j]);
             Ports_^.ChannalType:=StringGridCards.Cells[5,j];
             Ports_^.ChannalLength:=StrToInt(StringGridCards.Cells[6,j]);
           end
           else
             Ports_^.IsUsed:=False;

           TOrLAN(Nodes[i]).Ports.Add(Ports_);
         end;
      end;

   end;

 FormWS.RemoveBrokenConns();

 ModalResult:=1;
end;

procedure TFormServer.FormShow(Sender: TObject);
var i,j:integer;
begin
 ListBoxAvNIC.ItemIndex := 0;

 StringGridCards.RowCount:=1;
 for j:=0 to StringGridCards.ColCount-1 do
   StringGridCards.Cells[j,0]:='';

 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).Active=True then
   begin
     Edit1.Text:=TOrLAN(Nodes[i]).NodeName;
     ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(TOrLAN(Nodes[i]).ServParameters.Soft);
     Edit2.Text:=IntToStr(TOrLAN(Nodes[i]).ServParameters.Cost);
     Edit6.Text:=IntToStr(TOrLAN(Nodes[i]).ServParameters.NumberProc);
     ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(TOrLAN(Nodes[i]).ServParameters.Processor);
     Edit3.Text:=IntToStr(TOrLAN(Nodes[i]).ServParameters.RAM);
     Edit4.Text:=IntToStr(TOrLAN(Nodes[i]).ServParameters.HDD);
     ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(TOrLAN(Nodes[i]).ServParameters.OSType);

     StringGridCards.RowCount:=TOrLAN(Nodes[i]).Ports.Count;
     for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
     begin
       if Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed=True then
       begin
         StringGridCards.Cells[1,j]:='Used';
         StringGridCards.Cells[3,j]:=IntToStr(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID);
         StringGridCards.Cells[4,j]:=IntToStr(Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed);
         StringGridCards.Cells[5,j]:=Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType;
         StringGridCards.Cells[6,j]:=IntToStr(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength);
       end
       else
         StringGridCards.Cells[1,j]:='NotUsed';

       StringGridCards.Cells[2,j]:=Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType;
     end;
   end;

end;

procedure TFormServer.SpeedButton1Click(Sender: TObject);
begin
   if StringGridCards.Cells[1,0] <> '' then
     StringGridCards.RowCount:=StringGridCards.RowCount+1;

   StringGridCards.Cells[1,StringGridCards.RowCount-1]:='NotUsed';
   StringGridCards.Cells[2,StringGridCards.RowCount-1]:=ListBoxAvNIC.Items[ListBoxAvNIC.ItemIndex];

   StringGridCards.Row := StringGridCards.RowCount-1;
end;

procedure TFormServer.SpeedButton2Click(Sender: TObject);
var i,j:integer;
begin
 for i:=StringGridCards.Row to StringGridCards.RowCount-2 do
   for j:=0 to StringGridCards.ColCount-1 do
     StringGridCards.Cells[j,i]:=StringGridCards.Cells[j,i+1];

 if StringGridCards.RowCount = 1 then
   for j:=0 to StringGridCards.ColCount-1 do
     StringGridCards.Cells[j,0]:='';

 StringGridCards.RowCount:=StringGridCards.RowCount-1;
end;

procedure TFormServer.ListBoxAvNICDblClick(Sender: TObject);
begin
  SpeedButton1Click(nil);
end;

procedure TFormServer.StringGridCardsDblClick(Sender: TObject);
begin
  SpeedButton2Click(nil);
end;

end.
