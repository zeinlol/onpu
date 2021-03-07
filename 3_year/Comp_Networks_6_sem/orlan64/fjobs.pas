// ********************************************************************
//  fjobs.pas
//
//  Ввод и редактирование параметров заявок
// ********************************************************************

unit fjobs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, Spin;

type
  TFormJobs = class(TForm)
    BitBtnApply: TBitBtn;
    GroupBox1: TGroupBox;
    StringGridJobs: TStringGrid;
    BitBtnDelete: TBitBtn;
    BitBtnReplace: TBitBtn;
    BitBtnAdd: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnApplyClick(Sender: TObject);
    procedure StringGridJobsClick(Sender: TObject);
    //procedure CheckNeedAnsClick(Sender: TObject);
    procedure BitBtnAddClick(Sender: TObject);
    //procedure BitBtnReplaceClick(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    //procedure EditPriorityExit(Sender: TObject);
    //procedure EditPossPercentExit(Sender: TObject);
    procedure StringGridJobsDblClick(Sender: TObject);
    procedure BitBtnReplaceClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    //function AllValid() : Boolean;
    { Private declarations }
  public
    { Public declarations }
    WSName : string;
  end;

var
  FormJobs: TFormJobs;
  EditFlag: boolean;

implementation

uses main, orlan, connect, JobOptions, mjob;

{$R *.DFM}

//==========================================================================
// Открытие формы и заполнение табличной части
//==========================================================================
procedure TFormJobs.FormShow(Sender: TObject);
var i, j : Integer;
    El : TOrlan;
    ModelEl : Model_Element;
begin

	if WSName = '' then
		Caption := 'Просмотр и редактирование заявок для всех узлов'
	else
    	Caption := 'Просмотр и редактирование заявок для узла "' + WSName + '"';

    // Очистка и заполнение комбобоксов
    //////////////////////////////////////////
	jobOptionsForm.cbClient.Items.Clear;
	jobOptionsForm.cbServer.Items.Clear;

	for i:=0 to Nodes.Count-1 do
		begin
		El := TOrLAN(Nodes[i]);
		if El.NodeType='WS' then
			jobOptionsForm.cbClient.Items.Add(El.NodeName);
		if El.NodeType='SERV' then
			jobOptionsForm.cbServer.Items.Add(El.NodeName);
		end;


	StringGridJobs.RowCount:=2;
	for i:=0 to StringGridJobs.ColCount-1 do
		StringGridJobs.Cells[i,1]:='';
    StringGridJobs.Cells[3,1]:='0';

	for i:=0 to Nodes.Count-1 do
		begin
		El := TOrLAN(Nodes[i]);
		if El.NodeType='WS' then
			begin
            if ((WSName <> '') and (El.NodeName = WSName)) or (WSName = '') then
				begin
				//ComboBoxWS.Items.Add(El.NodeName);
				for j:=0 to El.WSParameters.RequestClass.Count-1 do
					begin
					ModelEl := Model_Element(El.WSParameters.RequestClass[j]);
					if StringGridJobs.Cells[0,1] <> '' then
						StringGridJobs.RowCount:=StringGridJobs.RowCount+1;
					StringGridJobs.Cells[0,StringGridJobs.RowCount-1]:=El.NodeName;
					StringGridJobs.Cells[1,StringGridJobs.RowCount-1]:=FormConnect.IDToName(ModelEl.ServID_);
					StringGridJobs.Cells[2,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.Size_);
					StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.AnsSize_);
                    StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeWS * 1000, ffFixed, 5, 3);
                    StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeServ * 1000, ffFixed, 5, 3);
					StringGridJobs.Cells[6,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeCycle * 1000, ffFixed, 5, 3);
					StringGridJobs.Cells[7,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.PossibleTime);
					StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.PossiblePercent);
					StringGridJobs.Cells[9,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.Priority);
					StringGridJobs.Cells[10,StringGridJobs.RowCount-1]:=IntToStr(Ord(ModelEl.DistOfServerDelay));
					StringGridJobs.Cells[11,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.HopDelay2 * 1000, ffFixed, 5, 3);
					end;
				end;
			end;
		//if El.NodeType='SERV' then
		//	ComboBoxSERV.Items.Add(El.NodeName);
		end;

	StringGridJobs.Row := 1;
	StringGridJobsClick(nil);
end;

