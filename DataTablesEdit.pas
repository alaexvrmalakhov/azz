unit DataTablesEdit;

interface

uses
  Forms, Controls, StdCtrls, Classes, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, ActnList, ExtCtrls, SysUtils, Dialogs, DBCtrls;
//  Windows, Messages, Variants, Classes, Graphics, Controls;

type
  TfrmDataTablesEdit = class(TForm)
    Label1: TLabel;
    edtRecord_ID: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtTableName: TEdit;
    edtDBTableName: TEdit;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnUpdate: TButton;
    alDataTablesEdit: TActionList;
    dsDataFields: TDataSource;
    DBGrid1: TDBGrid;
    qDataFields: TIBQuery;
    btnOK: TButton;
    btnCancel: TButton;
    aRecordIDUpdate: TAction;
    aAddField: TAction;
    aEditField: TAction;
    aDeleteField: TAction;
    aUpdateFields: TAction;
    aOK: TAction;
    aCancel: TAction;
    qDataTablesEdit: TIBQuery;
    Panel2: TPanel;
    lblDBFieldName: TDBText;
    lblDlina: TDBText;
    lblTochnost: TDBText;
    lblTip: TLabel;
    lblPodtip: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aAddFieldExecute(Sender: TObject);
    procedure aEditFieldExecute(Sender: TObject);
    procedure aDeleteFieldExecute(Sender: TObject);
    procedure aUpdateFieldsExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure qDataFieldsAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataTablesEdit: TfrmDataTablesEdit;

implementation

uses Main, FieldEdit, DataTables;

{$R *.dfm}

