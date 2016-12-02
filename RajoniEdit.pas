unit RajoniEdit;

interface

uses
  Forms, Classes, ActnList, Controls, StdCtrls, SysUtils, Dialogs;

type
  TfrmRajoniEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    edtRajon: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label3: TLabel;
    cbTeritory: TComboBox;
    btnTeritoryUpdate: TButton;
    alDistrictEdit: TActionList;
    aKodUpdate: TAction;
    aTeritoryUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    btnTeritoryChoice: TButton;
    aTeritoryChoice: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aTeritoryChoiceExecute(Sender: TObject);
  end;

var
  frmRajoniEdit: TfrmRajoniEdit;

implementation

uses
  Main, PosadiEdit, SpivrobitnikiEdit, Rajoni, ViddilennyEdit, Ministry,
  Teritory, DB;

{$R *.dfm}

procedure TfrmRajoniEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmPosadiEdit') then
  begin
    frmPosadiEdit.Enabled:=true;
    if frmRajoniEdit.Caption<>'Вибрати район' then
    begin
      frmRajoni.Enabled:=true;
      frmPosadiEdit.Enabled:=false;
    end
    else
      frmRajoni.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViddilennyEdit') then
  begin
    frmViddilennyEdit.Enabled:=true;
    if frmRajoniEdit.Caption<>'Вибрати район' then
    begin
      frmRajoni.Enabled:=true;
      frmViddilennyEdit.Enabled:=false;
    end
    else
      frmRajoni.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmSpivrobitnikiEdit.Enabled:=true;
    if frmRajoniEdit.Caption<>'Вибрати район' then
    begin
      frmRajoni.Enabled:=true;
      frmSpivrobitnikiEdit.Enabled:=false;
    end
    else
      frmRajoni.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;
}
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRajoniEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='insert into RAJONI (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTeritory.Open;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI order by KOD';
    qTeritory.Open;
    qTeritory.Last;
    frmRajoniEdit.edtKod.Text:=IntToStr(qTeritory.FieldByName('KOD').Value);
  end;
end;

procedure TfrmRajoniEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where not TERITORY is null order by TERITORY';
    qTeritory.Open;
    frmRajoniEdit.cbTeritory.Text:='';
    frmRajoniEdit.cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmRajoniEdit.cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmRajoniEdit.aCancelExecute(Sender: TObject);
begin
  frmRajoniEdit.Close;
end;

procedure TfrmRajoniEdit.aOKExecute(Sender: TObject);
var
  Teritory: integer;
