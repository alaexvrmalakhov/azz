unit SpivrobitnikiEdit;

interface

uses
  Forms, Classes, ActnList, Controls, StdCtrls, SysUtils, Dialogs;

type
  TfrmSpivrobitnikiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtKodSpivrobitnika: TEdit;
    edtPrizvische: TEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    Label4: TLabel;
    btnPosadaUpdate: TButton;
    edtPrizvische_RV: TEdit;
    edtPrizvische_TV: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    btnVidminok: TButton;
    Label7: TLabel;
    btnRajonUpdate: TButton;
    Label9: TLabel;
    btnKodSpivrobitnika: TButton;
    cbTeritory: TComboBox;
    btnTeritoryUpdate: TButton;
    cbRajon: TComboBox;
    cbViddilenny: TComboBox;
    btnViddilennyUpdate: TButton;
    cbPosada: TComboBox;
    alSpivrobitnikiEdit: TActionList;
    aKodUpdate: TAction;
    aTeritoryUpdate: TAction;
    aTeritoryChange: TAction;
    aRajonUpdate: TAction;
    aViddilennyUpdate: TAction;
    aPosadaUpdate: TAction;
    aVidminokChange: TAction;
    aOK: TAction;
    aCancel: TAction;
    btnTeritoryChoice: TButton;
    btnRajonChoice: TButton;
    btnViddilennyChoice: TButton;
    btnPosadaChoice: TButton;
    aTeritoryChoice: TAction;
    aRajonChoice: TAction;
    aViddilennyChoice: TAction;
    aPosadaChoice: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aRajonUpdateExecute(Sender: TObject);
    procedure aViddilennyUpdateExecute(Sender: TObject);
    procedure aPosadaUpdateExecute(Sender: TObject);
    procedure aVidminokChangeExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aTeritoryChoiceExecute(Sender: TObject);
    procedure aRajonChoiceExecute(Sender: TObject);
    procedure aViddilennyChoiceExecute(Sender: TObject);
    procedure aPosadaChoiceExecute(Sender: TObject);
  public
    viddilenny: string;
    posada: string;
    vidd_bool: boolean;
    pos_bool: boolean;
  end;

var
  frmSpivrobitnikiEdit: TfrmSpivrobitnikiEdit;

implementation

uses
  Main, Spivrobitniki, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  Raport, Opechanuvanny, AdminZapobizhZahodiEdit, ShtrafiEdit, Posadi,
  Ministry, Teritory, Rajoni, Viddilenny, Filter, KoristuvachiEdit,
  IBQuery;

{$R *.dfm}

procedure TfrmSpivrobitnikiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    if frmViddilennyEdit.Caption<>'Вибір відомостей про співробітника' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmFinansoviSankciiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    Action:=caFree;
//    exit;
//  end;
{
  if frmMain.IsFormOpen('frmKoristuvachiEdit') then
  begin
    frmSpivrobitniki.Enabled:=true;
    frmKoristuvachiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmKoristuvachiEdit.Caption<>'Вибір користувача' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmKoristuvachiEdit.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmSpivrobitniki.Enabled:=true;
    frmFilter.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmSpivrobitniki.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmSpivrobitniki.Enabled:=true;
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmRaport') then
  begin
    frmSpivrobitniki.Enabled:=true;
    frmRaport.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmRaport.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmSpivrobitniki.Enabled:=true;
    frmOpechanuvanny.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmOpechanuvanny.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSpivrobitniki.BorderStyle=bsDialog then
    begin
      frmSpivrobitniki.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end;
//    if frmSpivrobitnikiEdit.Caption<>'Вибір відомостей про співробітника' then
//    begin
//      frmSpivrobitniki.Enabled:=true;
//      frmShtrafiEdit.Enabled:=false;
//    end
//    else
//      frmSpivrobitniki.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmSpivrobitnikiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='insert into SPIVROBITNIKI (KODSPIVROBITNIKA) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTeritory.Open;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from SPIVROBITNIKI order by KODSPIVROBITNIKA';
    qTeritory.Open;
    qTeritory.Last;
    frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text:=IntToStr(qTeritory.FieldByName('KODSPIVROBITNIKA').Value);
  end;
end;

procedure TfrmSpivrobitnikiEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where not TERITORY is null order by TERITORY';
    qTeritory.Open;
    frmSpivrobitnikiEdit.cbTeritory.Text:='';
    frmSpivrobitnikiEdit.cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmSpivrobitnikiEdit.cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
  end;
end;

procedure TfrmSpivrobitnikiEdit.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=frmSpivrobitnikiEdit.cbTeritory.Text;
    qTeritory.Open;
    frmSpivrobitnikiEdit.cbRajon.Text:='';
    frmSpivrobitnikiEdit.cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmSpivrobitnikiEdit.cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmSpivrobitnikiEdit.aRajonUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
//    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=frmSpivrobitnikiEdit.cbTeritory.Text;
    qTeritory.Open;
    frmSpivrobitnikiEdit.cbRajon.Text:='';
    frmSpivrobitnikiEdit.cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmSpivrobitnikiEdit.cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
//    frmSpivrobitnikiEdit.cbViddilenny.Text:='';
//    frmSpivrobitnikiEdit.cbViddilenny.Items.Clear;
//    frmSpivrobitnikiEdit.cbPosada.Text:='';
//    frmSpivrobitnikiEdit.cbPosada.Items.Clear;
  end;
end;

procedure TfrmSpivrobitnikiEdit.aViddilennyUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
//    qTeritory.SQL.Text:='select * from VIDDILENNY,RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qTeritory.SQL.Text:='select * from VIDDILENNY where not NAZVAVIDDILENNY is null order by NAZVAVIDDILENNY';
    qTeritory.Open;
    frmSpivrobitnikiEdit.cbViddilenny.Text:='';
    frmSpivrobitnikiEdit.cbViddilenny.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmSpivrobitnikiEdit.cbViddilenny.Items.Add(qTeritory.FieldByName('NAZVAVIDDILENNY').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmSpivrobitnikiEdit.aPosadaUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
//    qTeritory.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON=:Rajon and POSADI.RAJON=RAJONI.KOD order by POSADI.NAZVAPOSADI';
    qTeritory.SQL.Text:='select * from POSADI where not NAZVAPOSADI is null order by POSADI.NAZVAPOSADI';
    qTeritory.Open;
    frmSpivrobitnikiEdit.cbPosada.Text:='';
    frmSpivrobitnikiEdit.cbPosada.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmSpivrobitnikiEdit.cbPosada.Items.Add(qTeritory.FieldByName('NAZVAPOSADI').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmSpivrobitnikiEdit.aVidminokChangeExecute(Sender: TObject);
begin
  frmSpivrobitnikiEdit.edtPrizvische_RV.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
  frmSpivrobitnikiEdit.edtPrizvische_TV.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
end;

procedure TfrmSpivrobitnikiEdit.aCancelExecute(Sender: TObject);
begin
  frmSpivrobitnikiEdit.Close;
end;

procedure TfrmSpivrobitnikiEdit.aOKExecute(Sender: TObject);
var
  teritory,district,viddilenny,posada: integer;
begin
  if frmSpivrobitnikiEdit.Caption='Вибір відомостей про співробітника' then
  begin
{
    if frmMain.IsFormOpen('frmKoristuvachiEdit') then
    begin
      frmKoristuvachiEdit.cbPIB.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFilter') then
    begin
      frmFilter.cbFilter.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbPIB_SES.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmFinansoviSankciiEdit.cbViddilSES.Text:=frmSpivrobitnikiEdit.cbViddilenny.Text;
      frmFinansoviSankciiEdit.cbPosadaSES.Text:=frmSpivrobitnikiEdit.cbPosada.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmViluchennyZRealizaciiEdit.cbViddilSES.Text:=frmSpivrobitnikiEdit.cbViddilenny.Text;
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:=frmSpivrobitnikiEdit.cbPosada.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmRaport') then
    begin
      frmRaport.cbPIBPredstavnika.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmRaport.cbPosadaPredstavnika.Text:=frmSpivrobitnikiEdit.cbPosada.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmOpechanuvanny') then
    begin
      frmOpechanuvanny.cbPIBPredstavnikaSES.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmOpechanuvanny.cbPosadaPredstavnikaSES.Text:=frmSpivrobitnikiEdit.cbPosada.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbPIBOsobiSES.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmAdminZapobizhZahodiEdit.cbPosadaOsobiSES.Text:=frmSpivrobitnikiEdit.cbPosada.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;
}
    if (frmMain.IsFormOpen('frmShtrafiEdit')) then
    begin
      frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      frmShtrafiEdit.cbViddil.Text:=frmSpivrobitnikiEdit.cbViddilenny.Text;
      frmShtrafiEdit.cbPosadaOsobiSES.Text:=frmSpivrobitnikiEdit.cbPosada.Text;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.Close;
      exit;
    end;
  end;

  if frmSpivrobitnikiEdit.Caption='Видалення відомостей про співробітника' then
  begin
    if MessageDlg('Видалення відомостей про співробітника може відобразитись на інших даних!!!'+#13+'Ви дійсно бажаєти видалити цей запис',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmSpivrobitniki.qTeritory do
      begin
        SQL.Clear;
        SQL.Text:='delete from SPIVROBITNIKI where KODSPIVROBITNIKA=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text;
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmSpivrobitnikiEdit.Close;
      frmSpivrobitniki.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmSpivrobitnikiEdit.Caption='Редагування відомостей про співробітника' then
  begin
    if frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text='' then
    begin
      frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
      frmSpivrobitnikiEdit.edtKodSpivrobitnika.SetFocus;
      exit;
    end;
    try
      StrToInt(frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text);
    except
      frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
      frmSpivrobitnikiEdit.edtKodSpivrobitnika.SetFocus;
      exit;
    end;

    if frmSpivrobitnikiEdit.cbTeritory.Text='' then
    begin
      frmSpivrobitnikiEdit.aTeritoryUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbTeritory.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from TERITORY order by TERITORY';
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('TERITORY',frmSpivrobitnikiEdit.cbTeritory.Text,[]) then teritory:=frmSpivrobitniki.qTeritory.FieldByName('KOD').Value else teritory:=0;

    if frmSpivrobitnikiEdit.cbRajon.Text='' then
    begin
      frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbRajon.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from RAJONI where TERITORY=:Teritory order by RAJON';
    frmSpivrobitniki.qTeritory.Params.Clear;
    frmSpivrobitniki.qTeritory.Params.Add;
    frmSpivrobitniki.qTeritory.Params[0].Name:='Teritory';
    frmSpivrobitniki.qTeritory.Params[0].Value:=teritory;
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('RAJON',frmSpivrobitnikiEdit.cbRajon.Text,[]) then district:=frmSpivrobitniki.qTeritory.FieldByName('KOD').Value else district:=0;

    if frmSpivrobitnikiEdit.cbViddilenny.Text='' then
    begin
      frmSpivrobitnikiEdit.aViddilennyUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbViddilenny.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from VIDDILENNY order by NAZVAVIDDILENNY';
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('NAZVAVIDDILENNY',frmSpivrobitnikiEdit.cbViddilenny.Text,[]) then viddilenny:=frmSpivrobitniki.qTeritory.FieldByName('KODVIDDILENNY').Value else viddilenny:=0;

    if frmSpivrobitnikiEdit.cbPosada.Text='' then
    begin
      frmSpivrobitnikiEdit.aPosadaUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbPosada.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from POSADI order by NAZVAPOSADI';
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('NAZVAPOSADI',frmSpivrobitnikiEdit.cbPosada.Text,[]) then posada:=frmSpivrobitniki.qTeritory.FieldByName('KODPOSADI').Value else posada:=0;

    if frmSpivrobitnikiEdit.edtPrizvische.Text='' then
    begin
      frmSpivrobitnikiEdit.edtPrizvische.SetFocus;
      exit;
    end;
    if frmSpivrobitnikiEdit.edtPrizvische_RV.Text='' then
    begin
      frmSpivrobitnikiEdit.edtPrizvische_RV.SetFocus;
      exit;
    end;
    if frmSpivrobitnikiEdit.edtPrizvische_TV.Text='' then
    begin
      frmSpivrobitnikiEdit.edtPrizvische_TV.SetFocus;
      exit;
    end;

    with frmSpivrobitniki.qTeritory do
    begin
      SQL.Clear;
      SQL.Text:='update SPIVROBITNIKI set TERITORY=:Teritory,RAJON=:Rajon,KODVIDDILENNY=:Viddilenny,KODPOSADI=:Posada,PRIZVISXHE=:Prizvische,PRIZVISXHE_RV=:Prizvische_RV,PRIZVISXHE_TV=:Prizvische_TV where KODSPIVROBITNIKA=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Teritory';
      Params[0].Value:=teritory;
      Params.Add;
      Params[1].Name:='Rajon';
      Params[1].Value:=district;
      Params.Add;
      Params[2].Name:='Viddilenny';
      Params[2].Value:=viddilenny;
      Params.Add;
      Params[3].Name:='Posada';
      Params[3].Value:=posada;
      Params.Add;
      Params[4].Name:='Prizvische';
      Params[4].Value:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      Params.Add;
      Params[5].Name:='Prizvische_RV';
      Params[5].Value:=frmSpivrobitnikiEdit.edtPrizvische_RV.Text;
      Params.Add;
      Params[6].Name:='Prizvische_TV';
      Params[6].Value:=frmSpivrobitnikiEdit.edtPrizvische_TV.Text;
      Params.Add;
      Params[7].Name:='Kod';
      Params[7].Value:=frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmSpivrobitnikiEdit.Close;
    frmSpivrobitniki.aUpdateExecute(sender);
    exit;
  end;

  if frmSpivrobitnikiEdit.Caption='Додавання нового співробітника' then
  begin
    if frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text='' then
    begin
      frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
      frmSpivrobitnikiEdit.edtKodSpivrobitnika.SetFocus;
      exit;
    end;
    try
      StrToInt(frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text);
    except
      frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
      frmSpivrobitnikiEdit.edtKodSpivrobitnika.SetFocus;
      exit;
    end;

    if frmSpivrobitnikiEdit.cbTeritory.Text='' then
    begin
      frmSpivrobitnikiEdit.aTeritoryUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbTeritory.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from TERITORY order by TERITORY';
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('TERITORY',frmSpivrobitnikiEdit.cbTeritory.Text,[]) then teritory:=frmSpivrobitniki.qTeritory.FieldByName('KOD').Value else teritory:=0;

    if frmSpivrobitnikiEdit.cbRajon.Text='' then
    begin
      frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbRajon.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from RAJONI where TERITORY=:Teritory order by RAJON';
    frmSpivrobitniki.qTeritory.Params.Clear;
    frmSpivrobitniki.qTeritory.Params.Add;
    frmSpivrobitniki.qTeritory.Params[0].Name:='Teritory';
    frmSpivrobitniki.qTeritory.Params[0].Value:=teritory;
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('RAJON',frmSpivrobitnikiEdit.cbRajon.Text,[]) then district:=frmSpivrobitniki.qTeritory.FieldByName('KOD').Value else district:=0;

    if frmSpivrobitnikiEdit.cbViddilenny.Text='' then
    begin
      frmSpivrobitnikiEdit.aViddilennyUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbViddilenny.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from VIDDILENNY order by NAZVAVIDDILENNY';
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('NAZVAVIDDILENNY',frmSpivrobitnikiEdit.cbViddilenny.Text,[]) then viddilenny:=frmSpivrobitniki.qTeritory.FieldByName('KODVIDDILENNY').Value else viddilenny:=0;

    if frmSpivrobitnikiEdit.cbPosada.Text='' then
    begin
      frmSpivrobitnikiEdit.aPosadaUpdateExecute(sender);
      frmSpivrobitnikiEdit.cbPosada.SetFocus;
      exit;
    end;
    frmSpivrobitniki.qTeritory.SQL.Clear;
    frmSpivrobitniki.qTeritory.SQL.Text:='select * from POSADI order by NAZVAPOSADI';
    frmSpivrobitniki.qTeritory.Open;
    if frmSpivrobitniki.qTeritory.Locate('NAZVAPOSADI',frmSpivrobitnikiEdit.cbPosada.Text,[]) then posada:=frmSpivrobitniki.qTeritory.FieldByName('KODPOSADI').Value else posada:=0;

    if frmSpivrobitnikiEdit.edtPrizvische.Text='' then
    begin
      frmSpivrobitnikiEdit.edtPrizvische.SetFocus;
      exit;
    end;
    if frmSpivrobitnikiEdit.edtPrizvische_RV.Text='' then
    begin
      frmSpivrobitnikiEdit.edtPrizvische_RV.SetFocus;
      exit;
    end;
    if frmSpivrobitnikiEdit.edtPrizvische_TV.Text='' then
    begin
      frmSpivrobitnikiEdit.edtPrizvische_TV.SetFocus;
      exit;
    end;

    with frmSpivrobitniki.qTeritory do
    begin
      SQL.Clear;
      SQL.Text:='update SPIVROBITNIKI set TERITORY=:Teritory,RAJON=:Rajon,KODVIDDILENNY=:Viddilenny,KODPOSADI=:Posada,PRIZVISXHE=:Prizvische,PRIZVISXHE_RV=:Prizvische_RV,PRIZVISXHE_TV=:Prizvische_TV where KODSPIVROBITNIKA=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Teritory';
      Params[0].Value:=teritory;
      Params.Add;
      Params[1].Name:='Rajon';
      Params[1].Value:=district;
      Params.Add;
      Params[2].Name:='Viddilenny';
      Params[2].Value:=viddilenny;
      Params.Add;
      Params[3].Name:='Posada';
      Params[3].Value:=posada;
      Params.Add;
      Params[4].Name:='Prizvische';
      Params[4].Value:=frmSpivrobitnikiEdit.edtPrizvische.Text;
      Params.Add;
      Params[5].Name:='Prizvische_RV';
      Params[5].Value:=frmSpivrobitnikiEdit.edtPrizvische_RV.Text;
      Params.Add;
      Params[6].Name:='Prizvische_TV';
      Params[6].Value:=frmSpivrobitnikiEdit.edtPrizvische_TV.Text;
      Params.Add;
      Params[7].Name:='Kod';
      Params[7].Value:=frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmSpivrobitnikiEdit.Close;
    frmSpivrobitniki.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmSpivrobitnikiEdit.aTeritoryChoiceExecute(Sender: TObject);
begin
  frmSpivrobitnikiEdit.Enabled:=false;
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

procedure TfrmSpivrobitnikiEdit.aRajonChoiceExecute(Sender: TObject);
begin
  frmSpivrobitnikiEdit.Enabled:=false;
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

procedure TfrmSpivrobitnikiEdit.aViddilennyChoiceExecute(Sender: TObject);
begin
  frmSpivrobitnikiEdit.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmSpivrobitnikiEdit.aPosadaChoiceExecute(Sender: TObject);
begin
  frmSpivrobitnikiEdit.Enabled:=false;
  frmMain.aPosadiExecute(sender);
  frmPosadi.aChoice.Enabled:=true;
  frmPosadi.Left:=frmMain.Left+70;
  frmPosadi.Top:=frmMain.Top+70;
  frmPosadi.Width:=frmMain.Width-70;
  frmPosadi.Height:=frmMain.Height-70;
  frmPosadi.Position:=poMainFormCenter;
  frmPosadi.FormStyle:=fsNormal;
  frmPosadi.BorderStyle:=bsDialog;
end;

end.
