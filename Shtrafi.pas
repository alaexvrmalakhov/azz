{
PIBOSOBISESRV, TIPLABKONTROLU, ARCH,
}
{
CREATE TABLE POSTANOVASHTRAF (
//    KOD                        INTEGER NOT NULL,
//    NOMERPOSTANOVI             INTEGER,
//    DATAPOSTANOVI              DATE,
//    DATAPROTOKOLU              DATE,
//    NOMERAKTUOBSTEZHENNY       VARCHAR(15),
//    DATAAKTUOBSTREZHENNY       DATE,
//    NAZVAOBJEKTU               VARCHAR(100),
//    VIDOMCHAPIDPORYDKOVANIST   VARCHAR(100),
//    ADRESAOBJEKTU              VARCHAR(150),
//    PIBPORUSHNIKA              VARCHAR(75),
//    POSADAPORUSHNIKA           VARCHAR(100),
//    DATANARODZGENNYPORUSHNIKA  DATE,
//    IDENTIFIKACIJNIJNOMPORUSH  VARCHAR(10),
//    MISCENARODZHENNYPORUSHNIK  VARCHAR(100),
//    ADRESAPROGIVANNYPORUSHNIK  VARCHAR(150),
//    PIBOSOBISES                VARCHAR(100),
//    VIDDILSES                  VARCHAR(100),
//    POSADAOSOBISES             VARCHAR(100),
//    PORUSHENNYSTATEJ           BLOB SUB_TYPE 1 SEGMENT SIZE 1000,
//    ROZMIRSHTRAFU              NUMERIC(15,2),
//    VIZNATIVINNIM              BLOB SUB_TYPE 1 SEGMENT SIZE 1000,
//    PORUSHENINORMATIVNIAKTI    BLOB SUB_TYPE 1 SEGMENT SIZE 1000,
//    DATAVRUCHENNYPOSTANOVI     DATE,
//    NOMERPLATIZHNOGODOKUMENTU  VARCHAR(15),
//    DATAPLATIZHNOGODOKUMENTU   DATE,
//    DATAPEREDACHIDOVDVS        DATE,
//    DATAREESTRACIIZAYVI        DATE,
//    VIHIDNIJNOMER              VARCHAR(10),
//    DATAOSKARZHENNYPOSTANOVI   DATE,
//    DATASTYGNENNY              DATE,
//    PRIJNYTERISHENNYPOOSKARZH  VARCHAR(200),
//    KUDIOSKARGENO              VARCHAR(200),
//    PIBPORUSHNIKARV            VARCHAR(100),
//    PIBPORUSHNIKATV            VARCHAR(100),
//    POSADANAZVAADRESA          VARCHAR(250),
    PIBOSOBISESRV              VARCHAR(100),
//    ROZDIL_F18_T23             VARCHAR(100),
//    PIB_POSADANAZVAOBJEKTU     VARCHAR(250),
//    PIB_POSADA_OSOBISES        VARCHAR(250),
    TIPLABKONTROLU             VARCHAR(250),
//    TIPSTRAFIV                 VARCHAR(75),
//    PIBTV_POSADA_MISCERABOTI   VARCHAR(100),
    ARCH                       INTEGER,
//    YEAR_                      INTEGER,
//    ZAPISKA_AKT                INTEGER,
//    MINISTRI                   INTEGER,
//    TERITORY                   INTEGER,
//    RAJON                      INTEGER,
//    DATAAKTUOBSTREZHENNYDO     DATE,
//    POSADA_GDSL                VARCHAR(125),
//    PIB_GDSL                   VARCHAR(100),
//    UCHAST                     INTEGER
);
}
unit Shtrafi;

interface

uses
  Forms, Menus, Classes, ActnList, DB, IBCustomDataSet, IBQuery, Controls,
  StdCtrls, Grids, DBGrids, ComCtrls, ExtCtrls, SysUtils, IniFiles, Dialogs,
  Variants;

type
  TfrmShtrafi = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnVruchenny: TButton;
    btnSplata: TButton;
    btnStygnenny: TButton;
    btnZayavaDo_VDVS: TButton;
    btnOskarzgenny: TButton;
    btnZakriti: TButton;
    btnDrukPostanovi: TButton;
    btnZayavaDoVDVS: TButton;
    Label1: TLabel;
    edtRik: TEdit;
    udRik: TUpDown;
    btnRik: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    btnTeritory: TButton;
    Label2: TLabel;
    dsTeritory: TDataSource;
    qTeritory: TIBQuery;
    qShtrafi: TIBQuery;
    dsShtrafi: TDataSource;
    alShtrafi: TActionList;
    PopupMenu: TPopupMenu;
    aAdd: TAction;
    N4: TMenuItem;
    aTeritoryUpdate: TAction;
    btnUpdate: TButton;
    aUpdate: TAction;
    aShtrafiTeritoryChange: TAction;
    aShtrafiDistrictChange: TAction;
    aClose: TAction;
    mnClose: TMenuItem;
    aEdit: TAction;
    aDelete: TAction;
    aHanding: TAction;
    aPayment: TAction;
    aPenalty: TAction;
    aZayavaVDVS: TAction;
    aYear: TAction;
    aAppeal: TAction;
    aPrintPostanova: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    aZayavaDoVDVS: TAction;
    mnPrint_ZayavaDoVDVS: TMenuItem;
    mnVibir: TMenuItem;
    aNeSplacheni: TAction;
    aNeVrucheni: TAction;
    aPeredaniDoVDVSPeredani: TAction;
    aPeredaniDoVDVSSplacheni: TAction;
    aNePeredaniDoVDVS: TAction;
    aPrimusovoStygneni: TAction;
    aSkasovani: TAction;
    aSpivrobitnik: TAction;
    aTipShtrafu: TAction;
    aRobochaBaza: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N3: TMenuItem;
    N27: TMenuItem;
    aObjekt_Adresa: TAction;
    N28: TMenuItem;
    aObjekt_Nazva: TAction;
    N29: TMenuItem;
    aZaNomeromPostanovi: TAction;
    aZaDatojuPostanovi: TAction;
    aZaPIBPorushnika: TAction;
    aZaPosadojuPorushnika: TAction;
    aZaNazvojuObjektu: TAction;
    aZaAdresojuObjektu: TAction;
    aZaViddilonSES: TAction;
    aZaPosadojuPredstavnikaSES: TAction;
    aZaPIBPredstavnikaSES: TAction;
    aZaDatojuProtokolu: TAction;
    aZaRozmiromShtrafu: TAction;
    aZaDatojuOskarzhenny: TAction;
    aZaDatojuVruchenny: TAction;
    aZaDatojuSplati: TAction;
    aZaDatojuPeredachiDoVDVS: TAction;
    aZaDatojuStygnenny: TAction;
    aZaRezultatomOskarzhenny: TAction;
    aZaNomeromAktuObstezhenny: TAction;
    aZaNomeromPlatizhnogoDokumentu: TAction;
    N21: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    memKomuNapravleno: TMemo;
    aRozdilT23F18: TAction;
    N23181: TMenuItem;
    btnPidpis: TButton;
    aPidpisati: TAction;
    btnPrintForm: TButton;
    aPrint: TAction;
    mnPrint: TMenuItem;
    qTemp: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aShtrafiTeritoryChangeExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aHandingExecute(Sender: TObject);
    procedure aPaymentExecute(Sender: TObject);
    procedure aPenaltyExecute(Sender: TObject);
    procedure aZayavaVDVSExecute(Sender: TObject);
    procedure aYearExecute(Sender: TObject);
    procedure aAppealExecute(Sender: TObject);
    procedure aPrintPostanovaExecute(Sender: TObject);
    procedure aZayavaDoVDVSExecute(Sender: TObject);
    procedure aNeSplacheniExecute(Sender: TObject);
    procedure aNeVrucheniExecute(Sender: TObject);
    procedure aPeredaniDoVDVSPeredaniExecute(Sender: TObject);
    procedure aRobochaBazaExecute(Sender: TObject);
    procedure aPeredaniDoVDVSSplacheniExecute(Sender: TObject);
    procedure aPrimusovoStygneniExecute(Sender: TObject);
    procedure aNePeredaniDoVDVSExecute(Sender: TObject);
    procedure aSkasovaniExecute(Sender: TObject);
    procedure aSpivrobitnikExecute(Sender: TObject);
    procedure aTipShtrafuExecute(Sender: TObject);
    procedure aObjekt_AdresaExecute(Sender: TObject);
    procedure aObjekt_NazvaExecute(Sender: TObject);
    procedure aZaNomeromPostanoviExecute(Sender: TObject);
    procedure aZaDatojuPostanoviExecute(Sender: TObject);
    procedure aZaPIBPorushnikaExecute(Sender: TObject);
    procedure aZaPosadojuPorushnikaExecute(Sender: TObject);
    procedure aZaNazvojuObjektuExecute(Sender: TObject);
    procedure aZaAdresojuObjektuExecute(Sender: TObject);
    procedure aZaViddilonSESExecute(Sender: TObject);
    procedure aZaPosadojuPredstavnikaSESExecute(Sender: TObject);
    procedure aZaPIBPredstavnikaSESExecute(Sender: TObject);
    procedure aZaDatojuProtokoluExecute(Sender: TObject);
    procedure aZaRozmiromShtrafuExecute(Sender: TObject);
    procedure aZaDatojuOskarzhennyExecute(Sender: TObject);
    procedure aZaDatojuVruchennyExecute(Sender: TObject);
    procedure aZaDatojuSplatiExecute(Sender: TObject);
    procedure aZaDatojuPeredachiDoVDVSExecute(Sender: TObject);
    procedure aZaDatojuStygnennyExecute(Sender: TObject);
    procedure aZaRezultatomOskarzhennyExecute(Sender: TObject);
    procedure aZaNomeromAktuObstezhennyExecute(Sender: TObject);
    procedure aZaNomeromPlatizhnogoDokumentuExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbRajonChange(Sender: TObject);
    procedure aRozdilT23F18Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aPidpisatiExecute(Sender: TObject);
    procedure qShtrafiAfterScroll(DataSet: TDataSet);
    procedure aPrintExecute(Sender: TObject);
    procedure udRikChanging(Sender: TObject; var AllowChange: Boolean);
    procedure edtRikChange(Sender: TObject);
  end;

var
  frmShtrafi: TfrmShtrafi;

implementation

uses
  Main, ShtrafiEdit, Vruchenny, Splata, ZayvaDoVDVS, Oskarzhenny,
  SumiShtrafuEdit, Filter, PrintForm;

{$R *.dfm}

procedure TfrmShtrafi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmShtrafi.qShtrafi.Close;
  frmShtrafi.qTeritory.Close;
{
  with frmMain do
  begin
    mnShtrafiChoices.Visible:=false;
    mnZahodiShtrafiNeSplacheni.Visible:=false;
    mnZahodiShtrafiNeVrucheni.Visible:=false;
    mnZahodiShtrafiPeredaniDoVDVS.Visible:=false;
    mnZahodiShtrafiPeredaniDoVDVSPeredani.Visible:=false;
    mnZahodiShtrafiPeredaniDoVDVSSplacheni.Visible:=false;
    mnZahodiShtrafiNePeredaniDoVDVS.Visible:=false;
    mnZahodiShtrafiPrimusovoStygneni.Visible:=false;
    mnZahodiShtrafiSkasovani.Visible:=false;
    mnZahodiShtrafiSpivrobitnik.Visible:=false;
    mnZahodiShtrafiTipShtrafu.Visible:=false;
    mnZahodiShtrafiObjekt.Visible:=false;
    mnZahodiShtrafiObjektAdresa.Visible:=false;
    mnZahodiShtrafiObjektNazva.Visible:=false;
    mnZahodiShtrafiRozdilT23F18.Visible:=false;
  end;
}
  Action:=caFree;
end;

procedure TfrmShtrafi.FormResize(Sender: TObject);
begin
  frmShtrafi.cbTeritory.Left:=4;
  frmShtrafi.cbTeritory.Width:=frmShtrafi.cbTeritory.Left+trunc((frmShtrafi.Width-56)/2);
  frmShtrafi.cbRajon.Left:=frmShtrafi.cbTeritory.Left+frmShtrafi.cbTeritory.Width+4;
  frmShtrafi.cbRajon.Width:=trunc((frmShtrafi.Width-56)/2);
  frmShtrafi.btnTeritory.Left:=frmShtrafi.Width-40;
end;

