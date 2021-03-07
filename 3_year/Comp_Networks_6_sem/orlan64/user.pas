unit user;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, Spin, ComCtrls, Grids, OrLAN;

type
  TFormWS = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    ComboBox3: TComboBox;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Bevel1: TBevel;
    ListBoxAvNIC: TListBox;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    StringGridCards: TStringGrid;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ListBoxAvNICDblClick(Sender: TObject);
    procedure StringGridCardsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure RemoveBrokenConns();  
    { Public declarations }
  end;

var
  FormWS: TFormWS;

implementation

uses main,connect;

{$R *.DFM}

procedure TFormWS.FormCreate(Sender: TObject);
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
procedure TFormWS.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
 Project_Modified:=True;

 try
  StrToInt(Edit2.Text);
 except
  on EConvertError do
   begin
    Beep();
    MessageDlg('Стоимость программного обеспечения должна быть числовой величиной.', mtError,
      [mbOk], 0);
      
    Exit;
   end;
 end;

 try
  StrToInt(Edit3.Text);
 except
  on EConvertError do
   begin
    Beep();
    MessageDlg('Объем ОЗУ должен быть числовой величиной.', mtError,
      [mbOk], 0);
    Exit;
   end;
 end;
 try
  StrToInt(Edit4.Text);
 except
  on EConvertError do
   begin
    Beep();
    MessageDlg('Размер жесткого диска должен быть числовой величиной.', mtError,
      [mbOk], 0);
    Exit;
   end;
 end;

 if (Edit1.Text='') then
 begin
   MessageDlg('Задайте имя станции.', mtError,[mbOk], 0);
   Exit;
 end;

 for i:=0 to Nodes.Count-1 do
  if (TOrLAN(Nodes[i]).NodeType='WS') and (TOrLAN(Nodes[i]).Active=True) then { Находим активную WS }
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

     TOrLAN(Nodes[i]).NodeName:=Edit1.Text;
     with TOrLAN(Nodes[i]).WSParameters do
     begin // сохраняем пaраметры WS
       Soft:=ComboBox1.Text;
       Cost:=StrToInt(Edit2.Text);
       Processor:=ComboBox3.Text;
       RAM:=StrToInt(Edit3.Text);
       HDD:=StrToInt(Edit4.Text);

       // сохраняем все порты
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

           if StringGridCards.Cells[7,j]='Used' then
           begin
             Ports_^.IsUsed2:=True;
             Ports_^.ID2:=StrToInt(StringGridCards.Cells[8,j]);
             Ports_^.ChannalLength2:=StrToInt(StringGridCards.Cells[9,j]);
           end
           else
             Ports_^.IsUsed2:=False;

           TOrLAN(Nodes[i]).Ports.Add(Ports_);
         end;
     end;
   end;

 RemoveBrokenConns();

 ModalResult:=1;
end;

procedure TFormWS.BitBtn2Click(Sender: TObject);
begin
 ModalResult:=1;
end;

procedure TFormWS.FormShow(Sender: TObject);
label m1;
var i,j:integer;
begin
 StringGridCards.RowCount:=1;

 for j:=0 to StringGridCards.ColCount-1 do
   StringGridCards.Cells[j,0]:='';

 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).Active=True then { Находим активную WS }
   begin
     Edit1.Text:=TOrLAN(Nodes[i]).NodeName;
     ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(TOrLAN(Nodes[i]).WSParameters.Soft);
     Edit2.Text:=IntToStr(TOrLAN(Nodes[i]).WSParameters.Cost);
     Edit3.Text:=IntToStr(TOrLAN(Nodes[i]).WSParameters.RAM);
     Edit4.Text:=IntToStr(TOrLAN(Nodes[i]).WSParameters. HDD);
     ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(TOrLAN(Nodes[i]).WSParameters.Processor);
     ListBoxAvNIC.ItemIndex := 0;

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
       if Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2=True then
       begin
         StringGridCards.Cells[7,j]:='Used';
         StringGridCards.Cells[8,j]:=IntToStr(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2);
         StringGridCards.Cells[9,j]:=IntToStr(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2);
       end
       else
         StringGridCards.Cells[7,j]:='NotUsed';
     end;
   end;

end;

//Добавить СК в список
procedure TFormWS.SpeedButton1Click(Sender: TObject);
begin
   if StringGridCards.Cells[1,0] <> '' then
     StringGridCards.RowCount:=StringGridCards.RowCount+1;

   StringGridCards.Cells[1,StringGridCards.RowCount-1]:='NotUsed';
   StringGridCards.Cells[2,StringGridCards.RowCount-1]:=ListBoxAvNIC.Items[ListBoxAvNIC.ItemIndex];

   StringGridCards.Row := StringGridCards.RowCount-1;
end;

//удалить СК из списка, затем сместить те, что остались
procedure TFormWS.SpeedButton2Click(Sender: TObject);
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


procedure TFormWS.ListBoxAvNICDblClick(Sender: TObject);
begin
  SpeedButton1Click(nil);
end;

procedure TFormWS.StringGridCardsDblClick(Sender: TObject);
begin
  SpeedButton2Click(nil);
end;

//чистит связи, оборванные с одной стороны
procedure TFormWS.RemoveBrokenConns();
var i, j, z: Integer;
    El, El2 : TOrlan;
    PortEl, PortEl2 : Port_Element;
    bConnected : Boolean;
begin
  for i:=0 to Nodes.Count-1 do
  begin
     El := TOrlan(Nodes[i]);
     for j:=0 to El.Ports.Count-1 do
     begin
        PortEl := Port_Element(El.Ports[j]);
        if PortEl.IsUsed = True then
        begin
          bConnected := False;
          El2 := TOrlan(Nodes[FormConnect.IDToNum(PortEl.ID)]);
          for z:=0 to El2.Ports.Count-1 do
          begin
            PortEl2 := Port_Element(El2.Ports[z]);
            //у этого алгоритма есть недостаток:
            //например если станции соединены двумя адаптерами одинакового типа, и связь по одному
            //разорвана, это обнаружено не будет.
            if (PortEl2.IsUsed = True) and (PortEl.PortType = PortEl2.PortType) then
            begin
               bConnected := True;
               break;
            end;
          end;

          //обновить информацию про этот порт
          PortEl.IsUsed := bConnected;
        end;
     end;
  end;
end;

end.
