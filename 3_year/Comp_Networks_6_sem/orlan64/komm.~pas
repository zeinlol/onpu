unit komm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, orlan;

type
  TForm6 = class(TForm)
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit2: TEdit;
    Bevel1: TBevel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    CheckBox7: TCheckBox;
    Label1: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label2: TLabel;
    Edit11: TEdit;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bNewNode : Boolean;
  end;

var
  Form6: TForm6;

implementation

uses main, connect;

{$R *.DFM}

procedure TForm6.FormShow(Sender: TObject);
var i,j:integer;
begin
 CheckBox1.Enabled:=True;
 CheckBox2.Enabled:=True;
 CheckBox3.Enabled:=True;
 CheckBox4.Enabled:=True;
 CheckBox5.Enabled:=True;
 CheckBox6.Enabled:=True;
 CheckBox7.Enabled:=True;
 Edit1.Text:='0';
 Edit3.Text:='0';
 Edit4.Text:='0';
 Edit5.Text:='0';
 Edit6.Text:='0';
 Edit7.Text:='0';
 Edit9.Text:='';
 Edit10.Text:='';
 Edit11.Text:='0';
 Edit8.Text:='0';
 CheckBox1.State:=cbUnchecked;
 CheckBox2.State:=cbUnchecked;
 CheckBox3.State:=cbUnchecked;
 CheckBox4.State:=cbUnchecked;
 CheckBox5.State:=cbUnchecked;
 CheckBox6.State:=cbUnchecked;
 CheckBox7.State:=cbUnchecked;
 ComboBox2.Enabled:=True;
 ComboBox3.Enabled:=True;

 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).Active=True then
   begin
    Edit2.Text:=TOrLAN(Nodes[i]).NodeName;
    if (not bNewNode) then
    begin
      ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(TOrLAN(Nodes[i]).KommParameters.Producer);
      ComboBox2.Enabled:=False;

      ComboBox3.Items.Clear;
      for j:=0 to Komm_List.Count-1 do
      begin
        Komm_Elem:=Komm_List[j];
        if Komm_Elem^.Producer_=ComboBox2.Text then
          ComboBox3.Items.Add(Komm_Elem^.Prod_Name_);
      end;

      ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(TOrLAN(Nodes[i]).KommParameters.Prod_Name);
      ComboBox3.Enabled:=False;

      if TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber<>0 then
      begin
        CheckBox1.State:=cbChecked;
        Edit1.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber);
        Edit9.Text:=TOrLAN(Nodes[i]).KommParameters.Eth_Type;
      end;

      if TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber<>0 then
      begin
        CheckBox2.State:=cbChecked;
        Edit3.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber);
        Edit10.Text:=TOrLAN(Nodes[i]).KommParameters.F_Eth_Type;
      end;

      if TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber<>0 then
      begin
        CheckBox3.State:=cbChecked;
        Edit4.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber);
      end;

      if TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber<>0 then
      begin
        CheckBox4.State:=cbChecked;
        Edit5.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber);
      end;

      if TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber<>0 then
      begin
        CheckBox5.State:=cbChecked;
        Edit6.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber);
      end;

      if TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber<>0 then
      begin
        CheckBox6.State:=cbChecked;
        Edit7.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber);
      end;

      CheckBox7.Checked:=TOrLAN(Nodes[i]).KommParameters.Duplex;
      CheckBox7.Enabled:=False;

      Edit11.Text:=FloatToStr(TOrLAN(Nodes[i]).KommParameters.Int_Bus);
      Edit8.Text:=IntToStr(TOrLAN(Nodes[i]).KommParameters.Cost);

      CheckBox1.Enabled:=False;
      CheckBox2.Enabled:=False;
      CheckBox3.Enabled:=False;
      CheckBox4.Enabled:=False;
      CheckBox5.Enabled:=False;
      CheckBox6.Enabled:=False;
    end
    else
    begin // если тольkо что добавили Коммутатор
      ComboBox2.ItemIndex:=0;
      ComboBox3.Items.Clear;
      for j:=0 to Komm_List.Count-1 do
      begin
        Komm_Elem:=Komm_List[j];
        if Komm_Elem^.Producer_=ComboBox2.Text then
           ComboBox3.Items.Add(Komm_Elem^.Prod_Name_);
      end;
      ComboBox3.ItemIndex:=0;
      ComboBox3Change(nil);
    end;
   end;
