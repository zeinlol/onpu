// ********************************************************************
//  Main.pas
//
//  Главный модуль:  открывает/закрывает проекты, рисует модель,
//  устанавливает параметры узлов, запускает моделирование и т.д.
//
// ********************************************************************

unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, ToolWin, Menus, ExtCtrls, ExtDlgs, Registry, StdCtrls,
  OrLAN, math, imit_in, QuickRpt, Qrctrls, ImgList, mjob;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    PopupMenuNode: TPopupMenu;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    PrintDialog1: TPrintDialog;
    N_TopProject: TMenuItem;
    N_TopCalc: TMenuItem;
    N_TopProps: TMenuItem;
    N_TopHelp: TMenuItem;
    N_New: TMenuItem;
    N_Open: TMenuItem;
    N_Save: TMenuItem;
    N_SaveAs: TMenuItem;
    N_ProjSep2: TMenuItem;
    N_Exit: TMenuItem;
    N_Express: TMenuItem;
    N_Connect: TMenuItem;
    N_Grid: TMenuItem;
    N_Grid_1: TMenuItem;
    N_Grid_10: TMenuItem;
    N_Grid_20: TMenuItem;
    N_Grid_30: TMenuItem;
    N_Grid_40: TMenuItem;
    N_Grid_User: TMenuItem;
    N_Help_About: TMenuItem;
    N_Help_F1: TMenuItem;
    N_Help_SCAT: TMenuItem;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    SaveDialog2: TSaveDialog;
    N_Settings: TMenuItem;
    N_HelpSep1: TMenuItem;
    N_Print: TMenuItem;
    N_DB: TMenuItem;
    N_ProjSep1: TMenuItem;
    file11: TMenuItem;
    file21: TMenuItem;
    file31: TMenuItem;
    file41: TMenuItem;
    file51: TMenuItem;
    Timer1: TTimer;
    N_Preview: TMenuItem;
    Timer2: TTimer;
    N_Params: TMenuItem;
    N_Delete: TMenuItem;
    N_Results: TMenuItem;
    N_TopUtils: TMenuItem;
    N_JobGen: TMenuItem;
    N_Conns: TMenuItem;
    N_Sep1: TMenuItem;
    N_RunModel: TMenuItem;
    PopupMenuPanel: TPopupMenu;
    N_AddWS: TMenuItem;
    N_AddServ: TMenuItem;
    N_AddKomm: TMenuItem;
    N_AddKonc: TMenuItem;
    N_Results2: TMenuItem;
    N_MCParams: TMenuItem;
    N_Panel_Sep1: TMenuItem;
    N_NodeJobs: TMenuItem;
    N_Report: TMenuItem;
    N_Sep3: TMenuItem;
    N_Pic: TMenuItem;
    N_RunModelPack: TMenuItem;
    file61: TMenuItem;
    file71: TMenuItem;
    file81: TMenuItem;
    file91: TMenuItem;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    SpeedButtonNew: TSpeedButton;
    SpeedButtonOpen: TSpeedButton;
    SpeedButtonSave: TSpeedButton;
    ToolButtonSep1: TToolButton;
    SpeedButtonPrint: TSpeedButton;
    SpeedButtonMakePic: TSpeedButton;
    SpeedButtonReport: TSpeedButton;
    SpeedButtonJobGen: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButtonRunModel: TSpeedButton;
    SpeedButtonRunModelPack: TSpeedButton;
    SpeedButtonExpress: TSpeedButton;
    ToolButton6: TToolButton;
    ComboBoxGrid: TComboBox;
    ToolButtonSep4: TToolButton;
    SpeedButtonCloseView: TSpeedButton;
    N_AddAP: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N_Help_AboutClick(Sender: TObject);
    procedure N_Grid_10Click(Sender: TObject);
    procedure N_Grid_20Click(Sender: TObject);
    procedure N_Grid_30Click(Sender: TObject);
    procedure N_Grid_40Click(Sender: TObject);
    procedure SpeedButtonOpenClick(Sender: TObject);
    procedure SpeedButtonSaveClick(Sender: TObject);
    procedure N_AddWSClick(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButtonNewClick(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N_ExitClick(Sender: TObject);
    procedure SpeedButtonMakePicClick(Sender: TObject);
    procedure N_Grid_1Click(Sender: TObject);
    procedure N_AddServClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N_AddKommClick(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N_NewClick(Sender: TObject);
    procedure N_OpenClick(Sender: TObject);
    procedure N_SaveAsClick(Sender: TObject);
    procedure N_ConnectClick(Sender: TObject);
    procedure SpeedButtonReportClick(Sender: TObject);
    procedure N_SettingsClick(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N_SaveClick(Sender: TObject);
    procedure N_Grid_UserClick(Sender: TObject);
    procedure N_DBClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure file11Click(Sender: TObject);
    procedure file21Click(Sender: TObject);
    procedure file31Click(Sender: TObject);
    procedure file41Click(Sender: TObject);
    procedure file51Click(Sender: TObject);
    procedure ComboBoxGridChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButtonExpressClick(Sender: TObject);
    procedure N_ExpressClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure N_AddKoncClick(Sender: TObject);
    procedure N_ParamsClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
    procedure N_ResultsClick(Sender: TObject);
    procedure N_RunModelClick(Sender: TObject);
    procedure N_ConnsClick(Sender: TObject);
    procedure SpeedButtonRunModelClick(Sender: TObject);
    procedure SpeedButtonCloseViewClick(Sender: TObject);
    procedure SpeedButtonPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel1DblClick(Sender: TObject);
    procedure Panel1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N_MCParamsClick(Sender: TObject);
    procedure N_JobGenClick(Sender: TObject);
    procedure N_NodeJobsClick(Sender: TObject);
    procedure N_ReportClick(Sender: TObject);
    procedure N_PicClick(Sender: TObject);
    procedure SpeedButtonJobGenClick(Sender: TObject);
    procedure N_PrintClick(Sender: TObject);
    procedure N_RunModelPackClick(Sender: TObject);
    procedure SpeedButtonRunModelPackClick(Sender: TObject);
    procedure file61Click(Sender: TObject);
    procedure file91Click(Sender: TObject);
    procedure file71Click(Sender: TObject);
    procedure file81Click(Sender: TObject);
    procedure N_AddAPClick(Sender: TObject);
  private
    procedure Img_DblClick(Sender: TObject);

    procedure img_Mouse_move(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure img_Mouse_Down(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img_Mouse_Up(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img_ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);

    procedure BeginViewMode();
    procedure EndViewMode();
  public
    procedure DrawConnectors( cnv : TCanvas; SecScale_ : Single );
    procedure RePaintConnectors;
    procedure InsertFileInMenu;
    procedure Save_File2(FileName:string);
    procedure Load_File2(FileName:string);
    function Test_Click(x1,y1,x2,y2,Mx,My: integer): boolean;
    procedure OpenFileByName(sFileName : String);
    function CreateNewNode( sType, sName : String; M_X, M_Y : Integer ) : TOrlan;
    procedure DeletePrevFiles();    
  end;

type
  TMyPanel=class(TPanel)
  private
    procedure Panel_Paint(var Message:TMessage); message WM_NCPAINT;
  end;


{ Tип параметров Раб. Станции }
type
 Prot_Params = ^Protocol_Params;
 Protocol_Params=record
   Prot_: string [255];
   Con_: string[255];
 end;

{type
   DistDelayType = (Constant,
   					Uniform,
                    Exponential);
}
{ type
   DistDelayType = ( Constant,       // постоянное
                     Uniform,        // равномерное
                     Exponential);   // экспоненциальное
}

 DB_Komm_Params = ^Kommutator_Params;
 Kommutator_Params = record
   { основные параметры }
   Name_ : string[50]; // имя
   Producer_: string[50]; // Производитель
   Prod_Name_: string[50]; // ИМя производителя
   Eth_PortNumber_:integer; // кол-во портов Ethernet
   F_Eth_PortNumber_:integer; // кол-во портов Fast Ethernet
   G_Eth_PortNumber_:integer; // кол-во портов Gigabit Ethernet
   ATM_PortNumber_:integer; // кол-во портов ATM
   FDDI_PortNumber_:Integer; // FDDI
   E_F_Eth_PortNumber_:integer; // кол-во портов 10/100
   Duplex_:Boolean; // Duplex ???
   Int_Bus_:real; // скорость шины
   Cost_:Integer; // стоимость
   Switches: array [1..5,1..5] of extended; // времена переключения
   Eth_Type: string[50]; // 10BaseT или 10BaseFX
   F_Eth_Type: string[50]; // 100BaseTX или 100BaseFX
 end;

 DB_AP_Params = ^AP_Params;
 AP_Params = record
   { основные параметры }
   Name_ : string[50]; // имя
   Producer_: string[50]; // Производитель
   Prod_Name_: string[50]; // ИМя производителя
   Eth_PortNumber_:integer; // кол-во портов Ethernet
   F_Eth_PortNumber_:integer; // кол-во портов Fast Ethernet
   G_Eth_PortNumber_:integer; // кол-во портов Gigabit Ethernet
   //ATM_PortNumber_:integer; // кол-во портов ATM
   //FDDI_PortNumber_:Integer; // FDDI
   E_F_Eth_PortNumber_:integer; // кол-во портов 10/100
   Wifi_PortNumber_:integer; // кол-во беспроводных абонентов
   Duplex_:Boolean; // Duplex ???
   Int_Bus_:real; // скорость шины
   Cost_:Integer; // стоимость
   Switches: array [1..5,1..5] of extended; // времена переключения
   Eth_Type: string[50]; // 10BaseT или 10BaseFX
   F_Eth_Type: string[50]; // 100BaseTX или 100BaseFX
 end;

 DB_Konc_Params = ^Konc_Params;
 Konc_Params = record
   { основные параметры }
   Name_ : string[50]; // имя
   Producer_: string[50]; // Производитель
   Prod_Name_: string[50]; // ИМя производителя
   Eth_PortNumber_:integer; // кол-во портов Ethernet
   F_Eth_PortNumber_:integer; // кол-во портов Fast Ethernet
   G_Eth_PortNumber_:integer; // кол-во портов Gigabit Ethernet
   ATM_PortNumber_:integer; // кол-во портов ATM
   FDDI_PortNumber_:Integer; // FDDI
   E_F_Eth_PortNumber_:integer; // кол-во портов 10/100
   Cost_:Integer; // стоимость
   Eth_Type: string[50]; // 10BaseT или 10BaseFX or 100VG
   F_Eth_Type: string[50]; // 100BaseTX или 100BaseFX
 end;

 Setup_Params = record // Параметры  и настройки
  DateInstall_:TDateTime; // Дата инсталяции
  AutoSave_:Boolean; // Авотсохранение
  AutoSaveDelay_:Integer; // Интервал между Автосохранениями
  FileListFrom_: integer; // Список файлов из ...
  SaveIfChanged_: boolean; // Подтверждение на сохранение
  ShowHints_: boolean; // Показывание подсказок
  OpenLastProjectOnEnter_: boolean; // открывать последний проект при загрузке
  ManyLanguages_:boolean; // Многоязыковая поддержка
  Language_: string; // Язык
  ScreenGrid_: integer; // Сетка экрана для нового проекта
//  HintBGcolor_:integer; // цвет подсказки
//  HintDelay_:integer; // Время свечения подсказки
  LastProject_:string; // последний открытый проект
  File_: array [1..9] of string; // файлы предыдущего сохранения
  Color1: integer; // Colors for connections тонкий коакс.
  Color2: integer; //
  Color3: integer; //
  Color4: integer; //
  Color5: integer; //
  Color6: integer; //
  Width1: integer; // Толщина соединений
  Width2: integer;
  Width3: integer;
  Width4: integer;
  Width5: integer;
  Width6: integer;
  WS: string; // моделирование
  Serv: string;
  Komm: string;
  Konc: string;
  AP: string;
  MC: string;
  Wait: string;
  UseScat : Boolean;
  UseImit : Boolean;
  ImitInterval : Integer;
  InitDir_: string;
 end;

 DataBase_Elem = ^Main_Database;
 Main_Database = record
  Type_:string[50];
  Name_:string[50];
  Active_:boolean;
  Cost_:integer;
 end;

 // parameters for modelling ...
 Model_Element = ^Model_Parameters;
 Model_Parameters = record
  ServID_: integer; // сервер, обрабат., заявки
  Size_: integer; // размер запроса
  AnsSize_ : integer; //размер ответа. Если AnsSize_ = 0, то ответ не нужен.
  TimeWS: real; // время подготовки
  TimeServ: real; // время обработки
  TimeCycle: real; // время цикла
  AdjustedTimeCycle: real; //время цикла, установленное перед началом моделирования,
                           //во время поиска пути заявки. Оно равно наибольшему из
                           //TimeCycle и времени передачи заявки.

  //---------------------------------------------------------------------
  Priority:	byte;	       // приоритет класса заявки
  MaxServTime: integer;	   // максимальное время передачи для заявок данного класса

  PossibleTime : integer;  // некоторое допустимое время передачи
  PossiblePercent : byte;  // допустимый процент заявок, которые могут превышать допустимое время

  DistOfServerDelay: DistDelayType; // распределние задержки на сервере
  HopDelay2: real;                  // для равномерного - вторая величина

 end;

  // parameters for modelling ... //_ previous version
 Model_Element_v1 = ^Model_Parameters_v1;
 Model_Parameters_v1 = record
  Serv_: string[50]; // сервер, обрабат., заявки
  Size_: integer; // размер запроса
  AnsSize_ : integer; //размер ответа. Если AnsSize_ = 0, то ответ не нужен.
  TimeWS: real; // время подготовки
  TimeServ: real; // время обработки
  TimeCycle: real; // время цикла
  AdjustedTimeCycle: real; //время цикла, установленное перед началом моделирования,
                           //во время поиска пути заявки. Оно равно наибольшему из
                           //TimeCycle и времени передачи заявки.
  //----------------------------------------------------------------------
  Priority:	byte;	       // приоритет класса заявки

  PossibleTime : integer;  // некоторое допустимое время передачи
  PossiblePercent : byte;  // допустимый процент заявок, которые могут превышать допустимое время

  DistOfServerDelay: DistDelayType; // распределние задержки на сервере
  HopDelay2: real;                  // для равномерного - вторая величина

 end;


 {пaраметры файлов для записи}
 PrjFile_Kommutators = file of Kommutator_Params;
 PrjFile_AP = file of AP_Params;
 PrjFile_Konc = file of Konc_Params;
 PrjFile_Prot = file of Protocol_Params;
 Scat_DB = file of Main_Database;

 Conn_Element = ^C_Parameters;
 C_Parameters = record
  ID: integer; // ID эл-та с которым есть соединение
  Speed: integer; // Пропускная способность канала
  ChannalType: string[50]; // Тип канала подключения
  ChannalLength: integer; // Длина кабеля
  ChannalID: integer; // ID соединения (для нахождения пути)
 end;

 Port_Element = ^P_Parameters;
 P_Parameters = record
  PortType: string[50]; // Тип порта
  IsUsed: Boolean; // Занят ли в данном узле этот порт
  // если порт используется, то используются параметры :
  Speed: integer; // Пропускная способность канала
  ChannalType: string[50]; // Тип канала подключения
  ID: integer; // ID эл-та с которым есть соединение
  ChannalLength: integer; // Длина кабеля
  ChannalID: integer; // ID соединения (для нахождения пути)
  SegmentID: integer; // ID сегмента, в котором находится узел
  // Если используется 10Base-2 или 10Base-5, то
  // ко второму разъему карты м.б. что-то подключено:
  IsUsed2: Boolean; // Занят ли в данном узле 2-ой порт
  ID2: integer; // ID эл-та с которым есть соединение
  ChannalLength2: integer; // Длина кабеля
  load: integer;
 end;

var
  MainForm: TMainForm;
  Screen_grid : byte;
  Number_of_Workstations, Number_of_Servers,
  Number_of_Konc, Number_of_Kommutators, Number_of_APs: integer; // кол-во элементов

  Screen_Picture: Timage; // Картинка экрана
  Mouse_X,Mouse_Y: integer; // координаты мыши
  offset_x,offset_y:integer; // смещение координат в картинке
  old_x,Old_Y:integer; // Старые значения положения картинки

  Project_Modified:Boolean;// был ли сохранен проект

  Connecting:boolean;// процесс соединения
  Con_x,Con_Y,Con_x2,Con_Y2: integer;// координаты соединяемого узла
  Con_Num, Con_Num2:integer; // номерa соединяемых узлов
  Con_Type:string[15]; // тип соединяемого узла

  flag_1:boolean;

  Project_Name,Project_Path:string;

  Setup_: Setup_Params; // параметры Setup'a

  Komm_List: Tlist; // Список коммутаторов
  AP_List: Tlist; // Список коммутаторов
  Konc_List: Tlist; // Список KONC
  Komm_Elem: DB_Komm_Params; // Элемент коммутатора
  AP_Elem: DB_AP_Params; // Элемент коммутатора
  Konc_Elem: DB_Konc_Params; // Элемент KONC

  Prot_List: TList;
  Prot_Elem: Prot_Params;

  Scale_: integer; // масштаб проекта
  MyPanel: TMyPanel;
  NeedRepaint:boolean;

  Main_DB: TList;
  DB_Elem: Database_Elem;

  Model_Elem: Model_Element;
  Model_Elem_v1: Model_Element_v1;

  // список узлов модели (раб. ст-ции, серверы, конц., комм.)
  Nodes: TList;
  // узел модели
  Node_Elem: TOrLAN;

  Connections_: Conn_Element;
  Ports_: Port_Element;

  MaxWS, MaxServ, MaxKomm, MaxKonc, MaxAPs: integer;

  ViewModellingResuls: boolean;

  Cur_MC: integer;

  // флажки выполнения аналитического и имитационного
  // моделирования соответственно
  ///////////////////////////////////////////
  WasScat, WasImit: Boolean;

  // Список сегментов модели
  ///////////////////////////////////////////
  Segments: TStringList;

  //
  ///////////////////////////////////////////
  miFile: TMenuItem;

  //
  NotSavedYet: boolean;

implementation

uses about, user, server, komm, wait, connect, report, find, grid,
  database, ex_anal, {preview,} scat_in, mod_res, konc, fjobs, printers,
  JobsPack, setup, ap;

{$R *.DFM}

procedure TMyPanel.Panel_Paint(var Message:TMessage);
begin
 NeedRepaint:=True;
 inherited;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var Reg: TRegistry;
begin
 NotSavedYet:=False;
 ModelResult:=TMemoryStream.Create;

 ViewModellingResuls:=False;
 Application.HelpFile:='orlan.hlp';
 NeedRepaint:=False;
 MyPanel:=TMyPanel.Create(Self);
 MyPanel.Parent:=ScrollBox1;
 MyPanel.Color:=clWhite;
 MyPanel.PopUpMenu:=PopupMenuPanel;
 MyPanel.OnMouseDown:=Panel1MouseDown;
 MyPanel.OnMouseMove:=Panel1MouseMove;
 MyPanel.OnMouseUp:=Panel1MouseUp;
 MyPanel.OnDblClick:=Panel1DblClick;
 MyPanel.OnContextPopup:=Panel1ContextPopup;

 MainForm.Width:=630;
 MainForm.Height:=470;

 // Создание списков устройств сети
 /////////////////////////////////////////////////////////
 Komm_List:=TList.Create; // создаем список коммутаторов
 AP_List:=TList.Create; // создаем список точек доступа
 Konc_List:=TList.Create; // создаем список концентраторов
 Prot_List:=TList.Create; // создаем список протоколов
 Main_DB:=TList.Create; // основная база  данных
 Nodes:=TList.Create;	// создаем список узлов

 // Чтение настроек из реестра
 /////////////////////////////////////////////////////////
 Reg := TRegistry.Create;
 try
  with Reg do
   begin
    RootKey := HKEY_CURRENT_USER;
    if KeyExists('\SOFTWARE\OrLAN')=true then
     begin
      OpenKey('\SOFTWARE\OrLAN',False);
      if (ValueExists('DateInstall') and ValueExists('AutoSave') and
         ValueExists('FileListFrom') and ValueExists('SaveIfChanged') and
         ValueExists('ShowHints') and ValueExists('OpenLastProjectOnEnter') and
         ValueExists('ManyLanguages') and ValueExists('Language') and
         ValueExists('ScreenGrid') and
         ValueExists('UseScat') and ValueExists('UseImit') and
         ValueExists('ImitInterval') and ValueExists('AutoSaveDelay')) and
         ValueExists('InstDir') then
       begin
        SetCurrentDir(REadString('InstDir'));
        Setup_.InitDir_:=ReadString('InitDir');
        Setup_.DateInstall_:=REadDate('DateInstall');
        Setup_.AutoSave_:=ReadBool('AutoSave');
        Setup_.AutoSaveDelay_:=ReadInteger('AutoSaveDelay');
        Setup_.FileListFrom_:=ReadInteger('FileListFrom');
        Setup_.SaveIfChanged_:=ReadBool('SaveIfChanged');
        Setup_.ShowHints_:=ReadBool('ShowHints');
        Setup_.OpenLastProjectOnEnter_:=ReadBool('OpenLastProjectOnEnter');
        Setup_.ManyLanguages_:=ReadBool('ManyLanguages');
        Setup_.Language_:=REadString('Language');
        Setup_.ScreenGrid_:=ReadInteger('ScreenGrid');
//        Setup_.HintBGcolor_:=ReadInteger('HintBGcolor');
//        Setup_.HintDelay_:=ReadInteger('HintDelay');
        Setup_.LastProject_:=ReadString('LastProject');
        Setup_.UseScat:=ReadBool('UseScat');
        Setup_.UseImit:=ReadBool('UseImit');
        Setup_.ImitInterval:=ReadInteger('ImitInterval');
        Setup_.File_[1]:=ReadString('File_1');
        Setup_.File_[2]:=ReadString('File_2');
        Setup_.File_[3]:=ReadString('File_3');
        Setup_.File_[4]:=ReadString('File_4');
        Setup_.File_[5]:=ReadString('File_5');
        Setup_.File_[6]:=ReadString('File_6');
        Setup_.File_[7]:=ReadString('File_7');
        Setup_.File_[8]:=ReadString('File_8');
        Setup_.File_[9]:=ReadString('File_9');

        if KeyExists('\SOFTWARE\OrLAN\CONNECTIONS')=true then
         begin
          OpenKey('\SOFTWARE\OrLAN\CONNECTIONS',False);
          Setup_.Color1:=ReadInteger('Color1');
          Setup_.Color2:=ReadInteger('Color2');
          Setup_.Color3:=ReadInteger('Color3');
          Setup_.Color4:=ReadInteger('Color4');
          Setup_.Color5:=ReadInteger('Color5');
          Setup_.Color6:=ReadInteger('Color6');
          Setup_.Width1:=ReadInteger('Width1');
          Setup_.Width2:=ReadInteger('Width2');
          Setup_.Width3:=ReadInteger('Width3');
          Setup_.Width4:=ReadInteger('Width4');
          Setup_.Width5:=ReadInteger('Width5');
          Setup_.Width6:=ReadInteger('Width6');
         end;

        if KeyExists('\SOFTWARE\OrLAN\MODEL')=true then
         begin
          OpenKey('\SOFTWARE\OrLAN\MODEL',False);
          Setup_.WS:=ReadString('WS');
          Setup_.Serv:=ReadString('Serv');
          Setup_.Komm:=ReadString('Komm');
          Setup_.Konc:=ReadString('Konc');
          Setup_.AP:=ReadString('AP');
          Setup_.MC:=ReadString('MC');
          Setup_.Wait:=ReadString('Wait');
         end;

        {установка прочитанных параметров}
        Screen_grid:=Setup_.ScreenGrid_;

        if Setup_.AutoSave_= True then
          begin
          Timer1.Enabled:=true;
          Timer1.Interval:=Setup_.AutoSaveDelay_*1000*60
          end
        else
          begin
          Timer1.Enabled:=false;
          Timer1.Interval:=0;
          end;

          Application.ShowHint:=True;

        if Setup_.FileListFrom_<>0 then
        begin
          if (Setup_.File_[1]<>'') and (Setup_.FileListFrom_>=1) then
          begin
            N_ProjSep1.Visible:=True;
            file11.Visible:=True;
            file11.Caption:=Setup_.File_[1];
          end;

          if (Setup_.File_[2]<>'') and (Setup_.FileListFrom_>=2) then
          begin
            N_ProjSep1.Visible:=True;
            file21.Visible:=True;
            file21.Caption:=Setup_.File_[2];
          end;

          if (Setup_.File_[3]<>'') and (Setup_.FileListFrom_>=3) then
          begin
            N_ProjSep1.Visible:=True;
            file31.Visible:=True;
            file31.Caption:=Setup_.File_[3];
          end;

          if (Setup_.File_[4]<>'') and (Setup_.FileListFrom_>=4) then
          begin
            N_ProjSep1.Visible:=True;
            file41.Visible:=True;
            file41.Caption:=Setup_.File_[4];
          end;

          if (Setup_.File_[5]<>'') and (Setup_.FileListFrom_>=5) then
          begin
            N_ProjSep1.Visible:=True;
            file51.Visible:=True;
            file51.Caption:=Setup_.File_[5];
          end;

          if (Setup_.File_[5]<>'') and (Setup_.FileListFrom_>=5) then
          begin
            N_ProjSep1.Visible:=True;
            file51.Visible:=True;
            file51.Caption:=Setup_.File_[5];
          end;

          if (Setup_.File_[6]<>'') and (Setup_.FileListFrom_>=6) then
          begin
            N_ProjSep1.Visible:=True;
            file61.Visible:=True;
            file61.Caption:=Setup_.File_[6];
          end;

          if (Setup_.File_[7]<>'') and (Setup_.FileListFrom_>=7) then
          begin
            N_ProjSep1.Visible:=True;
            file71.Visible:=True;
            file71.Caption:=Setup_.File_[7];
          end;

          if (Setup_.File_[8]<>'') and (Setup_.FileListFrom_>=8) then
          begin
            N_ProjSep1.Visible:=True;
            file81.Visible:=True;
            file81.Caption:=Setup_.File_[8];
          end;

          if (Setup_.File_[9]<>'') and (Setup_.FileListFrom_>=9) then
          begin
            N_ProjSep1.Visible:=True;
            file91.Visible:=True;
            file91.Caption:=Setup_.File_[9];
          end;
        end;

     end
// -----------
      else
      begin
      Application.MessageBox(
			'Ошибка в параметрах OrLAN, записанных в реестре.'+#13+#10+
			'Возможно, необходимо переустановить программу',
            'Информация',
            MB_OK+MB_IconInformation);
        Halt(1);
      end;
     end
    else
    begin
	  Application.MessageBox(
		'OrLAN для Windows еще не установлен.',
		'Информация',
		MB_OK+MB_IconExclamation);
      Halt(1);
    end;
   end;
 finally
  Reg.Free;
 end;

end;

procedure TMainForm.N_Help_AboutClick(Sender: TObject);
begin
 FormAbout.ShowModal;
end;

procedure TMainForm.N_Grid_10Click(Sender: TObject);
begin
 N_Grid_10.Checked:=True; // установить сетку 10 пикселей
 N_Grid_20.Checked:=False;
 N_Grid_30.Checked:=False;
 N_Grid_40.Checked:=False;
 N_Grid_1.Checked:=False;
 Screen_grid:=10;
end;

procedure TMainForm.N_Grid_20Click(Sender: TObject);
begin
 N_Grid_10.Checked:=False; // установить сетку 20 пикселей
 N_Grid_20.Checked:=True;
 N_Grid_30.Checked:=False;
 N_Grid_40.Checked:=False;
 N_Grid_1.Checked:=False;
 Screen_grid:=20;
end;

procedure TMainForm.N_Grid_30Click(Sender: TObject);
begin
 N_Grid_10.Checked:=False; // установить сетку 30 пикселей
 N_Grid_20.Checked:=False;
 N_Grid_30.Checked:=True;
 N_Grid_40.Checked:=False;
 N_Grid_1.Checked:=False;
 Screen_grid:=30;
end;

procedure TMainForm.N_Grid_40Click(Sender: TObject);
begin
 N_Grid_10.Checked:=False; // установить сетку 40 пикселей
 N_Grid_20.Checked:=False;
 N_Grid_30.Checked:=False;
 N_Grid_40.Checked:=True;
 N_Grid_1.Checked:=False;
 Screen_grid:=40;
end;

{********************************************
Открытие проекта
**********************************************}
procedure TMainForm.SpeedButtonOpenClick(Sender: TObject);
begin
 SpeedButtonOpen.Down := False;

 if Project_Modified=True then
   if Setup_.SaveIfChanged_=False then
      SpeedButtonSaveClick(nil)
   else
   	  if Application.MessageBox(
		'Проект не сохранен. Сохранить?',
		'Подтверждение',
		MB_YesNo+MB_IconQuestion)=IDYes then
			SpeedButtonSaveClick(nil);

 OpenDialog1.InitialDir:=Setup_.InitDir_;
 if OpenDialog1.Execute then
 begin
   Project_Name:=ChangeFileExt(ExtractFileName(OpenDialog1.FileName),'');
   Project_Path:=ExtractFilePath(OpenDialog1.FileName);
   Load_File2(OpenDialog1.FileName);
   Setup_.LastProject_:=OpenDialog1.FileName;
   Setup_.InitDir_:=ExtractFileDir(OpenDialog1.FileName);

   NeedREpaint:=True;
   MainForm.Caption:='OrLAN - ' + Project_name;
   InsertFileInMenu;
 end;

end;


procedure TMainForm.OpenFileByName(sFileName : String);
begin
 if Project_Modified=True then
   if Setup_.SaveIfChanged_=False then
      SpeedButtonSaveClick(nil)
   else
   	  if Application.MessageBox(
		'Проект не сохранен. Сохранить?',
		'Подтверждение',
		MB_YesNo+MB_IconQuestion)=IDYes then
			SpeedButtonSaveClick(nil);

 Load_File2(sFileName);

 Project_Name:=ChangeFileExt(ExtractFileName(sFileName),'');
 Project_Path:=ExtractFilePath(sFileName);
 Setup_.LastProject_:=sFileName;

 NeedREpaint:=True;
 MainForm.Caption:='OrLAN - ' + Project_name;
 InsertFileInMenu;

 ComboBoxGrid.ItemIndex:=ComboBoxGrid.Items.IndexOf('100');
//   ComboBoxGrid.Text := '100';
 Scale_:=100;

 ComboBoxGridChange(nil);
end;

{**********************************
Сохранение проекта
***********************************}
procedure TMainForm.SpeedButtonSaveClick(Sender: TObject);
begin
 SpeedButtonSave.Down := False;

 if Project_Name='NoName' then
 begin
   if SaveDialog1.Execute then
   begin
     Save_File2(SaveDialog1.FileName);

     Project_Name:=ChangeFileExt(ExtractFileName(SaveDialog1.FileName),'');
     Project_Path:=ExtractFilePath(SaveDialog1.FileName);
     Setup_.LastProject_:=SaveDialog1.FileName;

     InsertFileInMenu;
     MainForm.Caption:='OrLAN - ' + Project_name;

     NotSavedYet:=False;
   end;
 end
 else
 begin
   Save_File2(Project_Path + Project_Name + '.oln');
   InsertFileInMenu;
   MainForm.Caption:='OrLAN - ' + Project_name;
 end;

end;

//===================================================
// .Создание нового узла
// sType - тип узла (WS, SERV, KONC, KOMM)
// sName - имя узла
// M_X, M_Y - координаты узла на рабочем поле
//===================================================
function TMainForm.CreateNewNode( sType, sName : String; M_X, M_Y : Integer ) : TOrlan;
var i : Integer;
    N_Elem : TOrlan;
begin

  // снять признак активности с активного узла и
  // установить его на вновь созданный
  for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).Active=True then
      TOrLAN(Nodes[i]).Active:=False;

  //создать новый экземпляр объекта
  N_Elem:=TOrLAN.Create(Self);
  N_Elem.Parent:=MyPanel;
  N_Elem.NodeType:=sType;
  N_Elem.NodeName:=sName;

  N_Elem.Top:=Round(M_Y / Screen_grid ) * Screen_grid;
  N_Elem.Left:=Round(M_X / Screen_grid ) * Screen_grid;
  N_Elem.Width := Round( 50 * Scale_ / 100 );
  N_Elem.Height := Round( 50 * Scale_ / 100 );
  N_Elem.X:=Round(N_Elem.Left * Scale_ / 100);
  N_Elem.Y:=Round(N_Elem.Top * Scale_ / 100);

  N_Elem.Active:=True;
  N_Elem.Tag:=0;


  N_Elem.NodeID:=0;

  //найдем максимальное, увеличим на 1 и номер присвоим новому узлу
  for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeID > N_Elem.NodeID then
       N_Elem.NodeID := TOrLAN(Nodes[i]).NodeID;

  N_Elem.NodeID := N_Elem.NodeID + 1;

  N_Elem.PopupMenu := PopupMenuNode;
  N_Elem.OnContextPopup := Img_ContextPopup;
  N_Elem.OnDblClick := Img_DblClick;
  N_Elem.OnMouseDown:=Img_Mouse_Down;
  N_Elem.OnMouseUp:=Img_Mouse_Up;
  N_Elem.OnMouseMove:=Img_Mouse_Move;

  Result := N_Elem;
end;

{******************************************
Создание новой рабочей станции из PopupMenu
*******************************************}
procedure TMainForm.N_AddWSClick(Sender: TObject);
begin
 Project_Modified:=True;

 inc(Number_of_WorkStations); // увеличить кол-во раб. ст.
 inc(MaxWS);
 StatusBar1.Panels[0].Text:='Рабочих станций - '+IntToStr(Number_of_WorkStations);

 Node_Elem:=CreateNewNode( 'WS', 'Host#'+IntToStr(MaxWS), Mouse_X, Mouse_Y );

 Node_Elem.WSParameters.Soft:=FormWS.ComboBox1.Items[0];
 Node_Elem.WSParameters.Cost:=100;
 Node_Elem.WSParameters.Processor:=FormWS.ComboBox3.Items[0];
 Node_Elem.WSParameters.RAM:=64;
 Node_Elem.WSParameters.HDD:=2100;
 Node_Elem.WSParameters.IntNIC:=True;

 Nodes.Add(Node_Elem);

 FormWS.Showmodal; // форма параметров раб. станции
end;

procedure TMainForm.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i, j : Integer;
    El_S : Integer;
label
    Test_done;
begin

 for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).Active = True then
      TOrLAN(Nodes[i]).Active := False;

 Cur_MC:=0;
 Con_Num:=-1;
 Con_Num2:=-1;

 El_S := Round(25 * Scale_ / 100);

   for i:=0 to Nodes.Count-1 do
    for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
     if Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed=True then
     begin
       if (Test_Click(
           TOrLAN(Nodes[i]).Left + El_S,
           TOrLAN(Nodes[i]).Top + El_S,
           TOrLAN(Nodes[FormConnect.IDToNum(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID)]).Left + El_S,
           TOrLAN(Nodes[FormConnect.IDToNum(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID)]).Top + El_S,
           X,
           Y
           )=True) then
       begin
         if ViewModellingResuls = True then
         begin
           Cur_MC:=Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID;
           goto Test_done;
         end
         else
         begin
           Con_Num := i;
           Con_Num2 := FormConnect.IDToNum(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID);
           goto Test_done;
         end;
       end;
     end;

 Test_done:

 { запоминание позиции нажатия мышкой на экране }
 Mouse_X:=X;
 Mouse_Y:=Y;

 if Connecting=true then
 begin
 //завершить рисование соединения
   Connecting:=False;
   NeedRepaint := True;
{
   MyPanel.Canvas.Pen.Style:=psSolid;
   MyPanel.Canvas.Pen.Color:=clWhite;
   MyPanel.Canvas.Pen.Mode:=pmWhite;
   MyPanel.Canvas.Pen.Width:=1;
   MyPanel.Canvas.MoveTo(trunc(TOrLAN(Nodes[Con_Num]).Left)+trunc(25*Scale_/100),
                           trunc(TOrLAN(Nodes[Con_Num]).Top)+trunc(25*Scale_/100));
   MyPanel.Canvas.LineTo(X,Y);
   TOrLAN(Nodes[Con_Num]).Repaint;}
 end;

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var Reg: TRegistry;
begin
	CanClose:=True;

	if Project_Modified=True then
		if Setup_.SaveIfChanged_=False then
			SpeedButtonSaveClick(nil)
        else
        	if Application.MessageBox(
            'Проект не сохранен. Сохранить?',
            'Подтверждение',
            MB_YesNo+MB_IconQuestion)=IDOK then
				SpeedButtonSaveClick(nil);

{ Сохранение системного реестра Windows }
 Reg := TRegistry.Create;
 try
  with Reg do
   begin
    RootKey := HKEY_CURRENT_USER;
    OpenKey('\SOFTWARE\OrLAN',False);
    {запись параметров в реестр}
    WriteBool('AutoSave',Setup_.AutoSave_);
    WriteInteger('AutoSaveDelay',Setup_.AutoSaveDelay_);
    WriteInteger('FileListFrom',Setup_.FileListFrom_);
    WriteBool('SaveIfChanged',Setup_.SaveIfChanged_);
    WriteBool('ShowHints',Setup_.ShowHints_);
    WriteBool('OpenLastProjectOnEnter',Setup_.OpenLastProjectOnEnter_);
    WriteBool('ManyLanguages',Setup_.ManyLanguages_);
    WriteString('Language',Setup_.Language_);
    WriteInteger('ScreenGrid',Setup_.ScreenGrid_);
    WriteString('LastProject',Setup_.LastProject_);
    WriteBool('UseScat',Setup_.UseScat);
    WriteBool('UseImit',Setup_.UseImit);
    WriteInteger('ImitInterval',Setup_.ImitInterval);
    WriteString('InitDir',Setup_.InitDir_);


    if file11.Caption<>'' then
     WriteString('File_1',Setup_.File_[1])
    else
     WriteString('File_1','');
    if file21.Caption<>'' then
     WriteString('File_2',Setup_.File_[2])
    else
     WriteString('File_2','');
    if file31.Caption<>'' then
     WriteString('File_3',Setup_.File_[3])
    else
     WriteString('File_3','');
    if file41.Caption<>'' then
     WriteString('File_4',Setup_.File_[4])
    else
     WriteString('File_4','');
    if file51.Caption<>'' then
     WriteString('File_5',Setup_.File_[5])
    else
     WriteString('File_5','');
    if file61.Caption<>'' then
     WriteString('File_6',Setup_.File_[6])
    else
     WriteString('File_6','');
    if file71.Caption<>'' then
     WriteString('File_7',Setup_.File_[7])
    else
     WriteString('File_7','');
    if file81.Caption<>'' then
     WriteString('File_8',Setup_.File_[8])
    else
     WriteString('File_8','');
    if file91.Caption<>'' then
     WriteString('File_9',Setup_.File_[9])
    else
     WriteString('File_9','');

    OpenKey('\SOFTWARE\OrLAN\CONNECTIONS',True);
    WriteInteger('Color1',Setup_.Color1);
    WriteInteger('Color2',Setup_.Color2);
    WriteInteger('Color3',Setup_.Color3);
    WriteInteger('Color4',Setup_.Color4);
    WriteInteger('Color5',Setup_.Color5);
    WriteInteger('Color6',Setup_.Color6);
    WriteInteger('Width1',Setup_.Width1);
    WriteInteger('Width2',Setup_.Width2);
    WriteInteger('Width3',Setup_.Width3);
    WriteInteger('Width4',Setup_.Width4);
    WriteInteger('Width5',Setup_.Width5);
    WriteInteger('Width6',Setup_.Width6);

    OpenKey('\SOFTWARE\OrLAN\MODEL',True);
    WriteString('WS',Setup_.WS);
    WriteString('Serv',Setup_.Serv);
    WriteString('Komm',Setup_.Komm);
    WriteString('Konc',Setup_.Konc);
    WriteString('AP',Setup_.AP);
    WriteString('MC',Setup_.MC);
    WriteString('Wait',Setup_.Wait);
   end;
 finally
  Reg.Free;
 end;

end;

procedure TMainForm.SpeedButtonNewClick(Sender: TObject);
var i:integer;
    NewRect: TRect;
begin
 SpeedButtonNew.Down := False;


 if Project_Modified=True then
   if Setup_.SaveIfChanged_=False then
      SpeedButtonSaveClick(nil)
   else
   	  if Application.MessageBox(
		'Проект не сохранен. Сохранить?',
		'Подтверждение',
		MB_YesNo+MB_IconQuestion)=IDYes then
			SpeedButtonSaveClick(nil);

   NewRect := Rect(0,0,MyPanel.Width,MyPanel.Height);
   MyPanel.Canvas.Brush.Color := clWhite;
   MyPanel.Canvas.FillRect(NewRect);

   Number_of_Workstations:=0;
   Number_of_Servers:=0;
   Number_of_Kommutators:=0;
   Number_of_Konc:=0;

   StatusBar1.Panels[0].Text:='Рабочих станций - 0';
   StatusBar1.Panels[1].Text:='Серверов - 0';
   StatusBar1.Panels[2].Text:='Коммутаторов - 0';
   StatusBar1.Panels[3].Text:='Концентраторов - 0';

   MaxWS:=0;
   MaxServ:=0;
   MaxKomm:=0;
   MaxKonc:=0;

   for i:=0 to Nodes.Count-1 do
   begin
     TOrLAN(Nodes[i]).Free;
     Nodes[i]:=nil;
   end;
   Nodes.Pack;

   Project_Name:='NoName';
   Project_Modified:=False;
   Screen_grid:=Setup_.ScreenGrid_;

   MainForm.Caption:='OrLAN - ' + Project_name;

   ComboBoxGrid.ItemIndex:=ComboBoxGrid.Items.IndexOf('100');
   Scale_:=100;

   ComboBoxGridChange(nil);

   NotSavedYet:=True;
end;

//проверяет, находится ли точка Mx,My на линии x1,y1-x2,y2
function TMainForm.Test_Click(x1,y1,x2,y2,Mx,My: integer): boolean;
var Corner_: extended;
    i: integer;
begin
 Result:=false;
 Corner_:=0.0;
 if x1-x2<>0 then Corner_:=Abs(ArcTan((y1-y2)/(x1-x2)));

 if (y1>y2) and (x1<x2) then
  for i:=1 to x2-x1 do
   if (Abs(y1-i*Tan(Corner_)-My)<=5) and (Abs(x1+i-Mx)<=5) then
   begin
     Result:=True;
     exit;
   end;

 if (y1>y2) and (x1>x2) then
  for i:=1 to x1-x2 do
   if (Abs(y1-i*Tan(Corner_)-My)<=5) and (Abs(x1-i-Mx)<=5) then
   begin
     Result:=True;
     exit;
   end;

 if (y1<y2) and (x1>x2) then
  for i:=1 to x1-x2 do
   if (Abs(y1+i*Tan(Corner_)-My)<=5) and (Abs(x1-i-Mx)<=5) then
   begin
     Result:=True;
     exit;
   end;

 if (y1<y2) and (x1<x2) then
  for i:=1 to x2-x1 do
   if (Abs(y1+i*Tan(Corner_)-My)<=5) and (Abs(x1+i-Mx)<=5) then
   begin
     Result:=True;
     exit;
   end;

 if (Abs(x1-x2)<10) and
    (((y1>=My) and (Y2<=My)) or ((y2>=My) and (y1<=My))) and
    (((x1+5>=Mx) and (x2-5<=Mx)) or ((x2+5>=Mx) and (x1-5<=Mx))) then
    begin
      Result:=True;
      exit;
    end;

 if (Abs(y1-y2)<10) and
    (((y1+5>=My) and (Y2-5<=My)) or ((y2+5>=My) and (y1-5<=My))) and
    (((x1>=Mx) and (x2<=Mx)) or ((x2>=Mx) and (x1<=Mx))) then
    begin
      Result:=True;
      exit;
    end;

end;

{************************************************
 Движение мыши по иконке с раб. станцией
*************************************************}
procedure TMainForm.Img_Mouse_Move(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
// иконка тащится за пределы экрана
   if (ssLeft in Shift) and ((Sender as TOrLAN).Active=True) and (ViewModellingResuls = False) then
   begin
     if Trunc(((Sender as TOrLAN).Top+y-offset_y)/Screen_grid)*Screen_grid>1 then
        (Sender as TOrLAN).Top:=Trunc(((Sender as TOrLAN).Top+
                          y-offset_y)/Screen_grid)*Screen_grid;
     if Trunc(((Sender as TOrLAN).Left+x-offset_x)/Screen_grid)*Screen_grid>1 then
        (Sender as TOrLAN).Left:=Trunc(((Sender as TOrLAN).Left+
                         x-offset_x)/Screen_grid)*Screen_grid;

     MyPanel.Align:=alNone;
     if (Sender as TOrLAN).Left+5>=MyPanel.Width-50 then MyPanel.Width:=MyPanel.Width+10;
     if (Sender as TOrLAN).Top+5>=MyPanel.Height-50 then MyPanel.Height:=MyPanel.Height+10;

     (Sender as TOrLAN).X:=Trunc((Sender as TOrLAN).Left/Scale_*100);
     (Sender as TOrLAN).Y:=Trunc((Sender as TOrLAN).Top/Scale_*100);
     Application.ProcessMessages;
     ScrollBox1.ScrollInView(Sender as TOrLAN);
     Project_Modified := True;
   end;
end;

{*************************************
Движение мыши по панели
**************************************}
procedure TMainForm.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin

 if Connecting=True then // процесс соединения
 begin
    MyPanel.Canvas.Pen.Width:=1;
    MyPanel.Canvas.Pen.Style:=psSolid;
//    MyPanel.Canvas.Pen.Color:=clBlack;

    if flag_1=True then
      flag_1:=False
    else
    begin
      MyPanel.Canvas.Pen.Mode:=pmWhite;
      //стереть предыдущую линию
      MyPanel.Canvas.MoveTo(Con_X, Con_Y);
      MyPanel.Canvas.LineTo(Con_X2, Con_Y2);
    end;

    //нарисовать новую линию
    MyPanel.Canvas.Pen.Mode:=pmBlack;
    MyPanel.Canvas.MoveTo(Con_X, Con_Y);
    MyPanel.Canvas.LineTo(X,Y);

    TOrLAN(Nodes[Con_Num]).Repaint;
    //запомнить координаты
    Con_X2:=X;
    Con_Y2:=Y;
 end;

end;

procedure TMainForm.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

{***************************
 Отпускание клавиши на IMG
****************************}
procedure TMainForm.Img_Mouse_Up(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
    El_S : Integer;
begin
 if (ViewModellingResuls = False) then
 begin
   El_S := Round(50 * Scale_ / 100);
   {Близко расположенные элементы ?}
   for i:=0 to Nodes.Count-1 do
    if (abs((Sender as TOrLAN).Top - TOrLAN(Nodes[i]).Top) < El_S) and
       (abs((Sender as TOrLAN).Left - TOrLAN(Nodes[i]).Left) < El_S) and
       ((Sender as TOrLAN).NodeID <> TOrLAN(Nodes[i]).NodeID) then
     begin
       Beep;
       (Sender as TOrLAN).Top := Old_Y;
       (Sender as TOrLAN).Left := Old_X;
       (Sender as TOrLAN).Repaint;
     end;
   NeedRepaint:=True;
 end;
end;

//Пункт меню Новое соединения
procedure TMainForm.N_ConnectClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to Nodes.Count-1 do
  if TOrLAN(Nodes[i]).Active=True then
  begin
    Con_X:=TOrLAN(Nodes[i]).Left + trunc(25*Scale_/100);
    Con_Y:=TOrLAN(Nodes[i]).Top + trunc(25*Scale_/100);
    flag_1:=True;
    Connecting:=True;
    Con_Num:=i;
  end;
end;

procedure TMainForm.RePaintConnectors();
var
    NewRect: TRect;
begin
 NewRect := Rect(0,0,MyPanel.Width,MyPanel.Height);
 MyPanel.Canvas.Brush.Color:=clWhite;
 MyPanel.Canvas.FillRect(NewRect);
 DrawConnectors( MyPanel.Canvas, 1 );
end;

{**************************************
Перерисовка всеx соединений
**************************************}
procedure TMainForm.DrawConnectors( cnv : TCanvas; SecScale_ : Single );
var i,j,z:integer;
    El_S : Integer;
    tLeft, tTop : Integer;
label
    Comp_done;
begin
 cnv.Pen.Mode:=pmCopy;
 cnv.Pen.Color:=clBlack;
 cnv.Pen.Width:=1;

 El_S := Round(25 * Scale_ * SecScale_ / 100);

 cnv.Font.Color := clNavy;
 cnv.Font.Name := 'MS Sans Serif';
 cnv.Font.Size := - Round( El_S * 52 / SecScale_ / Font.PixelsPerInch);

 for i:=0 to Nodes.Count-1 do
  for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
    for z:=0 to Nodes.Count-1 do
      if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed = True) and
         (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID = TOrLAN(Nodes[z]).NodeID) and
         (i < z) then
      begin
        if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Неэкранированная витая пара (3-я категория)') or
           (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Неэкранированная витая пара (4-я категория)') or
           (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Неэкранированная витая пара (5-я категория)') or
           (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Неэкранированная витая пара (6-я категория)') then
        begin
          cnv.Pen.Color:=Setup_.Color3;
          cnv.Pen.Width:=Setup_.Width3;
          goto Comp_done;
        end;

        if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Экранированная витая пара') then
        begin
          cnv.Pen.Color:=Setup_.Color4;
          cnv.Pen.Width:=Setup_.Width4;
          goto Comp_done;
        end;

        if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Тонкий коаксиал') then
        begin
          cnv.Pen.Color:=Setup_.Color1;
          cnv.Pen.Width:=Setup_.Width1;
          goto Comp_done;
        end;

        if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Толстый коаксиал') then
        begin
          cnv.Pen.Color:=Setup_.Color2;
          cnv.Pen.Width:=Setup_.Width2;
          goto Comp_done;
        end;

        if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Одномодовое оптоволокно') then
        begin
          cnv.Pen.Color:=Setup_.Color5;
          cnv.Pen.Width:=Setup_.Width5;
          goto Comp_done;
        end;

        if (Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType='Многомодовое оптоволокно') then
        begin
          cnv.Pen.Color:=Setup_.Color6;
          cnv.Pen.Width:=Setup_.Width6;
          goto Comp_done;
        end;

        //если вдруг не найдено, использовать эти значения
        cnv.Pen.Color:=Setup_.Color1;
        cnv.Pen.Width:=Setup_.Width1;

        Comp_done:

        cnv.MoveTo(Round(TOrLAN(Nodes[i]).Left * SecScale_) + El_S, Round(TOrLAN(Nodes[i]).Top * SecScale_) + El_S);
        cnv.LineTo( Round(TOrLAN(Nodes[z]).Left * SecScale_) + El_S, Round(TOrLAN(Nodes[z]).Top * SecScale_) + El_S);

      end;

 for i:=0 to Nodes.Count-1 do
 begin
    cnv.StretchDraw( Rect(Round(TOrLAN(Nodes[i]).Left * SecScale_),
                          Round(TOrLAN(Nodes[i]).Top * SecScale_),
                          Round(TOrLAN(Nodes[i]).Left * SecScale_) + El_S * 2,
                          Round(TOrLAN(Nodes[i]).Top * SecScale_) + El_S * 2),
                          TOrLAN(Nodes[i]).Picture.Graphic );
 end;

 if Setup_.ShowHints_ = True then
   for i:=0 to Nodes.Count-1 do
   begin
     tLeft := Round(TOrLAN(Nodes[i]).Left * SecScale_) + El_S;
     tLeft := Round(tLeft - cnv.TextWidth(TOrLAN(Nodes[i]).NodeName) / 2);
     tTop := Round(TOrLAN(Nodes[i]).Top * SecScale_);
     tTop := Round(tTop - cnv.TextHeight(TOrLAN(Nodes[i]).NodeName) * 1.3 );

     cnv.TextOut( tLeft, tTop, TOrLAN(Nodes[i]).NodeName );
   end;

end;


{***************************
 Нажатие клавиши на IMG
****************************}
procedure TMainForm.Img_Mouse_Down(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
 if Connecting=True then
 begin
   for i:=0 to Nodes.Count-1 do // выяснение к какому узлу подсоединяем
     if TOrLAN(Nodes[i]).NodeID=(Sender as TOrLAN).NodeID then
       Con_Num2:=i;

   FormConnect.bNewConn := True;
   FormConnect.ShowModal;
   Connecting := False;
   NeedRepaint:=True;
 end
 else
 begin
   Old_X:=(Sender as TOrLAN).Left;
   Old_Y:=(Sender as TOrLAN).Top;

   for i:=0 to Nodes.Count-1 do
     if TOrLAN(Nodes[i]).Active=True then
       TOrLAN(Nodes[i]).Active:=False;

   (Sender as TOrLAN).Active:=True;

   Offset_x:=x;
   Offset_y:=y;
 end;
end;

procedure TMainForm.Img_DblClick(Sender: TObject);
begin
   if ViewModellingResuls = True then
      N_ResultsClick(nil)
   else
      N_ParamsClick(nil);
end;

procedure TMainForm.N_ExitClick(Sender: TObject);
begin
 MainForm.Close;
end;

{**********************************************
Создание картинки
***********************************************}
procedure TMainForm.SpeedButtonMakePicClick(Sender: TObject);
var
    NewRect: TRect;
begin
 SpeedButtonMakePic.Down := False;

 if Nodes.Count = 0 then
 begin
  	Application.MessageBox(
	'В проекте нет ни одного элемента.',
	'Информация',
	MB_OK+MB_IconInformation);
    exit;
 end;

 Screen_Picture:=TImage.Create(Self);// создание картинки
 Screen_Picture.Parent:=MainForm; // для сохранения экрана
 Screen_Picture.Visible:=False;

 Screen_Picture.Height:=MyPanel.Height;
 Screen_Picture.Width:=MyPanel.Width;

 NewRect := Rect(0,0,MyPanel.Width,MyPanel.Height);
 Screen_Picture.Canvas.Brush.Color:=clWhite;
 Screen_Picture.Canvas.FillRect(NewRect);

 DrawConnectors( Screen_Picture.Canvas, 1 );

 if SaveDialog2.Execute then
   Screen_Picture.Picture.SaveToFile(SaveDialog2.FileName);

 Screen_Picture.Free;
end;


procedure TMainForm.Img_ContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  if ((Sender as TOrLAN).NodeType = 'WS') and (ViewModellingResuls = False) then
  begin
    FormJobs.WSName := (Sender as TOrLAN).NodeName;
    N_NodeJobs.Visible := True;
  end
  else
    N_NodeJobs.Visible := False;

  Handled := False;
end;

procedure TMainForm.N_Grid_1Click(Sender: TObject);
begin
 N_Grid_10.Checked:=False; // плавное передвижение
 N_Grid_20.Checked:=False;
 N_Grid_30.Checked:=False;
 N_Grid_40.Checked:=False;
 N_Grid_1.Checked:=True;
 Screen_grid:=1;
end;

{*************************************
Создание сервера
**************************************}
procedure TMainForm.N_AddServClick(Sender: TObject);
begin
 Project_Modified:=True;

 inc(Number_of_Servers);
 inc(MaxServ);
 StatusBar1.Panels[1].Text:='Серверов - '+IntToStr(Number_of_Servers);

 Node_Elem:=CreateNewNode( 'SERV', 'Server#'+IntToStr(MaxServ), Mouse_X, Mouse_Y );

 Node_Elem.ServParameters.Soft:=FormWS.ComboBox1.Items[0];
 Node_Elem.ServParameters.Cost:=100;
 Node_Elem.ServParameters.Processor:=FormWS.ComboBox3.Items[0];
 Node_Elem.ServParameters.NumberProc:=2;
 Node_Elem.ServParameters.RAM:=32;
 Node_Elem.ServParameters.HDD:=2100;
 Node_Elem.ServParameters.OSType:=FormServer.ComboBox2.Items[0];

 Nodes.Add(Node_Elem);

 FormServer.Showmodal; // форма параметров сервера
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
 try
   if ((not Application.Terminated) and (ComboBoxGrid.ItemIndex <> -1)) then
     ComboBoxGridChange(nil);
 except
 end;

end;

{*************************************
Создание KOMM
**************************************}
procedure TMainForm.N_AddKommClick(Sender: TObject);
begin
 Project_Modified:=True;

 inc(Number_of_Kommutators); // увеличить кол-во
 inc(MaxKomm);
 StatusBar1.Panels[2].Text:='Коммутаторов - ' + IntToStr(Number_of_Kommutators);

 Node_Elem:=CreateNewNode( 'KOMM', 'Switch#'+IntToStr(MaxKomm), Mouse_X, Mouse_Y );

 Node_Elem.KommParameters.Producer:='';
 Node_Elem.KommParameters.Prod_Name:='';
 Node_Elem.KommParameters.Eth_PortNumber:=0;
 Node_Elem.KommParameters.F_Eth_PortNumber:=0;
 Node_Elem.KommParameters.G_Eth_PortNumber:=0;
 Node_Elem.KommParameters.ATM_PortNumber:=0;
 Node_Elem.KommParameters.FDDI_PortNumber:=0;
 Node_Elem.KommParameters.Duplex:=False;
 Node_Elem.KommParameters.Int_Bus:=0;
 Node_Elem.KommParameters.Cost:=0;

 Nodes.Add(Node_Elem);

 Form6.bNewNode := True;
 Form6.Showmodal; // форма параметров KOMM

end;

procedure TMainForm.N31Click(Sender: TObject);
begin
 Form6.ShowModal;
end;

procedure TMainForm.N_NewClick(Sender: TObject);
begin
 SpeedButtonNewClick(Sender);
end;

procedure TMainForm.N_OpenClick(Sender: TObject);
begin
 SpeedButtonOpenClick(Sender);
end;

procedure TMainForm.N_SaveAsClick(Sender: TObject);
begin
   if SaveDialog1.Execute then
   begin
     Project_Name:=ChangeFileExt(ExtractFileName(SaveDialog1.FileName),'');
     Project_Path:=ExtractFilePath(SaveDialog1.FileName);
     Setup_.LastProject_:=SaveDialog1.FileName;

     MainForm.Caption:='OrLAN - ' + Project_name;

     InsertFileInMenu;
     Save_File2(SaveDialog1.FileName);
   end;
end;

procedure TMainForm.SpeedButtonReportClick(Sender: TObject);
begin
 SpeedButtonReport.Down:=False;
 if Nodes.Count=0 then
 begin
   Application.MessageBox(
	'В проекте нет ни одного элемента.',
	'Информация',
	MB_OK+MB_IconInformation);
   exit;
 end;
 ReportForm.ShowModal;
end;

procedure TMainForm.N_SettingsClick(Sender: TObject);
begin
 SetupForm.ShowModal;
end;

procedure TMainForm.N35Click(Sender: TObject);
begin
 Form10.ShowModal;
end;

procedure TMainForm.N_SaveClick(Sender: TObject);
begin
 SpeedButtonSaveClick(Sender);
end;

procedure TMainForm.N_Grid_UserClick(Sender: TObject);
begin
 Form11.ShowModal;
end;


procedure TMainForm.N_DBClick(Sender: TObject);
begin
 FormDB.ShowModal;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Komm_List.Free;
 AP_List.Free;
 Konc_List.Free;
 Prot_List.Free;
 Main_DB.Free;
 Nodes.Free;
 ModelResult.Free;
end;

procedure TMainForm.InsertFileInMenu;
var i,j:integer;
    s:string;
begin
 if Project_Name='NoName' then
   exit;

 for i:=1 to Setup_.FileListFrom_ do
   if Setup_.File_[i] = Project_Path + Project_Name + '.oln' then
   begin
    s:=Setup_.File_[1];
    for j:=i downto 2 do
      Setup_.File_[j]:=Setup_.File_[j-1];

    Setup_.File_[1]:=Project_Path + Project_Name + '.oln';
//    Setup_.File_[2]:=s;

    if Setup_.File_[1]<>'' then
     file11.Caption:=Setup_.File_[1]
    else
     file11.Visible:=False;
    if Setup_.File_[2]<>'' then
     file21.Caption:=Setup_.File_[2]
    else
     file21.Visible:=False;
    if Setup_.File_[3]<>'' then
     file31.Caption:=Setup_.File_[3]
    else
     file31.Visible:=False;
    if Setup_.File_[4]<>'' then
     file41.Caption:=Setup_.File_[4]
    else
     file41.Visible:=False;
    if Setup_.File_[5]<>'' then
     file51.Caption:=Setup_.File_[5]
    else
     file51.Visible:=False;
    if Setup_.File_[6]<>'' then
     file61.Caption:=Setup_.File_[6]
    else
     file61.Visible:=False;
    if Setup_.File_[7]<>'' then
     file71.Caption:=Setup_.File_[7]
    else
     file71.Visible:=False;
    if Setup_.File_[8]<>'' then
     file81.Caption:=Setup_.File_[8]
    else
     file81.Visible:=False;
    if Setup_.File_[9]<>'' then
     file91.Caption:=Setup_.File_[9]
    else
     file91.Visible:=False;

    Exit;
   end;

 // если проект не имеется в списке проектов
 s:=Setup_.File_[1];
 for i:=9 downto 2 do
   Setup_.File_[i]:=Setup_.File_[i-1];

 Setup_.File_[1]:=Project_Path + Project_Name + '.oln';

 if Setup_.File_[1]<>'' then
  file11.Caption:=Setup_.File_[1]
 else
  file11.Visible:=False;
 if Setup_.File_[2]<>'' then
  file21.Caption:=Setup_.File_[2]
 else
  file21.Visible:=False;
 if Setup_.File_[3]<>'' then
  file31.Caption:=Setup_.File_[3]
 else
  file31.Visible:=False;
 if Setup_.File_[4]<>'' then
  file41.Caption:=Setup_.File_[4]
 else
  file41.Visible:=False;
 if Setup_.File_[5]<>'' then
  file51.Caption:=Setup_.File_[5]
 else
  file51.Visible:=False;
 if Setup_.File_[6]<>'' then
  file61.Caption:=Setup_.File_[6]
 else
  file61.Visible:=False;
 if Setup_.File_[7]<>'' then
  file71.Caption:=Setup_.File_[7]
 else
  file71.Visible:=False;
 if Setup_.File_[8]<>'' then
  file81.Caption:=Setup_.File_[8]
 else
  file81.Visible:=False;
 if Setup_.File_[9]<>'' then
  file91.Caption:=Setup_.File_[9]
 else
  file91.Visible:=False;

end;


procedure TMainForm.file11Click(Sender: TObject);
begin
 OpenFileByName(file11.Caption);
end;

procedure TMainForm.file21Click(Sender: TObject);
begin
 OpenFileByName(file21.Caption);
end;

procedure TMainForm.file31Click(Sender: TObject);
begin
 OpenFileByName(file31.Caption);
end;

procedure TMainForm.file41Click(Sender: TObject);
begin
 OpenFileByName(file41.Caption);
end;

procedure TMainForm.file51Click(Sender: TObject);
begin
	OpenFileByName(file51.Caption);
end;

procedure TMainForm.file61Click(Sender: TObject);
begin
	OpenFileByName(file61.Caption);
end;

procedure TMainForm.file71Click(Sender: TObject);
begin
	OpenFileByName(file71.Caption);
end;

procedure TMainForm.file81Click(Sender: TObject);
begin
	OpenFileByName(file81.Caption);
end;


procedure TMainForm.file91Click(Sender: TObject);
begin
	OpenFileByName(file91.Caption);
end;


procedure TMainForm.ComboBoxGridChange(Sender: TObject);
var i, xmax, ymax:integer;
  OldScale_ : Integer;
begin
 MyPanel.Align:=alNone;

 OldScale_ := Scale_;
 Scale_:=StrToInt(ComboBoxGrid.Text);

 xmax:=0;
 ymax:=0;

 for i:=0 to Nodes.Count-1 do
 begin
   TOrLAN(Nodes[i]).Left := Round(TOrLAN(Nodes[i]).Left * Scale_ / OldScale_);
   TOrLAN(Nodes[i]).Top := Round(TOrLAN(Nodes[i]).Top * Scale_ / OldScale_);
   TOrLAN(Nodes[i]).Height:=Round( 50 * Scale_ / 100 );
   TOrLAN(Nodes[i]).Width:=Round( 50 * Scale_ / 100 );

   if xmax < TOrLAN(Nodes[i]).Left then xmax:=TOrLAN(Nodes[i]).Left;
   if ymax < TOrLAN(Nodes[i]).Top then ymax:=TOrLAN(Nodes[i]).Top;
 end;

 xmax := xmax + 100;
 ymax := ymax + 100;

 MyPanel.Width := Max( xmax, ClientWidth - 20);
 MyPanel.Height := Max( ymax, ClientHeight - 60);

 NeedRepaint:=True;
 //MyPanel.SetFocus;
end;


procedure TMainForm.Timer1Timer(Sender: TObject);
begin
 StatusBar1.Panels[4].Text:='Автосохранение ...';
 Save_File2('Autosave.oln');
 StatusBar1.Panels[4].Text:='';
end;

procedure TMainForm.SpeedButtonExpressClick(Sender: TObject);
begin
 SpeedButtonExpress.Down := False;
 if Nodes.Count = 0 then
  begin
  	Application.MessageBox(
	'В проекте нет ни одного элемента.',
	'Информация',
	MB_OK+MB_IconInformation);
   exit;
  end;
 FormXA.ShowModal;
end;

procedure TMainForm.N_ExpressClick(Sender: TObject);
begin
 SpeedButtonExpressClick(nil);
end;

procedure TMainForm.Timer2Timer(Sender: TObject);
begin
 if NeedRepaint=True then
 begin
   RepaintConnectors;
   NeedRepaint:=False;
 end;
end;


procedure TMainForm.N_AddKoncClick(Sender: TObject);
begin
 Project_Modified:=True;

 inc(Number_of_Konc); // увеличить кол-во
 inc(MaxKonc);
 StatusBar1.Panels[3].Text:='Концентраторов - '+IntToStr(Number_of_Konc);

 Node_Elem:=CreateNewNode( 'KONC', 'Hub#'+IntToStr(MaxKonc), Mouse_X, Mouse_Y );

 Node_Elem.KoncParameters.Producer:='';
 Node_Elem.KoncParameters.Prod_Name:='';
 Node_Elem.KoncParameters.Eth_PortNumber:=0;
 Node_Elem.KoncParameters.F_Eth_PortNumber:=0;
 Node_Elem.KoncParameters.G_Eth_PortNumber:=0;
 Node_Elem.KoncParameters.ATM_PortNumber:=0;
 Node_Elem.KoncParameters.FDDI_PortNumber:=0;
 Node_Elem.KoncParameters.Cost:=0;

 Nodes.Add(Node_Elem);

 Form20.bNewNode := True;
 Form20.Showmodal;
end;


//открыть параметры элемента
procedure TMainForm.N_ParamsClick(Sender: TObject);
var i:integer;
begin
 for i:=0 to Nodes.Count-1 do
  if TOrLAN(Nodes[i]).Active=True then
   begin
    if TOrLAN(Nodes[i]).NodeType='WS' then FormWS.ShowModal;
    if TOrLAN(Nodes[i]).NodeType='SERV' then FormServer.ShowModal;
    if TOrLAN(Nodes[i]).NodeType='KOMM' then
    begin
      Form6.bNewNode := False;
      Form6.ShowModal;
    end;
    if TOrLAN(Nodes[i]).NodeType='AP' then
    begin
      Form1.bNewNode := False;
      Form1.ShowModal;
    end;
    if TOrLAN(Nodes[i]).NodeType='KONC' then
    begin
      Form20.bNewNode := False;
      Form20.ShowModal;
    end;
   end;
end;

procedure TMainForm.N_DeleteClick(Sender: TObject);
var i,j,k,z:integer;
begin
 for i:=0 to Nodes.Count-1 do
  begin

   if TOrLAN(Nodes[i]).NodeType='WS' then
    if TOrLAN(Nodes[i]).Active=True then
     begin
      for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
       for k:=0 to Nodes.Count-1 do
        if TOrLAN(Nodes[k]).NodeID=
           Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID then
         for z:=0 to TOrLAN(Nodes[k]).Ports.Count-1 do
          if Port_Element(TOrLAN(Nodes[k]).Ports[z]).ID=
             TOrLAN(Nodes[i]).NodeID then
               Port_Element(TOrLAN(Nodes[k]).Ports.Items[z]).IsUsed:=False;
      for j:=0 to Nodes.Count-1 do
       TOrLAN(Nodes[j]).Ports.Pack;

      TOrLAN(Nodes[i]).Free;
      Nodes.Delete(i);
      Dec(Number_of_Workstations);
      StatusBar1.Panels[0].Text:='Рабочих станций - '+
        IntToStr(Number_of_Workstations);
      NeedRepaint:=True;
      Exit;
     end;
   if TOrLAN(Nodes[i]).NodeType='SERV' then
    if TOrLAN(Nodes[i]).Active=True then
     begin
      for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
       for k:=0 to Nodes.Count-1 do
        if TOrLAN(Nodes[k]).NodeID=
           Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID then
         for z:=0 to TOrLAN(Nodes[k]).Ports.Count-1 do
          if Port_Element(TOrLAN(Nodes[k]).Ports[z]).ID=
             TOrLAN(Nodes[i]).NodeID then
                Port_Element(TOrLAN(Nodes[k]).Ports.Items[z]).IsUsed:=False;
      for j:=0 to Nodes.Count-1 do
       TOrLAN(Nodes[j]).Ports.Pack;

      TOrLAN(Nodes[i]).Free;
      Nodes.Delete(i);
      Dec(Number_of_Servers);
      StatusBar1.Panels[1].Text:='Серверов - '+
        IntToStr(Number_of_Servers);
      NeedRepaint:=True;
      Exit;
     end;

   if TOrLAN(Nodes[i]).NodeType='KOMM' then
    if TOrLAN(Nodes[i]).Active=True then
     begin
      for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
       for k:=0 to Nodes.Count-1 do
        if TOrLAN(Nodes[k]).NodeID=
           Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID then
         for z:=0 to TOrLAN(Nodes[k]).Ports.Count-1 do
          if Port_Element(TOrLAN(Nodes[k]).Ports[z]).ID=
             TOrLAN(Nodes[i]).NodeID then
           Port_Element(TOrLAN(Nodes[k]).Ports.Items[z]).IsUsed:=False;
      for j:=0 to Nodes.Count-1 do
       TOrLAN(Nodes[j]).Ports.Pack;

      TOrLAN(Nodes[i]).Free;
      Nodes.Delete(i);
      Dec(Number_of_Kommutators);
      StatusBar1.Panels[2].Text:='Коммутаторов - '+
        IntToStr(Number_of_Kommutators);
      NeedRepaint:=True;
      Exit;
     end;

   if TOrLAN(Nodes[i]).NodeType='AP' then
    if TOrLAN(Nodes[i]).Active=True then
     begin
      for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
       for k:=0 to Nodes.Count-1 do
        if TOrLAN(Nodes[k]).NodeID=
           Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID then
         for z:=0 to TOrLAN(Nodes[k]).Ports.Count-1 do
          if Port_Element(TOrLAN(Nodes[k]).Ports[z]).ID=
             TOrLAN(Nodes[i]).NodeID then
           Port_Element(TOrLAN(Nodes[k]).Ports.Items[z]).IsUsed:=False;
      for j:=0 to Nodes.Count-1 do
       TOrLAN(Nodes[j]).Ports.Pack;

      TOrLAN(Nodes[i]).Free;
      Nodes.Delete(i);
      Dec(Number_of_APs);
      StatusBar1.Panels[4].Text:='Точек доступа - '+
        IntToStr(Number_of_APs);
      NeedRepaint:=True;
      Exit;
     end;

   if TOrLAN(Nodes[i]).NodeType='KONC' then
    if TOrLAN(Nodes[i]).Active=True then
     begin
      for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
       for k:=0 to Nodes.Count-1 do
        if TOrLAN(Nodes[k]).NodeID=
           Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID then
         for z:=0 to TOrLAN(Nodes[k]).Ports.Count-1 do
          if Port_Element(TOrLAN(Nodes[k]).Ports[z]).ID=
             TOrLAN(Nodes[i]).NodeID then
           Port_Element(TOrLAN(Nodes[k]).Ports.Items[z]).IsUsed:=False;
      for j:=0 to Nodes.Count-1 do
       TOrLAN(Nodes[j]).Ports.Pack;

      TOrLAN(Nodes[i]).Free;
      Nodes.Delete(i);
      Dec(Number_of_Konc);
      StatusBar1.Panels[3].Text:='Концентраторов - '+
        IntToStr(Number_of_Konc);
      NeedRepaint:=True;
      Exit;
     end;
  end;
end;

procedure TMainForm.Save_File2(FileName:string);
const Header_='OrLAN5W00PRJ';
var SaveStream: TMemoryStream;
    i,j: integer;
    prj_x,prj_y:integer;
    k:byte;
    r:real;
begin
 try
  SaveStream:=TMemoryStream.Create;
  SaveStream.Write(Header_,Length(Header_)); // Заголовок

  SaveStream.Write(Number_of_WorkStations,SizeOf(Number_of_WorkStations)); // Кол-во Раб. Станций
  SaveStream.Write(Number_of_Servers,SizeOf(Number_of_Servers)); // Кол-во серверов
  SaveStream.Write(Number_of_Kommutators,SizeOf(Number_of_Kommutators)); // Кол-во Коммутаторов
  SaveStream.Write(Number_of_Konc,SizeOf(Number_of_Konc)); // Кол-во концентр.
  SaveStream.Write(Number_of_APs,SizeOf(Number_of_APs)); // Кол-во точек доступа.

  SaveStream.Write(MaxWS,SizeOf(MaxWS));
  SaveStream.Write(MaxServ,SizeOf(MaxServ));
  SaveStream.Write(MaxKomm,SizeOf(MaxKomm));
  SaveStream.Write(MaxKonc,SizeOf(MaxKonc));
  SaveStream.Write(MaxAPs,SizeOf(MaxAPs));
  SaveStream.Write(Screen_grid,SizeOf(Screen_grid)); // масштабная сетка

  prj_x := Min( Round(MyPanel.Width * 100 / Scale_), ClientWidth);
  prj_y := Min( Round(MyPanel.Height * 100 / Scale_), ClientHeight);

  SaveStream.Write(prj_x,SizeOf(prj_x)); // Высота проекта
  SaveStream.Write(prj_y,SizeOf(prj_y)); // ширина проекта

  for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='WS' then
    begin
     k:=Length(TOrLAN(Nodes[i]).NodeName);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).NodeName)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).NodeID, sizeof(TOrLAN(Nodes[i]).NodeID));//
     SaveStream.Write(TOrLAN(Nodes[i]).X, sizeof(TOrLAN(Nodes[i]).X));//
     SaveStream.Write(TOrLAN(Nodes[i]).Y, sizeof(TOrLAN(Nodes[i]).Y));//
     SaveStream.Write(TOrLAN(Nodes[i]).PortNumber, sizeof(TOrLAN(Nodes[i]).PortNumber));//
     k:=Length(TOrLAN(Nodes[i]).WSParameters.Soft);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).WSParameters.Soft)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).WSParameters.Cost, sizeof(TOrLAN(Nodes[i]).WSParameters.Cost));//
     k:=Length(TOrLAN(Nodes[i]).WSParameters.Processor);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).WSParameters.Processor)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).WSParameters.RAM, sizeof(TOrLAN(Nodes[i]).WSParameters.RAM));//
     SaveStream.Write(TOrLAN(Nodes[i]).WSParameters.HDD, sizeof(TOrLAN(Nodes[i]).WSParameters.HDD));//
     SaveStream.Write(TOrLAN(Nodes[i]).WSParameters.IntNIC, sizeof(TOrLAN(Nodes[i]).WSParameters.IntNIC));//

     SaveStream.Write(TOrLAN(Nodes[i]).WSParameters.RequestClass.Count,
       SizeOf(TOrLAN(Nodes[i]).WSParameters.RequestClass.Count));
     for j:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
      begin
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).ServID_,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).ServID_));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).Size_,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).Size_));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).AnsSize_,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).AnsSize_));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).TimeWS,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).TimeWS));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).TimeServ,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).TimeServ));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).TimeCycle,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).TimeCycle));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).Priority,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).Priority));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).PossibleTime,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).PossibleTime));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).PossiblePercent,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).PossiblePercent));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).DistOfServerDelay,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).DistOfServerDelay));
       SaveStream.Write(
         Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).HopDelay2,
         SizeOf(Model_Element(TOrLAN(Nodes[i]).WSParameters.RequestClass.Items[j]).HopDelay2));
      end;

     SaveStream.Write(TOrLAN(Nodes[i]).Ports.Count,
       SizeOf(TOrLAN(Nodes[i]).Ports.Count));
     for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      begin
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2));
      end;
    end;

  for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='SERV' then
    begin
     k:=Length(TOrLAN(Nodes[i]).NodeName);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).NodeName)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).NodeID, sizeof(TOrLAN(Nodes[i]).NodeID));//
     SaveStream.Write(TOrLAN(Nodes[i]).X, sizeof(TOrLAN(Nodes[i]).X));//
     SaveStream.Write(TOrLAN(Nodes[i]).Y, sizeof(TOrLAN(Nodes[i]).Y));//
     SaveStream.Write(TOrLAN(Nodes[i]).PortNumber, sizeof(TOrLAN(Nodes[i]).PortNumber));//

     k:=Length(TOrLAN(Nodes[i]).ServParameters.Soft);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).ServParameters.Soft)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).ServParameters.Cost, sizeof(TOrLAN(Nodes[i]).ServParameters.Cost));//
     SaveStream.Write(TOrLAN(Nodes[i]).ServParameters.NumberProc, sizeof(TOrLAN(Nodes[i]).ServParameters.NumberProc));//
     k:=Length(TOrLAN(Nodes[i]).ServParameters.Processor);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).ServParameters.Processor)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).ServParameters.RAM, sizeof(TOrLAN(Nodes[i]).ServParameters.RAM));//
     SaveStream.Write(TOrLAN(Nodes[i]).ServParameters.HDD, sizeof(TOrLAN(Nodes[i]).ServParameters.HDD));//
     k:=Length(TOrLAN(Nodes[i]).ServParameters.OSType);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).ServParameters.OSType)^, k);//

     SaveStream.Write(TOrLAN(Nodes[i]).Ports.Count,
       SizeOf(TOrLAN(Nodes[i]).Ports.Count));
     for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      begin
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2));
      end;
    end;

  for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='KOMM' then
    begin
     k:=Length(TOrLAN(Nodes[i]).NodeName);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).NodeName)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).NodeID, sizeof(TOrLAN(Nodes[i]).NodeID));//
     SaveStream.Write(TOrLAN(Nodes[i]).X, sizeof(TOrLAN(Nodes[i]).X));//
     SaveStream.Write(TOrLAN(Nodes[i]).Y, sizeof(TOrLAN(Nodes[i]).Y));//
     SaveStream.Write(TOrLAN(Nodes[i]).PortNumber, sizeof(TOrLAN(Nodes[i]).PortNumber));//
     k:=Length(TOrLAN(Nodes[i]).KommParameters.Producer);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KommParameters.Producer)^, k);//
     k:=Length(TOrLAN(Nodes[i]).KommParameters.Prod_Name);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KommParameters.Prod_Name)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.Duplex,
         sizeof(TOrLAN(Nodes[i]).KommParameters.Duplex));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.Int_Bus,
         sizeof(TOrLAN(Nodes[i]).KommParameters.Int_Bus));//
     SaveStream.Write(TOrLAN(Nodes[i]).KommParameters.Cost,
         sizeof(TOrLAN(Nodes[i]).KommParameters.Cost));//
     k:=Length(TOrLAN(Nodes[i]).KommParameters.Eth_Type);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KommParameters.Eth_Type)^, k);//
     k:=Length(TOrLAN(Nodes[i]).KommParameters.F_Eth_Type);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KommParameters.F_Eth_Type)^, k);//
     for j:=1 to 5 do
      for k:=1 to 5 do
       begin
        r:=TOrLAN(Nodes[i]).Komm_Time[j,k];
        SaveStream.Write(r,sizeof(r));//
       end;

     SaveStream.Write(TOrLAN(Nodes[i]).Ports.Count,
       SizeOf(TOrLAN(Nodes[i]).Ports.Count));
     for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      begin
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2));
      end;
    end;

  for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='AP' then
    begin
     k:=Length(TOrLAN(Nodes[i]).NodeName);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).NodeName)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).NodeID, sizeof(TOrLAN(Nodes[i]).NodeID));//
     SaveStream.Write(TOrLAN(Nodes[i]).X, sizeof(TOrLAN(Nodes[i]).X));//
     SaveStream.Write(TOrLAN(Nodes[i]).Y, sizeof(TOrLAN(Nodes[i]).Y));//
     SaveStream.Write(TOrLAN(Nodes[i]).PortNumber, sizeof(TOrLAN(Nodes[i]).PortNumber));//
     k:=Length(TOrLAN(Nodes[i]).AP_Parameters.Producer);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).AP_Parameters.Producer)^, k);//
     k:=Length(TOrLAN(Nodes[i]).AP_Parameters.Prod_Name);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).AP_Parameters.Prod_Name)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.Duplex,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.Duplex));//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.Int_Bus,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.Int_Bus));//
     SaveStream.Write(TOrLAN(Nodes[i]).AP_Parameters.Cost,
         sizeof(TOrLAN(Nodes[i]).AP_Parameters.Cost));//
     k:=Length(TOrLAN(Nodes[i]).AP_Parameters.Eth_Type);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).AP_Parameters.Eth_Type)^, k);//
     k:=Length(TOrLAN(Nodes[i]).AP_Parameters.F_Eth_Type);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).AP_Parameters.F_Eth_Type)^, k);//
     for j:=1 to 5 do
      for k:=1 to 5 do
       begin
        r:=TOrLAN(Nodes[i]).Komm_Time[j,k];
        SaveStream.Write(r,sizeof(r));//
       end;

     SaveStream.Write(TOrLAN(Nodes[i]).Ports.Count,
       SizeOf(TOrLAN(Nodes[i]).Ports.Count));
     for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      begin
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2));
      end;
    end;

  for i:=0 to Nodes.Count-1 do
   if TOrLAN(Nodes[i]).NodeType='KONC' then
    begin
     k:=Length(TOrLAN(Nodes[i]).NodeName);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).NodeName)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).NodeID, sizeof(TOrLAN(Nodes[i]).NodeID));//
     SaveStream.Write(TOrLAN(Nodes[i]).X, sizeof(TOrLAN(Nodes[i]).X));//
     SaveStream.Write(TOrLAN(Nodes[i]).Y, sizeof(TOrLAN(Nodes[i]).Y));//
     SaveStream.Write(TOrLAN(Nodes[i]).PortNumber, sizeof(TOrLAN(Nodes[i]).PortNumber));//
     k:=Length(TOrLAN(Nodes[i]).KoncParameters.Producer);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KoncParameters.Producer)^, k);//
     k:=Length(TOrLAN(Nodes[i]).KoncParameters.Prod_Name);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KoncParameters.Prod_Name)^, k);//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber));//
     SaveStream.Write(TOrLAN(Nodes[i]).KoncParameters.Cost,
         sizeof(TOrLAN(Nodes[i]).KoncParameters.Cost));//
     k:=Length(TOrLAN(Nodes[i]).KoncParameters.Eth_Type);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KoncParameters.Eth_Type)^, k);//
     k:=Length(TOrLAN(Nodes[i]).KoncParameters.F_Eth_Type);
     SaveStream.Write(k, 1);//
     SaveStream.Write(Pointer(TOrLAN(Nodes[i]).KoncParameters.F_Eth_Type)^, k);//

     SaveStream.Write(TOrLAN(Nodes[i]).Ports.Count,
       SizeOf(TOrLAN(Nodes[i]).Ports.Count));
     for j:=0 to TOrLAN(Nodes[i]).Ports.Count-1 do
      begin
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).PortType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).Speed));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalType));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).SegmentID));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).IsUsed2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ID2));
       SaveStream.Write(
         Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2,
         SizeOf(Port_Element(TOrLAN(Nodes[i]).Ports[j]).ChannalLength2));
      end;
    end;


  SaveStream.SaveToFile(FileName);
  SaveStream.Free;

  Project_Modified:=False;
 except
   on E:Exception do
   begin
	Application.MessageBox(
	PChar('Ошибка записи файла проекта. ' +#10+#13+ E.Message),
	'Ошибка',
	MB_OK+MB_IconError);
   end;
 end;
end;

procedure TMainForm.Load_File2(FileName:string);
const Header_='OrLAN4W95PRJ';
const Header_v2='OrLAN4W98PRJ';
const Header_v3='OrLAN4W99PRJ';
const Header_v4='OrLAN4W00PRJ';
const Header_v5='OrLAN5W00PRJ';
var LoadStream: TMemoryStream;
    i,j,z: Integer;
    s: array [1..12] of char;
    k:byte;
    bool: boolean;
    Mod_Par:Model_Parameters;
    Mod_Par_v1:Model_Parameters_v1;
    P_Par: P_Parameters;
    ss: string;
    www: byte;
    r: real;
    single_: single;
begin
 StatusBar1.Panels[4].Text:='Загрузка проекта';
 LoadStream:=nil;

 for i:=0 to Nodes.Count-1 do // destroy all current nodes
 begin
    TOrLAN(Nodes[i]).Free;
    Nodes[i]:=nil;
 end;
 Nodes.Pack;

 try
  LoadStream:=TMemoryStream.Create;
  LoadStream.LoadFromFile(FileName);
  //www = Length(Header_);
  LoadStream.Read(s,Length(Header_));
  if (S<>Header_) AND (s<>Header_v2)  AND (s<>Header_v3) AND (s<>Header_v4) AND (s<>Header_v5) then
   begin
   	Application.MessageBox(
            'Это не проект "OrLAN для Windows".'+#10+#13+
            'Возможно, файл проекта "OrLAN для Windows" поврежден.',
            'Предупреждение',
            MB_OK+MB_IconExclamation);
    LoadStream.Free;
    Exit;
   end;
  LoadStream.Read(Number_of_WorkStations,SizeOf(Number_of_WorkStations)); // Кол-во Раб. Станций
  LoadStream.Read(Number_of_Servers,SizeOf(Number_of_Servers)); // Кол-во серверов
  LoadStream.Read(Number_of_Kommutators,SizeOf(Number_of_Kommutators)); // Кол-во Коммутаторов
  LoadStream.Read(Number_of_Konc,SizeOf(Number_of_Konc)); // Кол-во концентр.
  if s = Header_v5 then
    LoadStream.Read(Number_of_APs,SizeOf(Number_of_APs)); // Кол-во точек доступа.

  LoadStream.Read(MaxWS,SizeOf(MaxWS));
  LoadStream.Read(MaxServ,SizeOf(MaxServ));
  LoadStream.Read(MaxKomm,SizeOf(MaxKomm));
  LoadStream.Read(MaxKonc,SizeOf(MaxKonc));
  if s = Header_v5 then
    LoadStream.Read(MaxAPs,SizeOf(MaxAPs));
  LoadStream.Read(Screen_grid,SizeOf(Screen_grid)); // масштабная сетка

  StatusBar1.Panels[0].Text:='Рабочих станций - '+IntToStr(Number_of_WorkStations);
  StatusBar1.Panels[1].Text:='Серверов - '+IntToStr(Number_of_Servers);
  StatusBar1.Panels[2].Text:='Коммутаторов - '+IntToStr(Number_of_Kommutators);
  StatusBar1.Panels[3].Text:='Концентраторов - '+IntToStr(Number_of_Konc);
  StatusBar1.Panels[4].Text:='Точек доступа - '+IntToStr(Number_of_APs);

  MyPanel.Align:=alNone;
  LoadStream.Read(i,SizeOf(i)); // Высота проекта
  MyPanel.Width := i;
  LoadStream.Read(i,SizeOf(i)); // ширина проекта
  MyPanel.Height := i;

  for i:=1 to Number_of_WorkStations do
   begin
    Node_Elem:=TOrLAN.Create(Self);
    Node_Elem.Parent:=MyPanel;

    Node_Elem.PopupMenu := PopupMenuNode;
    Node_Elem.OnContextPopup := Img_ContextPopup;
    Node_Elem.OnDblClick := Img_DblClick;
    Node_Elem.OnMouseDown:=Img_Mouse_Down;
    Node_Elem.OnMouseUp:=Img_Mouse_Up;
    Node_Elem.OnMouseMove:=Img_Mouse_Move;

    Node_Elem.NodeType:='WS';
    Node_Elem.Active:=False;
    Node_Elem.Tag:=0;

    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.NodeName:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.NodeID));//
    Node_Elem.NodeID:=j;
    LoadStream.Read(j, sizeof(Node_Elem.X));//
    Node_Elem.X:=j;
    LoadStream.Read(j, sizeof(Node_Elem.Y));//
    Node_Elem.Y:=j;
    LoadStream.Read(j, sizeof(Node_Elem.PortNumber));//
    Node_Elem.PortNumber:=j;
    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.WSParameters.Soft:=ss;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).WSParameters.Cost));//
    Node_Elem.WSParameters.Cost:=j;
    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.WSParameters.Processor:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.WSParameters.RAM));//
    Node_Elem.WSParameters.RAM:=j;
    LoadStream.Read(j, sizeof(Node_Elem.WSParameters.HDD));//
    Node_Elem.WSParameters.HDD:=j;
    LoadStream.Read(bool, sizeof(Node_Elem.WSParameters.IntNIC));//
    Node_Elem.WSParameters.IntNIC:=bool;

    LoadStream.Read(z,SizeOf(Node_Elem.WSParameters.RequestClass.Count));
    for j:=0 to z-1 do
     begin

    //______________________// dbHOSTzone /____________________________
    //_
      if (s=Header_) then
      	begin
		LoadStream.Read(Mod_Par_v1.Serv_,SizeOf(Mod_Par_v1.Serv_));
		LoadStream.Read(Mod_Par_v1.Size_,SizeOf(Mod_Par.Size_));
		LoadStream.Read(Mod_Par_v1.AnsSize_,SizeOf(Mod_Par.AnsSize_));
		LoadStream.Read(Mod_Par_v1.TimeWS,SizeOf(Mod_Par.TimeWS));
		LoadStream.Read(Mod_Par_v1.TimeServ,SizeOf(Mod_Par.TimeServ));
		LoadStream.Read(Mod_Par_v1.TimeCycle,SizeOf(Mod_Par.TimeCycle));

        Mod_Par_v1.Priority:=1;
        Mod_Par_v1.PossibleTime:=Round(Mod_Par_v1.TimeCycle);
        Mod_Par_v1.PossiblePercent:=0;
		Mod_Par_v1.DistOfServerDelay:=Constant;
		Mod_Par_v1.HopDelay2:=0;


		New(Model_Elem_v1);
		Model_Elem_v1^.Serv_:=Mod_Par_v1.Serv_;
		Model_Elem_v1^.Size_:=Mod_Par_v1.Size_;
		Model_Elem_v1^.AnsSize_:=Mod_Par_v1.AnsSize_;
		Model_Elem_v1^.TimeWS:=Mod_Par_v1.TimeWS;
		Model_Elem_v1^.TimeServ:=Mod_Par_v1.TimeServ;
		Model_Elem_v1^.TimeCycle:=Mod_Par_v1.TimeCycle;
		Model_Elem_v1^.Priority:=Mod_Par_v1.Priority;
        Model_Elem_v1^.PossibleTime:=Mod_Par_v1.PossibleTime;
        Model_Elem_v1^.PossiblePercent:=Mod_Par_v1.PossiblePercent;
        Model_Elem_v1^.DistOfServerDelay:=Mod_Par_v1.DistOfServerDelay;
        Model_Elem_v1^.HopDelay2:=Mod_Par_v1.HopDelay2;

		Node_Elem.WSParameters.RequestClass.Add(Model_Elem_v1);
        end;

      if (s=Header_v2) then
		begin
      	LoadStream.Read(Mod_Par.ServID_,SizeOf(Mod_Par.ServID_));
		LoadStream.Read(Mod_Par.Size_,SizeOf(Mod_Par.Size_));
		LoadStream.Read(Mod_Par.AnsSize_,SizeOf(Mod_Par.AnsSize_));
		LoadStream.Read(Mod_Par.TimeWS,SizeOf(Mod_Par.TimeWS));
		LoadStream.Read(Mod_Par.TimeServ,SizeOf(Mod_Par.TimeServ));
		LoadStream.Read(Mod_Par.TimeCycle,SizeOf(Mod_Par.TimeCycle));
      	LoadStream.Read(Mod_Par.Priority,SizeOf(Mod_Par.Priority));

        Mod_Par.PossibleTime:=Round(Mod_Par.TimeCycle);
        Mod_Par.PossiblePercent:=0;
		Mod_Par.DistOfServerDelay:=Constant;
		Mod_Par.HopDelay2:=0;


		New(Model_Elem);
		Model_Elem^.ServID_:=Mod_Par.ServID_;
		Model_Elem^.Size_:=Mod_Par.Size_;
		Model_Elem^.AnsSize_:=Mod_Par.AnsSize_;
		Model_Elem^.TimeWS:=Mod_Par.TimeWS;
		Model_Elem^.TimeServ:=Mod_Par.TimeServ;
		Model_Elem^.TimeCycle:=Mod_Par.TimeCycle;
		Model_Elem^.Priority:=Mod_Par.Priority;
        Model_Elem^.PossibleTime:=Mod_Par.PossibleTime;
        Model_Elem^.PossiblePercent:=Mod_Par.PossiblePercent;
        Model_Elem^.DistOfServerDelay:=Mod_Par.DistOfServerDelay;
        Model_Elem^.HopDelay2:=Mod_Par.HopDelay2;

		Node_Elem.WSParameters.RequestClass.Add(Model_Elem);
        end;

      if (s=Header_v3) then
		begin
      	LoadStream.Read(Mod_Par.ServID_,SizeOf(Mod_Par.ServID_));
		LoadStream.Read(Mod_Par.Size_,SizeOf(Mod_Par.Size_));
		LoadStream.Read(Mod_Par.AnsSize_,SizeOf(Mod_Par.AnsSize_));
		LoadStream.Read(Mod_Par.TimeWS,SizeOf(Mod_Par.TimeWS));
		LoadStream.Read(Mod_Par.TimeServ,SizeOf(Mod_Par.TimeServ));
		LoadStream.Read(Mod_Par.TimeCycle,SizeOf(Mod_Par.TimeCycle));
      	LoadStream.Read(Mod_Par.Priority,SizeOf(Mod_Par.Priority));
      	LoadStream.Read(Mod_Par.PossibleTime,SizeOf(Mod_Par.PossibleTime));
      	LoadStream.Read(Mod_Par.PossiblePercent,SizeOf(Mod_Par.PossiblePercent));

		Mod_Par.DistOfServerDelay:=Constant;
		Mod_Par.HopDelay2:=0;

        New(Model_Elem);
		Model_Elem^.ServID_:=Mod_Par.ServID_;
		Model_Elem^.Size_:=Mod_Par.Size_;
		Model_Elem^.AnsSize_:=Mod_Par.AnsSize_;
		Model_Elem^.TimeWS:=Mod_Par.TimeWS;
		Model_Elem^.TimeServ:=Mod_Par.TimeServ;
		Model_Elem^.TimeCycle:=Mod_Par.TimeCycle;
		Model_Elem^.Priority:=Mod_Par.Priority;
        Model_Elem^.PossibleTime:=Mod_Par.PossibleTime;
        Model_Elem^.PossiblePercent:=Mod_Par.PossiblePercent;
        Model_Elem^.DistOfServerDelay:=Mod_Par.DistOfServerDelay;
        Model_Elem^.HopDelay2:=Mod_Par.HopDelay2;

		Node_Elem.WSParameters.RequestClass.Add(Model_Elem);
        end;

      if (s=Header_v4) OR (s=Header_v5) then
		begin
      	LoadStream.Read(Mod_Par.ServID_,SizeOf(Mod_Par.ServID_));
		LoadStream.Read(Mod_Par.Size_,SizeOf(Mod_Par.Size_));
		LoadStream.Read(Mod_Par.AnsSize_,SizeOf(Mod_Par.AnsSize_));
		LoadStream.Read(Mod_Par.TimeWS,SizeOf(Mod_Par.TimeWS));
		LoadStream.Read(Mod_Par.TimeServ,SizeOf(Mod_Par.TimeServ));
		LoadStream.Read(Mod_Par.TimeCycle,SizeOf(Mod_Par.TimeCycle));
      	LoadStream.Read(Mod_Par.Priority,SizeOf(Mod_Par.Priority));
      	LoadStream.Read(Mod_Par.PossibleTime,SizeOf(Mod_Par.PossibleTime));
      	LoadStream.Read(Mod_Par.PossiblePercent,SizeOf(Mod_Par.PossiblePercent));
      	LoadStream.Read(Mod_Par.DistOfServerDelay,SizeOf(Mod_Par.DistOfServerDelay));
      	LoadStream.Read(Mod_Par.HopDelay2,SizeOf(Mod_Par.HopDelay2));

		New(Model_Elem);
		Model_Elem^.ServID_:=Mod_Par.ServID_;
		Model_Elem^.Size_:=Mod_Par.Size_;
		Model_Elem^.AnsSize_:=Mod_Par.AnsSize_;
		Model_Elem^.TimeWS:=Mod_Par.TimeWS;
		Model_Elem^.TimeServ:=Mod_Par.TimeServ;
		Model_Elem^.TimeCycle:=Mod_Par.TimeCycle;
		Model_Elem^.Priority:=Mod_Par.Priority;
        Model_Elem^.PossibleTime:=Mod_Par.PossibleTime;
        Model_Elem^.PossiblePercent:=Mod_Par.PossiblePercent;
        Model_Elem^.DistOfServerDelay:=Mod_Par.DistOfServerDelay;
        Model_Elem^.HopDelay2:=Mod_Par.HopDelay2;
		Node_Elem.WSParameters.RequestClass.Add(Model_Elem);
        end;
    //_
    //______________________/ dbHOSTzone //____________________________
     end;

    LoadStream.Read(z,SizeOf(Node_Elem.Ports.Count));
    for j:=0 to z-1 do
     begin
      LoadStream.Read(P_Par.PortType,SizeOf(P_Par.PortType));
      LoadStream.Read(P_Par.IsUsed,SizeOf(P_Par.IsUsed));
      LoadStream.Read(P_Par.Speed,SizeOf(P_Par.Speed));
      LoadStream.Read(P_Par.ChannalType,SizeOf(P_Par.ChannalType));
      LoadStream.Read(P_Par.ID,SizeOf(P_Par.ID));
      LoadStream.Read(P_Par.ChannalLength,SizeOf(P_Par.ChannalLength));
      LoadStream.Read(P_Par.ChannalID,SizeOf(P_Par.ChannalID));
      LoadStream.Read(P_Par.SegmentID,SizeOf(P_Par.SegmentID));
      LoadStream.Read(P_Par.IsUsed2,SizeOf(P_Par.IsUsed2));
      LoadStream.Read(P_Par.ID2,SizeOf(P_Par.ID2));
      LoadStream.Read(P_Par.ChannalLength2,SizeOf(P_Par.ChannalLength2));

      New(Ports_);
      Ports_^.PortType:=P_Par.PortType;
      Ports_^.IsUsed:=P_Par.IsUsed;
      Ports_^.Speed:=P_Par.Speed;
      Ports_^.ChannalType:=P_Par.ChannalType;
      Ports_^.ID:=P_Par.ID;
      Ports_^.ChannalLength:=P_Par.ChannalLength;
      Ports_^.ChannalID:=P_Par.ChannalID;
      Ports_^.SegmentID:=P_Par.SegmentID;
      Ports_^.IsUsed2:=P_Par.IsUsed2;
      Ports_^.ID2:=P_Par.ID2;
      Ports_^.ChannalLength2:=P_Par.ChannalLength2;
      Node_Elem.Ports.Add(Ports_);
     end;
    Node_Elem.Top:=Node_Elem.Y;
    Node_Elem.Left:=Node_Elem.X;
    Node_Elem.Width := Round( 50 * Scale_ / 100 );
    Node_Elem.Height := Round( 50 * Scale_ / 100 );
    Nodes.Add(Node_Elem);
   end;

  for i:=1 to Number_of_Servers do
   begin
    Node_Elem:=TOrLAN.Create(Self);
    Node_Elem.Parent:=MyPanel;

    Node_Elem.PopupMenu := PopupMenuNode;
    Node_Elem.OnContextPopup := Img_ContextPopup;
    Node_Elem.OnDblClick := Img_DblClick;
    Node_Elem.OnMouseDown:=Img_Mouse_Down;
    Node_Elem.OnMouseUp:=Img_Mouse_Up;
    Node_Elem.OnMouseMove:=Img_Mouse_Move;

    Node_Elem.NodeType:='SERV';
    Node_Elem.Active:=False;
    Node_Elem.Tag:=0;

    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.NodeName:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.NodeID));//
    Node_Elem.NodeID:=j;
    LoadStream.Read(j, sizeof(Node_Elem.X));//
    Node_Elem.X:=j;
    LoadStream.Read(j, sizeof(Node_Elem.Y));//
    Node_Elem.Y:=j;
    LoadStream.Read(j, sizeof(Node_Elem.PortNumber));//
    Node_Elem.PortNumber:=j;
    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.ServParameters.Soft:=ss;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).ServParameters.Cost));//
    Node_Elem.ServParameters.Cost:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).ServParameters.NumberProc));//
    Node_Elem.ServParameters.NumberProc:=j;
    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.ServParameters.Processor:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.ServParameters.RAM));//
    Node_Elem.ServParameters.RAM:=j;
    LoadStream.Read(j, sizeof(Node_Elem.ServParameters.HDD));//
    Node_Elem.ServParameters.HDD:=j;
    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.ServParameters.OSType:=ss;

    LoadStream.Read(z,SizeOf(Node_Elem.Ports.Count));
    for j:=0 to z-1 do
     begin
      LoadStream.Read(P_Par.PortType,SizeOf(P_Par.PortType));
      LoadStream.Read(P_Par.IsUsed,SizeOf(P_Par.IsUsed));
      LoadStream.Read(P_Par.Speed,SizeOf(P_Par.Speed));
      LoadStream.Read(P_Par.ChannalType,SizeOf(P_Par.ChannalType));
      LoadStream.Read(P_Par.ID,SizeOf(P_Par.ID));
      LoadStream.Read(P_Par.ChannalLength,SizeOf(P_Par.ChannalLength));
      LoadStream.Read(P_Par.ChannalID,SizeOf(P_Par.ChannalID));
      LoadStream.Read(P_Par.SegmentID,SizeOf(P_Par.SegmentID));
      LoadStream.Read(P_Par.IsUsed2,SizeOf(P_Par.IsUsed2));
      LoadStream.Read(P_Par.ID2,SizeOf(P_Par.ID2));
      LoadStream.Read(P_Par.ChannalLength2,SizeOf(P_Par.ChannalLength2));

      New(Ports_);
      Ports_^.PortType:=P_Par.PortType;
      Ports_^.IsUsed:=P_Par.IsUsed;
      Ports_^.Speed:=P_Par.Speed;
      Ports_^.ChannalType:=P_Par.ChannalType;
      Ports_^.ID:=P_Par.ID;
      Ports_^.ChannalLength:=P_Par.ChannalLength;
      Ports_^.ChannalID:=P_Par.ChannalID;
      Ports_^.SegmentID:=P_Par.SegmentID;
      Ports_^.IsUsed2:=P_Par.IsUsed2;
      Ports_^.ID2:=P_Par.ID2;
      Ports_^.ChannalLength2:=P_Par.ChannalLength2;
      Node_Elem.Ports.Add(Ports_);
     end;
    Node_Elem.Top:=Node_Elem.Y;
    Node_Elem.Left:=Node_Elem.X;
    Node_Elem.Width := Round( 50 * Scale_ / 100 );
    Node_Elem.Height := Round( 50 * Scale_ / 100 );
    Nodes.Add(Node_Elem);
   end;

  for i:=1 to Number_of_Kommutators do
   begin
    Node_Elem:=TOrLAN.Create(Self);
    Node_Elem.Parent:=MyPanel;

    Node_Elem.PopupMenu := PopupMenuNode;
    Node_Elem.OnContextPopup := Img_ContextPopup;
    Node_Elem.OnDblClick := Img_DblClick;
    Node_Elem.OnMouseDown:=Img_Mouse_Down;
    Node_Elem.OnMouseUp:=Img_Mouse_Up;
    Node_Elem.OnMouseMove:=Img_Mouse_Move;

    Node_Elem.NodeType:='KOMM';
    Node_Elem.Active:=False;
    Node_Elem.Tag:=0;

    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.NodeName:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.NodeID));//
    Node_Elem.NodeID:=j;
    LoadStream.Read(j, sizeof(Node_Elem.X));//
    Node_Elem.X:=j;
    LoadStream.Read(j, sizeof(Node_Elem.Y));//
    Node_Elem.Y:=j;
    LoadStream.Read(j, sizeof(Node_Elem.PortNumber));//
    Node_Elem.PortNumber:=j;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KommParameters.Producer:=ss;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KommParameters.Prod_Name:=ss;

    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.Eth_PortNumber));//
    Node_Elem.KommParameters.Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.F_Eth_PortNumber));//
    Node_Elem.KommParameters.F_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.G_Eth_PortNumber));//
    Node_Elem.KommParameters.G_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.ATM_PortNumber));//
    Node_Elem.KommParameters.ATM_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.FDDI_PortNumber));//
    Node_Elem.KommParameters.FDDI_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.E_F_Eth_PortNumber));//
    Node_Elem.KommParameters.E_F_Eth_PortNumber:=j;
    LoadStream.Read(bool, sizeof(Node_Elem.KommParameters.Duplex));//
    Node_Elem.KommParameters.Duplex:=bool;
    LoadStream.Read(single_, sizeof(TOrLAN(Nodes[i]).KommParameters.Int_Bus));//
    Node_Elem.KommParameters.Int_Bus:=single_;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KommParameters.Cost));//
    Node_Elem.KommParameters.Cost:=j;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KommParameters.Eth_Type:=ss;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KommParameters.F_Eth_Type:=ss;

    for j:=1 to 5 do
     for z:=1 to 5 do
      begin
       LoadStream.Read(r, sizeof(TOrLAN(Nodes[i]).Komm_Time[j,z]));//
       Node_Elem.Komm_Time[j,z]:=r;
      end;

    LoadStream.Read(z,SizeOf(Node_Elem.Ports.Count));
    for j:=0 to z-1 do
     begin
      LoadStream.Read(P_Par.PortType,SizeOf(P_Par.PortType));
      LoadStream.Read(P_Par.IsUsed,SizeOf(P_Par.IsUsed));
      LoadStream.Read(P_Par.Speed,SizeOf(P_Par.Speed));
      LoadStream.Read(P_Par.ChannalType,SizeOf(P_Par.ChannalType));
      LoadStream.Read(P_Par.ID,SizeOf(P_Par.ID));
      LoadStream.Read(P_Par.ChannalLength,SizeOf(P_Par.ChannalLength));
      LoadStream.Read(P_Par.ChannalID,SizeOf(P_Par.ChannalID));
      LoadStream.Read(P_Par.SegmentID,SizeOf(P_Par.SegmentID));
      LoadStream.Read(P_Par.IsUsed2,SizeOf(P_Par.IsUsed2));
      LoadStream.Read(P_Par.ID2,SizeOf(P_Par.ID2));
      LoadStream.Read(P_Par.ChannalLength2,SizeOf(P_Par.ChannalLength2));

      New(Ports_);
      Ports_^.PortType:=P_Par.PortType;
      Ports_^.IsUsed:=P_Par.IsUsed;
      Ports_^.Speed:=P_Par.Speed;
      Ports_^.ChannalType:=P_Par.ChannalType;
      Ports_^.ID:=P_Par.ID;
      Ports_^.ChannalLength:=P_Par.ChannalLength;
      Ports_^.ChannalID:=P_Par.ChannalID;
      Ports_^.SegmentID:=P_Par.SegmentID;
      Ports_^.IsUsed2:=P_Par.IsUsed2;
      Ports_^.ID2:=P_Par.ID2;
      Ports_^.ChannalLength2:=P_Par.ChannalLength2;
      Node_Elem.Ports.Add(Ports_);
     end;
    Node_Elem.Top:=Node_Elem.Y;
    Node_Elem.Left:=Node_Elem.X;
    Node_Elem.Width := Round( 50 * Scale_ / 100 );
    Node_Elem.Height := Round( 50 * Scale_ / 100 );
    Nodes.Add(Node_Elem);
   end;

  if s=Header_v5 then
  begin
  for i:=1 to Number_of_APs do
   begin
    Node_Elem:=TOrLAN.Create(Self);
    Node_Elem.Parent:=MyPanel;

    Node_Elem.PopupMenu := PopupMenuNode;
    Node_Elem.OnContextPopup := Img_ContextPopup;
    Node_Elem.OnDblClick := Img_DblClick;
    Node_Elem.OnMouseDown:=Img_Mouse_Down;
    Node_Elem.OnMouseUp:=Img_Mouse_Up;
    Node_Elem.OnMouseMove:=Img_Mouse_Move;

    Node_Elem.NodeType:='AP';
    Node_Elem.Active:=False;
    Node_Elem.Tag:=0;

    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.NodeName:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.NodeID));//
    Node_Elem.NodeID:=j;
    LoadStream.Read(j, sizeof(Node_Elem.X));//
    Node_Elem.X:=j;
    LoadStream.Read(j, sizeof(Node_Elem.Y));//
    Node_Elem.Y:=j;
    LoadStream.Read(j, sizeof(Node_Elem.PortNumber));//
    Node_Elem.PortNumber:=j;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.AP_Parameters.Producer:=ss;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.AP_Parameters.Prod_Name:=ss;

    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).AP_Parameters.Eth_PortNumber));//
    Node_Elem.AP_Parameters.Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).AP_Parameters.F_Eth_PortNumber));//
    Node_Elem.AP_Parameters.F_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).AP_Parameters.G_Eth_PortNumber));//
    Node_Elem.AP_Parameters.G_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).AP_Parameters.E_F_Eth_PortNumber));//
    Node_Elem.AP_Parameters.E_F_Eth_PortNumber:=j;
    LoadStream.Read(bool, sizeof(Node_Elem.AP_Parameters.Duplex));//
    Node_Elem.AP_Parameters.Duplex:=bool;
    LoadStream.Read(single_, sizeof(TOrLAN(Nodes[i]).AP_Parameters.Int_Bus));//
    Node_Elem.AP_Parameters.Int_Bus:=single_;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).AP_Parameters.Cost));//
    Node_Elem.AP_Parameters.Cost:=j;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.AP_Parameters.Eth_Type:=ss;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.AP_Parameters.F_Eth_Type:=ss;

    for j:=1 to 5 do
     for z:=1 to 5 do
      begin
       LoadStream.Read(r, sizeof(TOrLAN(Nodes[i]).Komm_Time[j,z]));//
       Node_Elem.Komm_Time[j,z]:=r;
      end;

    LoadStream.Read(z,SizeOf(Node_Elem.Ports.Count));
    for j:=0 to z-1 do
     begin
      LoadStream.Read(P_Par.PortType,SizeOf(P_Par.PortType));
      LoadStream.Read(P_Par.IsUsed,SizeOf(P_Par.IsUsed));
      LoadStream.Read(P_Par.Speed,SizeOf(P_Par.Speed));
      LoadStream.Read(P_Par.ChannalType,SizeOf(P_Par.ChannalType));
      LoadStream.Read(P_Par.ID,SizeOf(P_Par.ID));
      LoadStream.Read(P_Par.ChannalLength,SizeOf(P_Par.ChannalLength));
      LoadStream.Read(P_Par.ChannalID,SizeOf(P_Par.ChannalID));
      LoadStream.Read(P_Par.SegmentID,SizeOf(P_Par.SegmentID));
      LoadStream.Read(P_Par.IsUsed2,SizeOf(P_Par.IsUsed2));
      LoadStream.Read(P_Par.ID2,SizeOf(P_Par.ID2));
      LoadStream.Read(P_Par.ChannalLength2,SizeOf(P_Par.ChannalLength2));

      New(Ports_);
      Ports_^.PortType:=P_Par.PortType;
      Ports_^.IsUsed:=P_Par.IsUsed;
      Ports_^.Speed:=P_Par.Speed;
      Ports_^.ChannalType:=P_Par.ChannalType;
      Ports_^.ID:=P_Par.ID;
      Ports_^.ChannalLength:=P_Par.ChannalLength;
      Ports_^.ChannalID:=P_Par.ChannalID;
      Ports_^.SegmentID:=P_Par.SegmentID;
      Ports_^.IsUsed2:=P_Par.IsUsed2;
      Ports_^.ID2:=P_Par.ID2;
      Ports_^.ChannalLength2:=P_Par.ChannalLength2;
      Node_Elem.Ports.Add(Ports_);
     end;
    Node_Elem.Top:=Node_Elem.Y;
    Node_Elem.Left:=Node_Elem.X;
    Node_Elem.Width := Round( 50 * Scale_ / 100 );
    Node_Elem.Height := Round( 50 * Scale_ / 100 );
    Nodes.Add(Node_Elem);
   end;
  end;
  
  for i:=1 to Number_of_Konc do
   begin
    Node_Elem:=TOrLAN.Create(Self);
    Node_Elem.Parent:=MyPanel;

    Node_Elem.PopupMenu := PopupMenuNode;
    Node_Elem.OnContextPopup := Img_ContextPopup;
    Node_Elem.OnDblClick := Img_DblClick;
    Node_Elem.OnMouseDown:=Img_Mouse_Down;
    Node_Elem.OnMouseUp:=Img_Mouse_Up;
    Node_Elem.OnMouseMove:=Img_Mouse_Move;

    Node_Elem.NodeType:='KONC';
    Node_Elem.Active:=False;
    Node_Elem.Tag:=0;

    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.NodeName:=ss;
    LoadStream.Read(j, sizeof(Node_Elem.NodeID));//
    Node_Elem.NodeID:=j;
    LoadStream.Read(j, sizeof(Node_Elem.X));//
    Node_Elem.X:=j;
    LoadStream.Read(j, sizeof(Node_Elem.Y));//
    Node_Elem.Y:=j;
    LoadStream.Read(j, sizeof(Node_Elem.PortNumber));//
    Node_Elem.PortNumber:=j;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KoncParameters.Producer:=ss;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KoncParameters.Prod_Name:=ss;

    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.Eth_PortNumber));//
    Node_Elem.KoncParameters.Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.F_Eth_PortNumber));//
    Node_Elem.KoncParameters.F_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.G_Eth_PortNumber));//
    Node_Elem.KoncParameters.G_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.ATM_PortNumber));//
    Node_Elem.KoncParameters.ATM_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.FDDI_PortNumber));//
    Node_Elem.KoncParameters.FDDI_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.E_F_Eth_PortNumber));//
    Node_Elem.KoncParameters.E_F_Eth_PortNumber:=j;
    LoadStream.Read(j, sizeof(TOrLAN(Nodes[i]).KoncParameters.Cost));//
    Node_Elem.KoncParameters.Cost:=j;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KoncParameters.Eth_Type:=ss;

    ss:='';
    LoadStream.Read(k, 1);//
    SetLength(ss,k);
    LoadStream.Read(ss[1], k);//
    Node_Elem.KoncParameters.F_Eth_Type:=ss;

    LoadStream.Read(z,SizeOf(Node_Elem.Ports.Count));
    for j:=0 to z-1 do
     begin
      LoadStream.Read(P_Par.PortType,SizeOf(P_Par.PortType));
      LoadStream.Read(P_Par.IsUsed,SizeOf(P_Par.IsUsed));
      LoadStream.Read(P_Par.Speed,SizeOf(P_Par.Speed));
      LoadStream.Read(P_Par.ChannalType,SizeOf(P_Par.ChannalType));
      LoadStream.Read(P_Par.ID,SizeOf(P_Par.ID));
      LoadStream.Read(P_Par.ChannalLength,SizeOf(P_Par.ChannalLength));
      LoadStream.Read(P_Par.ChannalID,SizeOf(P_Par.ChannalID));
      LoadStream.Read(P_Par.SegmentID,SizeOf(P_Par.SegmentID));
      LoadStream.Read(P_Par.IsUsed2,SizeOf(P_Par.IsUsed2));
      LoadStream.Read(P_Par.ID2,SizeOf(P_Par.ID2));
      LoadStream.Read(P_Par.ChannalLength2,SizeOf(P_Par.ChannalLength2));

      New(Ports_);
      Ports_^.PortType:=P_Par.PortType;
      Ports_^.IsUsed:=P_Par.IsUsed;
      Ports_^.Speed:=P_Par.Speed;
      Ports_^.ChannalType:=P_Par.ChannalType;
      Ports_^.ID:=P_Par.ID;
      Ports_^.ChannalLength:=P_Par.ChannalLength;
      Ports_^.ChannalID:=P_Par.ChannalID;
      Ports_^.SegmentID:=P_Par.SegmentID;
      Ports_^.IsUsed2:=P_Par.IsUsed2;
      Ports_^.ID2:=P_Par.ID2;
      Ports_^.ChannalLength2:=P_Par.ChannalLength2;
      Node_Elem.Ports.Add(Ports_);
     end;
    Node_Elem.Top:=Node_Elem.Y;
    Node_Elem.Left:=Node_Elem.X;
    Node_Elem.Width := Round( 50 * Scale_ / 100 );
    Node_Elem.Height := Round( 50 * Scale_ / 100 );
    Nodes.Add(Node_Elem);
   end;


  LoadStream.Free;
  StatusBar1.Panels[4].Text:='';
  Project_Modified:=False;
 except
   on E:Exception do
   begin
     if LoadStream<>nil then LoadStream.Free;
     Application.MessageBox( PChar('Ошибка чтения файла проекта. ' +#13+#10+ E.Message),
     						 'OrLAN',
     						 MB_OK+MB_IconError);
//     MessageDlg('Ошибка чтения файла проекта. ' + E.Message, mtError, [mbOk], 0);
     StatusBar1.Panels[4].Text:='';
   end;
 end;

 for i:=0 to Nodes.Count-1 do
 begin
   TOrLAN(Nodes[i]).Active:=False;
   TOrLAN(Nodes[i]).Picture.Bitmap.LoadFromResourceName(hInstance,TOrLAN(Nodes[i]).NodeType);

//   TOrLAN(Nodes[i]).ShowHint:=True;
//   TOrLAN(Nodes[i]).Hint:=TOrLAN(Nodes[i]).NodeName+ // Hint:= имя WS
//    #10+#13+'ID = '+IntTOStr(TOrLAN(Nodes[i]).NodeID);
 end;
 NeedRepaint:=True;


 	//_ ***************************************************************
	//_ Convertion routine
	//_ ***************************************************************
    //______________________// dbHOSTzone /____________________________
    if ( s=Header_ ) then
    	begin
		for i:=0 to Nodes.Count-1 do
			if TOrLAN(Nodes[i]).NodeType='WS' then
            	begin
		        for j:=0 to TOrLAN(Nodes[i]).WSParameters.RequestClass.Count-1 do
		        	begin
	    			Model_Elem_v1:=TOrLAN(Nodes[i]).WSParameters.RequestClass[j];
		            new(Model_Elem);

		            Model_Elem^.ServID_:=FormConnect.NameToID(Model_Elem_v1.Serv_);
	                Model_Elem^.Size_:=Model_Elem_v1.Size_;
	                Model_Elem^.AnsSize_:=Model_Elem_v1.AnsSize_;
	                Model_Elem^.TimeWS:=Model_Elem_v1.TimeWS;
	                Model_Elem^.TimeServ:=Model_Elem_v1.TimeServ;
	                Model_Elem^.TimeCycle:=Model_Elem_v1.TimeCycle;
	                Model_Elem^.Priority:=Model_Elem_v1.Priority;
	                Model_Elem^.PossibleTime:=Model_Elem_v1.PossibleTime;
	                Model_Elem^.PossiblePercent:=Model_Elem_v1.PossiblePercent;
					Model_Elem^.DistOfServerDelay:=Model_Elem_v1.DistOfServerDelay;
					Model_Elem^.HopDelay2:=Model_Elem_v1.HopDelay2;


					TOrLAN(Nodes[i]).WSParameters.RequestClass[j]:=nil;
	                TOrLAN(Nodes[i]).WSParameters.RequestClass.Add(Model_Elem);
		            end;
				TOrLAN(Nodes[i]).WSParameters.RequestClass.Pack;
	        	end;
		end;
    //______________________/ dbHOSTzone //____________________________

    NotSavedYet:=False;
end;

procedure TMainForm.N_ResultsClick(Sender: TObject);
var i:integer;
begin

 for i:=0 to nodes.Count-1 do
  if (TOrLAN(Nodes[i]).NodeType='KONC') and
     (TOrLAN(Nodes[i]).Active=True) then
     begin
        Cur_MC := TOrLAN(Nodes[i]).Tag;
        TOrLAN(Nodes[i]).Active := False;
        Break;
     end;

 ModResForm.ShowModal;
end;

procedure TMainForm.DeletePrevFiles();
var i: integer;
begin
    try
    //удалить старые входные файлы и файлы результатов
      DeleteFile(Project_Path + Project_Name + '.sci');
      DeleteFile(Project_Path + Project_Name + '.sco');
      DeleteFile(Project_Path + Project_Name + '.imo');

      for i:=0 to StrToInt(FormPack.ComboBoxStepsNumber.Items[FormPack.ComboBoxStepsNumber.Items.Count-1]) do
      begin
        DeleteFile(Project_Path + Project_Name + '_' + IntToStr(i) + '.sci');
        DeleteFile(Project_Path + Project_Name + '_' + IntToStr(i) + '.sco');
        DeleteFile(Project_Path + Project_Name + '_' + IntToStr(i) + '.imo');
      end;
    except
    end;
end;


procedure TMainForm.N_RunModelClick(Sender: TObject);
var sLine : string;
    i, j : integer;
begin
  if Nodes.Count <=1 then
     exit;

  if NotSavedYet then
  	if Application.MessageBox ('Перед началом моделирования новый проект необходимо сохранить'+#10+#13+'Сохранить?',
    							'OrLAN', MB_OKCANCEL+MB_IconQuestion)=IDOK then
  		begin
    	SpeedButtonSaveClick(Sender);
        if NotSavedYet then exit;
        end
    else
    	exit;


  //_ 2 be awaken
  Application.ProcessMessages;

  //_ nothing
  WasScat := False;
  WasImit := False;

  try

  // удаляет оборванные связи
  FormWS.RemoveBrokenConns();

  //_ пронумеруем все сегменты сети     !!
  ScatForm.MakeAllSegChanID();

  j:=0; //общее кол-во классов заявок
  for i:=0 to Nodes.Count-1 do
    if TOrLAN(Nodes[i]).NodeType='WS' then
      j:=j + TOrLAN(Nodes[i]).WSParameters.RequestClass.Count;


  //_ для НЕпакетного моделирования шаг = 1
  Steps := 1;
  SetLength( JobsPerStep, 1 );
  JobsPerStep[0] := j;

  //_ настройка панели инструментов
  BeginViewMode;

  //_ настройка и обнуление таблиц
  //_ для результатов АиИ моделирования
  ScatForm.ResizeResultGrids();

  //_ удаление файлов предыдущего моделирования
  DeletePrevFiles;


  if Setup_.UseScat then
  begin
    ScatForm.RunScat( 0 );
    WasScat := True;
  end;

  Application.ProcessMessages;

  if Setup_.UseImit then
  begin
    RunImit( 0 );		//!!
    WasImit := not FormWait.Cancelled;
  end;

  if ((WasImit = True) or (WasScat = True)) then
  begin
     if ((WasImit = True) and (WasScat = True)) then
       sLine := 'Аналитическое и имитационное моделирование выполнено.'
     else
     begin
        if (WasImit = True) then
          sLine := 'Имитационное моделирование выполнено.'
        else
          sLine := 'Аналитическое моделирование выполнено.';
     end;

     sLine := sLine + #13 + #10 + #13 + #10 + 'Используйте двойной щелчок мыши или контекстное меню для просмотра результатов по конкретному узлу или каналу передачи.';
//   MessageDlg( sLine, mtInformation, [mbOk], 0)
     Application.MessageBox( PChar(SLine), 'OrLAN', MB_OK+MB_IconInformation);

  end;

  except
    on E:Exception do
//      MessageDlg('Выполнение задачи прервано. ' + E.Message, mtError, [mbOk], 0);
	  Application.MessageBox( PChar('Выполнение задачи прервано. ' +#10+#13+ E.Message),
     						 'OrLAN',
     						 MB_OK+MB_IconError);

  end;

  FormWait.Hide;
  DeletePrevFiles();
end;

procedure TMainForm.N_ConnsClick(Sender: TObject);
var i:integer;
begin
  for i:=0 To Nodes.Count-1 do
    if TOrLAN(Nodes[i]).Active=True then
    begin
      Con_Num := i;
      Con_Num2 := -1;

      FormConnect.bNewConn := False;
      FormConnect.ShowModal;
      break;
    end;
end;

procedure TMainForm.SpeedButtonRunModelClick(Sender: TObject);
begin
  SpeedButtonRunModel.Down := False;

  N_RunModelClick(nil);
end;

procedure TMainForm.SpeedButtonCloseViewClick(Sender: TObject);
begin
  SpeedButtonCloseView.Down := False;

  EndViewMode;
end;

procedure TMainForm.SpeedButtonPrintClick(Sender: TObject);
var
  NewRect : TRect;
  AspectRatio: Single;
  OutputWidth, OutputHeight: Single;
begin
 SpeedButtonPrint.Down := False;

 if Nodes.Count = 0 then
 begin
//   MessageDlg('В проекте нет ни одного элемента.'+#10+#13+
//   'Распечатывать картинку не имеет смысла.',
//   mtInformation,[mbOk], 0);
	Application.MessageBox( 'В проекте нет ни одного элемента.',
     						'OrLAN',
     						 MB_OK+MB_IconInformation);

   exit;
 end;

 if not PrintDialog1.Execute then Exit;

 Printer.BeginDoc;
 try
    OutputHeight:=MyPanel.Height;
    OutputWidth:=MyPanel.Width;
    AspectRatio := OutputWidth / OutputHeight;

    if (OutputWidth < Printer.PageWidth) and
      (OutputHeight < Printer.PageHeight) then
    begin
      if OutputWidth < OutputHeight then
      begin
        OutputHeight := Printer.PageHeight;
        OutputWidth := OutputHeight * AspectRatio;
      end
      else
      begin
        OutputWidth := Printer.PageWidth;
        OutputHeight := OutputWidth / AspectRatio;
      end
    end;

    if OutputWidth > Printer.PageWidth then
    begin
      OutputWidth := Printer.PageWidth;
      OutputHeight := OutputWidth / AspectRatio;
    end;

    if OutputHeight > Printer.PageHeight then
    begin
      OutputHeight := Printer.PageHeight;
      OutputWidth := OutputHeight * AspectRatio;
    end;

   NewRect := Rect(0,0,Printer.PageWidth, Printer.PageHeight);
   Printer.Canvas.Brush.Color:=clWhite;
   Printer.Canvas.FillRect(NewRect);

   DrawConnectors( Printer.Canvas, OutputWidth / MyPanel.Width );

 finally
   Printer.EndDoc;
 end;

end;

procedure TMainForm.FormShow(Sender: TObject);
begin
	Project_Modified:=False;

	if (MainForm.Caption='OrLAN') then //если запущена программа
		if (Setup_.OpenLastProjectOnEnter_=True) and (Setup_.LastProject_<>'') then
        	OpenFileByName(Setup_.LastProject_)
		else
			SpeedButtonNewClick(nil);
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_DELETE) and (ViewModellingResuls = False) then
      N_DeleteClick(nil);
end;

procedure TMainForm.Panel1DblClick(Sender: TObject);
begin
 if (ViewModellingResuls = False) then
 begin
   if (Con_Num <> -1) and (Con_Num2 <> -1) then
      N_MCParamsClick(nil);
 end
 else
 begin
   if (Cur_MC <> 0) then
      N_ResultsClick(nil);
 end;
end;

procedure TMainForm.Panel1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
 if (ViewModellingResuls = True) and (Cur_MC = 0) then
 begin
    Handled := True;
    exit;
 end;

 if (ViewModellingResuls = False) then
   if (Con_Num = -1) or (Con_Num2 = -1) then
   begin
      N_MCParams.Visible := False;
      N_Panel_Sep1.Visible := False;
   end
   else
   begin
      N_MCParams.Visible := True;
      N_Panel_Sep1.Visible := True;
   end;

end;

procedure TMainForm.N_MCParamsClick(Sender: TObject);
begin
   FormConnect.bNewConn := False;
   FormConnect.ShowModal;
end;

procedure TMainForm.N_JobGenClick(Sender: TObject);
begin
  SpeedButtonJobGenClick(nil);
end;

procedure TMainForm.N_NodeJobsClick(Sender: TObject);
begin
  FormJobs.ShowModal;
end;

procedure TMainForm.N_ReportClick(Sender: TObject);
begin
  SpeedButtonReportClick(nil);
end;

procedure TMainForm.N_PicClick(Sender: TObject);
begin
  SpeedButtonMakePicClick(nil);
end;

procedure TMainForm.SpeedButtonJobGenClick(Sender: TObject);
begin
  SpeedButtonJobGen.Down := False;
  FormJobs.WSName := '';
  FormJobs.ShowModal;
end;

procedure TMainForm.N_PrintClick(Sender: TObject);
begin
  SpeedButtonPrintClick(nil);
end;

procedure TMainForm.N_RunModelPackClick(Sender: TObject);
var i : Integer;
    sLine : string;
begin
  if Nodes.Count <=1 then
     exit;

  if FormPack.ShowModal = mrOk then
  begin
    BeginViewMode;
    Application.ProcessMessages;

    WasScat := False;
    WasImit := False;

    try

    FormWS.RemoveBrokenConns();
    ScatForm.MakeAllSegChanID();

    ScatForm.ResizeResultGrids();

    DeletePrevFiles();

    for i:=0 to Steps-1 do
    begin
      FormPack.CopyJobsToNodes( i );
      ScatForm.RunScat( i );
      Application.ProcessMessages;
    end;

    WasScat := True;

    for i:=0 to Steps-1 do
    begin
//      FormPack.Visible := True;
      FormPack.CopyJobsToNodes( i );
      RunImit( i );
      Application.ProcessMessages;
      if FormWait.Cancelled = True then
         break;
    end;

    WasImit := not FormWait.Cancelled;

    if ((WasImit = True) or (WasScat = True)) then
    begin
      if ((WasImit = True) and (WasScat = True)) then
       sLine := 'Аналитическое и имитационное моделирование выполнено'
      else
      begin
        if (WasImit = True) then
          sLine := 'Имитационное моделирование выполнено'
        else
          sLine := 'Аналитическое моделирование выполнено';
      end;

      sLine := sLine + ' для ' + IntToStr(Steps) + ' вариантов загрузки. ';
      sLine := sLine + #13 + #10 + #13 + #10 + 'Используйте двойной щелчок мыши или контекстное меню для просмотра результатов по конкретному узлу или каналу передачи.';
	  Application.MessageBox( PChar(sLine), 'OrLAN', MB_OK+MB_IconInformation);
      //MessageDlg( sLine, mtInformation, [mbOk], 0)
    end;

    except
      on E:Exception do
		Application.MessageBox( PChar('Выполнение задачи прервано. ' +#13+#10+ E.Message),
        						'OrLAN',
                                MB_OK+MB_IconError);
//      MessageDlg('Выполнение задачи прервано. ' + E.Message, mtError, [mbOk], 0);
    end;

    //восстановить первоначальную конфигурацию
    FormPack.CopyJobsToNodes( Steps );
    FormWait.Hide;
  end;
end;

procedure TMainForm.SpeedButtonRunModelPackClick(Sender: TObject);
begin
  SpeedButtonRunModelPack.Down := False;
  N_RunModelPackClick(nil);
end;

procedure TMainForm.BeginViewMode();
var i : integer;
begin
  SpeedButtonNew.Enabled := False;
  SpeedButtonOpen.Enabled := False;
  SpeedButtonSave.Enabled := False;
  SpeedButtonRunModel.Enabled := False;
  SpeedButtonRunModelPack.Enabled := False;
  SpeedButtonExpress.Enabled := False;
  SpeedButtonJobGen.Enabled := False;

  N_TopProject.Visible := False;
  N_TopProject.Enabled := False;

  N_TopUtils.Visible := False;
  N_TopUtils.Enabled := False;

  N_TopCalc.Visible := False;
  N_TopCalc.Enabled := False;

  N_TopProps.Visible := False;
  N_TopProps.Enabled := False;

  SpeedButtonCloseView.Visible := True;
  ToolButtonSep4.Visible := True;

  N_Params.Visible := False;
  N_Conns.Visible := False;
  N_NodeJobs.Visible := False;
  N_Sep1.Visible := False;
  N_Connect.Visible := False;
  N_Delete.Visible := False;
  N_AddWS.Visible := False;
  N_AddServ.Visible := False;
  N_AddKomm.Visible := False;
  N_AddKonc.Visible := False;

  N_MCParams.Visible := False;
  N_Panel_Sep1.Visible := False;

  N_Results2.Visible := True;
  N_Results.Visible := True;

  MainForm.Caption:='OrLAN - ' + Project_name + ' - результаты моделирования';
  ModResForm.TabControl1.TabIndex:=0;

  ModResForm.ComboBoxSteps.Items.Clear;
  for i:=1 to Steps do
    ModResForm.ComboBoxSteps.Items.Add(IntToStr(i));

  ModResForm.ComboBoxSteps.ItemIndex := 0;

  ModResForm.CheckBoxShowSum.Checked := False;

  ViewModellingResuls := True;
end;

procedure TMainForm.EndViewMode();
begin
  SpeedButtonNew.Enabled := True;
  SpeedButtonOpen.Enabled := True;
  SpeedButtonSave.Enabled := True;
  SpeedButtonRunModel.Enabled := True;
  SpeedButtonRunModelPack.Enabled := True;
  SpeedButtonExpress.Enabled := True;
  SpeedButtonJobGen.Enabled := True;

  N_TopProject.Visible := True;
  N_TopProject.Enabled := True;

  N_TopUtils.Visible := True;
  N_TopUtils.Enabled := True;

  N_TopCalc.Visible := True;
  N_TopCalc.Enabled := True;

  N_TopProps.Visible := True;
  N_TopProps.Enabled := True;

  SpeedButtonCloseView.Visible := False;
  ToolButtonSep4.Visible := False;

  N_Params.Visible := True;
  N_Conns.Visible := True;
  N_NodeJobs.Visible := True;
  N_Sep1.Visible := True;
  N_Connect.Visible := True;
  N_Delete.Visible := True;
  N_AddWS.Visible := True;
  N_AddServ.Visible := True;
  N_AddKomm.Visible := True;
  N_AddKonc.Visible := True;

  N_Results2.Visible := False;
  N_Results.Visible := False;
  MainForm.Caption:='OrLAN - ' + Project_name;

  ViewModellingResuls := False;
end;

procedure TMainForm.N_AddAPClick(Sender: TObject);
begin
 Project_Modified:=True;

 inc(Number_of_APs); // увеличить кол-во
 inc(MaxAPs);
 StatusBar1.Panels[4].Text:='Точек доступа - ' + IntToStr(Number_of_APs);

 Node_Elem:=CreateNewNode( 'AP', 'AP#'+IntToStr(MaxAPs), Mouse_X, Mouse_Y );

 Node_Elem.AP_Parameters.Producer:='';
 //Node_Elem.AP_Parameters.Prod_Name:='';
 Node_Elem.AP_Parameters.Eth_PortNumber:=0;
 Node_Elem.AP_Parameters.F_Eth_PortNumber:=0;
 Node_Elem.AP_Parameters.G_Eth_PortNumber:=0;
 Node_Elem.AP_Parameters.Duplex:=False;
 Node_Elem.AP_Parameters.Int_Bus:=0;
 Node_Elem.AP_Parameters.Cost:=0;
 Node_Elem.AP_Parameters.Wifi_PortNumber:=0;

 Nodes.Add(Node_Elem);

 Form1.bNewNode := True;
 Form1.Showmodal; // форма параметров AP

end;

end.
