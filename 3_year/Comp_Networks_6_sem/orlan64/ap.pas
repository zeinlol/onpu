unit ap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, orlan;

type
  TForm1 = class(TForm)
    Label6: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    ComboBox2: TComboBox;
    Label5: TLabel;
    ComboBox3: TComboBox;
    Bevel1: TBevel;
    Label7: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label8: TLabel;
    CheckBox3: TCheckBox;
    Label9: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Edit10: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Edit8: TEdit;
    BitBtn1: TBitBtn;
    CheckBox6: TCheckBox;
    Label12: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    CheckBox7: TCheckBox;
    Label2: TLabel;
    Edit11: TEdit;
    CheckBox4: TCheckBox;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bNewNode : Boolean;
  end;

var
  Form1: TForm1;

implementation

uses main, connect;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var i,j:integer;
begin
 CheckBox1.Enabled:=True;
 CheckBox2.Enabled:=True;
 CheckBox3.Enabled:=True;
 CheckBox4.Enabled:=True;
 CheckBox6.Enabled:=True;
 CheckBox7.Enabled:=True;
 Edit1.Text:='0';
 Edit3.Text:='0';
 Edit4.Text:='0';
 Edit5.Text:='0';
 Edit7.Text:='0';
 Edit9.Text:='';
 Edit10.Text:='';
 Edit8.Text:='0';
 CheckBox1.State:=cbUnchecked;
 CheckBox2.State:=cbUnchecked;
 CheckBox3.State:=cbUnchecked;
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
      ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(TOrLAN(Nodes[i]).AP_Parameters.Producer);
      ComboBox2.Enabled:=False;

      ComboBox3.Items.Clear;
      for j:=0 to AP_List.Count-1 do
      begin
        AP_Elem:=AP_List[j];
        if AP_Elem^.Producer_=ComboBox2.Text then
          ComboBox3.Items.Add(AP_Elem^.Prod_Name_);
      end;

      ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(TOrLAN(Nodes[i]).AP_Parameters.Prod_Name);
      ComboBox3.Enabled:=False;

      if TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber<>0 then
      begin
        CheckBox1.State:=cbChecked;
        Edit1.Text:=IntToStr(TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber);
        Edit9.Text:=TOrLAN(Nodes[i]).AP_Parameters.Eth_Type;
      end;

      if TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber<>0 then
      begin
        CheckBox2.State:=cbChecked;
        Edit3.Text:=IntToStr(TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber);
        Edit10.Text:=TOrLAN(Nodes[i]).AP_Parameters.F_Eth_Type;
      end;

      if TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber<>0 then
      begin
        CheckBox3.State:=cbChecked;
        Edit4.Text:=IntToStr(TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber);
      end;

      if TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber<>0 then
      begin
        CheckBox6.State:=cbChecked;
        Edit7.Text:=IntToStr(TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber);
      end;

      if TOrLAN(Nodes[i]).AP_Parameters.Wifi_PortNumber<>0 then
      begin
        CheckBox4.State:=cbChecked;
        Edit5.Text:=IntToStr(TOrLAN(Nodes[i]).AP_Parameters.Wifi_PortNumber);
      end;

      CheckBox7.Checked:=TOrLAN(Nodes[i]).AP_Parameters.Duplex;
      CheckBox7.Enabled:=False;

      Edit11.Text:=FloatToStr(TOrLAN(Nodes[i]).AP_Parameters.Int_Bus);
      Edit8.Text:=IntToStr(TOrLAN(Nodes[i]).AP_Parameters.Cost);

      CheckBox1.Enabled:=False;
      CheckBox2.Enabled:=False;
      CheckBox3.Enabled:=False;
      CheckBox6.Enabled:=False;
    end
    else
    begin // ���� ����k� ��� �������� ����� �������
      ComboBox2.ItemIndex:=0;
      ComboBox3.Items.Clear;
      for j:=0 to AP_List.Count-1 do
      begin
        AP_Elem:=AP_List[j];
        if AP_Elem^.Producer_=ComboBox2.Text then
           ComboBox3.Items.Add(AP_Elem^.Prod_Name_);
      end;
      ComboBox3.ItemIndex:=0;
      ComboBox3Change(nil);
    end;
   end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,k,z,l:integer;
