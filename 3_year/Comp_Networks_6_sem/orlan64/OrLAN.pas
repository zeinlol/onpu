unit OrLAN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

// ����� "������� �������"
//////////////////////////////////////
type
  TWSParameters = class (TPersistent)
  private
    fSoft: string;  // ��
    fCost: integer; // ���������
    fProcessor: string; // ���������
    fRAM: integer;  // ���
    fHDD: integer;  // ����. ����������
    fIntNIC: boolean;   // ���� ������� ��
    fRequestClass: TList; // ������ ������� ������ ������������ WS
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property Soft: string read fSoft write fSoft;
    property Cost: integer read fCost write fCost default 0;
    property Processor: string read fProcessor write fProcessor;
    property RAM: integer read fRAM write fRAM default 64;
    property HDD: integer read fHDD write fHDD default 3200;
    property IntNIC: boolean read fIntNIC write fIntNIC default True;
    property RequestClass: TList read fRequestClass write fRequestClass;
  end;


// ����� "������"
//////////////////////////////////////
type
  TServParameters = class (TPersistent)
  private
    fSoft: string; // ��
    fCost: integer;
    fNumberProc: byte; // ���-�� �����������
    fProcessor: string; // ���������
    fRAM: integer; // ���
    fHDD: integer; // ����. ����������
    fOSType: string; // ��� OC
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property Soft: string read fSoft write fSoft;
    property Cost: integer read fCost write fCost;
    property NumberProc: byte read fNumberProc write fNumberProc;
    property Processor: string read fProcessor write fProcessor;
    property RAM: integer read fRAM write fRAM;
    property HDD: integer read fHDD write fHDD;
    property OSType:string read fOSType write fOSType;
  end;


// ����� "����������"
//////////////////////////////////////
type
  TKommParameters = class (TPersistent)
  private
    fProducer: string; // �������������
    fProd_Name: string; // ��������� ��������
    fEth_PortNumber:integer; // ���-�� ������ Ethernet
    fF_Eth_PortNumber:integer; // ���-�� ������ Fast Ethernet
    fG_Eth_PortNumber:integer; // ���-�� ������ Gigabit Ethernet
    fATM_PortNumber:integer; // ���-�� ������ ATM
    fFDDI_PortNumber:Integer; // FDDI
    fE_F_Eth_PortNumber:integer; // ���-�� ������ 10/100
    fDuplex:Boolean; // Duplex | Half-Duplex
    fInt_Bus:Single; // �������� ����
    fCost:Integer; // ���������
    fEth_Type: string; // 10BaseT ��� 10BaseFX
    fF_Eth_Type: string; // 100BaseTX ��� 100BaseFX
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property Producer: string read fProducer write fProducer;
    property Prod_Name: string read fProd_Name write fProd_Name;
    property Eth_PortNumber: integer read fEth_PortNumber write fEth_PortNumber;
    property F_Eth_PortNumber: integer read fF_Eth_PortNumber write fF_Eth_PortNumber;
    property G_Eth_PortNumber: integer read fG_Eth_PortNumber write fG_Eth_PortNumber;
    property ATM_PortNumber: integer read fATM_PortNumber write fATM_PortNumber;
    property FDDI_PortNumber: Integer read fFDDI_PortNumber write fFDDI_PortNumber;
    property E_F_Eth_PortNumber: integer read fE_F_Eth_PortNumber write fE_F_Eth_PortNumber;
    property Duplex: Boolean read fDuplex write fDuplex;
    property Int_Bus: Single read fInt_Bus write fInt_Bus;
    property Cost: Integer read fCost write fCost;
    property Eth_Type: string read fEth_Type write fEth_Type;
    property F_Eth_Type: string read fF_Eth_Type write fF_Eth_Type;
  end;


// ����� "����� �������"
//////////////////////////////////////
type
  TAP_Parameters = class (TPersistent)
  private
    fProducer: string; // �������������
    fProd_Name: string; // ��������� ��������
    fEth_PortNumber:integer; // ���-�� ������ Ethernet
    fF_Eth_PortNumber:integer; // ���-�� ������ Fast Ethernet
    fG_Eth_PortNumber:integer; // ���-�� ������ Gigabit Ethernet
    fE_F_Eth_PortNumber:integer; // ���-�� ������ 10/100
    fWifi_PortNumber:integer; // ���-�� ������������ �������������
    fDuplex:Boolean; // Duplex | Half-Duplex
    fInt_Bus:Single; // �������� ����
    fCost:Integer; // ���������
    fEth_Type: string; // 10BaseT ��� 10BaseFX
    fF_Eth_Type: string; // 100BaseTX ��� 100BaseFX
    fWifi_Type: string; // 802.11
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property Producer: string read fProducer write fProducer;
    property Prod_Name: string read fProd_Name write fProd_Name;
    property Eth_PortNumber: integer read fEth_PortNumber write fEth_PortNumber;
    property F_Eth_PortNumber: integer read fF_Eth_PortNumber write fF_Eth_PortNumber;
    property G_Eth_PortNumber: integer read fG_Eth_PortNumber write fG_Eth_PortNumber;
    property E_F_Eth_PortNumber: integer read fE_F_Eth_PortNumber write fE_F_Eth_PortNumber;
    property Wifi_PortNumber: integer read fWifi_PortNumber write fWifi_PortNumber;
    property Duplex: Boolean read fDuplex write fDuplex;
    property Int_Bus: Single read fInt_Bus write fInt_Bus;
    property Cost: Integer read fCost write fCost;
    property Eth_Type: string read fEth_Type write fEth_Type;
    property F_Eth_Type: string read fF_Eth_Type write fF_Eth_Type;
    property Wifi_Type: string read fWifi_Type write fWifi_Type;
  end;

