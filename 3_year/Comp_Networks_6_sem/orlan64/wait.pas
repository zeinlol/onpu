unit wait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Gauges, ComCtrls, Buttons;

type
  TFormWait = class(TForm)
    Timer2: TTimer;
    Gauge1: TGauge;
    LabelMessage: TLabel;
    BitBtnCancel: TBitBtn;
    procedure Timer2Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Cancelled : Boolean;
  end;

var
  FormWait: TFormWait;
{  ss: cardinal;}

implementation

{$R *.DFM}

procedure TFormWait.Timer2Timer(Sender: TObject);
begin
{ inc(ss);
 Label3.Caption:='Прошло времени (чч, мм, сс) : '+
     IntToStr(Trunc(((ss div 60) div 60) mod 60))+ // hour
     ':'+IntToStr(Trunc((ss div 60) mod 60))+ // min
     ':'+IntToStr(Trunc(ss mod 60)); // sec
}
 Application.ProcessMessages;
end;

procedure TFormWait.FormShow(Sender: TObject);
begin
{ ss:=0;}
   Timer2.Enabled := True;
   Cancelled := False;
   BitBtnCancel.Visible := False;
end;

procedure TFormWait.FormHide(Sender: TObject);
begin
   Timer2.Enabled := False;
end;

procedure TFormWait.BitBtnCancelClick(Sender: TObject);
begin
   Cancelled := True;
end;

end.