procedure TfrmShtrafi.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmShtrafiEdit') then frmShtrafiEdit:=TfrmShtrafiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmShtrafiEdit do
  begin
    frmShtrafiEdit.Caption:='Додаваня постанови про накладення штрафу';
    frmShtrafiEdit.Position:=poMainFormCenter;
    frmShtrafiEdit.BorderStyle:=bsDialog;
    frmShtrafiEdit.Show;
    cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbRajon.Text:=frmShtrafi.cbRajon.Text;
    cbRajon.Enabled:=false;
    aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    aNomerPostanoviUpdateExecute(sender);
    edtNomerPostanovi.Enabled:=true;
    btnNomerPostanovi.Enabled:=true;
    dtpDataPostanovi.Date:=int(Date);
    dtpDataPostanovi.Enabled:=true;
    dtpDataProtokolu.Date:=int(date);
    dtpDataProtokolu.Enabled:=true;

    frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=-1;
    frmShtrafiEdit.aActRaspiskaChangeExecute(sender);
    frmShtrafiEdit.rgAkt_Papiska.Enabled:=true;

    frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
    frmShtrafiEdit.edtNazvaObjectu.Text:='';
    frmShtrafiEdit.edtNazvaObjectu.Enabled:=true;
    frmShtrafiEdit.edtVidomchaPidporydkovanist.Text:='';
    frmShtrafiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
    frmShtrafiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
    frmShtrafiEdit.edtAdresaObjectu.Text:='';
    frmShtrafiEdit.edtAdresaObjectu.Enabled:=true;
    frmShtrafiEdit.edtPIBPorushnika.Text:='';
    frmShtrafiEdit.edtPIBPorushnika.Enabled:=true;
    frmShtrafiEdit.edtPosadaPorushnika.Text:='';
    frmShtrafiEdit.edtPosadaPorushnika.Enabled:=true;
    frmShtrafiEdit.dtpDataNarodzhenny.Date:=int(date);
    frmShtrafiEdit.dtpDataNarodzhenny.Enabled:=true;
    frmShtrafiEdit.edtIdentifikacijnijNomer.Text:='';
    frmShtrafiEdit.edtIdentifikacijnijNomer.Enabled:=true;
    frmShtrafiEdit.edtMisceNarodgenny.Text:='';
    frmShtrafiEdit.edtMisceNarodgenny.Enabled:=true;
    frmShtrafiEdit.edtMisceProzhivanny.Text:='';
    frmShtrafiEdit.edtMisceProzhivanny.Enabled:=true;
    frmShtrafiEdit.btnVidomostiProObjekt.Enabled:=true;

    frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProPereviryjuchogo;
    frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text:='';
    frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Items.Clear;
    frmShtrafiEdit.aOsobaSchoViyvilaPorushennyUpdateExecute(sender);
    frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Enabled:=true;
    frmShtrafiEdit.btnOsobaSchoViyvilaPorushnnyUpdate.Enabled:=true;
    frmShtrafiEdit.btnOsobaSchoViyvilaPorushnnyChoice.Enabled:=true;
    frmShtrafiEdit.cbViddil.Text:='';
    frmShtrafiEdit.cbViddil.Items.Clear;
    frmShtrafiEdit.aViddilUpdateExecute(sender);
    frmShtrafiEdit.cbViddil.Enabled:=true;
    frmShtrafiEdit.btnViddilUpdate.Enabled:=true;
    frmShtrafiEdit.btnViddilChoice.Enabled:=true;
    frmShtrafiEdit.cbPosadaOsobiSES.Text:='';
    frmShtrafiEdit.cbPosadaOsobiSES.Items.Clear;
    frmShtrafiEdit.aPosadaOsobiSesUpdateExecute(sender);
    frmShtrafiEdit.cbPosadaOsobiSES.Enabled:=true;
    frmShtrafiEdit.btnPosadaOsobiSESUpdate.Enabled:=true;
    frmShtrafiEdit.btnPosadaOsobiSESChoice.Enabled:=true;
    frmShtrafiEdit.rePorushennyStatej.Lines.Clear;
    frmShtrafiEdit.rePorushennyStatej.Lines.Add('ст.46, 47 Закону України "Про забезпечення санітарного та епідемічного благополуччя населення" №4004-ХІІ від 24.02.94р.');
    frmShtrafiEdit.rePorushennyStatej.MaxLength:=$7FFFFFF0;
    frmShtrafiEdit.rePorushennyStatej.Enabled:=true;
    frmShtrafiEdit.btnPorushennyStatej.Enabled:=true;
    frmShtrafiEdit.cbRozmirShtrafu.Text:='';
    frmShtrafiEdit.cbRozmirShtrafu.Items.Clear;
    frmShtrafiEdit.aRozmirShtrafuUpdateExecute(sender);
    frmShtrafiEdit.cbRozmirShtrafu.Enabled:=true;
    frmShtrafiEdit.btnRozmirShtrafuUpdate.Enabled:=true;
    frmShtrafiEdit.btnRozmirShtrafuChoice.Enabled:=true;

    frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsZmistPostanovi;
    frmShtrafiEdit.edtPIBPorushnikaRV.Text:='';
    frmShtrafiEdit.edtPIBPorushnikaRV.Enabled:=true;
    frmShtrafiEdit.btnPIBPorushnikaRV.Enabled:=true;
    frmShtrafiEdit.reViznatiVinnim.Lines.Clear;
    frmShtrafiEdit.reViznatiVinnim.MaxLength:=$7FFFFFF0;
    frmShtrafiEdit.reViznatiVinnim.Enabled:=true;
    frmShtrafiEdit.btnViznatiVinnim.Enabled:=true;
    frmShtrafiEdit.rePerelikPorushnihAktiv.Lines.Clear;
    frmShtrafiEdit.rePerelikPorushnihAktiv.MaxLength:=$7FFFFFF0;
    frmShtrafiEdit.rePerelikPorushnihAktiv.Enabled:=true;
    frmShtrafiEdit.btnPerelikPorushnihAktiv.Enabled:=true;

    frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsDodatkovo;
    frmShtrafiEdit.edtPIBPorushnikaTV.Text:='';
    frmShtrafiEdit.edtPIBPorushnikaTV.Enabled:=true;
    frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text:='';
    frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Enabled:=true;
    frmShtrafiEdit.btnPosadaPorushnika_AdresaObjektu.Enabled:=true;
    frmShtrafiEdit.edtPIB_Posada_NazvaObjectu.Text:='';
    frmShtrafiEdit.edtPIB_Posada_NazvaObjectu.Enabled:=true;
    frmShtrafiEdit.edtPIB_Posada_OsobiSES.Text:='';
    frmShtrafiEdit.edtPIB_Posada_OsobiSES.Enabled:=true;
    frmShtrafiEdit.btnTaZasluhavshiOsib.Enabled:=true;
    frmShtrafiEdit.cbxUchast.Checked:=false;
    frmShtrafiEdit.cbxUchastClick(sender);
    frmShtrafiEdit.cbxUchast.Enabled:=true;
    frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
    frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
    frmShtrafiEdit.cbRozdil_F18.Items.Clear;
    frmShtrafiEdit.cbRozdil_F18.Text:='';
    frmShtrafiEdit.aRozdilt23f18_UpdateExecute(sender);
    frmShtrafiEdit.cbRozdil_F18.Enabled:=true;
    frmShtrafiEdit.btnRozdil_T18_Update.Enabled:=true;
    frmShtrafiEdit.btnRozdil_F18_Select.Enabled:=true;
    frmShtrafiEdit.cbTipShtrafiv.Items.Clear;
    frmShtrafiEdit.cbTipShtrafiv.Text:='';
    frmShtrafiEdit.aTipShtrafiv_UpdateExecute(sender);
    frmShtrafiEdit.cbTipShtrafiv.Enabled:=true;
    frmShtrafiEdit.btnTipShtrafivUpdate.Enabled:=true;
    frmShtrafiEdit.btnTipShtrafiv_Select.Enabled:=true;
    frmShtrafiEdit.aRikUpdateExecute(sender);
    frmShtrafiEdit.edtRik.Enabled:=true;
    frmShtrafiEdit.btnRik.Enabled:=true;

{
    frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsLaboratornijKontrol;
    frmShtrafiEdit.DBGrid1.Align:=alClient;
    frmShtrafiEdit.aLaboratoryUpdateExecute(sender);
    frmShtrafiEdit.DBGrid1.Enabled:=true;
    frmShtrafiEdit.aLaboratoryAdd.Enabled:=true;
    frmShtrafiEdit.aLaboratoryEdit.Enabled:=true;
    frmShtrafiEdit.aLaboratoryDelete.Enabled:=true;
    frmShtrafiEdit.aLaboratoryUpdate.Enabled:=true;

    frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
    frmShtrafiEdit.aGDSL_UpdateExecute(sender);
    frmShtrafiEdit.edtPosadaGDSL.Enabled:=true;
    frmShtrafiEdit.edtPrizvischeGDSL.Enabled:=true;
    frmShtrafiEdit.btnGDSL.Enabled:=true;
}
    edtNomerPostanovi.SetFocus;
  end;
end;

procedure TfrmShtrafi.aTeritoryUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmShtrafi do
  begin
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    qTeritory.SQL.Clear;
//    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.SQL.Text:='select * from TERITORY where not TERITORY is null order by TERITORY';
    qTeritory.Open;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';

    cbRajon.Text:='';
    cbRajon.Items.Clear;
    qTeritory.SQL.Clear;
//    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    cbRajon.Text:=INIAZZ.ReadString('Teritory','District',cbRajon.Text);
    if qTeritory.Locate('KOD',StrToInt(cbRajon.Text),[]) then cbRajon.Text:=qTeritory.FieldByName('RAJON').Value else cbRajon.Text:='';

    aUpdateExecute(sender);
  end;
  INIAZZ.Free;
end;

procedure TfrmShtrafi.aUpdateExecute(Sender: TObject);
begin
  with frmShtrafi do
  begin
    with qShtrafi do
    begin
//      SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.NOMERPOSTANOVI';
      SQL.Clear;
      SQL.Text:='';
      SQL.Text:=SQL.Text+'select ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.NOMERPOSTANOVI as "№ постанови", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATAPOSTANOVI as "Дата постанови", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.PIBPORUSHNIKA as "П.І.Б. порушника", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.POSADAPORUSHNIKA as "Посада порушника", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.NAZVAOBJEKTU as "Назва об''єкту", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.ADRESAOBJEKTU as "Адреса об''єкту", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.VIDDILSES as "Відділ СЕС", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.POSADAOSOBISES as "Посада представника СЕС", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.PIBOSOBISES as "П.І.Б. представника СЕС", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATAPROTOKOLU as "Дата протоколу", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.ROZMIRSHTRAFU as "Розмір штрафу", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATAOSKARZHENNYPOSTANOVI as "Дата оскарження", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATAVRUCHENNYPOSTANOVI as "Дата вручення", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATAPLATIZHNOGODOKUMENTU as "Дата сплати", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATAPEREDACHIDOVDVS as "Дата передачі до ВДВС", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.DATASTYGNENNY as "Дата стягнення", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.PRIJNYTERISHENNYPOOSKARZH as "Результат оскарження", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.NOMERAKTUOBSTEZHENNY as "№ акту обстеження", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.NOMERPLATIZHNOGODOKUMENTU as "№ платіжки", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.PIB_GDSL as "П.І.Б особи, що винесла постанову", ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.POSADA_GDSL as "Посада особи, що винесла постанову"';
      SQL.Text:=SQL.Text+'from ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF,';
      SQL.Text:=SQL.Text+'  RAJONI ';
      SQL.Text:=SQL.Text+'where ';
      SQL.Text:=SQL.Text+'  RAJONI.RAJON=:Rajon ';
      SQL.Text:=SQL.Text+'  and ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.RAJON=RAJONI.KOD ';
      SQL.Text:=SQL.Text+'  and ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.YEAR_=:Rik ';
      SQL.Text:=SQL.Text+'order by ';
      SQL.Text:=SQL.Text+'  POSTANOVASHTRAF.NOMERPOSTANOVI';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Rajon';
      Params[0].Value:=cbRajon.Text;
      Params.Add;
      Params[1].Name:='Rik';
      Params[1].Value:=edtRik.Text;

      Open;
{
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
}
    end;
    Caption:='Журнал постанов про накладення штрафу';
    DBGrid1.SetFocus;
  end;
end;

procedure TfrmShtrafi.aShtrafiTeritoryChangeExecute(Sender: TObject);
begin
  with frmShtrafi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmShtrafi.aCloseExecute(Sender: TObject);
begin
  frmShtrafi.Close;
end;

procedure TfrmShtrafi.aEditExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
  RecID: integer;
  Nom: integer;
  dat: TDate;
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmShtrafiEdit') then frmShtrafiEdit:=TfrmShtrafiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmShtrafiEdit do
  begin
    Caption:='Редагування постанови про накладення штрафу';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    Show;
    if not qShtrafi.FieldByName('KOD').IsNull then RecID:=qShtrafi.FieldByName('KOD').Value else
    begin
      if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then Nom:=frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value;
      if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then dat:=frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value;
      frmShtrafi.qShtrafi.SQL.Clear;
      frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set KOD=gen_id(GET_SHTRAFI_RECORD_ID,1) where NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi';
      frmShtrafi.qShtrafi.Params.Clear;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[0].Name:='NomerPostanovi';
      frmShtrafi.qShtrafi.Params[0].Value:=Nom;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[1].Name:='DataPostanovi';
      frmShtrafi.qShtrafi.Params[1].Value:=DateToStr(dat);
      frmShtrafi.qShtrafi.Open;
      frmMain.trAzz.CommitRetaining;
      frmShtrafi.aUpdateExecute(sender);
      with frmShtrafi.qShtrafi do
      begin
        SQL.Clear;
        SQL.Text:='select * from POSTANOVASHTRAF where NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NomerPostanovi';
        Params[0].Value:=Nom;
        Params.Add;
        Params[1].Name:='DataPostanovi';
        Params[1].Value:=DateToStr(dat);
        Open;
      end;
      if frmShtrafi.qShtrafi.RecordCount>0 then RecID:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    end;
