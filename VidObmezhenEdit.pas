unit VidObmezhenEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmVidObmezhenEdit = class(TForm)
    Label1: TLabel;
    edtKodObmezhenny: TEdit;
    btnKodObmezhenny: TButton;
    Label2: TLabel;
    edtVidObmezhenny: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alVidObmezhenEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    Label3: TLabel;
    edtRecord_ID: TEdit;
    aRecord_ID_Update: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aRecord_ID_UpdateExecute(Sender: TObject);
  end;

var
  frmVidObmezhenEdit: TfrmVidObmezhenEdit;

implementation

uses
  Main, VidObmezhen, Opechanuvanny, AdminZapobizhZahodiEdit;

{$R *.dfm}

procedure TfrmVidObmezhenEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір обмеження' then
    begin
      frmViddilenny.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmViddilenny.Close;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmOpechanuvanny.Enabled:=true;
    if frmVidObmezhenEdit.Caption<>'Вибір обмеження' then
    begin
      frmVidObmezhen.Enabled:=true;
      frmOpechanuvanny.Enabled:=false;
    end
    else
      frmVidObmezhen.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmVidObmezhenEdit.Caption<>'Вибір обмеження' then
    begin
      frmVidObmezhen.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmVidObmezhen.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidObmezhenEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmVidObmezhen do
  begin
    qVidObmezhen.SQL.Clear;
    qVidObmezhen.SQL.Text:='select * from VIDOBMEZHEN order by KODOBMEZHENNY';
    qVidObmezhen.Open;
    frmVidObmezhenEdit.edtKodObmezhenny.Text:=IntToStr(qVidObmezhen.RecordCount+1);
    if qVidObmezhen.Locate('KODOBMEZHENNY',StrToInt(frmVidObmezhenEdit.edtKodObmezhenny.Text),[]) then
      while qVidObmezhen.Locate('KODOBMEZHENNY',StrToInt(frmVidObmezhenEdit.edtKodObmezhenny.Text),[]) do frmVidObmezhenEdit.edtKodObmezhenny.Text:=IntToStr(StrToInt(frmVidObmezhenEdit.edtKodObmezhenny.Text)+1);
  end;
end;

