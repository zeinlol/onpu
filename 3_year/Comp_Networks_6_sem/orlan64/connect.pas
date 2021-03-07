// ********************************************************************
//  connect.pas
//
//  Установка соединения
//  Процедуры проебразования
//  ID <-> Name //имя узла c индексом ID
//  ID -> Num	//индекс узла c индексом ID в массиве Nodes
//  ID -> Node  //узел c индексом ID
// ********************************************************************

unit connect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, orlan;

type
  TFormConnect = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    ComboBoxChan: TComboBox;
    ComboBoxSpeed: TComboBox;
    Label4: TLabel;
    EditLength: TEdit;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    ComboBoxDest: TComboBox;
    Label6: TLabel;
    Bevel1: TBevel;
    ComboBoxNIC: TComboBox;
    Label1: TLabel;
    EditSource: TEdit;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ComboBoxDestChange(Sender: TObject);
    procedure ComboBoxNICChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bNewConn : Boolean;
    function NameToID(s:string):integer;
    function IDToName(ID:integer):string;
    function IDToNum(ID:integer):integer;
    function IDToNode(ID:integer):TOrlan;
  end;

var
  FormConnect: TFormConnect;

implementation

uses main, switch;

{$R *.DFM}

procedure TFormConnect.FormCreate(Sender: TObject);
begin
end;

//Кнопка Примнить
procedure TFormConnect.BitBtn1Click(Sender: TObject);
var i,j,k:integer;
    El : TOrlan;
    El2 : TOrlan;
    PortEl : Port_Element;
    PortEl2 : Port_Element;
label
    Work_done;
begin

 El := TOrLAN(Nodes[Con_Num]);
 El2 := TOrLAN(Nodes[0]);

 if (ComboBoxDest.ItemIndex <> -1) and
    (ComboBoxNIC.ItemIndex <> -1) and
    (ComboBoxChan.ItemIndex <> -1) then
 begin
     if bNewConn = True then
     begin
       El2 := TOrLAN(Nodes[Con_Num2]);
     end
     else
       for k:=0 to Nodes.Count - 1 do
       begin
          El2 := TOrlan(Nodes[k]);
          if El2.NodeName = ComboBoxDest.Items[ ComboBoxDest.ItemIndex ] then
             break;
       end;

     for i:=0 to El.Ports.Count-1 do
     begin
       PortEl := Port_Element(El.Ports[i]);
       if (PortEl.IsUsed = not bNewConn) and (PortEl.PortType = ComboBoxNIC.Items[ ComboBoxNIC.ItemIndex ]) then
       begin
          for j:=0 to El2.Ports.Count-1 do
          begin
            PortEl2 := Port_Element(El2.Ports[j]);
            if (PortEl2.IsUsed = not bNewConn) and (PortEl2.PortType = PortEl.PortType) and
               ((bNewConn = True) or ((PortEl.ID = El2.NodeID) and (PortEl2.ID = El.NodeID))) then
            begin
               PortEl.IsUsed := True;
               PortEl.ID := El2.NodeID;
               PortEl.ChannalType := ComboBoxChan.Items[ ComboBoxChan.ItemIndex ];
               PortEl.Speed := StrToIntDef(ComboBoxSpeed.Text, 10);
               PortEl.ChannalLength := StrToIntDef(EditLength.Text, 1);

               PortEl2.IsUsed := True;
               PortEl2.ID := El.NodeID;
               PortEl2.ChannalType := PortEl.ChannalType;
               PortEl2.Speed := PortEl.Speed;
               PortEl2.ChannalLength := PortEl.ChannalLength;
               goto Work_done;
            end;
          end;
       end;
     end;
 end;

 Work_done:

 Project_Modified := True;
 NeedRepaint := True;
 ModalResult := 1;
end;

procedure TFormConnect.BitBtn2Click(Sender: TObject);
begin
 ModalResult := 1;
end;

procedure TFormConnect.FormShow(Sender: TObject);
var i,j:integer;
    El : TOrlan;
    El2 : TOrlan;
    PortEl : Port_Element;
