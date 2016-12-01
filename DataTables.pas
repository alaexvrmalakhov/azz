unit DataTables;

interface

uses
  Forms, ActnList, Menus, DB, IBCustomDataSet, IBQuery, Grids, DBGrids,
  StdCtrls, Classes, Controls, ExtCtrls, SysUtils;
//  Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmDataTables = class(TForm)
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    DBGrid1: TDBGrid;
    dsDatatables: TDataSource;
    qDataTables: TIBQuery;
    PopupMenu: TPopupMenu;
    alDataTables: TActionList;
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
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataTables: TfrmDataTables;

implementation

uses Main, DataTablesEdit;

{$R *.dfm}

procedure TfrmDataTables.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmDataTables.aCloseExecute(Sender: TObject);
begin
  frmDataTables.Close;
end;

procedure TfrmDataTables.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmDataTablesEdit') then frmDataTablesEdit:=TfrmDataTablesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTablesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати таблицю даних';
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    aRecordIDUpdateExecute(sender);
    edtTableName.Text:='';
    edtTableName.Enabled:=true;
    edtDBTableName.Text:='';
    edtDBTableName.Enabled:=true;
    DBGrid1.Align:=alClient;
    aAddField.Enabled:=true;
    aEditField.Enabled:=true;
    aDeleteField.Enabled:=true;
    aUpdateFields.Enabled:=true;
    aUpdateFieldsExecute(sender);
    lblTip.Caption:='';
    lblPodtip.Caption:='';
    Show;
    edtTableName.SetFocus;
  end;
end;

procedure TfrmDataTables.aEditExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmDataTables.qDataTables.RecordCount<=0 then exit;
  if (not frmDataTables.qDataTables.FieldByName('EDITING').IsNull)and(frmDataTables.qDataTables.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmDataTablesEdit') then frmDataTablesEdit:=TfrmDataTablesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTablesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити таблицю даних';
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    if not frmDataTables.qDataTables.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmDataTables.qDataTables.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    if not frmDataTables.qDataTables.FieldByName('TABLENAME').IsNull then edtTableName.Text:=frmDataTables.qDataTables.FieldByName('TABLENAME').Value else edtTableName.Text:='';
    edtTableName.Enabled:=true;
    if not frmDataTables.qDataTables.FieldByName('DBTABLENAME').IsNull then edtDBTableName.Text:=frmDataTables.qDataTables.FieldByName('DBTABLENAME').Value else edtDBTableName.Text:='';
    edtDBTableName.Enabled:=true;
    DBGrid1.Align:=alClient;
    aAddField.Enabled:=true;
    aEditField.Enabled:=true;
    aDeleteField.Enabled:=true;
    aUpdateFields.Enabled:=true;
    aUpdateFieldsExecute(sender);
    lblTip.Caption:='';
    lblPodtip.Caption:='';
    Show;
    edtTableName.SetFocus;
  end;
  RecNo:=frmDataTables.qDataTables.FieldByName('RECORD_ID').Value;
  with frmDataTablesEdit.qDataTablesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATABLES set EDITING=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTables.aUpdateExecute(sender);
  frmDataTables.qDataTables.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmDataTables.aDeleteExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmDataTables.qDataTables.RecordCount<=0 then exit;
  if (not frmDataTables.qDataTables.FieldByName('EDITING').IsNull)and(frmDataTables.qDataTables.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmDataTablesEdit') then frmDataTablesEdit:=TfrmDataTablesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTablesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити таблицю даних';
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    if not frmDataTables.qDataTables.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmDataTables.qDataTables.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    if not frmDataTables.qDataTables.FieldByName('TABLENAME').IsNull then edtTableName.Text:=frmDataTables.qDataTables.FieldByName('TABLENAME').Value else edtTableName.Text:='';
    edtTableName.Enabled:=false;
    if not frmDataTables.qDataTables.FieldByName('DBTABLENAME').IsNull then edtDBTableName.Text:=frmDataTables.qDataTables.FieldByName('DBTABLENAME').Value else edtDBTableName.Text:='';
    edtDBTableName.Enabled:=false;
    DBGrid1.Align:=alClient;
    aAddField.Enabled:=false;
    aEditField.Enabled:=false;
    aDeleteField.Enabled:=false;
    aUpdateFields.Enabled:=true;
    aUpdateFieldsExecute(sender);
    lblTip.Caption:='';
    lblPodtip.Caption:='';
    Show;
    btnCancel.SetFocus;
  end;
  RecNo:=frmDataTables.qDataTables.FieldByName('RECORD_ID').Value;
  with frmDataTablesEdit.qDataTablesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATABLES set EDITING=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTables.aUpdateExecute(sender);
  frmDataTables.qDataTables.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmDataTables.aChoiceExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmDataTables.qDataTables.RecordCount<=0 then exit;
  if (not frmDataTables.qDataTables.FieldByName('EDITING').IsNull)and(frmDataTables.qDataTables.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmDataTablesEdit') then frmDataTablesEdit:=TfrmDataTablesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTablesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати таблицю даних';
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    if not frmDataTables.qDataTables.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmDataTables.qDataTables.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    if not frmDataTables.qDataTables.FieldByName('TABLENAME').IsNull then edtTableName.Text:=frmDataTables.qDataTables.FieldByName('TABLENAME').Value else edtTableName.Text:='';
    edtTableName.Enabled:=false;
    if not frmDataTables.qDataTables.FieldByName('DBTABLENAME').IsNull then edtDBTableName.Text:=frmDataTables.qDataTables.FieldByName('DBTABLENAME').Value else edtDBTableName.Text:='';
    edtDBTableName.Enabled:=false;
    DBGrid1.Align:=alClient;
    aAddField.Enabled:=false;
    aEditField.Enabled:=false;
    aDeleteField.Enabled:=false;
    aUpdateFields.Enabled:=true;
    aUpdateFieldsExecute(sender);
    lblTip.Caption:='';
    lblPodtip.Caption:='';
    Show;
    btnOK.SetFocus;
  end;
  RecNo:=frmDataTables.qDataTables.FieldByName('RECORD_ID').Value;
  with frmDataTablesEdit.qDataTablesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATABLES set EDITING=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTables.aUpdateExecute(sender);
  frmDataTables.qDataTables.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmDataTables.aUpdateExecute(Sender: TObject);
begin
  with frmDataTables.qDataTables do
  begin
    SQL.Clear;
    SQL.Text:='select * from DATATABLES where not DBTABLENAME is null order by TABLENAME';
    Open;
  end;
end;

end.
