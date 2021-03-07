// ********************************************************************
//  setup.pas
//
//  Общие настройки
//  
// ********************************************************************

unit setup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, ExtCtrls, Spin;

type
  TSetupForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Bevel1: TBevel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBox3: TCheckBox;
    Label3: TLabel;
    CheckBox4: TCheckBox;
    EditMRUCount: TEdit;
    UpDown2: TUpDown;
    CheckBox6: TCheckBox;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Bevel4: TBevel;
    Label6: TLabel;
    Bevel3: TBevel;
    Label9: TLabel;
    UpDown4: TUpDown;
    Edit4: TEdit;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    Label19: TLabel;
    Bevel7: TBevel;
    Label20: TLabel;
    Bevel8: TBevel;
    CheckBox27: TCheckBox;
    ComboBox1: TComboBox;
    CheckBox31: TCheckBox;
    ColorDialog1: TColorDialog;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Label12: TLabel;
    Label13: TLabel;
    SpinEdit6: TSpinEdit;
    Shape3: TShape;
    Label11: TLabel;
    SpinEdit5: TSpinEdit;
    Shape6: TShape;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    Bevel2: TBevel;
    Label15: TLabel;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Bevel5: TBevel;
    Label25: TLabel;
    CheckBoxUseScat: TCheckBox;
    CheckBoxUseImit: TCheckBox;
    EditImitInterval: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure RadioButton9Click(Sender: TObject);
    procedure RadioButton10Click(Sender: TObject);
    procedure RadioButton11Click(Sender: TObject);
    procedure RadioButton12Click(Sender: TObject);
    procedure RadioButton13Click(Sender: TObject);
    procedure RadioButton14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBoxUseScatClick(Sender: TObject);
    procedure CheckBoxUseImitClick(Sender: TObject);
    procedure Label21Click(Sender: TObject);
    procedure Label23Click(Sender: TObject);
    procedure Label28Click(Sender: TObject);
    procedure Label29Click(Sender: TObject);
    procedure Label30Click(Sender: TObject);
    procedure Label31Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetupForm: TSetupForm;

implementation

uses main;

{$R *.DFM}

procedure TSetupForm.CheckBox3Click(Sender: TObject);
begin
   EditMRUCount.Enabled:=CheckBox3.Checked;
   UpDown2.Enabled:=CheckBox3.Checked;
end;

procedure TSetupForm.CheckBox1Click(Sender: TObject);
begin
   Edit1.Enabled:=CheckBox1.Checked;
   UpDown1.Enabled:=CheckBox1.Checked;
end;

procedure TSetupForm.BitBtn1Click(Sender: TObject);
begin
 if CheckBox1.Checked=True then
 begin
   Setup_.AutoSave_:=True;
   Setup_.AutoSaveDelay_:=StrToIntDef(Edit1.Text,10);
   MainForm.Timer1.Enabled:=True;
   MainForm.Timer1.Interval:=Setup_.AutoSaveDelay_*1000*60;
 end
 else
   begin
   MainForm.Timer1.Enabled:=False;
   Setup_.AutoSave_:=False;
   end;

 if CheckBox3.Checked=True then
   Setup_.FileListFrom_:=StrToIntDef(EditMRUCount.Text,0)
 else
   Setup_.FileListFrom_:=0;

 Setup_.SaveIfChanged_:=CheckBox4.Checked;
 Setup_.ShowHints_:=CheckBox6.Checked;
// Application.ShowHint:=False;

 Setup_.OpenLastProjectOnEnter_:=CheckBox27.Checked;

 if CheckBox31.Checked=True then
  begin
   Setup_.ManyLanguages_:=True;
   Setup_.Language_:=ComboBox1.Text;
  end
 else
  begin
   Setup_.ManyLanguages_:=False;
   Setup_.Language_:='Русский язык';
  end;

 if RadioButton12.Checked=True then
  Setup_.ScreenGrid_:=1;
 if RadioButton13.Checked=True then
  Setup_.ScreenGrid_:=10;
 if RadioButton14.Checked=True then
  Setup_.ScreenGrid_:=20;
 if RadioButton11.Checked=True then
  Setup_.ScreenGrid_:=30;
 if RadioButton10.Checked=True then
  Setup_.ScreenGrid_:=40;
 if RadioButton9.Checked=True then
  Setup_.ScreenGrid_:=StrToIntDef(Edit4.Text,1);

 Setup_.UseImit := CheckBoxUseImit.Checked;
 Setup_.UseScat := CheckBoxUseScat.Checked;
 Setup_.ImitInterval := StrToIntDef(EditImitInterval.Text, 300);

