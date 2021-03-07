// ********************************************************************
//  orlan32.pas
//
//  Запуск программы
//  Если в командной строке что-то есть - пытаемся открыть файл как проект
//
// ********************************************************************


program orlan32;

{%ToDo 'orlan32.todo'}

uses
  Forms,
  main in 'main.pas' {MainForm},
  about in 'about.pas' {FormAbout},
  user in 'user.pas' {FormWS},
  server in 'server.pas' {FormServer},
  wait in 'wait.pas' {FormWait},
  komm in 'komm.pas' {Form6},
  connect in 'connect.pas' {FormConnect},
  report in 'report.pas' {ReportForm},
  setup in 'setup.pas' {SetupForm},
  find in 'find.pas' {Form10},
  grid in 'grid.pas' {Form11},
  database in 'database.pas' {FormDB},
  splash in 'splash.pas' {SplashForm},
  ex_anal in 'ex_anal.pas' {FormXA},
  preview in 'preview.pas' {Form14},
  ch_cost in 'ch_cost.pas' {CostChangeForm},
  scat_in in 'scat_in.pas' {ScatForm},
  switch in 'switch.pas' {FormSwTime},
  mod_res in 'mod_res.pas' {ModResForm},
  konc in 'konc.pas' {Form20},
  OrLAN in 'OrLAN.pas',
  imit_in in 'imit_in.pas',
  mnetwork in 'mnetwork.pas',
  mjob in 'mjob.pas',
  mnetnode in 'mnetnode.pas',
  mdomain in 'mdomain.pas',
  fjobs in 'fjobs.pas' {FormJobs},
  JobsPack in 'JobsPack.pas' {FormPack},
  JobOptions in 'JobOptions.pas' {JobOptionsForm},
  ap in 'ap.pas' {Form1};

var
	i: integer;
    s: string;
begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  SplashForm.Update;

  Application.HintPause:=1000;

  Application.Initialize;
  Application.Title := 'OrLAN';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormWS, FormWS);
  Application.CreateForm(TFormServer, FormServer);
  Application.CreateForm(TFormWait, FormWait);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormConnect, FormConnect);
  Application.CreateForm(TReportForm, ReportForm);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TFormDB, FormDB);
  Application.CreateForm(TFormXA, FormXA);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TCostChangeForm, CostChangeForm);
  Application.CreateForm(TScatForm, ScatForm);
  Application.CreateForm(TFormSwTime, FormSwTime);
  Application.CreateForm(TModResForm, ModResForm);
  Application.CreateForm(TFormJobs, FormJobs);
  Application.CreateForm(TFormPack, FormPack);
  Application.CreateForm(TJobOptionsForm, JobOptionsForm);

  SplashForm.Hide;
  SplashForm.Free;
  if (ParamStr(1)<>'') then
  	begin
    s:='';
    for i:=1 to ParamCount do
    	begin
        s:=s+ParamStr(i)+' ';
        end;
    s:=Copy(s,1,length(s)-1);
  	mainform.OpenFileByName(s);
    end;

  Application.Run;

end.