begin
 BitBtn3.Enabled := not bNewConn;

 ComboBoxDest.Enabled := True;

 El := TOrLAN(Nodes[Con_Num]);

 EditSource.Text := El.NodeName;
 ComboBoxDest.Items.Clear;

 if Con_Num2 <> -1 then
 begin
    El2 := TOrLAN(Nodes[Con_Num2]);
    ComboBoxDest.Items.Add(El2.NodeName);
//    ComboBoxDest.Enabled := False;
 end
 else
   for i:=0 to El.Ports.Count-1 do
   begin
     PortEl := Port_Element(El.Ports[i]);
     if PortEl.IsUsed = True then
       for j:=0 to Nodes.Count-1 do
       begin
         El2 := TOrlan(Nodes[j]);
         if (PortEl.ID = El2.NodeID) then
            ComboBoxDest.Items.Add(El2.NodeName);
       end;
   end;

 ComboBoxDest.ItemIndex := 0;
 ComboBoxDestChange(nil);
end;

//Кнопка Удалить
procedure TFormConnect.BitBtn3Click(Sender: TObject);
var i,j,k:integer;
    El : TOrlan;
    El2 : TOrlan;
    PortEl : Port_Element;
    PortEl2 : Port_Element;
label
    Work_done;
begin
 El := TOrLAN(Nodes[Con_Num]);
 El2 := TOrLAN(Nodes[0]);

 for k:=0 to Nodes.Count - 1 do
 begin
    El2 := TOrlan(Nodes[k]);
    if El2.NodeName = ComboBoxDest.Items[ ComboBoxDest.ItemIndex ] then
       break;
 end;

 for i:=0 to El.Ports.Count-1 do
 begin
   PortEl := Port_Element(El.Ports[i]);
   if (PortEl.IsUsed = True) and (PortEl.PortType = ComboBoxNIC.Items[ ComboBoxNIC.ItemIndex ]) then
   begin
     for j:=0 to El2.Ports.Count-1 do
     begin
       PortEl2 := Port_Element(El2.Ports[j]);
       if (PortEl2.IsUsed = True) and (PortEl2.PortType = PortEl.PortType) and
          (PortEl.ID = El2.NodeID) and (PortEl2.ID = El.NodeID) then
       begin
         PortEl.IsUsed := False;
         PortEl2.IsUsed := False;
         goto Work_done;
       end;
     end;
   end;
 end;

 Work_done:

 Project_Modified := True;
 NeedRepaint := True;
 ModalResult := 1;
end;

procedure TFormConnect.ComboBoxDestChange(Sender: TObject);
var i, j, k : Integer;
    El : TOrlan;
    El2 : TOrlan;
    PortEl : Port_Element;
    PortEl2 : Port_Element;
label
    Work_done;
begin
 El := TOrLAN(Nodes[Con_Num]);
 El2 := TOrLAN(Nodes[0]);

 if Con_Num2 <> -1 then
    El2 := TOrLAN(Nodes[Con_Num2]);

