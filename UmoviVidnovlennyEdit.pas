unit UmoviVidnovlennyEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmUmoviVidnovlennyEdit = class(TForm)
    Label1: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    Label2: TLabel;
    edtUmovaVidnovlenny: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label3: TLabel;
    edtRecord_ID: TEdit;
    alUmoviVidnovlennyEdit: TActionList;
    aRecord_ID_Update: TAction;
    aKod_Update: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecord_ID_UpdateExecute(Sender: TObject);
    procedure aKod_UpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmUmoviVidnovlennyEdit: TfrmUmoviVidnovlennyEdit;

implementation

uses
  Main, AdminZapobizhZahodiEdit, UmoviVidnovlenny;

{$R *.dfm}

procedure TfrmUmoviVidnovlennyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    if frmUmoviVidnovlennyEdit.Caption<>'Вибір умови відновлення' then
    begin
      frmUmoviVidnovlenny.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmUmoviVidnovlenny.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(
  Sender: TObject);
begin
  with frmUmoviVidnovlenny do
  begin
    qUmoviVidnovlenny.SQL.Clear;
    qUmoviVidnovlenny.SQL.Text:='insert into UMOVI_VIDNOVLENNY (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qUmoviVidnovlenny.Open;
    qUmoviVidnovlenny.SQL.Clear;
    qUmoviVidnovlenny.SQL.Text:='select * from UMOVI_VIDNOVLENNY order by RECORD_ID';
    qUmoviVidnovlenny.Open;
    qUmoviVidnovlenny.Last;
    edtRecord_ID.Text:=IntToStr(qUmoviVidnovlenny.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmUmoviVidnovlennyEdit.aKod_UpdateExecute(Sender: TObject);
begin
  with frmUmoviVidnovlenny do
  begin
    qUmoviVidnovlenny.SQL.Clear;
    qUmoviVidnovlenny.SQL.Text:='select * from UMOVI_VIDNOVLENNY order by KOD_UMOVI';
    qUmoviVidnovlenny.Open;
    edtKod.Text:=IntToStr(qUmoviVidnovlenny.RecordCount+1);
    if qUmoviVidnovlenny.Locate('KOD_UMOVI',StrToInt(edtKod.Text),[]) then
      while qUmoviVidnovlenny.Locate('KOD_UMOVI',StrToInt(edtKod.Text),[]) do edtKod.Text:=IntToStr(StrToInt(edtKod.Text)+1);
    aUpdateExecute(sender);
  end;
end;

procedure TfrmUmoviVidnovlennyEdit.aOKExecute(Sender: TObject);
begin
  if frmUmoviVidnovlennyEdit.Caption='Вибір умови відновлення' then
  begin
    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:=frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text;
      frmUmoviVidnovlennyEdit.Close;
      frmUmoviVidnovlenny.Close;
      exit;
    end;
  end;

  if frmUmoviVidnovlennyEdit.Caption='Видалення умови відновлення' then
  begin
    if MessageDlg('УВАГА!!!'+#13+'Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmUmoviVidnovlenny do
      begin
        qUmoviVidnovlenny.SQL.Clear;
        qUmoviVidnovlenny.SQL.Text:='delete from UMOVI_VIDNOVLENNY where RECORD_ID=:RECORD_ID';
        qUmoviVidnovlenny.Params.Clear;
        qUmoviVidnovlenny.Params.Add;
        qUmoviVidnovlenny.Params[0].Name:='RECORD_ID';
        qUmoviVidnovlenny.Params[0].Value:=frmUmoviVidnovlennyEdit.edtRecord_ID.Text;
        qUmoviVidnovlenny.Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmUmoviVidnovlennyEdit.Close;
      frmUmoviVidnovlenny.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmUmoviVidnovlennyEdit.Caption='Редагування умови відновлення' then
  begin
    if frmUmoviVidnovlennyEdit.edtRecord_ID.Text='' then
    begin
      frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(frmUmoviVidnovlennyEdit.edtRecord_ID.Text);
    except
      frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;

    if frmUmoviVidnovlennyEdit.edtKod.Text='' then
    begin
      frmUmoviVidnovlennyEdit.aKod_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(frmUmoviVidnovlennyEdit.edtKod.Text);
    except
      frmUmoviVidnovlennyEdit.aKod_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;

    if frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text='' then
    begin
      frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.SetFocus;
      exit;
    end;

    with frmUmoviVidnovlenny do
    begin
      qUmoviVidnovlenny.SQL.Clear;
      qUmoviVidnovlenny.SQL.Text:='update UMOVI_VIDNOVLENNY set KOD_UMOVI=:KOD_UMOVI,UMOVA_VIDNOVLENNY=:UMOVA_VIDNOVLENNY where RECORD_ID=:RECORD_ID';
      qUmoviVidnovlenny.Params.Clear;
      qUmoviVidnovlenny.Params.Add;
      qUmoviVidnovlenny.Params[0].Name:='KOD_UMOVI';
      qUmoviVidnovlenny.Params[0].Value:=frmUmoviVidnovlennyEdit.edtKod.Text;
      qUmoviVidnovlenny.Params.Add;
      qUmoviVidnovlenny.Params[1].Name:='UMOVA_VIDNOVLENNY';
      qUmoviVidnovlenny.Params[1].Value:=frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text;
      qUmoviVidnovlenny.Params.Add;
      qUmoviVidnovlenny.Params[2].Name:='RECORD_ID';
      qUmoviVidnovlenny.Params[2].Value:=frmUmoviVidnovlennyEdit.edtRecord_ID.Text;
      qUmoviVidnovlenny.Open;
    end;
    frmMain.trAzz.CommitRetaining;

    frmMain.trAzz.Active:=false;
    frmMain.trAzz.Params.Clear;
    frmMain.trAzz.Params.Add('read_committed');
    frmMain.trAzz.Params.Add('rec_version');
    frmMain.trAzz.Params.Add('nowait');
    frmMain.trAzz.Active:=true;
    frmUmoviVidnovlennyEdit.Close;
    frmUmoviVidnovlenny.aUpdateExecute(sender);
    exit;
  end;

  if frmUmoviVidnovlennyEdit.Caption='Додавання умови відновлення' then
  begin
    if frmUmoviVidnovlennyEdit.edtRecord_ID.Text='' then
    begin
      frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(frmUmoviVidnovlennyEdit.edtRecord_ID.Text);
    except
      frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;

    if frmUmoviVidnovlennyEdit.edtKod.Text='' then
    begin
      frmUmoviVidnovlennyEdit.aKod_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt(frmUmoviVidnovlennyEdit.edtKod.Text);
    except
      frmUmoviVidnovlennyEdit.aKod_UpdateExecute(sender);
      frmUmoviVidnovlennyEdit.edtKod.SetFocus;
      exit;
    end;

    if frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text='' then
    begin
      frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.SetFocus;
      exit;
    end;

    with frmUmoviVidnovlenny do
    begin
      qUmoviVidnovlenny.SQL.Clear;
      qUmoviVidnovlenny.SQL.Text:='update UMOVI_VIDNOVLENNY set KOD_UMOVI=:KOD_UMOVI,UMOVA_VIDNOVLENNY=:UMOVA_VIDNOVLENNY where RECORD_ID=:RECORD_ID';
      qUmoviVidnovlenny.Params.Clear;
      qUmoviVidnovlenny.Params.Add;
      qUmoviVidnovlenny.Params[0].Name:='KOD_UMOVI';
      qUmoviVidnovlenny.Params[0].Value:=frmUmoviVidnovlennyEdit.edtKod.Text;
      qUmoviVidnovlenny.Params.Add;
      qUmoviVidnovlenny.Params[1].Name:='UMOVA_VIDNOVLENNY';
      qUmoviVidnovlenny.Params[1].Value:=frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text;
      qUmoviVidnovlenny.Params.Add;
      qUmoviVidnovlenny.Params[2].Name:='RECORD_ID';
      qUmoviVidnovlenny.Params[2].Value:=frmUmoviVidnovlennyEdit.edtRecord_ID.Text;
      qUmoviVidnovlenny.Open;
    end;
    frmMain.trAzz.CommitRetaining;

    frmMain.trAzz.Active:=false;
    frmMain.trAzz.Params.Clear;
    frmMain.trAzz.Params.Add('read_committed');
    frmMain.trAzz.Params.Add('rec_version');
    frmMain.trAzz.Params.Add('nowait');
    frmMain.trAzz.Active:=true;
    frmUmoviVidnovlennyEdit.Close;
    frmUmoviVidnovlenny.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmUmoviVidnovlennyEdit.aCancelExecute(Sender: TObject);
begin
  frmUmoviVidnovlennyEdit.Close;
end;

end.
