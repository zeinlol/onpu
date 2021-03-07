// ********************************************************************
//  database.pas
//  
// ********************************************************************


unit database;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ComCtrls, Grids, ExtCtrls, Menus;

type
  TFormDB = class(TForm)
    PageControl1: TPageControl;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    TabSheetSwitches: TTabSheet;
    TabSheetCPUs: TTabSheet;
    TabSheetSoft: TTabSheet;
    TabSheetOSs: TTabSheet;
    ListBoxCPUs: TListBox;
    EditCPUName: TEdit;
    SpeedButtonAddCPU: TSpeedButton;
    EditOS: TEdit;
    ListBoxOSs: TListBox;
    SpeedButtonAddOS: TSpeedButton;
    EditSwitchManufacturer: TEdit;
    ListBoxSwitches: TListBox;
    Label5: TLabel;
    Label6: TLabel;
    EditSwitchModel: TEdit;
    Label7: TLabel;
    CheckBoxSwitchE: TCheckBox;
    CheckBoxSwitchFE: TCheckBox;
    CheckBoxSwitchGE: TCheckBox;
    CheckBoxSwitchATM: TCheckBox;
    CheckBoxSwitchFDDI: TCheckBox;
    EditSwitchEPorts: TEdit;
    EditSwitchFEPorts: TEdit;
    EditSwitchGEPorts: TEdit;
    EditSwitchATMPorts: TEdit;
    EditSwitchFDDIPorts: TEdit;
    SpeedButtonAddSwitch: TSpeedButton;
    GroupBoxSwitchFullDupHalfDup: TGroupBox;
    RadioButtonFullDup: TRadioButton;
    RadioButtonHalfDup: TRadioButton;
    SpeedButtonDelSwitch: TSpeedButton;
    ListBoxSofts: TListBox;
    EditSoftName: TEdit;
    BitBtnAddSoft: TBitBtn;
    TabSheetProtocols: TTabSheet;
    ListBoxPhLayer: TListBox;
    ListBoxMedia: TListBox;
    Edit11: TEdit;
    SpeedButtonAddPhLayer: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    SpeedButtonAddMedia: TSpeedButton;
    EditSwitchBusCapacity: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    EditSwitchPrice: TEdit;
    TabSheetPrices: TTabSheet;
    ComboBoxElemType: TComboBox;
    Label14: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    StringGridCost: TStringGrid;
    ComboBox2: TComboBox;
    TabSheetHubs: TTabSheet;
    CheckBoxSwitchEFE: TCheckBox;
    EditSwitchEFEPorts: TEdit;
    ComboBoxSwitchEMedia: TComboBox;
    ComboBoxSwitchFEMedia: TComboBox;
    BitBtnSwitchTime: TBitBtn;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButtonAddHub: TSpeedButton;
    SpeedButtonDelHub: TSpeedButton;
    Label19: TLabel;
    EditHubManufacturer: TEdit;
    ListBoxHubs: TListBox;
    EditHubModel: TEdit;
    CheckBoxHubATM: TCheckBox;
    CheckBoxHubFDDI: TCheckBox;
    EditHubEPorts: TEdit;
    EditHubFEPorts: TEdit;
    EditHubGEPorts: TEdit;
    EditHubATMPorts: TEdit;
    EditHubFDDIPorts: TEdit;
    EditHubPrice: TEdit;
    CheckBoxHubEFE: TCheckBox;
    EditHubEFEPorts: TEdit;
    ComboBoxHubEMedia: TComboBox;
    ComboBoxHubFEMedia: TComboBox;
    SpeedButtonDelOS: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ButtDelSoft: TBitBtn;
    SpeedButtonDelCPU: TSpeedButton;
    SpeedButtonDelPhLayer: TSpeedButton;
    SpeedButtonDelMedia: TSpeedButton;
    SpeedButtonChCost: TSpeedButton;
    Bevel1: TBevel;
    EditOSPrice: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Bevel2: TBevel;
    EditCPUPrice: TEdit;
    GroupBoxCPU: TGroupBox;
    Bevel3: TBevel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBoxSoft: TGroupBox;
    EditSoftPrice: TEdit;
    Bevel4: TBevel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    CheckBoxHubGE: TCheckBox;
    CheckBoxHubE: TRadioButton;
    CheckBoxHubFE: TRadioButton;
    SpeedButtonModifySwitch: TSpeedButton;
    SpeedButtonNewSwitch: TSpeedButton;
    TabSheet1: TTabSheet;
    SpeedButtonNewAP: TSpeedButton;
    Label22: TLabel;
    ListBoxAP: TListBox;
    GroupBox1: TGroupBox;
    RadioButtonAPHalfDup: TRadioButton;
    RadioButtonAPFullDup: TRadioButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    EditAPManufacturer: TEdit;
    EditAPModel: TEdit;
    EditAPBusCapacity: TEdit;
    EditAPPrice: TEdit;
    CheckBoxAPE: TCheckBox;
    CheckBoxAPFE: TCheckBox;
    CheckBoxAPGE: TCheckBox;
    CheckBoxAPEFE: TCheckBox;
    EditAPEPorts: TEdit;
    EditAPFEPorts: TEdit;
    EditAPGEPorts: TEdit;
    EditAPEFEPorts: TEdit;
    ComboBoxAPEMedia: TComboBox;
    ComboBoxAPFEMedia: TComboBox;
    BitBtn1: TBitBtn;
    SpeedButtonAddAP: TSpeedButton;
    SpeedButtonModifyAP: TSpeedButton;
    SpeedButtonDelAP: TSpeedButton;
    CheckBoxAPWifi: TCheckBox;
    EditAPWifiPorts: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ListBoxCPUsClick(Sender: TObject);
    procedure SpeedButtonAddCPUClick(Sender: TObject);
    procedure EditCPUNameChange(Sender: TObject);
    procedure SpeedButtonAddOSClick(Sender: TObject);
    procedure EditOSChange(Sender: TObject);

    procedure CheckBoxAPEClick(Sender: TObject);
    procedure CheckBoxAPFEClick(Sender: TObject);
    procedure CheckBoxAPGEClick(Sender: TObject);

    procedure CheckBoxSwitchEClick(Sender: TObject);
    procedure CheckBoxSwitchFEClick(Sender: TObject);
    procedure CheckBoxSwitchGEClick(Sender: TObject);
    procedure CheckBoxSwitchATMClick(Sender: TObject);
    procedure CheckBoxSwitchFDDIClick(Sender: TObject);
    procedure EditSoftNameChange(Sender: TObject);
    procedure BitBtnAddSoftClick(Sender: TObject);
    procedure ListBoxSoftsClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure SpeedButtonAddAPClick(Sender: TObject);
    procedure SpeedButtonAddSwitchClick(Sender: TObject);
    procedure ListBoxSwitchesClick(Sender: TObject);
    procedure ListBoxAPClick(Sender: TObject);
    procedure SpeedButtonDelAPClick(Sender: TObject);
    procedure SpeedButtonDelSwitchClick(Sender: TObject);
    procedure EditSwitchManufacturerChange(Sender: TObject);
    procedure EditAPManufacturerChange(Sender: TObject);
    procedure EditAPModelChange(Sender: TObject);
    procedure EditSwitchModelChange(Sender: TObject);
    procedure EditAPEPortsChange(Sender: TObject);
    procedure EditAPFEPortsChange(Sender: TObject);
    procedure EditAPGEPortsChange(Sender: TObject);
    procedure EditSwitchEPortsChange(Sender: TObject);
    procedure EditSwitchFEPortsChange(Sender: TObject);
    procedure EditSwitchGEPortsChange(Sender: TObject);
    procedure EditSwitchATMPortsChange(Sender: TObject);
    procedure EditSwitchFDDIPortsChange(Sender: TObject);
    procedure SpeedButtonAddPhLayerClick(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure SpeedButtonAddMediaClick(Sender: TObject);
    procedure ListBoxPhLayerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBoxPhLayerKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditAPBusCapacityChange(Sender: TObject);
    procedure EditSwitchBusCapacityChange(Sender: TObject);
    procedure EditSwitchPriceChange(Sender: TObject);
    procedure EditSwitchManufacturerEnter(Sender: TObject);
    procedure ComboBoxElemTypeChange(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure CheckBoxAPEFEClick(Sender: TObject);
    procedure CheckBoxAPWifiClick(Sender: TObject);
    procedure CheckBoxSwitchEFEClick(Sender: TObject);
    procedure EditAPEFEPortsChange(Sender: TObject);
    procedure EditAPWifiPortsChange(Sender: TObject);
    procedure EditSwitchEFEPortsChange(Sender: TObject);
    procedure BitBtnSwitchTimeClick(Sender: TObject);
    procedure SpeedButtonAddHubClick(Sender: TObject);
    procedure ListBoxHubsClick(Sender: TObject);
    procedure CheckBoxHubEClick(Sender: TObject);
    procedure CheckBoxHubFEClick(Sender: TObject);
    procedure CheckBoxHubGEClick(Sender: TObject);
    procedure CheckBoxHubATMClick(Sender: TObject);
    procedure CheckBoxHubFDDIClick(Sender: TObject);
    procedure CheckBoxHubEFEClick(Sender: TObject);
    procedure EditHubManufacturerEnter(Sender: TObject);
    procedure EditHubManufacturerChange(Sender: TObject);
    procedure EditHubEPortsChange(Sender: TObject);
    procedure SpeedButtonDelHubClick(Sender: TObject);
    procedure SpeedButtonDelOSClick(Sender: TObject);
    procedure ListBoxOSsClick(Sender: TObject);
    procedure ButtDelSoftClick(Sender: TObject);
    procedure SpeedButtonDelCPUClick(Sender: TObject);
    procedure SpeedButtonDelPhLayerClick(Sender: TObject);
    procedure ListBoxPhLayerClick(Sender: TObject);
    procedure SpeedButtonDelMediaClick(Sender: TObject);
    procedure ListBoxMediaClick(Sender: TObject);
    procedure SpeedButtonChCostClick(Sender: TObject);
    procedure StringGrid1DClick(Sender: TObject);
    procedure SpeedButtonModifyAPClick(Sender: TObject);
    procedure SpeedButtonModifySwitchClick(Sender: TObject);
    procedure SpeedButtonNewSwitchClick(Sender: TObject);
    procedure SpeedButtonNewAPClick(Sender: TObject);
  private
    { Private declarations }
    procedure SwitchClear();
    procedure APClear();
    procedure ChangeAddAPState();
  public
    { Public declarations }
  end;

var
  FormDB: TFormDB;
  View_: boolean;
  View2_: boolean;
  Cost_: integer;
  Name_: String;

implementation

uses user,server,main,ch_cost, switch, komm, konc, ap;

{$R *.DFM}

procedure TFormDB.FormCreate(Sender: TObject);
var File_1: PrjFile_Kommutators;
    File_4: PrjFile_Konc;
    File_5: PrjFile_AP;
    File_2: PrjFile_Prot;
    File_3: Scat_DB;
    j,i:integer;
    fl:boolean;
begin
 StringGridCost.ColWidths[0]:=Panel1.Width-2;
 StringGridCost.ColWidths[1]:=Panel2.Width-20;
 View_:=False;

 try
  AssignFile(File_5,'ap.sdb');
  Reset(File_5);
  While not(eof(File_5)) do
   begin
    New(AP_Elem);
    read(File_5,AP_Elem^);
    AP_List.Add(AP_Elem);
    FormDB.ListBoxAP.Items.Add(AP_Elem^.Prod_Name_);
   end;
  CloseFile(File_5);

  AssignFile(File_1,'komm.sdb');
  Reset(File_1);
  While not(eof(file_1)) do
   begin
    New(Komm_Elem);
    read(File_1,Komm_Elem^);
    Komm_List.Add(Komm_Elem);
    FormDB.ListBoxSwitches.Items.Add(Komm_Elem^.Prod_Name_);
   end;
  CloseFile(File_1);

  AssignFile(File_4,'konc.sdb');
  Reset(File_4);
  While not(eof(file_4)) do
   begin
    New(Konc_Elem);
    read(File_4,Konc_Elem^);
    //___________________________________________// dbHOST >>>
	if ( Konc_Elem^.Eth_PortNumber_<>0 ) AND
	   ( Konc_Elem^.F_Eth_PortNumber_<>0 ) then
		Konc_Elem^.F_Eth_PortNumber_:=0;
    //___________________________________________// dbHOST <<<

    Konc_List.Add(Konc_Elem);
    FormDB.ListBoxHubs.Items.Add(Konc_Elem^.Prod_Name_);
   end;
  CloseFile(File_4);

  AssignFile(File_2,'Prot.sdb');
  Reset(File_2);
  While not(eof(file_2)) do
  begin
    New(Prot_Elem);
    read(File_2,Prot_Elem^);
    Prot_List.Add(Prot_Elem);
    fl:=false;
    for i:=0 to ListBoxPhLayer.Items.Count-1 do
     if Prot_Elem^.Prot_=ListBoxPhLayer.Items[i] then
      fl:=true;
    if fl=False then
    begin
      ListBoxPhLayer.Items.Add(Prot_Elem^.Prot_);
    end;
  end;
  CloseFile(File_2);

  AssignFile(File_3,'scat.sdb');
  Reset(File_3);
  While not(eof(file_3)) do
   begin
    New(DB_Elem);
    read(File_3,DB_Elem^);
    Main_DB.Add(DB_Elem);
    if DB_Elem^.Type_='���� ������� ������������ ������' then
     begin
       ListBoxOSs.Items.Add(DB_Elem^.Name_);
     end;
    if DB_Elem^.Type_='����������� �����������' then
       ListBoxSofts.Items.Add(DB_Elem^.Name_);

    if DB_Elem^.Type_='����������' then
        ListBoxCPUs.Items.Add(DB_Elem^.Name_);

    if DB_Elem^.Type_='����� ��������' then
     begin
      FormDB.ComboBox2.Items.Add(DB_Elem^.Name_);
     end;
   end;
   // ��������
   {New(DB_Elem);
   DB_Elem.Type_ :=  '����� ��������' ;
   DB_Elem.Name_ := '������������ ����� ��������';
   DB_Elem.Active_ := True;
   DB_Elem.Cost_ := 0;
   Main_DB.Add(DB_Elem);
   FormDB.ComboBox2.Items.Add(DB_Elem.Name_);  }
   // ��������
  CloseFile(File_3);

  FormWS.ComboBox1.Items:=ListBoxSofts.Items;
  FormWS.ComboBox3.Items:=ListBoxCPUs.Items;
  FormWS.ListBoxAvNIC.Items:=ListBoxPhLayer.Items;

  FormServer.ComboBox1.Items:=ListBoxSofts.Items;
  FormServer.ComboBox2.Items:=ListBoxOSs.Items;
  FormServer.ComboBox3.Items:=ListBoxCPUs.Items;
  FormServer.ListBoxAvNIC.Items:=ListBoxPhLayer.Items;

  ComboBox2.ItemIndex:=0;
  ComboBoxElemType.ItemIndex:=0;
  ComboBoxElemTypeChange(Nil);

 Form1.ComboBox2.Items.Clear;
 for i:=0 to AP_List.Count-1 do
  begin
   AP_Elem:=AP_List[i];
   fl:=true;
   for j:=0 to Form1.ComboBox2.Items.Count-1 do
    if AP_Elem^.Producer_=Form1.ComboBox2.Items[j] then
     fl:=false;
   if fl=true then
    Form1.ComboBox2.Items.Add(AP_Elem^.Producer_);
  end;

 Form6.ComboBox2.Items.Clear;
 for i:=0 to Komm_List.Count-1 do
  begin
   Komm_Elem:=Komm_List[i];
   fl:=true;
   for j:=0 to Form6.ComboBox2.Items.Count-1 do
    if Komm_Elem^.Producer_=Form6.ComboBox2.Items[j] then
     fl:=false;
   if fl=true then
    Form6.ComboBox2.Items.Add(Komm_Elem^.Producer_);
  end;

 Form20.ComboBox2.Items.Clear;
 for i:=0 to Konc_List.Count-1 do
  begin
   Konc_Elem:=Konc_List[i];
   fl:=true;
   for j:=0 to Form20.ComboBox2.Items.Count-1 do
    if Konc_Elem^.Producer_=Form20.ComboBox2.Items[j] then
     fl:=false;
   if fl=true then
    Form20.ComboBox2.Items.Add(Konc_Elem^.Producer_);
  end;

 except
  MessageDlg('�� ������� ��������� ��� ���� ������ ��� ������ ���������.'+
    #13+#10+'���������� �� ��������������� ������� � ������������ ���������'+
    #13+#10+'�������� ��� ���������� �������������� "OrLAN for Windows 9x/NT/2000."',
    mtInformation, [mbOk], 0);
  Halt(1);
 end;

end;

procedure TFormDB.ListBoxCPUsClick(Sender: TObject);
begin
  if ListBoxCPUs.Selected[ListBoxCPUs.ItemIndex]=True then
     SpeedButtonDelCPU.Enabled:=True
  else SpeedButtonDelCPU.Enabled:=False;

end;

procedure TFormDB.SpeedButtonAddCPUClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to ListBoxCPUs.Items.Count-1 do
  if EditCPUName.Text=ListBoxCPUs.Items[i] then exit;
 ListBoxCPUs.Items.Add(EditCPUName.Text);
 New(DB_Elem);
 DB_Elem^.Type_:='����������';
 DB_Elem^.Name_:=EditCPUName.Text;
 DB_Elem^.Active_:=False;
 DB_Elem^.Cost_:=StrTointDef(EditCPUPrice.Text,0);
 Main_DB.Add(DB_Elem);
 EditCPUName.Text:='';
 EditCPUPrice.Text:='';
 ComboBoxElemTypeChange(nil);
end;

procedure TFormDB.EditCPUNameChange(Sender: TObject);
begin
 if EditCPUName.Text=' ' then EditCPUName.Text:='';
 if EditCPUName.Text<>'' then
  begin
  SpeedButtonAddCPU.Enabled:=True;
  EditCPUPrice.Visible:=True;
  Label9.Visible:=True;
  end
 else
  begin
  SpeedButtonAddCPU.Enabled:=False;
  EditCPUPrice.Visible:=False;
  Label9.Visible:=False;
  end;
end;

procedure TFormDB.SpeedButtonAddOSClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to ListBoxOSs.Items.Count-1 do
   if EditOS.Text=ListBoxOSs.Items[i] then exit;

 ListBoxOSs.Items.Add(EditOS.Text);
 New(DB_Elem);
 DB_Elem^.Type_:='���� ������� ������������ ������';
 DB_Elem^.Name_:=EditOS.Text;
 DB_Elem^.Active_:=True;
 DB_Elem^.Cost_:=StrTointDef(EditOSPrice.Text,0);
 Main_DB.Add(DB_Elem);
 EditOS.Text:='';
 EditOSPrice.Text:='';
 ComboBoxElemTypeChange(nil);
end;

procedure TFormDB.EditOSChange(Sender: TObject);
begin
 if EditOS.Text=' ' then EditOS.Text:='';
 if EditOS.Text<>'' then
 begin
  SpeedButtonAddOS.Enabled:=True;
  EditOSPrice.Visible:=True;
  Label3.Visible:=True;
 end
 else
  begin
  SpeedButtonAddOS.Enabled:=False;
  EditOSPrice.Visible:=False;
  Label3.Visible:=False;
  end;
end;

procedure TFormDB.CheckBoxSwitchEClick(Sender: TObject);
begin
 if CheckBoxSwitchE.Checked then
  begin
   EditSwitchEPorts.Enabled:=True;
   ComboBoxSwitchEMedia.Enabled:=True;
  end
 else
  begin
   EditSwitchEPorts.Enabled:=False;
   ComboBoxSwitchEMedia.Enabled:=False;
  end;
end;

procedure TFormDB.CheckBoxAPEClick(Sender: TObject);
begin
 if CheckBoxAPE.Checked then
  begin
   EditAPEPorts.Enabled:=True;
   ComboBoxAPEMedia.Enabled:=True;
  end
 else
  begin
   EditAPEPorts.Enabled:=False;
   ComboBoxAPEMedia.Enabled:=False;
  end;
end;

procedure TFormDB.CheckBoxAPFEClick(Sender: TObject);
begin
 if CheckBoxAPFE.Checked then
  begin
   EditAPFEPorts.Enabled:=True;
   ComboBoxAPFEMedia.Enabled:=True;
  end
 else
  begin
   EditAPFEPorts.Enabled:=False;
   ComboBoxAPFEMedia.Enabled:= False;
  end;

end;

procedure TFormDB.CheckBoxAPGEClick(Sender: TObject);
begin
 if CheckBoxAPGE.Checked
 then EditAPGEPorts.Enabled:=True
 else EditAPGEPorts.Enabled:=False;

end;

procedure TFormDB.CheckBoxSwitchFEClick(Sender: TObject);
begin
 if CheckBoxSwitchFE.Checked then
  begin
   EditSwitchFEPorts.Enabled:=True;
   ComboBoxSwitchFEMedia.Enabled:=True;
  end
 else
  begin
   EditSwitchFEPorts.Enabled:=False;
   ComboBoxSwitchFEMedia.Enabled:= False;
  end;

end;

procedure TFormDB.CheckBoxSwitchGEClick(Sender: TObject);
begin
 if CheckBoxSwitchGE.Checked
 then EditSwitchGEPorts.Enabled:=True
 else EditSwitchGEPorts.Enabled:=False;

end;

procedure TFormDB.CheckBoxSwitchATMClick(Sender: TObject);
begin
 if CheckBoxSwitchATM.Checked
 then EditSwitchATMPorts.Enabled:=True
 else EditSwitchATMPorts.Enabled:=False;

end;

procedure TFormDB.CheckBoxSwitchFDDIClick(Sender: TObject);
begin
 if CheckBoxSwitchFDDI.Checked
 then EditSwitchFDDIPorts.Enabled:=True
 else EditSwitchFDDIPorts.Enabled:=False;

end;

procedure TFormDB.EditSoftNameChange(Sender: TObject);
begin
 if EditSoftName.Text=' ' then EditSoftName.Text:='';
 if EditSoftName.Text<>'' then
  begin
   BitBtnAddSoft.Enabled:=True;
   EditSoftPrice.Visible:=True;
   Label21.Visible:=True;
  end
 else
  begin
  BitBtnAddSoft.Enabled:=False;
  EditSoftPrice.Visible:=False;
  Label21.Visible:=False;
  end;
end;

procedure TFormDB.BitBtnAddSoftClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to ListBoxSofts.Items.Count-1 do
  if EditSoftName.Text=ListBoxSofts.Items[i] then exit;
 ListBoxSofts.Items.Add(EditSoftName.Text);
 New(DB_Elem);
 DB_Elem^.Type_:='����������� �����������';
 DB_Elem^.Name_:=EditSoftName.Text;
 DB_Elem^.Active_:=False;
 DB_Elem^.Cost_:=StrTointDef(EditSoftPrice.Text,0);
 Main_DB.Add(DB_Elem);
 EditSoftName.Text:='';
 EditSoftPrice.Text:='';
 ComboBoxElemTypeChange(nil);
end;

procedure TFormDB.ListBoxSoftsClick(Sender: TObject);
begin
   if ListBoxSofts.Selected[ListBoxSofts.ItemIndex]=True
   then ButtDelSoft.Enabled:=True
   else ButtDelSoft.Enabled:=False;
end;

//������ ���������
procedure TFormDB.BitBtnOkClick(Sender: TObject);
var File_1:PrjFile_Kommutators;
    File_4:PrjFile_Konc;
    File_5:PrjFile_AP;
    File_2:PrjFile_Prot;
    File_3: Scat_DB;
    i:integer;
begin

  AssignFile(File_2,'Prot.sdb');
  Rewrite(File_2);
  for i:=0 to Prot_List.Count-1 do
   begin
    Prot_Elem:=Prot_List.Items[i];
    write(File_2,Prot_Elem^);
   end;
  CloseFile(File_2);

  AssignFile(File_5,'ap.sdb');
  Rewrite(File_5);
  for i:=0 to AP_List.Count-1 do
   begin
    AP_Elem:=AP_List.Items[i];
    write(File_5,AP_Elem^);
   end;
  CloseFile(File_5);

  AssignFile(File_1,'komm.sdb');
  Rewrite(File_1);
  for i:=0 to Komm_List.Count-1 do
   begin
    Komm_Elem:=Komm_List.Items[i];
    write(File_1,Komm_Elem^);
   end;
  CloseFile(File_1);

  AssignFile(File_4,'konc.sdb');
  Rewrite(File_4);
  for i:=0 to Konc_List.Count-1 do
   begin
    Konc_Elem:=Konc_List.Items[i];
    write(File_4,Konc_Elem^);
   end;
  CloseFile(File_4);

  AssignFile(File_3,'scat.sdb');
  Rewrite(File_3);
  for i:=0 to Main_DB.Count-1 do
   begin
    DB_Elem:=Main_DB.Items[i];
    Write(File_3,DB_Elem^);
   end;
  CloseFile(File_3);

  FormWS.ComboBox1.Items:=ListBoxSofts.Items;
  FormWS.ComboBox3.Items:=ListBoxCPUs.Items;
  FormWS.ListBoxAvNIC.Items:=ListBoxPhLayer.Items;

  FormServer.ComboBox1.Items:=ListBoxSofts.Items;
  FormServer.ComboBox2.Items:=ListBoxOSs.Items;
  FormServer.ComboBox3.Items:=ListBoxCPUs.Items;
  FormServer.ListBoxAvNIC.Items:=ListBoxPhLayer.Items;

end;

procedure TFormDB.SwitchClear();
begin
     // ������� ��� Edit
     EditSwitchManufacturer.Text:='';
     EditSwitchModel.Text:='';
     EditSwitchBusCapacity.Text:='';
     EditSwitchPrice.Text:='';
     EditSwitchEPorts.Text:='';
     EditSwitchFEPorts.Text:='';
     EditSwitchGEPorts.Text:='';
     EditSwitchATMPorts.Text:='';
     EditSwitchFDDIPorts.Text:='';
     EditSwitchEFEPorts.Text:='';

     CheckBoxSwitchE.Checked:=False;
     CheckBoxSwitchFE.Checked:=False;
     CheckBoxSwitchGE.Checked:=False;
     CheckBoxSwitchATM.Checked:=False;
     CheckBoxSwitchFDDI.Checked:=False;
     CheckBoxSwitchEFE.Checked:=False;

     ComboBoxSwitchEMedia.ItemIndex:=-1;
     ComboBoxSwitchFEMedia.ItemIndex:=-1;
end;

procedure TFormDB.APClear();
begin
     // ������� ��� Edit
     EditAPManufacturer.Text:='';
     EditAPModel.Text:='';
     EditAPBusCapacity.Text:='';
     EditAPPrice.Text:='';
     EditAPEPorts.Text:='';
     EditAPFEPorts.Text:='';
     EditAPGEPorts.Text:='';

     EditAPEFEPorts.Text:='';
     EditAPWifiPorts.Text:='';

     CheckBoxAPE.Checked:=False;
     CheckBoxAPFE.Checked:=False;
     CheckBoxAPGE.Checked:=False;

     CheckBoxAPEFE.Checked:=False;
     CheckBoxAPWifi.Checked:=False;

     ComboBoxAPEMedia.ItemIndex:=-1;
     ComboBoxAPFEMedia.ItemIndex:=-1;
end;

//������ ������ "��������" ��� �����������
procedure TFormDB.SpeedButtonAddSwitchClick(Sender: TObject);
var i,j:integer;
    fl:boolean;
begin
 if Komm_List.Count<>0 then
  for i:=0 to Komm_List.Count-1 do // ��������� ���� �� � ��
   begin                           // �����. � ����� ������
    Komm_Elem:=Komm_list.Items[i];
    if EditSwitchModel.Text=Komm_Elem^.Prod_Name_ then
     begin
      MessageDlg('����� ���������� ��� ������� � ���� ������ ��� �� �������� � �������� �����������.',
        mtError,[mbOk], 0);
      Exit;
     end;
   end;

  // ����� ��������� ���������� � ��
 New(Komm_Elem);

 Komm_Elem^.Producer_:=EditSwitchManufacturer.Text; // �������������
 Komm_Elem^.Prod_Name_:=EditSwitchModel.Text; // ��������
 Komm_Elem^.Int_Bus_:=StrToFloat(EditSwitchBusCapacity.Text); // ����
 Komm_Elem^.Cost_:=StrToInt(EditSwitchPrice.Text); // ���������

 if CheckBoxSwitchE.Checked then // ����� Ethernet
  begin
   Komm_Elem^.Eth_PortNumber_:=StrToInt(EditSwitchEPorts.Text);
   Komm_Elem^.Eth_Type:=ComboBoxSwitchEMedia.Text;
  end
 else Komm_Elem^.Eth_PortNumber_:=0;

 if CheckBoxSwitchFE.Checked then // ����� Fast Eth.
  begin
   Komm_Elem^.F_Eth_PortNumber_:=StrToInt(EditSwitchFEPorts.Text);
   Komm_Elem^.F_Eth_Type:=ComboBoxSwitchFEMedia.Text;
  end
 else Komm_Elem^.F_Eth_PortNumber_:=0;

 if CheckBoxSwitchGE.Checked then // ����� Gigabit Ethernet
  Komm_Elem^.G_Eth_PortNumber_:=StrToInt(EditSwitchGEPorts.Text)
 else Komm_Elem^.G_Eth_PortNumber_:=0;

 if CheckBoxSwitchATM.Checked then // ����� ATM
  Komm_Elem^.ATM_PortNumber_:=StrToInt(EditSwitchATMPorts.Text)
 else Komm_Elem^.ATM_PortNumber_:=0;

 if CheckBoxSwitchFDDI.Checked then // ����� FDDI
  Komm_Elem^.FDDI_PortNumber_:=StrToInt(EditSwitchFDDIPorts.Text)
 else Komm_Elem^.FDDI_PortNumber_:=0;

 if CheckBoxSwitchEFE.Checked then // ����� 10/100
  Komm_Elem^.E_F_Eth_PortNumber_:=StrToInt(EditSwitchEFEPorts.Text)
 else Komm_Elem^.E_F_Eth_PortNumber_:=0;

 if RadioButtonFullDup.Checked then // ������������
  Komm_Elem^.Duplex_:=True
 else Komm_Elem^.Duplex_:=False;

 for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
  for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
   begin
    Komm_Elem^.Switches[i+1,j+1]:=
       (StrToFloat(FormSwTime.StringGrid1.Cells[i,j]))*0.001;
    FormSwTime.StringGrid1.Cells[i,j]:='0';
   end;

 Komm_List.Add(Komm_Elem); // ����������  � ����� �� � �������������

 ListBoxSwitches.Items.Add(Komm_Elem^.Prod_Name_); // ��������� ��� � ListBox

 SwitchClear;

 Form6.ComboBox2.Items.Clear;
 for i:=0 to Komm_List.Count-1 do
 begin
   Komm_Elem:=Komm_List[i];
   fl:=true;
   for j:=0 to Form6.ComboBox2.Items.Count-1 do
     if Komm_Elem^.Producer_=Form6.ComboBox2.Items[j] then
       fl:=false;
   if fl=true then
     Form6.ComboBox2.Items.Add(Komm_Elem^.Producer_);
 end;
end;

procedure TFormDB.SpeedButtonAddAPClick(Sender: TObject);
var i,j:integer;
    fl:boolean;
begin
 if AP_List.Count<>0 then
  for i:=0 to AP_List.Count-1 do // ��������� ���� �� � ��
   begin                           // �� � ����� ������
    AP_Elem:=AP_list.Items[i];
    if EditAPModel.Text=AP_Elem^.Prod_Name_ then
     begin
      MessageDlg('����� ����� ������� ��� ������� � ���� ������ ��� �� �������� � �������� ����� �������.',
        mtError,[mbOk], 0);
      Exit;
     end;
   end;

  // ����� ��������� �� � ��
 New(AP_Elem);

 AP_Elem^.Producer_:=EditAPManufacturer.Text; // �������������
 AP_Elem^.Prod_Name_:=EditAPModel.Text; // ��������
 AP_Elem^.Int_Bus_:=StrToFloat(EditAPBusCapacity.Text); // ����
 AP_Elem^.Cost_:=StrToInt(EditAPPrice.Text); // ���������

 if CheckBoxAPE.Checked then // ����� Ethernet
  begin
   AP_Elem^.Eth_PortNumber_:=StrToInt(EditAPEPorts.Text);
   AP_Elem^.Eth_Type:=ComboBoxAPEMedia.Text;
  end
 else AP_Elem^.Eth_PortNumber_:=0;

 if CheckBoxAPFE.Checked then // ����� Fast Eth.
  begin
   AP_Elem^.F_Eth_PortNumber_:=StrToInt(EditAPFEPorts.Text);
   AP_Elem^.F_Eth_Type:=ComboBoxAPFEMedia.Text;
  end
 else AP_Elem^.F_Eth_PortNumber_:=0;

 if CheckBoxSwitchGE.Checked then // ����� Gigabit Ethernet
  AP_Elem^.G_Eth_PortNumber_:=StrToInt(EditAPGEPorts.Text)
 else AP_Elem^.G_Eth_PortNumber_:=0;


 if CheckBoxAPEFE.Checked then // ����� 10/100
  AP_Elem^.E_F_Eth_PortNumber_:=StrToInt(EditAPEFEPorts.Text)
 else AP_Elem^.E_F_Eth_PortNumber_:=0;

 if CheckBoxAPWifi.Checked then // ������������ ��������
  AP_Elem^.Wifi_PortNumber_:=StrToInt(EditAPWifiPorts.Text)
 else AP_Elem^.Wifi_PortNumber_:=0;

 if RadioButtonFullDup.Checked then // ������������
  AP_Elem^.Duplex_:=True
 else AP_Elem^.Duplex_:=False;

 for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
  for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
   begin
    AP_Elem^.Switches[i+1,j+1]:=
       (StrToFloat(FormSwTime.StringGrid1.Cells[i,j]))*0.001;
    FormSwTime.StringGrid1.Cells[i,j]:='0';
   end;

 AP_List.Add(AP_Elem); // ����������  � ����� �� � ������� �������

 ListBoxAP.Items.Add(AP_Elem^.Prod_Name_); // ��������� ��� � ListBox

 APClear;

 Form1.ComboBox2.Items.Clear;
 for i:=0 to AP_List.Count-1 do
 begin
   AP_Elem:=AP_List[i];
   fl:=true;
   for j:=0 to Form1.ComboBox2.Items.Count-1 do
     if AP_Elem^.Producer_=Form1.ComboBox2.Items[j] then
       fl:=false;
   if fl=true then
     Form1.ComboBox2.Items.Add(AP_Elem^.Producer_);
 end;
end;

procedure TFormDB.ListBoxSwitchesClick(Sender: TObject);
var i,j,k:integer;
begin
// ���������� ���������� � �����������
 View_:=True;
 SpeedButtonDelSwitch.Enabled:=True;
 SpeedButtonModifySwitch.Enabled:=True;
 for i:=0 to Komm_List.Count-1 do
  begin
   Komm_Elem:=Komm_list.Items[i];
   if Komm_Elem^.Prod_Name_=ListBoxSwitches.Items[ListBoxSwitches.ItemIndex] then
    begin
     SwitchClear;
     EditSwitchManufacturer.Text:=Komm_Elem^.Producer_;
     EditSwitchModel.Text:=Komm_Elem^.Prod_Name_;
     EditSwitchBusCapacity.Text:=FloatToStrF(Komm_Elem^.Int_Bus_,ffGeneral,5,0);
     EditSwitchPrice.Text:=IntToStr(Komm_Elem^.Cost_);
     if Komm_Elem^.Eth_PortNumber_<>0 then
      begin
       CheckBoxSwitchE.Checked:=True;
       EditSwitchEPorts.Text:=IntToStr(Komm_Elem^.Eth_PortNumber_);
       ComboBoxSwitchEMedia.ItemIndex:=ComboBoxSwitchEMedia.Items.IndexOf(Komm_Elem^.Eth_Type);
      end;
     if Komm_Elem^.F_Eth_PortNumber_<>0 then
      begin
       CheckBoxSwitchFE.Checked:=True;
       EditSwitchFEPorts.Text:=IntToStr(Komm_Elem^.F_Eth_PortNumber_);
       ComboBoxSwitchFEMedia.ItemIndex:=ComboBoxSwitchFEMedia.Items.IndexOf(Komm_Elem^.F_Eth_Type);
      end;
     if Komm_Elem^.G_Eth_PortNumber_<>0 then
      begin
       CheckBoxSwitchGE.Checked:=True;
       EditSwitchGEPorts.Text:=IntToStr(Komm_Elem^.G_Eth_PortNumber_);
      end;
     if Komm_Elem^.ATM_PortNumber_<>0 then
      begin
       CheckBoxSwitchATM.Checked:=True;
       EditSwitchATMPorts.Text:=IntToStr(Komm_Elem^.ATM_PortNumber_);
      end;
     if Komm_Elem^.FDDI_PortNumber_<>0 then
      begin
       CheckBoxSwitchFDDI.Checked:=True;
       EditSwitchFDDIPorts.Text:=IntToStr(Komm_Elem^.FDDI_PortNumber_);
      end;
     if Komm_Elem^.E_F_Eth_PortNumber_<>0 then
      begin
       CheckBoxSwitchEFE.Checked:=True;
       EditSwitchEFEPorts.Text:=IntToStr(Komm_Elem^.E_F_Eth_PortNumber_);
      end;

     if Komm_Elem^.Duplex_=True then
      RadioButtonFullDup.Checked:=True
     else RadioButtonHalfDup.Checked:=True;

     for k:=0 to FormSwTime.StringGrid1.ColCount-1 do
      for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
        FormSwTime.StringGrid1.Cells[k,j]:=
         FloatToStrF(Komm_Elem^.Switches[k+1,j+1]*1000,ffGeneral,5,0);
    end;
  end;
 SpeedButtonAddSwitch.Enabled:=False; //!!!! May be SpeedButtonDelSwitch
end;

procedure TFormDB.ListBoxAPClick(Sender: TObject);
var i,j,k:integer;
begin
// ���������� ����� ������� � �����������
 View_:=True;
 SpeedButtonDelAP.Enabled:=True;
 SpeedButtonModifyAP.Enabled:=True;
 for i:=0 to AP_List.Count-1 do
  begin
   AP_Elem:=AP_list.Items[i];
   if AP_Elem^.Prod_Name_=ListBoxAP.Items[ListBoxAP.ItemIndex] then
    begin
     APClear;
     EditAPManufacturer.Text:=AP_Elem^.Producer_;
     EditAPModel.Text:=AP_Elem^.Prod_Name_;
     EditAPBusCapacity.Text:=FloatToStrF(AP_Elem^.Int_Bus_,ffGeneral,5,0);
     EditAPPrice.Text:=IntToStr(AP_Elem^.Cost_);
     if AP_Elem^.Eth_PortNumber_<>0 then
      begin
       CheckBoxAPE.Checked:=True;
       EditAPEPorts.Text:=IntToStr(AP_Elem^.Eth_PortNumber_);
       ComboBoxAPEMedia.ItemIndex:=ComboBoxAPEMedia.Items.IndexOf(AP_Elem^.Eth_Type);
      end;
     if AP_Elem^.F_Eth_PortNumber_<>0 then
      begin
       CheckBoxAPFE.Checked:=True;
       EditAPFEPorts.Text:=IntToStr(AP_Elem^.F_Eth_PortNumber_);
       ComboBoxAPFEMedia.ItemIndex:=ComboBoxAPFEMedia.Items.IndexOf(AP_Elem^.F_Eth_Type);
      end;
     if AP_Elem^.G_Eth_PortNumber_<>0 then
      begin
       CheckBoxAPGE.Checked:=True;
       EditAPGEPorts.Text:=IntToStr(AP_Elem^.G_Eth_PortNumber_);
      end;
     if AP_Elem^.E_F_Eth_PortNumber_<>0 then
      begin
       CheckBoxAPEFE.Checked:=True;
       EditAPEFEPorts.Text:=IntToStr(AP_Elem^.E_F_Eth_PortNumber_);
      end;
     if AP_Elem^.Wifi_PortNumber_<>0 then
      begin
       CheckBoxAPWifi.Checked:=True;
       EditAPWifiPorts.Text:=IntToStr(AP_Elem^.Wifi_PortNumber_);
      end;

     if AP_Elem^.Duplex_=True then
      RadioButtonAPFullDup.Checked:=True
     else RadioButtonAPHalfDup.Checked:=True;

     for k:=0 to FormSwTime.StringGrid1.ColCount-1 do
      for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
        FormSwTime.StringGrid1.Cells[k,j]:=
         FloatToStrF(AP_Elem^.Switches[k+1,j+1]*1000,ffGeneral,5,0);
    end;
  end;
 SpeedButtonAddAP.Enabled:=False; //!!!! May be SpeedButtonDelAP
end;

procedure TFormDB.SpeedButtonDelSwitchClick(Sender: TObject);
begin
 SwitchClear;

 // �������� �����������
 Komm_List.Delete(ListBoxSwitches.ItemIndex);
 ListBoxSwitches.Items.Delete(ListBoxSwitches.ItemIndex);
end;

procedure TFormDB.SpeedButtonDelAPClick(Sender: TObject);
begin
 APClear;

 // �������� ����� �������
 AP_List.Delete(ListBoxAP.ItemIndex);
 ListBoxAP.Items.Delete(ListBoxAP.ItemIndex);
end;

procedure TFormDB.EditAPManufacturerChange(Sender: TObject);
begin
 if EditAPManufacturer.Text=' ' then EditAPManufacturer.Text:='';
 ChangeAddAPState();
end;

procedure TFormDB.ChangeAddAPState();
begin
  if (EditAPManufacturer.Text<>'') and (EditAPModel.Text<>'') and
    (EditAPBusCapacity.Text<>'') and (EditAPPrice.Text<>'') and
    ((EditAPEPorts.Text<>'') or (EditAPFEPorts.Text<>'') or
     (EditAPGEPorts.Text<>'') or (EditAPEFEPorts.Text<>'') or (EditAPWifiPorts.Text<>'')) then
  SpeedButtonAddAP.Enabled:=True
 else SpeedButtonAddAP.Enabled:=False;
end;

procedure TFormDB.EditAPModelChange(Sender: TObject);
begin
 if EditAPManufacturer.Text=' ' then EditAPManufacturer.Text:='';
 ChangeAddAPState();
end;

procedure TFormDB.EditAPEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditAPEPorts.Text,0)=0 then
  begin
//   Beep;
   EditAPEPorts.Text:='';
  end;

 ChangeAddAPState();

end;

procedure TFormDB.EditAPFEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditAPFEPorts.Text,0)=0 then
  begin