procedure TfrmDataTablesEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmDataTables.aUpdateExecute(sender);
  with frmDataTablesEdit.qDataTablesEdit do
  begin
    SQL.Clear;
    SQL.Text:='update DATATABLES set EDITING=0 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmDataTables.aUpdateExecute(sender);
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmDataTablesEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmDataTablesEdit.qDataTablesEdit do
  begin
    SQL.Clear;
    SQL.Text:='insert into DATATABLES (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    Open;
    SQL.Clear;
    SQL.Text:='select * from DATATABLES order by RECORD_ID';
    Open;
    Last;
    frmDataTablesEdit.edtRecord_ID.Text:=IntToStr(FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmDataTablesEdit.aAddFieldExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFieldEdit') then frmFieldEdit:=TfrmFieldEdit.Create(self);
  frmDataTablesEdit.Enabled:=false;
  with frmFieldEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати поле';
    aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    Label2.Enabled:=false;
    edtTableID.Text:=frmDataTablesEdit.edtDBTableName.Text;
    edtTableID.Enabled:=false;
    edtFieldName.Text:='';
    edtFieldName.Enabled:=true;
    edtDBFieldName.Text:='';
    edtDBFieldName.Enabled:=true;
    cbDataType.Text:='';
    cbDataType.Items.Clear;
    aDataTypeUpdateExecute(sender);
    lblDlina.Visible:=false;
    edtDlina.Text:='';
    edtDlina.Visible:=false;
    edtDlina.Enabled:=true;
    lblTochnost.Visible:=false;
    edtTochnost.Text:='';
    edtTochnost.Visible:=false;
    edtTochnost.Enabled:=true;
    lblPodtip.Visible:=false;
    cbPodtip.Text:='';
    cbPodtip.Visible:=false;
    cbPodtip.Enabled:=true;
    Show;
    edtFieldName.SetFocus;
  end;
end;

procedure TfrmDataTablesEdit.aEditFieldExecute(Sender: TObject);
begin
  if frmDataTablesEdit.qDataFields.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmFieldEdit') then frmFieldEdit:=TfrmFieldEdit.Create(self);
  frmDataTablesEdit.Enabled:=false;
  with frmFieldEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити поле';
    if not frmDataTablesEdit.qDataFields.FieldByName('RECORD_ID').IsNull then frmFieldEdit.edtRecordID.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not frmDataTablesEdit.qDataFields.FieldByName('TABLE_ID').IsNull then
    begin
      frmFieldEdit.edtTableID.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('TABLE_ID').Value);
      with frmFieldEdit.qFieldEdit do
      begin
        SQL.Clear;
        SQL.Text:='select * from DATATABLES where RECORD_ID=:RecordID order by RECORD_ID';
        Params.Clear;
        Params.Add;
        Params[0].Name:='RecordID';
        Params[0].Value:=StrToInt(frmFieldEdit.edtTableID.Text);
        Open;
      end;
      if frmFieldEdit.qFieldEdit.Locate('RECORD_ID',StrToInt(frmFieldEdit.edtTableID.Text),[]) then frmFieldEdit.edtTableID.Text:=frmFieldEdit.qFieldEdit.FieldByName('DBTABLENAME').Value else frmFieldEdit.edtTableID.Text:='';
    end
    else
      edtTableID.Text:=frmDataTablesEdit.edtDBTableName.Text;
    Label2.Enabled:=false;
    edtTableID.Enabled:=false;
    if not frmDataTablesEdit.qDataFields.FieldByName('FIELDNAME').IsNull then frmFieldEdit.edtFieldName.Text:=frmDataTablesEdit.qDataFields.FieldByName('FIELDNAME').Value else edtFieldName.Text:='';
    edtFieldName.Enabled:=true;
    if not frmDataTablesEdit.qDataFields.FieldByName('DBFIELDNAME').IsNull then frmFieldEdit.edtDBFieldName.Text:=frmDataTablesEdit.qDataFields.FieldByName('DBFIELDNAME').Value else edtDBFieldName.Text:='';
    edtDBFieldName.Enabled:=true;
    cbDataType.Text:='';
    cbDataType.Items.Clear;
    aDataTypeUpdateExecute(sender);
    lblDlina.Visible:=false;
    edtDlina.Text:='';
    edtDlina.Visible:=false;
    edtDlina.Enabled:=true;
    lblTochnost.Visible:=false;
    edtTochnost.Text:='';
    edtTochnost.Visible:=false;
    edtTochnost.Enabled:=true;
    lblPodtip.Visible:=false;
    cbPodtip.Text:='';
    cbPodtip.Visible:=false;
    cbPodtip.Enabled:=true;
    if not frmDataTablesEdit.qDataFields.FieldByName('DATATYPE').IsNull then frmFieldEdit.cbDataType.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('DATATYPE').Value) else frmFieldEdit.cbDataType.Text:='';
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATYPES where RECORD_ID=:RecordID order by RECORD_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='RecordID';
      Params[0].Value:=StrToInt(frmFieldEdit.cbDataType.Text);
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('RECORD_ID',StrToInt(frmFieldEdit.cbDataType.Text),[]) then frmFieldEdit.cbDataType.Text:=frmFieldEdit.qFieldEdit.FieldByName('DATATYPE').Value else frmFieldEdit.cbDataType.Text:='';
    frmFieldEdit.aDataTypeChangeExecute(sender);
    if edtDlina.Visible then
    begin
      if not frmDataTablesEdit.qDataFields.FieldByName('DLINA').IsNull then edtDlina.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('DLINA').Value) else edtDlina.Text:='';
      edtDlina.Enabled:=true;
      lblDlina.Visible:=true;
    end
    else
    begin
      edtDlina.Visible:=false;
      edtDlina.Text:='';
      lblDlina.Visible:=false;
    end;
    edtDlina.Enabled:=true;
    if edtTochnost.Visible then
    begin
      if not frmDataTablesEdit.qDataFields.FieldByName('TOCHNOST').IsNull then edtTochnost.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('TOCHNOST').Value) else edtTochnost.Text:='';
      edtTochnost.Visible:=true;
      lblTochnost.Visible:=true;
    end
    else
    begin
      edtTochnost.Visible:=false;
      edtTochnost.Text:='';
      lblTochnost.Visible:=false;
    end;
    edtTochnost.Enabled:=true;
    if cbPodtip.Visible then
    begin
      if not frmDataTablesEdit.qDataFields.FieldByName('PODTIP').IsNull then cbPodtip.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('PODTIP').Value) else cbPodtip.Text:='';
      if cbPodtip.Text<>'' then
        case StrToInt(cbPodtip.Text) of
          0: cbPodtip.Text:='Текст';
          1: cbPodtip.Text:='Двоїчний';
        end;
      lblPodtip.Visible:=true;
      cbPodtip.Visible:=true;
    end
    else
    begin
      lblPodtip.Visible:=false;
      cbPodtip.Visible:=false;
      cbPodtip.Text:='';
    end;
    cbPodtip.Enabled:=true;
    Show;
    edtFieldName.SetFocus;
  end;
