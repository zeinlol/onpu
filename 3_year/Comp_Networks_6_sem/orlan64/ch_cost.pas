// ********************************************************************
//  ch_cost.pas
//
//  Смена стоимости оборудования/ПО
// ********************************************************************

unit ch_cost;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TCostChangeForm = class(TForm)
    Edit1: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CostChangeForm: TCostChangeForm;

implementation

uses database,main, preview;

{$R *.DFM}

procedure TCostChangeForm.FormShow(Sender: TObject);
begin
 Label1.Caption:=Name_;
 Label1.Left:=trunc((ClientWidth-Label1.Width)/2);
 Edit1.Text:=IntTostr(Cost_);
end;

procedure TCostChangeForm.BitBtn1Click(Sender: TObject);
var i,j:integer;
begin
 for i:=0 to FormDB.StringGridCost.RowCount-1 do
  if FormDB.StringGridCost.Cells[0,i]=Label1.Caption then
   begin
    FormDB.StringGridCost.Cells[1,i]:=Edit1.Text;
    // надо заменить в TList'e текущее значение
    for j:=1 to Main_DB.Count-1 do
     if (DataBase_Elem(Main_DB.Items[j]).Type_=
         FormDB.ComboBoxElemType.Text) and
        (DataBase_Elem(Main_DB.Items[j]).Name_=
         Label1.Caption) then
      DataBase_Elem(Main_DB.Items[j]).Cost_:=StrTointDef(Edit1.Text,0);
   end;
end;

end.