//   Beep;
   EditAPFEPorts.Text:='';
  end;

 ChangeAddAPState();
end;

procedure TFormDB.EditAPGEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditAPGEPorts.Text,0)=0 then
  begin
//   Beep;
   EditAPGEPorts.Text:='';
  end;

 ChangeAddAPState();
end;

procedure TFormDB.EditSwitchManufacturerChange(Sender: TObject);
begin
 if EditSwitchManufacturer.Text=' ' then EditSwitchManufacturer.Text:='';
 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;
end;

procedure TFormDB.EditSwitchModelChange(Sender: TObject);
begin
 if EditSwitchModel.Text=' ' then EditSwitchModel.Text:='';
 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditSwitchEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchEPorts.Text,0)=0 then
  begin
//   Beep;
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchEPorts.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditSwitchFEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchFEPorts.Text,0)=0 then
  begin
//   Beep;
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchFEPorts.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditSwitchGEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchGEPorts.Text,0)=0 then
  begin
//   Beep;
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchGEPorts.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditSwitchATMPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchATMPorts.Text,0)=0 then
  begin
//   Beep;
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchATMPorts.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditSwitchFDDIPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchFDDIPorts.Text,0)=0 then
  begin
//   Beep;
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchFDDIPorts.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.SpeedButtonAddPhLayerClick(Sender: TObject);
var i,j:integer;
begin
 for i:=0 to ListBoxPhLayer.Items.Count-1 do
  if ListBoxPhLayer.Items[i]=Edit11.Text then
   begin
    MessageDlg('����� �������� ��� ������� � ���� ������ ��� �� �������� � �������� ���������.',
      mtError,[mbOk], 0);
    Edit11.Text:='';
    SpeedButtonAddPhLayer.Enabled:=False;
    ListBoxMedia.Clear;
    Exit;
   end;
 for j:=0 to ListBoxMedia.Items.Count-1 do
   begin
      New(Prot_Elem);
      Prot_Elem^.Prot_:=Edit11.Text;
      Prot_Elem^.Con_:=ListBoxMedia.Items[j];
      Prot_List.Add(Prot_Elem);
    end;
 ListBoxPhLayer.Items.Add(Edit11.Text);
 ListBoxMedia.Clear;
 Edit11.Text:='';
 SpeedButtonAddPhLayer.Enabled:=False;
 SpeedButtonAddMedia.Enabled:=False;