//    frmShtrafi.aUpdateExecute(sender);
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Record_ID';
    qComboBoxes.Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    qComboBoxes.Open;
    frmMain.trAzz.Commit;
    frmShtrafi.aUpdateExecute(sender);
    if frmShtrafi.qShtrafi.Locate('KOD',RecID,[]) then frmShtrafi.qShtrafi.Locate('KOD',RecID,[]) else frmShtrafi.qShtrafi.Last;

    cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbRajon.Text:=frmShtrafi.cbRajon.Text;
    cbRajon.Enabled:=false;
    if not qShtrafi.FieldByName('KOD').IsNull then frmShtrafiEdit.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else edtNomerPostanovi.Text:='';
    edtNomerPostanovi.Enabled:=true;
    btnNomerPostanovi.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then dtpDataPostanovi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) else dtpDataPostanovi.Date:=int(date);
    dtpDataPostanovi.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('DATAPROTOKOLU').IsNull then dtpDataProtokolu.Date:=frmShtrafi.qShtrafi.FieldByName('DATAPROTOKOLU').Value else dtpDataProtokolu.Date:=int(date);
    dtpDataProtokolu.Enabled:=true;

    if not frmShtrafi.qShtrafi.FieldByName('ZAPISKA_AKT').IsNull then frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=frmShtrafi.qShtrafi.FieldByName('ZAPISKA_AKT').Value else frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=-1;
    aActRaspiskaChangeExecute(sender);
    rgAkt_Papiska.Enabled:=true;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
    if not frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').IsNull then edtNazvaObjectu.Text:=frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').Value else edtNazvaObjectu.Text:='';
    edtNazvaObjectu.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('VIDOMCHAPIDPORYDKOVANIST').IsNull then edtVidomchaPidporydkovanist.Text:=frmShtrafi.qShtrafi.FieldByName('VIDOMCHAPIDPORYDKOVANIST').Value else edtVidomchaPidporydkovanist.Text:='';
    edtVidomchaPidporydkovanist.Enabled:=true;
    btnVidomchaPidporydkovanist.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').IsNull then edtAdresaObjectu.Text:=frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').Value else edtAdresaObjectu.Text:='';
    edtAdresaObjectu.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKA').IsNull then edtPIBPorushnika.Text:=frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKA').Value else edtPIBPorushnika.Text:='';
    edtPIBPorushnika.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').IsNull then edtPosadaPorushnika.Text:=frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').Value else edtPosadaPorushnika.Text:='';
    edtPosadaPorushnika.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('DATANARODZGENNYPORUSHNIKA').IsNull then dtpDataNarodzhenny.Date:=frmShtrafi.qShtrafi.FieldByName('DATANARODZGENNYPORUSHNIKA').Value else dtpDataNarodzhenny.Date:=int(date);
    dtpDataNarodzhenny.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').IsNull then edtIdentifikacijnijNomer.Text:=frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').Value else edtIdentifikacijnijNomer.Text:='';
    edtIdentifikacijnijNomer.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').IsNull then edtMisceNarodgenny.Text:=frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').Value else edtMisceNarodgenny.Text:='';
    edtMisceNarodgenny.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').IsNull then edtMisceProzhivanny.Text:=frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').Value else edtMisceProzhivanny.Text:='';
    edtMisceProzhivanny.Enabled:=true;
    btnVidomostiProObjekt.Enabled:=true;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProPereviryjuchogo;
    cbOsobaSchoViyvilaPorushnny.Text:='';
    cbOsobaSchoViyvilaPorushnny.Items.Clear;
    aOsobaSchoViyvilaPorushennyUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('PIBOSOBISES').IsNull then cbOsobaSchoViyvilaPorushnny.Text:=frmShtrafi.qShtrafi.FieldByName('PIBOSOBISES').Value else cbOsobaSchoViyvilaPorushnny.Text:='';
    cbOsobaSchoViyvilaPorushnny.Enabled:=true;
    btnOsobaSchoViyvilaPorushnnyUpdate.Enabled:=true;
    btnOsobaSchoViyvilaPorushnnyChoice.Enabled:=true;
    cbViddil.Text:='';
    cbViddil.Items.Clear;
    aViddilUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('VIDDILSES').IsNull then cbViddil.Text:=frmShtrafi.qShtrafi.FieldByName('VIDDILSES').Value else cbViddil.Text:='';
    cbViddil.Enabled:=true;
    btnViddilUpdate.Enabled:=true;
    btnViddilChoice.Enabled:=true;
    cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Items.Clear;
    aPosadaOsobiSesUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('POSADAOSOBISES').IsNull then cbPosadaOsobiSES.Text:=frmShtrafi.qShtrafi.FieldByName('POSADAOSOBISES').Value else cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Enabled:=true;
    btnPosadaOsobiSESUpdate.Enabled:=true;
    btnPosadaOsobiSESChoice.Enabled:=true;
    rePorushennyStatej.Lines.Clear;
    BlobStream:=TMemoryStream.Create;
    try
      (frmShtrafi.qShtrafi.FieldByName('PORUSHENNYSTATEJ') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then rePorushennyStatej.Lines.Assign(frmShtrafi.qShtrafi.FieldByName('PORUSHENNYSTATEJ') as TBlobField) else rePorushennyStatej.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    rePorushennyStatej.MaxLength:=$7FFFFFF0;
    rePorushennyStatej.Enabled:=true;
    btnPorushennyStatej.Enabled:=true;
    cbRozmirShtrafu.Text:='';
    cbRozmirShtrafu.Items.Clear;
    aRozmirShtrafuUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').IsNull then cbRozmirShtrafu.Text:=FloatToStr(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value) else cbRozmirShtrafu.Text:='';
    cbRozmirShtrafu.Enabled:=true;
    btnRozmirShtrafuUpdate.Enabled:=true;
    btnRozmirShtrafuChoice.Enabled:=true;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsZmistPostanovi;
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').IsNull then edtPIBPorushnikaRV.Text:=frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').Value else edtPIBPorushnikaRV.Text:='';
    edtPIBPorushnikaRV.Enabled:=true;
    btnPIBPorushnikaRV.Enabled:=true;
    reViznatiVinnim.Lines.Clear;
    reViznatiVinnim.MaxLength:=$7FFFFFF0;
    reViznatiVinnim.Enabled:=true;
    BlobStream:=TMemoryStream.Create;
    try
      (frmShtrafi.qShtrafi.FieldByName('VIZNATIVINNIM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then reViznatiVinnim.Lines.Assign(frmShtrafi.qShtrafi.FieldByName('VIZNATIVINNIM') as TBlobField) else reViznatiVinnim.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    btnViznatiVinnim.Enabled:=true;
    rePerelikPorushnihAktiv.Lines.Clear;
    rePerelikPorushnihAktiv.MaxLength:=$7FFFFFF0;
    rePerelikPorushnihAktiv.Enabled:=true;
    BlobStream:=TMemoryStream.Create;
    try
      (frmShtrafi.qShtrafi.FieldByName('PORUSHENINORMATIVNIAKTI') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then rePerelikPorushnihAktiv.Lines.Assign(frmShtrafi.qShtrafi.FieldByName('PORUSHENINORMATIVNIAKTI') as TBlobField) else rePerelikPorushnihAktiv.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    btnPerelikPorushnihAktiv.Enabled:=true;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsDodatkovo;
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKATV').IsNull then edtPIBPorushnikaTV.Text:=frmShtrafi.qShtrafi.FIeldByName('PIBPORUSHNIKATV').Value else edtPIBPorushnikaTV.Text:='';
    edtPIBPorushnikaTV.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('POSADANAZVAADRESA').IsNull then edtPosadaPorushnika_AdresaObjektu.Text:=frmShtrafi.qShtrafi.FieldByName('POSADANAZVAADRESA').Value else edtPosadaPorushnika_AdresaObjektu.Text:='';
    edtPosadaPorushnika_AdresaObjektu.Enabled:=true;
    btnPosadaPorushnika_AdresaObjektu.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').IsNull then edtPIB_Posada_NazvaObjectu.Text:=frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').Value else edtPIB_Posada_NazvaObjectu.Text:='';
    edtPIB_Posada_NazvaObjectu.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').IsNull then edtPIB_Posada_OsobiSES.Text:=frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').Value else edtPIB_Posada_OsobiSES.Text:='';
    edtPIB_Posada_OsobiSES.Enabled:=true;
    btnTaZasluhavshiOsib.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('UCHAST').IsNull then
    begin
      case frmShtrafi.qShtrafi.FieldByName('UCHAST').Value of
        0: cbxUchast.Checked:=false;
        1: cbxUchast.Checked:=true;
      end;
      cbxUchastClick(sender);
    end
    else
    begin
      cbxUchast.Checked:=false;
      cbxUchastClick(sender);
    end;
    cbxUchast.Enabled:=true;

    if not frmShtrafi.qShtrafi.FieldByName('KLOPOTANNYPROPERENOS').IsNull then
    begin
      case frmShtrafi.qShtrafi.FieldByName('KLOPOTANNYPROPERENOS').Value of
        0:
          begin
            frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
            frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
            frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
          end;
        1:
          begin
            frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=true;
            frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
            if not frmShtrafi.qShtrafi.FieldByName('DATAPERENOSU').IsNull then frmShtrafiEdit.dtpKlopotannyProPerenos.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPERENOSU').Value) else frmShtrafiEdit.dtpKlopotannyProPerenos.Date:=int(date);
          end;
        else
          begin
            frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
            frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
            frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
          end;
      end;
    end
    else
    begin
      frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
      frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
      frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
    end;
    frmShtrafiEdit.cbxKlopotannyProPerenos.Enabled:=true;
    frmShtrafiEdit.dtpKlopotannyProPerenos.Enabled:=true;

    cbRozdil_F18.Items.Clear;
    cbRozdil_F18.Text:='';
    aRozdilt23f18_UpdateExecute(sender);
    cbRozdil_F18.Enabled:=true;
    btnRozdil_T18_Update.Enabled:=true;
    btnRozdil_F18_Select.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('ROZDIL_F18_T23').IsNull then cbRozdil_F18.Text:=frmShtrafi.qShtrafi.FieldByName('ROZDIL_F18_T23').Value else cbRozdil_F18.Text:='';
    cbTipShtrafiv.Items.Clear;
    cbTipShtrafiv.Text:='';
    aTipShtrafiv_UpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('TIPSTRAFIV').IsNull then cbTipShtrafiv.Text:=frmShtrafi.qShtrafi.FieldByName('TIPSTRAFIV').Value else cbTipShtrafiv.Text:='';
    cbTipShtrafiv.Enabled:=true;
    btnTipShtrafivUpdate.Enabled:=true;
    btnTipShtrafiv_Select.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('Year_').IsNull then edtRik.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('Year_').Value) else edtRik.Text:='';
    edtRik.Enabled:=true;
    btnRik.Enabled:=true;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsLaboratornijKontrol;
    DBGrid1.Align:=alClient;
    aLaboratoryUpdateExecute(sender);
    DBGrid1.Enabled:=true;
    aLaboratoryAdd.Enabled:=true;
    aLaboratoryEdit.Enabled:=true;
    aLaboratoryDelete.Enabled:=true;
    aLaboratoryUpdate.Enabled:=true;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
    if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then edtPosadaGDSL.Text:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value else edtPosadaGDSL.Text:='';
    edtPosadaGDSL.Enabled:=true;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then edtPrizvischeGDSL.Text:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value else edtPrizvischeGDSL.Text:='';
    frmShtrafiEdit.edtPrizvischeGDSL.Enabled:=true;
    frmShtrafiEdit.btnGDSL.Enabled:=true;
    edtNazvaObjectu.SetFocus;
    with frmShtrafi.qTeritory do
    begin
      SQL.Clear;
      SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Record_ID';
      Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
      Open;
    end;
    frmMain.trAzz.Commit;
    frmShtrafiEdit.aLaboratoryUpdateExecute(sender);
    frmShtrafi.aUpdateExecute(sender);
  end;
}
end;

procedure TfrmShtrafi.aDeleteExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
  RecID: integer;
  Nom: integer;
  dat: TDate;
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmShtrafiEdit') then frmShtrafiEdit:=TfrmShtrafiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmShtrafiEdit do
  begin
    Caption:='Видалення постанови про накладення штрафу';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    Show;
    if not qShtrafi.FieldByName('KOD').IsNull then RecID:=qShtrafi.FieldByName('KOD').Value else
    begin
      if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then Nom:=frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value;
      if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then dat:=frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value;
      frmShtrafi.qShtrafi.SQL.Clear;
      frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set KOD=gen_id(GET_SHTRAFI_RECORD_ID,1) where NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi';
      frmShtrafi.qShtrafi.Params.Clear;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[0].Name:='NomerPostanovi';
      frmShtrafi.qShtrafi.Params[0].Value:=Nom;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[1].Name:='DataPostanovi';
      frmShtrafi.qShtrafi.Params[1].Value:=DateToStr(dat);
      frmShtrafi.qShtrafi.Open;
      frmMain.trAzz.CommitRetaining;
      frmShtrafi.aUpdateExecute(sender);
      with frmShtrafi.qShtrafi do
      begin
        SQL.Clear;
        SQL.Text:='select * from POSTANOVASHTRAF where NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NomerPostanovi';
        Params[0].Value:=Nom;
        Params.Add;
        Params[1].Name:='DataPostanovi';
        Params[1].Value:=DateToStr(dat);
        Open;
      end;
      if frmShtrafi.qShtrafi.RecordCount>0 then RecID:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    end;
