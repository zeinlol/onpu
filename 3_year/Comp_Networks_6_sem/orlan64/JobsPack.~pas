// ********************************************************************
//  JobsPack.pas
//
//  Указание параметров заявок для пакетного моделирования
// ********************************************************************

unit JobsPack;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, Buttons;

type
  TFormPack = class(TForm)
    ComboBoxWS: TComboBox;
    Label3: TLabel;
    ComboBoxSERV: TComboBox;
    Label19: TLabel;
    BitBtnAdd: TBitBtn;
    BitBtnReplace: TBitBtn;
    BitBtnDelete: TBitBtn;
    StringGridJobs: TStringGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    Panel5: TPanel;
    Label11: TLabel;
    Panel6: TPanel;
    Label13: TLabel;
    Panel7: TPanel;
    Label22: TLabel;
    BitBtnApply: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label14: TLabel;
    EditSizeTo: TEdit;
    Label8: TLabel;
    Label21: TLabel;
    EditAnsSizeTo: TEdit;
    CheckNeedAns: TCheckBox;
    Label15: TLabel;
    EditTimeWSTo: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    EditTimeSERVTo: TEdit;
    Label16: TLabel;
    Label7: TLabel;
    EditTimeCycleTo: TEdit;
    Label20: TLabel;
    EditSizeFrom: TEdit;
    EditAnsSizeFrom: TEdit;
    EditTimeWSFrom: TEdit;
    EditTimeSERVFrom: TEdit;
    EditTimeCycleFrom: TEdit;
    LabelSizeTo: TLabel;
    LabelAnsSizeTo: TLabel;
    LabelAnsSizeFrom: TLabel;
    LabelTimeWSTo: TLabel;
    LabelTimeSERVTo: TLabel;
    LabelTimeCycleTo: TLabel;
    ComboBoxStepsNumber: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    EditJobsNumberFrom: TEdit;
    Label6: TLabel;
    EditJobsNumberTo: TEdit;
    Panel8: TPanel;
    Label9: TLabel;
    StringGridAllSteps: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGridJobsClick(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    procedure BitBtnReplaceClick(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure BitBtnApplyClick(Sender: TObject);
    procedure CheckNeedAnsClick(Sender: TObject);
  private
    { Private declarations }
    function AllValid() : Boolean;
  public
    { Public declarations }
    procedure CopyJobsToNodes( nStep : Integer );
  end;

var
  FormPack: TFormPack;

  Steps : Integer;
  JobsPerStep : array of integer;

implementation

uses orlan, main, connect;

{$R *.DFM}

procedure TFormPack.FormCreate(Sender: TObject);
begin
 StringGridJobs.ColWidths[0]:=Panel1.Width;
 StringGridJobs.ColWidths[1]:=Panel2.Width;
 StringGridJobs.ColWidths[2]:=0;
 StringGridJobs.ColWidths[3]:=Panel3.Width;
 StringGridJobs.ColWidths[4]:=0;
 StringGridJobs.ColWidths[5]:=Panel4.Width;
 StringGridJobs.ColWidths[6]:=0;
 StringGridJobs.ColWidths[7]:=Panel5.Width;
 StringGridJobs.ColWidths[8]:=0;
 StringGridJobs.ColWidths[9]:=Panel6.Width;
 StringGridJobs.ColWidths[10]:=0;
 StringGridJobs.ColWidths[11]:=Panel7.Width;
 StringGridJobs.ColWidths[12]:=0;
 StringGridJobs.ColWidths[13]:=Panel8.Width;
end;

procedure TFormPack.FormShow(Sender: TObject);
var i, j : Integer;
    El : TOrlan;
    ModelEl : Model_Element;
begin
 ComboBoxStepsNumber.ItemIndex := ComboBoxStepsNumber.Items.IndexOf( '5' );

 ComboBoxWS.Items.Clear;
 ComboBoxSERV.Items.Clear;

 StringGridJobs.RowCount:=1;
 for i:=0 to StringGridJobs.ColCount-1 do
   StringGridJobs.Cells[i,0]:='';

 for i:=0 to Nodes.Count-1 do
 begin
   El := TOrLAN(Nodes[i]);
   if El.NodeType='WS' then
   begin
       ComboBoxWS.Items.Add(El.NodeName);

       for j:=0 to El.WSParameters.RequestClass.Count-1 do
       begin
         ModelEl := Model_Element(El.WSParameters.RequestClass[j]);

         if StringGridJobs.Cells[0,0] <> '' then
           StringGridJobs.RowCount:=StringGridJobs.RowCount+1;

         StringGridJobs.Cells[0,StringGridJobs.RowCount-1]:=El.NodeName;
         StringGridJobs.Cells[1,StringGridJobs.RowCount-1]:=FormConnect.IDToName(ModelEl.ServID_);
         StringGridJobs.Cells[2,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.Size_);
         StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.Size_);
         StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.AnsSize_);
         StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.AnsSize_);
         StringGridJobs.Cells[6,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeWS * 1000, ffFixed, 5, 3);
         StringGridJobs.Cells[7,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeWS * 1000, ffFixed, 5, 3);
         StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeServ * 1000, ffFixed, 5, 3);
         StringGridJobs.Cells[9,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeServ * 1000, ffFixed, 5, 3);
         StringGridJobs.Cells[10,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeCycle * 1000, ffFixed, 5, 3);
         StringGridJobs.Cells[11,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeCycle * 1000, ffFixed, 5, 3);
         StringGridJobs.Cells[12,StringGridJobs.RowCount-1]:='1';
         StringGridJobs.Cells[13,StringGridJobs.RowCount-1]:='1';
       end;
   end;

   if El.NodeType='SERV' then
     ComboBoxSERV.Items.Add(El.NodeName);
 end;

 StringGridJobs.Row := 0;
 StringGridJobsClick(nil);
