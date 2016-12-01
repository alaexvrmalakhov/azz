unit OrganizaciiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, SysUtils, Dialogs;

type
  TfrmOrganizaciiEdit = class(TForm)
    Label1: TLabel;
    edtKodOrganizacii: TEdit;
    btnKodOrganizacii: TButton;
    Label2: TLabel;
    edtNazvaOrganizacii: TEdit;
    Label3: TLabel;
    edtPosadaOsobi: TEdit;
    Label4: TLabel;
    edtPIBOsobi: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label5: TLabel;
    edtRecord_ID: TEdit;
    alOrganizaciiEdit: TActionList;
    aRecord_ID_Update: TAction;
    aKodOrganizaciiUpdate: TAction;
    qID: TIBQuery;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecord_ID_UpdateExecute(Sender: TObject);
    procedure aKodOrganizaciiUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmOrganizaciiEdit: TfrmOrganizaciiEdit;

implementation

uses
  Main, VidnovlennyRobit, Organizacii;

{$R *.dfm}

procedure TfrmOrganizaciiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір відділення' then
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
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then
  begin
    frmVidnovlennyRobit.Enabled:=true;
    if frmOrganizaciiEdit.Caption<>'Вибір організації' then
    begin
      frmOrganizacii.Enabled:=true;
      frmVidnovlennyRobit.Enabled:=false;
    end
    else
      frmOrganizacii.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOrganizaciiEdit.aRecord_ID_UpdateExecute(Sender: TObject);
