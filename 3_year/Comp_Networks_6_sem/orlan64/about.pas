// ********************************************************************
//  about.pas
//
// ********************************************************************

unit about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TFormAbout = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label4: TLabel;
    Image2: TImage;
    Image1: TImage;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

uses main;

{$R *.DFM}

procedure TFormAbout.Image2Click(Sender: TObject);
begin
 FormAbout.ModalResult:=1;
end;

end.
