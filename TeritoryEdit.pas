unit TeritoryEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, SysUtils, Dialogs;

type
  TfrmTeritoryEdit = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    edtTeritory: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alTeritoryEdit: TActionList;
    aKodUpdate: TAction;
    qTeritoryUpdates: TIBQuery;
    aCancel: TAction;
    aOK: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmTeritoryEdit: TfrmTeritoryEdit;

implementation

uses
  Main, PosadiEdit, Teritory, ViddilennyEdit, RajoniEdit,
  SpivrobitnikiEdit, Ministry;

{$R *.dfm}

procedure TfrmTeritoryEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmPosadiEdit') then
  begin
    frmPosadiEdit.Enabled:=true;
    if frmTeritoryEdit.Caption<>'Вибрати територію' then
    begin
      frmTeritory.Enabled:=true;
      frmPosadiEdit.Enabled:=false;
    end
    else
      frmTeritory.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViddilennyEdit') then
  begin
    frmTeritory.Enabled:=true;
    if frmTeritoryEdit.Caption<>'Вибрати територію' then
    begin
      frmTeritory.Enabled:=true;
      frmViddilennyEdit.Enabled:=false;
    end
    else
      frmTeritory.Close;
    frmViddilennyEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmRajoniEdit') then
  begin
    frmTeritory.Enabled:=true;
    if frmTeritoryEdit.Caption<>'Вибрати територію' then
    begin
      frmTeritory.Enabled:=true;
      frmRajoniEdit.Enabled:=false;
    end
    else
      frmTeritory.Close;
    frmMain.Enabled:=false;
    frmRajoniEdit.Enabled:=true;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmTeritory.Enabled:=true;
    if frmTeritoryEdit.Caption<>'Вибрати територію' then
    begin
      frmTeritory.Enabled:=true;
      frmPosadiEdit.Enabled:=false;
    end
    else
      frmTeritory.Close;
    frmMain.Enabled:=false;
    frmSpivrobitnikiEdit.Enabled:=true;
    Action:=caFree;
    exit;
  end;
}

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmTeritoryEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmTeritoryEdit do
  begin
    qTeritoryUpdates.SQL.Clear;
    qTeritoryUpdates.SQL.Text:='insert into TERITORY (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTeritoryUpdates.Open;
    qTeritoryUpdates.SQL.Clear;
    qTeritoryUpdates.SQL.Text:='select * from TERITORY order by TERITORY';
    qTeritoryUpdates.Open;
    edtKod.Text:=IntToStr(qTeritoryUpdates.FieldByName('KOD').Value);
  end;
end;

procedure TfrmTeritoryEdit.aCancelExecute(Sender: TObject);
begin
  frmTeritoryEdit.Close;
end;

