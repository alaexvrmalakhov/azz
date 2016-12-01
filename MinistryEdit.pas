unit MinistryEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmMinistryEdit = class(TForm)
    Label1: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    Label2: TLabel;
    edtMinistry: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    alMinistryEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmMinistryEdit: TfrmMinistryEdit;

implementation

uses
  Main, Ministry, PosadiEdit, ViddilennyEdit, RajoniEdit, TeritoryEdit,
  SpivrobitnikiEdit;

{$R *.dfm}

procedure TfrmMinistryEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmPosadiEdit') then
  begin
    frmPosadiEdit.Enabled:=true;
    if frmMinistryEdit.Caption<>'Вибрати міністерство' then
    begin
      frmMinistry.Enabled:=true;
      frmPosadiEdit.Enabled:=false;
    end
    else
      frmMinistry.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViddilennyEdit') then
  begin
    frmViddilennyEdit.Enabled:=true;
    if frmMinistryEdit.Caption<>'Вибрати міністерство' then
    begin
      frmMinistry.Enabled:=true;
      frmViddilennyEdit.Enabled:=false;
    end
    else
      frmMinistry.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmRajoniEdit') then
  begin
    frmRajoniEdit.Enabled:=true;
    if frmMinistryEdit.Caption<>'Вибрати міністерство' then
    begin
      frmMinistry.Enabled:=true;
      frmRajoniEdit.Enabled:=false;
    end
    else
      frmMinistry.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmTeritoryEdit') then
  begin
    frmTeritoryEdit.Enabled:=true;
    if frmMinistryEdit.Caption<>'Вибрати міністерство' then
    begin
      frmMinistry.Enabled:=true;
      frmTeritoryEdit.Enabled:=false;
    end
    else
      frmMinistry.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmSpivrobitnikiEdit.Enabled:=true;
    if frmMinistryEdit.Caption<>'Вибрати міністерство' then
    begin
      frmMinistry.Enabled:=true;
      frmSpivrobitnikiEdit.Enabled:=false;
    end
    else
      frmMinistry.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmMinistryEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmMinistry do
  begin
    qMinistry.SQL.Clear;
    qMinistry.SQL.Text:='insert into MINISTRY (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qMinistry.Open;
    qMinistry.SQL.Clear;
    qMinistry.SQL.Text:='select * from MINISTRY order by KOD';
    qMinistry.Open;
    qMinistry.Last;
    frmMinistryEdit.edtKod.Text:=IntToStr(qMinistry.FieldByName('KOD').Value);
  end;
end;

procedure TfrmMinistryEdit.aCancelExecute(Sender: TObject);
begin
  frmMinistryEdit.Close;
end;

procedure TfrmMinistryEdit.aOKExecute(Sender: TObject);
begin
  if frmMinistryEdit.Caption='Вибрати міністерство' then
  begin
    if frmMain.IsFormOpen('frmPosadiEdit') then
    begin
      frmPosadiEdit.cbMinistry.Text:=frmMinistryEdit.edtMinistry.Text;
      frmMinistryEdit.Close;
      frmMinistry.Close;
      frmPosadiEdit.aMinistryChangeExecute(sender);
      exit;
    end;