// ComboBoxNIC.Enabled := True;
 ComboBoxNIC.Items.Clear;
 ComboBoxChan.Items.Clear;
 EditLength.Text := '1';

 if ComboBoxDest.Items.Count > 0 then
 begin
   if bNewConn then
   begin
      //вывести все свободные карточки одинаковых типов узлов El и El2
      for i:=0 to El.Ports.Count-1 do
      begin
        PortEl := Port_Element(El.Ports[i]);
        if PortEl.IsUsed = False then
           for j:=0 to El2.Ports.Count-1 do
           begin
             PortEl2 := Port_Element(El2.Ports[j]);
             if (PortEl2.IsUsed = False) and (PortEl2.PortType = PortEl.PortType) then
             //исключить повторение в списке
                if ComboBoxNIC.Items.IndexOf( PortEl.PortType ) = -1 then
                   ComboBoxNIC.Items.Add(PortEl.PortType);
           end;
      end;
      ComboBoxNIC.ItemIndex := 0;
      ComboBoxNICChange(nil);
   end
   else
   begin
      //вывести все занятые карточки одинаковых типов между узлом El и выбранным в списке ComboBoxDest
      for k:=0 to Nodes.Count - 1 do
      begin
         El2 := TOrlan(Nodes[k]);
         if El2.NodeName = ComboBoxDest.Items[ ComboBoxDest.ItemIndex ] then
           for i:=0 to El.Ports.Count-1 do
           begin
             PortEl := Port_Element(El.Ports[i]);
             if PortEl.IsUsed = True then
                for j:=0 to El2.Ports.Count-1 do
                begin
                  PortEl2 := Port_Element(El2.Ports[j]);
                  if (PortEl2.IsUsed = True) and (PortEl2.PortType = PortEl.PortType)
                      and (PortEl2.ID = El.NodeID) and (PortEl.ID = El2.NodeID) then
                  begin
                    ComboBoxNIC.Items.Add(PortEl.PortType);
                    ComboBoxNIC.ItemIndex := ComboBoxNIC.Items.IndexOf( PortEl2.PortType );
                    ComboBoxNICChange(nil);
//                    ComboBoxNIC.Enabled := False;

                    ComboBoxChan.ItemIndex := ComboBoxChan.Items.IndexOf( PortEl.ChannalType );
                    ComboBoxSpeed.Text := IntToStr(PortEl.Speed);
                    EditLength.Text := IntToStr(PortEl.ChannalLength);
                    goto Work_done;
                  end;
                end;
           end;
      end;
   end;
 end;

Work_done:

end;

procedure TFormConnect.ComboBoxNICChange(Sender: TObject);
var i : Integer;
begin
 ComboBoxChan.Items.Clear;

 if ComboBoxNIC.Items.Count > 0 then
 begin
   for i:=0 to Prot_List.Count-1 do
   begin
      Prot_Elem:=Prot_List.Items[i];
      if Prot_Elem^.Prot_= ComboBoxNIC.Items[ ComboBoxNIC.ItemIndex ] then
         ComboBoxChan.Items.Add(Prot_Elem^.Con_);
   end;
 end;
 ComboBoxChan.ItemIndex := 0;
 ComboBoxSpeed.ItemIndex :=  ComboBoxSpeed.Items.IndexOf(IntToStr(FormSwTime.ChannalTypeToDefaultSpeed(ComboBoxNIC.Items[ ComboBoxNIC.ItemIndex] )));
 EditLength.Text := '1';
end;


//========================================================
//Входные данные: NodeName
//Выходные данные: NodeID
//========================================================
function TFormConnect.NameToID(s:string):integer;
var i:integer;
begin
 Result:=-1;

 for i:=0 to Nodes.Count-1 do
   if s=TOrLAN(Nodes[i]).NodeName then
     Result:=TOrLAN(Nodes[i]).NodeID;
end;


//========================================================
//Входные данные: NodeID
//Выходные данные: NodeName
//========================================================
function TFormConnect.IDToName(ID:integer):string;
var i:integer;
begin
 Result:='';

 for i:=0 to Nodes.Count-1 do
   if ID=TOrLAN(Nodes[i]).NodeID then
     Result:=TOrLAN(Nodes[i]).NodeName;
end;

//========================================================
//Входные данные: NodeID
//Выходные данные: индекс этого узла в массиве Nodes
//========================================================
function TFormConnect.IDToNum(ID:integer):integer;
var i:integer;
begin
 Result:=-1;

 for i:=0 to Nodes.Count-1 do
   if ID=TOrLAN(Nodes[i]).NodeID then
     Result:=i;
end;

//========================================================
//Входные данные: NodeID
//Выходные данные: объект из массива Nodes
//========================================================
function TFormConnect.IDToNode(ID:integer):TOrlan;
var i:integer;
begin
 Result:=nil;

 for i:=0 to Nodes.Count-1 do
   if ID=TOrLAN(Nodes[i]).NodeID then
     Result:=TOrLAN(Nodes[i]);
end;


end.