begin
  with frmOrganizaciiEdit do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='insert into ORGANIZACII (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qID.Open;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from ORGANIZACII order by RECORD_ID';
    qID.Open;
    qID.Last;
    edtRecord_ID.Text:=IntToStr(qID.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(
  Sender: TObject);
begin
  with frmOrganizaciiEdit do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from ORGANIZACII order by KOD_ORGANIZACII';
    qID.Open;
    qID.Last;
    edtKodOrganizacii.Text:=IntToStr(qID.RecordCount+1);
    if qID.Locate('KOD_ORGANIZACII',StrToInt(edtKodOrganizacii.Text),[]) then
      while qID.Locate('KOD_ORGANIZACII',StrToInt(edtKodOrganizacii.Text),[]) do edtKodOrganizacii.Text:=IntToStr(StrToInt(edtKodOrganizacii.Text)+1);
  end;
end;

procedure TfrmOrganizaciiEdit.aOKExecute(Sender: TObject);
begin
  if frmOrganizaciiEdit.Caption='Вибір організації' then
  begin
    if frmMain.IsFormOpen('frmVidnovlennyRobit') then
    begin
      frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text:=frmOrganizaciiEdit.edtPosadaOsobi.Text+' '+frmOrganizaciiEdit.edtPIBOsobi.Text;
      frmOrganizaciiEdit.Close;
      frmOrganizacii.Close;
      exit;
    end;
  end;  //Вибір організації

  if frmOrganizaciiEdit.Caption='Видалення організації' then
  begin
    if MessageDlg('Виделання цього запису може відобразитись на інших відомостях!!!'+#13+'Видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmOrganizacii do
      begin
        qOrganizacii.SQL.Clear;
        qOrganizacii.SQL.Text:='delete from ORGANIZACII where RECORD_ID=:Kod';
        qOrganizacii.Params.Clear;
        qOrganizacii.Params.Add;
        qOrganizacii.Params[0].Name:='Kod';
        qOrganizacii.Params[0].Value:=frmOrganizaciiEdit.edtRecord_ID.Text;
        qOrganizacii.Open;
      end;
    end;
    frmMain.trAzz.CommitRetaining;
    frmOrganizacii.aUpdateExecute(sender);
    frmOrganizaciiEdit.Close;
    exit;
  end;  //Видалення організації

  if frmOrganizaciiEdit.Caption='Редагування організації' then
  begin
    if frmOrganizaciiEdit.edtRecord_ID.Text='' then
    begin
      frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    try
      StrToInt(frmOrganizaciiEdit.edtRecord_ID.Text);
    except
      frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtKodOrganizacii.Text='' then
    begin
      frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    try
      StrToInt(frmOrganizaciiEdit.edtKodOrganizacii.Text);
    except
      frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtNazvaOrganizacii.Text='' then
    begin
      frmOrganizaciiEdit.edtNazvaOrganizacii.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtPosadaOsobi.Text='' then
    begin
      frmOrganizaciiEdit.edtPosadaOsobi.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtPIBOsobi.Text='' then
    begin
      frmOrganizaciiEdit.edtPIBOsobi.SetFocus;
      exit;
    end;

    with frmOrganizacii do
    begin
      qOrganizacii.SQL.Clear;
      qOrganizacii.SQL.Text:='update ORGANIZACII set KOD_ORGANIZACII=:KOD_ORGANIZACII,NAZVA_OGRANIZACII=:NAZVA_OGRANIZACII,POSADA_OSOBI=:POSADA_OSOBI,PIB_OSOBI=:PIB_OSOBI where RECORD_ID=:Kod';
      qOrganizacii.Params.Clear;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[0].Name:='KOD_ORGANIZACII';
      qOrganizacii.Params[0].Value:=frmOrganizaciiEdit.edtKodOrganizacii.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[1].Name:='NAZVA_OGRANIZACII';
      qOrganizacii.Params[1].Value:=frmOrganizaciiEdit.edtNazvaOrganizacii.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[2].Name:='POSADA_OSOBI';
      qOrganizacii.Params[2].Value:=frmOrganizaciiEdit.edtPosadaOsobi.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[3].Name:='PIB_OSOBI';
      qOrganizacii.Params[3].Value:=frmOrganizaciiEdit.edtPIBOsobi.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[4].Name:='Kod';
      qOrganizacii.Params[4].Value:=frmOrganizaciiEdit.edtRecord_ID.Text;
      qOrganizacii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmOrganizacii.aUpdateExecute(sender);
    frmOrganizaciiEdit.Close;
    exit;
  end;  //Редагування організації

  if frmOrganizaciiEdit.Caption='Додавання організації' then
  begin
    if frmOrganizaciiEdit.edtRecord_ID.Text='' then
    begin
      frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    try
      StrToInt(frmOrganizaciiEdit.edtRecord_ID.Text);
    except
      frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtKodOrganizacii.Text='' then
    begin
      frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    try
      StrToInt(frmOrganizaciiEdit.edtKodOrganizacii.Text);
    except
      frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
      frmOrganizaciiEdit.edtKodOrganizacii.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtNazvaOrganizacii.Text='' then
    begin
      frmOrganizaciiEdit.edtNazvaOrganizacii.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtPosadaOsobi.Text='' then
    begin
      frmOrganizaciiEdit.edtPosadaOsobi.SetFocus;
      exit;
    end;
    if frmOrganizaciiEdit.edtPIBOsobi.Text='' then
    begin
      frmOrganizaciiEdit.edtPIBOsobi.SetFocus;
      exit;
    end;

    with frmOrganizacii do
    begin
      qOrganizacii.SQL.Clear;
      qOrganizacii.SQL.Text:='update ORGANIZACII set KOD_ORGANIZACII=:KOD_ORGANIZACII,NAZVA_OGRANIZACII=:NAZVA_OGRANIZACII,POSADA_OSOBI=:POSADA_OSOBI,PIB_OSOBI=:PIB_OSOBI where RECORD_ID=:Kod';
      qOrganizacii.Params.Clear;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[0].Name:='KOD_ORGANIZACII';
      qOrganizacii.Params[0].Value:=frmOrganizaciiEdit.edtKodOrganizacii.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[1].Name:='NAZVA_OGRANIZACII';
      qOrganizacii.Params[1].Value:=frmOrganizaciiEdit.edtNazvaOrganizacii.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[2].Name:='POSADA_OSOBI';
      qOrganizacii.Params[2].Value:=frmOrganizaciiEdit.edtPosadaOsobi.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[3].Name:='PIB_OSOBI';
      qOrganizacii.Params[3].Value:=frmOrganizaciiEdit.edtPIBOsobi.Text;
      qOrganizacii.Params.Add;
      qOrganizacii.Params[4].Name:='Kod';
      qOrganizacii.Params[4].Value:=frmOrganizaciiEdit.edtRecord_ID.Text;
      qOrganizacii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmOrganizacii.aUpdateExecute(sender);
    frmOrganizaciiEdit.Close;
    exit;
  end;  //Додавання організації
end;

procedure TfrmOrganizaciiEdit.aCancelExecute(Sender: TObject);
begin
  frmOrganizaciiEdit.Close;
end;

end.
