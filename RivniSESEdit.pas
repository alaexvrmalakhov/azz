unit RivniSESEdit;

interface

uses
  Forms, ActnList, StdCtrls, Controls, Classes, DB, IBCustomDataSet,
  IBQuery, SysUtils, Dialogs;
// , Windows, Messages, Variants, Graphics;

type
  TfrmRivniSESEdit = class(TForm)
    Label1: TLabel;
    edtRecord_ID: TEdit;
    Label2: TLabel;
    edtKod: TEdit;
    Label3: TLabel;
    edtRiven: TEdit;
    Label4: TLabel;
    edtDescription: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    alRivenSESEdit: TActionList;
    aRecordIDUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    qRivniSESEdit: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRivniSESEdit: TfrmRivniSESEdit;

implementation

uses Main, RivniSES;

{$R *.dfm}

procedure TfrmRivniSESEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRivniSESEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmRivniSESEdit do
  begin
    qRivniSESEdit.SQL.Clear;
    qRivniSESEdit.SQL.Text:='insert into RIVEN_SES (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qRivniSESEdit.Open;
    qRivniSESEdit.SQL.Clear;
    qRivniSESEdit.SQL.Text:='select * from RIVEN_SES order by RECORD_ID';
    qRivniSESEdit.Open;
    qRivniSESEdit.Last;
    edtRecord_ID.Text:=IntToStr(qRivniSESEdit.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmRivniSESEdit.aCancelExecute(Sender: TObject);
begin
  frmRivniSESEdit.Close;
end;

procedure TfrmRivniSESEdit.aOKExecute(Sender: TObject);
begin
  if frmRivniSESEdit.Caption='Вибрати рівень СЕС' then
  begin
  end;

  if frmRivniSESEdit.Caption='Видалити рівень СЕС' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може привести до неправильної роботи програми!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmRivniSESEdit do
      begin
        qRivniSESEdit.SQL.Clear;
        qRivniSESEdit.SQL.Text:='delete from RIVEN_SES where RECORD_ID=:Record_ID';
        qRivniSESEdit.Params.Clear;
        qRivniSESEdit.Params.Add;
        qRivniSESEdit.Params[0].Name:='Record_ID';
        qRivniSESEdit.Params[0].Value:=StrToInt(edtRecord_ID.Text);
        qRivniSESEdit.Open;
        frmMain.trAzz.CommitRetaining;
      end;
    end;
    frmRivniSESEdit.Close;
    frmRivniSES.aUpdateExecute(sender);
    exit;
  end;

  if frmRivniSESEdit.Caption='Змінити рівень СЕС' then
  begin
    if frmRivniSESEdit.edtRecord_ID.Text='' then
    begin
      aRecordIDUpdateExecute(sender);
      edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(edtRecord_ID.Text);
    except
      aRecordIDUpdateExecute(sender);
      edtKod.SetFocus;
      exit;
    end;
    if edtKod.Text='' then
    begin
      edtKod.Text:='';
      edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(edtKod.Text);
    except
      edtKod.Text:='';
      edtKod.SetFocus;
      exit;
    end;
    if edtRiven.Text='' then
    begin
      edtRiven.Text:='';
      edtRiven.SetFocus;
      exit;
    end;
    with frmRivniSESEdit do
    begin
      qRivniSESEdit.SQL.Clear;
      qRivniSESEdit.SQL.Text:='update RIVEN_SES set KOD=:Kod,RIVEN=:Riven,DESCRIPTION=:Description where RECORD_ID=:Record_ID';
      qRivniSESEdit.Params.Clear;
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[0].Name:='Kod';
      qRivniSESEdit.Params[0].Value:=StrToInt(edtKod.Text);
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[1].Name:='Riven';
      qRivniSESEdit.Params[1].Value:=edtRiven.Text;
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[2].Name:='Description';
      qRivniSESEdit.Params[2].Value:=edtDescription.Text;
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[3].Name:='Record_ID';
      qRivniSESEdit.Params[3].Value:=StrToInt(edtRecord_ID.Text);
      qRivniSESEdit.Open;
      frmMain.trAzz.CommitRetaining;
      frmRivniSESEdit.Close;
      frmRivniSES.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmRivniSESEdit.Caption='Додати рівень СЕС' then
  begin
    if frmRivniSESEdit.edtRecord_ID.Text='' then
    begin
      aRecordIDUpdateExecute(sender);
      edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(edtRecord_ID.Text);
    except
      aRecordIDUpdateExecute(sender);
      edtKod.SetFocus;
      exit;
    end;
    if edtKod.Text='' then
    begin
      edtKod.Text:='';
      edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(edtKod.Text);
    except
      edtKod.Text:='';
      edtKod.SetFocus;
      exit;
    end;
    qRivniSESEdit.SQL.Clear;
    qRivniSESEdit.SQL.Text:='select * from RIVEN_SES order by KOD';
    qRivniSESEdit.Open;
    if qRivniSESEdit.Locate('KOD',StrToInt(edtKod.Text),[]) then
    begin
      edtKod.Text:='';
      edtKod.SetFocus;
      exit;
    end;
    if edtRiven.Text='' then
    begin
      edtRiven.Text:='';
      edtRiven.SetFocus;
      exit;
    end;
    with frmRivniSESEdit do
    begin
      qRivniSESEdit.SQL.Clear;
      qRivniSESEdit.SQL.Text:='update RIVEN_SES set KOD=:Kod,RIVEN=:Riven,DESCRIPTION=:Description where RECORD_ID=:Record_ID';
      qRivniSESEdit.Params.Clear;
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[0].Name:='Kod';
      qRivniSESEdit.Params[0].Value:=StrToInt(edtKod.Text);
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[1].Name:='Riven';
      qRivniSESEdit.Params[1].Value:=edtRiven.Text;
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[2].Name:='Description';
      qRivniSESEdit.Params[2].Value:=edtDescription.Text;
      qRivniSESEdit.Params.Add;
      qRivniSESEdit.Params[3].Name:='Record_ID';
      qRivniSESEdit.Params[3].Value:=StrToInt(edtRecord_ID.Text);
      qRivniSESEdit.Open;
      frmMain.trAzz.CommitRetaining;
      frmRivniSESEdit.Close;
      frmRivniSES.aUpdateExecute(sender);
      exit;
    end;
  end;
end;

end.