end;

procedure TFormPack.StringGridJobsClick(Sender: TObject);
begin
 if StringGridJobs.Cells[0,0] = '' then
 begin
   ComboBoxWS.ItemIndex := -1;
   ComboBoxSERV.ItemIndex := -1;
//   EditSizeFrom.Text := '';
//   EditSizeTo.Text := '';
//   CheckNeedAns.Checked := False;
//   EditAnsSizeFrom.Text := '128';
//   EditAnsSizeTo.Text := '128';
//   EditTimeWSFrom.Text := '';
//   EditTimeWSTo.Text := '';
//   EditTimeSERVFrom.Text := '';
//   EditTimeSERVTo.Text := '';
//   EditTimeCycleFrom.Text := '';
//   EditTimeCycleTo.Text := '';
//   EditJobsNumberFrom.Text := '';
//   EditJobsNumberTo.Text := '';
 end
 else
 begin
   ComboBoxWS.ItemIndex:=ComboBoxWS.Items.IndexOf(StringGridJobs.Cells[0,StringGridJobs.Row]);
   ComboBoxSERV.ItemIndex:=ComboBoxSERV.Items.IndexOf(StringGridJobs.Cells[1,StringGridJobs.Row]);
   EditSizeFrom.Text := StringGridJobs.Cells[2,StringGridJobs.Row];
   EditSizeTo.Text := StringGridJobs.Cells[3,StringGridJobs.Row];

   if StrToFloat(StringGridJobs.Cells[4,StringGridJobs.Row]) = 0 then
   begin
     CheckNeedAns.Checked := False;
     EditAnsSizeFrom.Text := '128';
     EditAnsSizeTo.Text := '128';
   end
   else
   begin
     CheckNeedAns.Checked := True;
     EditAnsSizeFrom.Text := StringGridJobs.Cells[4,StringGridJobs.Row];
     EditAnsSizeTo.Text := StringGridJobs.Cells[5,StringGridJobs.Row];
   end;

   EditTimeWSFrom.Text := StringGridJobs.Cells[6,StringGridJobs.Row];
   EditTimeWSTo.Text := StringGridJobs.Cells[7,StringGridJobs.Row];
   EditTimeSERVFrom.Text := StringGridJobs.Cells[8,StringGridJobs.Row];
   EditTimeSERVTo.Text := StringGridJobs.Cells[9,StringGridJobs.Row];
   EditTimeCycleFrom.Text := StringGridJobs.Cells[10,StringGridJobs.Row];
   EditTimeCycleTo.Text := StringGridJobs.Cells[11,StringGridJobs.Row];
   EditJobsNumberFrom.Text := StringGridJobs.Cells[12,StringGridJobs.Row];
   EditJobsNumberTo.Text := StringGridJobs.Cells[13,StringGridJobs.Row];
 end;

