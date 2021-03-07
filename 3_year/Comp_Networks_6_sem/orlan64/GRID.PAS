unit grid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons;

type
  TForm11 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses main;

{$R *.DFM}

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
 Screen_Grid:=StrToInt(Edit1.Text);
end;

procedure TForm11.Edit1Change(Sender: TObject);
begin
 if StrToInt(Edit1.Text)>255 then Edit1.Text:='255';
 if StrToInt(Edit1.Text)<1 then Edit1.Text:='1';
end;

procedure TForm11.FormShow(Sender: TObject);
begin
 Edit1.Text:=IntToStr(Screen_Grid);
end;

end.
