unit find;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TForm10 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses main;

{$R *.DFM}

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
 Form10.ModalResult:=1;
end;

procedure TForm10.CheckBox1Click(Sender: TObject);
begin
 if CheckBox1.Checked=True then Edit2.Enabled:=true
 else Edit2.Enabled:=False;
end;

procedure TForm10.CheckBox4Click(Sender: TObject);
begin
 if CheckBox4.Checked=True then Edit3.Enabled:=true
 else Edit3.Enabled:=False;
end;

procedure TForm10.CheckBox5Click(Sender: TObject);
begin
 if CheckBox5.Checked=True then Edit4.Enabled:=true
 else Edit4.Enabled:=False;
end;

procedure TForm10.CheckBox2Click(Sender: TObject);
begin
 if CheckBox2.Checked=True then ComboBox1.Enabled:=true
 else ComboBox1.Enabled:=False;
end;

procedure TForm10.CheckBox6Click(Sender: TObject);
begin
 if CheckBox6.Checked=True then ComboBox2.Enabled:=true
 else ComboBox2.Enabled:=False;

end;

procedure TForm10.CheckBox7Click(Sender: TObject);
begin
 if CheckBox7.Checked=True then ComboBox3.Enabled:=true
 else ComboBox3.Enabled:=False;

end;

end.