{
    if frmMain.IsFormOpen('frmViddilennyEdit') then
    begin
      frmViddilennyEdit.cbMinistry.Text:=frmMinistryEdit.edtMinistry.Text;
      frmMinistryEdit.Close;
      frmMinistry.Close;
      frmViddilennyEdit.aMinistryChangeExecute(sender);
      exit;
    end;
}

    if frmMain.IsFormOpen('frmRajoniEdit') then
    begin
      frmRajoniEdit.cbMinistry.Text:=frmMinistryEdit.edtMinistry.Text;
      frmMinistryEdit.Close;
      frmMinistry.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmTeritoryEdit') then
    begin
      frmTeritoryEdit.cbMinistry.Text:=frmMinistryEdit.edtMinistry.Text;
      frmMinistryEdit.Close;
      frmMinistry.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbMinistry.Text:=frmMinistryEdit.edtMinistry.Text;
      frmMinistryEdit.Close;
      frmMinistry.Close;
      frmSpivrobitnikiEdit.aMinistryChangeExecute(sender);
      exit;
    end;
  end;

  if frmMinistryEdit.Caption='Видалити міністерство' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на інших відомостях!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmMinistry.qMinistry.SQL.Clear;
      frmMinistry.qMinistry.SQL.Text:='delete from MINISTRY where KOD=:Kod';
      frmMinistry.qMinistry.Params.Clear;
      frmMinistry.qMinistry.Params.Add;
      frmMinistry.qMinistry.Params[0].Name:='Kod';
      frmMinistry.qMinistry.Params[0].Value:=frmMinistryEdit.edtKod.Text;
      frmMinistry.qMinistry.Open;
      frmMain.trAzz.CommitRetaining;
    end;
    frmMinistryEdit.Close;
    frmMinistry.aUpdateExecute(sender);
    exit;
  end;

  if frmMinistryEdit.Caption='Редагувати міністерство' then
  begin
    if frmMinistryEdit.edtKod.Text='' then
    begin
      frmMinistryEdit.aKodUpdateExecute(sender);
      frmMinistryEdit.edtMinistry.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmMinistryEdit.edtKod.Text);
    except
      frmMinistryEdit.aKodUpdateExecute(sender);
      frmMinistryEdit.edtMinistry.SetFocus;
      exit;
    end;
    if frmMinistryEdit.edtMinistry.Text='' then
    begin
      frmMinistryEdit.edtMinistry.SetFocus;
      exit;
    end;
    frmMinistry.qMinistry.SQL.Clear;
    frmMinistry.qMinistry.SQL.Text:='update MINISTRY set MINISTRY=:Ministry where KOD=:Kod';
    frmMinistry.qMinistry.Params.Clear;
    frmMinistry.qMinistry.Params.Add;
    frmMinistry.qMinistry.Params[0].Name:='Ministry';
    frmMinistry.qMinistry.Params[0].Value:=frmMinistryEdit.edtMinistry.Text;
    frmMinistry.qMinistry.Params.Add;
    frmMinistry.qMinistry.Params[1].Name:='Kod';
    frmMinistry.qMinistry.Params[1].Value:=frmMinistryEdit.edtKod.Text;
    frmMinistry.qMinistry.Open;
    frmMain.trAzz.CommitRetaining;
    frmMinistryEdit.Close;
    frmMinistry.aUpdateExecute(sender);
    exit;
  end;

  if frmMinistryEdit.Caption='Додати міністерство' then
  begin
    if frmMinistryEdit.edtKod.Text='' then
    begin
      frmMinistryEdit.aKodUpdateExecute(sender);
      frmMinistryEdit.edtMinistry.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmMinistryEdit.edtKod.Text);
    except
      frmMinistryEdit.aKodUpdateExecute(sender);
      frmMinistryEdit.edtMinistry.SetFocus;
      exit;
    end;
    if frmMinistryEdit.edtMinistry.Text='' then
    begin
      frmMinistryEdit.edtMinistry.SetFocus;
      exit;
    end;
    frmMinistry.qMinistry.SQL.Clear;
    frmMinistry.qMinistry.SQL.Text:='update MINISTRY set MINISTRY=:Ministry where KOD=:Kod';
    frmMinistry.qMinistry.Params.Clear;
    frmMinistry.qMinistry.Params.Add;
    frmMinistry.qMinistry.Params[0].Name:='Ministry';
    frmMinistry.qMinistry.Params[0].Value:=frmMinistryEdit.edtMinistry.Text;
    frmMinistry.qMinistry.Params.Add;
    frmMinistry.qMinistry.Params[1].Name:='Kod';
    frmMinistry.qMinistry.Params[1].Value:=frmMinistryEdit.edtKod.Text;
    frmMinistry.qMinistry.Open;
    frmMain.trAzz.CommitRetaining;
    frmMinistryEdit.Close;
    frmMinistry.aUpdateExecute(sender);
    exit;
  end;
end;

end.
