unit DataTypesEdit;

interface

uses
  Forms, StdCtrls, Controls, ActnList, Classes, DB, IBCustomDataSet,
  IBQuery, SysUtils, Dialogs;
//  Windows, Messages, Variants, Graphics;

type
  TfrmDataTypesEdit = class(TForm)
    qDataTypesEdit: TIBQuery;
    alDataTypesEdit: TActionList;
    Label1: TLabel;
    edtRecord_ID: TEdit;
    Label2: TLabel;
    edtDataType: TEdit;
    cbxDovzhina: TCheckBox;
    cbxTochnist: TCheckBox;
    cbxPidpit: TCheckBox;
    Label3: TLabel;
    edtDescription: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    aRecordIDUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataTypesEdit: TfrmDataTypesEdit;

implementation

uses Main, DataTypes;

{$R *.dfm}

procedure TfrmDataTypesEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmDataTypes.aUpdateExecute(sender);
  with frmDataTypes.qDataTypes do
  begin
    SQL.Clear;
    SQL.Text:='update DATATYPES set EDITING=0 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmDataTypesEdit.edtRecord_ID.Text);
    Open;
    frmMain.trAzz.CommitRetaining;
    frmDataTypes.aUpdateExecute(sender);
    frmDataTypes.qDataTypes.Last;
  end;
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmDataTypesEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmDataTypesEdit.qDataTypesEdit do
  begin
    SQL.Clear;
    SQL.Text:='insert into DATATYPES (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    Open;
    SQL.Clear;
    SQL.Text:='select * from DATATYPES order by RECORD_ID';
    Open;
    Last;
    frmDataTypesEdit.edtRecord_ID.Text:=IntToStr(FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmDataTypesEdit.aOKExecute(Sender: TObject);
begin
  if frmDataTypesEdit.Caption='Вибрати тип даних' then
  begin
  end;

  if frmDataTypesEdit.Caption='Видалити тип даних' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на роботі програми!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmDataTypesEdit.qDataTypesEdit do
      begin
        SQL.Clear;
        SQL.Text:='delete from DATATYPES where RECORD_ID=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=StrToInt(frmDataTypesEdit.edtRecord_ID.Text);
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
    end;
    frmDataTypes.aUpdateExecute(sender);
    frmDataTypesEdit.Close;
    exit;
  end;

  if frmDataTypesEdit.Caption='Змінити тип даних' then
  begin
    if frmDataTypesEdit.edtRecord_ID.Text='' then
    begin
      frmDataTypesEdit.aRecordIDUpdateExecute(sender);
      frmDataTypesEdit.edtDataType.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmDataTypesEdit.edtRecord_ID.Text);
    except
      frmDataTypesEdit.aRecordIDUpdateExecute(sender);
      frmDataTypesEdit.edtDataType.SetFocus;
      exit;
    end;
    if frmDataTypesEdit.edtDataType.Text='' then
    begin
      frmDataTypesEdit.edtDataType.SetFocus;
      exit;
    end;
    with frmDataTypes.qDataTypes do
    begin
      SQL.Clear;
      SQL.Text:='update DATATYPES set DATATYPE=:DataType,DLINA=:Dlina,TOCHNOST=:Tochnost,PODTIP=:Podtip,DESCRIPTION=:Description,EDITING=0 where RECORD_ID=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DataType';
      Params[0].Value:=frmDataTypesEdit.edtDataType.Text;
      Params.Add;
      Params[1].Name:='Dlina';
      if frmDataTypesEdit.cbxDovzhina.Checked then Params[1].Value:=1 else Params[1].Value:=0;
      Params.Add;
      Params[2].Name:='Tochnost';
      if frmDataTypesEdit.cbxTochnist.Checked then Params[2].Value:=1 else Params[2].Value:=0;
      Params.Add;
      Params[3].Name:='Podtip';
      if frmDataTypesEdit.cbxPidpit.Checked then Params[3].Value:=1 else Params[3].Value:=0;
      Params.Add;
      Params[4].Name:='Description';
      Params[4].Value:=frmDataTypesEdit.edtDescription.Text;
      Params.Add;
      Params[5].Name:='Kod';
      Params[5].Value:=StrToInt(frmDataTypesEdit.edtRecord_ID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmDataTypesEdit.Close;
    frmDataTypes.aUpdateExecute(sender);
    frmDataTypes.qDataTypes.Last;
    exit;
  end;

  if frmDataTypesEdit.Caption='Додати тип даних' then
  begin
    if frmDataTypesEdit.edtRecord_ID.Text='' then
    begin
      frmDataTypesEdit.aRecordIDUpdateExecute(sender);
      frmDataTypesEdit.edtDataType.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmDataTypesEdit.edtRecord_ID.Text);
    except
      frmDataTypesEdit.aRecordIDUpdateExecute(sender);
      frmDataTypesEdit.edtDataType.SetFocus;
      exit;
    end;
    if frmDataTypesEdit.edtDataType.Text='' then
    begin
      frmDataTypesEdit.edtDataType.SetFocus;
      exit;
    end;
    with frmDataTypes.qDataTypes do
    begin
      SQL.Clear;
      SQL.Text:='update DATATYPES set DATATYPE=:DataType,DLINA=:Dlina,TOCHNOST=:Tochnost,PODTIP=:Podtip,DESCRIPTION=:Description,EDITING=0 where RECORD_ID=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DataType';
      Params[0].Value:=frmDataTypesEdit.edtDataType.Text;
      Params.Add;
      Params[1].Name:='Dlina';
      if frmDataTypesEdit.cbxDovzhina.Checked then Params[1].Value:=1 else Params[1].Value:=0;
      Params.Add;
      Params[2].Name:='Tochnost';
      if frmDataTypesEdit.cbxTochnist.Checked then Params[2].Value:=1 else Params[2].Value:=0;
      Params.Add;
      Params[3].Name:='Podtip';
      if frmDataTypesEdit.cbxPidpit.Checked then Params[3].Value:=1 else Params[3].Value:=0;
      Params.Add;
      Params[4].Name:='Description';
      Params[4].Value:=frmDataTypesEdit.edtDescription.Text;
      Params.Add;
      Params[5].Name:='Kod';
      Params[5].Value:=StrToInt(frmDataTypesEdit.edtRecord_ID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmDataTypesEdit.Close;
    frmDataTypes.aUpdateExecute(sender);
    frmDataTypes.qDataTypes.Last;
    exit;
  end;
end;

procedure TfrmDataTypesEdit.aCancelExecute(Sender: TObject);
begin
  frmDataTypesEdit.Close;
end;

end.