procedure TfrmVidObmezhenEdit.aOKExecute(Sender: TObject);
begin
  if frmVidObmezhenEdit.Caption='Вибір обмеження' then
  begin
    if frmMain.IsFormOpen('frmOpechanuvanny') then
    begin
      frmOpechanuvanny.cbNazvaUstatkuvanny.Text:=frmVidObmezhenEdit.edtVidObmezhenny.Text;
      frmVidObmezhenEdit.Close;
      frmVidObmezhen.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbPostanoviv.Text:=frmVidObmezhenEdit.edtVidObmezhenny.Text;
      frmVidObmezhenEdit.Close;
      frmVidObmezhen.Close;
      exit;
    end;
  end;

  if frmVidObmezhenEdit.Caption='Видалення обмеження' then
  begin
    if MessageDlg('Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmVidObmezhen do
      begin
        qVidObmezhen.SQL.Clear;
        qVidObmezhen.SQL.Text:='delete from VIDOBMEZHEN where RECORD_ID=:Kod';
        qVidObmezhen.Params.Clear;
        qVidObmezhen.Params.Add;
        qVidObmezhen.Params[0].Name:='Kod';
        qVidObmezhen.Params[0].Value:=frmVidObmezhenEdit.edtRecord_ID.Text;
        qVidObmezhen.Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmVidObmezhenEdit.Close;
      frmVidObmezhen.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmVidObmezhenEdit.Caption='Редагування обмеження' then
  begin
    if frmVidObmezhenEdit.edtRecord_ID.Text='' then
    begin
      frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidObmezhenEdit.edtRecord_ID.Text);
    except
      frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    if frmVidObmezhenEdit.edtKodObmezhenny.Text='' then
    begin
      frmVidObmezhenEdit.aKodUpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidObmezhenEdit.edtKodObmezhenny.Text);
    except
      frmVidObmezhenEdit.aKodUpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    if frmVidObmezhenEdit.edtVidObmezhenny.Text='' then
    begin
      frmVidObmezhenEdit.edtVidObmezhenny.SetFocus;
      exit;
    end;

    with frmVidObmezhen do
    begin
      qVidObmezhen.SQL.Clear;
      qVidObmezhen.SQL.Text:='update VIDOBMEZHEN set KODOBMEZHENNY=:KODOBMEZHENNY,VIDOBMEZHENNY=:VIDOBMEZHENNY where RECORD_ID=:RECORD_ID';
      qVidObmezhen.Params.Clear;
      qVidObmezhen.Params.Add;
      qVidObmezhen.Params[0].Name:='KODOBMEZHENNY';
      qVidObmezhen.Params[0].Value:=frmVidObmezhenEdit.edtKodObmezhenny.Text;
      qVidObmezhen.Params.Add;
      qVidObmezhen.Params[1].Name:='VIDOBMEZHENNY';
      qVidObmezhen.Params[1].Value:=frmVidObmezhenEdit.edtVidObmezhenny.Text;
      qVidObmezhen.Params.Add;
      qVidObmezhen.Params[2].Name:='RECORD_ID';
      qVidObmezhen.Params[2].Value:=frmVidObmezhenEdit.edtRecord_ID.Text;
      qVidObmezhen.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidObmezhenEdit.Close;
    frmVidObmezhen.aUpdateExecute(sender);
    exit;
  end;

  if frmVidObmezhenEdit.Caption='Додавання обмеження' then
  begin
    if frmVidObmezhenEdit.edtRecord_ID.Text='' then
    begin
      frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidObmezhenEdit.edtRecord_ID.Text);
    except
      frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    if frmVidObmezhenEdit.edtKodObmezhenny.Text='' then
    begin
      frmVidObmezhenEdit.aKodUpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidObmezhenEdit.edtKodObmezhenny.Text);
    except
      frmVidObmezhenEdit.aKodUpdateExecute(sender);
      frmVidObmezhenEdit.edtKodObmezhenny.SetFocus;
      exit;
    end;
    if frmVidObmezhenEdit.edtVidObmezhenny.Text='' then
    begin
      frmVidObmezhenEdit.edtVidObmezhenny.SetFocus;
      exit;
    end;

    with frmVidObmezhen do
    begin
      qVidObmezhen.SQL.Clear;
      qVidObmezhen.SQL.Text:='update VIDOBMEZHEN set KODOBMEZHENNY=:KODOBMEZHENNY,VIDOBMEZHENNY=:VIDOBMEZHENNY where RECORD_ID=:RECORD_ID';
      qVidObmezhen.Params.Clear;
      qVidObmezhen.Params.Add;
      qVidObmezhen.Params[0].Name:='KODOBMEZHENNY';
      qVidObmezhen.Params[0].Value:=frmVidObmezhenEdit.edtKodObmezhenny.Text;
      qVidObmezhen.Params.Add;
      qVidObmezhen.Params[1].Name:='VIDOBMEZHENNY';
      qVidObmezhen.Params[1].Value:=frmVidObmezhenEdit.edtVidObmezhenny.Text;
      qVidObmezhen.Params.Add;
      qVidObmezhen.Params[2].Name:='RECORD_ID';
      qVidObmezhen.Params[2].Value:=frmVidObmezhenEdit.edtRecord_ID.Text;
      qVidObmezhen.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidObmezhenEdit.Close;
    frmVidObmezhen.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmVidObmezhenEdit.aCancelExecute(Sender: TObject);
begin
  frmVidObmezhenEdit.Close;
end;

procedure TfrmVidObmezhenEdit.aRecord_ID_UpdateExecute(Sender: TObject);
begin
  with frmVidObmezhen do
  begin
    qVidObmezhen.SQL.Clear;
    qVidObmezhen.SQL.Text:='insert into VIDOBMEZHEN (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qVidObmezhen.Open;
    qVidObmezhen.SQL.Clear;
    qVidObmezhen.SQL.Text:='select * from VIDOBMEZHEN order by RECORD_ID';
    qVidObmezhen.Open;
    qVidObmezhen.Last;
    frmVidObmezhenEdit.edtRecord_ID.Text:=IntToStr(qVidObmezhen.FieldByName('RECORD_ID').Value);
  end;
end;

end.