// Setup_.HintBGcolor_:=Shape1.Brush.Color;
// Setup_.HintDelay_:=StrToIntDef(Edit3.Text,3000);

 Setup_.Color1:=Shape1.Brush.Color;
 Setup_.Color2:=Shape2.Brush.Color;
 Setup_.Color3:=Shape3.Brush.Color;
 Setup_.Color4:=Shape4.Brush.Color;
 Setup_.Color5:=Shape5.Brush.Color;
 Setup_.Color6:=Shape6.Brush.Color;
 Setup_.Width1:=SpinEdit1.Value;
 Setup_.Width2:=SpinEdit2.Value;
 Setup_.Width3:=SpinEdit3.Value;
 Setup_.Width4:=SpinEdit4.Value;
 Setup_.Width5:=SpinEdit5.Value;
 Setup_.Width6:=SpinEdit6.Value;

 Setup_.WS:=ComboBox2.Text;
 Setup_.Serv:=ComboBox3.Text;
 Setup_.Komm:=ComboBox4.Text;
 Setup_.Konc:=ComboBox5.Text;
 Setup_.MC:=ComboBox6.Text;
 Setup_.Wait:=ComboBox7.Text;

// Application.HintColor:=Setup_.HintBGcolor_;
// Application.HintHidePause:=Setup_.HintDelay_;
 Screen_Grid:=Setup_.ScreenGrid_;

 NeedRepaint:=True; 
end;


procedure TSetupForm.CheckBox31Click(Sender: TObject);
begin
    ComboBox1.Enabled:=CheckBox31.Checked;
end;

procedure TSetupForm.RadioButton9Click(Sender: TObject);
begin
   Edit4.Enabled:=RadioButton9.Checked;
   UpDown4.Enabled:=RadioButton9.Checked;
end;

procedure TSetupForm.RadioButton10Click(Sender: TObject);
begin
 Edit4.Enabled:=False;
 UpDown4.Enabled:=False;
end;

procedure TSetupForm.RadioButton11Click(Sender: TObject);
begin
 Edit4.Enabled:=False;
 UpDown4.Enabled:=False;
end;

procedure TSetupForm.RadioButton12Click(Sender: TObject);
begin
 Edit4.Enabled:=False;
 UpDown4.Enabled:=False;
end;

procedure TSetupForm.RadioButton13Click(Sender: TObject);
begin
 Edit4.Enabled:=False;
 UpDown4.Enabled:=False;
end;

procedure TSetupForm.RadioButton14Click(Sender: TObject);
begin
 Edit4.Enabled:=False;
 UpDown4.Enabled:=False;
end;

procedure TSetupForm.FormShow(Sender: TObject);
begin
 PageControl1.ActivePage := TabSheet2;

 if Setup_.AutoSave_=True then
 begin
   SetupForm.CheckBox1.Checked:=True;
   SetupForm.Edit1.Text:=IntToStr(Setup_.AutoSaveDelay_);
   SetupForm.Edit1.ENabled:=True;
   SetupForm.UpDown1.ENabled:=True;
 end
 else
 begin
   SetupForm.CheckBox1.Checked:=False;
   SetupForm.Edit1.Text:='0';
   SetupForm.Edit1.ENabled:=False;
   SetupForm.UpDown1.ENabled:=False;
 end;

 if Setup_.FileListFrom_<=0 then
 begin
   SetupForm.CheckBox3.Checked:=False;
   SetupForm.EditMRUCount.Text:='0';
   SetupForm.EditMRUCount.ENabled:=False;
   SetupForm.UpDown2.ENabled:=False;
 end
 else
 begin
   SetupForm.CheckBox3.Checked:=True;
   SetupForm.EditMRUCount.Text:=IntToStr(Setup_.FileListFrom_);
   SetupForm.EditMRUCount.ENabled:=True;
   SetupForm.UpDown2.ENabled:=True;
 end;

 CheckBox4.Checked:=Setup_.SaveIfChanged_;
 CheckBox6.Checked:=Setup_.ShowHints_;
 CheckBox27.Checked:=Setup_.OpenLastProjectOnEnter_;

 if Setup_.ManyLanguages_=True then
 begin
   CheckBox31.Checked:=True;
   ComboBox1.Enabled:=True;
   ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(Setup_.Language_);
 end
 else
 begin
   CheckBox31.Checked:=False;
   ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf('Русский язык');
   ComboBox1.Enabled:=False;
 end;

 if Setup_.ScreenGrid_=1 then
 begin
   RadioButton12.Checked:=True;
   Edit4.TExt:='0';
   Edit4.Enabled:=FAlse;
   UpDown4.Enabled:=FAlse;
 end;

 if Setup_.ScreenGrid_=10 then
 begin
   RadioButton13.Checked:=True;
   Edit4.TExt:='0';
   Edit4.Enabled:=FAlse;
   UpDown4.Enabled:=FAlse;
 end;

 if Setup_.ScreenGrid_=20 then
 begin
   RadioButton14.Checked:=True;
   Edit4.TExt:='0';
   Edit4.Enabled:=FAlse;
   UpDown4.Enabled:=FAlse;
 end;

 if Setup_.ScreenGrid_=30 then
 begin
   RadioButton11.Checked:=True;
   Edit4.TExt:='0';
   Edit4.Enabled:=FAlse;
   UpDown4.Enabled:=FAlse;
 end;

 if Setup_.ScreenGrid_=40 then
 begin
   RadioButton10.Checked:=True;
   Edit4.TExt:='0';
   Edit4.Enabled:=FAlse;
   UpDown4.Enabled:=FAlse;
 end;

  if (Setup_.ScreenGrid_<>1) and (Setup_.ScreenGrid_<>10) and
    (Setup_.ScreenGrid_<>20) and (Setup_.ScreenGrid_<>30) and
    (Setup_.ScreenGrid_<>40) then
  begin
   RadioButton9.Checked:=True;
   Edit4.TExt:=IntToStr(Setup_.ScreenGrid_);
   Edit4.Enabled:=True;
   UpDown4.Enabled:=True;
  end;

 CheckBoxUseImit.Checked := Setup_.UseImit;
 CheckBoxUseScat.Checked := Setup_.UseScat;
 EditImitInterval.Text := IntToStr(Setup_.ImitInterval);
 EditImitInterval.Enabled := CheckBoxUseImit.Checked;