end;

procedure TfrmDataTablesEdit.aDeleteFieldExecute(Sender: TObject);
begin
  if frmDataTablesEdit.qDataFields.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmFieldEdit') then frmFieldEdit:=TfrmFieldEdit.Create(self);
  frmDataTablesEdit.Enabled:=false;
  with frmFieldEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити поле';
    if not frmDataTablesEdit.qDataFields.FieldByName('RECORD_ID').IsNull then frmFieldEdit.edtRecordID.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not frmDataTablesEdit.qDataFields.FieldByName('TABLE_ID').IsNull then
    begin
      frmFieldEdit.edtTableID.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('TABLE_ID').Value);
      with frmFieldEdit.qFieldEdit do
      begin
        SQL.Clear;
        SQL.Text:='select * from DATATABLES where RECORD_ID=:RecordID order by RECORD_ID';
        Params.Clear;
        Params.Add;
        Params[0].Name:='RecordID';
        Params[0].Value:=StrToInt(frmFieldEdit.edtTableID.Text);
        Open;
      end;
      if frmFieldEdit.qFieldEdit.Locate('RECORD_ID',StrToInt(frmFieldEdit.edtTableID.Text),[]) then frmFieldEdit.edtTableID.Text:=frmFieldEdit.qFieldEdit.FieldByName('DBTABLENAME').Value else frmFieldEdit.edtTableID.Text:='';
    end
    else
      edtTableID.Text:=frmDataTablesEdit.edtDBTableName.Text;
    Label2.Enabled:=false;
    edtTableID.Enabled:=false;
    if not frmDataTablesEdit.qDataFields.FieldByName('FIELDNAME').IsNull then frmFieldEdit.edtFieldName.Text:=frmDataTablesEdit.qDataFields.FieldByName('FIELDNAME').Value else edtFieldName.Text:='';
    edtFieldName.Enabled:=false;
    if not frmDataTablesEdit.qDataFields.FieldByName('DBFIELDNAME').IsNull then frmFieldEdit.edtDBFieldName.Text:=frmDataTablesEdit.qDataFields.FieldByName('DBFIELDNAME').Value else edtDBFieldName.Text:='';
    edtDBFieldName.Enabled:=false;
    cbDataType.Text:='';
    cbDataType.Items.Clear;
    aDataTypeUpdateExecute(sender);
    lblDlina.Visible:=false;
    edtDlina.Text:='';
    edtDlina.Visible:=false;
    edtDlina.Enabled:=false;
    lblTochnost.Visible:=false;
    edtTochnost.Text:='';
    edtTochnost.Visible:=false;
    edtTochnost.Enabled:=false;
    lblPodtip.Visible:=false;
    cbPodtip.Text:='';
    cbPodtip.Visible:=false;
    cbPodtip.Enabled:=false;
    if not frmDataTablesEdit.qDataFields.FieldByName('DATATYPE').IsNull then frmFieldEdit.cbDataType.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('DATATYPE').Value) else frmFieldEdit.cbDataType.Text:='';
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATYPES where RECORD_ID=:RecordID order by RECORD_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='RecordID';
      Params[0].Value:=StrToInt(frmFieldEdit.cbDataType.Text);
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('RECORD_ID',StrToInt(frmFieldEdit.cbDataType.Text),[]) then frmFieldEdit.cbDataType.Text:=frmFieldEdit.qFieldEdit.FieldByName('DATATYPE').Value else frmFieldEdit.cbDataType.Text:='';
    frmFieldEdit.aDataTypeChangeExecute(sender);
    if edtDlina.Visible then
    begin
      if not frmDataTablesEdit.qDataFields.FieldByName('DLINA').IsNull then edtDlina.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('DLINA').Value) else edtDlina.Text:='';
      edtDlina.Enabled:=false;
      lblDlina.Visible:=true;
    end
    else
    begin
      edtDlina.Visible:=false;
      edtDlina.Text:='';
      lblDlina.Visible:=false;
    end;
    edtDlina.Enabled:=false;
    if edtTochnost.Visible then
    begin
      if not frmDataTablesEdit.qDataFields.FieldByName('TOCHNOST').IsNull then edtTochnost.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('TOCHNOST').Value) else edtTochnost.Text:='';
      edtTochnost.Visible:=true;
      lblTochnost.Visible:=true;
    end
    else
    begin
      edtTochnost.Visible:=false;
      edtTochnost.Text:='';
      lblTochnost.Visible:=false;
    end;
    edtTochnost.Enabled:=false;
    if cbPodtip.Visible then
    begin
      if not frmDataTablesEdit.qDataFields.FieldByName('PODTIP').IsNull then cbPodtip.Text:=IntToStr(frmDataTablesEdit.qDataFields.FieldByName('PODTIP').Value) else cbPodtip.Text:='';
      if cbPodtip.Text<>'' then
        case StrToInt(cbPodtip.Text) of
          0: cbPodtip.Text:='Текст';
          1: cbPodtip.Text:='Двоїчний';
        end;
      lblPodtip.Visible:=true;
      cbPodtip.Visible:=true;
    end
    else
    begin
      lblPodtip.Visible:=false;
      cbPodtip.Visible:=false;
      cbPodtip.Text:='';
    end;
    cbPodtip.Enabled:=false;
    Show;
    btnCancel.SetFocus;
  end;
