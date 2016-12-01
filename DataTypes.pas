unit DataTypes;

interface

uses
  Forms, Grids, DBGrids, DB, IBCustomDataSet, IBQuery, Menus, ActnList,
  StdCtrls, Classes, Controls, ExtCtrls, SysUtils, Dialogs;
//  Windows, Messages, Variants, Graphics;

type
  TfrmDataTypes = class(TForm)
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    alDataTypes: TActionList;
    PopupMenu: TPopupMenu;
    dsDataTypes: TDataSource;
    qDataTypes: TIBQuery;
    DBGrid1: TDBGrid;
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
  frmDataTypes: TfrmDataTypes;

implementation

uses Main, DataTypesEdit;

{$R *.dfm}

procedure TfrmDataTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.ENabled:=true;
  Action:=caFree;
end;

procedure TfrmDataTypes.aCloseExecute(Sender: TObject);
begin
  frmDataTypes.Close;
end;

procedure TfrmDataTypes.aUpdateExecute(Sender: TObject);
begin
  with frmDataTypes.qDataTypes do
  begin
    SQL.Clear;
    SQL.Text:='select * from DATATYPES where not DATATYPE is null order by DATATYPE';
    Open;
  end;
end;

procedure TfrmDataTypes.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmDataTypesEdit') then frmDataTypesEdit:=TfrmDataTypesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTypesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати тип даних';
    
    aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    edtDataType.Text:='';
    edtDataType.Enabled:=true;
    cbxDovzhina.Checked:=false;
    cbxDovzhina.Enabled:=true;
    cbxTochnist.Checked:=false;
    cbxTochnist.Enabled:=true;
    cbxPidpit.Checked:=false;
    cbxPidpit.Enabled:=true;
    edtDescription.Text:='';
    edtDescription.Enabled:=true;
    Show;
    edtDataType.SetFocus;
  end;
end;