end;

procedure TFormDB.Edit11Change(Sender: TObject);
begin
 if Edit11.Text=' ' then Edit11.Text:='';
 if Edit11.Text<>'' then
    begin
    ListBoxMedia.Clear;
    SpeedButtonAddPhLayer.Enabled:=False;
    SpeedButtonAddMedia.Enabled:=True;
    end;
end;


procedure TFormDB.SpeedButtonAddMediaClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to ListBoxMedia.Items.Count-1 do
  if ListBoxMedia.Items[i]=ComboBox2.Text then
   begin
    MessageDlg('����� ����� �������� ��� ������� � ���� ������ ��� �������� ��������� ��� �� �������� � �������� ����� ��������.',
     mtError,[mbOk], 0);
    Exit;
   end;

 if Edit11.Text<>'' then
        begin
        ListBoxMedia.Items.Add(ComboBox2.Text);
        ComboBox2.Text:='';
        SpeedButtonAddPhLayer.Enabled:=True;
        exit;
        end
 else
        begin
        New(Prot_Elem);
        for i:=0 to ListBoxPhLayer.Items.Count-1 do
        if ListBoxPhLayer.Selected[i]=True then
        Prot_Elem^.Prot_:=ListBoxPhLayer.Items[i];
        Prot_Elem^.Con_:=ComboBox2.Text;
        Prot_List.Add(Prot_Elem);
        ListBoxMedia.Items.Add(ComboBox2.Text);
        ComboBox2.Text:='';
        end;
