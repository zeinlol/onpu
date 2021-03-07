unit MyChart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TMyChart = class(TPaintBox)
  private
    { Private declarations }
    fGroupNum: integer; // кол-во групп столбцов
    fGroupColNum: integer; // кол-во столбцов в группе
    fData: array [1..1000,1..1000] of integer; // Данные
            //    о гистограмме (максимально 1000х1000)
    fHorText: string; // горизонтальный текст
    fVertText: string; // вертикальный текст
    fMax: integer; // максимальное значение
    fMin: integer; // мнимальное значение
    fInc: integer; // прирощение по вертикальной оси

    function GetArrayData(Index1,Index2: integer): integer;
    procedure SetArrayData(Index1,Index2,NewData: integer);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    procedure Paint; override;

//    property Data: array [1..1000,1..1000] of integer read fData write fData;
    property Data[Index1,Index2: integer]: integer read GetArrayData write SetArrayData;
  published
    { Published declarations }
    property GroupNum: integer read fGroupNum write fGroupNum;
    property GroupColNum: integer read fGroupColNum write fGroupColNum;
    property HorText: string read fHorText write fHorText;
    property VertText: string read fVertText write fVertText;
    property Max: integer read fMax write fMax;
    property Min: integer read fMin write fMin;
    property Inc: integer read fInc write fInc;
  end;

procedure Register;

implementation

{$R MyChart.res}


{                    GroupNum =1
                     GroupColNum =3

        |
V  Max -|-
e       |               |------------|
r      -|-              |            |------------|
t       |               |            |            |
       -|-  |-----------|            |            |
T       |   |           |     67     |            |
e      -|-  |           |            |            |
x       |   |           |            |            |
t      -|-  |           |            |            |
    Min |___|___________|____________|____________|_______

                          HorizText
}

procedure Register;
begin
  RegisterComponents('Samples', [TMyChart]);
end;

constructor TMyChart.Create(AOwner : TComponent);
var i,j:integer;
begin
 inherited Create(AOwner);
 Width:=250;
 Height:=175;

 GroupNum:=2;
 GroupColNum:=10;
 HorText:='Значения по Х';
 VertText:='Значения по Y';
 Max:=100;
 Min:=0;
 Inc:=10;

 Randomize; // need to delete
 for i:=1 to GroupNum do
  for j:=1 to GroupColNum do
   Data[i,j]:=Random(Max);
 Data[1,1]:=Max;

// CreateFont(0,0,3,3,400,False,False,False,OEM_CHARSET,OUT_DEFAULT_PRECIS,CLIP_DEFAULT_PRECIS,DEFAULT_QUALITY,0,0);
end;

procedure TMyChart.Paint;
var i,j,z,delta,left: integer; // служебные
    Hist_Width: integer; // ширина одной гистограмы
    R: TRect;
begin
 inherited Paint;
 Canvas.Brush.Color:=clWhite;
 Canvas.FillRect(ClientRect);

 // setting width of the MyCHART
 Hist_Width:=trunc((Width-60-20*GroupNum)/(GroupNum*GroupColNum));
 z:=0;
 for i:=1 to GroupNum do
  for j:=1 to GroupColNum do
   if z<Canvas.Textwidth(IntToStr(Data[i,j])) then
      z:=Canvas.Textwidth(IntToStr(Data[i,j]));
 i:=Width;
 Align:=alNone;
 while Hist_width<z do
  begin
   i:=i+5;
   Hist_Width:=trunc((i-60-20*GroupNum)/(GroupNum*GroupColNum));
  end;
 Width:=i;

 Canvas.Pen.Color:=clBlack; // drawing X & Y axis
 Canvas.Pen.Width:=2;
 Canvas.MoveTo(40,10);
 Canvas.LineTo(40,Height-20);
 Canvas.LineTo(Width-20,Height-20);

 Canvas.Pen.Width:=1;
 i:=Min;
 j:=0;
 delta:=Trunc((Height-35)/((Max-Min)/Inc));
 while i<=Max do // Drawing digits on vrtical axis
  begin
   Canvas.MoveTo(36,
     Trunc((Height-20)-j*delta));
   Canvas.LineTo(44,
     Trunc((Height-20)-j*delta));
   Canvas.TextOut(
     32-Canvas.TextWidth(IntToStr(Min+j*Inc)),
     Trunc((Height-20)-j*delta)-6,
     IntToStr(Min+j*Inc));
   i:=i+Inc;
   j:=j+1;
  end;
 Canvas.TextOut(
   Trunc((Width-Canvas.TextWidth(HorText))/2),
   Height-Canvas.TextHeight(HorText)-3,
   HorText);
 left:=60;
 for i:=1 to GroupNum do
  begin
   for j:=1 to GroupColNum do
    begin
     case j of
      1: Canvas.Brush.Color:=clRed;
      2: Canvas.Brush.Color:=clGreen;
      3: Canvas.Brush.Color:=clNavy;
      4: Canvas.Brush.Color:=clFuchsia;
      5: Canvas.Brush.Color:=clLtGray;
      6: Canvas.Brush.Color:=clMaroon;
      7: Canvas.Brush.Color:=clOlive;
      8: Canvas.Brush.Color:=clPurple;
      9: Canvas.Brush.Color:=clBlack;
      10: Canvas.Brush.Color:=$002C8CD3;
     end;
     R.Left:=left;
     R.Top:=Height-20-trunc((Height-35)/(Max)*Data[i,j]);
     R.Right:=left+hist_width;
     R.Bottom:=Height-21;
     Canvas.FillRect(R);

     Canvas.Font.Color:=clWhite;

     if Canvas.TextHeight('0')<R.Bottom-R.Top then
      Canvas.TextOut(
             trunc((R.Right+R.Left)/2-Canvas.Textwidth(IntToStr(Data[i,j]))/2),
             trunc((R.Bottom+R.Top)/2-Canvas.TextHeight('0')/2),
             IntToStr(Data[i,j]))
     else
      begin
       Canvas.Font.Color:=clBlack;
       Canvas.Brush.Color:=clWhite;
       Canvas.TextOut(
             trunc((R.Right+R.Left)/2-Canvas.Textwidth(IntToStr(Data[i,j]))/2),
             R.Top-Canvas.TextHeight('0')-2,
             IntToStr(Data[i,j]));
      end;


     left:=left+hist_width;
    end;
   left:=left+20;
  end;
end;


function TMyChart.GetArrayData(Index1,Index2: integer): integer;
begin
 Result:=fData[Index1,Index2];
end;

procedure TMyChart.SetArrayData(Index1,Index2,NewData: integer);
begin
 if NewData <> Data[Index1,Index2] then
  begin
   fData[Index1,Index2]:=NewData;
   Update;
  end;
end;

end.
