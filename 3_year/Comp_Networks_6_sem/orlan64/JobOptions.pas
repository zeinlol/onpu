// ********************************************************************
//  JobOoptions.pas
//
//  ћодуль установки параметров классов за€вок
// ********************************************************************

unit JobOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Mask, Spin, ExtCtrls;

type
  TJobOptionsForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    bbOK: TBitBtn;
    bbCancel: TBitBtn;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cbClient: TComboBox;
    cbServer: TComboBox;
    Image1: TImage;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label17: TLabel;
    Image2: TImage;
    chbAnswer: TCheckBox;
    edQuery: TEdit;
    edAnswer: TEdit;
    edPrepearing: TEdit;
    edProcessing: TEdit;
    edCycleTime: TEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    sePriority: TSpinEdit;
    sePossPercent: TSpinEdit;
    edPossTime: TEdit;
    Image3: TImage;
    cbDistr: TComboBox;
    edProcessing2: TEdit;
    Label18: TLabel;
    Bevel1: TBevel;
    procedure FormShow(Sender: TObject);
    procedure bbOKClick(Sender: TObject);
    procedure sePriorityChange(Sender: TObject);
    procedure sePossPercentChange(Sender: TObject);
    procedure edPrepearingChange(Sender: TObject);
    function  AllValid() : Boolean;
    procedure edProcessingChange(Sender: TObject);
    procedure edCycleTimeChange(Sender: TObject);
    procedure chbAnswerClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  JobOptionsForm: TJobOptionsForm;

implementation

uses fjobs, orlan, main;

{$R *.DFM}

//_=============================================================================
// ќткрытие окна с параметрами текущей за€вки
//_=============================================================================
procedure TJobOptionsForm.FormShow(Sender: TObject);
var i: integer;
    El : TOrlan;

begin
    // јктивизируем первую закладку
    PageControl1.ActivePageIndex:=0;

    // ≈сли редактирование, то покажем параметры тек. за€вки
    if EditFlag=true then
        begin
        cbClient.ItemIndex:=cbClient.Items.IndexOf(FormJobs.StringGridJobs.Cells[0,FormJobs.StringGridJobs.Row]);
        cbServer.ItemIndex:=cbServer.Items.IndexOf(FormJobs.StringGridJobs.Cells[1,FormJobs.StringGridJobs.Row]);
        edQuery.text:=FormJobs.StringGridJobs.Cells[2,FormJobs.StringGridJobs.Row];
        edAnswer.Text:=FormJobs.StringGridJobs.Cells[3,FormJobs.StringGridJobs.Row];
        if StrToFloat(edAnswer.text)>0 then
            begin
            chbAnswer.Checked:=true;
            edAnswer.Enabled:=true;
            end
        else
            begin
            chbAnswer.Checked:=false;
            edAnswer.Enabled:=false;
            end;
        edPrepearing.text:=FormJobs.StringGridJobs.Cells[4,FormJobs.StringGridJobs.Row];
        edProcessing.text:=FormJobs.StringGridJobs.Cells[5,FormJobs.StringGridJobs.Row];
        edCycleTime.text:=FormJobs.StringGridJobs.Cells[6,FormJobs.StringGridJobs.Row];
        edPossTime.text:=FormJobs.StringGridJobs.Cells[7,FormJobs.StringGridJobs.Row];
        sePossPercent.text:=FormJobs.StringGridJobs.Cells[8,FormJobs.StringGridJobs.Row];
        sePriority.text:=FormJobs.StringGridJobs.Cells[9,FormJobs.StringGridJobs.Row];
        cbDistr.ItemIndex:=StrToInt(FormJobs.StringGridJobs.Cells[10,FormJobs.StringGridJobs.Row]);
        edProcessing2.text:='0';//FormJobs.StringGridJobs.Cells[11,FormJobs.StringGridJobs.Row];
        end
    else
    	// установим значени€ по умолчанию
    	begin
        cbClient.ItemIndex:=-1;
        cbServer.ItemIndex:=-1;
        edQuery.text:='0';
        edAnswer.Text:='0';
        chbAnswer.Checked:=false;
        edAnswer.Enabled:=false;
        edPrepearing.text:='0';
        edProcessing.text:='0';
        edCycleTime.text:='0';
        edPossTime.text:='0';
        sePossPercent.text:='10';
        sePriority.text:='1';
        cbDistr.ItemIndex:=0;
        end;
end;