end;


procedure TForm6.BitBtn1Click(Sender: TObject);
var i,j,k,z,l:integer;
begin
 Project_Modified:=True;

 if (not bNewNode) then
 begin
   for i:=0 to Nodes.Count-1 do
     if (TOrLAN(Nodes[i]).Active=True) and (TOrLAN(Nodes[i]).NodeType='KOMM') then
     begin
       for j:=0 to Nodes.Count-1 do
         if (TOrLAN(Nodes[i]).NodeID <> TOrLAN(Nodes[j]).NodeID) and
            (Edit2.Text=TOrLAN(Nodes[j]).NodeName) then
         begin
           MessageDlg('Невозможно наличие в одном проекте двух'+#10
             +#13+'узлов с одинаковыми именами.',
             mtWarning, [mbOK], 0);
           exit;
         end;
       TOrLAN(Nodes[i]).NodeName:=Edit2.Text;
     end;

   ModalResult := 1;
   exit;
 end;

 for i:=0 to Nodes.Count-1 do
  if (TOrLAN(Nodes[i]).Active=True) and (TOrLAN(Nodes[i]).NodeType='KOMM') then
  begin
    for j:=0 to Nodes.Count-1 do
      if (TOrLAN(Nodes[i]).NodeID <> TOrLAN(Nodes[j]).NodeID) and
        (Edit2.Text=TOrLAN(Nodes[j]).NodeName) then
      begin
       MessageDlg('Невозможно наличие в одном проекте двух'+#10
          +#13+'узлов с одинаковыми именами.',
          mtWarning, [mbOK], 0);
       exit;
      end;

    TOrLAN(Nodes[i]).NodeName:=Edit2.Text;
    TOrLAN(Nodes[i]).KommParameters.Producer:=ComboBox2.Text;
    TOrLAN(Nodes[i]).KommParameters.Prod_Name:=ComboBox3.Text;
    TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber:=StrToInt(Edit1.Text);
    TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber:=StrToInt(Edit3.Text);
    TOrLAN(Nodes[i]).KommParameters.Eth_Type:=Edit9.Text;
    TOrLAN(Nodes[i]).KommParameters.F_Eth_Type:=Edit10.Text;
    TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber:=StrToInt(Edit4.Text);
    TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber:=StrToInt(Edit5.Text);
    TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber:=StrToInt(Edit6.Text);
    TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber:=StrToInt(Edit7.Text);
    TOrLAN(Nodes[i]).KommParameters.Duplex:=CheckBox7.Checked;
    TOrLAN(Nodes[i]).KommParameters.Int_Bus:=StrToFloat(Edit11.Text);
    TOrLAN(Nodes[i]).KommParameters.Cost:=StrToInt(Edit8.Text);

    for k:=0 to Komm_List.Count-1 do
    begin
      Komm_Elem:=Komm_List[k];
      if Komm_Elem^.Prod_Name_=ComboBox3.Text then
        for l:=1 to 5 do
          for z:=1 to 5 do
            TOrLAN(Nodes[i]).Komm_Time[l,z]:=Komm_Elem^.Switches[l,z];
    end;

    for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      TOrLAN(Nodes[i]).Ports.Items[j]:=nil;

    TOrLAN(Nodes[i]).Ports.Pack;

    for j:=0 to TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:=TOrLAN(Nodes[i]).KommParameters.Eth_Type;
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:=TOrLAN(Nodes[i]).KommParameters.F_Eth_Type;
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='Gigabit Ethernet';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='ATM';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='FDDI';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='100 Base T';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;
  end;

 ModalResult:=1;