//    frmShtrafi.aUpdateExecute(sender);
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Record_ID';
    qComboBoxes.Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    qComboBoxes.Open;
    frmMain.trAzz.Commit;
    frmShtrafi.aUpdateExecute(sender);
    if frmShtrafi.qShtrafi.Locate('KOD',RecID,[]) then frmShtrafi.qShtrafi.Locate('KOD',RecID,[]) else frmShtrafi.qShtrafi.Last;

    cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbRajon.Text:=frmShtrafi.cbRajon.Text;
    cbRajon.Enabled:=false;
    if not qShtrafi.FieldByName('KOD').IsNull then frmShtrafiEdit.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else edtNomerPostanovi.Text:='';
    edtNomerPostanovi.Enabled:=false;
    btnNomerPostanovi.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then dtpDataPostanovi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) else dtpDataPostanovi.Date:=int(date);
    dtpDataPostanovi.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('DATAPROTOKOLU').IsNull then dtpDataProtokolu.Date:=frmShtrafi.qShtrafi.FieldByName('DATAPROTOKOLU').Value else dtpDataProtokolu.Date:=int(date);
    dtpDataProtokolu.Enabled:=false;

    if not frmShtrafi.qShtrafi.FieldByName('ZAPISKA_AKT').IsNull then frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=frmShtrafi.qShtrafi.FieldByName('ZAPISKA_AKT').Value else frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=-1;
    aActRaspiskaChangeExecute(sender);
    rgAkt_Papiska.Enabled:=false;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
    if not frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').IsNull then edtNazvaObjectu.Text:=frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').Value else edtNazvaObjectu.Text:='';
    edtNazvaObjectu.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('VIDOMCHAPIDPORYDKOVANIST').IsNull then edtVidomchaPidporydkovanist.Text:=frmShtrafi.qShtrafi.FieldByName('VIDOMCHAPIDPORYDKOVANIST').Value else edtVidomchaPidporydkovanist.Text:='';
    edtVidomchaPidporydkovanist.Enabled:=false;
    btnVidomchaPidporydkovanist.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').IsNull then edtAdresaObjectu.Text:=frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').Value else edtAdresaObjectu.Text:='';
    edtAdresaObjectu.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKA').IsNull then edtPIBPorushnika.Text:=frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKA').Value else edtPIBPorushnika.Text:='';
    edtPIBPorushnika.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').IsNull then edtPosadaPorushnika.Text:=frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').Value else edtPosadaPorushnika.Text:='';
    edtPosadaPorushnika.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('DATANARODZGENNYPORUSHNIKA').IsNull then dtpDataNarodzhenny.Date:=frmShtrafi.qShtrafi.FieldByName('DATANARODZGENNYPORUSHNIKA').Value else dtpDataNarodzhenny.Date:=int(date);
    dtpDataNarodzhenny.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').IsNull then edtIdentifikacijnijNomer.Text:=frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').Value else edtIdentifikacijnijNomer.Text:='';
    edtIdentifikacijnijNomer.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').IsNull then edtMisceNarodgenny.Text:=frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').Value else edtMisceNarodgenny.Text:='';
    edtMisceNarodgenny.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').IsNull then edtMisceProzhivanny.Text:=frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').Value else edtMisceProzhivanny.Text:='';
    edtMisceProzhivanny.Enabled:=false;
    btnVidomostiProObjekt.Enabled:=false;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProPereviryjuchogo;
    cbOsobaSchoViyvilaPorushnny.Text:='';
    cbOsobaSchoViyvilaPorushnny.Items.Clear;
    aOsobaSchoViyvilaPorushennyUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('PIBOSOBISES').IsNull then cbOsobaSchoViyvilaPorushnny.Text:=frmShtrafi.qShtrafi.FieldByName('PIBOSOBISES').Value else cbOsobaSchoViyvilaPorushnny.Text:='';
    cbOsobaSchoViyvilaPorushnny.Enabled:=false;
    btnOsobaSchoViyvilaPorushnnyUpdate.Enabled:=false;
    btnOsobaSchoViyvilaPorushnnyChoice.Enabled:=false;
    cbViddil.Text:='';
    cbViddil.Items.Clear;
    aViddilUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('VIDDILSES').IsNull then cbViddil.Text:=frmShtrafi.qShtrafi.FieldByName('VIDDILSES').Value else cbViddil.Text:='';
    cbViddil.Enabled:=false;
    btnViddilUpdate.Enabled:=false;
    btnViddilChoice.Enabled:=false;
    cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Items.Clear;
    aPosadaOsobiSesUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('POSADAOSOBISES').IsNull then cbPosadaOsobiSES.Text:=frmShtrafi.qShtrafi.FieldByName('POSADAOSOBISES').Value else cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Enabled:=false;
    btnPosadaOsobiSESUpdate.Enabled:=false;
    btnPosadaOsobiSESChoice.Enabled:=false;
    rePorushennyStatej.Lines.Clear;
    BlobStream:=TMemoryStream.Create;
    try
      (frmShtrafi.qShtrafi.FieldByName('PORUSHENNYSTATEJ') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then rePorushennyStatej.Lines.Assign(frmShtrafi.qShtrafi.FieldByName('PORUSHENNYSTATEJ') as TBlobField) else rePorushennyStatej.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    rePorushennyStatej.MaxLength:=$7FFFFFF0;
    rePorushennyStatej.Enabled:=false;
    btnPorushennyStatej.Enabled:=false;
    cbRozmirShtrafu.Text:='';
    cbRozmirShtrafu.Items.Clear;
    aRozmirShtrafuUpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').IsNull then cbRozmirShtrafu.Text:=FloatToStr(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value) else cbRozmirShtrafu.Text:='';
    cbRozmirShtrafu.Enabled:=false;
    btnRozmirShtrafuUpdate.Enabled:=false;
    btnRozmirShtrafuChoice.Enabled:=false;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsZmistPostanovi;
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').IsNull then edtPIBPorushnikaRV.Text:=frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').Value else edtPIBPorushnikaRV.Text:='';
    edtPIBPorushnikaRV.Enabled:=false;
    btnPIBPorushnikaRV.Enabled:=false;
    reViznatiVinnim.Lines.Clear;
    reViznatiVinnim.MaxLength:=$7FFFFFF0;
    reViznatiVinnim.Enabled:=false;
    BlobStream:=TMemoryStream.Create;
    try
      (frmShtrafi.qShtrafi.FieldByName('VIZNATIVINNIM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then reViznatiVinnim.Lines.Assign(frmShtrafi.qShtrafi.FieldByName('VIZNATIVINNIM') as TBlobField) else reViznatiVinnim.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    btnViznatiVinnim.Enabled:=false;
    rePerelikPorushnihAktiv.Lines.Clear;
    rePerelikPorushnihAktiv.MaxLength:=$7FFFFFF0;
    rePerelikPorushnihAktiv.Enabled:=false;
    BlobStream:=TMemoryStream.Create;
    try
      (frmShtrafi.qShtrafi.FieldByName('PORUSHENINORMATIVNIAKTI') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then rePerelikPorushnihAktiv.Lines.Assign(frmShtrafi.qShtrafi.FieldByName('PORUSHENINORMATIVNIAKTI') as TBlobField) else rePerelikPorushnihAktiv.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    btnPerelikPorushnihAktiv.Enabled:=false;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsDodatkovo;
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKATV').IsNull then edtPIBPorushnikaTV.Text:=frmShtrafi.qShtrafi.FIeldByName('PIBPORUSHNIKATV').Value else edtPIBPorushnikaTV.Text:='';
    edtPIBPorushnikaTV.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('POSADANAZVAADRESA').IsNull then edtPosadaPorushnika_AdresaObjektu.Text:=frmShtrafi.qShtrafi.FieldByName('POSADANAZVAADRESA').Value else edtPosadaPorushnika_AdresaObjektu.Text:='';
    edtPosadaPorushnika_AdresaObjektu.Enabled:=false;
    btnPosadaPorushnika_AdresaObjektu.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').IsNull then edtPIB_Posada_NazvaObjectu.Text:=frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').Value else edtPIB_Posada_NazvaObjectu.Text:='';
    edtPIB_Posada_NazvaObjectu.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').IsNull then edtPIB_Posada_OsobiSES.Text:=frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').Value else edtPIB_Posada_OsobiSES.Text:='';
    edtPIB_Posada_OsobiSES.Enabled:=false;
    btnTaZasluhavshiOsib.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('UCHAST').IsNull then
    begin
      case frmShtrafi.qShtrafi.FieldByName('UCHAST').Value of
        0: cbxUchast.Checked:=false;
        1: cbxUchast.Checked:=true;
      end;
      cbxUchastClick(sender);
    end
    else
    begin
      cbxUchast.Checked:=false;
      cbxUchastClick(sender);
    end;
    cbxUchast.Enabled:=false;

    if not frmShtrafi.qShtrafi.FieldByName('KLOPOTANNYPROPERENOS').IsNull then
    begin
      case frmShtrafi.qShtrafi.FieldByName('KLOPOTANNYPROPERENOS').Value of
        0:
          begin
            frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
            frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
            frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
          end;
        1:
          begin
            frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=true;
            frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
            if not frmShtrafi.qShtrafi.FieldByName('DATAPERENOSU').IsNull then frmShtrafiEdit.dtpKlopotannyProPerenos.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPERENOSU').Value) else frmShtrafiEdit.dtpKlopotannyProPerenos.Date:=int(date);
          end;
        else
          begin
            frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
            frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
            frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
          end;
      end;
    end
    else
    begin
      frmShtrafiEdit.cbxKlopotannyProPerenos.Checked:=false;
      frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
      frmShtrafiEdit.cbxKlopotannyProPerenosClick(sender);
    end;
    frmShtrafiEdit.cbxKlopotannyProPerenos.Enabled:=false;
    frmShtrafiEdit.dtpKlopotannyProPerenos.Enabled:=false;

    cbRozdil_F18.Items.Clear;
    cbRozdil_F18.Text:='';
    aRozdilt23f18_UpdateExecute(sender);
    cbRozdil_F18.Enabled:=false;
    btnRozdil_T18_Update.Enabled:=false;
    btnRozdil_F18_Select.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('ROZDIL_F18_T23').IsNull then cbRozdil_F18.Text:=frmShtrafi.qShtrafi.FieldByName('ROZDIL_F18_T23').Value else cbRozdil_F18.Text:='';
    cbTipShtrafiv.Items.Clear;
    cbTipShtrafiv.Text:='';
    aTipShtrafiv_UpdateExecute(sender);
    if not frmShtrafi.qShtrafi.FieldByName('TIPSTRAFIV').IsNull then cbTipShtrafiv.Text:=frmShtrafi.qShtrafi.FieldByName('TIPSTRAFIV').Value else cbTipShtrafiv.Text:='';
    cbTipShtrafiv.Enabled:=false;
    btnTipShtrafivUpdate.Enabled:=false;
    btnTipShtrafiv_Select.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('Year_').IsNull then edtRik.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('Year_').Value) else edtRik.Text:='';
    edtRik.Enabled:=false;
    btnRik.Enabled:=false;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsLaboratornijKontrol;
    DBGrid1.Align:=alClient;
    aLaboratoryUpdateExecute(sender);
    DBGrid1.Enabled:=true;
    aLaboratoryAdd.Enabled:=false;
    aLaboratoryEdit.Enabled:=false;
    aLaboratoryDelete.Enabled:=false;
    aLaboratoryUpdate.Enabled:=false;

    pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
    if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then edtPosadaGDSL.Text:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value else edtPosadaGDSL.Text:='';
    edtPosadaGDSL.Enabled:=false;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then edtPrizvischeGDSL.Text:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value else edtPrizvischeGDSL.Text:='';
    frmShtrafiEdit.edtPrizvischeGDSL.Enabled:=false;
    frmShtrafiEdit.btnGDSL.Enabled:=false;
    btnVidminiti.SetFocus;
    with frmShtrafi.qTeritory do
    begin
      SQL.Clear;
      SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Record_ID';
      Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
      Open;
    end;
    frmMain.trAzz.Commit;
    frmShtrafiEdit.aLaboratoryUpdateExecute(sender);
    frmShtrafi.aUpdateExecute(sender);
  end;
}
end;

procedure TfrmShtrafi.aHandingExecute(Sender: TObject);
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmVruchenny') then frmVruchenny:=TfrmVruchenny.Create(self);
  frmMain.Enabled:=false;
  frmVruchenny.Enabled:=true;
  frmVruchenny.Caption:='Дата вручення постанови';
  frmVruchenny.Position:=poMainFormCenter;
  frmVruchenny.BorderStyle:=bsDialog;
  frmVruchenny.Show;
  frmVruchenny.Label1.Caption:='Дата вручення постанови про штраф';
  frmVruchenny.cbSamolikvidaciy.Visible:=false;
  frmVruchenny.cbSamolikvidaciy.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then frmVruchenny.edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else frmVruchenny.edtNomerPostanovi.Text:='';
  frmVruchenny.edtNomerPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then frmVruchenny.dtpDataPostanovi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) else frmVruchenny.dtpDataPostanovi.Date:=int(date);
  frmVruchenny.dtpDataPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('KOD').IsNull then frmVruchenny.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else frmVruchenny.edtKod.Text:='';
  frmVruchenny.edtKod.Enabled:=false;
  if frmShtrafi.qShtrafi.FieldByName('DATAVRUCHENNYPOSTANOVI').IsNull then
    if (int(date)+3)>=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) then
      MessageDlg('Увага!!!'+#13+'Цю постанову не було вручено або не введено дату вручення!!!'+#13+'Введіть дату вручення та збережіть ці відомості!!!',mtWarning,[mbOK],0);
  if not frmShtrafi.qShtrafi.FieldByName('DATAVRUCHENNYPOSTANOVI').IsNull then
    frmVruchenny.dtpDataVruchenny.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAVRUCHENNYPOSTANOVI').Value) else
      frmVruchenny.dtpDataVruchenny.Date:=int(date);
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Record_ID';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  frmMain.trAzz.Commit;
  frmShtrafi.aUpdateExecute(sender);
}
end;