end;

procedure TFormDB.ListBoxPhLayerMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
    s:string;
begin
 ListBoxMedia.Clear;

 for i:=0 to ListBoxPhLayer.Items.Count-1 do
  if ListBoxPhLayer.Selected[i]=True then
   s:=ListBoxPhLayer.Items[i];

 for i:=0 to Prot_List.Count-1 do
  begin
   Prot_Elem:=Prot_List.Items[i];
   if s=Prot_Elem^.Prot_ then
    ListBoxMedia.Items.Add(Prot_Elem^.Con_);
  end;

end;

procedure TFormDB.ListBoxPhLayerKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var i:integer;
    s:string;
begin
 ListBoxMedia.Clear;

 for i:=0 to ListBoxPhLayer.Items.Count-1 do
  if ListBoxPhLayer.Selected[i]=True then
   s:=ListBoxPhLayer.Items[i];

 for i:=0 to Prot_List.Count-1 do
  begin
   Prot_Elem:=Prot_List.Items[i];
   if s=Prot_Elem^.Prot_ then
    ListBoxMedia.Items.Add(Prot_Elem^.Con_);
  end;

end;

procedure TFormDB.EditSwitchBusCapacityChange(Sender: TObject);
begin
 try
  StrToFloat(EditSwitchBusCapacity.Text);
 except
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchBusCapacity.Text:='';
 end;

