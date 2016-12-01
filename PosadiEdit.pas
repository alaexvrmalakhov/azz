unit PosadiEdit;

interface

uses
  Forms, Classes, ActnList, Controls, StdCtrls, SysUtils, Dialogs;

type
  TfrmPosadiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodPosadi: TEdit;
    edtNazvaposadi: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    edtNazvaposadi_RV: TEdit;
    edtNazvaposadi_TV: TEdit;
    btnVidminok: TButton;
    Label3: TLabel;
    Label4: TLabel;
    btnKodPosadi: TButton;
    Label5: TLabel;
    btnRajonUpdate: TButton;
    Label6: TLabel;
    Label7: TLabel;
    btnMinistryUpdate: TButton;
    btnTeritoryUpdate: TButton;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    alPosadiEdit: TActionList;
    aKodUpdate: TAction;
    aMinistrUpdate: TAction;
    aMinistryChange: TAction;
    aTeritoryUpdate: TAction;
    aTeritoryChange: TAction;
    aDistrictUpdate: TAction;
    aVidminokChange: TAction;
    aOK: TAction;
    aCancel: TAction;
    btnMinistryChoice: TButton;
    btnTeritoryChoice: TButton;
    btnRajonChoice: TButton;
    aMinistryChoice: TAction;
    aTeritoryChoice: TAction;
    aDistrictChoice: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aMinistrUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictUpdateExecute(Sender: TObject);
    procedure aVidminokChangeExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aMinistryChoiceExecute(Sender: TObject);
    procedure aTeritoryChoiceExecute(Sender: TObject);
    procedure aDistrictChoiceExecute(Sender: TObject);
  end;

var
  frmPosadiEdit: TfrmPosadiEdit;

implementation

uses
  Main, Posadi, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, Raport,
  Opechanuvanny, NapravlenoDoVidoma, NapravlennyEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, SpivrobitnikiEdit, Ministry,
  Teritory, Rajoni, Filter;

{$R *.dfm}