procedure TfrmShtrafi.aPaymentExecute(Sender: TObject);
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmSplata') then frmSplata:=TfrmSplata.Create(self);
  frmMain.Enabled:=false;
  frmSplata.Show;
  frmSplata.Enabled:=true;
  frmSplata.Caption:='Добровільна сплата';
  frmSplata.BorderStyle:=bsDialog;
  frmSplata.Position:=poMainFormCenter;
  frmSplata.Label1.Caption:='Номер платіжного документу';
  frmSplata.Label2.Caption:='Дата сплати';
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then frmSplata.edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else frmSplata.edtNomerPostanovi.Text:='';
  frmSplata.edtNomerPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then frmSplata.dtpDataPostanovi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) else frmSplata.dtpDataPostanovi.Date:=int(date);
  frmSplata.dtpDataPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('KOD').IsNull then frmSplata.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else frmSplata.edtKod.Text:='';
  frmSplata.edtKod.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('NOMERPLATIZHNOGODOKUMENTU').IsNull then frmSplata.edtNomerPlatizhki.Text:=frmShtrafi.qShtrafi.FieldByName('NOMERPLATIZHNOGODOKUMENTU').Value else frmSplata.edtNomerPlatizhki.Text:='';
  frmSplata.edtNomerPlatizhki.Enabled:=true;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPLATIZHNOGODOKUMENTU').IsNull then frmSplata.dtpDataSplati.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPLATIZHNOGODOKUMENTU').Value) else frmSplata.dtpDataSplati.Date:=int(date);
  frmSplata.dtpDataSplati.Enabled:=true;
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Record_ID';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  frmMain.trAzz.Commit;
  frmShtrafi.aUpdateExecute(sender);
}
end;

procedure TfrmShtrafi.aPenaltyExecute(Sender: TObject);
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmVruchenny') then frmVruchenny:=TfrmVruchenny.Create(self);
  frmMain.Enabled:=false;
  frmVruchenny.Show;
  frmVruchenny.Enabled:=true;
  frmVruchenny.Caption:='Дата примусового стягнення постанови';
  frmVruchenny.Position:=poMainFormCenter;
  frmVruchenny.BorderStyle:=bsDialog;
  frmVruchenny.Label1.Caption:='Дата стягнення штрафу';
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then frmVruchenny.edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else frmVruchenny.edtNomerPostanovi.Text:='';
  frmVruchenny.edtNomerPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then frmVruchenny.dtpDataPostanovi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) else frmVruchenny.dtpDataPostanovi.Date:=int(date);
  frmVruchenny.dtpDataPostanovi.Enabled:=true;
  if not frmShtrafi.qShtrafi.FieldByName('KOD').IsNull then frmVruchenny.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else frmVruchenny.edtKod.Text:='';
  frmVruchenny.edtKod.Enabled:=false;
  frmVruchenny.cbSamolikvidaciy.Visible:=false;
  frmVruchenny.cbSamolikvidaciy.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATASTYGNENNY').IsNull then frmVruchenny.dtpDataVruchenny.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATASTYGNENNY').Value) else frmVruchenny.dtpDataVruchenny.Date:=int(date);
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Record_ID';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  frmMain.trAzz.Commit;
  frmShtrafi.aUpdateExecute(sender);
}
end;

procedure TfrmShtrafi.aZayavaVDVSExecute(Sender: TObject);
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmZayvaDoVDVS') then frmZayvaDoVDVS:=TfrmZayvaDoVDVS.Create(self);
  if not frmShtrafi.qShtrafi.FieldByName('DATAPLATIZHNOGODOKUMENTU').IsNull then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('DATAPLATIZHNOGODOKUMENTU').IsNull)and(int(frmShtrafi.qShtrafi.FieldByName('DATAPLATIZHNOGODOKUMENTU').Value)>int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value+18)) then exit;
  frmMain.Enabled:=false;
  frmZayvaDoVDVS.Show;
  frmZayvaDoVDVS.Caption:='Заява до ВДВС';
  frmZayvaDoVDVS.BorderStyle:=bsDialog;
  frmZayvaDoVDVS.Position:=poMainFormCenter;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPEREDACHIDOVDVS').IsNull then frmZayvaDoVDVS.dtpDataPeredachiDoVDVS.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPEREDACHIDOVDVS').Value) else frmZayvaDoVDVS.dtpDataPeredachiDoVDVS.Date:=int(date);
  frmZayvaDoVDVS.dtpDataPeredachiDoVDVS.Enabled:=true;
  if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then frmZayvaDoVDVS.edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else frmZayvaDoVDVS.edtNomerPostanovi.Text:='';
  frmZayvaDoVDVS.edtNomerPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then frmZayvaDoVDVS.dtpDataPostanovi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value) else frmZayvaDoVDVS.dtpDataPostanovi.Date:=int(date);
  frmZayvaDoVDVS.dtpDataPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('KOD').IsNull then frmZayvaDoVDVS.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else frmZayvaDoVDVS.edtKod.Text:='';
  frmZayvaDoVDVS.edtKod.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATAREESTRACIIZAYVI').IsNull then frmZayvaDoVDVS.dtpDataReestraciiZayvi.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAREESTRACIIZAYVI').Value) else frmZayvaDoVDVS.dtpDataReestraciiZayvi.Date:=int(date);
  frmZayvaDoVDVS.dtpDataReestraciiZayvi.Enabled:=true;
  if not frmShtrafi.qShtrafi.FieldByName('VIHIDNIJNOMER').IsNull then frmZayvaDoVDVS.edtVihidnijNomer.Text:=frmShtrafi.qShtrafi.FieldByName('VIHIDNIJNOMER').Value else frmZayvaDoVDVS.edtVihidnijNomer.Text:='';
  frmZayvaDoVDVS.edtVihidnijNomer.Enabled:=true;
  if not frmShtrafi.qShtrafi.FieldByName('PIBTV_POSADA_MISCERABOTI').IsNull then frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text:=frmShtrafi.qShtrafi.FieldByName('PIBTV_POSADA_MISCERABOTI').Value else frmZayvaDoVDVS.aPIBPorushnikaTV_Posada_MisceRobotiExecute(sender);
  frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Enabled:=true;
  frmZayvaDoVDVS.btnPIBPorushnikaTV_Posada_MisceRoboti.Enabled:=true;
  frmZayvaDoVDVS.aUpdateNapravlennyExecute(sender);
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Record_ID';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  frmMain.trAzz.Commit;
  frmZayvaDoVDVS.aUpdateNapravlennyExecute(sender);
  frmShtrafi.aUpdateExecute(sender);
}
end;

procedure TfrmShtrafi.aYearExecute(Sender: TObject);
begin
  frmShtrafi.aUpdateExecute(sender);
end;

procedure TfrmShtrafi.aAppealExecute(Sender: TObject);
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmOskarzhenny') then frmOskarzhenny:=TfrmOskarzhenny.Create(self);
  frmMain.Enabled:=false;
  frmOskarzhenny.Caption:='Оскарження постанови';
  frmOskarzhenny.Position:=poMainFormCenter;
  frmOskarzhenny.BorderStyle:=bsDialog;
  frmOskarzhenny.Show;

  if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then frmOskarzhenny.edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value) else frmOskarzhenny.edtNomerPostanovi.Text:='';
  frmOskarzhenny.edtNomerPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then frmOskarzhenny.dtpDataPostanovi.Date:=frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value else frmOskarzhenny.dtpDataPostanovi.Date:=int(date);
  frmOskarzhenny.dtpDataPostanovi.Enabled:=false;
  if not frmShtrafi.qShtrafi.FieldByName('KOD').IsNull then frmOskarzhenny.edtKod.Text:=IntToStr(frmShtrafi.qShtrafi.FieldByName('KOD').Value) else frmOskarzhenny.edtKod.Text:='';
  frmOskarzhenny.edtKod.Enabled:=false;

  if not frmShtrafi.qShtrafi.FieldByName('DATAOSKARZHENNYPOSTANOVI').IsNull then frmOskarzhenny.dtpDataOskarzhenny.Date:=frmShtrafi.qShtrafi.FieldByName('DATAOSKARZHENNYPOSTANOVI').Value else frmOskarzhenny.dtpDataOskarzhenny.Date:=int(date);
  frmOskarzhenny.dtpDataOskarzhenny.Enabled:=true;

  frmOskarzhenny.aKudiOskarzheno_UpdateExecute(sender);
  if not frmShtrafi.qShtrafi.FieldByName('KUDIOSKARGENO').IsNull then frmOskarzhenny.cbKudiOskarzheno.Text:=frmShtrafi.qShtrafi.FieldByName('KUDIOSKARGENO').Value else frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbKudiOskarzheno.Enabled:=true;
  frmOskarzhenny.btnKudiOskarzheno_Update.Enabled:=true;
  frmOskarzhenny.btnKudiOskarzheno_Choice.Enabled:=true;

  frmOskarzhenny.aRezultatOskarzhenny_UpdateExecute(sender);
  if not frmShtrafi.qShtrafi.FieldByName('PRIJNYTERISHENNYPOOSKARZH').IsNull then frmOskarzhenny.cbRezultatOskarzhenny.Text:=frmShtrafi.qShtrafi.FieldByName('PRIJNYTERISHENNYPOOSKARZH').Value else frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Enabled:=true;
  frmOskarzhenny.btnRezultatOskarzhenny_Update.Enabled:=true;
  frmOskarzhenny.btnRezultatOskarzhenny_Choice.Enabled:=true;
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=1 where KOD=:Record_ID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Record_ID';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  frmMain.trAzz.Commit;
  frmShtrafi.aUpdateExecute(sender);
}
end;

procedure TfrmShtrafi.aPrintPostanovaExecute(Sender: TObject);
var
  DocumentName, Doc, BookmarkName, R: OleVariant;
  FirmName, DataPostanovi, NomerPostanovi, PIB_GDSL, Posada_GDSL, GDSL: string;
  Rozglynuvshi, Rozglynuvshi_, Porushnik, AdresaPorushnika: string;
  ZasluhavshiOsib, NaPidstavi, PIB_Porushnika, VinnimU, SchoEPorushennym: string;
  PIB_Porushnika_RV, Rozmir_Shtrafu, suma, Valuta, RozrahunkovijRahunok: string;
  Kod, Oderzhuvach, OKPO, Bank, MFO, DataOskarzhenny: string;
  Director: integer;
  Ministry,Teritory,District: integer;