{ if StrToFloat(EditSwitchBusCapacity.Text)=0 then
  begin
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchBusCapacity.Text:='';
  end;}

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'')) then
   SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditAPBusCapacityChange(Sender: TObject);
begin
 try
  StrToFloat(EditAPBusCapacity.Text);
 except
   EditAPBusCapacity.Text:='';
 end;

{ if StrToFloat(EditSwitchBusCapacity.Text)=0 then
  begin
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchBusCapacity.Text:='';
  end;}

 ChangeAddAPState();
end;

procedure TFormDB.EditSwitchPriceChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchPrice.Text,0)=0 then
  begin
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchPrice.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;

end;

procedure TFormDB.EditSwitchManufacturerEnter(Sender: TObject);
var i,j:integer;
begin
 if View_=True then
  begin
//   SwitchClear;
//   View_:=False;
//   SpeedButtonDelSwitch.Enabled:=True;
   for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
    for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
     FormSwTime.StringGrid1.Cells[i,j]:='0';
  end;
end;

procedure TFormDB.ComboBoxElemTypeChange(Sender: TObject);
var i,j:integer;
begin
 j:=0;
 for i:=0 to Main_DB.Count-1 do
  begin
   New(DB_Elem);
   DB_Elem:=Main_DB.Items[i];
   if DB_Elem^.Type_=ComboBoxElemType.Text then
    begin
     StringGridCost.Cells[0,j]:='';
     StringGridCost.Cells[1,j]:='';
     StringGridCost.Cells[0,j]:=DB_Elem^.Name_;
     StringGridCost.Cells[1,j]:=IntToStr(DB_Elem^.Cost_);
     j:=j+1;
    end;
  end;
 StringGridCost.RowCount:=j;