procedure TfrmPosadiEdit.FormClose(Sender: TObject;
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
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmPosadi.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmPosadi.Enabled:=true;
    frmFilter.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmPosadi.Enabled:=true;
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmRaport') then
  begin
    frmPosadi.Enabled:=true;
    frmRaport.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmRaport.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmPosadi.Enabled:=true;
    frmOpechanuvanny.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmOpechanuvanny.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
  begin
    frmNapravlenoDoVidoma.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmNapravlenoDoVidoma.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlennyEdit') then
  begin
    frmNapravlennyEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmNapravlennyEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmSpivrobitnikiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmSpivrobitnikiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=True;
  Action:=caFree;
end;

procedure TfrmPosadiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='insert into POSADI (KODPOSADI) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTeritory.Open;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from POSADI order by KODPOSADI';
    qTeritory.Open;
    qTeritory.Last;
    frmPosadiEdit.edtKodPosadi.Text:=IntToStr(qTeritory.FieldByName('KODPOSADI').Value);
  end;
end;

procedure TfrmPosadiEdit.aMinistrUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    frmPosadiEdit.cbMinistry.Text:='';
    frmPosadiEdit.cbMinistry.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmPosadiEdit.cbMinistry.Items.Add(qTeritory.FieldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    frmPosadiEdit.cbTeritory.Text:='';
    frmPosadiEdit.cbTeritory.Items.Clear;
    frmPosadiEdit.cbRajon.Text:='';
    frmPosadiEdit.cbRajon.Items.Clear;
  end;
end;

procedure TfrmPosadiEdit.aMinistryChangeExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmPosadiEdit.cbMinistry.Text;
    qTeritory.Open;
    frmPosadiEdit.cbTeritory.Text:='';
    frmPosadiEdit.cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmPosadiEdit.cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    frmPosadiEdit.cbRajon.Text:='';
    frmPosadiEdit.cbRajon.Items.Clear;
  end;
end;

procedure TfrmPosadiEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmPosadiEdit.cbMinistry.Text;
    qTeritory.Open;
    frmPosadiEdit.cbTeritory.Text:='';
    frmPosadiEdit.cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmPosadiEdit.cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    frmPosadiEdit.cbRajon.Text:='';
    frmPosadiEdit.cbRajon.Items.Clear;
  end;
end;

procedure TfrmPosadiEdit.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=frmPosadiEdit.cbTeritory.Text;
    qTeritory.Open;
    frmPosadiEdit.cbRajon.Text:='';
    frmPosadiEdit.cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmPosadiEdit.cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmPosadiEdit.aDistrictUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=frmPosadiEdit.cbTeritory.Text;
    qTeritory.Open;
    frmPosadiEdit.cbRajon.Text:='';
    frmPosadiEdit.cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmPosadiEdit.cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmPosadiEdit.aVidminokChangeExecute(Sender: TObject);
begin
  frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadiEdit.edtNazvaposadi.Text;
  frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadiEdit.edtNazvaposadi.Text;
end;

procedure TfrmPosadiEdit.aOKExecute(Sender: TObject);
var
  Ministry, Teritory, District: integer;
//  txt: string;
//  i: integer;
begin
  if frmPosadiEdit.Caption='Вибір посади' then
  begin
    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbPosadaSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFilter') then
    begin
      frmFilter.cbFilter.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmRaport') then
    begin
      frmRaport.cbPosadaPredstavnika.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmOpechanuvanny') then
    begin
      frmOpechanuvanny.cbPosadaPredstavnikaSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
    begin
      frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmNapravlennyEdit') then
    begin
      frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbPosadaOsobiSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.cbPosadaOsobiSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbPosada.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;
  end;

  if frmPosadiEdit.Caption='Видалення посади' then
  begin
    if MessageDlg('Видалення запису може відобразитись на інших даних!!!'+#13+'Ви дійсно бажаєте видалити запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmPosadi.qPosadi.SQL.Clear;
      frmPosadi.qPosadi.SQL.Text:='delete from POSADI where KODPOSADI=:Kod';
      frmPosadi.qPosadi.Params.Clear;
      frmPosadi.qPosadi.Params.Add;
      frmPosadi.qPosadi.Params[0].Name:='Kod';
      frmPosadi.qPosadi.Params[0].Value:=frmPosadiEdit.edtKodPosadi.Text;
      frmPosadi.qPosadi.Open;
      frmMain.trAzz.CommitRetaining;
      frmPosadiEdit.Close;
      frmPosadi.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmPosadiEdit.Caption='Редагування посади' then
  begin
    if frmPosadiEdit.edtKodPosadi.Text='' then
    begin
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmPosadiEdit.edtKodPosadi.Text);
    except
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;

    frmPosadi.qTeritory.SQL.Clear;
    frmPosadi.qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    frmPosadi.qTeritory.Open;
    if frmPosadiEdit.cbMinistry.Text='' then
    begin
      frmPosadiEdit.aMinistrUpdateExecute(sender);
      frmPosadiEdit.cbMinistry.SetFocus;
      exit;
    end;
    if frmPosadi.qTeritory.Locate('MINISTRY',frmPosadiEdit.cbMinistry.Text,[]) then Ministry:=frmPosadi.qTeritory.FieldByName('KOD').Value else Ministry:=0;

    frmPosadi.qTeritory.SQL.Clear;
    frmPosadi.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry order by TERITORY';
    frmPosadi.qTeritory.Params.Clear;
    frmPosadi.qTeritory.Params.Add;
    frmPosadi.qTeritory.Params[0].Name:='Ministry';
    frmPosadi.qTeritory.Params[0].Value:=Ministry;
    frmPosadi.qTeritory.Open;
    if frmPosadiEdit.cbTeritory.Text='' then
    begin
      frmPosadiEdit.aTeritoryUpdateExecute(sender);
      frmPosadiEdit.cbTeritory.SetFocus;
      exit;
    end;
    if frmPosadi.qTeritory.Locate('TERITORY',frmPosadiEdit.cbTeritory.Text,[]) then Teritory:=frmPosadi.qTeritory.FieldByName('KOD').Value else Teritory:=0;

    frmPosadi.qTeritory.SQL.Clear;
    frmPosadi.qTeritory.SQL.Text:='select * from RAJONI where TERITORY=:Teritory order by RAJON';
    frmPosadi.qTeritory.Params.Clear;
    frmPosadi.qTeritory.Params.Add;
    frmPosadi.qTeritory.Params[0].Name:='Teritory';
    frmPosadi.qTeritory.Params[0].Value:=Teritory;
    frmPosadi.qTeritory.Open;
    if frmPosadiEdit.cbRajon.Text='' then
    begin
      frmPosadiEdit.aDistrictUpdateExecute(sender);
      frmPosadiEdit.cbRajon.SetFocus;
      exit;
    end;
    if frmPosadi.qTeritory.Locate('RAJON',frmPosadiEdit.cbRajon.Text,[]) then District:=frmPosadi.qTeritory.FieldByName('KOD').Value else District:=0;

    if frmPosadiEdit.edtNazvaposadi.Text='' then
    begin
      frmPosadiEdit.edtNazvaposadi.SetFocus;
      exit;
    end;
    if (frmPosadiEdit.edtNazvaposadi_RV.Text='')or(frmPosadiEdit.edtNazvaposadi_TV.Text='') then
    begin
      frmPosadiEdit.aVidminokChangeExecute(sender);
      frmPosadiEdit.edtNazvaposadi_RV.SetFocus;
      exit;
    end;

    frmPosadi.qPosadi.SQL.Clear;
    frmPosadi.qPosadi.SQL.Text:='update POSADI set MINISTRY=:Ministry,TERITORY=:Teritory,RAJON=:Rajon,NAZVAPOSADI=:Nazva,NAZVAPOSADI_RV=:Nazva_RV,NAZVAPOSADI_TV=:Nazva_TV where KODPOSADI=:Kod';
    frmPosadi.qPosadi.Params.Clear;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[0].Name:='Ministry';
    frmPosadi.qPosadi.Params[0].Value:=Ministry;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[1].Name:='Teritory';
    frmPosadi.qPosadi.Params[1].Value:=Teritory;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[2].Name:='Rajon';
    frmPosadi.qPosadi.Params[2].Value:=District;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[3].Name:='Nazva';
    frmPosadi.qPosadi.Params[3].Value:=frmPosadiEdit.edtNazvaposadi.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[4].Name:='Nazva_RV';
    frmPosadi.qPosadi.Params[4].Value:=frmPosadiEdit.edtNazvaposadi_RV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[5].Name:='Nazva_TV';
    frmPosadi.qPosadi.Params[5].Value:=frmPosadiEdit.edtNazvaposadi_TV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[6].Name:='Kod';
    frmPosadi.qPosadi.Params[6].Value:=frmPosadiEdit.edtKodPosadi.Text;
    frmPosadi.qPosadi.Open;
    frmMain.trAzz.CommitRetaining;

    frmPosadiEdit.Close;
    frmPosadi.aUpdateExecute(sender);
    exit;
  end;

  if frmPosadiEdit.Caption='Додавання нової посади' then
  begin
    if frmPosadiEdit.edtKodPosadi.Text='' then
    begin
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmPosadiEdit.edtKodPosadi.Text);
    except
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;

    frmPosadi.qTeritory.SQL.Clear;
    frmPosadi.qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    frmPosadi.qTeritory.Open;
    if frmPosadiEdit.cbMinistry.Text='' then
    begin
      frmPosadiEdit.aMinistrUpdateExecute(sender);
      frmPosadiEdit.cbMinistry.SetFocus;
      exit;
    end;
    if frmPosadi.qTeritory.Locate('MINISTRY',frmPosadiEdit.cbMinistry.Text,[]) then Ministry:=frmPosadi.qTeritory.FieldByName('KOD').Value else Ministry:=0;

    frmPosadi.qTeritory.SQL.Clear;
    frmPosadi.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry order by TERITORY';
    frmPosadi.qTeritory.Params.Clear;
    frmPosadi.qTeritory.Params.Add;
    frmPosadi.qTeritory.Params[0].Name:='Ministry';
    frmPosadi.qTeritory.Params[0].Value:=Ministry;
    frmPosadi.qTeritory.Open;
    if frmPosadiEdit.cbTeritory.Text='' then
    begin
      frmPosadiEdit.aTeritoryUpdateExecute(sender);
      frmPosadiEdit.cbTeritory.SetFocus;
      exit;
    end;
    if frmPosadi.qTeritory.Locate('TERITORY',frmPosadiEdit.cbTeritory.Text,[]) then Teritory:=frmPosadi.qTeritory.FieldByName('KOD').Value else Teritory:=0;

    frmPosadi.qTeritory.SQL.Clear;
    frmPosadi.qTeritory.SQL.Text:='select * from RAJONI where TERITORY=:Teritory order by RAJON';
    frmPosadi.qTeritory.Params.Clear;
    frmPosadi.qTeritory.Params.Add;
    frmPosadi.qTeritory.Params[0].Name:='Teritory';
    frmPosadi.qTeritory.Params[0].Value:=Teritory;
    frmPosadi.qTeritory.Open;
    if frmPosadiEdit.cbRajon.Text='' then
    begin
      frmPosadiEdit.aDistrictUpdateExecute(sender);
      frmPosadiEdit.cbRajon.SetFocus;
      exit;
    end;
    if frmPosadi.qTeritory.Locate('RAJON',frmPosadiEdit.cbRajon.Text,[]) then District:=frmPosadi.qTeritory.FieldByName('KOD').Value else District:=0;

    if frmPosadiEdit.edtNazvaposadi.Text='' then
    begin
      frmPosadiEdit.edtNazvaposadi.SetFocus;
      exit;
    end;
    if (frmPosadiEdit.edtNazvaposadi_RV.Text='')or(frmPosadiEdit.edtNazvaposadi_TV.Text='') then
    begin
      frmPosadiEdit.aVidminokChangeExecute(sender);
      frmPosadiEdit.edtNazvaposadi_RV.SetFocus;
      exit;
    end;

    frmPosadi.qPosadi.SQL.Clear;
    frmPosadi.qPosadi.SQL.Text:='update POSADI set MINISTRY=:Ministry,TERITORY=:Teritory,RAJON=:Rajon,NAZVAPOSADI=:Nazva,NAZVAPOSADI_RV=:Nazva_RV,NAZVAPOSADI_TV=:Nazva_TV where KODPOSADI=:Kod';
    frmPosadi.qPosadi.Params.Clear;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[0].Name:='Ministry';
    frmPosadi.qPosadi.Params[0].Value:=Ministry;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[1].Name:='Teritory';
    frmPosadi.qPosadi.Params[1].Value:=Teritory;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[2].Name:='Rajon';
    frmPosadi.qPosadi.Params[2].Value:=District;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[3].Name:='Nazva';
    frmPosadi.qPosadi.Params[3].Value:=frmPosadiEdit.edtNazvaposadi.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[4].Name:='Nazva_RV';
    frmPosadi.qPosadi.Params[4].Value:=frmPosadiEdit.edtNazvaposadi_RV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[5].Name:='Nazva_TV';
    frmPosadi.qPosadi.Params[5].Value:=frmPosadiEdit.edtNazvaposadi_TV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[6].Name:='Kod';
    frmPosadi.qPosadi.Params[6].Value:=frmPosadiEdit.edtKodPosadi.Text;
    frmPosadi.qPosadi.Open;
    frmMain.trAzz.CommitRetaining;

    frmPosadiEdit.Close;
    frmPosadi.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmPosadiEdit.aCancelExecute(Sender: TObject);
begin
  frmPosadiEdit.Close;
end;

procedure TfrmPosadiEdit.aMinistryChoiceExecute(Sender: TObject);
begin
  frmPosadiEdit.Enabled:=false;
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

procedure TfrmPosadiEdit.aTeritoryChoiceExecute(Sender: TObject);
begin
  frmPosadiEdit.Enabled:=false;
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

procedure TfrmPosadiEdit.aDistrictChoiceExecute(Sender: TObject);
begin
  frmPosadiEdit.Enabled:=false;
  frmMain.aDistrictExecute(sender);
  frmRajoni.aChoice.Enabled:=true;
  frmRajoni.Left:=frmMain.Left+70;
  frmRajoni.Top:=frmMain.Top+70;
  frmRajoni.Width:=frmMain.Width-70;
  frmRajoni.Height:=frmMain.Height-70;
  frmRajoni.Position:=poMainFormCenter;
  frmRajoni.FormStyle:=fsNormal;
  frmRajoni.BorderStyle:=bsDialog;
end;

end.