begin
{
  Director:=0;
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    //друк у WORD або WORDPAD
    //перевірити, чи встановлено MS WORD на компьютері
    frmMain.sWordApp.Disconnect;
    frmMain.sWordApp.AutoConnect:=true;
    frmMain.sWordApp.AutoQuit:=true;
    frmMain.sWordApp.Visible:=false;
    try
      frmMain.sWordApp.Connect;
    except
      MessageDlg('Увага!'+#13+'Не можливо запустити MS Word!'+#13+'Перевірте, чи встановлено MS Word з пакету MS Office 2003 або пізнішої версії.'+#13+'За додатковою інформацією зверніться до свого системного адміністратора.',mtWarning,[mbOK],0);
      exit;
    end;
    DocumentName:=INIAZZ.ReadString('System','TemplatePath',DocumentName);
    DocumentName:=DocumentName+'\Shtrafi.dot';
    frmMain.sWordApp.Connect;
    frmMain.sWordApp.Documents.Add(DocumentName,EmptyParam,EmptyParam,EmptyParam);
    if not frmMain.sWordApp.Visible then frmMain.sWordApp.Visible:=true;
    //ввод данных в отчет
    Doc:=frmMain.sWordApp.ActiveDocument;

    //Назва організації
    FirmName:='';
    FirmName:=INIAZZ.ReadString('Firm','FullName',FirmName);
    BookmarkName:='NazvaOrganizacii';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(FirmName);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Дата постанови
    DataPostanovi:='';
    if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then DataPostanovi:=DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value);
    BookmarkName:='DataPostanovi';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DataPostanovi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Номер постанови
    if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then NomerPostanovi:=IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value);
    BookmarkName:='NomerPostanovi';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NomerPostanovi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //П.І.Б., посада головного лікаря
    Posada_GDSL:='';
    PIB_GDSL:='';
    if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value;
    if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value;
    Director:=0;
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    if Posada_GDSL='' then
      case Director of
        0: Posada_GDSL:=INIAZZ.ReadString('Director','Position_NV',Posada_GDSL);
        1: Posada_GDSL:=INIAZZ.ReadString('Director1','Position_NV',Posada_GDSL);
        2: Posada_GDSL:=INIAZZ.ReadString('Director2','Position_NV',Posada_GDSL);
      end;
    if PIB_GDSL='' then
      case Director of
        0: PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',Posada_GDSL);
        1: PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',Posada_GDSL);
        2: PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',Posada_GDSL);
      end;
    GDSL:=Posada_GDSL+' '+PIB_GDSL;
    BookmarkName:='PIB_Posada_GolovnogoLikaraySES';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //розглянувши
    Rozglynuvshi:='';
    if not frmShtrafi.qShtrafi.FieldByName('DATAPROTOKOLU').IsNull then Rozglynuvshi:=Rozglynuvshi+'протокол про порушення санітарних норм від '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAPROTOKOLU').Value);
    if not frmShtrafi.qShtrafi.FieldByName('ZAPISKA_AKT').IsNull then
      case frmShtrafi.qShtrafi.FieldByName('ZAPISKA_AKT').Value of
        0:  if not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' інформаційну довідку від '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
        1:
          begin
            if not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' акт відбору проб від '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
              if not frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
          end;
        2:
          begin
            if (not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull)and( not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').IsNull) then
            if (frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value)>=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').Value) then
            begin
              if not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' акт санітарно-епідеміологічного обстеження від '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
              if not frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value
            end
            else
            begin
              if not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' акт санітарно-епідеміологічного обстеження від '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
              if not frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').IsNull then Rozglynuvshi:=Rozglynuvshi+' - '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').Value);
              if not frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
            end;
          end;
      end;
    if not frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').Value;
    if not frmShtrafi.qShtrafi.FieldByName('VIDOMCHAPIDPORYDKOVANIST').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmShtrafi.qShtrafi.FieldByName('VIDOMCHAPIDPORYDKOVANIST').Value;
    Rozglynuvshi_:=' Результат ';
    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.Locate('MINISTRY',frmShtrafi.cbMinistry.Text,[]) then Ministry:=frmShtrafi.qTeritory.FieldByName('KOD').Value else Ministry:=0;

    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=Ministry;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[1].Name:='Teritory';
    frmShtrafi.qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.Locate('TERITORY',frmShtrafi.cbTeritory.Text,[]) then Teritory:=frmShtrafi.qTeritory.FieldByName('KOD').Value else Teritory:=0;

    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=Ministry;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[1].Name:='Teritory';
    frmShtrafi.qTeritory.Params[1].Value:=Teritory;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[2].Name:='Rajon';
    frmShtrafi.qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.Locate('RAJON',frmShtrafi.cbRajon.Text,[]) then District:=frmShtrafi.qTeritory.FieldByName('KOD').Value else District:=0;

    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:Strafi order by VIDKONTROLU';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=Ministry;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[1].Name:='Teritory';
    frmShtrafi.qTeritory.Params[1].Value:=Teritory;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[2].Name:='Rajon';
    frmShtrafi.qTeritory.Params[2].Value:=District;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[3].Name:='NomerPostanovi';
    frmShtrafi.qTeritory.Params[3].Value:=NomerPostanovi;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[4].Name:='DataPostanovi';
    frmShtrafi.qTeritory.Params[4].Value:=DataPostanovi;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[5].Name:='Strafi';
    frmShtrafi.qTeritory.Params[5].Value:='shtrafi';
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.RecordCount>0 then
    begin
      frmShtrafi.qTeritory.First;
      while not frmShtrafi.qTeritory.Eof do
      begin
        if (not frmShtrafi.qTeritory.FieldByName('NOMERPOSTANOVI').IsNull)and(not frmShtrafi.qTeritory.FieldByName('DATAPOSTANOVI').IsNull) then
          if (frmShtrafi.qTeritory.FieldByName('NOMERPOSTANOVI').Value=StrToInt(NomerPostanovi)) and (int(frmShtrafi.qTeritory.FieldByName('DATAPOSTANOVI').Value)=StrToDate(DataPostanovi)) then
          begin
            if not frmShtrafi.qTeritory.FieldByName('VIDKONTROLU').IsNull then Rozglynuvshi_:=Rozglynuvshi_+' '+frmShtrafi.qTeritory.FieldByName('VIDKONTROLU').Value;
            if not frmShtrafi.qTeritory.FieldByName('NOMERIPROB').IsNull then Rozglynuvshi_:=Rozglynuvshi_+' № '+frmShtrafi.qTeritory.FieldByName('NOMERIPROB').Value;
            if not frmShtrafi.qTeritory.FieldByName('DATAKONTROLU').IsNull then Rozglynuvshi_:=Rozglynuvshi_+' від '+DateToStr(frmShtrafi.qTeritory.FieldByName('DATAKONTROLU').Value)+', ';
          end;
        frmShtrafi.qTeritory.Next;
      end;
    end;
    frmShtrafi.qTeritory.Close;
    if Rozglynuvshi_=' Результат ' then
      (
      if
        not frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').IsNull
      then
        Rozglynuvshi:=Rozglynuvshi+' за адресою: '+frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').Value
      )
    else
      (
      if
        not frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').IsNull
      then
        Rozglynuvshi:=Rozglynuvshi+' '+Rozglynuvshi_+' за адресою: '+frmShtrafi.qShtrafi.FieldByName('ADRESAOBJEKTU').Value);
    if not frmShtrafi.qShtrafi.FieldByName('KLOPOTANNYPROPERENOS').IsNull then
    begin
      case frmShtrafi.qShtrafi.FieldByName('KLOPOTANNYPROPERENOS').Value of
        0:
          begin
            Rozglynuvshi:=Rozglynuvshi+' Клопотання про перенос терміну розгляду не надходило';
          end;
        1:
          begin
            Rozglynuvshi:=Rozglynuvshi+' Клопотання про перенос терміну розгляду';
            if not frmShtrafi.qShtrafi.FieldByName('DATAPERENOSU').IsNull then Rozglynuvshi:=Rozglynuvshi+' на '+DateToStr(int(frmShtrafi.qShtrafi.FieldByName('DATAPERENOSU').Value));
          end;
        else
          begin
            Rozglynuvshi:=Rozglynuvshi+' Клопотання про перенос терміну розгляду не надходило';
          end;
      end;
    end
    else
    begin
      Rozglynuvshi:=Rozglynuvshi+' Клопотання про перенос терміну розгляду не надходило';
    end;
    BookmarkName:='Rozglyanuvshi';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Rozglynuvshi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //П.І.Б. порушника
    Porushnik:='';
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKATV').IsNull then Porushnik:=Porushnik+frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKATV').Value+', ';
    if not frmShtrafi.qShtrafi.FieldByName('POSADANAZVAADRESA').IsNull then Porushnik:=Porushnik+frmShtrafi.qShtrafi.FieldByName('POSADANAZVAADRESA').Value+', ';
    if not frmShtrafi.qShtrafi.FieldByName('DATANARODZGENNYPORUSHNIKA').IsNull then Porushnik:=Porushnik+' Дата народження '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATANARODZGENNYPORUSHNIKA').Value)+', ';
    if not frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').IsNull then Porushnik:=Porushnik+' Місце народження '+frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').Value+', ';
    if not frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').IsNull then Porushnik:=Porushnik+' Ідентифікаційний № '+frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').Value;
    BookmarkName:='PIB_Porushnika';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Porushnik);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //що проживає за адресою
    if not frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').IsNull then AdresaPorushnika:=frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').Value;
    BookmarkName:='Adresa_Prozhivanny_Porushnika';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(AdresaPorushnika);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //та заслухавши осіб, ...
    ZasluhavshiOsib:='';
    if not frmShtrafi.qShtrafi.FieldByName('UCHAST').IsNull then
    begin
      case frmShtrafi.qShtrafi.FieldByName('UCHAST').Value of
        0:
          begin
            if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').IsNull then ZasluhavshiOsib:=ZasluhavshiOsib+frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').Value;
            if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').IsNull then ZasluhavshiOsib:=ZasluhavshiOsib+' та '+frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').Value+' про час розгляду справи повідомлено, від участі в розгляді справи відмовився';
          end;
        1:
          begin
            if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').IsNull then ZasluhavshiOsib:=ZasluhavshiOsib+frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').Value;
            if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').IsNull then ZasluhavshiOsib:=ZasluhavshiOsib+' та '+frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').Value;
          end;
      end;
    end
    else
    begin
      if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').IsNull then ZasluhavshiOsib:=ZasluhavshiOsib+frmShtrafi.qShtrafi.FieldByName('PIB_POSADA_OSOBISES').Value;
      if not frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').IsNull then ZasluhavshiOsib:=ZasluhavshiOsib+' та '+frmShtrafi.qShtrafi.FieldByName('PIB_POSADANAZVAOBJEKTU').Value;
    end;
    BookmarkName:='Zasluhavshi_Osib';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(ZasluhavshiOsib);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //На підставі....
    NaPidstavi:='';
    if not frmShtrafi.qShtrafi.FieldByName('PORUSHENNYSTATEJ').IsNull then NaPidstavi:=frmShtrafi.qShtrafi.FieldByName('PORUSHENNYSTATEJ').Value;
    BookmarkName:='NaPidstavi';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NaPidstavi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Визнати
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').IsNull then PIB_Porushnika:=frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').Value;
    BookmarkName:='PIB_Porushnika_RV';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_Porushnika);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //винним у...
    VinnimU:='';
    if not frmShtrafi.qShtrafi.FieldByName('VIZNATIVINNIM').IsNull then VinnimU:=frmShtrafi.qShtrafi.FieldByName('VIZNATIVINNIM').Value;
    BookmarkName:='Vinnim_U';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(VinnimU);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Що є порушенням...
    SchoEPorushennym:='';
    if not frmShtrafi.qShtrafi.FieldByName('PORUSHENINORMATIVNIAKTI').IsNull then SchoEPorushennym:=frmShtrafi.qShtrafi.FieldByName('PORUSHENINORMATIVNIAKTI').Value;
    BookmarkName:='Scho_E_Porushennym';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(SchoEPorushennym);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Накласти штраф на ...
    PIB_Porushnika_RV:='';
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').IsNull then PIB_Porushnika_RV:=frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').Value;
    BookmarkName:='Naklasti_Shtraf_Na';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_Porushnika_RV);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //у розмірі....
    Rozmir_Shtrafu:='';
    if not frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').IsNull then Rozmir_Shtrafu:=FloatToStr(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value);
    suma:=frmSumiShtrafuEdit.IntToStroka(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value);
    Valuta:=INIAZZ.ReadString('System','Money',Valuta);
    Rozmir_Shtrafu:=Rozmir_Shtrafu+' ('+suma+') '+Valuta;
    BookmarkName:='Rozmir_Shtrafu';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Rozmir_Shtrafu);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Штраф внести....
    RozrahunkovijRahunok:=INIAZZ.ReadString('Bank','RR',RozrahunkovijRahunok);
    Kod:=INIAZZ.ReadString('Bank','Kod',Kod);
    Oderzhuvach:=INIAZZ.ReadString('Bank','Orderzhuvach',Oderzhuvach);
    OKPO:=INIAZZ.ReadString('Bank','OKPO',OKPO);
    Bank:=INIAZZ.ReadString('Bank','Bank',Bank);
    MFO:=INIAZZ.ReadString('Bank','MFO',MFO);
    BookmarkName:='Rahunok';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(RozrahunkovijRahunok);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='Kod';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Kod);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='Oderzhuvach';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Oderzhuvach);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='OKPO';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(OKPO);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='bank';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Bank);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='MFO';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(MFO);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Своєчасно не сплачений штраф...
    Rozmir_Shtrafu:='';
    suma:=frmSumiShtrafuEdit.IntToStroka(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value*2);
    Rozmir_Shtrafu:=FloatToStr(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value*2)+' ('+suma+') '+Valuta;
    BookmarkName:='Suma_Shtrafu_x2';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Rozmir_Shtrafu);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Дата оскарження...
    DataOskarzhenny:='';
    DataOskarzhenny:=DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value+10);
    BookmarkName:='DataOskarzhenny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DataOskarzhenny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Підписи
    //П.І.Б., посада головного лікаря
    Posada_GDSL:='';
    if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value;
    Director:=0;
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    if Posada_GDSL='' then
      case Director of
        0: Posada_GDSL:=INIAZZ.ReadString('Director','Position_NV',Posada_GDSL);
        1: Posada_GDSL:=INIAZZ.ReadString('Director1','Position_NV',Posada_GDSL);
        2: Posada_GDSL:=INIAZZ.ReadString('Director2','Position_NV',Posada_GDSL);
      end;
    BookmarkName:='Posada_GDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Posada_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    PIB_GDSL:='';
    if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value;
    Director:=0;
    if PIB_GDSL='' then
      case Director of
        0: PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',Posada_GDSL);
        1: PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',Posada_GDSL);
        2: PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',Posada_GDSL);
      end;
    BookmarkName:='PIB_GDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    frmMain.sWordApp.AutoConnect:=false;
    frmMain.sWordApp.AutoQuit:=false;
  INIAZZ.Free;
}
end;

procedure TfrmShtrafi.aZayavaDoVDVSExecute(Sender: TObject);
var
  DocumentName, Doc, R, BookmarkName: OleVariant;
  Director: integer;
  FirmName, Rekviziti, Adresa, Telephon, Fax, e_mail, www, RR, Bank: string;
  MFO, okpo, Data_Nomer_Lista, PosadaGDSL, PIB_GDSL, NazvaOrganizacii: string;
  DocumentNaVikonanny, RekvizitiPorushnika, SumaShtrafu: string;
  Valuta, PIBBorzhnika, Kod_GRSL: string;
  Ministry,Teritory,District: integer;