end;

procedure TfrmDataTablesEdit.aUpdateFieldsExecute(Sender: TObject);
begin
  with frmDataTablesEdit.qDataFields do
  begin
    SQL.Clear;
    SQL.Text:='select * from DATAFIELDS where not DBFIELDNAME is null and TABLE_ID=:TableID order by FIELDNAME';
//    SQL.Text:='select * from DATAFIELDS,DATATYPES where not DBFIELDNAME is null and TABLE_ID=:TableID and DATAFIELDS.DATATYPE=DATATYPES.RECORD_ID order by FIELDNAME';
    Params.Clear;
    Params.Add;
    Params[0].Name:='TableID';
    Params[0].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    Open;
  end;
end;

procedure TfrmDataTablesEdit.aOKExecute(Sender: TObject);
begin
  if frmDataTablesEdit.Caption='Вибрати таблицю даних' then
  begin
  end;

  if frmDataTablesEdit.Caption='Видалити таблицю даних' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може привести до недієздатності всієї програми!'+#13+'Ви дійсно біжієте видалити цей запис?'+#13+'',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmDataTables.qDataTables do
      begin
        SQL.Clear;
        SQL.Text:='delete from DATATABLES where RECORD_ID=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
    end;
    frmDataTablesEdit.Close;
    frmDataTables.aUpdateExecute(sender);
    frmDataTables.qDataTables.Last;
    exit;
  end;

  if frmDataTablesEdit.Caption='Змінити таблицю даних' then
  begin
    if frmDataTablesEdit.edtRecord_ID.Text='' then
    begin
      frmDataTablesEdit.aRecordIDUpdateExecute(sender);
      frmDataTablesEdit.edtTableName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    except
      frmDataTablesEdit.aRecordIDUpdateExecute(sender);
      frmDataTablesEdit.edtTableName.SetFocus;
      exit;
    end;
    if frmDataTablesEdit.edtDBTableName.Text='' then
    begin
      frmDataTablesEdit.edtDBTableName.Text:='';
      frmDataTablesEdit.edtDBTableName.SetFocus;
      exit;
    end;
    with frmDataTables.qDataTables do
    begin
      SQL.Clear;
      SQL.Text:='update DATATABLES set TABLENAME=:TableName,DBTABLENAME=:DBTableName,EDITING=0 where RECORD_ID=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='TableName';
      Params[0].Value:=frmDataTablesEdit.edtTableName.Text;
      Params.Add;
      Params[1].Name:='DBTableName';
      Params[1].Value:=frmDataTablesEdit.edtDBTableName.Text;
      Params.Add;
      Params[2].Name:='Kod';
      Params[2].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmDataTablesEdit.Close;
    frmDataTables.aUpdateExecute(sender);
    frmDataTables.qDataTables.Last;
    exit;
  end;

  if frmDataTablesEdit.Caption='Додати таблицю даних' then
  begin
    if frmDataTablesEdit.edtRecord_ID.Text='' then
    begin
      frmDataTablesEdit.aRecordIDUpdateExecute(sender);
      frmDataTablesEdit.edtTableName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
    except
      frmDataTablesEdit.aRecordIDUpdateExecute(sender);
      frmDataTablesEdit.edtTableName.SetFocus;
      exit;
    end;
    if frmDataTablesEdit.edtDBTableName.Text='' then
    begin
      frmDataTablesEdit.edtDBTableName.Text:='';
      frmDataTablesEdit.edtDBTableName.SetFocus;
      exit;
    end;
    with frmDataTables.qDataTables do
    begin
      SQL.Clear;
      SQL.Text:='update DATATABLES set TABLENAME=:TableName,DBTABLENAME=:DBTableName,EDITING=0 where RECORD_ID=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='TableName';
      Params[0].Value:=frmDataTablesEdit.edtTableName.Text;
      Params.Add;
      Params[1].Name:='DBTableName';
      Params[1].Value:=frmDataTablesEdit.edtDBTableName.Text;
      Params.Add;
      Params[2].Name:='Kod';
      Params[2].Value:=StrToInt(frmDataTablesEdit.edtRecord_ID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmDataTablesEdit.Close;
    frmDataTables.aUpdateExecute(sender);
    frmDataTables.qDataTables.Last;
    exit;
  end;
end;

procedure TfrmDataTablesEdit.aCancelExecute(Sender: TObject);
begin
  frmDataTablesEdit.Close;
end;

procedure TfrmDataTablesEdit.qDataFieldsAfterScroll(DataSet: TDataSet);
begin
  frmDataTablesEdit.lblDBFieldName.DataField:='';
  frmDataTablesEdit.lblDlina.DataField:='';
  frmDataTablesEdit.lblTochnost.DataField:='';
  frmDataTablesEdit.lblTip.Caption:='';
  frmDataTablesEdit.lblPodtip.Caption:='';
  with frmDataTablesEdit.qDataTablesEdit do
  begin
    SQL.Clear;
    SQL.Text:='select * from DATATYPES where RECORD_ID=:RecordID order by RECORD_ID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='RecordID';
    Params[0].Value:=frmDataTablesEdit.qDataFields.FieldByName('DATATYPE').Value;
    Open;
  end;
  if frmDataTablesEdit.qDataTablesEdit.Locate('RECORD_ID',frmDataTablesEdit.qDataFields.FieldByName('DATATYPE').Value,[]) then frmDataTablesEdit.lblTip.Caption:=frmDataTablesEdit.qDataTablesEdit.FieldByName('DATATYPE').Value else frmDataTablesEdit.lblTip.Caption:='';
  if not frmDataTablesEdit.qDataFields.FieldByName('PODTIP').IsNull then
  begin
    case frmDataTablesEdit.qDataFields.FieldByName('PODTIP').Value of
      0: frmDataTablesEdit.lblPodtip.Caption:='Текст';
      1: frmDataTablesEdit.lblPodtip.Caption:='Двоїчний';
    else
      frmDataTablesEdit.lblPodtip.Caption:='';
    end;
  end;
  if frmDataTablesEdit.qDataFields.FieldByName('DBFIELDNAME').IsNull then frmDataTablesEdit.lblDBFieldName.DataField:='' else frmDataTablesEdit.lblDBFieldName.DataField:='DBFIELDNAME';
  if frmDataTablesEdit.qDataFields.FieldByName('DLINA').IsNull then frmDataTablesEdit.lblDlina.DataField:='' else frmDataTablesEdit.lblDlina.DataField:='DLINA';
  if frmDataTablesEdit.qDataFields.FieldByName('TOCHNOST').IsNull then frmDataTablesEdit.lblTochnost.DataField:='' else frmDataTablesEdit.lblTochnost.DataField:='TOCHNOST';
end;

end.
