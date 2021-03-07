// ********************************************************************
//  report.pas
//
//  Создание отчета
//  
// ********************************************************************

unit report;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Printers, OrLAN;

type
  TReportForm = class(TForm)
    RichEdit1: TRichEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PrintDialog1: TPrintDialog;
    BitBtn3: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Cost_Count(Num: integer): integer;
    function Length_Count(S: string): integer;
    function Cost2_Count(S: string): integer;
  end;

var
  ReportForm: TReportForm;

implementation

uses main, wait, database, connect;

{$R *.DFM}

procedure TReportForm.FormShow(Sender: TObject);
var i,j,jj,k:integer;
    s:string;
begin
 FormWait.LabelMessage.Caption:='Идет создание отчета по проекту...';
 FormWait.Show;
 Application.ProcessMessages;

 RichEdit1.Clear;
 RichEdit1.SelAttributes.Color := clRed;// заголовок окна
 RichEdit1.SelAttributes.Size := 16;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Paragraph.Alignment:=taCenter;
 RichEdit1.Lines.Add('Проект: "'+Project_Name+'"');
 RichEdit1.Lines.Add('');
 jj:=0;
 RichEdit1.Paragraph.Alignment:=taLeftJustify;
 if number_of_workStations<>0 then
  begin
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. Рабочие станции.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='WS' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. Рабочая станция "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('Программное обеспечение "'+TOrLAN(Nodes[i]).WSParameters.Soft+'"');
      RichEdit1.Lines.Add('Процессор "'+TOrLAN(Nodes[i]).WSParameters.Processor+'"');
      RichEdit1.Lines.Add('Оперативная память '+IntToStr(TOrLAN(Nodes[i]).WSParameters.RAM)+' MBytes');
      RichEdit1.Lines.Add('Жесткий диск '+IntToStr(TOrLAN(Nodes[i]).WSParameters.HDD)+' MBytes');
      RichEdit1.Lines.Add('Сетевые карты ('+IntToStr(TOrLAN(Nodes[i]).Ports.Count)+')');
      for k:=0 to TOrLAN(NOdes[i]).Ports.Count-1 do
       begin
        s:=IntToStr(k+1)+'. ';
        s:=s+Port_Element(TOrLAN(NOdes[i]).Ports[k]).PortType;
        if Port_Element(TOrLAN(NOdes[i]).Ports[k]).IsUsed=True then
         s:=s+' (занята)'
        else
         s:=s+' (свободна)';
        RichEdit1.Lines.Add(s);
       end;
      if TOrLAN(Nodes[i]).WSParameters.RequestClass.Count<>0 then
       begin
        RichEdit1.Lines.Add('Классы заявок ('+IntToStr(TOrLAN(Nodes[i]).WSParameters.RequestClass.Count)+')');
        for k:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
         begin
          RichEdit1.Lines.Add(IntToStr(k+1)+
            '. Обрабатывается сервером "'+
            FormConnect.IDToName(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).ServID_)+'".');
          RichEdit1.Lines.Add(
            '   Размер запроса '+
            IntToStr(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).Size_)+
            ' байт. ');
          if Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).AnsSize_ > 0 then
             RichEdit1.Lines.Add(
               '   Размер ответа '+
               IntToStr(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).AnsSize_)+
               ' байт. ');
          RichEdit1.Lines.Add(
            '   Время подготовки на клиенте '+
            FloatToStrF(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).TimeWS * 1000,ffGeneral,4,4)+
            ' мс. ');
          RichEdit1.Lines.Add(
            '   Время обработки на сервере '+
            FloatToStrF(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).TimeServ * 1000,ffGeneral,4,4)+
            ' мс. ');
         end;
       end;
      RichEdit1.Lines.Add('Стоимость станции '+IntToStr(Cost_Count(i))+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 if number_of_Servers<>0 then
  begin
   RichEdit1.SelAttributes.Color := clRed;// заголовок окна
   RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. Серверы.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='SERV' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. Сервер "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('Программное обеспечение "'+TOrLAN(Nodes[i]).ServParameters.Soft+'"');
      RichEdit1.Lines.Add('Процессор "'+TOrLAN(Nodes[i]).ServParameters.Processor+'"');
      RichEdit1.Lines.Add('Количество процессоров - '+IntToStr(TOrLAN(Nodes[i]).ServParameters.NumberProc));
      RichEdit1.Lines.Add('Оперативная память '+IntToStr(TOrLAN(Nodes[i]).ServParameters.RAM)+' MBytes');
      RichEdit1.Lines.Add('Жесткий диск '+IntToStr(TOrLAN(Nodes[i]).ServParameters.HDD)+' MBytes');
      RichEdit1.Lines.Add('Тип сетевой ОС "'+TOrLAN(Nodes[i]).ServParameters.OSType+'"');
      RichEdit1.Lines.Add('Сетевые карты ('+IntToStr(TOrLAN(Nodes[i]).Ports.Count)+')');
      for k:=0 to TOrLAN(NOdes[i]).Ports.Count-1 do
       begin
        s:=IntToStr(k+1)+'. ';
        s:=s+Port_Element(TOrLAN(NOdes[i]).Ports[k]).PortType;
        if Port_Element(TOrLAN(NOdes[i]).Ports[k]).IsUsed=True then
         s:=s+' (занята)'
        else
         s:=s+' (свободна)';
        RichEdit1.Lines.Add(s);
       end;
      RichEdit1.Lines.Add('Стоимость сервера '+IntToStr(Cost_Count(i))+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 if number_of_Kommutators<>0 then
  begin
   RichEdit1.SelAttributes.Color := clRed;// заголовок окна
   RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. Коммутаторы.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='KOMM' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. Коммутатор "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('Производитель "'+TOrLAN(Nodes[i]).KommParameters.Producer+'"');
      RichEdit1.Lines.Add('Тип комутатора "'+TOrLAN(Nodes[i]).KommParameters.Prod_Name+'"');
      RichEdit1.Lines.Add('Порты комутатора');
      if TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber)+' портов Ethernet '
          +'[ '+TOrLAN(Nodes[i]).KommParameters.Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber)+' портов FastEthernet '
          +'[ '+TOrLAN(Nodes[i]).KommParameters.F_Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber)+' портов GigabitEthernet');
       end;
      if TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber)+' портов ATM');
       end;
      if TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber)+' портов FDDI');
       end;
      if TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber)+' портов 10/100');
       end;
      if TOrLAN(Nodes[i]).KommParameters.Duplex=True then
       RichEdit1.Lines.Add('Порты дуплексные')
      else
       RichEdit1.Lines.Add('Порты полудуплексные');
      RichEdit1.Lines.Add('Прорускная способность шины - '+FloatToStr(TOrLAN(Nodes[i]).KommParameters.Int_Bus)+' GBps');
      RichEdit1.Lines.Add('Стоимость коммутатора '+IntToStr(TOrLAN(Nodes[i]).KommParameters.Cost)+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 if number_of_Konc<>0 then
  begin
   RichEdit1.SelAttributes.Color := clRed;// заголовок окна
   RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. Концентраторы.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='KONC' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. Концентратор "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('Производитель "'+TOrLAN(Nodes[i]).KoncParameters.Producer+'"');
      RichEdit1.Lines.Add('Тип концентратора "'+TOrLAN(Nodes[i]).KoncParameters.Prod_Name+'"');
      RichEdit1.Lines.Add('Порты концентратора');
      if TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber)+' портов Ethernet '
          +'[ '+TOrLAN(Nodes[i]).KoncParameters.Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber)+' портов FastEthernet '
          +'[ '+TOrLAN(Nodes[i]).KoncParameters.F_Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber)+' портов GigabitEthernet');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber)+' портов ATM');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber)+' портов FDDI');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber)+' портов 10/100');
       end;
      RichEdit1.Lines.Add('Стоимость концентратора '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.Cost)+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 RichEdit1.SelAttributes.Color := clRed;// заголовок окна
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.SelAttributes.Size := 12;
 jj:=jj+1;
 RichEdit1.Lines.Add(IntToStr(jj)+'. Используемая среда передачи.');
 RichEdit1.SelAttributes.Size := 10;
 RichEdit1.SelAttributes.Color := clGreen;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Lines.Add(IntToStr(jj)+'.1. Коаксиальный кабель.');
 RichEdit1.SelAttributes.Color := clBlack;
 RichEdit1.SelAttributes.Style := [];

 RichEdit1.Lines.Add('Тонкий - '+
                     IntToStr(Length_Count('Тонкий коаксиал'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Тонкий коаксиал'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Тонкий коаксиал')*Cost2_Count('Тонкий коаксиал'))+' y.e.');
 RichEdit1.Lines.Add('Толстый - '+
                     IntToStr(Length_Count('Толстый коаксиал'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Толстый коаксиал'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Толстый коаксиал')*Cost2_Count('Толстый коаксиал'))+' y.e.');

 RichEdit1.SelAttributes.Color := clGreen;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Lines.Add(IntToStr(jj)+'.2. Витая пара.');
 RichEdit1.SelAttributes.Color := clBlack;
 RichEdit1.SelAttributes.Style := [];
 RichEdit1.Lines.Add('Неэкранированная 3 категории - '+
                     IntToStr(Length_Count('Неэкранированная витая пара (3-я категория)'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Неэкранированная витая пара (3-я категория)'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Неэкранированная витая пара (3-я категория)')*
                     Cost2_Count('Неэкранированная витая пара (3-я категория)'))+' y.e.');
 RichEdit1.Lines.Add('Неэкранированная 4 категории - '+
                     IntToStr(Length_Count('Неэкранированная витая пара (4-я категория)'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Неэкранированная витая пара (4-я категория)'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Неэкранированная витая пара (4-я категория)')*
                     Cost2_Count('Неэкранированная витая пара (4-я категория)'))+' y.e.');
 RichEdit1.Lines.Add('Неэкранированная 5 категории - '+
                     IntToStr(Length_Count('Неэкранированная витая пара (5-я категория)'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Неэкранированная витая пара (5-я категория)'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Неэкранированная витая пара (5-я категория)')*
                     Cost2_Count('Неэкранированная витая пара (5-я категория)'))+' y.e.');
 RichEdit1.Lines.Add('Экранированная - '+
                     IntToStr(Length_Count('Экранированная витая пара'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Экранированная витая пара'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Экранированная витая пара')*
                     Cost2_Count('Экранированная витая пара'))+' y.e.');
 RichEdit1.SelAttributes.Color := clGreen;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Lines.Add(IntToStr(jj)+'.3. Оптическое волокно.');
 RichEdit1.SelAttributes.Color := clBlack;
 RichEdit1.SelAttributes.Style := [];
 RichEdit1.Lines.Add('Одномодовое - '+
                     IntToStr(Length_Count('Одномодовое оптоволокно'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Одномодовое оптоволокно'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Одномодовое оптоволокно')*
                     Cost2_Count('Одномодовое оптоволокно'))+' y.e.');
 RichEdit1.Lines.Add('Многомодовое - '+
                     IntToStr(Length_Count('Многомодовое оптоволокно'))+' метра(ов) '+
                     ' по '+IntToStr(Cost2_Count('Многомодовое оптоволокно'))+
                     ' y.e. за метр. Итого '+
                     IntToStr(Length_Count('Многомодовое оптоволокно')*
                     Cost2_Count('Многомодовое оптоволокно'))+' y.e.');

 jj:=0;
 for i:=0 to Nodes.Count-1 do
  jj:=jj+Cost_Count(i);

 jj:=jj+Length_Count('Многомодовое оптоволокно')*Cost2_Count('Многомодовое оптоволокно')+
     Length_Count('Одномодовое оптоволокно')*Cost2_Count('Одномодовое оптоволокно')+
     Length_Count('Экранированная витая пара')*Cost2_Count('Экранированная витая пара')+
     Length_Count('Неэкранированная витая пара (3-я категория)')*Cost2_Count('Неэкранированная витая пара (3-я категория)')+
     Length_Count('Неэкранированная витая пара (4-я категория)')*Cost2_Count('Неэкранированная витая пара (4-я категория)')+
     Length_Count('Неэкранированная витая пара (5-я категория)')*Cost2_Count('Неэкранированная витая пара (5-я категория)')+
     Length_Count('Толстый коаксиал')*Cost2_Count('Толстый коаксиал')+
     Length_Count('Тонкий коаксиал')*Cost2_Count('Тонкий коаксиал');

 RichEdit1.Lines.Add('');
 RichEdit1.SelAttributes.Color := clRed;
 RichEdit1.SelAttributes.Style := [fsBold];
 RichEdit1.Lines.Add('Итого стоимость проекта составляет '+IntToStr(jj)+' y.e.');

 FormWait.Hide;

