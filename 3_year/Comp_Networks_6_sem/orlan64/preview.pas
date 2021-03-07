unit preview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, orlan;

type
  TForm14 = class(TForm)
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;
  Field_: TImage;

implementation

uses main;

{$R *.DFM}

procedure TForm14.FormShow(Sender: TObject);
var i,Xmax,Ymax, Xmin, Ymin :integer;
    s:string;
    NewRect: TRect;
begin
 Field_.Canvas.Font.Color:=clRed;

 Form14.Height:=400;
 Form14.Width:=600;
 Xmax:=0;
 Xmin:=65000;
 Ymax:=0;
 Ymin:=65000;
 for i:=0 to Nodes.Count-1 do
  begin
   if TOrLAN(Nodes[i]).Left<Xmin then Xmin:=TOrLAN(Nodes[i]).Left;
   if TOrLAN(Nodes[i]).Top<Ymin then Ymin:=TOrLAN(Nodes[i]).Top;
   if TOrLAN(Nodes[i]).Left>Xmax then Xmax:=TOrLAN(Nodes[i]).Left;
   if TOrLAN(Nodes[i]).Top>Ymax then Ymax:=TOrLAN(Nodes[i]).Top;
  end;

 if (Xmax-Xmin)/(Ymax-Ymin)>=1.5 then
  begin
   Bevel1.Height:=trunc((Form14.ClientWidth-16)*(Ymax-Ymin)/(Xmax-Xmin));
   Bevel1.Width:=Form14.ClientWidth-16;
   Bevel1.Left:=8;
   Bevel1.Top:=trunc((Form14.ClientHeight-Bevel1.Height)/2);
  end
 else
  begin
   Bevel1.Width:=trunc((Form14.ClientHeight-16)*(Xmax-Xmin)/(Ymax-Ymin));
   Bevel1.Height:=Form14.ClientHeight-16;
   Bevel1.Left:=trunc((Form14.ClientWidth-Bevel1.Width)/2);
   Bevel1.Top:=8;
  end;

 Form14.Height:=Form14.Height+41;
 BitBtn1.Top:=Form14.Height-55;
 BitBtn1.Left:=trunc((Form14.ClientWidth-BitBtn1.Width)/2);


 Field_.BringToFront;
 Field_.Top:=Bevel1.Top+5;
 Field_.Left:=Bevel1.Left+5;
 Field_.Height:=Bevel1.Height-10;
 Field_.Width:=Bevel1.Width-10;

 NewRect := Rect(0,0,Field_.Width,Field_.Height);
 Field_.Canvas.Brush.Color:=clWhite;
 Field_.Canvas.FillRect(NewRect);

 for i:=0 to Nodes.Count-1 do
  begin
   if TOrLAN(Nodes[i]).NodeType='WS' then s:='C';
   if TOrLAN(Nodes[i]).NodeType='SERV' then s:='S';
   if TOrLAN(Nodes[i]).NodeType='KOMM' then s:='KM';
   if TOrLAN(Nodes[i]).NodeType='KONC' then s:='KC';

   Field_.Canvas.TextOut(
    trunc((TOrLAN(Nodes[i]).Left-Xmin-5)/(Xmax-Xmin)*(Field_.Width-30))+15,
    trunc((TOrLAN(Nodes[i]).Top-Ymin-5)/(Ymax-Ymin)*(Field_.Height-30))+15,s);

  end;

end;

procedure TForm14.FormCreate(Sender: TObject);
begin
 Field_:=TImage.Create(Self);// создание картинки
 Field_.Parent:=Form14; // для сохранения экрана
end;

procedure TForm14.FormDestroy(Sender: TObject);
begin
 Field_.Free;
end;

end.