//_=============================================================================
// «акрытие окна с сохранением параметров текущей за€вки
//_=============================================================================
procedure TJobOptionsForm.bbOKClick(Sender: TObject);
begin
	if AllValid()=false then
    	begin
    	modalResult:=0;
        exit;
        end;

	// если не редактируем - значит добавл€ем => добавим одну строку
	if EditFlag=false then
    	begin
		if FormJobs.StringGridJobs.Cells[0,1] <> '' then
			FormJobs.StringGridJobs.RowCount:=FormJobs.StringGridJobs.RowCount+1;
		FormJobs.StringGridJobs.Row:=FormJobs.StringGridJobs.RowCount-1;
    	end;

    // —охраним измененные параметры за€вки
    FormJobs.StringGridJobs.Cells[0,FormJobs.StringGridJobs.Row]:=cbClient.Items[cbClient.ItemIndex];
    FormJobs.StringGridJobs.Cells[1,FormJobs.StringGridJobs.Row]:=cbServer.Items[cbServer.ItemIndex];
    FormJobs.StringGridJobs.Cells[2,FormJobs.StringGridJobs.Row]:=edQuery.text;
    if (chbAnswer.Checked=true) then
        FormJobs.StringGridJobs.Cells[3,FormJobs.StringGridJobs.Row]:=edAnswer.Text
    else
        FormJobs.StringGridJobs.Cells[3,FormJobs.StringGridJobs.Row]:='0';
	FormJobs.StringGridJobs.Cells[4,FormJobs.StringGridJobs.Row]:=edPrepearing.text;
    FormJobs.StringGridJobs.Cells[5,FormJobs.StringGridJobs.Row]:=edProcessing.text;
    FormJobs.StringGridJobs.Cells[6,FormJobs.StringGridJobs.Row]:=edCycleTime.text;
    FormJobs.StringGridJobs.Cells[7,FormJobs.StringGridJobs.Row]:=edPossTime.text;
    FormJobs.StringGridJobs.Cells[8,FormJobs.StringGridJobs.Row]:=sePossPercent.text;
    FormJobs.StringGridJobs.Cells[9,FormJobs.StringGridJobs.Row]:=sePriority.text;
    FormJobs.StringGridJobs.Cells[10,FormJobs.StringGridJobs.Row]:=IntToStr(cbDistr.ItemIndex);
    FormJobs.StringGridJobs.Cells[11,FormJobs.StringGridJobs.Row]:=edProcessing2.text;

end;

// ===========================================================================
// ѕроверка
// ===========================================================================
function TJobOptionsForm.AllValid() : Boolean;
begin
 AllValid := False;

 if cbClient.Text = '' then
 begin
 	Application.MessageBox('¬ыберите станцию-клиент дл€ за€вки.', 'OrLAN', MB_OK+MB_IconInformation);
    Exit;
 end;

 if cbServer.Text = '' then
 begin
 	Application.MessageBox( '¬ыберите станцию-сервер дл€ за€вки.', 'OrLAN', MB_OK+MB_IconInformation);
    Exit;
 end;


 try
   StrToInt(edQuery.Text);
 except
   edQuery.Text:='0';
   Application.MessageBox( 'Ќеверно указан размер за€вки', 'OrLAN', MB_OK+MB_IconInformation);
   Exit;
 end;

 if chbAnswer.Checked=True then
 begin
   try
     StrToInt(edAnswer.Text);
   except
     edAnswer.Text:='0';
	 Application.MessageBox( 'Ќеверно указан размер ответа', 'OrLAN', MB_OK+MB_IconInformation);
     Exit;
   end;
 end;

 try
   StrToFloat(edPrepearing.Text);
 except
   edPrepearing.Text:='0';
   Application.MessageBox( 'Ќеверно указано врем€ подготовки', 'OrLAN', MB_OK+MB_IconInformation);
   Exit;
 end;

 try
   StrToFloat(edProcessing.Text);
 except
   edProcessing.Text:='0';
   Application.MessageBox( 'Ќеверно указано врем€ обработки', 'OrLAN', MB_OK+MB_IconInformation);
   Exit;
 end;

 try
   StrToFloat(edCycleTime.Text);
 except
   edCycleTime.Text:='0';
   Application.MessageBox( 'Ќеверно указано врем€ цикла', 'OrLAN', MB_OK+MB_IconInformation);
   Exit;
 end;

 try
   StrToFloat(edPossTime.Text);
 except
   edPossTime.Text:='0';
   Application.MessageBox( 'Ќеверно указано врем€ передачи', 'OrLAN', MB_OK+MB_IconInformation);
   Exit;
 end;

 try
   StrToFloat(sePossPercent.Text);
 except
   sePossPercent.Text:='0';
   Application.MessageBox( 'Ќеверно указан допустимый процент передачи', 'OrLAN', MB_OK+MB_IconInformation);
   Exit;
 end;

 AllValid := True;
end;

procedure TJobOptionsForm.sePriorityChange(Sender: TObject);
begin
	if ( sePriority.Text='' ) or  ( sePriority.Value=0 ) Then
		sePriority.Value:=1;
end;

procedure TJobOptionsForm.sePossPercentChange(Sender: TObject);
begin
	if ( sePossPercent.Text='' ) or  ( sePossPercent.Value=0 ) Then
		sePossPercent.Value:=1;
end;

procedure TJobOptionsForm.edPrepearingChange(Sender: TObject);
begin
	if edCycleTime.Text='' then
		edCycleTime.Text:=IntToStr(Round(StrToFloat(edPrepearing.Text)+StrToFloat(edProcessing.Text)));
end;

procedure TJobOptionsForm.edProcessingChange(Sender: TObject);
begin
	if edCycleTime.Text='' then
		edCycleTime.Text:=IntToStr(Round(StrToFloat(edPrepearing.Text)+StrToFloat(edProcessing.Text)));
end;

procedure TJobOptionsForm.edCycleTimeChange(Sender: TObject);
begin
	if edCycleTime.Text='' then
		edPossTime.Text:=FloatToStr(StrToFloat(edCycleTime.Text));
end;

procedure TJobOptionsForm.chbAnswerClick(Sender: TObject);
begin
	edAnswer.Enabled:=chbAnswer.Checked;
end;

end.