end;

procedure TFormDB.ComboBox2Change(Sender: TObject);
begin
 if ComboBox2.Text<>'' then
  SpeedButtonAddMedia.Enabled:=True
 else SpeedButtonAddMedia.Enabled:=False;
end;


procedure TFormDB.CheckBoxSwitchEFEClick(Sender: TObject);
begin
 if CheckBoxSwitchEFE.Checked then EditSwitchEFEPorts.Enabled:=True
 else EditSwitchEFEPorts.Enabled:=False;

end;

procedure TFormDB.CheckBoxAPEFEClick(Sender: TObject);
begin
 if CheckBoxAPEFE.Checked then EditAPEFEPorts.Enabled:=True
 else EditAPEFEPorts.Enabled:=False;

end;

procedure TFormDB.CheckBoxAPWifiClick(Sender: TObject);
begin
 if CheckBoxAPWifi.Checked then EditAPWifiPorts.Enabled:=True
 else EditAPWifiPorts.Enabled:=False;

end;

procedure TFormDB.EditAPEFEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditAPEFEPorts.Text,0)=0 then
  begin
   EditAPEFEPorts.Text:='';
  end;

 ChangeAddAPState();
end;

procedure TFormDB.EditAPWifiPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditAPWifiPorts.Text,0)=0 then
  begin
   EditAPWifiPorts.Text:='';
  end;

 ChangeAddAPState();
end;

procedure TFormDB.EditSwitchEFEPortsChange(Sender: TObject);
begin
 if StrToIntDef(EditSwitchEFEPorts.Text,0)=0 then
  begin
   SpeedButtonAddSwitch.Enabled:=False;
   EditSwitchEFEPorts.Text:='';
  end;

 if (EditSwitchManufacturer.Text<>'') and (EditSwitchModel.Text<>'') and
    (EditSwitchBusCapacity.Text<>'') and (EditSwitchPrice.Text<>'') and
    ((EditSwitchEPorts.Text<>'') or (EditSwitchFEPorts.Text<>'') or
     (EditSwitchGEPorts.Text<>'') or (EditSwitchATMPorts.Text<>'') or
     (EditSwitchFDDIPorts.Text<>'') or (EditSwitchEFEPorts.Text<>'')) then
  SpeedButtonAddSwitch.Enabled:=True
 else SpeedButtonAddSwitch.Enabled:=False;
end;


//�������� ������� �������� ������������
procedure TFormDB.BitBtnSwitchTimeClick(Sender: TObject);
var i,j,k:integer;
	temp: DB_Komm_Params;
begin
	for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
		for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
			FormSwTime.StringGrid1.Cells[i,j]:='0';

	for k:=0 to Komm_List.Count-1 do
		begin
        temp:=Komm_list.Items[k];
		if temp^.Prod_Name_=ListBoxSwitches.Items[ListBoxSwitches.ItemIndex] then
        	begin
        	Komm_Elem:=Komm_list.Items[k];
			for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
				for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
					FormSwTime.StringGrid1.Cells[i,j]:=FloatToStr(Komm_Elem^.Switches[i+1,j+1]*1000);
            end;
        end;

    FormSwTime.StringGrid1.Repaint;
	if (FormSwTime.ShowModal=mrOk) then
		begin
		for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
			for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
				Komm_Elem^.Switches[i+1,j+1]:=
				(StrToFloat(FormSwTime.StringGrid1.Cells[i,j]))*0.001;
		end;
end;

//������ ������ "��������" ��� �������������
procedure TFormDB.SpeedButtonAddHubClick(Sender: TObject);
var i,j:integer;
    fl:boolean;
begin
 if Konc_List.Count<>0 then
  for i:=0 to Konc_List.Count-1 do // ��������� ���� �� � ��
   begin                           // ����. � ����� ������
    Konc_Elem:=Konc_list.Items[i];
    if EditHubModel.Text=Konc_Elem^.Prod_Name_ then
     begin
      MessageDlg('����� ������������ ��� ������� � ���� ������ ��� �� �������� � ��� ��������.',
        mtError,[mbOk], 0);
      Exit;
     end;
   end;

  // ����� ��������� ����������� � ��
 New(Konc_Elem);

 Konc_Elem^.Producer_:=EditHubManufacturer.Text; // �������������
 Konc_Elem^.Prod_Name_:=EditHubModel.Text; // ��������
 Konc_Elem^.Cost_:=StrToInt(EditHubPrice.Text); // ���������

 if CheckBoxHubE.Checked then // ����� Ethernet
  begin
   Konc_Elem^.Eth_PortNumber_:=StrToInt(EditHubEPorts.Text);
   Konc_Elem^.Eth_Type:=ComboBoxHubEMedia.Text;
  end
 else Konc_Elem^.Eth_PortNumber_:=0;

 if CheckBoxHubFE.Checked then // ����� Fast Eth.
  begin
   Konc_Elem^.F_Eth_PortNumber_:=StrToInt(EditHubFEPorts.Text);
   Konc_Elem^.F_Eth_Type:=ComboBoxHubFEMedia.Text;
  end
 else Konc_Elem^.F_Eth_PortNumber_:=0;

 if CheckBoxHubGE.Checked then // ����� Gigabit Ethernet
  Konc_Elem^.G_Eth_PortNumber_:=StrToInt(EditHubGEPorts.Text)
 else Konc_Elem^.G_Eth_PortNumber_:=0;

 if CheckBoxHubATM.Checked then // ����� ATM
  Konc_Elem^.ATM_PortNumber_:=StrToInt(EditHubATMPorts.Text)
 else Konc_Elem^.ATM_PortNumber_:=0;

 if CheckBoxHubFDDI.Checked then // ����� FDDI
  Konc_Elem^.FDDI_PortNumber_:=StrToInt(EditHubFDDIPorts.Text)
 else Konc_Elem^.FDDI_PortNumber_:=0;

 if CheckBoxHubEFE.Checked then // ����� 10/100
  Konc_Elem^.E_F_Eth_PortNumber_:=StrToInt(EditHubEFEPorts.Text)
 else Konc_Elem^.E_F_Eth_PortNumber_:=0;

 Konc_List.Add(Konc_Elem); // ����������  � ������ �� � �������������

 ListBoxHubs.Items.Add(Konc_Elem^.Prod_Name_); // ��������� ��� � ListBox

 EditHubManufacturer.Text:=''; // ������� ��� Edit
 EditHubModel.Text:='';
 EditHubEPorts.Text:='';
 EditHubFEPorts.Text:='';
 EditHubGEPorts.Text:='';
 EditHubATMPorts.Text:='';
 EditHubFDDIPorts.Text:='';
 EditHubEFEPorts.Text:='';
 EditHubPrice.Text:='';
 CheckBoxHubE.Checked:=False;
 CheckBoxHubFE.Checked:=False;
 CheckBoxHubGE.Checked:=False;
 CheckBoxHubATM.Checked:=False;
 CheckBoxHubFDDI.Checked:=False;
 CheckBoxHubEFE.Checked:=False;
 ComboBoxHubEMedia.ItemIndex:=-1;
 ComboBoxHubFEMedia.ItemIndex:=-1;

 Form20.ComboBox2.Items.Clear;
 for i:=0 to Konc_List.Count-1 do
  begin
   Konc_Elem:=Konc_List[i];
   fl:=true;
   for j:=0 to Form20.ComboBox2.Items.Count-1 do
    if Konc_Elem^.Producer_=Form20.ComboBox2.Items[j] then
     fl:=false;
   if fl=true then
    Form20.ComboBox2.Items.Add(Konc_Elem^.Producer_);
  end;

end;

procedure TFormDB.ListBoxHubsClick(Sender: TObject);
var i:integer;
begin
// ���������� ���������� � �����������
 View2_:=True;
 SpeedButtonDelHub.Enabled:=True;
 for i:=0 to Konc_List.Count-1 do
  begin
   Konc_Elem:=Konc_list.Items[i];
   if Konc_Elem^.Prod_Name_=ListBoxHubs.Items[ListBoxHubs.ItemIndex] then
    begin
     EditHubManufacturer.Text:=''; // ������� ��� Edit
     EditHubModel.Text:='';
     EditHubEPorts.Text:='';
     EditHubFEPorts.Text:='';
     EditHubGEPorts.Text:='';
     EditHubATMPorts.Text:='';
     EditHubFDDIPorts.Text:='';
     EditHubEFEPorts.Text:='';
     EditHubPrice.Text:='';
     CheckBoxHubE.Checked:=False;
     CheckBoxHubFE.Checked:=False;
     CheckBoxHubGE.Checked:=False;
     CheckBoxHubATM.Checked:=False;
     CheckBoxHubFDDI.Checked:=False;
     CheckBoxHubEFE.Checked:=False;
     ComboBoxHubEMedia.ItemIndex:=-1;
     ComboBoxHubFEMedia.ItemIndex:=-1;

     EditHubManufacturer.Text:=Konc_Elem^.Producer_;
     EditHubModel.Text:=Konc_Elem^.Prod_Name_;
     EditHubPrice.Text:=IntToStr(Konc_Elem^.Cost_);
     if Konc_Elem^.Eth_PortNumber_<>0 then
      begin
       CheckBoxHubE.Checked:=True;
       EditHubEPorts.Text:=IntToStr(Konc_Elem^.Eth_PortNumber_);
       ComboBoxHubEMedia.ItemIndex:=ComboBoxHubEMedia.Items.IndexOf(Konc_Elem^.Eth_Type);
      end;
     if Konc_Elem^.F_Eth_PortNumber_<>0 then
      begin
       CheckBoxHubFE.Checked:=True;
       EditHubFEPorts.Text:=IntToStr(Konc_Elem^.F_Eth_PortNumber_);
       ComboBoxHubFEMedia.ItemIndex:=ComboBoxHubFEMedia.Items.IndexOf(Konc_Elem^.F_Eth_Type);
      end;
     if Konc_Elem^.G_Eth_PortNumber_<>0 then
      begin
       CheckBoxHubGE.Checked:=True;
       EditHubGEPorts.Text:=IntToStr(Konc_Elem^.G_Eth_PortNumber_);
      end;
     if Konc_Elem^.ATM_PortNumber_<>0 then
      begin
       CheckBoxHubATM.Checked:=True;
       EditHubATMPorts.Text:=IntToStr(Konc_Elem^.ATM_PortNumber_);
      end;
     if Konc_Elem^.FDDI_PortNumber_<>0 then
      begin
       CheckBoxHubFDDI.Checked:=True;
       EditHubFDDIPorts.Text:=IntToStr(Konc_Elem^.FDDI_PortNumber_);
      end;
     if Konc_Elem^.E_F_Eth_PortNumber_<>0 then
      begin
       CheckBoxHubEFE.Checked:=True;
       EditHubEFEPorts.Text:=IntToStr(Konc_Elem^.E_F_Eth_PortNumber_);
      end;
    end;
  end;
 SpeedButtonAddHub.Enabled:=False;