end;

procedure TReportForm.BitBtn2Click(Sender: TObject);
var POutput:TextFile;
    N:longint;
begin
 if PrintDialog1.Execute then
 begin
   AssignPrn(POutput);
   Rewrite(POutput);
   Printer.Canvas.Font:=RichEdit1.Font;
   for n:=0 to RichEdit1.Lines.Count-1 do
     writeln(POutput,RichEdit1.Lines[n]);
   CloseFile(POutput);
 end;
end;

procedure TReportForm.BitBtn3Click(Sender: TObject);
begin
 if SaveDialog1.Execute then
   RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

function TReportForm.Cost_Count(Num: integer): integer;
var s1,s2,s3: string;
    p,i: integer;
begin
 Result:=0;
 p:=1;

 if TOrLAN(Nodes[Num]).NodeType='WS' then
  begin
   Result:=TOrLAN(Nodes[Num]).WSParameters.Cost;
   s1:=TOrLAN(Nodes[Num]).WSParameters.Soft;
   s2:=TOrLAN(Nodes[Num]).WSParameters.Processor;
   s3:='';
   p:=1;
  end;
 if TOrLAN(Nodes[Num]).NodeType='SERV' then
  begin
   Result:=TOrLAN(Nodes[Num]).ServParameters.Cost;
   s1:=TOrLAN(Nodes[Num]).ServParameters.Soft;
   s2:=TOrLAN(Nodes[Num]).ServParameters.Processor;
   s3:=TOrLAN(Nodes[Num]).ServParameters.OSType;
   p:=TOrLAN(Nodes[Num]).ServParameters.NumberProc;
  end;
 for i:=0 to Main_DB.Count-1 do
  begin
   DB_Elem:=Main_DB.Items[i];
   if (DB_Elem^.Type_='типы сетевых операционных систем') and
      (DB_Elem^.Name_=s3) then
    begin
     Result:=Result+DB_Elem^.Cost_;
    end;

   if (DB_Elem^.Type_='процессоры') and
      (DB_Elem^.Name_=s2) then
    begin
     Result:=Result+p*DB_Elem^.Cost_;
    end;

   if (DB_Elem^.Type_='программное обеспечение') and
      (DB_Elem^.Name_=s1) then
    begin
     Result:=Result+DB_Elem^.Cost_;
    end;
  end;
end;

function TReportForm.Length_Count(S: string): integer;
var i,j: integer;
begin
 Result:=0;
 for i:=0 to Nodes.Count-1 do
  for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
   if Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType=s then
    Result:=Result+Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength;

 Result:=Trunc(Result/2);
end;

function TReportForm.Cost2_Count(S: string): integer;
var i:integer;
begin
 Result:=0;
 for i:=0 to Main_DB.Count-1 do
  begin
   DB_Elem:=Main_DB.Items[i];
   if (DB_Elem^.Type_='среда передачи') and
      (DB_Elem^.Name_=S) then
    begin
     Result:=Result+DB_Elem^.Cost_;
    end;
  end;
end;


end.