procedure TfrmDataTypes.aEditExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmDataTypes.qDataTypes.RecordCount<=0 then exit;
  if (not frmDataTypes.qDataTypes.FieldByName('EDITING').IsNull)and(frmDataTypes.qDataTypes.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmDataTypesEdit') then frmDataTypesEdit:=TfrmDataTypesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTypesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити тип даних';

    if not frmDataTypes.qDataTypes.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DATATYPE').IsNull then edtDataType.Text:=frmDataTypes.qDataTypes.FieldByName('DATATYPE').Value else edtDataType.Text:='';
    edtDataType.Enabled:=true;
    if not frmDataTypes.qDataTypes.FieldByName('DLINA').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('DLINA').Value of
        0: cbxDovzhina.Checked:=false;
        1: cbxDovzhina.Checked:=true;
      else
        cbxDovzhina.Checked:=false;
      end
    else
      cbxDovzhina.Checked:=false;
    cbxDovzhina.Enabled:=true;
    if not frmDataTypes.qDataTypes.FieldByName('TOCHNOST').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('TOCHNOST').Value of
        0: cbxTochnist.Checked:=false;
        1: cbxTochnist.Checked:=true;
      else
        cbxTochnist.Checked:=false;
      end
    else
      cbxTochnist.Checked:=false;
    cbxTochnist.Enabled:=true;
    if not frmDataTypes.qDataTypes.FieldByName('PODTIP').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('PODTIP').Value of
        0: cbxPidpit.Checked:=false;
        1: cbxPidpit.Checked:=true;
      else
        cbxPidpit.Checked:=false;
      end
    else
      cbxPidpit.Checked:=false;
    cbxPidpit.Enabled:=true;
    if not frmDataTypes.qDataTypes.FieldByName('DESCRIPTION').IsNull then edtDescription.Text:=frmDataTypes.qDataTypes.FieldByName('DESCRIPTION').Value else edtDescription.Text:='';
    edtDescription.Enabled:=true;
    Show;
    edtDataType.SetFocus;
  end;

  RecNo:=frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value;
  with frmDataTypesEdit.qDataTypesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATYPES set EDITING=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTypes.aUpdateExecute(sender);
  frmDataTypes.qDataTypes.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmDataTypes.aDeleteExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmDataTypes.qDataTypes.RecordCount<=0 then exit;
  if (not frmDataTypes.qDataTypes.FieldByName('EDITING').IsNull)and(frmDataTypes.qDataTypes.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmDataTypesEdit') then frmDataTypesEdit:=TfrmDataTypesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTypesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити тип даних';

    if not frmDataTypes.qDataTypes.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DATATYPE').IsNull then edtDataType.Text:=frmDataTypes.qDataTypes.FieldByName('DATATYPE').Value else edtDataType.Text:='';
    edtDataType.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DLINA').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('DLINA').Value of
        0: cbxDovzhina.Checked:=false;
        1: cbxDovzhina.Checked:=true;
      else
        cbxDovzhina.Checked:=false;
      end
    else
      cbxDovzhina.Checked:=false;
    cbxDovzhina.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('TOCHNOST').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('TOCHNOST').Value of
        0: cbxTochnist.Checked:=false;
        1: cbxTochnist.Checked:=true;
      else
        cbxTochnist.Checked:=false;
      end
    else
      cbxTochnist.Checked:=false;
    cbxTochnist.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('PODTIP').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('PODTIP').Value of
        0: cbxPidpit.Checked:=false;
        1: cbxPidpit.Checked:=true;
      else
        cbxPidpit.Checked:=false;
      end
    else
      cbxPidpit.Checked:=false;
    cbxPidpit.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DESCRIPTION').IsNull then edtDescription.Text:=frmDataTypes.qDataTypes.FieldByName('DESCRIPTION').Value else edtDescription.Text:='';
    edtDescription.Enabled:=false;
    Show;
    btnCancel.SetFocus;
  end;

  RecNo:=frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value;
  with frmDataTypesEdit.qDataTypesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATYPES set EDITING=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTypes.aUpdateExecute(sender);
  frmDataTypes.qDataTypes.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmDataTypes.aChoiceExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmDataTypes.qDataTypes.RecordCount<=0 then exit;
  if (not frmDataTypes.qDataTypes.FieldByName('EDITING').IsNull)and(frmDataTypes.qDataTypes.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmDataTypesEdit') then frmDataTypesEdit:=TfrmDataTypesEdit.Create(self);
  frmMain.Enabled:=false;
  with frmDataTypesEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати тип даних';

    if not frmDataTypes.qDataTypes.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecord_ID.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DATATYPE').IsNull then edtDataType.Text:=frmDataTypes.qDataTypes.FieldByName('DATATYPE').Value else edtDataType.Text:='';
    edtDataType.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DLINA').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('DLINA').Value of
        0: cbxDovzhina.Checked:=false;
        1: cbxDovzhina.Checked:=true;
      else
        cbxDovzhina.Checked:=false;
      end
    else
      cbxDovzhina.Checked:=false;
    cbxDovzhina.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('TOCHNOST').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('TOCHNOST').Value of
        0: cbxTochnist.Checked:=false;
        1: cbxTochnist.Checked:=true;
      else
        cbxTochnist.Checked:=false;
      end
    else
      cbxTochnist.Checked:=false;
    cbxTochnist.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('PODTIP').IsNull then
      case frmDataTypes.qDataTypes.FieldByName('PODTIP').Value of
        0: cbxPidpit.Checked:=false;
        1: cbxPidpit.Checked:=true;
      else
        cbxPidpit.Checked:=false;
      end
    else
      cbxPidpit.Checked:=false;
    cbxPidpit.Enabled:=false;
    if not frmDataTypes.qDataTypes.FieldByName('DESCRIPTION').IsNull then edtDescription.Text:=frmDataTypes.qDataTypes.FieldByName('DESCRIPTION').Value else edtDescription.Text:='';
    edtDescription.Enabled:=false;
    Show;
    btnOK.SetFocus;
  end;

  RecNo:=frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value;
  with frmDataTypesEdit.qDataTypesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATYPES set EDITING=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmDataTypes.qDataTypes.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTypes.aUpdateExecute(sender);
  frmDataTypes.qDataTypes.Locate('RECORD_ID',RecNo,[]);
end;

end.