end;

procedure TForm6.ComboBox2Change(Sender: TObject);
var i:integer;
begin
 ComboBox3.Items.Clear;
 for i:=0 to Komm_List.Count-1 do
 begin
   Komm_Elem:=Komm_List[i];
   if Komm_Elem^.Producer_=ComboBox2.Text then
     ComboBox3.Items.Add(Komm_Elem^.Prod_Name_);
 end;

 ComboBox3.ItemIndex := 0;
 ComboBox3Change(nil);
end;

procedure TForm6.ComboBox3Change(Sender: TObject);
var i:integer;
begin
 CheckBox1.Enabled:=True;
 CheckBox2.Enabled:=True;
 CheckBox3.Enabled:=True;
 CheckBox4.Enabled:=True;
 CheckBox5.Enabled:=True;
 CheckBox6.Enabled:=True;
 CheckBox7.Enabled:=True;
 Edit1.Text:='0';
 Edit3.Text:='0';
 Edit4.Text:='0';
 Edit5.Text:='0';
 Edit6.Text:='0';
 Edit7.Text:='0';
 Edit9.Text:='';
 Edit10.Text:='';
 Edit11.Text:='0';
 Edit8.Text:='0';
 CheckBox1.State:=cbUnchecked;
 CheckBox2.State:=cbUnchecked;
 CheckBox3.State:=cbUnchecked;
 CheckBox4.State:=cbUnchecked;
 CheckBox5.State:=cbUnchecked;
 CheckBox6.State:=cbUnchecked;
 CheckBox7.State:=cbUnchecked;

 for i:=0 to Komm_List.Count-1 do
 begin
   Komm_Elem:=Komm_List[i];
   if Komm_Elem^.Prod_Name_=ComboBox3.Text then
   begin
     if Komm_Elem^.Eth_PortNumber_<>0 then
     begin
       CheckBox1.State:=cbChecked;
       Edit1.Text:=IntToStr(Komm_Elem^.Eth_PortNumber_);
       Edit9.Text:=Komm_Elem^.Eth_Type;
     end;

     if Komm_Elem^.F_Eth_PortNumber_<>0 then
     begin
       CheckBox2.State:=cbChecked;
       Edit3.Text:=IntToStr(Komm_Elem^.F_Eth_PortNumber_);
       Edit10.Text:=Komm_Elem^.F_Eth_Type;
     end;

     if Komm_Elem^.G_Eth_PortNumber_<>0 then
     begin
       CheckBox3.State:=cbChecked;
       Edit4.Text:=IntToStr(Komm_Elem^.G_Eth_PortNumber_);
     end;

     if Komm_Elem^.ATM_PortNumber_<>0 then
     begin
       CheckBox4.State:=cbChecked;
       Edit5.Text:=IntToStr(Komm_Elem^.ATM_PortNumber_);
     end;

     if Komm_Elem^.FDDI_PortNumber_<>0 then
     begin
       CheckBox5.State:=cbChecked;
       Edit6.Text:=IntToStr(Komm_Elem^.FDDI_PortNumber_);
     end;

     if Komm_Elem^.E_F_Eth_PortNumber_<>0 then
     begin
       CheckBox6.State:=cbChecked;
       Edit7.Text:=IntToStr(Komm_Elem^.E_F_Eth_PortNumber_);
     end;

     CheckBox7.Checked:=Komm_Elem^.Duplex_;
     CheckBox7.Enabled:=False;

     Edit11.Text:=FloatToStr(Komm_Elem^.Int_Bus_);
     Edit8.Text:=IntToStr(Komm_Elem^.Cost_);

     CheckBox1.Enabled:=False;
     CheckBox2.Enabled:=False;
     CheckBox3.Enabled:=False;
     CheckBox4.Enabled:=False;
     CheckBox5.Enabled:=False;
     CheckBox6.Enabled:=False;
   end;
 end;
end;

end.