procedure TfrmTeritoryEdit.aOKExecute(Sender: TObject);
begin
  if frmTeritoryEdit.Caption='Вибрати територію' then
  begin
{
//    if frmMain.IsFormOpen('frmPosadiEdit') then
//    begin
//      frmPosadiEdit.cbTeritory.Text:=frmTeritoryEdit.edtTeritory.Text;
//      frmTeritoryEdit.Close;
//      frmTeritory.Close;
//      frmPosadiEdit.aTeritoryChangeExecute(sender);
//      exit;
//    end;

//    if frmMain.IsFormOpen('frmViddilennyEdit') then
//    begin
//      frmViddilennyEdit.cbTeritory.Text:=frmTeritoryEdit.edtTeritory.Text;
//      frmTeritoryEdit.Close;
//      frmTeritory.Close;
//      frmViddilennyEdit.aTeritoryChangeExecute(sender);
//      exit;
//    end;

    if frmMain.IsFormOpen('frmRajoniEdit') then
    begin
      frmRajoniEdit.cbTeritory.Text:=frmTeritoryEdit.edtTeritory.Text;
      frmTeritoryEdit.Close;
      frmTeritory.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbTeritory.Text:=frmTeritoryEdit.edtTeritory.Text;
      frmTeritoryEdit.Close;
      frmTeritory.Close;
      frmSpivrobitnikiEdit.aTeritoryChangeExecute(sender);
      exit;
    end;
}
  end;

  if frmTeritoryEdit.Caption='Видалити територію' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на інших відомостях!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmTeritoryEdit.qTeritoryUpdates.SQL.Clear;
      frmTeritoryEdit.qTeritoryUpdates.SQL.Text:='delete from TERITORY where KOD=:Kod';
      frmTeritoryEdit.qTeritoryUpdates.Params.Clear;
      frmTeritoryEdit.qTeritoryUpdates.Params.Add;
      frmTeritoryEdit.qTeritoryUpdates.Params[0].Name:='Kod';
      frmTeritoryEdit.qTeritoryUpdates.Params[0].Value:=frmTeritoryEdit.edtKod.Text;
      frmTeritoryEdit.qTeritoryUpdates.Open;
      frmMain.trAzz.CommitRetaining;
      frmTeritoryEdit.Close;
      frmTeritory.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmTeritoryEdit.Caption='Редагувати територію' then
  begin
    if frmTeritoryEdit.edtKod.Text='' then
    begin
      frmTeritoryEdit.aKodUpdateExecute(sender);
      frmTeritoryEdit.edtTeritory.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmTeritoryEdit.edtKod.Text);
    except
      frmTeritoryEdit.aKodUpdateExecute(sender);
      frmTeritoryEdit.edtTeritory.SetFocus;
      exit;
    end;
    if frmTeritoryEdit.edtTeritory.Text='' then
    begin
      frmTeritoryEdit.edtTeritory.SetFocus;
      exit;
    end;
    frmTeritory.qTeritory.SQL.Clear;
    frmTeritory.qTeritory.SQL.Text:='update TERITORY set TERITORY=:Teritory where KOD=:Kod';
    frmTeritory.qTeritory.Params.Clear;
    frmTeritory.qTeritory.Params.Add;
    frmTeritory.qTeritory.Params[0].Name:='Teritory';
    frmTeritory.qTeritory.Params[0].Value:=frmTeritoryEdit.edtTeritory.Text;
    frmTeritory.qTeritory.Params.Add;
    frmTeritory.qTeritory.Params[1].Name:='Kod';
    frmTeritory.qTeritory.Params[1].Value:=frmTeritoryEdit.edtKod.Text;
    frmTeritory.qTeritory.Open;
    frmTeritoryEdit.Close;
    frmTeritory.aUpdateExecute(sender);
    exit;
  end;

  if frmTeritoryEdit.Caption='Додати територію' then
  begin
    if frmTeritoryEdit.edtKod.Text='' then
    begin
      frmTeritoryEdit.aKodUpdateExecute(sender);
      frmTeritoryEdit.edtTeritory.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmTeritoryEdit.edtKod.Text);
    except
      frmTeritoryEdit.aKodUpdateExecute(sender);
      frmTeritoryEdit.edtTeritory.SetFocus;
      exit;
    end;
    if frmTeritoryEdit.edtTeritory.Text='' then
    begin
      frmTeritoryEdit.edtTeritory.SetFocus;
      exit;
    end;
    frmTeritory.qTeritory.SQL.Clear;
    frmTeritory.qTeritory.SQL.Text:='update TERITORY set TERITORY=:Teritory where KOD=:Kod';
    frmTeritory.qTeritory.Params.Clear;
    frmTeritory.qTeritory.Params.Add;
    frmTeritory.qTeritory.Params[0].Name:='Teritory';
    frmTeritory.qTeritory.Params[0].Value:=frmTeritoryEdit.edtTeritory.Text;
    frmTeritory.qTeritory.Params.Add;
    frmTeritory.qTeritory.Params[1].Name:='Kod';
    frmTeritory.qTeritory.Params[1].Value:=frmTeritoryEdit.edtKod.Text;
    frmTeritory.qTeritory.Open;
    frmTeritoryEdit.Close;
    frmTeritory.aUpdateExecute(sender);
    exit;
  end;
end;

end.
