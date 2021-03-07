// ********************************************************************
//  report.pas
//
//  �������� ������
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
 FormWait.LabelMessage.Caption:='���� �������� ������ �� �������...';
 FormWait.Show;
 Application.ProcessMessages;

 RichEdit1.Clear;
 RichEdit1.SelAttributes.Color := clRed;// ��������� ����
 RichEdit1.SelAttributes.Size := 16;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Paragraph.Alignment:=taCenter;
 RichEdit1.Lines.Add('������: "'+Project_Name+'"');
 RichEdit1.Lines.Add('');
 jj:=0;
 RichEdit1.Paragraph.Alignment:=taLeftJustify;
 if number_of_workStations<>0 then
  begin
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. ������� �������.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='WS' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. ������� ������� "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('����������� ����������� "'+TOrLAN(Nodes[i]).WSParameters.Soft+'"');
      RichEdit1.Lines.Add('��������� "'+TOrLAN(Nodes[i]).WSParameters.Processor+'"');
      RichEdit1.Lines.Add('����������� ������ '+IntToStr(TOrLAN(Nodes[i]).WSParameters.RAM)+' MBytes');
      RichEdit1.Lines.Add('������� ���� '+IntToStr(TOrLAN(Nodes[i]).WSParameters.HDD)+' MBytes');
      RichEdit1.Lines.Add('������� ����� ('+IntToStr(TOrLAN(Nodes[i]).Ports.Count)+')');
      for k:=0 to TOrLAN(NOdes[i]).Ports.Count-1 do
       begin
        s:=IntToStr(k+1)+'. ';
        s:=s+Port_Element(TOrLAN(NOdes[i]).Ports[k]).PortType;
        if Port_Element(TOrLAN(NOdes[i]).Ports[k]).IsUsed=True then
         s:=s+' (������)'
        else
         s:=s+' (��������)';
        RichEdit1.Lines.Add(s);
       end;
      if TOrLAN(Nodes[i]).WSParameters.RequestClass.Count<>0 then
       begin
        RichEdit1.Lines.Add('������ ������ ('+IntToStr(TOrLAN(Nodes[i]).WSParameters.RequestClass.Count)+')');
        for k:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
         begin
          RichEdit1.Lines.Add(IntToStr(k+1)+
            '. �������������� �������� "'+
            FormConnect.IDToName(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).ServID_)+'".');
          RichEdit1.Lines.Add(
            '   ������ ������� '+
            IntToStr(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).Size_)+
            ' ����. ');
          if Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).AnsSize_ > 0 then
             RichEdit1.Lines.Add(
               '   ������ ������ '+
               IntToStr(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).AnsSize_)+
               ' ����. ');
          RichEdit1.Lines.Add(
            '   ����� ���������� �� ������� '+
            FloatToStrF(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).TimeWS * 1000,ffGeneral,4,4)+
            ' ��. ');
          RichEdit1.Lines.Add(
            '   ����� ��������� �� ������� '+
            FloatToStrF(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass[k]).TimeServ * 1000,ffGeneral,4,4)+
            ' ��. ');
         end;
       end;
      RichEdit1.Lines.Add('��������� ������� '+IntToStr(Cost_Count(i))+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 if number_of_Servers<>0 then
  begin
   RichEdit1.SelAttributes.Color := clRed;// ��������� ����
   RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. �������.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='SERV' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. ������ "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('����������� ����������� "'+TOrLAN(Nodes[i]).ServParameters.Soft+'"');
      RichEdit1.Lines.Add('��������� "'+TOrLAN(Nodes[i]).ServParameters.Processor+'"');
      RichEdit1.Lines.Add('���������� ����������� - '+IntToStr(TOrLAN(Nodes[i]).ServParameters.NumberProc));
      RichEdit1.Lines.Add('����������� ������ '+IntToStr(TOrLAN(Nodes[i]).ServParameters.RAM)+' MBytes');
      RichEdit1.Lines.Add('������� ���� '+IntToStr(TOrLAN(Nodes[i]).ServParameters.HDD)+' MBytes');
      RichEdit1.Lines.Add('��� ������� �� "'+TOrLAN(Nodes[i]).ServParameters.OSType+'"');
      RichEdit1.Lines.Add('������� ����� ('+IntToStr(TOrLAN(Nodes[i]).Ports.Count)+')');
      for k:=0 to TOrLAN(NOdes[i]).Ports.Count-1 do
       begin
        s:=IntToStr(k+1)+'. ';
        s:=s+Port_Element(TOrLAN(NOdes[i]).Ports[k]).PortType;
        if Port_Element(TOrLAN(NOdes[i]).Ports[k]).IsUsed=True then
         s:=s+' (������)'
        else
         s:=s+' (��������)';
        RichEdit1.Lines.Add(s);
       end;
      RichEdit1.Lines.Add('��������� ������� '+IntToStr(Cost_Count(i))+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 if number_of_Kommutators<>0 then
  begin
   RichEdit1.SelAttributes.Color := clRed;// ��������� ����
   RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. �����������.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='KOMM' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. ���������� "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('������������� "'+TOrLAN(Nodes[i]).KommParameters.Producer+'"');
      RichEdit1.Lines.Add('��� ���������� "'+TOrLAN(Nodes[i]).KommParameters.Prod_Name+'"');
      RichEdit1.Lines.Add('����� ����������');
      if TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber)+' ������ Ethernet '
          +'[ '+TOrLAN(Nodes[i]).KommParameters.Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber)+' ������ FastEthernet '
          +'[ '+TOrLAN(Nodes[i]).KommParameters.F_Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber)+' ������ GigabitEthernet');
       end;
      if TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber)+' ������ ATM');
       end;
      if TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber)+' ������ FDDI');
       end;
      if TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber)+' ������ 10/100');
       end;
      if TOrLAN(Nodes[i]).KommParameters.Duplex=True then
       RichEdit1.Lines.Add('����� ����������')
      else
       RichEdit1.Lines.Add('����� ��������������');
      RichEdit1.Lines.Add('���������� ����������� ���� - '+FloatToStr(TOrLAN(Nodes[i]).KommParameters.Int_Bus)+' GBps');
      RichEdit1.Lines.Add('��������� ����������� '+IntToStr(TOrLAN(Nodes[i]).KommParameters.Cost)+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 if number_of_Konc<>0 then
  begin
   RichEdit1.SelAttributes.Color := clRed;// ��������� ����
   RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
   RichEdit1.SelAttributes.Size := 12;
   jj:=jj+1;
   RichEdit1.Lines.Add(IntToStr(jj)+'. �������������.');
   RichEdit1.SelAttributes.Size := 10;
   j:=0;
   for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='KONC' then
     begin
      RichEdit1.SelAttributes.Color := clGreen;
      RichEdit1.SelAttributes.Style := [fsBold,fsItalic];
      j:=j+1;
      RichEdit1.Lines.Add(IntToStr(jj)+'.'+IntTOStr(j)+
       '. ������������ "'+TOrLAN(Nodes[i]).NodeName+'"');
      RichEdit1.SelAttributes.Color := clBlack;
      RichEdit1.SelAttributes.Style := [];
      RichEdit1.Lines.Add('������������� "'+TOrLAN(Nodes[i]).KoncParameters.Producer+'"');
      RichEdit1.Lines.Add('��� ������������� "'+TOrLAN(Nodes[i]).KoncParameters.Prod_Name+'"');
      RichEdit1.Lines.Add('����� �������������');
      if TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber)+' ������ Ethernet '
          +'[ '+TOrLAN(Nodes[i]).KoncParameters.Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber)+' ������ FastEthernet '
          +'[ '+TOrLAN(Nodes[i]).KoncParameters.F_Eth_Type+' ]');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber)+' ������ GigabitEthernet');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber)+' ������ ATM');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber)+' ������ FDDI');
       end;
      if TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber<>0 then
       begin
        RichEdit1.Lines.Add('   '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber)+' ������ 10/100');
       end;
      RichEdit1.Lines.Add('��������� ������������� '+IntToStr(TOrLAN(Nodes[i]).KoncParameters.Cost)+' y.e.');

      RichEdit1.Lines.Add('');
     end;
  end;

 RichEdit1.SelAttributes.Color := clRed;// ��������� ����
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.SelAttributes.Size := 12;
 jj:=jj+1;
 RichEdit1.Lines.Add(IntToStr(jj)+'. ������������ ����� ��������.');
 RichEdit1.SelAttributes.Size := 10;
 RichEdit1.SelAttributes.Color := clGreen;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Lines.Add(IntToStr(jj)+'.1. ������������ ������.');
 RichEdit1.SelAttributes.Color := clBlack;
 RichEdit1.SelAttributes.Style := [];

 RichEdit1.Lines.Add('������ - '+
                     IntToStr(Length_Count('������ ��������'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('������ ��������'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('������ ��������')*Cost2_Count('������ ��������'))+' y.e.');
 RichEdit1.Lines.Add('������� - '+
                     IntToStr(Length_Count('������� ��������'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('������� ��������'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('������� ��������')*Cost2_Count('������� ��������'))+' y.e.');

 RichEdit1.SelAttributes.Color := clGreen;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Lines.Add(IntToStr(jj)+'.2. ����� ����.');
 RichEdit1.SelAttributes.Color := clBlack;
 RichEdit1.SelAttributes.Style := [];
 RichEdit1.Lines.Add('���������������� 3 ��������� - '+
                     IntToStr(Length_Count('���������������� ����� ���� (3-� ���������)'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('���������������� ����� ���� (3-� ���������)'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('���������������� ����� ���� (3-� ���������)')*
                     Cost2_Count('���������������� ����� ���� (3-� ���������)'))+' y.e.');
 RichEdit1.Lines.Add('���������������� 4 ��������� - '+
                     IntToStr(Length_Count('���������������� ����� ���� (4-� ���������)'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('���������������� ����� ���� (4-� ���������)'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('���������������� ����� ���� (4-� ���������)')*
                     Cost2_Count('���������������� ����� ���� (4-� ���������)'))+' y.e.');
 RichEdit1.Lines.Add('���������������� 5 ��������� - '+
                     IntToStr(Length_Count('���������������� ����� ���� (5-� ���������)'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('���������������� ����� ���� (5-� ���������)'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('���������������� ����� ���� (5-� ���������)')*
                     Cost2_Count('���������������� ����� ���� (5-� ���������)'))+' y.e.');
 RichEdit1.Lines.Add('�������������� - '+
                     IntToStr(Length_Count('�������������� ����� ����'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('�������������� ����� ����'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('�������������� ����� ����')*
                     Cost2_Count('�������������� ����� ����'))+' y.e.');
 RichEdit1.SelAttributes.Color := clGreen;
 RichEdit1.SelAttributes.Style := [fsBold, fsItalic];
 RichEdit1.Lines.Add(IntToStr(jj)+'.3. ���������� �������.');
 RichEdit1.SelAttributes.Color := clBlack;
 RichEdit1.SelAttributes.Style := [];
 RichEdit1.Lines.Add('����������� - '+
                     IntToStr(Length_Count('����������� �����������'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('����������� �����������'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('����������� �����������')*
                     Cost2_Count('����������� �����������'))+' y.e.');
 RichEdit1.Lines.Add('������������ - '+
                     IntToStr(Length_Count('������������ �����������'))+' �����(��) '+
                     ' �� '+IntToStr(Cost2_Count('������������ �����������'))+
                     ' y.e. �� ����. ����� '+
                     IntToStr(Length_Count('������������ �����������')*
                     Cost2_Count('������������ �����������'))+' y.e.');

 jj:=0;
 for i:=0 to Nodes.Count-1 do
  jj:=jj+Cost_Count(i);

 jj:=jj+Length_Count('������������ �����������')*Cost2_Count('������������ �����������')+
     Length_Count('����������� �����������')*Cost2_Count('����������� �����������')+
     Length_Count('�������������� ����� ����')*Cost2_Count('�������������� ����� ����')+
     Length_Count('���������������� ����� ���� (3-� ���������)')*Cost2_Count('���������������� ����� ���� (3-� ���������)')+
     Length_Count('���������������� ����� ���� (4-� ���������)')*Cost2_Count('���������������� ����� ���� (4-� ���������)')+
     Length_Count('���������������� ����� ���� (5-� ���������)')*Cost2_Count('���������������� ����� ���� (5-� ���������)')+
     Length_Count('������� ��������')*Cost2_Count('������� ��������')+
     Length_Count('������ ��������')*Cost2_Count('������ ��������');

 RichEdit1.Lines.Add('');
 RichEdit1.SelAttributes.Color := clRed;
 RichEdit1.SelAttributes.Style := [fsBold];
 RichEdit1.Lines.Add('����� ��������� ������� ���������� '+IntToStr(jj)+' y.e.');

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
   if (DB_Elem^.Type_='���� ������� ������������ ������') and
      (DB_Elem^.Name_=s3) then
    begin
     Result:=Result+DB_Elem^.Cost_;
    end;

   if (DB_Elem^.Type_='����������') and
      (DB_Elem^.Name_=s2) then
    begin
     Result:=Result+p*DB_Elem^.Cost_;
    end;

   if (DB_Elem^.Type_='����������� �����������') and
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
   if (DB_Elem^.Type_='����� ��������') and
      (DB_Elem^.Name_=S) then
    begin
     Result:=Result+DB_Elem^.Cost_;
    end;
  end;
end;


end.