// ����� "������������"
//////////////////////////////////////
type
  TKoncParameters = class (TPersistent)
  private
    fProducer: string; // �������������
    fProd_Name: string; // ��������� ��������
    fEth_PortNumber:integer; // ���-�� ������ Ethernet
    fF_Eth_PortNumber:integer; // ���-�� ������ Fast Ethernet
    fG_Eth_PortNumber:integer; // ���-�� ������ Gigabit Ethernet
    fATM_PortNumber:integer; // ���-�� ������ ATM
    fFDDI_PortNumber:Integer; // FDDI
    fE_F_Eth_PortNumber:integer; // ���-�� ������ 10/100
    fCost:Integer; // ���������
    fEth_Type: string; // 10BaseT ��� 10BaseFX
    fF_Eth_Type: string; // 100BaseTX ��� 100BaseFX
  protected
    { Protected declarations }
  public
    { Public declarations }
  published
    { Published declarations }
    property Producer: string read fProducer write fProducer;
    property Prod_Name: string read fProd_Name write fProd_Name;
    property Eth_PortNumber: integer read fEth_PortNumber write fEth_PortNumber;
    property F_Eth_PortNumber: integer read fF_Eth_PortNumber write fF_Eth_PortNumber;
    property E_F_Eth_PortNumber: integer read fE_F_Eth_PortNumber write fE_F_Eth_PortNumber;
    property G_Eth_PortNumber: integer read fG_Eth_PortNumber write fG_Eth_PortNumber;
    property ATM_PortNumber: integer read fATM_PortNumber write fATM_PortNumber;
    property FDDI_PortNumber: Integer read fFDDI_PortNumber write fFDDI_PortNumber;
    property Cost: Integer read fCost write fCost;
    property Eth_Type: string read fEth_Type write fEth_Type;
    property F_Eth_Type: string read fF_Eth_Type write fF_Eth_Type;
  end;


// ����� "����"
// ��������� ������ TImage
//////////////////////////////////////
type
  TOrLAN = class(TImage)
  private
    { Private declarations }
    fWSParameters:TWSParameters;
    fServParameters:TServParameters;
    fKommParameters:TKommParameters;
    fAP_Parameters:TAP_Parameters;
    fKoncParameters:TKoncParameters;
    fNodeType: string;
    fNodeName: string;
    fNodeID: integer;
    fX,fY: integer; // ��������� �� ������
    fActive: boolean;
    fConnections: TList;
    fPorts: TList;
    fPortNumber: Integer;
    fKomm_Time: array [1..5,1..5] of real;

    procedure SetActive(Value: Boolean);
    function GetArrayData(Index1,Index2: integer): real;
    procedure SetArrayData(Index1,Index2: integer; NewData:real);
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    property Komm_Time[Index1,Index2: integer]: real
             read GetArrayData write SetArrayData;
  published
    { Published declarations }
    property WSParameters:TWSParameters read fWSParameters
             write fWSParameters;
    property ServParameters:TServParameters read fServParameters
             write fServParameters;
    property KommParameters:TKommParameters read fKommParameters
             write fKommParameters;
    property AP_Parameters:TAP_Parameters read fAP_Parameters
             write fAP_Parameters;
    property KoncParameters:TKoncParameters read fKoncParameters
             write fKoncParameters;
    property NodeType: string read fNodeType write fNodeType;
    property NodeName: string read fNodeName write fNodeName;
    property NodeID: integer read fNodeID write fNodeID;
    property X: integer read fX write fX default 0;
    property Y: integer read fY write fY default 0;
    property Active: boolean read fActive write SetActive;
    property Ports: Tlist read fPorts write fPorts;
    property PortNumber: integer read fPortnumber write fPortnumber default 1;
  end;

procedure Register;

implementation

{$R OrLAN.res}

procedure Register;
begin
 RegisterComponents('Samples', [TOrLAN]);
end;

procedure TOrLAN.SetActive(Value: Boolean);
begin
 if Value<>fActive then
  begin
   fActive:=Value;
   Update;

   if fActive=True then
     Picture.Bitmap.LoadFromResourceName(hInstance,NodeType+'_A')
   else
     Picture.Bitmap.LoadFromResourceName(hInstance,NodeType);
  end;
end;

constructor TOrLAN.Create(AOwner : TComponent);
begin
 inherited Create(AOwner);
 Self.fConnections:=Tlist.Create;
 Self.fPorts:=Tlist.Create;
 WSParameters:=TWSParameters.Create;
 WSParameters.RequestClass:=TList.Create;
 ServParameters:=TServParameters.Create;
 KommParameters:=TKommParameters.Create;
 AP_Parameters:=TAP_Parameters.Create;
 KoncParameters:=TKoncParameters.Create;
 Width:=50;
 Height:=50;
 Stretch:=True;

 NodeType:='WS';
 Picture.Bitmap.LoadFromResourceName(hInstance,NodeType+'_A');
 Tag:=1;
end;

destructor TOrLAN.Destroy;
begin
 WSParameters.RequestClass.Free;
 WSParameters.Free;
 Ports.Free;
 inherited Destroy;
end;

function TOrLAN.GetArrayData(Index1,Index2:integer):real;
begin
 Result:=fKomm_Time[Index1,Index2];
end;

procedure TOrLAN.SetArrayData(Index1,Index2:integer; NewData: real);
begin
 if NewData <> Komm_Time[Index1,Index2] then
  begin
   fKomm_Time[Index1,Index2]:=NewData;
   Update;
  end;
end;

end.