begin
 Project_Modified:=True;

 if (not bNewNode) then
 begin
   for i:=0 to Nodes.Count-1 do
     if (TOrLAN(Nodes[i]).Active=True) and (TOrLAN(Nodes[i]).NodeType='AP') then
     begin
       for j:=0 to Nodes.Count-1 do
         if (TOrLAN(Nodes[i]).NodeID <> TOrLAN(Nodes[j]).NodeID) and
            (Edit2.Text=TOrLAN(Nodes[j]).NodeName) then
         begin
           MessageDlg('���������� ������� � ����� ������� ����'+#10
             +#13+'����� � ����������� �������.',
             mtWarning, [mbOK], 0);
           exit;
         end;
       TOrLAN(Nodes[i]).NodeName:=Edit2.Text;
     end;

   ModalResult := 1;
   exit;
 end;

 for i:=0 to Nodes.Count-1 do
  if (TOrLAN(Nodes[i]).Active=True) and (TOrLAN(Nodes[i]).NodeType='AP') then
  begin
    for j:=0 to Nodes.Count-1 do
      if (TOrLAN(Nodes[i]).NodeID <> TOrLAN(Nodes[j]).NodeID) and
        (Edit2.Text=TOrLAN(Nodes[j]).NodeName) then
      begin
       MessageDlg('���������� ������� � ����� ������� ����'+#10
          +#13+'����� � ����������� �������.',
          mtWarning, [mbOK], 0);
       exit;
      end;

    TOrLAN(Nodes[i]).NodeName:=Edit2.Text;
    TOrLAN(Nodes[i]).AP_Parameters.Producer:=ComboBox2.Text;
    TOrLAN(Nodes[i]).AP_Parameters.Prod_Name:=ComboBox3.Text;
    TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber:=StrToInt(Edit1.Text);
    TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber:=StrToInt(Edit3.Text);
    TOrLAN(Nodes[i]).AP_Parameters.Eth_Type:=Edit9.Text;
    TOrLAN(Nodes[i]).AP_Parameters.F_Eth_Type:=Edit10.Text;
    TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber:=StrToInt(Edit4.Text);
    TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber:=StrToInt(Edit7.Text);
    TOrLAN(Nodes[i]).AP_Parameters.Wifi_PortNumber:=StrToInt(Edit5.Text);
    TOrLAN(Nodes[i]).AP_Parameters.Duplex:=CheckBox7.Checked;
    TOrLAN(Nodes[i]).AP_Parameters.Int_Bus:=StrToFloat(Edit11.Text);
    TOrLAN(Nodes[i]).AP_Parameters.Cost:=StrToInt(Edit8.Text);

    for k:=0 to AP_List.Count-1 do
    begin
      AP_Elem:=AP_List[k];
      if AP_Elem^.Prod_Name_=ComboBox3.Text then
        for l:=1 to 5 do
          for z:=1 to 5 do
            TOrLAN(Nodes[i]).Komm_Time[l,z]:=AP_Elem^.Switches[l,z];
    end;

    for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      TOrLAN(Nodes[i]).Ports.Items[j]:=nil;

    TOrLAN(Nodes[i]).Ports.Pack;

    for j:=0 to TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:=TOrLAN(Nodes[i]).AP_Parameters.Eth_Type;
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:=TOrLAN(Nodes[i]).AP_Parameters.F_Eth_Type;
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='Gigabit Ethernet';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='100 Base T';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;

    for j:=0 to TOrLAN(Nodes[i]).AP_Parameters.Wifi_PortNumber-1 do
    begin
      new(Ports_);
      Ports_.PortType:='802.11';
      Ports_^.IsUsed:=False;
      Ports_^.ChannalID:=0;
      Ports_^.IsUsed2:=False;
      TOrLAN(Nodes[i]).Ports.Add(Ports_);
    end;
  end;

 ModalResult:=1;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
var i:integer;
begin
 CheckBox1.Enabled:=True;
 CheckBox2.Enabled:=True;
 CheckBox3.Enabled:=True;
 CheckBox4.Enabled:=True;
 CheckBox6.Enabled:=True;
 CheckBox7.Enabled:=True;
 Edit1.Text:='0';
 Edit3.Text:='0';
 Edit4.Text:='0';
 Edit5.Text:='0';
 Edit7.Text:='0';
 Edit9.Text:='';
 Edit10.Text:='';
 Edit11.Text:='0';
 Edit8.Text:='0';
 CheckBox1.State:=cbUnchecked;
 CheckBox2.State:=cbUnchecked;
 CheckBox3.State:=cbUnchecked;
 CheckBox4.State:=cbUnchecked;
 CheckBox6.State:=cbUnchecked;
 CheckBox7.State:=cbUnchecked;

 for i:=0 to AP_List.Count-1 do
 begin
   AP_Elem:=AP_List[i];
   if AP_Elem^.Prod_Name_=ComboBox3.Text then
   begin
     if AP_Elem^.Eth_PortNumber_<>0 then
     begin
       CheckBox1.State:=cbChecked;
       Edit1.Text:=IntToStr(AP_Elem^.Eth_PortNumber_);
       Edit9.Text:=AP_Elem^.Eth_Type;
     end;

     if AP_Elem^.F_Eth_PortNumber_<>0 then
     begin
       CheckBox2.State:=cbChecked;
       Edit3.Text:=IntToStr(AP_Elem^.F_Eth_PortNumber_);
       Edit10.Text:=AP_Elem^.F_Eth_Type;
     end;

     if AP_Elem^.G_Eth_PortNumber_<>0 then
     begin
       CheckBox3.State:=cbChecked;
       Edit4.Text:=IntToStr(AP_Elem^.G_Eth_PortNumber_);
     end;

     if AP_Elem^.E_F_Eth_PortNumber_<>0 then
     begin
       CheckBox6.State:=cbChecked;
       Edit7.Text:=IntToStr(AP_Elem^.E_F_Eth_PortNumber_);
     end;

     if AP_Elem^.Wifi_PortNumber_<>0 then
     begin
       CheckBox4.State:=cbChecked;
       Edit5.Text:=IntToStr(AP_Elem^.Wifi_PortNumber_);
     end;

     CheckBox7.Checked:=AP_Elem^.Duplex_;
     CheckBox7.Enabled:=False;

     Edit11.Text:=FloatToStr(AP_Elem^.Int_Bus_);
     Edit8.Text:=IntToStr(AP_Elem^.Cost_);

     CheckBox1.Enabled:=False;
     CheckBox2.Enabled:=False;
     CheckBox3.Enabled:=False;
     CheckBox4.Enabled:=False;
     CheckBox6.Enabled:=False;
   end;
 end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
var i:integer;
begin
 ComboBox3.Items.Clear;
 for i:=0 to AP_List.Count-1 do
 begin
   AP_Elem:=AP_List[i];
   if AP_Elem^.Producer_=ComboBox2.Text then
     ComboBox3.Items.Add(AP_Elem^.Prod_Name_);
 end;

 ComboBox3.ItemIndex := 0;
 ComboBox3Change(nil);
end;

end.