end;

procedure TFormDB.CheckBoxHubEClick(Sender: TObject);
begin
 if CheckBoxHubE.Checked then
  begin
   EditHubEPorts.Enabled:=True;
   ComboBoxHubEMedia.Enabled:=True;
   EditHubFEPorts.Enabled:=False;
   ComboBoxHubFEMedia.Enabled:=False;
  end
end;

procedure TFormDB.CheckBoxHubFEClick(Sender: TObject);
begin
 if CheckBoxHubFE.Checked then
  begin
   EditHubFEPorts.Enabled:=True;
   ComboBoxHubFEMedia.Enabled:=True;
   EditHubEPorts.Enabled:=False;
   ComboBoxHubEMedia.Enabled:=False;
  end
end;

procedure TFormDB.CheckBoxHubGEClick(Sender: TObject);
begin
 if CheckBoxHubGE.Checked then
  EditHubGEPorts.Enabled:=True
 else
  EditHubGEPorts.Enabled:=False;
end;

procedure TFormDB.CheckBoxHubATMClick(Sender: TObject);
begin
 if CheckBoxHubATM.Checked then
  EditHubATMPorts.Enabled:=True
 else
  EditHubATMPorts.Enabled:=False;
end;

procedure TFormDB.CheckBoxHubFDDIClick(Sender: TObject);
begin
 if CheckBoxHubFDDI.Checked then
  EditHubFDDIPorts.Enabled:=True
 else
  EditHubFDDIPorts.Enabled:=False;
end;

procedure TFormDB.CheckBoxHubEFEClick(Sender: TObject);
begin
 if CheckBoxHubEFE.Checked then
  EditHubEFEPorts.Enabled:=True
 else
  EditHubEFEPorts.Enabled:=False;
end;

procedure TFormDB.EditHubManufacturerEnter(Sender: TObject);
begin
 if View2_=True then
  begin
   EditHubManufacturer.Text:='';
   EditHubModel.Text:='';
   EditHubEPorts.Text:='';
   EditHubFEPorts.Text:='';
   EditHubGEPorts.Text:='';
   EditHubATMPorts.Text:='';
   EditHubFDDIPorts.Text:='';
   EditHubPrice.Text:='';
   EditHubEFEPorts.Text:='';
   CheckBoxHubE.Checked:=False;
   CheckBoxHubFE.Checked:=False;
   CheckBoxHubGE.Checked:=False;
   CheckBoxHubATM.Checked:=False;
   CheckBoxHubFDDI.Checked:=False;
   CheckBoxHubEFE.Checked:=False;
   View2_:=False;
   SpeedButtonDelHub.Enabled:=False;
   ComboBoxHubEMedia.ItemIndex:=-1;
   ComboBoxHubFEMedia.ItemIndex:=-1;
  end;
end;

procedure TFormDB.EditHubManufacturerChange(Sender: TObject);
begin
 if (Sender as TEdit).Text=' ' then (Sender as TEdit).Text:='';
 if (EditHubManufacturer.Text<>'') and (EditHubModel.Text<>'') and
    (EditHubPrice.Text<>'') and
    ((EditHubEPorts.Text<>'') or (EditHubFEPorts.Text<>'') or
     (EditHubGEPorts.Text<>'') or (EditHubATMPorts.Text<>'') or
     (EditHubFDDIPorts.Text<>'') or (EditHubEFEPorts.Text<>'')) then
  SpeedButtonAddHub.Enabled:=True
 else SpeedButtonAddHub.Enabled:=False;
end;

procedure TFormDB.EditHubEPortsChange(Sender: TObject);
begin
 if StrToIntDef((Sender as TEdit).Text,0)=0 then
  begin
   SpeedButtonAddHub.Enabled:=False;
   (Sender as TEdit).Text:='';
  end;

 if (EditHubManufacturer.Text<>'') and (EditHubModel.Text<>'') and
    (EditHubPrice.Text<>'') and
    ((EditHubEPorts.Text<>'') or (EditHubFEPorts.Text<>'') or
     (EditHubGEPorts.Text<>'') or (EditHubATMPorts.Text<>'') or
     (EditHubFDDIPorts.Text<>'') or (EditHubEFEPorts.Text<>'')) then
  SpeedButtonAddHub.Enabled:=True
 else SpeedButtonAddHub.Enabled:=False;
end;


procedure TFormDB.SpeedButtonDelHubClick(Sender: TObject);
begin
 EditHubManufacturer.Text:='';
 EditHubModel.Text:='';
 EditHubEPorts.Text:='';
 EditHubFEPorts.Text:='';
 EditHubGEPorts.Text:='';
 EditHubATMPorts.Text:='';
 EditHubFDDIPorts.Text:='';
 EditHubPrice.Text:='';
 EditHubEFEPorts.Text:='';
 CheckBoxHubE.Checked:=False;
 CheckBoxHubFE.Checked:=False;
 CheckBoxHubGE.Checked:=False;
 CheckBoxHubATM.Checked:=False;
 CheckBoxHubFDDI.Checked:=False;
 CheckBoxHubEFE.Checked:=False;
 ComboBoxHubEMedia.ItemIndex:=-1;
 ComboBoxHubFEMedia.ItemIndex:=-1;
 // �������� �����������
 Konc_List.Delete(ListBoxHubs.ItemIndex);
 ListBoxHubs.Items.Delete(ListBoxHubs.ItemIndex);
end;

procedure TFormDB.SpeedButtonDelOSClick(Sender: TObject);
 var i : Integer;
begin
 for i:=0 to Main_DB.Count-1 do
 begin
  DB_Elem := Main_DB.Items[i];
  if (DB_Elem.Type_='���� ������� ������������ ������')and
     (DB_Elem.Name_=ListBoxOSs.Items[ListBoxOSs.ItemIndex])then
    begin
       Main_DB.Remove(DB_Elem);
       ListBoxOSs.Items.Delete(ListBoxOSs.ItemIndex);
       Dispose(DB_Elem);
       ComboBoxElemTypeChange(nil);
       SpeedButtonDelOS.Enabled:=False;
       exit;

     end;
 end;
end;

procedure TFormDB.ListBoxOSsClick(Sender: TObject);
begin
   if ListBoxOSs.Selected[ListBoxOSs.ItemIndex]=True then
     SpeedButtonDelOS.Enabled:=True
  else SpeedButtonDelOS.Enabled:=False;
end;

procedure TFormDB.ButtDelSoftClick(Sender: TObject);
 var i : Integer;
begin
 for i:=0 to Main_DB.Count-1 do
 begin
  DB_Elem := Main_DB.Items[i];
  if (DB_Elem.Type_='����������� �����������')and
     (DB_Elem.Name_=ListBoxSofts.Items[ListBoxSofts.ItemIndex])then
    begin
       Main_DB.Remove(DB_Elem);
       ListBoxSofts.Items.Delete(ListBoxSofts.ItemIndex);
       Dispose(DB_Elem);
       ComboBoxElemTypeChange(nil);
       ButtDelSoft.Enabled:=False;
       exit;
     end;
 end;
end;

procedure TFormDB.SpeedButtonDelCPUClick(Sender: TObject);
var i : Integer;
begin
 for i:=0 to Main_DB.Count-1 do
 begin
  DB_Elem := Main_DB.Items[i];
  if (DB_Elem.Type_='����������')and
     (DB_Elem.Name_=ListBoxCPUs.Items[ListBoxCPUs.ItemIndex])then
    begin
       Main_DB.Remove(DB_Elem);
       ListBoxCPUs.Items.Delete(ListBoxCPUs.ItemIndex);
       Dispose(DB_Elem);
       ComboBoxElemTypeChange(nil);
       SpeedButtonDelCPU.Enabled:=False;
       exit;
     end;
 end;
end;

procedure TFormDB.SpeedButtonDelPhLayerClick(Sender: TObject);
var i:integer;
begin
   for i:=0 to Prot_List.Count-1 do
 begin
  Prot_Elem := Prot_List.Items[i];
  if (Prot_Elem^.Prot_=ListBoxPhLayer.Items[ListBoxPhLayer.ItemIndex]) then
    begin
       Prot_List.Remove(Prot_Elem);
       ListBoxPhLayer.Items.Delete(ListBoxPhLayer.ItemIndex);
       Dispose(Prot_Elem);
       ListBoxMedia.Clear;
       SpeedButtonDelPhLayer.Enabled:=False;
       exit;
    end;
 end;
end;

