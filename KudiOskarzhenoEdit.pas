unit KudiOskarzhenoEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmKudiOskarzhenoEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodOrganizacii: TEdit;
    edtNazvaOrganizacii: TEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    btnKodOrganizacii: TButton;
    alKudiOskarzgenoEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmKudiOskarzhenoEdit: TfrmKudiOskarzhenoEdit;

implementation

uses
  Main, KudiOskarzheno, Oskarzhenny;

{$R *.dfm}

procedure TfrmKudiOskarzhenoEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmOskarzhenny') then
  begin
    frmOskarzhenny.Enabled:=true;
    frmMain.Enabled:=false;
    if frmKudiOskarzhenoEdit.Caption<>'Вибір організації' then
    begin
      frmKudiOskarzheno.Enabled:=true;
      frmOskarzhenny.Enabled:=false;
    end
    else
      frmKudiOskarzheno.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmKudiOskarzhenoEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmKudiOskarzheno do
  begin
    qKudiOskarzheno.SQL.Clear;
    qKudiOskarzheno.SQL.Text:='insert into KUDIOSKARZHENO (KODORGANOZACIIOSKARZHENO) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qKudiOskarzheno.Open;
    qKudiOskarzheno.SQL.Clear;
    qKudiOskarzheno.SQL.Text:='select * from KUDIOSKARZHENO order by KODORGANOZACIIOSKARZHENO';
    qKudiOskarzheno.Open;
    qKudiOskarzheno.Last;
    frmKudiOskarzhenoEdit.edtKodOrganizacii.Text:=IntToStr(qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').Value);
  end;
end;

procedure TfrmKudiOskarzhenoEdit.aOKExecute(Sender: TObject);
begin
  if frmKudiOskarzhenoEdit.Caption='Вибір організації' then
  begin
    if frmMain.IsFormOpen('frmOskarzhenny') then
    begin
      frmOskarzhenny.cbKudiOskarzheno.Text:=frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text;
      frmKudiOskarzhenoEdit.Close;
      frmKudiOskarzheno.Close;
      exit;
    end;
  end;

  if frmKudiOskarzhenoEdit.Caption='Видалення організації' then
  begin
    if MessageDlg('Видалення цих даних може відобразитись на інших відомостях і звітах!!!'+#13+'Ви дійсно бажаєте видалити ці відомості?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmKudiOskarzheno.qKudiOskarzheno.SQL.Clear;
      frmKudiOskarzheno.qKudiOskarzheno.SQL.Text:='delete from KUDIOSKARZHENO where KODORGANOZACIIOSKARZHENO=:Kod';
      frmKudiOskarzheno.qKudiOskarzheno.Params.Clear;
      frmKudiOskarzheno.qKudiOskarzheno.Params.Add;
      frmKudiOskarzheno.qKudiOskarzheno.Params[0].Name:='Kod';
      frmKudiOskarzheno.qKudiOskarzheno.Params[0].Value:=frmKudiOskarzhenoEdit.edtKodOrganizacii.Text;
      frmKudiOskarzheno.qKudiOskarzheno.Open;
      frmMain.trAzz.CommitRetaining;
    end;
      frmKudiOskarzhenoEdit.Close;
      frmKudiOskarzheno.aUpdateExecute(sender);
      exit;
  end;

  if frmKudiOskarzhenoEdit.Caption='Редагування організації' then
  begin
    if frmKudiOskarzhenoEdit.edtKodOrganizacii.Text='' then
    begin
      frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
      frmKudiOskarzhenoEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmKudiOskarzhenoEdit.edtKodOrganizacii.Text);
    except
      frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
      frmKudiOskarzhenoEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    if frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text='' then
    begin
      frmKudiOskarzhenoEdit.edtNazvaOrganizacii.SetFocus;
      exit;
    end;

    frmKudiOskarzheno.qKudiOskarzheno.SQL.Clear;
    frmKudiOskarzheno.qKudiOskarzheno.SQL.Text:='update KUDIOSKARZHENO set NAZVAORGANIZACIIOSKARZHENO=:NAZVAORGANIZACIIOSKARZHENO where KODORGANOZACIIOSKARZHENO=:KODORGANOZACIIOSKARZHENO';
    frmKudiOskarzheno.qKudiOskarzheno.Params.Clear;
    frmKudiOskarzheno.qKudiOskarzheno.Params.Add;
    frmKudiOskarzheno.qKudiOskarzheno.Params[0].Name:='NAZVAORGANIZACIIOSKARZHENO';
    frmKudiOskarzheno.qKudiOskarzheno.Params[0].Value:=frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text;
    frmKudiOskarzheno.qKudiOskarzheno.Params.Add;
    frmKudiOskarzheno.qKudiOskarzheno.Params[1].Name:='KODORGANOZACIIOSKARZHENO';
    frmKudiOskarzheno.qKudiOskarzheno.Params[1].Value:=frmKudiOskarzhenoEdit.edtKodOrganizacii.Text;
    frmKudiOskarzheno.qKudiOskarzheno.Open;
    frmMain.trAzz.CommitRetaining;

    frmKudiOskarzhenoEdit.Close;
    frmKudiOskarzheno.aUpdateExecute(sender);
    exit;
  end;

  if frmKudiOskarzhenoEdit.Caption='Додавання організації' then
  begin
    if frmKudiOskarzhenoEdit.edtKodOrganizacii.Text='' then
    begin
      frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
      frmKudiOskarzhenoEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmKudiOskarzhenoEdit.edtKodOrganizacii.Text);
    except
      frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
      frmKudiOskarzhenoEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    if frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text='' then
    begin
      frmKudiOskarzhenoEdit.edtNazvaOrganizacii.SetFocus;
      exit;
    end;

    frmKudiOskarzheno.qKudiOskarzheno.SQL.Clear;
    frmKudiOskarzheno.qKudiOskarzheno.SQL.Text:='update KUDIOSKARZHENO set NAZVAORGANIZACIIOSKARZHENO=:NAZVAORGANIZACIIOSKARZHENO where KODORGANOZACIIOSKARZHENO=:KODORGANOZACIIOSKARZHENO';
    frmKudiOskarzheno.qKudiOskarzheno.Params.Clear;
    frmKudiOskarzheno.qKudiOskarzheno.Params.Add;
    frmKudiOskarzheno.qKudiOskarzheno.Params[0].Name:='NAZVAORGANIZACIIOSKARZHENO';
    frmKudiOskarzheno.qKudiOskarzheno.Params[0].Value:=frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text;
    frmKudiOskarzheno.qKudiOskarzheno.Params.Add;
    frmKudiOskarzheno.qKudiOskarzheno.Params[1].Name:='KODORGANOZACIIOSKARZHENO';
    frmKudiOskarzheno.qKudiOskarzheno.Params[1].Value:=frmKudiOskarzhenoEdit.edtKodOrganizacii.Text;
    frmKudiOskarzheno.qKudiOskarzheno.Open;
    frmMain.trAzz.CommitRetaining;

    frmKudiOskarzhenoEdit.Close;
    frmKudiOskarzheno.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmKudiOskarzhenoEdit.aCancelExecute(Sender: TObject);
begin
  frmKudiOskarzhenoEdit.Close;
end;

end.
