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
    Label4: TLabel;
    cbMinistry: TComboBox;
    btnMinistryUpdate: TButton;
    btnMinistryChoice: TButton;
    btnTeritoryChoice: TButton;
    aMinistryUpdate: TAction;
    aMinistryChoice: TAction;
    aTeritoryChoice: TAction;
    aMinistryChange: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aMinistryUpdateExecute(Sender: TObject);
    procedure aMinistryChoiceExecute(Sender: TObject);
    procedure aTeritoryChoiceExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
  end;

var
  frmRajoniEdit: TfrmRajoniEdit;

implementation

uses
  Main, PosadiEdit, SpivrobitnikiEdit, Rajoni, ViddilennyEdit, Ministry,
  Teritory;

{$R *.dfm}

procedure TfrmRajoniEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRajoniEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qDistrict.SQL.Clear;
    qDistrict.SQL.Text:='insert into RAJONI (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qDistrict.Open;
    qDistrict.SQL.Clear;
    qDistrict.SQL.Text:='select * from RAJONI order by KOD';
    qDistrict.Open;
    qDistrict.Last;
    frmRajoniEdit.edtKod.Text:=IntToStr(qDistrict.FieldByName('KOD').Value);
  end;
end;

procedure TfrmRajoniEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY, MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmRajoniEdit.cbMinistry.Text;
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
  Ministry,Teritory: integer;