procedure TFormDB.ListBoxPhLayerClick(Sender: TObject);
begin
  Edit11.Text:='';
  if ListBoxPhLayer.Selected[ListBoxPhLayer.ItemIndex]=True then
    begin
     SpeedButtonDelMedia.Enabled:=False;
     SpeedButtonDelPhLayer.Enabled:=True;
     SpeedButtonAddMedia.Enabled:=True;
    end
  else
    begin
     SpeedButtonDelPhLayer.Enabled:=False;
     SpeedButtonAddMedia.Enabled:=False;
    end;
end;

procedure TFormDB.SpeedButtonDelMediaClick(Sender: TObject);
var i:integer;
begin
   for i:=0 to Prot_List.Count-1 do
 begin
  Prot_Elem := Prot_List.Items[i];
  if ( (Prot_Elem^.Prot_=ListBoxPhLayer.Items[ListBoxPhLayer.ItemIndex]) and
       (Prot_Elem^.Con_=ListBoxMedia.Items[ListBoxMedia.ItemIndex])) then
    begin
       Prot_List.Remove(Prot_Elem);
       ListBoxMedia.Items.Delete(ListBoxMedia.ItemIndex);
       Dispose(Prot_Elem);
       SpeedButtonDelMedia.Enabled:=False;
       exit;
    end;
 end;
end;

procedure TFormDB.ListBoxMediaClick(Sender: TObject);
begin
  if ListBoxMedia.Selected[ListBoxMedia.ItemIndex]=True then
     begin
      if ListBoxMedia.Items.Count<>1 then
      SpeedButtonDelMedia.Enabled:=True
     end
  else SpeedButtonDelMedia.Enabled:=False;

end;
procedure TFormDB.SpeedButtonChCostClick(Sender: TObject);
begin
   Cost_:=StrToIntDef(StringGridCost.Cells[1,StringGridCost.Row],0);
   Name_:=StringGridCost.Cells[0,StringGridCost.Row];
   CostChangeForm.ShowModal;
end;

procedure TFormDB.StringGrid1DClick(Sender: TObject);
begin
     SpeedButtonChCostClick(Sender);
end;

//������ ������ "��������" ��� �����������
procedure TFormDB.SpeedButtonModifySwitchClick(Sender: TObject);
var i,j:integer;
    fl:boolean;
begin
 if Komm_List.Count<>0 then
  fl:=false;
  for i:=0 to Komm_List.Count-1 do // ��������� ���� �� � ��
   begin                           // �����. � ����� ������
    Komm_Elem:=Komm_list.Items[i];
    if EditSwitchModel.Text=Komm_Elem^.Prod_Name_ then
      begin
        fl:=true;
        break;
      end;
   end;
   if fl=false then
    begin
      MessageDlg('��� ������ ����������� � ���� ������',
        mtError,[mbOk], 0);
      Exit;
    end;

  // �������� ���������� � ��
 Komm_Elem^.Producer_:=EditSwitchManufacturer.Text; // �������������
 Komm_Elem^.Prod_Name_:=EditSwitchModel.Text; // ��������
 Komm_Elem^.Int_Bus_:=StrToFloat(EditSwitchBusCapacity.Text); // ����
 Komm_Elem^.Cost_:=StrToInt(EditSwitchPrice.Text); // ���������

 if CheckBoxSwitchE.Checked then // ����� Ethernet
  begin
   Komm_Elem^.Eth_PortNumber_:=StrToInt(EditSwitchEPorts.Text);
   Komm_Elem^.Eth_Type:=ComboBoxSwitchEMedia.Text;
  end
 else Komm_Elem^.Eth_PortNumber_:=0;

 if CheckBoxSwitchFE.Checked then // ����� Fast Eth.
  begin
   Komm_Elem^.F_Eth_PortNumber_:=StrToInt(EditSwitchFEPorts.Text);
   Komm_Elem^.F_Eth_Type:=ComboBoxSwitchFEMedia.Text;
  end
 else Komm_Elem^.F_Eth_PortNumber_:=0;

 if CheckBoxSwitchGE.Checked then // ����� Gigabit Ethernet
  Komm_Elem^.G_Eth_PortNumber_:=StrToInt(EditSwitchGEPorts.Text)
 else Komm_Elem^.G_Eth_PortNumber_:=0;

 if CheckBoxSwitchATM.Checked then // ����� ATM
  Komm_Elem^.ATM_PortNumber_:=StrToInt(EditSwitchATMPorts.Text)
 else Komm_Elem^.ATM_PortNumber_:=0;

 if CheckBoxSwitchFDDI.Checked then // ����� FDDI
  Komm_Elem^.FDDI_PortNumber_:=StrToInt(EditSwitchFDDIPorts.Text)
 else Komm_Elem^.FDDI_PortNumber_:=0;

 if CheckBoxSwitchEFE.Checked then // ����� 10/100
  Komm_Elem^.E_F_Eth_PortNumber_:=StrToInt(EditSwitchEFEPorts.Text)
 else Komm_Elem^.E_F_Eth_PortNumber_:=0;

 if RadioButtonFullDup.Checked then // ������������
  Komm_Elem^.Duplex_:=True
 else Komm_Elem^.Duplex_:=False;

 for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
  for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
   begin
    Komm_Elem^.Switches[i+1,j+1]:=
       (StrToFloat(FormSwTime.StringGrid1.Cells[i,j]))*0.001;
    FormSwTime.StringGrid1.Cells[i,j]:='0';
   end;

// Komm_List.Add(Komm_Elem); // ����������  � ����� �� � �������������

// ListBoxSwitches.Items.Add(Komm_Elem^.Prod_Name_); // ��������� ��� � ListBox

 SwitchClear;

 Form6.ComboBox2.Items.Clear;
 for i:=0 to Komm_List.Count-1 do
 begin
   Komm_Elem:=Komm_List[i];
   fl:=true;
   for j:=0 to Form6.ComboBox2.Items.Count-1 do
     if Komm_Elem^.Producer_=Form6.ComboBox2.Items[j] then
       fl:=false;
   if fl=true then
     Form6.ComboBox2.Items.Add(Komm_Elem^.Producer_);
 end;
end;

//������ ������ "��������" ��� ����� �������
procedure TFormDB.SpeedButtonModifyAPClick(Sender: TObject);
var i,j:integer;
    fl:boolean;
begin
 if AP_List.Count<>0 then
  fl:=false;
  for i:=0 to AP_List.Count-1 do // ��������� ���� �� � ��
   begin                           // AP. � ����� ������
    AP_Elem:=AP_list.Items[i];
    if EditAPModel.Text=AP_Elem^.Prod_Name_ then
      begin
        fl:=true;
        break;
      end;
   end;
   if fl=false then
    begin
      MessageDlg('��� ����� ����� ������� � ���� ������',
        mtError,[mbOk], 0);
      Exit;
    end;

  // �������� AP � ��
 AP_Elem^.Producer_:=EditAPManufacturer.Text; // �������������
 AP_Elem^.Prod_Name_:=EditAPModel.Text; // ��������
 AP_Elem^.Int_Bus_:=StrToFloat(EditAPBusCapacity.Text); // ����
 AP_Elem^.Cost_:=StrToInt(EditAPPrice.Text); // ���������

 if CheckBoxAPE.Checked then // ����� Ethernet
  begin
   AP_Elem^.Eth_PortNumber_:=StrToInt(EditAPEPorts.Text);
   AP_Elem^.Eth_Type:=ComboBoxAPEMedia.Text;
  end
 else AP_Elem^.Eth_PortNumber_:=0;

 if CheckBoxAPFE.Checked then // ����� Fast Eth.
  begin
   AP_Elem^.F_Eth_PortNumber_:=StrToInt(EditAPFEPorts.Text);
   AP_Elem^.F_Eth_Type:=ComboBoxAPFEMedia.Text;
  end
 else AP_Elem^.F_Eth_PortNumber_:=0;

 if CheckBoxAPGE.Checked then // ����� Gigabit Ethernet
  AP_Elem^.G_Eth_PortNumber_:=StrToInt(EditAPGEPorts.Text)
 else AP_Elem^.G_Eth_PortNumber_:=0;

 if CheckBoxAPEFE.Checked then // ����� 10/100
  AP_Elem^.E_F_Eth_PortNumber_:=StrToInt(EditAPEFEPorts.Text)
 else AP_Elem^.E_F_Eth_PortNumber_:=0;

 if RadioButtonAPFullDup.Checked then // ������������
  AP_Elem^.Duplex_:=True
 else AP_Elem^.Duplex_:=False;

 for i:=0 to FormSwTime.StringGrid1.ColCount-1 do
  for j:=0 to FormSwTime.StringGrid1.RowCount-1 do
   begin
    Komm_Elem^.Switches[i+1,j+1]:=
       (StrToFloat(FormSwTime.StringGrid1.Cells[i,j]))*0.001;
    FormSwTime.StringGrid1.Cells[i,j]:='0';
   end;

// Komm_List.Add(Komm_Elem); // ����������  � ����� �� � �������������

// ListBoxSwitches.Items.Add(Komm_Elem^.Prod_Name_); // ��������� ��� � ListBox

 APClear;

 Form1.ComboBox2.Items.Clear;
 for i:=0 to AP_List.Count-1 do
 begin
   AP_Elem:=AP_List[i];
   fl:=true;
   for j:=0 to Form1.ComboBox2.Items.Count-1 do
     if AP_Elem^.Producer_=Form1.ComboBox2.Items[j] then
       fl:=false;
   if fl=true then
     Form1.ComboBox2.Items.Add(AP_Elem^.Producer_);
 end;
end;

procedure TFormDB.SpeedButtonNewSwitchClick(Sender: TObject);
begin
 SwitchClear;
 SpeedButtonAddSwitch.Enabled:=True;
 SpeedButtonDelSwitch.Enabled:=False;
 SpeedButtonModifySwitch.Enabled:=False;
end;

procedure TFormDB.SpeedButtonNewAPClick(Sender: TObject);
begin
 APClear;
 SpeedButtonAddAP.Enabled:=True;
 SpeedButtonDelAP.Enabled:=False;
 SpeedButtonModifyAP.Enabled:=False;
end;

end.
