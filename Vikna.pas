unit Vikna;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, SysUtils;
//, Windows, Messages, Variants, Graphics,
//  Dialogs, StdCtrls, 

type
  TfrmVikna = class(TForm)
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    dsVikna: TDataSource;
    alVikna: TActionList;
    qVikna: TIBQuery;
    DBGrid1: TDBGrid;
    PopupMenu: TPopupMenu;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVikna: TfrmVikna;

implementation

uses Main, ViknaEdit, ElementiVikonEdit;

{$R *.dfm}

procedure TfrmVikna.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmElementiVikonEdit') then
  begin
    frmElementiVikonEdit.Enabled:=true;
    frmVikna.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVikna.aCloseExecute(Sender: TObject);
begin
  frmVikna.Close;
end;

procedure TfrmVikna.aUpdateExecute(Sender: TObject);
begin
  with frmVikna do
  begin
    qVikna.SQL.Clear;
    qVikna.SQL.Text:='select * from VIKNA order by NAZVAVIKNA';
    qVikna.Open;
  end;
end;

procedure TfrmVikna.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmViknaEdit') then frmViknaEdit:=TfrmViknaEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmElementiVikonEdit') then frmVikna.Enabled:=false;
  with frmViknaEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати вікно';
    Show;
    aRecordID_UpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    edtNazvaVikna.Text:='';
    edtNazvaVikna.Enabled:=true;
    edtFormName.Text:='';
    edtFormName.Enabled:=true;
    edtPrimitka.Text:='';
    edtPrimitka.Enabled:=true;
    edtNazvaVikna.SetFocus;
  end;
end;

procedure TfrmVikna.aEditExecute(Sender: TObject);
begin
  if frmVikna.qVikna.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViknaEdit') then frmViknaEdit:=TfrmViknaEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmElementiVikonEdit') then frmVikna.Enabled:=false;
  with frmViknaEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити вікно';
    Show;
    if not qVikna.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(qVikna.FieldByName('RECORD_ID').Value) else aRecordID_UpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    if not qVikna.FieldByName('NAZVAVIKNA').IsNull then edtNazvaVikna.Text:=qVikna.FieldByName('NAZVAVIKNA').Value else edtNazvaVikna.Text:='';
    edtNazvaVikna.Enabled:=true;
    if not qVikna.FieldByName('FORMNAME').IsNull then edtFormName.Text:=qVikna.FieldByName('FORMNAME').Value else edtFormName.Text:='';
    edtFormName.Enabled:=true;
    if not qVikna.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=qVikna.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=true;
    edtNazvaVikna.SetFocus;
  end;
end;

procedure TfrmVikna.aDeleteExecute(Sender: TObject);
begin
  if frmVikna.qVikna.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViknaEdit') then frmViknaEdit:=TfrmViknaEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmElementiVikonEdit') then frmVikna.Enabled:=false;
  with frmViknaEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити вікно';
    Show;
    if not qVikna.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(qVikna.FieldByName('RECORD_ID').Value) else aRecordID_UpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    if not qVikna.FieldByName('NAZVAVIKNA').IsNull then edtNazvaVikna.Text:=qVikna.FieldByName('NAZVAVIKNA').Value else edtNazvaVikna.Text:='';
    edtNazvaVikna.Enabled:=false;
    if not qVikna.FieldByName('FORMNAME').IsNull then edtFormName.Text:=qVikna.FieldByName('FORMNAME').Value else edtFormName.Text:='';
    edtFormName.Enabled:=false;
    if not qVikna.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=qVikna.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=false;
    btnCancel.SetFocus;
  end;
end;

procedure TfrmVikna.aChoiceExecute(Sender: TObject);
begin
  if frmVikna.qVikna.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViknaEdit') then frmViknaEdit:=TfrmViknaEdit.Create(self);
  if frmMain.IsFormOpen('frmElementiVikonEdit') then frmVikna.Enabled:=false;
  frmMain.Enabled:=false;
  with frmViknaEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати вікно';
    Show;
    if not qVikna.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(qVikna.FieldByName('RECORD_ID').Value) else aRecordID_UpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    if not qVikna.FieldByName('NAZVAVIKNA').IsNull then edtNazvaVikna.Text:=qVikna.FieldByName('NAZVAVIKNA').Value else edtNazvaVikna.Text:='';
    edtNazvaVikna.Enabled:=false;
    if not qVikna.FieldByName('FORMNAME').IsNull then edtFormName.Text:=qVikna.FieldByName('FORMNAME').Value else edtFormName.Text:='';
    edtFormName.Enabled:=false;
    if not qVikna.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=qVikna.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=false;
    btnOK.SetFocus;
  end;
end;

end.
