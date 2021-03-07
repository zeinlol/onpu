// ********************************************************************
//  Mod_Res.pas
//
//  Модуль обработки результатов имитационного и аналитичечкого
//  моделирования и вывода их в форму в виде диаграммы
// ********************************************************************

unit mod_res;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, MyChart, StdCtrls, Buttons, orlan, TeEngine, Series, TeeProcs,
  Chart, ComCtrls, Math, Grids;

type
  TModResForm = class(TForm)
    BitBtnOk: TBitBtn;
    TabControl1: TTabControl;
    Chart1: TChart;
    Chart2: TChart;
    SeriesAnal: TBarSeries;
    SeriesImit: TBarSeries;
    BarSeriesAnal: TLineSeries;
    BarSeriesImit: TLineSeries;
    BitBtnSave: TBitBtn;
    SaveDialog1: TSaveDialog;
    StringGridJobs: TStringGrid;
    Panel0: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    LabelLegend: TLabel;
    ComboBoxNodes: TComboBox;
    LabelNode: TLabel;
    ComboBoxSteps: TComboBox;
    LabelStep: TLabel;
    CheckBoxShowSum: TCheckBox;
    LabelNote: TLabel;
    BitBtnAssign: TBitBtn;
    Panel8: TPanel;
    LabelTotal: TLabel;
    BitBtnNext: TBitBtn;
    BitBtnPrev: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnPrevClick(Sender: TObject);
    procedure BitBtnNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxNodesChange(Sender: TObject);
    procedure ComboBoxStepsChange(Sender: TObject);
    procedure CheckBoxShowSumClick(Sender: TObject);
    procedure StringGridJobsDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure BitBtnAssignClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModResForm: TModResForm;

implementation

uses main, scat_in, JobsPack, connect;

{$R *.DFM}

//_=====================================================
//_ Открытие формы
//_ Заполнение полей со списком устройств сети
//_ Скрытие/показ элементов управления
//_=====================================================
procedure TModResForm.FormShow(Sender: TObject);
var i:integer;
    El : TOrlan;
begin
    ModResForm.Caption:='Результаты моделирования: объект не выбран.';

	// Очистка поля со списком узлов модели, а затем
	// заполнение списка
	ComboBoxNodes.Items.Clear;
	for i:=0 to Nodes.Count-1 do
		begin
		El := TOrLAN(Nodes[i]);
        // все, что не концентратор попадает в список,
        // поскольку концентратор - просто усилитель (кусок провода)
		if El.NodeType <> 'KONC' then ComboBoxNodes.Items.Add(El.NodeName);
	end;

	// Добавить в список сегменты
	for i:=1 to MaxSegID do
	begin
		ComboBoxNodes.Items.Add( 'Сегмент №' + IntToStr(i) );
	end;

    // Активную станцию (TOrLAN(Nodes[i]).Active=True) выберем
    // и установим в списке ..
	ComboBoxNodes.ItemIndex := -1;
	for i:=0 to Nodes.Count-1 do
		if TOrLAN(Nodes[i]).Active=True then
			ComboBoxNodes.ItemIndex := ComboBoxNodes.Items.IndexOf( TOrLAN(Nodes[i]).NodeName );

    // .. если таковой не оказалось, то выберем сегмент
	if ComboBoxNodes.ItemIndex = -1 then
    	ComboBoxNodes.ItemIndex := Cur_MC + (ComboBoxNodes.Items.Count - MaxSegID - 1);

	// Если моделирование не пакетное, то скроем соответствующие
    // элементы управления
	if Steps = 1 then
		begin
		ComboBoxSteps.Visible := False;
		LabelStep.Visible := False;
		CheckBoxShowSum.Visible := False;
		end
	else
		begin
		ComboBoxSteps.Visible := True;
		LabelStep.Visible := True;
		CheckBoxShowSum.Visible := True;
		end;

	CheckBoxShowSumClick(nil);
	ComboBoxStepsChange(nil);
end;

//=====================================================
// Закрываем модальное окно результатов моделирования
// установкой ModalResult в 1
//=====================================================
procedure TModResForm.BitBtnOkClick(Sender: TObject);
begin
	NeedRepaint := True;
	ModResForm.ModalResult:=1;