//==========================================================================
// Создание формы и настройка видимости столбцов
//==========================================================================
procedure TFormJobs.FormCreate(Sender: TObject);
begin
{	StringGridJobs.ColWidths[0]:=Panel1.Width-1;
	StringGridJobs.ColWidths[1]:=Panel2.Width-1;
	StringGridJobs.ColWidths[2]:=Panel3.Width-1;
	StringGridJobs.ColWidths[3]:=Panel4.Width-1;
	StringGridJobs.ColWidths[4]:=Panel5.Width-1;
	StringGridJobs.ColWidths[5]:=Panel6.Width-1;
	StringGridJobs.ColWidths[6]:=Panel7.Width-1;
	StringGridJobs.ColWidths[7]:=Panel8.Width-1;
}
	StringGridJobs.Cells[0,0]:='Клиент';
	StringGridJobs.Cells[1,0]:='Сервер';
   	StringGridJobs.Cells[2,0]:='Запрос';
	StringGridJobs.Cells[3,0]:='Ответ';
	StringGridJobs.Cells[4,0]:='Подготовка';
	StringGridJobs.Cells[5,0]:='Обработка';
	StringGridJobs.Cells[6,0]:='Время цикла';
    //////////////////////////////////////////
	StringGridJobs.Cells[7,0]:='Допуст. время';
	StringGridJobs.Cells[8,0]:='Допуст. %';
	StringGridJobs.Cells[9,0]:='Приоритет';
	StringGridJobs.Cells[10,0]:='Распределение';
	StringGridJobs.Cells[11,0]:='Граница';

    StringGridJobs.ColWidths[7]:=0;
    StringGridJobs.ColWidths[8]:=0;
    StringGridJobs.ColWidths[9]:=0;
    StringGridJobs.ColWidths[10]:=0;
    StringGridJobs.ColWidths[11]:=0;
end;

//==========================================================================
// Сохранение введенных и отредактированных заявок
//==========================================================================
procedure TFormJobs.BitBtnApplyClick(Sender: TObject);
var i, j : Integer;
    El : TOrlan;
begin
 Project_Modified:=True;

 for i:=0 to Nodes.Count-1 do
 begin
   El := TOrLAN(Nodes[i]);
   if ((El.NodeType='WS') and (WSName='')) or ((El.NodeType='WS') and (El.NodeName=WSName) and (WSName<>'')) then
   begin
     for j:=0 to El.WSParameters.RequestClass.Count-1 do
        El.WSParameters.RequestClass.Items[j]:=nil;
     El.WSParameters.RequestClass.Pack;

     for j:=1 to StringGridJobs.RowCount-1 do
       if StringGridJobs.Cells[0,j] = El.NodeName then
       begin
          New(Model_Elem);
          Model_Elem.ServID_ := FormConnect.NameToID(StringGridJobs.Cells[1,j]);
          Model_Elem.Size_ := StrToInt(StringGridJobs.Cells[2,j]);
          Model_Elem.AnsSize_ := StrToInt(StringGridJobs.Cells[3,j]);
          Model_Elem.TimeWS := StrToFloat(StringGridJobs.Cells[4,j]) / 1000;
          Model_Elem.TimeServ := StrToFloat(StringGridJobs.Cells[5,j]) / 1000;
          Model_Elem.TimeCycle := StrToFloat(StringGridJobs.Cells[6,j]) / 1000;
          Model_Elem.PossibleTime := StrToInt(StringGridJobs.Cells[7,j]);
          Model_Elem.PossiblePercent := StrToInt(StringGridJobs.Cells[8,j]);
          Model_Elem.Priority := StrToInt(StringGridJobs.Cells[9,j]);
          Model_Elem.DistOfServerDelay := IntToDistr(StrToInt(StringGridJobs.Cells[10,j]));
          //if Model_Elem.DistOfServerDelay<>Uniform then
          Model_Elem.HopDelay2 := 0;
          //else
          //  Model_Elem.HopDelay2 := StrToFloat(StringGridJobs.Cells[11,j]) / 1000;
          Model_Elem.MaxServTime := 0;
          El.WSParameters.RequestClass.Add(Model_Elem);
       end;
   end;
 end;

 ModalResult := 1;
end;

procedure TFormJobs.StringGridJobsClick(Sender: TObject);
begin
 {if StringGridJobs.Cells[0,0] = '' then
 begin
  if WSName = '' then
    ComboBoxWS.ItemIndex := -1
  else
    ComboBoxWS.ItemIndex := ComboBoxWS.Items.IndexOf( WSName );

   ComboBoxSERV.ItemIndex := -1;
   EditSize.Text := '';
   CheckNeedAns.Checked := False;
   EditAnsSize.Text := '128';
   EditTimeWS.Text := '';
   EditTimeSERV.Text := '';
   EditTimeCycle.Text := '';
 end
 else
 begin
   ComboBoxWS.ItemIndex:=ComboBoxWS.Items.IndexOf(StringGridJobs.Cells[0,StringGridJobs.Row]);
   ComboBoxSERV.ItemIndex:=ComboBoxSERV.Items.IndexOf(StringGridJobs.Cells[1,StringGridJobs.Row]);
   EditSize.Text := StringGridJobs.Cells[2,StringGridJobs.Row];

   if StrToFloat(StringGridJobs.Cells[3,StringGridJobs.Row]) = 0 then
   begin
     CheckNeedAns.Checked := False;
     EditAnsSize.Text := '128';
   end
   else
   begin
     CheckNeedAns.Checked := True;
     EditAnsSize.Text := StringGridJobs.Cells[3,StringGridJobs.Row];
   end;

   EditTimeWS.Text := StringGridJobs.Cells[4,StringGridJobs.Row];
   EditTimeSERV.Text := StringGridJobs.Cells[5,StringGridJobs.Row];
   EditTimeCycle.Text := StringGridJobs.Cells[6,StringGridJobs.Row];
   EditPossTime.Text := StringGridJobs.Cells[7,StringGridJobs.Row];
   EditPossPercent.Text := StringGridJobs.Cells[8,StringGridJobs.Row];
   EditPriority.Text := StringGridJobs.Cells[9,StringGridJobs.Row];
 end;}