// Shape1.Brush.Color:=Setup_.HintBGcolor_;
// Edit3.Text:=IntToStr(Setup_.HintDelay_);

 Shape1.Brush.Color:=Setup_.Color1;
 Shape2.Brush.Color:=Setup_.Color2;
 Shape3.Brush.Color:=Setup_.Color3;
 Shape4.Brush.Color:=Setup_.Color4;
 Shape5.Brush.Color:=Setup_.Color5;
 Shape6.Brush.Color:=Setup_.Color6;
 SpinEdit1.Value:=Setup_.Width1;
 SpinEdit2.Value:=Setup_.Width2;
 SpinEdit3.Value:=Setup_.Width3;
 SpinEdit4.Value:=Setup_.Width4;
 SpinEdit5.Value:=Setup_.Width5;
 SpinEdit6.Value:=Setup_.Width6;
end;

procedure TSetupForm.FormCreate(Sender: TObject);
begin
 ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(Setup_.WS);
 ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(Setup_.Serv);
 ComboBox4.ItemIndex:=ComboBox4.Items.IndexOf(Setup_.Komm);
 ComboBox5.ItemIndex:=ComboBox5.Items.IndexOf(Setup_.Konc);
 ComboBox6.ItemIndex:=ComboBox6.Items.IndexOf(Setup_.MC);
 ComboBox7.ItemIndex:=ComboBox7.Items.IndexOf(Setup_.Wait);
end;

procedure TSetupForm.CheckBoxUseScatClick(Sender: TObject);
begin
   if CheckBoxUseScat.Checked = False then
      CheckBoxUseImit.Checked := True;

   EditImitInterval.Enabled := CheckBoxUseImit.Checked;
end;

procedure TSetupForm.CheckBoxUseImitClick(Sender: TObject);
begin
   if CheckBoxUseImit.Checked = False then
      CheckBoxUseScat.Checked := True;

   EditImitInterval.Enabled := CheckBoxUseImit.Checked;
end;

//_====================================================
// Установка цвета для тонкого коаксиала
//_====================================================
procedure TSetupForm.Label21Click(Sender: TObject);
begin
	if ColorDialog1.Execute=True then
		Shape1.Brush.Color:=ColorDialog1.Color;
end;

//_====================================================
// Установка цвета для толстого коаксиала
//_====================================================
procedure TSetupForm.Label23Click(Sender: TObject);
begin
	if ColorDialog1.Execute=True then
		Shape2.Brush.Color:=ColorDialog1.Color;
end;

//_====================================================
// Установка цвета для неэкранированной витой пары
//_====================================================
procedure TSetupForm.Label28Click(Sender: TObject);
begin
	if ColorDialog1.Execute=True then
		Shape3.Brush.Color:=ColorDialog1.Color;
end;

//_====================================================
// Установка цвета для экранированной витой пары
//_====================================================
procedure TSetupForm.Label29Click(Sender: TObject);
begin
	if ColorDialog1.Execute=True then
		Shape4.Brush.Color:=ColorDialog1.Color;
end;

//_====================================================
// Установка цвета для одномодового волокна
//_====================================================
procedure TSetupForm.Label30Click(Sender: TObject);
begin
	if ColorDialog1.Execute=True then
		Shape5.Brush.Color:=ColorDialog1.Color;
end;

//_====================================================
// Установка цвета для многомодового волокна
//_====================================================
procedure TSetupForm.Label31Click(Sender: TObject);
begin
	if ColorDialog1.Execute=True then
		Shape6.Brush.Color:=ColorDialog1.Color;
end;

end.