end;

//=====================================================
// При смене закладки
//=====================================================
procedure TModResForm.TabControl1Change(Sender: TObject);
var i,j,z,nBeg:integer;
	rValue : real;
	rTotalImit : real;
	rTotalScat : real;
	dMax : real;
	NodeIndx : Integer;

begin
	// Вывод в заголовке имени активного узла ..
	NodeIndx := -1;
	for i:=0 to Nodes.Count-1 do
	if TOrLAN(Nodes[i]).Active=True then
		begin
		NodeIndx := i;
		Caption:='Результаты моделирования для узла "'+ TOrLAN(Nodes[i]).NodeName + '"';
		break;
		end;

	// .. если такового не оказалось, то вывод №-ра сегмента
	if NodeIndx = -1 then
		begin
		NodeIndx := Number_of_Workstations + Number_of_Servers + Number_of_Kommutators + Cur_MC - 1;
		Caption:='Результаты моделирования для сегмента №' + IntToStr(Cur_MC);
		end;

   	// Отключить подстройку под максимальное значение для
    // левой оси + показать лейблы списка узлов сети и заголовка списка
	Chart1.LeftAxis.AutomaticMaximum := False;
	Chart2.LeftAxis.AutomaticMaximum := False;
	LabelTotal.Caption := 'Сумма: ';
	ComboBoxNodes.Visible := True;
	LabelNode.Visible := True;

    // Если моделирование НЕ пакетное ->
	if CheckBoxShowSum.Checked = False then
	{ShowSum}
		begin
        // Очистка серий
		SeriesAnal.Clear;
		SeriesImit.Clear;

		nBeg := 0;
		for i := 0 to ComboBoxSteps.ItemIndex-1 do
			Inc (nBeg, JobsPerStep[i]);
		try

        // если выбрана закладка "Качество передачи"
        if TabControl1.TabIndex = 7 then
			begin
			Chart1.LeftAxis.Minimum := 0;
			Chart1.LeftAxis.AutomaticMaximum := True;
			ComboBoxNodes.Visible := False;
			LabelNode.Visible := False;
			if WasImit = True then
				begin
				rTotalImit := 0;
				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := StrToFloat(ScatForm.StringGridImit.Cells[j,ScatForm.StringGridImit.RowCount-2]);
                    SeriesAnal.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					rValue := StrToFloat(ScatForm.StringGridImit.Cells[j,ScatForm.StringGridImit.RowCount-1]);
					SeriesImit.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					end;
				//LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalImit, ffFixed, 5,2 ) + '-имитация   ';
				end;
			end;

        // если выбрана закладка "Передано заявок"
        if TabControl1.TabIndex = 6 then
			begin
			Chart1.LeftAxis.Minimum := 0;
			Chart1.LeftAxis.AutomaticMaximum := True;
			ComboBoxNodes.Visible := False;
			LabelNode.Visible := False;
			if WasImit = True then
				begin
				rTotalImit := 0;
				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := StrToFloat(ScatForm.StringGridImit.Cells[j,ScatForm.StringGridImit.RowCount-3]);
					rTotalImit := rTotalImit + rValue;
                    SeriesAnal.Add( 0.0,'', clTeeColor);
					SeriesImit.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					end;
				LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalImit, ffFixed, 5,2 ) + '-имитация   ';
				end;
			end;

        // если выбрана закладка "Максимальное время передачи"
        if TabControl1.TabIndex = 5 then
			begin
			Chart1.LeftAxis.Minimum := 0;
			Chart1.LeftAxis.AutomaticMaximum := True;
			ComboBoxNodes.Visible := False;
			LabelNode.Visible := False;
			if WasImit = True then
				begin
				rTotalImit := 0;
				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := StrToFloat(ScatForm.StringGridImit.Cells[j,ScatForm.StringGridImit.RowCount-4]);
					rTotalImit := rTotalImit + rValue;
                    SeriesAnal.Add( 0.0,'', clTeeColor);
					SeriesImit.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					end;
				LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalImit, ffFixed, 5,2 ) + '-имитация   ';
				end;
			end;

        // если выбрана закладка "Время передачи"
        if TabControl1.TabIndex = 4 then
			begin
			Chart1.LeftAxis.Minimum := 0;
			Chart1.LeftAxis.AutomaticMaximum := True;
			ComboBoxNodes.Visible := False;
			LabelNode.Visible := False;
			if WasScat = True then
               	begin
				rTotalScat := 0;
   				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := 0.0;
					for i := (ScatForm.StringGridAnalAll.RowCount div 4) to (ScatForm.StringGridAnalAll.RowCount div 4) * 2 - 2 do
						rValue := rValue + StrToFloat(ScatForm.StringGridAnalAll.Cells[j,i]);
					rTotalScat := rTotalScat + rValue;
					SeriesAnal.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					end;
		       	LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalScat, ffFixed, 5,2 ) + '-аналитика   ';
                end;

			if WasImit = True then
				begin
				rTotalImit := 0;
				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := 0.0;
					for i := (ScatForm.StringGridImitAll.RowCount div 4) to (ScatForm.StringGridImitAll.RowCount div 4) * 2 - 1 do
						rValue := rValue + StrToFloat(ScatForm.StringGridImitAll.Cells[j,i]);
					rTotalImit := rTotalImit + rValue;
					SeriesImit.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					end;
				LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalImit, ffFixed, 5,2 ) + '-имитация   ';
				end;
			end;
        // если не "Время передачи"
		if TabControl1.TabIndex < 4 then
           	begin
			dMax := 0;
            // находим максимальное значение для имитационного и аналитического
            // моделирования, проверяя при этом выполнялось ли оно

            // выполнялось аналитическое моделирование
			if WasScat = True then
            	// цикл по всем столбцам ..
				for i:=0 to ScatForm.StringGridAnalAll.ColCount-1 do
                	// .. и по строкам
					for j:=(ScatForm.StringGridAnalAll.RowCount div 4) * TabControl1.TabIndex to (ScatForm.StringGridAnalAll.RowCount div 4) * (TabControl1.TabIndex + 1) - 2 do
						dMax := Max( dMax, StrToFloat(ScatForm.StringGridAnalAll.Cells[i,j]));

            // выполнялось имитационное моделирование
			if WasImit = True then
				for i:=0 to ScatForm.StringGridImitAll.ColCount-1 do
					for j:=(ScatForm.StringGridImitAll.RowCount div 4) * TabControl1.TabIndex to (ScatForm.StringGridImitAll.RowCount div 4) * (TabControl1.TabIndex + 1) - 1 do
						dMax := Max( dMax, StrToFloat(ScatForm.StringGridImitAll.Cells[i,j]));

            // если все ячейки были нулевыми, тогда маХимум = 0.1
			if dMax = 0.0 then
            	dMax := 1.0;

            // минимальное значение
			Chart1.LeftAxis.Minimum := 0;

            // автоподстройка оси под маХимум
			Chart1.LeftAxis.AutomaticMaximum := True;

            // выполнялась аналитика
			if WasScat = True then
				begin
				rTotalScat := 0;

                // в случае НЕпакетного моделирования в массиве JobsPerStep
                // хранится количество классов заявок
				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := StrToFloat(ScatForm.StringGridAnalAll.Cells[j, NodeIndx + (ScatForm.StringGridAnalAll.RowCount div 4) * TabControl1.TabIndex]);
					SeriesAnal.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					rTotalScat := rTotalScat + rValue;
					end;
				LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalScat, ffFixed, 5,2 ) + '-аналитика   ';
        		end;

			if WasImit = True then
				begin
				rTotalImit := 0;
				for j:=nBeg to nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1 do
					begin
					rValue := StrToFloat(ScatForm.StringGridImitAll.Cells[j,NodeIndx + (ScatForm.StringGridImitAll.RowCount div 4) * TabControl1.TabIndex]);
					//TChart требует добавления Series1 перед добавлением Series2
					if WasScat = False then
						SeriesAnal.Add( 0.0,'', clTeeColor);
					SeriesImit.Add( StrToFloat(FloatToStrF(rValue,ffFixed,4,2)),'', clTeeColor);
					rTotalImit := rTotalImit + rValue;
					end;
				LabelTotal.Caption := LabelTotal.Caption + FloatToStrF( rTotalImit, ffFixed, 5,2 ) + '-имитация   ';
				end;
			end;
		except
	on E:Exception do
		MessageDlg(E.Message, mtError, [mbOk], 0);
	end;
	end
	else
	{Don't Show Sum}

		// Если моделирование пакетное ->
	    /////////////////////////////////////////////////////
		begin
		BarSeriesAnal.Clear;	//очистка серий
		BarSeriesImit.Clear;	//очистка серий
		if TabControl1.TabIndex = 1 then
			begin
			Chart2.LeftAxis.Minimum := 0;				//минимум=0
			Chart2.LeftAxis.AutomaticMaximum := True;   //автомасштабирование
			ComboBoxNodes.Visible := False;             //скрыть поле с узлами
			LabelNode.Visible := False;

	        // если выполнялось аналитическое моделирование
			if WasScat = True then
				begin
				nBeg := 0;
				for z := 0 to Steps-1 do
					begin
					rTotalScat := 0;
					for j:=nBeg to nBeg + JobsPerStep[z]-1 do
						for i := (ScatForm.StringGridAnalAll.RowCount div 4) to (ScatForm.StringGridAnalAll.RowCount div 4) * 2 - 2 do
							begin
							rValue := StrToFloat(ScatForm.StringGridAnalAll.Cells[j,i]);
							rTotalScat := rTotalScat + rValue;
							end;
					BarSeriesAnal.Add( StrToFloat(FloatToStrF(rTotalScat,ffFixed,4,2)),IntToStr(z + 1), clTeeColor);
					Inc( nBeg, JobsPerStep[z] );
				 	end;
				end;

			if WasImit = True then
				begin
				nBeg := 0;
				for z := 0 to Steps-1 do
					begin
					rTotalImit := 0;
					for j:=nBeg to nBeg + JobsPerStep[z]-1 do
						for i := (ScatForm.StringGridImitAll.RowCount div 4) to (ScatForm.StringGridImitAll.RowCount div 4) * 2 - 1 do
							begin
							rValue := StrToFloat(ScatForm.StringGridImitAll.Cells[j,i]);
							rTotalImit := rTotalImit + rValue;
							end;
		 			if WasScat = False then
		               	BarSeriesAnal.Add( 0.0,'', clTeeColor);
					BarSeriesImit.Add( StrToFloat(FloatToStrF(rTotalImit,ffFixed,4,2)),IntToStr(z + 1), clTeeColor);
					Inc( nBeg, JobsPerStep[z] );
				   	end;
				end;
			end

	else

		begin
		dMax := 0;

		if WasScat = True then
			begin
			for i:=(ScatForm.StringGridAnalAll.RowCount div 4) * TabControl1.TabIndex to (ScatForm.StringGridAnalAll.RowCount div 4) * (TabControl1.TabIndex + 1) - 2 do
				begin
				nBeg := 0;
				for z := 0 to Steps-1 do
					begin
					rTotalScat := 0;
					for j:=nBeg to nBeg + JobsPerStep[z]-1 do
						begin
						rValue := StrToFloat(ScatForm.StringGridAnalAll.Cells[j,i]);
						rTotalScat := rTotalScat + rValue;
						end;
						dMax := Max( dMax, rTotalScat );
						Inc( nBeg, JobsPerStep[z] );
					end;
				end;
			end;

		if WasImit = True then
        begin
         for i:=(ScatForm.StringGridImitAll.RowCount div 4) * TabControl1.TabIndex to (ScatForm.StringGridImitAll.RowCount div 4) * (TabControl1.TabIndex + 1) - 1 do
         begin
           nBeg := 0;
           for z := 0 to Steps-1 do
           begin
             rTotalImit := 0;
             for j:=nBeg to nBeg + JobsPerStep[z]-1 do
             begin
               rValue := StrToFloat(ScatForm.StringGridImitAll.Cells[j,i]);
               rTotalImit := rTotalImit + rValue;
             end;
             dMax := Max( dMax, rTotalImit );
             Inc( nBeg, JobsPerStep[z] );
           end;
         end;
       end;

       if dMax = 0.0 then
         dMax := 1.0;

       dMax := dMax * 1.01;

       Chart2.LeftAxis.Minimum := 0;
{       Chart2.LeftAxis.Maximum := dMAx;}
       Chart2.LeftAxis.AutomaticMaximum := True;

       if WasScat = True then
       begin
         nBeg := 0;
         for z := 0 to Steps-1 do
         begin
           rTotalScat := 0;
           for j:=nBeg to nBeg + JobsPerStep[z]-1 do
           begin
             rValue := StrToFloat(ScatForm.StringGridAnalAll.Cells[j,NodeIndx + (ScatForm.StringGridAnalAll.RowCount div 4) * TabControl1.TabIndex]);
             rTotalScat := rTotalScat + rValue;
           end;
           BarSeriesAnal.Add( StrToFloat(FloatToStrF(rTotalScat,ffFixed,4,2)),IntToStr(z + 1), clTeeColor);
           Inc( nBeg, JobsPerStep[z] );
         end;
       end;

       if WasImit = True then
       begin
         nBeg := 0;
         for z := 0 to Steps-1 do
         begin
           rTotalImit := 0;
           for j:=nBeg to nBeg + JobsPerStep[z]-1 do
           begin
             rValue := StrToFloat(ScatForm.StringGridImitAll.Cells[j,NodeIndx + (ScatForm.StringGridImitAll.RowCount div 4) * TabControl1.TabIndex]);
             rTotalImit := rTotalImit + rValue;
           end;

           if WasScat = False then
             BarSeriesAnal.Add( 0.0,'', clTeeColor);

           BarSeriesImit.Add( StrToFloat(FloatToStrF(rTotalImit,ffFixed,4,2)),IntToStr(z + 1), clTeeColor);
           Inc( nBeg, JobsPerStep[z] );
         end;
       end;



     end;
 end;
end;

procedure TModResForm.BitBtnSaveClick(Sender: TObject);
begin

 if CheckBoxShowSum.Checked = True then
   if SaveDialog1.Execute then
   begin
     case SaveDialog1.FilterIndex of
      1: Chart2.SaveToBitmapFile(ChangeFileExt(SaveDialog1.FileName,'.bmp'));
      2: Chart2.SaveToMetafile(ChangeFileExt(SaveDialog1.FileName,'.wmf'));
     end;
   end
 else
   if SaveDialog1.Execute then
   begin
     case SaveDialog1.FilterIndex of
      1: Chart1.SaveToBitmapFile(ChangeFileExt(SaveDialog1.FileName,'.bmp'));
      2: Chart1.SaveToMetafile(ChangeFileExt(SaveDialog1.FileName,'.wmf'));
     end;
   end;

   ////////////////////////////////////////
      if SaveDialog1.Execute then
   begin
     case SaveDialog1.FilterIndex of
      1: Chart1.SaveToBitmapFile(ChangeFileExt(SaveDialog1.FileName,'.bmp'));
      2: Chart1.SaveToMetafile(ChangeFileExt(SaveDialog1.FileName,'.wmf'));
     end;
   end;

   end;


procedure TModResForm.BitBtnPrevClick(Sender: TObject);
begin
   Chart1.PreviousPage;
end;

procedure TModResForm.BitBtnNextClick(Sender: TObject);
begin
   Chart1.NextPage;
end;

procedure TModResForm.FormCreate(Sender: TObject);
begin
 StringGridJobs.ColWidths[0]:=Panel0.Width;
 StringGridJobs.ColWidths[1]:=Panel1.Width;
 StringGridJobs.ColWidths[2]:=Panel2.Width;
 StringGridJobs.ColWidths[3]:=Panel3.Width;
 StringGridJobs.ColWidths[4]:=Panel4.Width;
 StringGridJobs.ColWidths[5]:=Panel5.Width;
 StringGridJobs.ColWidths[6]:=Panel6.Width;
 StringGridJobs.ColWidths[7]:=Panel7.Width;
 StringGridJobs.ColWidths[8]:=0;
end;

procedure TModResForm.ComboBoxNodesChange(Sender: TObject);
var i : Integer;
    El : TOrlan;
begin
 for i:=0 to Nodes.Count-1 do
 begin
   El := TOrLAN(Nodes[i]);
   El.Active := False;
 end;

 Cur_MC := -1;

 if ComboBoxNodes.ItemIndex = -1 then exit;

 for i:=0 to Nodes.Count-1 do
 begin
   El := TOrLAN(Nodes[i]);
   if El.NodeName = ComboBoxNodes.Items[ ComboBoxNodes.ItemIndex ] then
   begin
     El.Active := True;

     ComboBoxStepsChange(nil );
     break;
   end;
 end;

 Cur_MC := ComboBoxNodes.ItemIndex - (ComboBoxNodes.Items.Count - MaxSegID - 1);
 ComboBoxStepsChange(nil );
end;

procedure TModResForm.ComboBoxStepsChange(Sender: TObject);
var i, j, nBeg : Integer;
    El : TOrlan;
    ModelEl : Model_Element;
begin

 StringGridJobs.RowCount:=1;
 for i:=0 to StringGridJobs.ColCount-1 do
   StringGridJobs.Cells[i,0]:='';

 LabelNote.Visible := False;

 if Steps = 1 then
 begin
   Panel7.Visible := True;
   StringGridJobs.ColWidths[7]:=Panel7.Width;
   BitBtnAssign.Visible := False;

   for i:=0 to Nodes.Count-1 do
   begin
     El := TOrLAN(Nodes[i]);
     if El.NodeType='WS' then
       for j:=0 to El.WSParameters.RequestClass.Count-1 do
       begin
         ModelEl := Model_Element(El.WSParameters.RequestClass[j]);

         if StringGridJobs.Cells[0,0] <> '' then
           StringGridJobs.RowCount:=StringGridJobs.RowCount+1;

         StringGridJobs.Cells[0,StringGridJobs.RowCount-1]:=IntToStr(StringGridJobs.RowCount-1);
         StringGridJobs.Cells[1,StringGridJobs.RowCount-1]:=El.NodeName;
         StringGridJobs.Cells[2,StringGridJobs.RowCount-1]:=FormConnect.IDToName(ModelEl.ServID_);
         StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.Size_);
         StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:=IntToStr(ModelEl.AnsSize_);
         StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeWS * 1000, ffFixed, 5, 3) + ' мс';
         StringGridJobs.Cells[6,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.TimeServ * 1000, ffFixed, 5, 3) + ' мс';
         StringGridJobs.Cells[7,StringGridJobs.RowCount-1]:=FloatToStrF(ModelEl.AdjustedTimeCycle * 1000, ffFixed, 5, 3) + ' мс';

         if ModelEl.AdjustedTimeCycle > (ModelEl.TimeCycle + 0.000000001) then
         begin
           StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:='Превышение';
           LabelNote.Visible := True;
         end
         else
           StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:='';
       end;
   end;
 end
 else
 begin
   Panel7.Visible := False;
   StringGridJobs.ColWidths[7]:=0;
   BitBtnAssign.Visible := True;

   nBeg := 0;
   for i := 0 to ComboBoxSteps.ItemIndex-1 do
      Inc( nBeg, JobsPerStep[i] );

   for i := nBeg to (nBeg + JobsPerStep[ComboBoxSteps.ItemIndex]-1) do
   begin
      if StringGridJobs.Cells[0,0] <> '' then
        StringGridJobs.RowCount:=StringGridJobs.RowCount+1;

      StringGridJobs.Cells[0,StringGridJobs.RowCount-1]:=IntToStr(StringGridJobs.RowCount-1);
      StringGridJobs.Cells[1,StringGridJobs.RowCount-1]:=TOrlan(Nodes[StrToInt(FormPack.StringGridAllSteps.Cells[0, i])]).NodeName;
      StringGridJobs.Cells[2,StringGridJobs.RowCount-1]:=TOrlan(Nodes[StrToInt(FormPack.StringGridAllSteps.Cells[1, i])]).NodeName;
      StringGridJobs.Cells[3,StringGridJobs.RowCount-1]:=FormPack.StringGridAllSteps.Cells[2, i];
      StringGridJobs.Cells[4,StringGridJobs.RowCount-1]:=FormPack.StringGridAllSteps.Cells[3, i];
      StringGridJobs.Cells[5,StringGridJobs.RowCount-1]:=FloatToStrF(StrToFloat(FormPack.StringGridAllSteps.Cells[4, i]) * 1000, ffFixed, 5, 3) + ' мс';
      StringGridJobs.Cells[6,StringGridJobs.RowCount-1]:=FloatToStrF(StrToFloat(FormPack.StringGridAllSteps.Cells[5, i]) * 1000, ffFixed, 5, 3) + ' мс';
      StringGridJobs.Cells[7,StringGridJobs.RowCount-1]:='';
      StringGridJobs.Cells[8,StringGridJobs.RowCount-1]:='';
   end;
 end;