end;

procedure TFormJobs.BitBtnAddClick(Sender: TObject);
begin
   //if AllValid = False then
   //   exit;

   if StringGridJobs.Cells[0,1] <> '' then
     StringGridJobs.RowCount:=StringGridJobs.RowCount+1;

   StringGridJobs.Cells[0,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[0,StringGridJobs.Row];
   StringGridJobs.Cells[1,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[1,StringGridJobs.Row];
   StringGridJobs.Cells[2,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[2,StringGridJobs.Row];
   StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[4,StringGridJobs.Row];
   StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[5,StringGridJobs.Row];
   StringGridJobs.Cells[6,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[6,StringGridJobs.Row];
   StringGridJobs.Cells[7,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[7,StringGridJobs.Row];
   StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[8,StringGridJobs.Row];
   StringGridJobs.Cells[9,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[9,StringGridJobs.Row];
   StringGridJobs.Cells[10,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[10,StringGridJobs.Row];
   StringGridJobs.Cells[11,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[11,StringGridJobs.Row];

  if StrToFloat(StringGridJobs.Cells[3,StringGridJobs.Row])>0 then
    StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:=StringGridJobs.Cells[3,StringGridJobs.Row]
  else
    StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:='0';

   StringGridJobs.Row := StringGridJobs.RowCount-1;

   // Откроем окно для редактирования только что добавленной заявки
   ////////////////////////////////////////////////
   StringGridJobsDblClick(nil);
end;

{procedure TFormJobs.BitBtnReplaceClick(Sender: TObject);
begin
  //if AllValid = False then
  //  exit;

  StringGridJobs.Cells[0,StringGridJobs.Row]:=ComboBoxWS.Items[ComboBoxWS.ItemIndex];
  StringGridJobs.Cells[1,StringGridJobs.Row]:=ComboBoxSERV.Items[ComboBoxSERV.ItemIndex];
  StringGridJobs.Cells[2,StringGridJobs.Row]:=EditSize.Text;
  StringGridJobs.Cells[4,StringGridJobs.Row]:=EditTimeWS.Text;
  StringGridJobs.Cells[5,StringGridJobs.Row]:=EditTimeServ.Text;
  StringGridJobs.Cells[6,StringGridJobs.Row]:=EditTimeCycle.Text;
  StringGridJobs.Cells[7,StringGridJobs.Row]:=EditPossTime.Text;
  StringGridJobs.Cells[8,StringGridJobs.Row]:=EditPossPercent.Text;
  StringGridJobs.Cells[9,StringGridJobs.Row]:=EditPriority.Text;

  if CheckNeedAns.Checked=True then
    StringGridJobs.Cells[3,StringGridJobs.Row]:=EditAnsSize.Text
  else
    StringGridJobs.Cells[3,StringGridJobs.Row]:='0';
end;}

procedure TFormJobs.BitBtnDeleteClick(Sender: TObject);
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

procedure TFormJobs.BitBtnCancelClick(Sender: TObject);
begin
   ModalResult := 1;
end;

{procedure TFormJobs.EditPriorityExit(Sender: TObject);
begin
	if ( EditPriority.Text='' ) or  ( EditPriority.Value=0 ) Then
		EditPriority.Value:=1;
end;

procedure TFormJobs.EditPossPercentExit(Sender: TObject);
begin
	if ( EditPossPercent.Text='' ) or  ( EditPossPercent.Value=0 ) Then
		EditPossPercent.Value:=1;
end; }

procedure TFormJobs.StringGridJobsDblClick(Sender: TObject);
begin
    EditFlag:=true;
    JobOptionsForm.ShowModal;
end;

procedure TFormJobs.BitBtnReplaceClick(Sender: TObject);
begin
    StringGridJobsDblClick(nil);
end;

procedure TFormJobs.Button1Click(Sender: TObject);
begin
    EditFlag:=false;
    JobOptionsForm.ShowModal;
end;

end.