begin
  if frmRajoniEdit.Caption='Вибрати район' then
  begin
{
//    if frmMain.IsFormOpen('frmPosadiEdit') then
//    begin
//      frmPosadiEdit.cbRajon.Text:=frmRajoniEdit.edtRajon.Text;
//      frmRajoniEdit.Close;
//      frmRajoni.Close;
//      exit;
//    end;

//    if frmMain.IsFormOpen('frmViddilennyEdit') then
//    begin
//      frmViddilennyEdit.cbRajon.Text:=frmRajoniEdit.edtRajon.Text;
//      frmRajoniEdit.Close;
//      frmRajoni.Close;
//      exit;
//    end;

    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbRajon.Text:=frmRajoniEdit.edtRajon.Text;
      frmRajoniEdit.Close;
      frmRajoni.Close;
      frmSpivrobitnikiEdit.aRajonChangeExecute(sender);
      exit;
    end;
}
  end;

  if frmRajoniEdit.Caption='Видалити район' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на інших відомостях!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmRajoni.qTeritory.SQL.Clear;
      frmRajoni.qTeritory.SQL.Text:='delete from RAJONI where KOD=:Kod';
      frmRajoni.qTeritory.Params.Clear;
      frmRajoni.qTeritory.Params.Add;
      frmRajoni.qTeritory.Params[0].Name:='Kod';
      frmRajoni.qTeritory.Params[0].Value:=frmRajoniEdit.edtKod.Text;
      frmRajoni.qTeritory.Open;
      frmMain.trAzz.CommitRetaining;
      frmRajoniEdit.Close;
      frmRajoni.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmRajoniEdit.Caption='Редагувати район' then
  begin
    if frmRajoniEdit.edtKod.Text='' then
    begin
      frmRajoniEdit.aKodUpdateExecute(sender);
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmRajoniEdit.edtKod.Text);
    except
      frmRajoniEdit.aKodUpdateExecute(sender);
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    if frmRajoniEdit.cbTeritory.Text='' then
    begin
      frmRajoniEdit.aTeritoryUpdateExecute(sender);
      frmRajoniEdit.cbTeritory.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from TERITORY order by TERITORY';
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('TERITORY',frmRajoniEdit.cbTeritory.Text,[]) then Teritory:=frmRajoni.qTeritory.FieldByName('KOD').Value else Teritory:=0;
    if frmRajoniEdit.edtRajon.Text='' then
    begin
      frmRajoniEdit.aTeritoryUpdateExecute(sender);
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from TERITORY order by TERITORY';
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('TERITORY',frmRajoniEdit.cbTeritory.Text,[]) then Teritory:=frmRajoni.qTeritory.FieldByName('KOD').Value else Teritory:=0;
    if frmRajoniEdit.edtRajon.Text='' then
    begin
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    with frmRajoni.qTeritory do
    begin
      SQL.Clear;
      SQL.Text:='update RAJONI set TERITORY=:Teritory,RAJON=:Rajon where KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Teritory';
      Params[0].Value:=Teritory;
      Params.Add;
      Params[1].Name:='Rajon';
      Params[1].Value:=frmRajoniEdit.edtRajon.Text;
      Params.Add;
      Params[2].Name:='Kod';
      Params[2].Value:=frmRajoniEdit.edtKod.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmRajoniEdit.Close;
    frmRajoni.aUpdateExecute(sender);
    exit;
  end;

  if frmRajoniEdit.Caption='Додати район' then
  begin
    if frmRajoniEdit.edtKod.Text='' then
    begin
      frmRajoniEdit.aKodUpdateExecute(sender);
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmRajoniEdit.edtKod.Text);
    except
      frmRajoniEdit.aKodUpdateExecute(sender);
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    if frmRajoniEdit.cbTeritory.Text='' then
    begin
      frmRajoniEdit.aTeritoryUpdateExecute(sender);
      frmRajoniEdit.cbTeritory.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from TERITORY order by TERITORY';
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('TERITORY',frmRajoniEdit.cbTeritory.Text,[]) then Teritory:=frmRajoni.qTeritory.FieldByName('KOD').Value else Teritory:=0;
    if frmRajoniEdit.edtRajon.Text='' then
    begin
      frmRajoniEdit.aTeritoryUpdateExecute(sender);
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from TERITORY order by TERITORY';
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('TERITORY',frmRajoniEdit.cbTeritory.Text,[]) then Teritory:=frmRajoni.qTeritory.FieldByName('KOD').Value else Teritory:=0;
    if frmRajoniEdit.edtRajon.Text='' then
    begin
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    with frmRajoni.qTeritory do
    begin
      SQL.Clear;
      SQL.Text:='update RAJONI set TERITORY=:Teritory,RAJON=:Rajon where KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Teritory';
      Params[0].Value:=Teritory;
      Params.Add;
      Params[1].Name:='Rajon';
      Params[1].Value:=frmRajoniEdit.edtRajon.Text;
      Params.Add;
      Params[2].Name:='Kod';
      Params[2].Value:=frmRajoniEdit.edtKod.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmRajoniEdit.Close;
    frmRajoni.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmRajoniEdit.aTeritoryChoiceExecute(Sender: TObject);
begin
  frmRajoniEdit.Enabled:=false;
  frmMain.aTeritoryExecute(sender);
  frmTeritory.aChoice.Enabled:=true;
  frmTeritory.Left:=frmMain.Left+70;
  frmTeritory.Top:=frmMain.Top+70;
  frmTeritory.Width:=frmMain.Width-70;
  frmTeritory.Height:=frmMain.Height-70;
  frmTeritory.Position:=poMainFormCenter;
  frmTeritory.FormStyle:=fsNormal;
  frmTeritory.BorderStyle:=bsDialog;
end;

end.