begin
{
  Director:=0;
  if (frmShtrafi.qShtrafi.FieldByName('VIHIDNIJNOMER').Value='')or(frmShtrafi.qShtrafi.FieldByName('VIHIDNIJNOMER').IsNull) then exit;
  if frmMain.IsFormOpen('frmZayvaDoVDVS') then
    if frmZayvaDoVDVS.Showing then
      frmZayvaDoVDVS.aOKExecute(sender);
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    //друк у WORD або WORDPAD
    //перевірити, чи встановлено MS WORD на компьютері
    frmMain.sWordApp.Disconnect;
    frmMain.sWordApp.AutoConnect:=true;
    frmMain.sWordApp.AutoQuit:=true;
    frmMain.sWordApp.Visible:=false;
    try
      frmMain.sWordApp.Connect;
    except
      MessageDlg('Увага!'+#13+'Не можливо запустити MS Word!'+#13+'Перевірте, чи встановлено MS Word з пакету MS Office 2003 або пізнішої версії.'+#13+'За додатковою інформацією зверніться до свого системного адміністратора.',mtWarning,[mbOK],0);
      exit;
    end;
    DocumentName:=INIAZZ.ReadString('System','TemplatePath',DocumentName);
    DocumentName:=DocumentName+'\ZayavaDoVDVS.dot';
    frmMain.sWordApp.Connect;
    frmMain.sWordApp.Documents.Add(DocumentName,EmptyParam,EmptyParam,EmptyParam);
    if not frmMain.sWordApp.Visible then frmMain.sWordApp.Visible:=true;
    //ввод данных в отчет
    Doc:=frmMain.sWordApp.ActiveDocument;

    FirmName:='';
    FirmName:=INIAZZ.ReadString('Firm','FullName',FirmName);
    BookmarkName:='FirmName';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(FirmName);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //реквізити СЕС
    Rekviziti:='';
    Adresa:='';
    Adresa:=INIAZZ.ReadString('Firm','Adres',Adresa);
    if Adresa<>'' then Rekviziti:=Rekviziti+Adresa;
    Telephon:='';
    Telephon:=INIAZZ.ReadString('Firm','Phone',Telephon);
    if Telephon<>'' then Rekviziti:=Rekviziti+', тел. '+Telephon;
    Fax:='';
    Fax:=INIAZZ.ReadString('Firm','Fax',Fax);
    if Fax<>'' then Rekviziti:=Rekviziti+', факс '+Fax;
    e_mail:='';
    e_mail:=INIAZZ.ReadString('Firm','E-Mail',e_mail);
    if e_mail<>'' then Rekviziti:=Rekviziti+', E-Mail '+e_mail;
    www:='';
    www:=INIAZZ.ReadString('Firm','www',www);
    if www<>'' then Rekviziti:=Rekviziti+', WWW '+www;
    RR:='';
    RR:=INIAZZ.ReadString('Bank','RR',RR);
    if RR<>'' then Rekviziti:=Rekviziti+', розрахунковий рахунок '+RR;
    Bank:='';
    Bank:=INIAZZ.ReadString('Bank','Bank',Bank);
    if Bank<>'' then Rekviziti:=Rekviziti+' в '+Bank;
    MFO:='';
    MFO:=INIAZZ.ReadString('Bank','MFO',MFO);
    if MFO<>'' then Rekviziti:=Rekviziti+' МФО '+MFO;
    okpo:='';
    okpo:=INIAZZ.ReadString('Bank','OKPO',okpo);
    if okpo<>'' then Rekviziti:=Rekviziti+' код ОКПО '+okpo;
    BookmarkName:='Rekviziti';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Rekviziti);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //дата і вихідний номер заяви до ВДВС
    Data_Nomer_Lista:='';
    if not frmShtrafi.qShtrafi.FieldByName('DATAREESTRACIIZAYVI').IsNull then
      Data_Nomer_Lista:=DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAREESTRACIIZAYVI').Value)+'р. ';
    if not frmShtrafi.qShtrafi.FieldByName('VIHIDNIJNOMER').IsNull then
      Data_Nomer_Lista:=Data_Nomer_Lista+' №'+frmShtrafi.qShtrafi.FieldByName('VIHIDNIJNOMER').Value;
    BookmarkName:='DataNomerLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Data_Nomer_Lista);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Кому адресовано заяву
    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.Locate('MINISTRY',frmShtrafi.cbMinistry.Text,[]) then Ministry:=frmShtrafi.qTeritory.FieldByName('KOD').Value else Ministry:=0;

    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=Ministry;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[1].Name:='Teritory';
    frmShtrafi.qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.Locate('TERITORY',frmShtrafi.cbTeritory.Text,[]) then Teritory:=frmShtrafi.qTeritory.FieldByName('KOD').Value else Teritory:=0;

    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=Ministry;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[1].Name:='Teritory';
    frmShtrafi.qTeritory.Params[1].Value:=Teritory;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[2].Name:='Rajon';
    frmShtrafi.qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
    frmShtrafi.qTeritory.Open;
    if frmShtrafi.qTeritory.Locate('RAJON',frmShtrafi.cbRajon.Text,[]) then District:=frmShtrafi.qTeritory.FieldByName('KOD').Value else District:=0;

    frmShtrafi.qTeritory.SQL.Clear;
    frmShtrafi.qTeritory.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:VIDNOVLENNY and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi';
    frmShtrafi.qTeritory.Params.Clear;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[0].Name:='Ministry';
    frmShtrafi.qTeritory.Params[0].Value:=Ministry;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[1].Name:='Teritory';
    frmShtrafi.qTeritory.Params[1].Value:=Teritory;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[2].Name:='Rajon';
    frmShtrafi.qTeritory.Params[2].Value:=District;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[3].Name:='VIDNOVLENNY';
    frmShtrafi.qTeritory.Params[3].Value:='VDVS';
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[4].Name:='NomerPostanovi';
    frmShtrafi.qTeritory.Params[4].Value:=frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value;
    frmShtrafi.qTeritory.Params.Add;
    frmShtrafi.qTeritory.Params[5].Name:='DataPostanovi';
    frmShtrafi.qTeritory.Params[5].Value:=DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value);
    frmShtrafi.qTeritory.Open;
    frmShtrafi.qTeritory.First;

    frmShtrafi.memKomuNapravleno.Lines.Clear;
    frmShtrafi.memKomuNapravleno.Text:='';
    if frmShtrafi.qTeritory.RecordCount>0 then
      while not frmShtrafi.qTeritory.Eof do
      begin
        if not frmShtrafi.qTeritory.FieldByName('POSADA').IsNull then frmShtrafi.memKomuNapravleno.Lines.Add(frmShtrafi.qTeritory.FieldByName('POSADA').Value);
        if not frmShtrafi.qTeritory.FieldByName('PIB').IsNull then frmShtrafi.memKomuNapravleno.Lines.Add(frmShtrafi.qTeritory.FieldByName('PIB').Value);
        frmShtrafi.qTeritory.Next;
      end;
    frmShtrafi.memKomuNapravleno.Lines.Add('');
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    case Director of
      0:
        begin
          if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then
            PosadaGDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value
          else
            PosadaGDSL:=INIAZZ.ReadString('Director','Position_NV',PosadaGDSL);
          if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then
            PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value
          else
            PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
        end;
      1:
        begin
          if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then
            PosadaGDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value
          else
            PosadaGDSL:=INIAZZ.ReadString('Director1','Position_NV',PosadaGDSL);
          if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then
            PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value
          else
            PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
        end;
      2:
        begin
          if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then
            PosadaGDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value
          else
            PosadaGDSL:=INIAZZ.ReadString('Director2','Position_NV',PosadaGDSL);
          if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then
            PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value
          else
            PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
        end;
    end;
    frmShtrafi.memKomuNapravleno.Lines.Add(PosadaGDSL+' '+PIB_GDSL);
    frmShtrafi.memKomuNapravleno.Lines.Add('');
    NazvaOrganizacii:=INIAZZ.ReadString('Firm','Name',NazvaOrganizacii);
    frmShtrafi.memKomuNapravleno.Lines.Add(NazvaOrganizacii);
    Adresa:=INIAZZ.ReadString('Firm','Adres',Adresa);
    frmShtrafi.memKomuNapravleno.Lines.Add('('+Adresa+')');
    BookmarkName:='KomuNapravleno';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(frmShtrafi.memKomuNapravleno.Text);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //я, головний державний...
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    case Director of
      0:
        begin
          if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then
            PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value
          else
            PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
          if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then
            PosadaGDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value
          else
            PosadaGDSL:=INIAZZ.ReadString('Director','Position_NV',PosadaGDSL);
        end;
      1:
        begin
          if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then
            PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value
          else
            PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
          if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then
            PosadaGDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value
          else
            PosadaGDSL:=INIAZZ.ReadString('Director1','Position_NV',PosadaGDSL);
        end;
      2:
        begin
          if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then
            PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value
          else
            PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
          if not frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').IsNull then
            PosadaGDSL:=frmShtrafi.qShtrafi.FieldByName('POSADA_GDSL').Value
          else
            PosadaGDSL:=INIAZZ.ReadString('Director2','Position_NV',PosadaGDSL);
        end;
    end;
    BookmarkName:='PIB_Posada_GDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PosadaGDSL+' '+PIB_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //прошу прийняти на виконання...
    DocumentNaVikonanny:='';
    if not frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').IsNull then DocumentNaVikonanny:=DocumentNaVikonanny+' постанову про накладення штрафу №'+IntToStr(frmShtrafi.qShtrafi.FieldByName('NOMERPOSTANOVI').Value);
    if not frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').IsNull then DocumentNaVikonanny:=DocumentNaVikonanny+' від '+DateToStr(frmShtrafi.qShtrafi.FieldByName('DATAPOSTANOVI').Value)+' року';
    BookmarkName:='Dokument_Na_Vikonanny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DocumentNaVikonanny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //про стягнення з...
    RekvizitiPorushnika:='';
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').IsNull then RekvizitiPorushnika:=RekvizitiPorushnika+frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').Value;
    if not frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').IsNull then RekvizitiPorushnika:=RekvizitiPorushnika+', ідентифікаційний код: '+frmShtrafi.qShtrafi.FieldByName('IDENTIFIKACIJNIJNOMPORUSH').Value;
    if not frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').IsNull then RekvizitiPorushnika:=RekvizitiPorushnika+', місце народження: '+frmShtrafi.qShtrafi.FieldByName('MISCENARODZHENNYPORUSHNIK').Value;
    if not frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').IsNull then RekvizitiPorushnika:=RekvizitiPorushnika+', адреса проживання: '+frmShtrafi.qShtrafi.FieldByName('ADRESAPROGIVANNYPORUSHNIK').Value;
    if not frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').IsNull then RekvizitiPorushnika:=RekvizitiPorushnika+', місце роботи: '+frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').Value;
    BookmarkName:='PIB_Rekviziti_Porushnika';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(RekvizitiPorushnika);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //на суму...
    SumaShtrafu:='';
    if not frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').IsNull then SumaShtrafu:=SumaShtrafu+FloatToStr(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value);
    Valuta:=INIAZZ.ReadString('System','Money',Valuta);
    if not frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').IsNull then
      SumaShtrafu:=SumaShtrafu+' ('+frmSumiShtrafuEdit.IntToStroka(frmShtrafi.qShtrafi.FieldByName('ROZMIRSHTRAFU').Value)+') '+Valuta;
    BookmarkName:='Suma_Stygnenny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(SumaShtrafu);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //у разі несплати...
    PIBBorzhnika:='';
    if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').IsNull then PIBBorzhnika:=PIBBorzhnika+frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKARV').Value;
    BookmarkName:='PIB_Borzhnika';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIBBorzhnika);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //підписи
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    PIB_GDSL:='';
    Kod_GRSL:='';
    case Director of
      0:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
          Kod_GRSL:=INIAZZ.ReadString('Director','Kod',Kod_GRSL);
        end;
      1:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
          Kod_GRSL:=INIAZZ.ReadString('Director1','Kod',Kod_GRSL);
        end;
      2:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
          Kod_GRSL:=INIAZZ.ReadString('Director2','Kod',Kod_GRSL);
        end;
    end;
    BookmarkName:='Kod_Styguvacha';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Kod_GRSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    if not frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmShtrafi.qShtrafi.FieldByName('PIB_GDSL').Value;
    BookmarkName:='PIB_Styguvacha';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    frmMain.sWordApp.AutoConnect:=false;
    frmMain.sWordApp.AutoQuit:=false;
  INIAZZ.Free;
}
end;

procedure TfrmShtrafi.aNeSplacheniExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and POSTANOVASHTRAF.YEAR_=:Rik and (POSTANOVASHTRAF.NOMERPLATIZHNOGODOKUMENTU is null) ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (POSTANOVASHTRAF.DATAOSKARZHENNYPOSTANOVI is null) and (POSTANOVASHTRAF.DATAPEREDACHIDOVDVS is null) ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік не сплачених штрафів';
}
end;

procedure TfrmShtrafi.aNeVrucheniExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik and (POSTANOVASHTRAF.DATAVRUCHENNYPOSTANOVI is null) order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік не вручених постанов';
}
end;