end;

procedure TFormPack.BitBtnAddClick(Sender: TObject);
begin
   if AllValid = False then
     exit;

   if StringGridJobs.Cells[0,0] <> '' then
     StringGridJobs.RowCount:=StringGridJobs.RowCount+1;

   StringGridJobs.Cells[0,StringGridJobs.RowCount-1]:=ComboBoxWS.Items[ComboBoxWS.ItemIndex];
   StringGridJobs.Cells[1,StringGridJobs.RowCount-1]:=ComboBoxSERV.Items[ComboBoxSERV.ItemIndex];
   StringGridJobs.Cells[2,StringGridJobs.RowCount-1]:=EditSizeFrom.Text;
   StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:=EditSizeTo.Text;

   if CheckNeedAns.Checked=True then
   begin
     StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:=EditAnsSizeFrom.Text;
     StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:=EditAnsSizeTo.Text;
   end
   else
   begin
     StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:='0';
     StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:='0';
   end;

   StringGridJobs.Cells[6,StringGridJobs.RowCount-1]:=EditTimeWSFrom.Text;
   StringGridJobs.Cells[7,StringGridJobs.RowCount-1]:=EditTimeWSTo.Text;
   StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:=EditTimeServFrom.Text;
   StringGridJobs.Cells[9,StringGridJobs.RowCount-1]:=EditTimeServTo.Text;
   StringGridJobs.Cells[10,StringGridJobs.RowCount-1]:=EditTimeCycleFrom.Text;
   StringGridJobs.Cells[11,StringGridJobs.RowCount-1]:=EditTimeCycleTo.Text;
   StringGridJobs.Cells[12,StringGridJobs.RowCount-1]:=EditJobsNumberFrom.Text;
   StringGridJobs.Cells[13,StringGridJobs.RowCount-1]:=EditJobsNumberTo.Text;

   StringGridJobs.Row := StringGridJobs.RowCount-1;
end;

procedure TFormPack.BitBtnReplaceClick(Sender: TObject);
begin
   if AllValid = False then
      exit;

   StringGridJobs.Cells[0,StringGridJobs.Row]:=ComboBoxWS.Items[ComboBoxWS.ItemIndex];
   StringGridJobs.Cells[1,StringGridJobs.Row]:=ComboBoxSERV.Items[ComboBoxSERV.ItemIndex];
   StringGridJobs.Cells[2,StringGridJobs.Row]:=EditSizeFrom.Text;
   StringGridJobs.Cells[3,StringGridJobs.Row]:=EditSizeTo.Text;

   if CheckNeedAns.Checked=True then
   begin
     StringGridJobs.Cells[4,StringGridJobs.Row]:=EditAnsSizeFrom.Text;
     StringGridJobs.Cells[5,StringGridJobs.Row]:=EditAnsSizeTo.Text;
   end
   else
   begin
     StringGridJobs.Cells[4,StringGridJobs.Row]:='0';
     StringGridJobs.Cells[5,StringGridJobs.Row]:='0';
   end;

   StringGridJobs.Cells[6,StringGridJobs.Row]:=EditTimeWSFrom.Text;
   StringGridJobs.Cells[7,StringGridJobs.Row]:=EditTimeWSTo.Text;
   StringGridJobs.Cells[8,StringGridJobs.Row]:=EditTimeServFrom.Text;
   StringGridJobs.Cells[9,StringGridJobs.Row]:=EditTimeServTo.Text;
   StringGridJobs.Cells[10,StringGridJobs.Row]:=EditTimeCycleFrom.Text;
   StringGridJobs.Cells[11,StringGridJobs.Row]:=EditTimeCycleTo.Text;
   StringGridJobs.Cells[12,StringGridJobs.Row]:=EditJobsNumberFrom.Text;
   StringGridJobs.Cells[13,StringGridJobs.Row]:=EditJobsNumberTo.Text;