// StringGridJobs.Row := 0;

 Chart2.MaxPointsPerPage := Max(3, Steps);

 if CheckBoxShowSum.Checked = True then
 begin
   BitBtnPrev.Visible := False;
   BitBtnNext.Visible := False;
 end
 else
 begin
   if StringGridJobs.RowCount > Chart1.MaxPointsPerPage then
   begin
     BitBtnPrev.Visible := True;
     BitBtnNext.Visible := True;
   end
   else
   begin
     BitBtnPrev.Visible := False;
     BitBtnNext.Visible := False;
   end;
 end;

 TabControl1Change(nil);
end;

procedure TModResForm.CheckBoxShowSumClick(Sender: TObject);
begin
  LabelTotal.Visible := not CheckBoxShowSum.Checked;
  Chart1.Visible := not CheckBoxShowSum.Checked;
  Chart2.Visible := CheckBoxShowSum.Checked;

  if CheckBoxShowSum.Checked = True then
  begin
    TabControl1.Tabs.Clear;
    TabControl1.Tabs.Add('Длина очереди в узле');
    TabControl1.Tabs.Add('Задержка в сети, [мс]');
    TabControl1.Tabs.Add('Производительность узла');
    TabControl1.Tabs.Add('Загрузка узла, [%]');
  end
  else
  begin
    TabControl1.Tabs.Clear;
    TabControl1.Tabs.Add('Длина очереди в узле');
    TabControl1.Tabs.Add('Задержка узла, [мс]');
    TabControl1.Tabs.Add('Производительность узла');
    TabControl1.Tabs.Add('Загрузка узла, [%]');
    TabControl1.Tabs.Add('Время передачи, [мс]');
    TabControl1.Tabs.Add('Максимальное время передачи, [мс]');
    TabControl1.Tabs.Add('Передано заявок');
    TabControl1.Tabs.Add('Качество передачи, [%]');
  end;

  TabControl1Change(nil);
end;

procedure TModResForm.StringGridJobsDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
 if ACol=7 then
   if StringGridJobs.Cells[ACol+1,ARow]<>'' then
   begin
       StringGridJobs.Canvas.Brush.Color:=clYellow;
       StringGridJobs.Canvas.FillRect(Rect);
       StringGridJobs.Canvas.Font.Color := clBlack;
       StringGridJobs.Canvas.TextOut(
         Rect.Left + Round(StringGridJobs.Canvas.TextWidth('0')/2),
         Round((Rect.Bottom-Rect.Top-StringGridJobs.Canvas.TextHeight(StringGridJobs.Cells[ACol,ARow]))/2)+Rect.Top,
         StringGridJobs.Cells[ACol,ARow]);
   end;
end;

procedure TModResForm.BitBtnAssignClick(Sender: TObject);
begin
  Project_Modified := True;
  FormPack.CopyJobsToNodes( ComboBoxSteps.ItemIndex );
  MessageDlg( 'Набор заявок для текущего шага моделирования скопирован в модель. После завершения просмотра результатов вы можете снова начать моделирование, изменив нагрузку или конфигурацию сети.', mtInformation, [mbOk], 0)
end;

end.