procedure TfrmShtrafi.aPeredaniDoVDVSPeredaniExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (not POSTANOVASHTRAF.VIHIDNIJNOMER is null) and (not DATAPEREDACHIDOVDVS is null) and (not DATAREESTRACIIZAYVI is null) and (DATAPLATIZHNOGODOKUMENTU is null) and (NOMERPLATIZHNOGODOKUMENTU is null) order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік постанов переданих до ВДВС';
}
end;

procedure TfrmShtrafi.aRobochaBazaExecute(Sender: TObject);
begin
{
  frmMain.aShtrafiExecute(sender);
}
end;

procedure TfrmShtrafi.aPeredaniDoVDVSSplacheniExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and POSTANOVASHTRAF.YEAR_=:Rik and (not POSTANOVASHTRAF.VIHIDNIJNOMER is null) ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (not DATAPEREDACHIDOVDVS is null) and (not DATAREESTRACIIZAYVI is null) ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (not DATAPLATIZHNOGODOKUMENTU is null) and (not NOMERPLATIZHNOGODOKUMENTU is null) order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік постанов переданих до ВДВС і після сплачених';
}
end;

procedure TfrmShtrafi.aPrimusovoStygneniExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF,RAJONI where POSTANOVASHTRAF.YEAR_=:Rik and RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and (not POSTANOVASHTRAF.DATASTYGNENNY is null) order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rik';
    qShtrafi.Params[0].Value:=edtRik.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rajon';
    qShtrafi.Params[1].Value:=cbRajon.Text;
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік примусово стягнених постанов';
}
end;

procedure TfrmShtrafi.aNePeredaniDoVDVSExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF,RAJONI where (POSTANOVASHTRAF.DATAPOSTANOVI+15)<:DataPostanovi15 ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and POSTANOVASHTRAF.YEAR_=:Rik and RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (POSTANOVASHTRAF.NOMERPLATIZHNOGODOKUMENTU is null) and (POSTANOVASHTRAF.VIHIDNIJNOMER is null) ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (POSTANOVASHTRAF.DATAPEREDACHIDOVDVS is null) order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='DataPostanovi15';
    qShtrafi.Params[0].Value:=DateToStr(int(date));
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[2].Name:='Rajon';
    qShtrafi.Params[2].Value:=cbRajon.Text;
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік постанов не переданих до ВДВС';
}
end;

procedure TfrmShtrafi.aSkasovaniExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF,RAJONI where ';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'POSTANOVASHTRAF.YEAR_=:Rik';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+' and RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and (not POSTANOVASHTRAF.DATAOSKARZHENNYPOSTANOVI is null)';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'and ((POSTANOVASHTRAF.PRIJNYTERISHENNYPOOSKARZH=:Rishenny1)';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'or (POSTANOVASHTRAF.PRIJNYTERISHENNYPOOSKARZH=:Rishenny2))';
    qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rik';
    qShtrafi.Params[0].Value:=edtRik.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rajon';
    qShtrafi.Params[1].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[2].Name:='Rishenny1';
    qShtrafi.Params[2].Value:='скасувати постанову і закрити справу';
    qShtrafi.Params.Add;
    qShtrafi.Params[3].Name:='Rishenny2';
    qShtrafi.Params[3].Value:='скасувати постанову і направити справу на новий розгляд';
    qShtrafi.Open;
  end;
  frmShtrafi.Caption:='Перелік скасованих постанов';
}
end;

procedure TfrmShtrafi.aSpivrobitnikExecute(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    frmMain.Enabled:=false;
    with frmFilter do
    begin
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Штрафи: Співробітник';
      lblFilter.Caption:='Прізвище співробітника';
      Show;
      cbFilter.Text:='';
      cbFilter.Items.Clear;
      aUpdateExecute(sender);
      cbFilter.SetFocus;
    end;
  end;
}
end;

procedure TfrmShtrafi.aTipShtrafuExecute(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    if frmMain.ActiveMDIChild=frmShtrafi then
    begin
      frmMain.Enabled:=false;
      frmFilter.Show;
      frmFilter.BorderStyle:=bsDialog;
      frmFilter.Position:=poMainFormCenter;
      frmFilter.Caption:='Штрафи: Тип штрафу';
      frmFilter.lblFilter.Caption:='Тип штрафу';
      frmFilter.cbFilter.Text:='';
      frmFilter.cbFilter.Items.Clear;
      frmFilter.aUpdateExecute(sender);
      frmFilter.cbFilter.SetFocus;
    end;
  end;
}
end;

procedure TfrmShtrafi.aObjekt_AdresaExecute(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    if frmMain.ActiveMDIChild=frmShtrafi then
    begin
      frmMain.Enabled:=false;
      frmFilter.Show;
      frmFilter.BorderStyle:=bsDialog;
      frmFilter.Position:=poMainFormCenter;
      frmFilter.Caption:='Штрафи: Адреса об''єкту';
      frmFilter.lblFilter.Caption:='Адреса об''єкту';
      frmFilter.cbFilter.Text:='';
      frmFilter.cbFilter.Items.Clear;
      frmFilter.aUpdateExecute(sender);
      frmFilter.cbFilter.SetFocus;
    end;
  end;
}
end;

procedure TfrmShtrafi.aObjekt_NazvaExecute(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    if frmMain.ActiveMDIChild=frmShtrafi then
    begin
      frmMain.Enabled:=false;
      frmFilter.Show;
      frmFilter.BorderStyle:=bsDialog;
      frmFilter.Position:=poMainFormCenter;
      frmFilter.Caption:='Штрафи: Назва об''єкту';
      frmFilter.lblFilter.Caption:='Назва об''єкту';
      frmFilter.cbFilter.Text:='';
      frmFilter.cbFilter.Items.Clear;
      frmFilter.aUpdateExecute(sender);
      frmFilter.cbFilter.SetFocus;
    end;
  end;
}
end;

procedure TfrmShtrafi.aZaNomeromPostanoviExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
    Caption:='Журнал постанов про накладення штрафу';
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuPostanoviExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATAPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=true;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaPIBPorushnikaExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.PIBPORUSHNIKA';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
   aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=true;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaPosadojuPorushnikaExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.POSADAPORUSHNIKA';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=true;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaNazvojuObjektuExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.NAZVAOBJEKTU';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=true;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaAdresojuObjektuExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.ADRESAOBJEKTU';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=true;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaViddilonSESExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.VIDDILSES';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=true;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaPosadojuPredstavnikaSESExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.POSADAOSOBISES';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=true;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaPIBPredstavnikaSESExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.PIBOSOBISES';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
   aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=true;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuProtokoluExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATAPROTOKOLU';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=true;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaRozmiromShtrafuExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.ROZMIRSHTRAFU';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=true;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuOskarzhennyExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATAOSKARZHENNYPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=true;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuVruchennyExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATAVRUCHENNYPOSTANOVI';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=true;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuSplatiExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATAPLATIZHNOGODOKUMENTU';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
   aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=true;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuPeredachiDoVDVSExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATAPEREDACHIDOVDVS';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=true;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaDatojuStygnennyExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.DATASTYGNENNY';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=true;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaRezultatomOskarzhennyExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.PRIJNYTERISHENNYPOOSKARZH';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=true;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaNomeromAktuObstezhennyExecute(Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.NOMERAKTUOBSTEZHENNY';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=true;
    aZaNomeromPlatizhnogoDokumentu.Checked:=false;
  end;
}
end;

procedure TfrmShtrafi.aZaNomeromPlatizhnogoDokumentuExecute(
  Sender: TObject);
begin
{
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik order by POSTANOVASHTRAF.NOMERPLATIZHNOGODOKUMENTU';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rajon';
    qShtrafi.Params[0].Value:=cbRajon.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='Rik';
    qShtrafi.Params[1].Value:=edtRik.Text;
    qShtrafi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaPIBPorushnika.Checked:=false;
    aZaPosadojuPorushnika.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaViddilonSES.Checked:=false;
    aZaPosadojuPredstavnikaSES.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaDatojuProtokolu.Checked:=false;
    aZaRozmiromShtrafu.Checked:=false;
    aZaDatojuOskarzhenny.Checked:=false;
    aZaDatojuVruchenny.Checked:=false;
    aZaDatojuSplati.Checked:=false;
    aZaDatojuPeredachiDoVDVS.Checked:=false;
    aZaDatojuStygnenny.Checked:=false;
    aZaRezultatomOskarzhenny.Checked:=false;
    aZaNomeromAktuObstezhenny.Checked:=false;
    aZaNomeromPlatizhnogoDokumentu.Checked:=true;
  end;
}
end;

procedure TfrmShtrafi.FormCreate(Sender: TObject);
begin
{
  with frmMain do
  begin
    mnShtrafiChoices.Visible:=true;
    mnZahodiShtrafiNeSplacheni.Visible:=true;
    mnZahodiShtrafiNeVrucheni.Visible:=true;
    mnZahodiShtrafiPeredaniDoVDVS.Visible:=true;
    mnZahodiShtrafiPeredaniDoVDVSPeredani.Visible:=true;
    mnZahodiShtrafiPeredaniDoVDVSSplacheni.Visible:=true;
    mnZahodiShtrafiNePeredaniDoVDVS.Visible:=true;
    mnZahodiShtrafiPrimusovoStygneni.Visible:=true;
    mnZahodiShtrafiSkasovani.Visible:=true;
    mnZahodiShtrafiSpivrobitnik.Visible:=true;
    mnZahodiShtrafiTipShtrafu.Visible:=true;
    mnZahodiShtrafiObjekt.Visible:=true;
    mnZahodiShtrafiObjektAdresa.Visible:=true;
    mnZahodiShtrafiObjektNazva.Visible:=true;
    mnZahodiShtrafiRozdilT23F18.Visible:=true;
  end;
}
end;

procedure TfrmShtrafi.cbRajonChange(Sender: TObject);
begin
  frmShtrafi.aUpdateExecute(sender);
end;

procedure TfrmShtrafi.aRozdilT23F18Execute(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
      frmMain.Enabled:=false;
      frmFilter.Show;
      frmFilter.BorderStyle:=bsDialog;
      frmFilter.Position:=poMainFormCenter;
      frmFilter.Caption:='Штрафи: Розділ т.23 ф.18';
      frmFilter.lblFilter.Caption:='Розділ т.23 ф.18';
      frmFilter.cbFilter.Text:='';
      frmFilter.cbFilter.Items.Clear;
      frmFilter.aUpdateExecute(sender);
      frmFilter.cbFilter.SetFocus;
  end;
}
end;

procedure TfrmShtrafi.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmShtrafi.dsShtrafi;
end;

procedure TfrmShtrafi.aPidpisatiExecute(Sender: TObject);
var
  RecNo: integer;
begin
{
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  with frmShtrafi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set PIDPIS=1 where KOD=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  RecNo:=frmShtrafi.qShtrafi.FieldByName('KOD').Value;
  frmShtrafi.aUpdateExecute(sender);
  frmShtrafi.qShtrafi.Locate('KOD',RecNo,[]);
}
end;

procedure TfrmShtrafi.qShtrafiAfterScroll(DataSet: TDataSet);
begin
{
  if frmShtrafi.qShtrafi.FieldByName('PIDPIS').IsNull then
  begin
    frmShtrafi.aPidpisati.Caption:='Підписати';
    frmShtrafi.aPidpisati.Enabled:=true;
    frmShtrafi.aEdit.Enabled:=true;
    frmShtrafi.aDelete.Enabled:=true;
  end
  else
  begin
    frmShtrafi.aPidpisati.Caption:='Підписано';
    case frmShtrafi.qShtrafi.FieldByName('PIDPIS').Value of
      0:
        begin
          frmShtrafi.aPidpisati.Caption:='Підписати';
          frmShtrafi.aPidpisati.Enabled:=true;
          frmShtrafi.aEdit.Enabled:=true;
          frmShtrafi.aDelete.Enabled:=true;
        end;
      1:
        begin
          frmShtrafi.aPidpisati.Caption:='Підписано';
          frmShtrafi.aPidpisati.Enabled:=false;
          frmShtrafi.aEdit.Enabled:=false;
          frmShtrafi.aDelete.Enabled:=false;
        end;
    end;
  end;
}
end;

procedure TfrmShtrafi.aPrintExecute(Sender: TObject);
begin
{
  if frmShtrafi.qShtrafi.RecordCount<=0 then exit;
  if (not frmShtrafi.qShtrafi.FieldByName('EDITING').IsNull)and(frmShtrafi.qShtrafi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmPrintForm') then frmPrintForm:=TfrmPrintForm.Create(self);
  frmMain.Enabled:=false;
  with frmPrintForm do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Друк звіту';
    Show;
  end;
}
end;

procedure TfrmShtrafi.udRikChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  frmShtrafi.aUpdateExecute(sender);
end;

procedure TfrmShtrafi.edtRikChange(Sender: TObject);
begin
  try
    frmShtrafi.aUpdateExecute(sender);
  except
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    frmShtrafi.udRik.Position:=INIAZZ.ReadInteger('System','Year',frmShtrafi.udRik.Position);
    frmShtrafi.edtRik.Text:=IntToStr(frmShtrafi.udRik.Position);
    frmShtrafi.aUpdateExecute(sender);
    INIAZZ.Free;
  end;
end;

end.