end;

procedure TFormPack.BitBtnDeleteClick(Sender: TObject);
var i,j:integer;
begin
 for i:=StringGridJobs.Row to StringGridJobs.RowCount-2 do
   for j:=0 to StringGridJobs.ColCount-1 do
     StringGridJobs.Cells[j,i]:=StringGridJobs.Cells[j,i+1];

 if StringGridJobs.RowCount = 1 then
   for j:=0 to StringGridJobs.ColCount-1 do
     StringGridJobs.Cells[j,0]:='';

 StringGridJobs.RowCount:=StringGridJobs.RowCount-1;
end;

procedure TFormPack.BitBtnApplyClick(Sender: TObject);
var i, j, z, nStep, nRow : integer;
    fStep : double;
    El, El2 : TOrlan;
    ModelEl : Model_Element;
    Indx : Integer;
begin
  Steps := StrToInt( ComboBoxStepsNumber.Text );
  SetLength( JobsPerStep, Steps + 1 );

  StringGridAllSteps.RowCount:=1;
  for i:=0 to StringGridAllSteps.ColCount-1 do
    StringGridAllSteps.Cells[i,0]:='';

// StringGridAllSteps содержит параметры заявок для каждого шага.
// Эти параметры идут подряд блоками. Число строк в каждом блоке хранится в массиве JobsPerStep;
//
// В ячейках WS и SERV содержатся не имена станций, а их индексы массива Nodes.

  for nStep := 0 to Steps-1 do
  begin
     fStep := nStep / (Steps - 1);
     JobsPerStep[nStep] := 0;
     for nRow := 0 to StringGridJobs.RowCount-1 do
     begin
      //Current := To * fStep + From( 1 - fStep)
       for i:=1 to Round( StrToInt(StringGridJobs.Cells[13,nRow]) * fStep +
                          StrToInt(StringGridJobs.Cells[12,nRow]) * (1 - fStep) ) do
       begin
         if StringGridAllSteps.Cells[0,0] <> '' then
           StringGridAllSteps.RowCount:=StringGridAllSteps.RowCount+1;

         Inc(JobsPerStep[nStep]);

         //найти индекс клиента и записать его в StringGridAllSteps
         Indx := -1;
         for j:=0 to Nodes.Count-1 do
         begin
            El := TOrLAN(Nodes[j]);
            if El.NodeName = StringGridJobs.Cells[0,nRow] then
            begin
               Indx := j;
               break;
            end;
         end;
         StringGridAllSteps.Cells[0,StringGridAllSteps.RowCount-1]:= IntToStr( Indx );

         //найти индекс сервера и записать его в StringGridAllSteps
         Indx := -1;
         for j:=0 to Nodes.Count-1 do
         begin
            El := TOrLAN(Nodes[j]);
            if El.NodeName = StringGridJobs.Cells[1,nRow] then
            begin
               Indx := j;
               break;
            end;
         end;
         StringGridAllSteps.Cells[1,StringGridAllSteps.RowCount-1]:= IntToStr( Indx );

         //размер запроса
         StringGridAllSteps.Cells[2,StringGridAllSteps.RowCount-1]:=
            IntToStr(Round( StrToInt(StringGridJobs.Cells[3,nRow]) * fStep +
                            StrToInt(StringGridJobs.Cells[2,nRow]) * (1 - fStep)));

         //размер ответа
         StringGridAllSteps.Cells[3,StringGridAllSteps.RowCount-1]:=
            IntToStr(Round( StrToInt(StringGridJobs.Cells[5,nRow]) * fStep +
                            StrToInt(StringGridJobs.Cells[4,nRow]) * (1 - fStep)));

         //время подготовки
         StringGridAllSteps.Cells[4,StringGridAllSteps.RowCount-1]:=
            FloatToStr( (StrToFloat(StringGridJobs.Cells[7,nRow]) * fStep +
                          StrToFloat(StringGridJobs.Cells[6,nRow]) * (1 - fStep)) / 1000 );

         //время ответа
         StringGridAllSteps.Cells[5,StringGridAllSteps.RowCount-1]:=
            FloatToStr( (StrToFloat(StringGridJobs.Cells[9,nRow]) * fStep +
                          StrToFloat(StringGridJobs.Cells[8,nRow]) * (1 - fStep)) / 1000 );

         //время цикла
         StringGridAllSteps.Cells[6,StringGridAllSteps.RowCount-1]:=
            FloatToStr( (StrToFloat(StringGridJobs.Cells[11,nRow]) * fStep +
                          StrToFloat(StringGridJobs.Cells[10,nRow]) * (1 - fStep)) / 1000 );

       end;
     end;
  end;