begin
  if frmRajoniEdit.Caption='Вибрати район' then
  begin
    if frmMain.IsFormOpen('frmPosadiEdit') then
    begin
      frmPosadiEdit.cbRajon.Text:=frmRajoniEdit.edtRajon.Text;
      frmRajoniEdit.Close;
      frmRajoni.Close;
      exit;
    end;
    if frmMain.IsFormOpen('frmViddilennyEdit') then
    begin
      frmViddilennyEdit.cbRajon.Text:=frmRajoniEdit.edtRajon.Text;
      frmRajoniEdit.Close;
      frmRajoni.Close;
      exit;
    end;
    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbRajon.Text:=frmRajoniEdit.edtRajon.Text;
      frmRajoniEdit.Close;
      frmRajoni.Close;
      frmSpivrobitnikiEdit.aRajonChangeExecute(sender);
      exit;
    end;
  end;

  if frmRajoniEdit.Caption='Видалити район' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на інших відомостях!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmRajoni.qDistrict.SQL.Clear;
      frmRajoni.qDistrict.SQL.Text:='delete from RAJONI where KOD=:Kod';
      frmRajoni.qDistrict.Params.Clear;
      frmRajoni.qDistrict.Params.Add;
      frmRajoni.qDistrict.Params[0].Name:='Kod';
      frmRajoni.qDistrict.Params[0].Value:=frmRajoniEdit.edtKod.Text;
      frmRajoni.qDistrict.Open;
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
    if frmRajoniEdit.cbMinistry.Text='' then
    begin
      frmRajoniEdit.aMinistryUpdateExecute(sender);
      frmRajoniEdit.cbMinistry.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmRajoni.qTeritory.Params.Clear;
    frmRajoni.qTeritory.Params.Add;
    frmRajoni.qTeritory.Params[0].Name:='Ministry';
    frmRajoni.qTeritory.Params[0].Value:=frmRajoni.cbMinistry.Text;
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=frmRajoni.qTeritory.FieldByName('KOD').Value else Ministry:=0;
    if frmRajoniEdit.cbTeritory.Text='' then
    begin
      frmRajoniEdit.aTeritoryUpdateExecute(sender);
      frmRajoniEdit.cbTeritory.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from TERITORY, MINISTRY where TERITORY.MINISTRY=:Ministry order by TERITORY.TERITORY';
    frmRajoni.qTeritory.Params.Clear;
    frmRajoni.qTeritory.Params.Add;
    frmRajoni.qTeritory.Params[0].Name:='Ministry';
    frmRajoni.qTeritory.Params[0].Value:=Ministry;
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('TERITORY',frmRajoniEdit.cbTeritory.Text,[]) then Teritory:=frmRajoni.qTeritory.FieldByName('KOD').Value else Teritory:=0;
    if frmRajoniEdit.edtRajon.Text='' then
    begin
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    with frmRajoni.qDistrict do
    begin
      SQL.Clear;
      SQL.Text:='update RAJONI set MINISTRY=:Ministry,TERITORY=:Teritory,RAJON=:Rajon where KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmRajoniEdit.edtRajon.Text;
      Params.Add;
      Params[3].Name:='Kod';
      Params[3].Value:=frmRajoniEdit.edtKod.Text;
    end;
    frmRajoni.qDistrict.Open;
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
    if frmRajoniEdit.cbMinistry.Text='' then
    begin
      frmRajoniEdit.aMinistryUpdateExecute(sender);
      frmRajoniEdit.cbMinistry.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmRajoni.qTeritory.Params.Clear;
    frmRajoni.qTeritory.Params.Add;
    frmRajoni.qTeritory.Params[0].Name:='Ministry';
    frmRajoni.qTeritory.Params[0].Value:=frmRajoni.cbMinistry.Text;
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=frmRajoni.qTeritory.FieldByName('KOD').Value else Ministry:=0;
    if frmRajoniEdit.cbTeritory.Text='' then
    begin
      frmRajoniEdit.aTeritoryUpdateExecute(sender);
      frmRajoniEdit.cbTeritory.SetFocus;
      exit;
    end;
    frmRajoni.qTeritory.SQL.Clear;
    frmRajoni.qTeritory.SQL.Text:='select * from TERITORY, MINISTRY where TERITORY.MINISTRY=:Ministry order by TERITORY.TERITORY';
    frmRajoni.qTeritory.Params.Clear;
    frmRajoni.qTeritory.Params.Add;
    frmRajoni.qTeritory.Params[0].Name:='Ministry';
    frmRajoni.qTeritory.Params[0].Value:=Ministry;
    frmRajoni.qTeritory.Open;
    if frmRajoni.qTeritory.Locate('TERITORY',frmRajoniEdit.cbTeritory.Text,[]) then Teritory:=frmRajoni.qTeritory.FieldByName('KOD').Value else Teritory:=0;
    if frmRajoniEdit.edtRajon.Text='' then
    begin
      frmRajoniEdit.edtRajon.SetFocus;
      exit;
    end;
    with frmRajoni.qDistrict do
    begin
      SQL.Clear;
      SQL.Text:='update RAJONI set MINISTRY=:Ministry,TERITORY=:Teritory,RAJON=:Rajon where KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmRajoniEdit.edtRajon.Text;
      Params.Add;
      Params[3].Name:='Kod';
      Params[3].Value:=frmRajoniEdit.edtKod.Text;
    end;
    frmRajoni.qDistrict.Open;
    frmMain.trAzz.CommitRetaining;
    frmRajoniEdit.Close;
    frmRajoni.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmRajoniEdit.aMinistryUpdateExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    frmRajoniEdit.cbMinistry.Text:='';
    frmRajoniEdit.cbMinistry.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmRajoniEdit.cbMinistry.Items.Add(frmRajoni.qTeritory.FIeldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    frmRajoniEdit.cbTeritory.Text:='';
    frmRajoniEdit.cbTeritory.Items.Clear;
  end;
end;

procedure TfrmRajoniEdit.aMinistryChoiceExecute(Sender: TObject);
begin
  frmRajoniEdit.Enabled:=false;
  frmMain.aMinistryExecute(sender);
  frmMinistry.aChoice.Enabled:=true;
  frmMinistry.Left:=frmMain.Left+70;
  frmMinistry.Top:=frmMain.Top+70;
  frmMinistry.Width:=frmMain.Width-70;
  frmMinistry.Height:=frmMain.Height-70;
  frmMinistry.Position:=poMainFormCenter;
  frmMinistry.FormStyle:=fsNormal;
  frmMinistry.BorderStyle:=bsDialog;
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

procedure TfrmRajoniEdit.aMinistryChangeExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY, MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmRajoniEdit.cbMinistry.Text;
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

end.