// Последний блок - параметры заявок, которые были до запуска пакетного режима, он используется
// для возврата в исходное состояние после окончания моделирования.

 nStep := Steps;
 JobsPerStep[nStep] := 0;

 for i:=0 to Nodes.Count-1 do
 begin
   El := TOrLAN(Nodes[i]);
   if El.NodeType='WS' then
   begin
       for j:=0 to El.WSParameters.RequestClass.Count-1 do
       begin
         ModelEl := Model_Element(El.WSParameters.RequestClass[j]);

         if StringGridAllSteps.Cells[0,0] <> '' then
           StringGridAllSteps.RowCount:=StringGridAllSteps.RowCount+1;

         Inc(JobsPerStep[nStep]);

         //найти индекс клиента и записать его в StringGridAllSteps
         Indx := -1;
         for z:=0 to Nodes.Count-1 do
         begin
            El2 := TOrLAN(Nodes[z]);
            if El2.NodeName = El.NodeName then
            begin
               Indx := z;
               break;
            end;
         end;
         StringGridAllSteps.Cells[0,StringGridAllSteps.RowCount-1]:=IntToStr( Indx );

         //найти индекс сервера и записать его в StringGridAllSteps
         Indx := -1;
         for z:=0 to Nodes.Count-1 do
         begin
            El2:= TOrLAN(Nodes[z]);
            if El2.NodeID = ModelEl.ServID_ then
            begin
               Indx := z;
               break;
            end;
         end;
         StringGridAllSteps.Cells[1,StringGridAllSteps.RowCount-1]:= IntToStr( Indx );

         StringGridAllSteps.Cells[2,StringGridAllSteps.RowCount-1]:=IntToStr(ModelEl.Size_);
         StringGridAllSteps.Cells[3,StringGridAllSteps.RowCount-1]:=IntToStr(ModelEl.AnsSize_);
         StringGridAllSteps.Cells[4,StringGridAllSteps.RowCount-1]:=FloatToStr(ModelEl.TimeWS);
         StringGridAllSteps.Cells[5,StringGridAllSteps.RowCount-1]:=FloatToStr(ModelEl.TimeServ);
         StringGridAllSteps.Cells[6,StringGridAllSteps.RowCount-1]:=FloatToStr(ModelEl.TimeCycle);
       end;
   end;
 end;

end;

procedure TFormPack.CopyJobsToNodes( nStep : Integer );
var i, j, nBeg : Integer;
    El, El2 : TOrlan;
begin
 nBeg := 0;
 for i := 0 to nStep-1 do
    Inc( nBeg, JobsPerStep[i] );

//удалить все старые заявки
 for i:= 0 to Nodes.Count-1 do
 begin
   El := TOrlan(Nodes[i]);

   for j:=0 to El.WSParameters.RequestClass.Count-1 do
      El.WSParameters.RequestClass.Items[j]:=nil;

   El.WSParameters.RequestClass.Pack;
 end;

 for i := nBeg to nBeg + JobsPerStep[nStep]-1 do
 begin
   //клиент
   El := TOrlan(Nodes[StrToInt(StringGridAllSteps.Cells[0, i])]);
   //сервер
   El2 := TOrlan(Nodes[StrToInt(StringGridAllSteps.Cells[1, i])]);

   New(Model_Elem);

   Model_Elem.ServID_ := El2.NodeID;
   Model_Elem.Size_ := StrToInt(StringGridAllSteps.Cells[2, i]);
   Model_Elem.AnsSize_ := StrToInt(StringGridAllSteps.Cells[3, i]);
   Model_Elem.TimeWS := StrToFloat(StringGridAllSteps.Cells[4, i]);
   Model_Elem.TimeServ := StrToFloat(StringGridAllSteps.Cells[5, i]);
   Model_Elem.TimeCycle := StrToFloat(StringGridAllSteps.Cells[6, i]);

   El.WSParameters.RequestClass.Add(Model_Elem);
 end;

end;

procedure TFormPack.CheckNeedAnsClick(Sender: TObject);
begin
 if CheckNeedAns.Checked=True then
  begin
   LabelAnsSizeFrom.Visible:=True;
   LabelAnsSizeTo.Visible:=True;
   Label21.Visible:=True;
   EditAnsSizeFrom.Visible:=True;
   EditAnsSizeTo.Visible:=True;
   EditAnsSizeFrom.Text:='128';
   EditAnsSizeTo.Text:='128';
  end
 else
  begin
   LabelAnsSizeFrom.Visible:=False;
   LabelAnsSizeTo.Visible:=False;
   Label21.Visible:=False;
   EditAnsSizeFrom.Visible:=False;
   EditAnsSizeTo.Visible:=False;
   EditAnsSizeFrom.Text:='0';
   EditAnsSizeTo.Text:='0';
  end;
end;

function TFormPack.AllValid() : Boolean;
var WasError : Boolean;
begin
 AllValid := False;

 if ComboBoxWS.Text = '' then
 begin
    Application.MessageBox( 'Выберите станцию-клиент для заявки.', 'OrLAN', MB_OK+MB_IconInformation);
    Exit;
 end;

 if ComboBoxServ.Text = '' then
 begin
	Application.MessageBox( 'Выберите станцию-сервер для заявки.', 'OrLAN', MB_OK+MB_IconInformation);
    Exit;
 end;

 WasError := False;

 try
   StrToInt(EditSizeFrom.Text);
 except
   EditSizeFrom.Text:='';
   WasError := True;
 end;

 try
   StrToInt(EditSizeTo.Text);
 except
   EditSizeTo.Text:='';
   WasError := True;
 end;

 if CheckNeedAns.Checked=True then
 begin
   try
     StrToInt(EditAnsSizeFrom.Text);
   except
     EditAnsSizeFrom.Text:='';
     WasError := True;
   end;

   try
     StrToInt(EditAnsSizeTo.Text);
   except
     EditAnsSizeTo.Text:='';
     WasError := True;
   end;
 end;

 try
   StrToFloat(EditTimeWSFrom.Text);
 except
   EditTimeWSFrom.Text:='';
   WasError := True;
 end;

 try
   StrToFloat(EditTimeWSTo.Text);
 except
   EditTimeWSTo.Text:='';
   WasError := True;
 end;

 try
   StrToFloat(EditTimeServFrom.Text);
 except
   EditTimeServFrom.Text:='';
   WasError := True;
 end;

 try
   StrToFloat(EditTimeServTo.Text);
 except
   EditTimeServTo.Text:='';
   WasError := True;
 end;

 try
   StrToFloat(EditTimeCycleFrom.Text);
 except
   EditTimeCycleFrom.Text:='';
   WasError := True;
 end;

 try
   StrToFloat(EditTimeCycleTo.Text);
 except
   EditTimeCycleTo.Text:='';
   WasError := True;
 end;

 try
   StrToInt(EditJobsNumberFrom.Text);
 except
   EditJobsNumberFrom.Text:='';
   WasError := True;
 end;

 try
   StrToInt(EditJobsNumberTo.Text);
 except
   EditJobsNumberTo.Text:='';
   WasError := True;
 end;

 if WasError = True then
 begin
    MessageDlg('Ошибка в параметрах заявки.', mtInformation,[mbOk], 0);
    Exit;
 end;

 AllValid := True;
end;


end.
