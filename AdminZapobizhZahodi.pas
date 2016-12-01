{
NOMER_RISHENNY, DATA_RISHENNY, DATA_VIDNOVLENNY_ROBIT,
NAZVA_POSTANOVI, ARCH,
}
{
CREATE TABLE POSTANOVA_ADMIN (
//    RECORD_ID                    INTEGER NOT NULL,
//    MINISTRY                     INTEGER,
//    TERITORY                     INTEGER,
//    DISTRICT                     INTEGER,
//    NOMER_POSTANOVI              INTEGER,
//    DATA_POSTANOVI               DATE,
//    NOMER_AKTU                   VARCHAR(20),
//    DATA_AKTU                    DATE,
//    NAZVA_OBJEKTU                VARCHAR(100),
//    PIB_KERIVNIKA                VARCHAR(100),
//    POSADA_KERIVNIKA             VARCHAR(100),
//    ADRESA_OBJEKTU               VARCHAR(150),
//    VID_POSTANOVI                VARCHAR(50),
//    NAJMENUVANNY_TOVARU          VARCHAR(150),
//    KILKIST_TOVARU               VARCHAR(50),
//    VAGA_ODINICI                 VARCHAR(25),
//    ZAGALNA_VAGA                 VARCHAR(25),
//    OTRIMANOGO_VID               VARCHAR(200),
//    VSTANOVIV                    BLOB SUB_TYPE 1 SEGMENT SIZE 2000,
//    SCHO_E_PORUSHENNYM           BLOB SUB_TYPE 1 SEGMENT SIZE 2000,
//    Z_DATA                       DATE,
//    Z_CHASU                      VARCHAR(10),
//    DO_DATA                      DATE,
//    DO_CHASU                     VARCHAR(10),
//    POSTIJNO                     INTEGER,
//    VIKONANNY_DO                 DATE,
//    DATA_VRUCHENNY               DATE,
//    DATA_ZNYTTY                  DATE,
//    DATA_OSKARZHENNY             DATE,
//    KUDI_OSKARZHENO              VARCHAR(70),
//    REZULTAT_OSKARZHENNY         VARCHAR(200),
//    VIDOMCHA_PIDPORYDKOVANIST    VARCHAR(100),
//    PIB_OSOBI_SES                VARCHAR(100),
//    POSADA_OSOBI_SES             VARCHAR(100),
//    KIM_RISHENNY_VIDNOVLENNY     VARCHAR(100),
    NOMER_RISHENNY               INTEGER,
    DATA_RISHENNY                DATE,
    DATA_VIDNOVLENNY_ROBIT       DATE,
//    NOMER_AKTU_OPLOMBUVANNY      INTEGER,
//    DATA_OPLOMBUVANNY            DATE,
//    PIB_SES_OPLOMBUVANNY         VARCHAR(100),
//    POSADA_SES_OPLOMBUVANNY      VARCHAR(100),
//    NAZVA_OBJEKTU_OPLOMBUVANNY   VARCHAR(150),
//    PIB_PREDSTAVNIKA             VARCHAR(100),
//    POSADA_PREDSTAVNIKA          VARCHAR(100),
//    OPECHATUVANNY_OPLOMBUVANNY   SMALLINT,
//    PRIMITKA                     VARCHAR(250),
//    USTATKUVANNY                 VARCHAR(250),
//    UMOVIVIDNOVLENNY             VARCHAR(250),
//    NOMER_LISTA                  VARCHAR(30),
//    DATA_LISTA                   DATE,
//    OSOBA_RAPORT                 VARCHAR(100),
//    POSADA_RAPORT                VARCHAR(100),
//    POSTANOVIV                   VARCHAR(300),
    NAZVA_POSTANOVI              VARCHAR(300),
//    PIDSTAVA_SCHODO_VIDNOVLENNY  BLOB SUB_TYPE 1 SEGMENT SIZE 2000,
//    Z_YKOI_DATI                  DATE,
//    DATA_VIDNOVLENNY_PRIMITKA    VARCHAR(300),
//    DATA_LISTA_RISHENNY          DATE,
//    NOMER_LISTA_RISHENNY         VARCHAR(15),
//    NOMER_LISTA_POVIDOMLENNY     VARCHAR(15),
//    DATA_LISTA_POVIDOMLENNY      DATE,
//    NAZVA_POSTANOVI_VIDNOVLENNY  VARCHAR(300),
//    NOMER_AKTU_PEREVIRKI         VARCHAR(20),
//    DATA_AKTU_PEREVIRKI          DATE,
//    ZAPISKA_AKT                  INTEGER,
//    ROZDIL_F18_T23               VARCHAR(100),
//    TIPSHTRAFIV                  VARCHAR(75),
//    SAMILIKVADACIY               INTEGER,
//    OBMEZHENNY_ASORTIMENTU       INTEGER,
    ARCH                         INTEGER,
//    YEAR_                        INTEGER,
//    NAZVAPOSTANOVIPOVIDOMLENNY   VARCHAR(300),
//    DATA_AKTU_DO                 DATE,
//    PIB_GDSL                     VARCHAR(125),
//    POSADA_GDSL                  VARCHAR(100)
);
}
unit AdminZapobizhZahodi;

interface

uses
  Forms, DB, Menus, IBCustomDataSet, IBQuery, Classes, ActnList, Grids,
  DBGrids, Controls, StdCtrls, ComCtrls, ExtCtrls, IniFiles, SysUtils,
  Dialogs, Variants;

type
  TfrmAdminZapobizhZahodi = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtYear: TEdit;
    udYear: TUpDown;
    btnYear: TButton;
    alPostanova_Admin: TActionList;
    aYear_Choice: TAction;
    Panel2: TPanel;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    btnTeritoryUpdate: TButton;
    aTeritoryUpdate: TAction;
    qTeritory: TIBQuery;
    DBGrid1: TDBGrid;
    PopupMenu: TPopupMenu;
    dsAdminZapobizhZahidi: TDataSource;
    qAdminZapobizhZahidi: TIBQuery;
    aUpdate: TAction;
    btnUpdate: TButton;
    N1: TMenuItem;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    aDistrictChange: TAction;
    N2: TMenuItem;
    aZaNomeromPostanovi: TAction;
    aZaDatojuPostanovi: TAction;
    aZaNazvojuObjektu: TAction;
    aZaAdresojuObjektu: TAction;
    aZaPIBPredstavnikaSES: TAction;
    aZaTipomPostanovi: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    btnClose: TButton;
    aClose: TAction;
    N11: TMenuItem;
    aNeZnytiZKontrolu: TAction;
    aOskarzheni: TAction;
    aNePovidomleni: TAction;
    aPovidomleni: TAction;
    aOpechatani: TAction;
    aNeVidnovleni: TAction;
    aObmezhennyAsortimentu: TAction;
    aNazvaObjektu: TAction;
    aAdresaObjektu: TAction;
    aPIBPredstavnikaSES: TAction;
    aTipPostanovi: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
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
    aRobochaBaza: TAction;
    N28: TMenuItem;
    N29: TMenuItem;
    btnAdd: TButton;
    btnVruchenny: TButton;
    btnOskarzhenny: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    aAdd: TAction;
    N21: TMenuItem;
    aEdit: TAction;
    aDelete: TAction;
    N26: TMenuItem;
    N27: TMenuItem;
    aVruchenny: TAction;
    N30: TMenuItem;
    aOskarzhenny: TAction;
    N31: TMenuItem;
    N32: TMenuItem;
    btnPovidomlenny: TButton;
    btnVidnovlennyRobit: TButton;
    btnOpechatuvanny: TButton;
    btnRaport: TButton;
    btnPrintPostanovaAdmin: TButton;
    btnZnyttyZKontrolu: TButton;
    btnPrintBigunikAdmin: TButton;
    btnPrintPovidomlennyAdmin: TButton;
    btnPrintAktAdmin: TButton;
    btnRishenny: TButton;
    aZnyttyZKontrolu: TAction;
    N33: TMenuItem;
    aPovidomlenny: TAction;
    N34: TMenuItem;
    aVidnovlennyRobit: TAction;
    aOpechatuvanny: TAction;
    aRaport: TAction;
    Label2: TLabel;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    aNeVrucheni: TAction;
    aPrintPostanovaAdmin: TAction;
    aPrintAktAdmin: TAction;
    aPrintBigunikAdmin: TAction;
    aPrintRishennyAdmin: TAction;
    aPrintPovidomlennyAdmin: TAction;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    memKomuNapravleno: TMemo;
    aRozdilT23F18: TAction;
    N23181: TMenuItem;
    btnPidpisati: TButton;
    aPidpisati: TAction;
    procedure aYear_ChoiceExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictChangeExecute(Sender: TObject);
    procedure aZaNomeromPostanoviExecute(Sender: TObject);
    procedure aZaDatojuPostanoviExecute(Sender: TObject);
    procedure aZaNazvojuObjektuExecute(Sender: TObject);
    procedure aZaAdresojuObjektuExecute(Sender: TObject);
    procedure aZaPIBPredstavnikaSESExecute(Sender: TObject);
    procedure aZaTipomPostanoviExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aNeVrucheniExecute(Sender: TObject);
    procedure aNeZnytiZKontroluExecute(Sender: TObject);
    procedure aOskarzheniExecute(Sender: TObject);
    procedure aNePovidomleniExecute(Sender: TObject);
    procedure aPovidomleniExecute(Sender: TObject);
    procedure aOpechataniExecute(Sender: TObject);
    procedure aNeVidnovleniExecute(Sender: TObject);
    procedure aObmezhennyAsortimentuExecute(Sender: TObject);
    procedure aNazvaObjektuExecute(Sender: TObject);
    procedure aAdresaObjektuExecute(Sender: TObject);
    procedure aPIBPredstavnikaSESExecute(Sender: TObject);
    procedure aTipPostanoviExecute(Sender: TObject);
    procedure aRobochaBazaExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aVruchennyExecute(Sender: TObject);
    procedure aOskarzhennyExecute(Sender: TObject);
    procedure aZnyttyZKontroluExecute(Sender: TObject);
    procedure aPovidomlennyExecute(Sender: TObject);
    procedure aVidnovlennyRobitExecute(Sender: TObject);
    procedure aOpechatuvannyExecute(Sender: TObject);
    procedure aRaportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aPrintPostanovaAdminExecute(Sender: TObject);
    procedure aPrintAktAdminExecute(Sender: TObject);
    procedure aPrintBigunikAdminExecute(Sender: TObject);
    procedure aPrintRishennyAdminExecute(Sender: TObject);
    procedure aPrintPovidomlennyAdminExecute(Sender: TObject);
    procedure aRozdilT23F18Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aPidpisatiExecute(Sender: TObject);
    procedure qAdminZapobizhZahidiAfterScroll(DataSet: TDataSet);
  end;

var
  frmAdminZapobizhZahodi: TfrmAdminZapobizhZahodi;

implementation

uses
  Main, AdminZapobizhZahodiEdit, Vruchenny, Oskarzhenny, Povidomlenny,
  VidnovlennyRobit, Opechanuvanny, Raport, Filter;

{$R *.dfm}

procedure TfrmAdminZapobizhZahodi.aYear_ChoiceExecute(Sender: TObject);
begin
  aUpdateExecute(sender);
end;

procedure TfrmAdminZapobizhZahodi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
  with frmMain do
  begin
    mnAdminChoices.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=false;
    mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=false;
  end;
end;

procedure TfrmAdminZapobizhZahodi.FormResize(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    cbMinistry.Left:=4;
    cbMinistry.Width:=trunc((Width-45)/3);
    cbTeritory.Left:=cbMinistry.Left+cbMinistry.Width+4;
    cbTeritory.Width:=trunc((Width-45)/3);
    cbDistrict.Left:=cbTeritory.Left+cbTeritory.Width+4;
    cbDistrict.Width:=trunc((Width-45)/3);
    btnTeritoryUpdate.Left:=cbDistrict.Left+cbDistrict.Width+4;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aTeritoryUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmAdminZapobizhZahodi do
  begin
    cbMinistry.Text:='';
    cbMinistry.Items.Clear;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbMinistry.Items.Add(qTeritory.FieldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
    if qTeritory.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qTeritory.FieldByName('MINISTRY').Value else cbMinistry.Text:='';

    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=cbMinistry.Text;
    qTeritory.Open;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';

    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbDistrict.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    cbDistrict.Text:=INIAZZ.ReadString('Teritory','District',cbDistrict.Text);
    if qTeritory.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qTeritory.FieldByName('RAJON').Value else cbDistrict.Text:='';
  end;
  INIAZZ.Free;
end;

procedure TfrmAdminZapobizhZahodi.aUpdateExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
    Caption:='Адміністративно-запобіжні заходи';
    exit;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aMinistryChangeExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=cbMinistry.Text;
    qTeritory.Open;
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbDistrict.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aDistrictChangeExecute(Sender: TObject);
begin
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
end;

procedure TfrmAdminZapobizhZahodi.aZaNomeromPostanoviExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
    Caption:='Адміністративно-запобіжні заходи';
  end;
end;

procedure TfrmAdminZapobizhZahodi.aZaDatojuPostanoviExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.DATA_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=true;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
    Caption:='Адміністративно-запобіжні заходи';
  end;
end;

procedure TfrmAdminZapobizhZahodi.aZaNazvojuObjektuExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.NAZVA_OBJEKTU';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=true;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
    Caption:='Адміністративно-запобіжні заходи';
  end;
end;

procedure TfrmAdminZapobizhZahodi.aZaAdresojuObjektuExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.ADRESA_OBJEKTU';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=true;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
    Caption:='Адміністративно-запобіжні заходи';
  end;
end;

procedure TfrmAdminZapobizhZahodi.aZaPIBPredstavnikaSESExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.PIB_OSOBI_SES';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=true;
    aZaTipomPostanovi.Checked:=false;
    Caption:='Адміністративно-запобіжні заходи';
  end;
end;

procedure TfrmAdminZapobizhZahodi.aZaTipomPostanoviExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik order by POSTANOVA_ADMIN.TIPSHTRAFIV';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=false;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=true;
    Caption:='Адміністративно-запобіжні заходи';
  end;
end;

procedure TfrmAdminZapobizhZahodi.aCloseExecute(Sender: TObject);
begin
  frmAdminZapobizhZahodi.Close;
end;

procedure TfrmAdminZapobizhZahodi.aNeVrucheniExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik and (DATA_VRUCHENNY is null) order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Не вручені постанови';
end;

procedure TfrmAdminZapobizhZahodi.aNeZnytiZKontroluExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and ((DATA_ZNYTTY is null) and (SAMILIKVADACIY is null))';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+' order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Не зняті з контролю';
end;

procedure TfrmAdminZapobizhZahodi.aOskarzheniExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and (not POSTANOVA_ADMIN.DATA_OSKARZHENNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Оскаржені постанови';
end;

procedure TfrmAdminZapobizhZahodi.aNePovidomleniExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and (NOMER_LISTA_POVIDOMLENNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and (DATA_LISTA_POVIDOMLENNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+' order by NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Не повідомлені';
end;

procedure TfrmAdminZapobizhZahodi.aPovidomleniExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and not (NOMER_LISTA_POVIDOMLENNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and not (DATA_LISTA_POVIDOMLENNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+' order by NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Повідомлені';
end;

procedure TfrmAdminZapobizhZahodi.aOpechataniExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and not (NOMER_AKTU_OPLOMBUVANNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and not (DATA_OPLOMBUVANNY is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+' order by NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Опечатані';
end;

procedure TfrmAdminZapobizhZahodi.aNeVidnovleniExecute(Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and (Z_YKOI_DATI is null) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+' order by NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Не відновленні';
end;

procedure TfrmAdminZapobizhZahodi.aObmezhennyAsortimentuExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'RAJONI.RAJON=:District ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and POSTANOVA_ADMIN.Year_=:Rik ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'and (OBMEZHENNY_ASORTIMENTU = 1) ';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+' order by NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=edtYear.Text;
    qAdminZapobizhZahidi.Open;
    aZaNomeromPostanovi.Checked:=true;
    aZaDatojuPostanovi.Checked:=false;
    aZaNazvojuObjektu.Checked:=false;
    aZaAdresojuObjektu.Checked:=false;
    aZaPIBPredstavnikaSES.Checked:=false;
    aZaTipomPostanovi.Checked:=false;
  end;
  frmAdminZapobizhZahodi.Caption:='Адмін. заходи: Обмеження асортименту';
end;

procedure TfrmAdminZapobizhZahodi.aNazvaObjektuExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmFilter.Show;
  frmMain.Enabled:=false;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.Caption:='Адмін. заходи: Об''єкти';
  frmFilter.lblFilter.Caption:='Об''єкт';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
  frmFilter.cbFilter.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.aAdresaObjektuExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmFilter.Show;
  frmMain.Enabled:=false;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.Caption:='Адмін. заходи: Адреса об''єкту';
  frmFilter.lblFilter.Caption:='Адреса';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
  frmFilter.cbFilter.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.aPIBPredstavnikaSESExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmFilter.Show;
  frmMain.Enabled:=false;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.Caption:='Адмін. заходи: Представник СЕС';
  frmFilter.lblFilter.Caption:='Представник СЕС';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
  frmFilter.cbFilter.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.aTipPostanoviExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmFilter.Show;
  frmMain.Enabled:=false;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.Caption:='Адмін. заходи: Тип постанови';
  frmFilter.lblFilter.Caption:='Тип постанови';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
  frmFilter.cbFilter.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.aRobochaBazaExecute(Sender: TObject);
begin
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
end;

procedure TfrmAdminZapobizhZahodi.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmAdminZapobizhZahodiEdit:=TfrmAdminZapobizhZahodiEdit.Create(self);
  frmMain.Enabled:=false;
  frmAdminZapobizhZahodiEdit.Show;
  frmAdminZapobizhZahodiEdit.Position:=poMainFormCenter;
  frmAdminZapobizhZahodiEdit.BorderStyle:=bsDialog;
  frmAdminZapobizhZahodiEdit.Caption:='Додавання постанови';
  with frmAdminZapobizhZahodiEdit do
  begin
    frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
    frmAdminZapobizhZahodi.qTeritory.SQL.Text:='insert into POSTANOVA_ADMIN (RECORD_ID) values (GEN_ID(GET_ADMIN_RECORD_ID,1))';
    frmAdminZapobizhZahodi.qTeritory.Open;
    frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
    frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from POSTANOVA_ADMIN order by POSTANOVA_ADMIN.RECORD_ID';
    frmAdminZapobizhZahodi.qTeritory.Open;
    frmAdminZapobizhZahodi.qTeritory.Last;
    frmAdminZapobizhZahodiEdit.edtRecordID.Text:=IntToStr(frmAdminZapobizhZahodi.qTeritory.FieldByName('RECORD_ID').Value);
    cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
    cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
    cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;

    aNomerPostanoviUpdateExecute(sender);
    edtNomerPostanovi.Enabled:=true;
    btnNomerPostanoviUpdate.Enabled:=true;
    dtpDataPostanovi.Date:=int(Date);
    dtpDataPostanovi.Enabled:=true;
    rgAkt_Raspiska.ItemIndex:=-1;
    aAkt_Raspiska_ChangeExecute(sender);
    rgAkt_Raspiska.Enabled:=true;
    dtpData_Z.Enabled:=true;
    dtpData_Do.Enabled:=true;
    edtNomer.Enabled:=true;

    //відомості про об"єкт
    edtNazvaObjektu.Text:='';
    edtNazvaObjektu.Enabled:=true;
    edtAdresaObjektu.Text:='';
    edtAdresaObjektu.Enabled:=true;
    edtVidomchaPidporydkovanist.Text:='';
    edtVidomchaPidporydkovanist.Enabled:=true;
    btnVidomchaPidporydkovanist.Enabled:=true;
    edtPIBKerivnika.Text:='';
    edtPIBKerivnika.Enabled:=true;
    edtPosadaKerivnika.Text:='';
    edtPosadaKerivnika.Enabled:=true;
    btnObjekt.Enabled:=true;
    cbRozdilT23F18.Text:='';
    cbRozdilT23F18.Items.Clear;
    aRozdilT23F18_UpdateExecute(sender);
    cbRozdilT23F18.Enabled:=true;
    btnRozdilT23F18_Update.Enabled:=true;
    btnRozdilT23F18_Choice.Enabled:=true;
    cbTipPostanovi.Text:='';
    cbTipPostanovi.Items.Clear;
    aTipPostanovi_UpdateExecute(sender);
    cbTipPostanovi.Enabled:=true;
    btnTipPostanovi_Update.Enabled:=true;
    btnTipPostanovi_Choice.Enabled:=true;
    aYearUpdateExecute(sender);
    edtYear.Enabled:=true;
    udYear.Enabled:=true;
    btnYear_Update.Enabled:=true;

    //лабораторний контроль
    DBGrid1.Align:=alClient;
    aUpdateLabKontrolExecute(sender);
    btnAddLabKontrol.Enabled:=true;
    btnEditLabKontrol.Enabled:=true;
    btnDeleteLabKontrol.Enabled:=true;
    btnUpdateLabKontrol.Enabled:=true;

    //постановив
    cbVidPostanovi.Text:='';
    cbVidPostanovi.Items.Clear;
    aVidPostanovi_UpdateExecute(sender);
    cbVidPostanovi.Enabled:=true;
    btnVidPostanovi_Update.Enabled:=true;
    btnVidPostanovi_Choice.Enabled:=true;
    edtNaimenovanieTovara.Text:='';
    edtNaimenovanieTovara.Enabled:=true;
    edtNaimenovanieTovara.Visible:=false;
    edtKilkistTovaru.Text:='';
    edtKilkistTovaru.Enabled:=true;
    edtKilkistTovaru.Visible:=false;
    edtVagaOdinici.Text:='';
    edtVagaOdinici.Enabled:=true;
    edtVagaOdinici.Visible:=false;
    edtZagalnaVaga.Text:='';
    edtZagalnaVaga.Enabled:=true;
    edtZagalnaVaga.Visible:=false;
    edtOtrimanogo.Text:='';
    edtOtrimanogo.Enabled:=true;
    edtOtrimanogo.Visible:=false;

    //суть порушення
    memVstanoviv.Lines.Clear;
    memVstanoviv.MaxLength:=$7FFFFFF0;
    memVstanoviv.Enabled:=true;
    btnVstanoviv.Enabled:=true;

    memSchoEPorushennym.Lines.Clear;
    memSchoEPorushennym.MaxLength:=$7FFFFFF0;
    memSchoEPorushennym.Enabled:=true;
    btnSchoEPorushennym.Enabled:=true;

    cbPostanoviv.Text:='';
    cbPostanoviv.Items.Clear;
    aPostanoviv_UpdateExecute(sender);
    cbPostanoviv.Enabled:=true;
    btnPostanoviv_Update.Enabled:=true;
    btnPostanoviv_Choice.Enabled:=true;

    dtpZ_Data.Date:=int(date);
    dtpZ_Data.Enabled:=true;
    edtZ_Chas.Text:='';
    edtZ_Chas.Enabled:=true;
    dtpDo_Data.Date:=int(date);
    dtpDo_Data.Enabled:=true;
    edtDo_Chas.Text:='';
    edtDo_Chas.Enabled:=true;
    cbxPostijno.Checked:=false;
    cbxPostijno.Enabled:=true;
    cbxObmezhennyAsortimentu.Checked:=false;
    cbxObmezhennyAsortimentu.Enabled:=true;
    cbUmoviVidnovlenny.Text:='';
    cbUmoviVidnovlenny.Items.Clear;
    aUmoviVidnovlenny_UpdateExecute(sender);
    cbUmoviVidnovlenny.Enabled:=true;
    btnUmoviVidnovlenny_Update.Enabled:=true;
    btnUmoviVidnovlenny_Choice.Enabled:=true;

    //додатково
    cbPIBOsobiSES.Text:='';
    cbPIBOsobiSES.Items.Clear;
    aPIBOsobiSES_UpdateExecute(sender);
    cbPIBOsobiSES.Enabled:=true;
    btnPIBOsobiSES_Update.Enabled:=true;
    btnPIBOsobiSES_Choice.Enabled:=true;
    cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Items.Clear;
    aPosadaOsobiSES_UpdateExecute(sender);
    cbPosadaOsobiSES.Enabled:=true;
    btnPosadaOsobiSES_Update.Enabled:=true;
    btnPosadaOsobiSES_Choice.Enabled:=true;
    aUpdateNapravlenoDoVidomaExecute(sender);
    aAddNapravlenoDoVidoma.Enabled:=true;
    aEditNapravlenoDoVidoma.Enabled:=true;
    aDeleteNapravlenoDoVidoma.Enabled:=true;
    aUpdateNapravlenoDoVidoma.Enabled:=true;
    edtPrimitka.Text:='';
    edtPrimitka.Enabled:=true;
    dtpInformaciyProVikonannyDo.Date:=int(date);
    dtpInformaciyProVikonannyDo.Enabled:=true;
    aGDSL_UpdateExecute(sender);
    edtPosada_GDSL.Enabled:=true;
    edtPIB_GDSL.Enabled:=true;
    btnGDSL.Enabled:=true;
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    frmAdminZapobizhZahodiEdit.edtNomerPostanovi.SetFocus;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aEditExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
  RecID: integer;
  Nom: integer;
  dat: TDate;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('EDITING').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmAdminZapobizhZahodiEdit:=TfrmAdminZapobizhZahodiEdit.Create(self);
  frmMain.Enabled:=false;
  frmAdminZapobizhZahodiEdit.Show;
  frmAdminZapobizhZahodiEdit.Position:=poMainFormCenter;
  frmAdminZapobizhZahodiEdit.BorderStyle:=bsDialog;
  frmAdminZapobizhZahodiEdit.Caption:='Редагування постанови';
  with frmAdminZapobizhZahodi do
  begin
    if not qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then RecID:=qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value else
    begin
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then Nom:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value;
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then dat:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FIeldByName('DATA_POSTANOVI').Value;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Clear;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set RECORD_ID=gen_id(GET_ADMIN_RECORD_ID,1) where NOMER_POSTANOVI=:Nomer and DATA_POSTANOVI=:Data';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Clear;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Name:='Nomer';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Value:=Nom;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Name:='Data';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Value:=DateToStr(dat);
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Open;
      frmMain.trAzz.CommitRetaining;
      frmAdminZapobizhZahodi.aUpdateExecute(sender);
      with frmAdminZapobizhZahodi.qAdminZapobizhZahidi do
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
      if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount>0 then RecID:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value;
    end;
//    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='update POSTANOVA_ADMIN set EDITING=1 where RECORD_ID=:Record_ID';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Record_ID';
    qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value;
    qTeritory.Open;
    frmMain.trAzz.CommitRetaining;
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Locate('RECORD_ID',RecID,[]) then frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Locate('RECORD_ID',RecID,[]) else frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Last;
  end;

  with frmAdminZapobizhZahodiEdit do
  begin
    edtRecordID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value);

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qComboBoxes.Open;
    if not qAdminZapobizhZahidi.FieldByName('MINISTRY').IsNull then cbMinistry.Text:=qAdminZapobizhZahidi.FieldByName('MINISTRY').Value else cbMinistry.Text:='';
    if qComboBoxes.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qComboBoxes.FieldByName('MINISTRY').Value else cbMinistry.Text:='';
    cbMinistry.Hint:=cbMinistry.Text;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=cbMinistry.Text;
    qComboBoxes.Open;
    if not qAdminZapobizhZahidi.FieldByName('TERITORY').IsNull then cbTeritory.Text:=qAdminZapobizhZahidi.FieldByName('TERITORY').Value else cbTeritory.Text:='';
    if qComboBoxes.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qComboBoxes.FieldByName('TERITORY').Value else cbTeritory.Text:='';
    cbTeritory.Hint:=cbTeritory.Text;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Teritory';
    qComboBoxes.Params[0].Value:=cbTeritory.Text;
    qComboBoxes.Open;
    if not qAdminZapobizhZahidi.FieldByName('DISTRICT').IsNull then cbDistrict.Text:=qAdminZapobizhZahidi.FieldByName('DISTRICT').Value else cbDistrict.Text:='';
    if qComboBoxes.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qComboBoxes.FieldByName('RAJON').Value else cbDistrict.Text:='';
    cbDistrict.Hint:=cbDistrict.Text;

    if not qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else edtNomerPostanovi.Text:='';
    edtNomerPostanovi.Enabled:=true;
    btnNomerPostanoviUpdate.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then dtpDataPostanovi.Date:=int(qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else dtpDataPostanovi.Date:=int(date);
    dtpDataPostanovi.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').IsNull then rgAkt_Raspiska.ItemIndex:=qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').Value else rgAkt_Raspiska.ItemIndex:=-1;
    rgAkt_Raspiska.Enabled:=true;
    rgAkt_Raspiska.Enabled:=true;
    dtpData_Z.Enabled:=true;
    dtpData_Do.Enabled:=true;
    edtNomer.Enabled:=true;
    aAkt_Raspiska_ChangeExecute(sender);

    //відомості про об"єкт
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    if not qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then edtNazvaObjektu.Text:=qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value else edtNazvaObjektu.Text:='';
    edtNazvaObjektu.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then edtAdresaObjektu.Text:=qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value else edtAdresaObjektu.Text:='';
    edtAdresaObjektu.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then edtVidomchaPidporydkovanist.Text:=qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else edtVidomchaPidporydkovanist.Text:='';
    edtVidomchaPidporydkovanist.Enabled:=true;
    btnVidomchaPidporydkovanist.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').IsNull then edtPIBKerivnika.Text:=qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').Value else edtPIBKerivnika.Text:='';
    edtPIBKerivnika.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').IsNull then edtPosadaKerivnika.Text:=qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').Value else edtPosadaKerivnika.Text:='';
    edtPosadaKerivnika.Enabled:=true;
    btnObjekt.Enabled:=true;
    cbRozdilT23F18.Text:='';
    cbRozdilT23F18.Items.Clear;
    aRozdilT23F18_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('ROZDIL_F18_T23').IsNull then cbRozdilT23F18.Text:=qAdminZapobizhZahidi.FieldByName('ROZDIL_F18_T23').Value else cbRozdilT23F18.Text:='';
    cbRozdilT23F18.Enabled:=true;
    btnRozdilT23F18_Update.Enabled:=true;
    btnRozdilT23F18_Choice.Enabled:=true;
    cbTipPostanovi.Text:='';
    cbTipPostanovi.Items.Clear;
    aTipPostanovi_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('TIPSHTRAFIV').IsNull then cbTipPostanovi.Text:=qAdminZapobizhZahidi.FieldByName('TIPSHTRAFIV').Value else cbTipPostanovi.Text:='';
    cbTipPostanovi.Enabled:=true;
    btnTipPostanovi_Update.Enabled:=true;
    btnTipPostanovi_Choice.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('YEAR_').IsNull then udYear.Position:=qAdminZapobizhZahidi.FieldByName('YEAR_').Value else aYearUpdateExecute(sender);
    edtYear.Text:=IntToStr(udYear.Position);
    edtYear.Enabled:=true;
    udYear.Enabled:=true;
    btnYear_Update.Enabled:=true;

    //лабораторний контроль
    DBGrid1.Align:=alClient;
    aUpdateLabKontrolExecute(sender);
    btnAddLabKontrol.Enabled:=true;
    btnEditLabKontrol.Enabled:=true;
    btnDeleteLabKontrol.Enabled:=true;
    btnUpdateLabKontrol.Enabled:=true;

    //постановив
    cbVidPostanovi.Text:='';
    cbVidPostanovi.Items.Clear;
    aVidPostanovi_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').IsNull then cbVidPostanovi.Text:=qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value else cbVidPostanovi.Text:='';
    aVidPostanovi_ChangeExecute(sender);
    cbVidPostanovi.Enabled:=true;
    btnVidPostanovi_Update.Enabled:=true;
    btnVidPostanovi_Choice.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').IsNull then edtNaimenovanieTovara.Text:=qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').Value else edtNaimenovanieTovara.Text:='';
    edtNaimenovanieTovara.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').IsNull then edtKilkistTovaru.Text:=qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').Value else edtKilkistTovaru.Text:='';
    edtKilkistTovaru.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').IsNull then edtVagaOdinici.Text:=qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').Value else edtVagaOdinici.Text:='';
    edtVagaOdinici.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').IsNull then edtZagalnaVaga.Text:=qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').Value else edtZagalnaVaga.Text:='';
    edtZagalnaVaga.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').IsNull then edtOtrimanogo.Text:=qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').Value else edtOtrimanogo.Text:='';
    edtOtrimanogo.Enabled:=true;

    //суть порушення
    memVstanoviv.Lines.Clear;
    memVstanoviv.MaxLength:=$7FFFFFF0;
    memVstanoviv.Enabled:=true;
    btnVstanoviv.Enabled:=true;
    BlobStream:=TMemoryStream.Create;
    try
      (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then
        memVstanoviv.Lines.Assign(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV') as TBlobField) else memVstanoviv.Lines.Clear;
    finally
      BlobStream.Free;
    end;

    memSchoEPorushennym.Lines.Clear;
    memSchoEPorushennym.MaxLength:=$7FFFFFF0;
    memSchoEPorushennym.Enabled:=true;
    btnSchoEPorushennym.Enabled:=true;
    BlobStream:=TMemoryStream.Create;
    try
      (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then
        memSchoEPorushennym.Lines.Assign(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField) else memSchoEPorushennym.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    cbPostanoviv.Text:='';
    cbPostanoviv.Items.Clear;
    aPostanoviv_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('POSTANOVIV').IsNull then cbPostanoviv.Text:=qAdminZapobizhZahidi.FieldByName('POSTANOVIV').Value else cbPostanoviv.Text:='';
    cbPostanoviv.Enabled:=true;
    btnPostanoviv_Update.Enabled:=true;
    btnPostanoviv_Choice.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('Z_DATA').IsNull then dtpZ_Data.Date:=int(qAdminZapobizhZahidi.FieldByName('Z_DATA').Value) else dtpZ_Data.Date:=int(date);
    dtpZ_Data.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('Z_CHASU').IsNull then edtZ_Chas.Text:=qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value else edtZ_Chas.Text:='';
    edtZ_Chas.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('DO_DATA').IsNull then dtpDo_Data.Date:=int(qAdminZapobizhZahidi.FieldByName('DO_DATA').Value) else dtpDo_Data.Date:=int(date);
    dtpDo_Data.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('DO_CHASU').IsNull then edtDo_Chas.Text:=qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value else edtDo_Chas.Text:='';
    edtDo_Chas.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('POSTIJNO').IsNull then
      case qAdminZapobizhZahidi.FieldByName('POSTIJNO').Value of
        0: cbxPostijno.Checked:=false;
        1: cbxPostijno.Checked:=true
      else
        cbxPostijno.Checked:=false;
      end;
    aPostijnoChangeExecute(sender);
    cbxPostijno.Enabled:=true;

    cbxObmezhennyAsortimentu.Checked:=false;
    if not qAdminZapobizhZahidi.FieldByName('OBMEZHENNY_ASORTIMENTU').IsNull then
      case qAdminZapobizhZahidi.FieldByName('OBMEZHENNY_ASORTIMENTU').Value of
        0: cbxObmezhennyAsortimentu.Checked:=false;
        1: cbxObmezhennyAsortimentu.Checked:=true;
      else
        cbxObmezhennyAsortimentu.Checked:=false;
      end;
    aObmezhennyAsortimentuChangeExecute(sender);
    cbxObmezhennyAsortimentu.Enabled:=true;
    cbUmoviVidnovlenny.Text:='';
    cbUmoviVidnovlenny.Items.Clear;
    aUmoviVidnovlenny_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull then cbUmoviVidnovlenny.Text:=qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value else cbUmoviVidnovlenny.Text:='';
    cbUmoviVidnovlenny.Enabled:=true;
    btnUmoviVidnovlenny_Update.Enabled:=true;
    btnUmoviVidnovlenny_Choice.Enabled:=true;

    //додатково
    cbPIBOsobiSES.Text:='';
    cbPIBOsobiSES.Items.Clear;
    aPIBOsobiSES_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('PIB_OSOBI_SES').IsNull then cbPIBOsobiSES.Text:=qAdminZapobizhZahidi.FieldByName('PIB_OSOBI_SES').Value else cbPIBOsobiSES.Text:='';
    cbPIBOsobiSES.Enabled:=true;
    btnPIBOsobiSES_Update.Enabled:=true;
    btnPIBOsobiSES_Choice.Enabled:=true;
    cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Items.Clear;
    aPosadaOsobiSES_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('POSADA_OSOBI_SES').IsNull then cbPosadaOsobiSES.Text:=qAdminZapobizhZahidi.FieldByName('POSADA_OSOBI_SES').Value else cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Enabled:=true;
    btnPosadaOsobiSES_Update.Enabled:=true;
    btnPosadaOsobiSES_Choice.Enabled:=true;
    aUpdateNapravlenoDoVidomaExecute(sender);
    aAddNapravlenoDoVidoma.Enabled:=true;
    aEditNapravlenoDoVidoma.Enabled:=true;
    aDeleteNapravlenoDoVidoma.Enabled:=true;
    aUpdateNapravlenoDoVidoma.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=qAdminZapobizhZahidi.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('VIKONANNY_DO').IsNull then dtpInformaciyProVikonannyDo.Date:=int(qAdminZapobizhZahidi.FieldByName('VIKONANNY_DO').Value) else dtpInformaciyProVikonannyDo.Date:=int(date);
    dtpInformaciyProVikonannyDo.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then
      edtPosada_GDSL.Text:=qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value else edtPosada_GDSL.Text:='';
    edtPosada_GDSL.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then
      edtPIB_GDSL.Text:=qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value else edtPIB_GDSL.Text:='';
    edtPIB_GDSL.Enabled:=true;
    btnGDSL.Enabled:=true;
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    frmAdminZapobizhZahodiEdit.edtNomerPostanovi.SetFocus;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aDeleteExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
  RecID: integer;
  Nom: integer;
  dat: TDate;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('EDITING').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmAdminZapobizhZahodiEdit:=TfrmAdminZapobizhZahodiEdit.Create(self);
  frmMain.Enabled:=false;
  frmAdminZapobizhZahodiEdit.Show;
  frmAdminZapobizhZahodiEdit.Position:=poMainFormCenter;
  frmAdminZapobizhZahodiEdit.BorderStyle:=bsDialog;
  frmAdminZapobizhZahodiEdit.Caption:='Видалення постанови';
  with frmAdminZapobizhZahodi do
  begin
    if not qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then RecID:=qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value else
    begin
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then Nom:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value;
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then dat:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FIeldByName('DATA_POSTANOVI').Value;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Clear;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set RECORD_ID=gen_id(GET_ADMIN_RECORD_ID,1) where NOMER_POSTANOVI=:Nomer and DATA_POSTANOVI=:Data';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Clear;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Name:='Nomer';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Value:=Nom;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Name:='Data';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Value:=DateToStr(dat);
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Open;
      frmMain.trAzz.CommitRetaining;
      frmAdminZapobizhZahodi.aUpdateExecute(sender);
      with frmAdminZapobizhZahodi.qAdminZapobizhZahidi do
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
      if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount>0 then RecID:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value;
    end;
//    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='update POSTANOVA_ADMIN set EDITING=1 where RECORD_ID=:Record_ID';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Record_ID';
    qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value;
    qTeritory.Open;
    frmMain.trAzz.CommitRetaining;
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Locate('RECORD_ID',RecID,[]) then frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Locate('RECORD_ID',RecID,[]) else frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Last;
  end;

  with frmAdminZapobizhZahodiEdit do
  begin
    edtRecordID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value);

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qComboBoxes.Open;
    if not qAdminZapobizhZahidi.FieldByName('MINISTRY').IsNull then cbMinistry.Text:=qAdminZapobizhZahidi.FieldByName('MINISTRY').Value else cbMinistry.Text:='';
    if qComboBoxes.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qComboBoxes.FieldByName('MINISTRY').Value else cbMinistry.Text:='';
    cbMinistry.Hint:=cbMinistry.Text;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=cbMinistry.Text;
    qComboBoxes.Open;
    if not qAdminZapobizhZahidi.FieldByName('TERITORY').IsNull then cbTeritory.Text:=qAdminZapobizhZahidi.FieldByName('TERITORY').Value else cbTeritory.Text:='';
    if qComboBoxes.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qComboBoxes.FieldByName('TERITORY').Value else cbTeritory.Text:='';
    cbTeritory.Hint:=cbTeritory.Text;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Teritory';
    qComboBoxes.Params[0].Value:=cbTeritory.Text;
    qComboBoxes.Open;
    if not qAdminZapobizhZahidi.FieldByName('DISTRICT').IsNull then cbDistrict.Text:=qAdminZapobizhZahidi.FieldByName('DISTRICT').Value else cbDistrict.Text:='';
    if qComboBoxes.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qComboBoxes.FieldByName('RAJON').Value else cbDistrict.Text:='';
    cbDistrict.Hint:=cbDistrict.Text;

    if not qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else edtNomerPostanovi.Text:='';
    edtNomerPostanovi.Enabled:=false;
    btnNomerPostanoviUpdate.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then dtpDataPostanovi.Date:=int(qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else dtpDataPostanovi.Date:=int(date);
    dtpDataPostanovi.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').IsNull then rgAkt_Raspiska.ItemIndex:=qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').Value else rgAkt_Raspiska.ItemIndex:=-1;
    rgAkt_Raspiska.Enabled:=false;
    rgAkt_Raspiska.Enabled:=false;
    dtpData_Z.Enabled:=false;
    dtpData_Do.Enabled:=false;
    edtNomer.Enabled:=false;
    aAkt_Raspiska_ChangeExecute(sender);

    //відомості про об"єкт
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    if not qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then edtNazvaObjektu.Text:=qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value else edtNazvaObjektu.Text:='';
    edtNazvaObjektu.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then edtAdresaObjektu.Text:=qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value else edtAdresaObjektu.Text:='';
    edtAdresaObjektu.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then edtVidomchaPidporydkovanist.Text:=qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else edtVidomchaPidporydkovanist.Text:='';
    edtVidomchaPidporydkovanist.Enabled:=false;
    btnVidomchaPidporydkovanist.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').IsNull then edtPIBKerivnika.Text:=qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').Value else edtPIBKerivnika.Text:='';
    edtPIBKerivnika.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').IsNull then edtPosadaKerivnika.Text:=qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').Value else edtPosadaKerivnika.Text:='';
    edtPosadaKerivnika.Enabled:=false;
    btnObjekt.Enabled:=false;
    cbRozdilT23F18.Text:='';
    cbRozdilT23F18.Items.Clear;
    aRozdilT23F18_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('ROZDIL_F18_T23').IsNull then cbRozdilT23F18.Text:=qAdminZapobizhZahidi.FieldByName('ROZDIL_F18_T23').Value else cbRozdilT23F18.Text:='';
    cbRozdilT23F18.Enabled:=false;
    btnRozdilT23F18_Update.Enabled:=false;
    btnRozdilT23F18_Choice.Enabled:=false;
    cbTipPostanovi.Text:='';
    cbTipPostanovi.Items.Clear;
    aTipPostanovi_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('TIPSHTRAFIV').IsNull then cbTipPostanovi.Text:=qAdminZapobizhZahidi.FieldByName('TIPSHTRAFIV').Value else cbTipPostanovi.Text:='';
    cbTipPostanovi.Enabled:=false;
    btnTipPostanovi_Update.Enabled:=false;
    btnTipPostanovi_Choice.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('YEAR_').IsNull then udYear.Position:=qAdminZapobizhZahidi.FieldByName('YEAR_').Value else aYearUpdateExecute(sender);
    edtYear.Text:=IntToStr(udYear.Position);
    edtYear.Enabled:=false;
    udYear.Enabled:=false;
    btnYear_Update.Enabled:=false;

    //лабораторний контроль
    DBGrid1.Align:=alClient;
    aUpdateLabKontrolExecute(sender);
    btnAddLabKontrol.Enabled:=false;
    btnEditLabKontrol.Enabled:=false;
    btnDeleteLabKontrol.Enabled:=false;
    btnUpdateLabKontrol.Enabled:=true;

    //постановив
    cbVidPostanovi.Text:='';
    cbVidPostanovi.Items.Clear;
    aVidPostanovi_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').IsNull then cbVidPostanovi.Text:=qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value else cbVidPostanovi.Text:='';
    aVidPostanovi_ChangeExecute(sender);
    cbVidPostanovi.Enabled:=false;
    btnVidPostanovi_Update.Enabled:=false;
    btnVidPostanovi_Choice.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').IsNull then edtNaimenovanieTovara.Text:=qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').Value else edtNaimenovanieTovara.Text:='';
    edtNaimenovanieTovara.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').IsNull then edtKilkistTovaru.Text:=qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').Value else edtKilkistTovaru.Text:='';
    edtKilkistTovaru.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').IsNull then edtVagaOdinici.Text:=qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').Value else edtVagaOdinici.Text:='';
    edtVagaOdinici.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').IsNull then edtZagalnaVaga.Text:=qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').Value else edtZagalnaVaga.Text:='';
    edtZagalnaVaga.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').IsNull then edtOtrimanogo.Text:=qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').Value else edtOtrimanogo.Text:='';
    edtOtrimanogo.Enabled:=false;

    //суть порушення
    memVstanoviv.Lines.Clear;
    memVstanoviv.MaxLength:=$7FFFFFF0;
    memVstanoviv.Enabled:=false;
    btnVstanoviv.Enabled:=false;
    BlobStream:=TMemoryStream.Create;
    try
      (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then
        memVstanoviv.Lines.Assign(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV') as TBlobField) else memVstanoviv.Lines.Clear;
    finally
      BlobStream.Free;
    end;

    memSchoEPorushennym.Lines.Clear;
    memSchoEPorushennym.MaxLength:=$7FFFFFF0;
    memSchoEPorushennym.Enabled:=false;
    btnSchoEPorushennym.Enabled:=false;
    BlobStream:=TMemoryStream.Create;
    try
      (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then
        memSchoEPorushennym.Lines.Assign(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField) else memSchoEPorushennym.Lines.Clear;
    finally
      BlobStream.Free;
    end;
    cbPostanoviv.Text:='';
    cbPostanoviv.Items.Clear;
    aPostanoviv_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('POSTANOVIV').IsNull then cbPostanoviv.Text:=qAdminZapobizhZahidi.FieldByName('POSTANOVIV').Value else cbPostanoviv.Text:='';
    cbPostanoviv.Enabled:=false;
    btnPostanoviv_Update.Enabled:=false;
    btnPostanoviv_Choice.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('Z_DATA').IsNull then dtpZ_Data.Date:=int(qAdminZapobizhZahidi.FieldByName('Z_DATA').Value) else dtpZ_Data.Date:=int(date);
    dtpZ_Data.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('Z_CHASU').IsNull then edtZ_Chas.Text:=qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value else edtZ_Chas.Text:='';
    edtZ_Chas.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('DO_DATA').IsNull then dtpDo_Data.Date:=int(qAdminZapobizhZahidi.FieldByName('DO_DATA').Value) else dtpDo_Data.Date:=int(date);
    dtpDo_Data.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('DO_CHASU').IsNull then edtDo_Chas.Text:=qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value else edtDo_Chas.Text:='';
    edtDo_Chas.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('POSTIJNO').IsNull then
      case qAdminZapobizhZahidi.FieldByName('POSTIJNO').Value of
        0: cbxPostijno.Checked:=false;
        1: cbxPostijno.Checked:=true
      else
        cbxPostijno.Checked:=false;
      end;
    cbxPostijno.Enabled:=false;
    cbxObmezhennyAsortimentu.Checked:=false;
    if not qAdminZapobizhZahidi.FieldByName('OBMEZHENNY_ASORTIMENTU').IsNull then
      case qAdminZapobizhZahidi.FieldByName('OBMEZHENNY_ASORTIMENTU').Value of
        0: cbxObmezhennyAsortimentu.Checked:=false;
        1: cbxObmezhennyAsortimentu.Checked:=true
      else
        cbxObmezhennyAsortimentu.Checked:=false;
      end;
    cbxObmezhennyAsortimentu.Enabled:=false;
    cbUmoviVidnovlenny.Text:='';
    cbUmoviVidnovlenny.Items.Clear;
    aUmoviVidnovlenny_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull then cbUmoviVidnovlenny.Text:=qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value else cbUmoviVidnovlenny.Text:='';
    cbUmoviVidnovlenny.Enabled:=false;
    btnUmoviVidnovlenny_Update.Enabled:=false;
    btnUmoviVidnovlenny_Choice.Enabled:=false;

    //додатково
    cbPIBOsobiSES.Text:='';
    cbPIBOsobiSES.Items.Clear;
    aPIBOsobiSES_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('PIB_OSOBI_SES').IsNull then cbPIBOsobiSES.Text:=qAdminZapobizhZahidi.FieldByName('PIB_OSOBI_SES').Value else cbPIBOsobiSES.Text:='';
    cbPIBOsobiSES.Enabled:=false;
    btnPIBOsobiSES_Update.Enabled:=false;
    btnPIBOsobiSES_Choice.Enabled:=false;
    cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Items.Clear;
    aPosadaOsobiSES_UpdateExecute(sender);
    if not qAdminZapobizhZahidi.FieldByName('POSADA_OSOBI_SES').IsNull then cbPosadaOsobiSES.Text:=qAdminZapobizhZahidi.FieldByName('POSADA_OSOBI_SES').Value else cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Enabled:=false;
    btnPosadaOsobiSES_Update.Enabled:=false;
    btnPosadaOsobiSES_Choice.Enabled:=false;
    aUpdateNapravlenoDoVidomaExecute(sender);
    aAddNapravlenoDoVidoma.Enabled:=false;
    aEditNapravlenoDoVidoma.Enabled:=false;
    aDeleteNapravlenoDoVidoma.Enabled:=false;
    aUpdateNapravlenoDoVidoma.Enabled:=true;
    if not qAdminZapobizhZahidi.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=qAdminZapobizhZahidi.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('VIKONANNY_DO').IsNull then dtpInformaciyProVikonannyDo.Date:=int(qAdminZapobizhZahidi.FieldByName('VIKONANNY_DO').Value) else dtpInformaciyProVikonannyDo.Date:=int(date);
    dtpInformaciyProVikonannyDo.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then
      edtPosada_GDSL.Text:=qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value else edtPosada_GDSL.Text:='';
    edtPosada_GDSL.Enabled:=false;
    if not qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then
      edtPIB_GDSL.Text:=qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value else edtPIB_GDSL.Text:='';
    edtPIB_GDSL.Enabled:=false;
    btnGDSL.Enabled:=false;
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    frmAdminZapobizhZahodiEdit.btnCancel.SetFocus;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aVruchennyExecute(Sender: TObject);
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  frmMain.Enabled:=false;
  if not frmMain.IsFormOpen('frmVruchenny') then frmVruchenny:=TfrmVruchenny.Create(self);
  frmVruchenny.Show;
  frmVruchenny.Enabled:=true;
  frmVruchenny.Caption:='Дата вручення постанови';
  frmVruchenny.Position:=poMainFormCenter;
  frmVruchenny.BorderStyle:=bsDialog;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmVruchenny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else frmVruchenny.edtNomerPostanovi.Text:='';
  frmVruchenny.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then frmVruchenny.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else frmVruchenny.dtpDataPostanovi.Date:=int(date);
  frmVruchenny.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then frmVruchenny.edtKod.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value) else frmVruchenny.edtKod.Text:='';
  frmVruchenny.edtKod.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VRUCHENNY').IsNull then frmVruchenny.dtpDataVruchenny.Date:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VRUCHENNY').Value else frmVruchenny.dtpDataVruchenny.Date:=int(date);
  frmVruchenny.dtpDataVruchenny.Enabled:=true;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VRUCHENNY').IsNull then
    if (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VRUCHENNY').Value>=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VRUCHENNY').Value<=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value+3) then MessageDlg('Увага!!!'+#13+'Цю постанову не було вручено або не введено дату вручення!!!'+#13+'Введіть дату вручення та збережіть ці відомості!!!',mtWarning,[mbOK],0);
  frmVruchenny.Label1.Caption:='Дата вручення постанови';
  frmVruchenny.cbSamolikvidaciy.Visible:=false;
  frmVruchenny.cbSamolikvidaciy.Enabled:=false;
end;

procedure TfrmAdminZapobizhZahodi.aOskarzhennyExecute(Sender: TObject);
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  frmMain.Enabled:=false;
  if not frmMain.IsFormOpen('frmOskarzhenny') then frmOskarzhenny:=TfrmOskarzhenny.Create(self);
  frmOskarzhenny.Show;
  frmOskarzhenny.Caption:='Оскарження постанови';
  frmOskarzhenny.Position:=poMainFormCenter;
  frmOskarzhenny.BorderStyle:=bsDialog;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmOskarzhenny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else frmOskarzhenny.edtNomerPostanovi.Text:='';
  frmOskarzhenny.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then frmOskarzhenny.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else frmOskarzhenny.dtpDataPostanovi.Date:=int(date);
  frmOskarzhenny.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then frmOskarzhenny.edtKod.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value) else frmOskarzhenny.edtKod.Text:='';
  frmOskarzhenny.edtKod.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OSKARZHENNY').IsNull then frmOskarzhenny.dtpDataOskarzhenny.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OSKARZHENNY').Value) else frmOskarzhenny.dtpDataOskarzhenny.Date:=int(date);
  frmOskarzhenny.dtpDataOskarzhenny.Enabled:=true;

  frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbKudiOskarzheno.Items.Clear;
  frmOskarzhenny.aKudiOskarzheno_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KUDI_OSKARZHENO').IsNull then frmOskarzhenny.cbKudiOskarzheno.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KUDI_OSKARZHENO').Value else frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbKudiOskarzheno.Enabled:=true;
  frmOskarzhenny.btnKudiOskarzheno_Update.Enabled:=true;
  frmOskarzhenny.btnKudiOskarzheno_Choice.Enabled:=true;

  frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Items.Clear;
  frmOskarzhenny.aRezultatOskarzhenny_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('REZULTAT_OSKARZHENNY').IsNull then frmOskarzhenny.cbRezultatOskarzhenny.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('REZULTAT_OSKARZHENNY').Value else frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Enabled:=true;
  frmOskarzhenny.btnRezultatOskarzhenny_Update.Enabled:=true;
  frmOskarzhenny.btnRezultatOskarzhenny_Choice.Enabled:=true;
end;

procedure TfrmAdminZapobizhZahodi.aZnyttyZKontroluExecute(Sender: TObject);
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  frmMain.Enabled:=false;
  if not frmMain.IsFormOpen('frmVruchenny') then frmVruchenny:=TfrmVruchenny.Create(self);
  frmVruchenny.Show;
  frmVruchenny.Enabled:=true;
  frmVruchenny.Caption:='Зняття з контролю';
  frmVruchenny.Position:=poMainFormCenter;
  frmVruchenny.BorderStyle:=bsDialog;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmVruchenny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else frmVruchenny.edtNomerPostanovi.Text:='';
  frmVruchenny.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then frmVruchenny.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else frmVruchenny.dtpDataPostanovi.Date:=int(date);
  frmVruchenny.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then frmVruchenny.edtKod.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value) else frmVruchenny.edtKod.Text:='';
  frmVruchenny.edtKod.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_ZNYTTY').IsNull then
  begin
    if (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_ZNYTTY').Value>=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_ZNYTTY').Value<=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value+3) then MessageDlg('Увага!!!'+#13+'Цю постанову не було вручено або не введено дату вручення!!!'+#13+'Введіть дату вручення та збережіть ці відомості!!!',mtWarning,[mbOK],0);
    if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_ZNYTTY').IsNull then frmVruchenny.dtpDataVruchenny.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_ZNYTTY').Value) else frmVruchenny.dtpDataVruchenny.Date:=int(date);
  end
  else
    frmVruchenny.dtpDataVruchenny.Date:=int(date);
  frmVruchenny.Label1.Caption:='Дата зняття з контролю';
  frmVruchenny.cbSamolikvidaciy.Visible:=true;
  frmVruchenny.cbSamolikvidaciy.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SAMILIKVADACIY').IsNull then
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SAMILIKVADACIY').Value of
      0: frmVruchenny.cbSamolikvidaciy.Checked:=false;
      1: frmVruchenny.cbSamolikvidaciy.Checked:=true;
    else
      frmVruchenny.cbSamolikvidaciy.Checked:=false;
    end
  else
    frmVruchenny.cbSamolikvidaciy.Checked:=false;
end;

procedure TfrmAdminZapobizhZahodi.aPovidomlennyExecute(Sender: TObject);
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPovidomlenny') then frmPovidomlenny:=TfrmPovidomlenny.Create(self);
  frmMain.Enabled:=false;
  frmPovidomlenny.Position:=poMainFormCenter;
  frmPovidomlenny.BorderStyle:=bsDialog;
  frmPovidomlenny.Caption:='Повідомлення про постанову адмін. заходів';
  frmPovidomlenny.Show;
  frmPovidomlenny.cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
  frmPovidomlenny.cbMinistry.Enabled:=false;
  frmPovidomlenny.cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
  frmPovidomlenny.cbTeritory.Enabled:=false;
  frmPovidomlenny.cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
  frmPovidomlenny.cbDistrict.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmPovidomlenny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else frmPovidomlenny.edtNomerPostanovi.Text:='';
  frmPovidomlenny.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then frmPovidomlenny.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else frmPovidomlenny.dtpDataPostanovi.Date:=int(date);
  frmPovidomlenny.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then frmPovidomlenny.edtKod.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value) else frmPovidomlenny.edtKod.Text:='';
  frmPovidomlenny.edtKod.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then frmPovidomlenny.edtNomerAktu.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value else frmPovidomlenny.edtNomerAktu.Text:='';
  frmPovidomlenny.edtNomerAktu.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then frmPovidomlenny.dtpDataAktu.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value) else frmPovidomlenny.dtpDataAktu.Date:=int(date);
  frmPovidomlenny.dtpDataAktu.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_POVIDOMLENNY').IsNull then frmPovidomlenny.edtNomerLista.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_POVIDOMLENNY').Value else frmPovidomlenny.edtNomerLista.Text:='';
  frmPovidomlenny.edtNomerLista.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_POVIDOMLENNY').IsNull then frmPovidomlenny.dtpDataLista.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_POVIDOMLENNY').Value) else frmPovidomlenny.dtpDataLista.Date:=int(date);
  frmPovidomlenny.dtpDataLista.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVAPOSTANOVIPOVIDOMLENNY').IsNull then frmPovidomlenny.edtNazvaPostanovi.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVAPOSTANOVIPOVIDOMLENNY').Value else frmPovidomlenny.aNazvaPostanoviUpdateExecute(sender);
  frmPovidomlenny.edtNazvaPostanovi.Enabled:=true;
  frmPovidomlenny.btnNazvaPostanovi.Enabled:=true;
  frmPovidomlenny.aKomuNapravlenoUpdateExecute(sender);
  frmPovidomlenny.aKomuNapravlenoAdd.Enabled:=true;
  frmPovidomlenny.aKomuNapravlenoEdit.Enabled:=true;
  frmPovidomlenny.aKomuNapravlenoDelete.Enabled:=true;
  frmPovidomlenny.aKomuNapravlenoUpdate.Enabled:=true;
end;

procedure TfrmAdminZapobizhZahodi.aVidnovlennyRobitExecute(
  Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidnovlennyRobit') then frmVidnovlennyRobit:=TfrmVidnovlennyRobit.Create(self);
  frmMain.Enabled:=false;
  frmVidnovlennyRobit.Show;
  frmVidnovlennyRobit.Position:=poMainFormCenter;
  frmVidnovlennyRobit.BorderStyle:=bsDialog;
  frmVidnovlennyRobit.Caption:='Відновлення робіт';
  frmVidnovlennyRobit.cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
  frmVidnovlennyRobit.cbMinistry.Enabled:=false;
  frmVidnovlennyRobit.cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
  frmVidnovlennyRobit.cbTeritory.Enabled:=false;
  frmVidnovlennyRobit.cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
  frmVidnovlennyRobit.cbDistrict.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmVidnovlennyRobit.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else frmVidnovlennyRobit.edtNomerPostanovi.Text:='';
  frmVidnovlennyRobit.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then frmVidnovlennyRobit.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else frmVidnovlennyRobit.dtpDataPostanovi.Date:=int(date);
  frmVidnovlennyRobit.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then frmVidnovlennyRobit.edtRecord_ID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value) else frmVidnovlennyRobit.edtRecord_ID.Text:='';
  frmVidnovlennyRobit.edtRecord_ID.Enabled:=false;

  frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsOne;
  frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text:='';
  frmVidnovlennyRobit.cbKimPrijnyteRishenny.Items.Clear;
  frmVidnovlennyRobit.aKimPrijnyteRishenny_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KIM_RISHENNY_VIDNOVLENNY').IsNull then frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KIM_RISHENNY_VIDNOVLENNY').Value else frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text:='';
  frmVidnovlennyRobit.cbKimPrijnyteRishenny.Enabled:=true;
  frmVidnovlennyRobit.btnKimPrijnyteRishenny_Update.Enabled:=true;
  frmVidnovlennyRobit.btnKimPrijnyteRishenny_Choice.Enabled:=true;

  frmVidnovlennyRobit.DBGrid1.Align:=alClient;
  frmVidnovlennyRobit.btnKogoPovidomlenoAdd.Enabled:=true;
  frmVidnovlennyRobit.btnKogoPovidomlenoEdit.Enabled:=true;
  frmVidnovlennyRobit.btnKogoPovidomlenoDelete.Enabled:=true;
  frmVidnovlennyRobit.btnKogoPovidomlenoUpdate.Enabled:=true;
  frmVidnovlennyRobit.aKogoPovidomlenoUpdateExecute(sender);

  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').IsNull then frmVidnovlennyRobit.edtVidPostanovi.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value else frmVidnovlennyRobit.edtVidPostanovi.Text:='';
  frmVidnovlennyRobit.edtVidPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then frmVidnovlennyRobit.edtNazvaObjektu.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value else frmVidnovlennyRobit.edtNazvaObjektu.Text:='';
  frmVidnovlennyRobit.edtNazvaObjektu.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then frmVidnovlennyRobit.edtVidomchaPidporydkovanist.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else frmVidnovlennyRobit.edtVidomchaPidporydkovanist.Text:='';
  frmVidnovlennyRobit.edtVidomchaPidporydkovanist.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_POSTANOVI_VIDNOVLENNY').IsNull then frmVidnovlennyRobit.edtNazvaPostanovi.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_POSTANOVI_VIDNOVLENNY').Value else frmVidnovlennyRobit.aNazvaPostanoviUpdateExecute(sender);
  frmVidnovlennyRobit.edtNazvaPostanovi.Enabled:=true;
  frmVidnovlennyRobit.btnNazvaPostanovi.Enabled:=true;

  frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsTwo;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU_PEREVIRKI').IsNull then frmVidnovlennyRobit.edtNomerAktuPerevirki.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU_PEREVIRKI').Value else frmVidnovlennyRobit.edtNomerAktuPerevirki.Text:='';
  frmVidnovlennyRobit.edtNomerAktuPerevirki.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_PEREVIRKI').IsNull then frmVidnovlennyRobit.dtpDataAktuPerevirki.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_PEREVIRKI').Value) else frmVidnovlennyRobit.dtpDataAktuPerevirki.Date:=int(date);
  frmVidnovlennyRobit.dtpDataAktuPerevirki.Enabled:=true;

  frmVidnovlennyRobit.DBGrid2.Align:=alClient;
  frmVidnovlennyRobit.btnLaboratornijKontrolAdd.Enabled:=true;
  frmVidnovlennyRobit.btnLaboratornijKontrolEdit.Enabled:=true;
  frmVidnovlennyRobit.btnLaboratornijKontrolDelete.Enabled:=true;
  frmVidnovlennyRobit.btnLaboratornijKontrolupdate.Enabled:=true;
  frmVidnovlennyRobit.aLaboratornijKontrolUpdateExecute(sender);

  frmVidnovlennyRobit.memPidstava.Lines.Clear;
  frmVidnovlennyRobit.memPidstava.MaxLength:=$7FFFFFF0;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDSTAVA_SCHODO_VIDNOVLENNY').IsNull then
  begin
    BlobStream:=TMemoryStream.Create;
    try
      (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDSTAVA_SCHODO_VIDNOVLENNY') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then frmVidnovlennyRobit.memPidstava.Lines.Assign(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDSTAVA_SCHODO_VIDNOVLENNY') as TBlobField) else frmVidnovlennyRobit.memPidstava.Lines.Clear;
    finally
      BlobStream.Free;
    end;
  end
  else
    frmVidnovlennyRobit.memPidstava.Lines.Clear;
  frmVidnovlennyRobit.memPidstava.Enabled:=true;
  frmVidnovlennyRobit.btnPidstava.Enabled:=true;

  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_YKOI_DATI').IsNull then frmVidnovlennyRobit.dtpDataVidnovlennyRobit.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_YKOI_DATI').Value) else frmVidnovlennyRobit.dtpDataVidnovlennyRobit.Date:=int(date);
  frmVidnovlennyRobit.dtpDataVidnovlennyRobit.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VIDNOVLENNY_PRIMITKA').IsNull then frmVidnovlennyRobit.edtDataVidnovlennyPrimitka.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VIDNOVLENNY_PRIMITKA').Value else frmVidnovlennyRobit.edtDataVidnovlennyPrimitka.Text:='';
  frmVidnovlennyRobit.edtDataVidnovlennyPrimitka.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_RISHENNY').IsNull then frmVidnovlennyRobit.dtpDataLista.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_RISHENNY').Value) else frmVidnovlennyRobit.dtpDataLista.Date:=int(date);
  frmVidnovlennyRobit.dtpDataLista.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_RISHENNY').IsNull then frmVidnovlennyRobit.edtNomerLista.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_RISHENNY').Value else frmVidnovlennyRobit.edtNomerLista.Text:='';
  frmVidnovlennyRobit.edtNomerLista.Enabled:=true;
  frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsOne;
end;

procedure TfrmAdminZapobizhZahodi.aOpechatuvannyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOpechanuvanny') then frmOpechanuvanny:=TfrmOpechanuvanny.Create(self);
  frmMain.Enabled:=false;
  frmOpechanuvanny.Show;
  frmOpechanuvanny.Caption:='Опечатування об''єкту';
  frmOpechanuvanny.BorderStyle:=bsDialog;
  frmOpechanuvanny.Position:=poMainFormCenter;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmOpechanuvanny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else frmOpechanuvanny.aRecordID_UpdateExecute(sender);
  frmOpechanuvanny.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then frmOpechanuvanny.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value) else frmOpechanuvanny.aRecordID_UpdateExecute(sender);
  frmOpechanuvanny.dtpDataPostanovi.Enabled:=false;
  frmOpechanuvanny.edtRecord_ID.Text:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').IsNull then frmOpechanuvanny.edtRecord_ID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value) else frmOpechanuvanny.aRecordID_UpdateExecute(sender);
  frmOpechanuvanny.edtRecord_ID.Enabled:=false;
  frmOpechanuvanny.aNomerAktuUpdateExecute(sender);
  frmOpechanuvanny.edtNomerAktuOplombuvanny.Enabled:=true;
  frmOpechanuvanny.dtpDataOplombuvanny.Enabled:=true;
  frmOpechanuvanny.btnNomerAktu.Enabled:=true;
  frmOpechanuvanny.cbPIBPredstavnikaSES.Text:='';
  frmOpechanuvanny.cbPIBPredstavnikaSES.Items.Clear;
  frmOpechanuvanny.aPIBPredstavnikaSES_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_SES_OPLOMBUVANNY').IsNull then frmOpechanuvanny.cbPIBPredstavnikaSES.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_SES_OPLOMBUVANNY').Value else frmOpechanuvanny.cbPIBPredstavnikaSES.Text:='';
  frmOpechanuvanny.cbPIBPredstavnikaSES.Enabled:=true;
  frmOpechanuvanny.btnPIBPredstavnikaSES_Update.Enabled:=true;
  frmOpechanuvanny.btnPIBPredstavnikaSES_Choice.Enabled:=true;
  frmOpechanuvanny.cbPosadaPredstavnikaSES.Text:='';
  frmOpechanuvanny.cbPosadaPredstavnikaSES.Items.Clear;
  frmOpechanuvanny.aPosadaPredstavnikaSES_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_SES_OPLOMBUVANNY').IsNull then frmOpechanuvanny.cbPosadaPredstavnikaSES.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_SES_OPLOMBUVANNY').Value else frmOpechanuvanny.cbPosadaPredstavnikaSES.Text:='';
  frmOpechanuvanny.cbPosadaPredstavnikaSES.Enabled:=true;
  frmOpechanuvanny.btnPosadaPredstavnikaSES_Update.Enabled:=true;
  frmOpechanuvanny.btnPosadaPredstavnikaSES_Choice.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU_OPLOMBUVANNY').IsNull then frmOpechanuvanny.edtNazvaObjektu.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU_OPLOMBUVANNY').Value else frmOpechanuvanny.edtNazvaObjektu.Text:='';
  frmOpechanuvanny.edtNazvaObjektu.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_PREDSTAVNIKA').IsNull then frmOpechanuvanny.edtPIBPredstavnikaObjektu.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_PREDSTAVNIKA').Value else frmOpechanuvanny.edtPIBPredstavnikaObjektu.Text:='';
  frmOpechanuvanny.edtPIBPredstavnikaObjektu.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_PREDSTAVNIKA').IsNull then frmOpechanuvanny.edtPosadaPredstavnikaObjektu.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_PREDSTAVNIKA').Value else frmOpechanuvanny.edtPosadaPredstavnikaObjektu.Text:='';
  frmOpechanuvanny.edtPosadaPredstavnikaObjektu.Enabled:=true;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OPECHATUVANNY_OPLOMBUVANNY').IsNull then frmOpechanuvanny.rgOpechatuvanny.ItemIndex:=-1 else
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OPECHATUVANNY_OPLOMBUVANNY').Value of
      0: frmOpechanuvanny.rgOpechatuvanny.ItemIndex:=0;
      1: frmOpechanuvanny.rgOpechatuvanny.ItemIndex:=1;
    else
      frmOpechanuvanny.rgOpechatuvanny.ItemIndex:=-1;
    end;
  frmOpechanuvanny.rgOpechatuvanny.Enabled:=true;
  frmOpechanuvanny.cbNazvaUstatkuvanny.Text:='';
  frmOpechanuvanny.cbNazvaUstatkuvanny.Items.Clear;
  frmOpechanuvanny.aNazvaUstatkuvanny_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('USTATKUVANNY').IsNull then frmOpechanuvanny.cbNazvaUstatkuvanny.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('USTATKUVANNY').Value else frmOpechanuvanny.cbNazvaUstatkuvanny.Text:='';
  frmOpechanuvanny.cbNazvaUstatkuvanny.Enabled:=true;
  frmOpechanuvanny.btnNazvaUstatkuvanny_Update.Enabled:=true;
  frmOpechanuvanny.btnNazvaUstatkuvanny_Choice.Enabled:=true;
  frmOpechanuvanny.edtNomerAktuOplombuvanny.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.aRaportExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRaport') then frmRaport:=TfrmRaport.Create(self);
  frmMain.Enabled:=false;
  frmRaport.Show;
  frmRaport.Caption:='Рапорт про зняття з контролю';
  frmRaport.BorderStyle:=bsDialog;
  frmRaport.Position:=poMainFormCenter;

  frmRaport.edtNomerPostanovi.Text:='';
  frmRaport.dtpDataPostanovi.Date:=int(date);
  frmRaport.edtRecord_ID.Text:='';
  frmRaport.aRecordID_UpdateExecute(sender);
  frmRaport.edtNomerPostanovi.Enabled:=false;
  frmRaport.dtpDataPostanovi.Enabled:=false;
  frmRaport.edtRecord_ID.Enabled:=false;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA').IsNull then frmRaport.edtNomerLista.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA').Value else frmRaport.edtNomerLista.Text:='';
  frmRaport.edtNomerLista.Enabled:=true;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA').IsNull then frmRaport.dtpDataLista.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA').Value) else frmRaport.dtpDataLista.Date:=int(date);
  frmRaport.dtpDataLista.Enabled:=true;
  frmRaport.cbPIBPredstavnika.Text:='';
  frmRaport.cbPIBPredstavnika.Items.Clear;
  frmRaport.aPIBPredstavnika_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OSOBA_RAPORT').IsNull then frmRaport.cbPIBPredstavnika.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OSOBA_RAPORT').Value else frmRaport.cbPIBPredstavnika.Text:='';
  frmRaport.cbPIBPredstavnika.Enabled:=true;
  frmRaport.cbPosadaPredstavnika.Text:='';
  frmRaport.cbPosadaPredstavnika.Items.Clear;
  frmRaport.aPosadaPredstavnika_UpdateExecute(sender);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_RAPORT').IsNull then frmRaport.cbPosadaPredstavnika.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_RAPORT').Value else frmRaport.cbPosadaPredstavnika.Text:='';
  frmRaport.cbPosadaPredstavnika.Enabled:=true;
  frmRaport.edtNomerLista.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.FormCreate(Sender: TObject);
begin
  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then
  begin
    with frmMain do
    begin
      mnAdminChoices.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnAdminChoices.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=false;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodi.aPrintPostanovaAdminExecute(
  Sender: TObject);
var
  DocumentName, Doc, BookmarkName, R: OleVariant;
  FirmName, DataPostanovi, NomerPostanovi, PIB_GDSL, Posada_GDSL,
  PIB_Posada_GDSL, Rozglynuvshi, Labortornij_Kontrol, Vstanoviv,
  SchoEPorushennym, Postanoviv, NajmenuvannyTovaru, KilkistTovaru,
  VagaOdinici, ZagalnaVaga, OtrimanogoVid, PeriodObmezhenny,
  VidnovlennyRobit, VidpovidalnistZaVikonanny, InformaciyProVikonanny,
  KopiiVrucheni, Primitka: string;
  Position: integer;
  Ministry,Teritory,District: integer;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
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
    DocumentName:=DocumentName+'\AdminZahodi.dot';
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
    if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then DataPostanovi:=' '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value)) else DataPostanovi:='';
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

    //номер постанови
    if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then NomerPostanovi:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
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

    //п.і.б., посада ГДСЛ
    Position:=0;
    Position:=INIAZZ.ReadInteger('System','Position',Position);
    PIB_Posada_GDSL:='';
    case Position of
      0:
        begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_NV',Posada_GDSL);
        end;
      1:
        begin
        PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director1','Position_NV',Posada_GDSL);
        end;
      2:
        begin
        PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director2','Position_NV',Posada_GDSL);
        end;
    end;
    PIB_Posada_GDSL:=Posada_GDSL+' '+PIB_GDSL;
    BookmarkName:='PIB_Posada_GolovnogoLikaraySES';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_Posada_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //розглянувши
  Rozglynuvshi:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').IsNull then
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').Value of
      0: if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+'інформаційну довідку від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value));
      1:
        begin
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+'акт відбору проб від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value))+'р. ';
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value;
        end;
      2:
        begin
          if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull)and(not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_DO').IsNull) then
            if int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value)>=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_DO').Value) then Rozglynuvshi:=Rozglynuvshi+'акт санітарно-епідеміологічного обстеження від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value))+'р.' else Rozglynuvshi:=Rozglynuvshi+'акт санітарно-епідеміологічного обстеження від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value))+' - '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_DO').Value))+'р. ';
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value;
        end;
    end;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' за адресою '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
  frmAdminZapobizhZahodi.qTeritory.Open;
  if frmAdminZapobizhZahodi.qTeritory.Locate('MINISTRY',frmAdminZapobizhZahodi.cbMinistry.Text,[]) then Ministry:=frmAdminZapobizhZahodi.qTeritory.FieldByName('KOD').Value else Ministry:=0;

  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=Ministry;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[1].Name:='Teritory';
  frmAdminZapobizhZahodi.qTeritory.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
  frmAdminZapobizhZahodi.qTeritory.Open;
  if frmAdminZapobizhZahodi.qTeritory.Locate('TERITORY',frmAdminZapobizhZahodi.cbTeritory.Text,[]) then Teritory:=frmAdminZapobizhZahodi.qTeritory.FieldByName('KOD').Value else Teritory:=0;

  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=Ministry;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[1].Name:='Teritory';
  frmAdminZapobizhZahodi.qTeritory.Params[1].Value:=Teritory;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[2].Name:='Rajon';
  frmAdminZapobizhZahodi.qTeritory.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
  frmAdminZapobizhZahodi.qTeritory.Open;
  if frmAdminZapobizhZahodi.qTeritory.Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=frmAdminZapobizhZahodi.qTeritory.FieldByName('KOD').Value else District:=0;

  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:Shtraf order by VIDKONTROLU';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=Ministry;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[1].Name:='Teritory';
  frmAdminZapobizhZahodi.qTeritory.Params[1].Value:=Teritory;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[2].Name:='Rajon';
  frmAdminZapobizhZahodi.qTeritory.Params[2].Value:=District;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[3].Name:='NomerPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[3].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[4].Name:='DataPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[4].Value:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[5].Name:='Shtraf';
  frmAdminZapobizhZahodi.qTeritory.Params[5].Value:='admin';
  frmAdminZapobizhZahodi.qTeritory.Open;
  Labortornij_Kontrol:='';
  if frmAdminZapobizhZahodi.qTeritory.RecordCount>0 then
  begin
    Labortornij_Kontrol:=' результати ';
    frmAdminZapobizhZahodi.qTeritory.First;
    while not frmAdminZapobizhZahodi.qTeritory.Eof do
    begin
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('VIDKONTROLU').IsNull then Labortornij_Kontrol:=Labortornij_Kontrol+' '+frmAdminZapobizhZahodi.qTeritory.FieldByName('VIDKONTROLU').Value;
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('NOMERIPROB').IsNull then Labortornij_Kontrol:=Labortornij_Kontrol+' №'+frmAdminZapobizhZahodi.qTeritory.FieldByName('NOMERIPROB').Value;
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('DATAKONTROLU').IsNull then Labortornij_Kontrol:=Labortornij_Kontrol+' від '+DateToStr(int(frmAdminZapobizhZahodi.qTeritory.FieldByName('DATAKONTROLU').Value));
      frmAdminZapobizhZahodi.qTeritory.Next;
    end;
  end;
  if Labortornij_Kontrol<>' результати ' then Rozglynuvshi:=Rozglynuvshi+Labortornij_Kontrol;
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

  //встановив
  Vstanoviv:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV').IsNull then Vstanoviv:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV').Value;
    BookmarkName:='Vstanoviv';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Vstanoviv);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //що є порушенням
  SchoEPorushennym:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM').IsNull then SchoEPorushennym:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM').Value;
    BookmarkName:='SchoEPorushennym';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(SchoEPorushennym);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //постановив
  //обмеження роботи
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').IsNull then
  begin
    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value='обмежити' then
    begin
      BookmarkName:='obmezhiti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=0;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='timchasovozaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='pripiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zupiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
    end;

    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value='тимчасово заборонити' then
    begin
      BookmarkName:='obmezhiti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='timchasovozaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=0;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='pripiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zupiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
    end;

    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value='заборонити' then
    begin
      BookmarkName:='obmezhiti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='timchasovozaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=0;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='pripiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zupiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
    end;

    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value='припинити' then
    begin
      BookmarkName:='obmezhiti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='timchasovozaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='pripiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=0;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zupiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
    end;

    if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value='зупинити' then
    begin
      BookmarkName:='obmezhiti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='timchasovozaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zaboroniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='pripiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=0;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=1;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
      BookmarkName:='zupiniti';
      if Doc.Bookmarks.Exists(BookmarkName) then
      begin
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Bold:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Italic:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.Underline:=1;
        Doc.Bookmarks.Item(BookmarkName).Range.Font.StrikeThrough:=0;
      end;
      BookmarkName := Unassigned;
      R := Unassigned;
    end;
  end;
  Postanoviv:='';
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSTANOVIV').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSTANOVIV').Value<>'') then Postanoviv:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSTANOVIV').Value;
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').Value<>'') then NajmenuvannyTovaru:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAJMENUVANNY_TOVARU').Value else NajmenuvannyTovaru:='';
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').Value<>'') then KilkistTovaru:=' у кількості '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KILKIST_TOVARU').Value else KilkistTovaru:='';
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').Value<>'') then VagaOdinici:=' вагою '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VAGA_ODINICI').Value else VagaOdinici:='';
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').Value<>'') then ZagalnaVaga:=' загальною вагою '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAGALNA_VAGA').Value else ZagalnaVaga:='';
  if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').Value<>'') then OtrimanogoVid:=' отриманого від '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OTRIMANOGO_VID').Value else OtrimanogoVid:='';
  if NajmenuvannyTovaru<>'' then Postanoviv:=Postanoviv+' '+NajmenuvannyTovaru;
  if KilkistTovaru<>'' then Postanoviv:=Postanoviv+' '+KilkistTovaru;
  if VagaOdinici<>'' then Postanoviv:=Postanoviv+' '+VagaOdinici;
  if ZagalnaVaga<>'' then Postanoviv:=Postanoviv+' '+ZagalnaVaga;
  if OtrimanogoVid<>'' then Postanoviv:=Postanoviv+' '+OtrimanogoVid;
    BookmarkName:='postanoviv';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Postanoviv);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //період обмеження роботи
  PeriodObmezhenny:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSTIJNO').IsNull then
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSTIJNO').Value of
      0:
        begin
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull then
            if (frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value='')or(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull) then
            begin
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').Value));
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value;
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_DATA').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' до '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_DATA').Value));
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value;
            end
            else
            begin
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').Value));
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value;
              if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' до '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value;
            end;
        end;
      1:
        begin
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').IsNull then PeriodObmezhenny:=' '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').Value));
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').IsNull then PeriodObmezhenny:=PeriodObmezhenny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value;
          PeriodObmezhenny:=PeriodObmezhenny+' постійно';
        end;
    end;
    BookmarkName:='periodobmezhenny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PeriodObmezhenny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //период ограничения работ (п.2)
  Position:=INIAZZ.ReadInteger('System','Position',Position);
  case Position of
    0:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_RV',Posada_GDSL);
      end;
    1:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director1','Position_RV',Posada_GDSL);
      end;
    2:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director2','Position_RV',Posada_GDSL);
      end;
  end;
  VidnovlennyRobit:=Posada_GDSL+' '+PIB_GDSL;
    BookmarkName:='PIBPosadaGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(VidnovlennyRobit);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //відповідальність за виконання (п.3)
  VidpovidalnistZaVikonanny:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').IsNull then VidpovidalnistZaVikonanny:=VidpovidalnistZaVikonanny+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').IsNull then VidpovidalnistZaVikonanny:=VidpovidalnistZaVikonanny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then VidpovidalnistZaVikonanny:=VidpovidalnistZaVikonanny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
    BookmarkName:='VidpovidalnistZaVikonanny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(VidpovidalnistZaVikonanny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //інформація про виконання (п.4)
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIKONANNY_DO').IsNull then InformaciyProVikonanny:=InformaciyProVikonanny+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIKONANNY_DO').Value));
    BookmarkName:='InformaciyProVikonanny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(InformaciyProVikonanny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //копии вручены
  KopiiVrucheni:='';
  with frmAdminZapobizhZahodi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    Open;
    if Locate('MINISTRY',frmAdminZapobizhZahodi.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

    SQL.Clear;
    SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=Ministry;
    Params.Add;
    Params[1].Name:='Teritory';
    Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    Open;
    if Locate('TERITORY',frmAdminZapobizhZahodi.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

    SQL.Clear;
    SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=Ministry;
    Params.Add;
    Params[1].Name:='Teritory';
    Params[1].Value:=Teritory;
    Params.Add;
    Params[2].Name:='Rajon';
    Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    Open;
    if Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
  end;
  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi and VIDNOVLENNY=:Vidnovlenny order by PIB';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=Ministry;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[1].Name:='Teritory';
  frmAdminZapobizhZahodi.qTeritory.Params[1].Value:=Teritory;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[2].Name:='Rajon';
  frmAdminZapobizhZahodi.qTeritory.Params[2].Value:=District;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[3].Name:='NomerPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[3].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[4].Name:='DataPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[4].Value:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[5].Name:='Vidnovlenny';
  frmAdminZapobizhZahodi.qTeritory.Params[5].Value:='postanova';
  frmAdminZapobizhZahodi.qTeritory.Open;
  frmAdminZapobizhZahodi.qTeritory.First;
  while not frmAdminZapobizhZahodi.qTeritory.Eof do
  begin
    if not frmAdminZapobizhZahodi.qTeritory.FieldByName('POSADA').IsNull then KopiiVrucheni:=KopiiVrucheni+' '+frmAdminZapobizhZahodi.qTeritory.FieldByName('POSADA').Value;
    if not frmAdminZapobizhZahodi.qTeritory.FieldByName('PIB').IsNull then KopiiVrucheni:=KopiiVrucheni+' '+frmAdminZapobizhZahodi.qTeritory.FieldByName('PIB').Value;
    frmAdminZapobizhZahodi.qTeritory.Next;
  end;
    BookmarkName:='KopiiVrucheni';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(KopiiVrucheni);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //примітка
  Primitka:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PRIMITKA').IsNull then Primitka:=Primitka+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PRIMITKA').Value;
    BookmarkName:='primitka';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Primitka);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //підпис
  PIB_GDSL:='';
  Posada_GDSL:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value;
  if (PIB_GDSL='')or(Posada_GDSL='') then
  begin
    Position:=INIAZZ.ReadInteger('System','Position',Position);
    case Position of
      0:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
          Posada_GDSL:=INIAZZ.ReadString('Director','Position_NV',Posada_GDSL);
         end;
     1:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
          Posada_GDSL:=INIAZZ.ReadString('Director1','Position_NV',Posada_GDSL);
        end;
      2:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
          Posada_GDSL:=INIAZZ.ReadString('Director2','Position_NV',Posada_GDSL);
        end;
    end;
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
end;

procedure TfrmAdminZapobizhZahodi.aPrintAktAdminExecute(Sender: TObject);
var
  DocumentName, Doc, BookmarkName, R: OleVariant;
  DataAktu, Mnoju, VPrisutnosti, NaVikonannyPostanovi, PIB_GDSL,
  Posada_GDSL, VidpovidalnistPokladaetsy, Posada_Predstavnika_SES,
  PIB_Predstavnika_SES: string;
  Position: integer;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU_OPLOMBUVANNY').IsNull then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OPLOMBUVANNY').IsNull then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OPECHATUVANNY_OPLOMBUVANNY').IsNull then exit;
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
    DocumentName:=DocumentName+'\AktOpechatuvanny.dot';
    frmMain.sWordApp.Connect;
    frmMain.sWordApp.Documents.Add(DocumentName,EmptyParam,EmptyParam,EmptyParam);
    if not frmMain.sWordApp.Visible then frmMain.sWordApp.Visible:=true;
    //ввод данных в отчет
    Doc:=frmMain.sWordApp.ActiveDocument;

  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OPLOMBUVANNY').IsNull then DataAktu:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OPLOMBUVANNY').Value));
    BookmarkName:='data';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DataAktu);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //Мною, ....
  Mnoju:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_SES_OPLOMBUVANNY').IsNull then Mnoju:=Mnoju+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_SES_OPLOMBUVANNY').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_SES_OPLOMBUVANNY').IsNull then Mnoju:=Mnoju+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_SES_OPLOMBUVANNY').Value;
    BookmarkName:='mnoju';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Mnoju);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //в присутності...
  VPrisutnosti:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_PREDSTAVNIKA').IsNull then VPrisutnosti:=VPrisutnosti+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_PREDSTAVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_PREDSTAVNIKA').IsNull then VPrisutnosti:=VPrisutnosti+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_PREDSTAVNIKA').Value;
    BookmarkName:='vprisutnosti';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(VPrisutnosti);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //на виконання постанови
  NaVikonannyPostanovi:='';
  Position:=0;
  Position:=INIAZZ.ReadInteger('System','Position',Position);
  case Position of
    0:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_RV',Posada_GDSL);
      end;
    1:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_RV',Posada_GDSL);
      end;
    2:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_RV',Posada_GDSL);
      end;
  end;
  NaVikonannyPostanovi:=Posada_GDSL+' '+PIB_GDSL;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then NaVikonannyPostanovi:=NaVikonannyPostanovi+' №'+IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then NaVikonannyPostanovi:=NaVikonannyPostanovi+' від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('USTATKUVANNY').IsNull then NaVikonannyPostanovi:=NaVikonannyPostanovi+' про '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('USTATKUVANNY').Value;

  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OPECHATUVANNY_OPLOMBUVANNY').IsNull then
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OPECHATUVANNY_OPLOMBUVANNY').Value of
      0: NaVikonannyPostanovi:=NaVikonannyPostanovi+', проведено опечатування ';
      1: NaVikonannyPostanovi:=NaVikonannyPostanovi+', проведено опломбування ';
    end;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then NaVikonannyPostanovi:=NaVikonannyPostanovi+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then NaVikonannyPostanovi:=NaVikonannyPostanovi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then NaVikonannyPostanovi:=NaVikonannyPostanovi+' за адресою '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
    BookmarkName:='vikonannyapostanovi';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NaVikonannyPostanovi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //відповідальність покладається
  VidpovidalnistPokladaetsy:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').IsNull then VidpovidalnistPokladaetsy:=VidpovidalnistPokladaetsy+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').IsNull then VidpovidalnistPokladaetsy:=VidpovidalnistPokladaetsy+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then VidpovidalnistPokladaetsy:=VidpovidalnistPokladaetsy+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
    BookmarkName:='vidpovidalnistpokladaetsya';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(VidpovidalnistPokladaetsy);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  Posada_Predstavnika_SES:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_SES_OPLOMBUVANNY').IsNull then Posada_Predstavnika_SES:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_SES_OPLOMBUVANNY').Value;
    BookmarkName:='PosadaSES';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Posada_Predstavnika_SES);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  PIB_Predstavnika_SES:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_SES_OPLOMBUVANNY').IsNull then PIB_Predstavnika_SES:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_SES_OPLOMBUVANNY').Value;
    BookmarkName:='PIBSES';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_Predstavnika_SES);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  frmMain.sWordApp.AutoConnect:=false;
  frmMain.sWordApp.AutoQuit:=false;
  INIAZZ.Free;
end;

procedure TfrmAdminZapobizhZahodi.aPrintBigunikAdminExecute(
  Sender: TObject);
var
  Position: integer;
  DocumentName, Doc, BookmarkName, R: OleVariant;
  PIB_GDSL, Posada_GDSL, NomerPostanovi, DataPostanovi, NomerLista,
  DataLista, PosadaOsobiSES, PIBOsobiSES: string;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA').IsNull then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA').IsNull then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_RAPORT').IsNull then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OSOBA_RAPORT').IsNull then exit;
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
    DocumentName:=DocumentName+'\Bigunok.dot';
    frmMain.sWordApp.Connect;
    frmMain.sWordApp.Documents.Add(DocumentName,EmptyParam,EmptyParam,EmptyParam);
    if not frmMain.sWordApp.Visible then frmMain.sWordApp.Visible:=true;
    //ввод данных в отчет
    Doc:=frmMain.sWordApp.ActiveDocument;

  Position:=INIAZZ.ReadInteger('System','Position',Position);
  case Position of
    0:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_DV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_DV',Posada_GDSL);
      end;
    1:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_DV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director1','Position_DV',Posada_GDSL);
      end;
    2:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_DV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director2','Position_DV',Posada_GDSL);
      end;
  end;
    BookmarkName:='PosadaGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Posada_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='PIBGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //текст бегунка
  Position:=INIAZZ.ReadInteger('System','Position',Position);
  case Position of
    0:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director','Position_RV',Posada_GDSL);
      end;
    1:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director1','Position_RV',Posada_GDSL);
      end;
    2:
      begin
        PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_RV',PIB_GDSL);
        Posada_GDSL:=INIAZZ.ReadString('Director2','Position_RV',Posada_GDSL);
      end;
  end;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value;
    BookmarkName:='GDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_GDSL+' '+Posada_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  NomerPostanovi:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then NomerPostanovi:=' № '+IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
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

  DataPostanovi:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then DataPostanovi:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value))+' року';
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

  NomerLista:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA').IsNull then NomerLista:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA').Value;
    BookmarkName:='NomerLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NomerLista);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  DataLista:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA').IsNull then DataLista:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA').Value));
    BookmarkName:='DataLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DataLista);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //посада особи СЕС
  PosadaOsobiSES:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_RAPORT').IsNull then PosadaOsobiSES:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_RAPORT').Value;
    BookmarkName:='posadases';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PosadaOsobiSES);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //П.І.Б. особи СЕС
  PIBOsobiSES:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OSOBA_RAPORT').IsNull then PIBOsobiSES:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('OSOBA_RAPORT').Value;
    BookmarkName:='pibses';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIBOsobiSES);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  frmMain.sWordApp.AutoConnect:=false;
  frmMain.sWordApp.AutoQuit:=false;
  INIAZZ.Free;
end;

procedure TfrmAdminZapobizhZahodi.aPrintRishennyAdminExecute(
  Sender: TObject);
var
  DocumentName, Doc, BookmarkName, R: OleVariant;
  FirmName, Adresa, Telefon, Faks, E_Mail, Rekviziti, RozrahukkovijRahunok,
  Bank, MFO, OKPO, NomerLista, DataLista, KimRishennyVidnovlenny,
  Povidomlyju, ProTeScho, NaPidstavi, DozvolyjuVidnoviti, DataVidnovlenny,
  PIB_GDSL, PosadaGDSL: string;
  Ministry, Teritory, District, Position: integer;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
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
    DocumentName:=DocumentName+'\RishennyVidnovlenny.dot';
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

  Adresa:='';
  Adresa:=INIAZZ.ReadString('Firm','Adres',Adresa);
  Telefon:='';
  Telefon:=INIAZZ.ReadString('Firm','Phone',Telefon);
  Faks:='';
  Faks:=INIAZZ.ReadString('Firm','Fax',Faks);
  E_Mail:='';
  E_Mail:=INIAZZ.ReadString('Firm','E-Mail',E_Mail);
  Rekviziti:='';
  if Adresa<>'' then Rekviziti:=Rekviziti+Adresa;
  if Telefon<>'' then Rekviziti:=Rekviziti+' тел.: '+Telefon;
  if Faks<>'' then Rekviziti:=Rekviziti+', факс: '+Faks;
  if E_Mail<>'' then Rekviziti:=Rekviziti+' E-Mail: '+E_Mail;
  RozrahukkovijRahunok:='';
  RozrahukkovijRahunok:=INIAZZ.ReadString('Bank','RR',RozrahukkovijRahunok);
  if RozrahukkovijRahunok<>'' then Rekviziti:=Rekviziti+' p/p '+RozrahukkovijRahunok;
  Bank:='';
  Bank:=INIAZZ.ReadString('Bank','Bank',Bank);
  if Bank<>'' then Rekviziti:=Rekviziti+' '+Bank;
  MFO:='';
  MFO:=INIAZZ.ReadString('Bank','MFO',MFO);
  if MFO<>'' then Rekviziti:=Rekviziti+' МФО '+MFO;
  OKPO:='';
  OKPO:=INIAZZ.ReadString('Bank','OKPO',OKPO);
  if OKPO<>'' then Rekviziti:=Rekviziti+' Код ОКПО '+OKPO;
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

  //номер та дата листа
  NomerLista:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_RISHENNY').IsNull then NomerLista:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_RISHENNY').Value;
    BookmarkName:='NomerLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NomerLista);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  DataLista:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_RISHENNY').IsNull then DataLista:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_RISHENNY').Value));
    BookmarkName:='DataLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DataLista);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //ким прийняте рішення щодо відновлення
  KimRishennyVidnovlenny:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KIM_RISHENNY_VIDNOVLENNY').IsNull then KimRishennyVidnovlenny:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('KIM_RISHENNY_VIDNOVLENNY').Value;
    BookmarkName:='PIBPosadaGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(KimRishennyVidnovlenny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //повідомляю...
  Povidomlyju:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').IsNull then Povidomlyju:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_KERIVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').IsNull then Povidomlyju:=Povidomlyju+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_KERIVNIKA').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then Povidomlyju:=Povidomlyju+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value+chr(13);
  with frmAdminZapobizhZahodi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    Open;
    if Locate('MINISTRY',frmAdminZapobizhZahodi.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

    SQL.Clear;
    SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=Ministry;
    Params.Add;
    Params[1].Name:='Teritory';
    Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    Open;
    if Locate('TERITORY',frmAdminZapobizhZahodi.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

    SQL.Clear;
    SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=Ministry;
    Params.Add;
    Params[1].Name:='Teritory';
    Params[1].Value:=Teritory;
    Params.Add;
    Params[2].Name:='Rajon';
    Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    Open;
    if Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
  end;
  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:Vidnovlenny and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by PIB';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=Ministry;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[1].Name:='Teritory';
  frmAdminZapobizhZahodi.qTeritory.Params[1].Value:=Teritory;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[2].Name:='Rajon';
  frmAdminZapobizhZahodi.qTeritory.Params[2].Value:=District;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[3].Name:='Vidnovlenny';
  frmAdminZapobizhZahodi.qTeritory.Params[3].Value:='rishenny';
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[4].Name:='NomerPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[4].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[5].Name:='DataPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[5].Value:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
  frmAdminZapobizhZahodi.qTeritory.Open;
  frmAdminZapobizhZahodi.qTeritory.First;
  if frmAdminZapobizhZahodi.qTeritory.RecordCount>0 then
    while not frmAdminZapobizhZahodi.qTeritory.Eof do
    begin
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('POSADA').IsNull then Povidomlyju:=Povidomlyju+', '+frmAdminZapobizhZahodi.qTeritory.FieldByName('POSADA').Value;
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('PIB').IsNull then Povidomlyju:=Povidomlyju+' - '+frmAdminZapobizhZahodi.qTeritory.FieldByName('PIB').Value+chr(13);
      frmAdminZapobizhZahodi.qTeritory.Next;
    end;
    BookmarkName:='Povidomlyaju';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Povidomlyju);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  // про те, що постанова....
  ProTeScho:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then ProTeScho:=ProTeScho+'   про те, що постанова '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then ProTeScho:=ProTeScho+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then ProTeScho:=ProTeScho+' №'+IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then ProTeScho:=ProTeScho+' від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVAPOSTANOVIPOVIDOMLENNY').IsNull then ProTeScho:=ProTeScho+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVAPOSTANOVIPOVIDOMLENNY').Value;
    BookmarkName:='ProTeScho';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(ProTeScho);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //на підставі....
  NaPidstavi:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDSTAVA_SCHODO_VIDNOVLENNY').IsNull then NaPidstavi:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDSTAVA_SCHODO_VIDNOVLENNY').Value;
    BookmarkName:='PidstavaVidnovlenny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NaPidstavi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //дозволяю відновити діяльність...
  DozvolyjuVidnoviti:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_POSTANOVI_VIDNOVLENNY').IsNull then DozvolyjuVidnoviti:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_POSTANOVI_VIDNOVLENNY').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then DozvolyjuVidnoviti:=DozvolyjuVidnoviti+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then DozvolyjuVidnoviti:=DozvolyjuVidnoviti+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then DozvolyjuVidnoviti:=DozvolyjuVidnoviti+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
    BookmarkName:='DozvolyajuVidnoviti';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DozvolyjuVidnoviti);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //з якої дати відновлення
  DataVidnovlenny:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_YKOI_DATI').IsNull then DataVidnovlenny:=DataVidnovlenny+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_YKOI_DATI').Value));
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VIDNOVLENNY_PRIMITKA').IsNull then DataVidnovlenny:=DataVidnovlenny+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_VIDNOVLENNY_PRIMITKA').Value;
    BookmarkName:='DataVidnovlenny';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(DataVidnovlenny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //підпис
  PIB_GDSL:='';
  PosadaGDSL:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then PosadaGDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value;
  if (PIB_GDSL='')or(PosadaGDSL='') then
  begin
    Position:=INIAZZ.ReadInteger('System','Position',Position);
    case Position of
      0:
        begin
          PosadaGDSL:=INIAZZ.ReadString('Director','Position_NV',PosadaGDSL);
          PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
        end;
      1:
        begin
          PosadaGDSL:=INIAZZ.ReadString('Director','Position_NV',PosadaGDSL);
          PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
        end;
      2:
        begin
          PosadaGDSL:=INIAZZ.ReadString('Director','Position_NV',PosadaGDSL);
          PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
        end;
    end;
  end;
    BookmarkName:='PIBGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PIB_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='PosadaGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PosadaGDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  frmMain.sWordApp.AutoConnect:=false;
  frmMain.sWordApp.AutoQuit:=false;
  INIAZZ.Free;
end;

procedure TfrmAdminZapobizhZahodi.aPrintPovidomlennyAdminExecute(
  Sender: TObject);
var
  DocumentName, Doc, BookmarkName, R: OleVariant;
  FirmName, Adresa, Telefon, Faks, E_Mail, Rekviziti, RozrahukkovijRahunok,
  Bank, MFO, OKPO, Nomer, Data, KomuNapravleno, Rozglynuvshi, Viyvleno,
  NaPidstavi, PIB_GDSL, Posada_GDSL: string;
  Ministry, Teritory, District, Position: integer;
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.RecordCount<=0 then exit;
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_POVIDOMLENNY').IsNull then exit;
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
    DocumentName:=DocumentName+'\Povidomlenny.dot';
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

  Adresa:='';
  Adresa:=INIAZZ.ReadString('Firm','Adres',Adresa);
  Telefon:='';
  Telefon:=INIAZZ.ReadString('Firm','Phone',Telefon);
  Faks:='';
  Faks:=INIAZZ.ReadString('Firm','Fax',Faks);
  E_Mail:='';
  E_Mail:=INIAZZ.ReadString('Firm','E-Mail',E_Mail);
  Rekviziti:='';
  if Adresa<>'' then Rekviziti:=Rekviziti+Adresa;
  if Telefon<>'' then Rekviziti:=Rekviziti+' тел.: '+Telefon;
  if Faks<>'' then Rekviziti:=Rekviziti+', факс: '+Faks;
  if E_Mail<>'' then Rekviziti:=Rekviziti+' E-Mail: '+E_Mail;
  RozrahukkovijRahunok:='';
  RozrahukkovijRahunok:=INIAZZ.ReadString('Bank','RR',RozrahukkovijRahunok);
  if RozrahukkovijRahunok<>'' then Rekviziti:=Rekviziti+' p/p '+RozrahukkovijRahunok;
  Bank:='';
  Bank:=INIAZZ.ReadString('Bank','Bank',Bank);
  if Bank<>'' then Rekviziti:=Rekviziti+' '+Bank;
  MFO:='';
  MFO:=INIAZZ.ReadString('Bank','MFO',MFO);
  if MFO<>'' then Rekviziti:=Rekviziti+' МФО '+MFO;
  OKPO:='';
  OKPO:=INIAZZ.ReadString('Bank','OKPO',OKPO);
  if OKPO<>'' then Rekviziti:=Rekviziti+' Код ОКПО '+OKPO;
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

  Nomer:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_POVIDOMLENNY').IsNull then Nomer:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_LISTA_POVIDOMLENNY').Value;
    BookmarkName:='NomerLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Nomer);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  Data:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_POVIDOMLENNY').IsNull then Data:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_LISTA_POVIDOMLENNY').Value));
    BookmarkName:='DataLista';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Data);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //кому направлено
  KomuNapravleno:='';
  with frmAdminZapobizhZahodi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    Open;
    if Locate('MINISTRY',frmAdminZapobizhZahodi.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

    SQL.Clear;
    SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=Ministry;
    Params.Add;
    Params[1].Name:='Teritory';
    Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    Open;
    if Locate('TERITORY',frmAdminZapobizhZahodi.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

    SQL.Clear;
    SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Ministry';
    Params[0].Value:=Ministry;
    Params.Add;
    Params[1].Name:='Teritory';
    Params[1].Value:=Teritory;
    Params.Add;
    Params[2].Name:='Rajon';
    Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    Open;
    if Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
  end;
  frmAdminZapobizhZahodi.qTeritory.SQL.Clear;
  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:Vidnovlenny and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by PIB';
  frmAdminZapobizhZahodi.qTeritory.Params.Clear;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[0].Name:='Ministry';
  frmAdminZapobizhZahodi.qTeritory.Params[0].Value:=Ministry;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[1].Name:='Teritory';
  frmAdminZapobizhZahodi.qTeritory.Params[1].Value:=Teritory;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[2].Name:='Rajon';
  frmAdminZapobizhZahodi.qTeritory.Params[2].Value:=District;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[3].Name:='Vidnovlenny';
  frmAdminZapobizhZahodi.qTeritory.Params[3].Value:='povidomlenny';
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[4].Name:='NomerPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[4].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value;
  frmAdminZapobizhZahodi.qTeritory.Params.Add;
  frmAdminZapobizhZahodi.qTeritory.Params[5].Name:='DataPostanovi';
  frmAdminZapobizhZahodi.qTeritory.Params[5].Value:=DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
//  frmAdminZapobizhZahodi.qTeritory.SQL.Text:='select * from NAPRAVLENODOVIDOMA where VIDNOVLENNY=''povidomlenny'' and NOMER_POSTANOVI='+IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value)+' and DATA_POSTANOVI='''+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value))+''' order by PIB';
  frmAdminZapobizhZahodi.qTeritory.Open;
  frmAdminZapobizhZahodi.memKomuNapravleno.Lines.Clear;
  frmAdminZapobizhZahodi.memKomuNapravleno.Text:='';
  frmAdminZapobizhZahodi.qTeritory.First;
  if frmAdminZapobizhZahodi.qTeritory.RecordCount>0 then
    while not frmAdminZapobizhZahodi.qTeritory.Eof do
    begin
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('POSADA').IsNull then frmAdminZapobizhZahodi.memKomuNapravleno.Lines.Add(frmAdminZapobizhZahodi.qTeritory.FieldByName('POSADA').Value);
      if not frmAdminZapobizhZahodi.qTeritory.FieldByName('PIB').IsNull then frmAdminZapobizhZahodi.memKomuNapravleno.Lines.Add(frmAdminZapobizhZahodi.qTeritory.FieldByName('PIB').Value);
      frmAdminZapobizhZahodi.qTeritory.Next;
    end;
    BookmarkName:='komunapravleno';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(frmAdminZapobizhZahodi.memKomuNapravleno.Text);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //розглянувши....
  Rozglynuvshi:='';
//  Rozglynuvshi1:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').IsNull then
  begin
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ZAPISKA_AKT').Value of
      0:
        begin
          Rozglynuvshi:=Rozglynuvshi+'інформаційну довідку';
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value));
        end;
      1:
        begin
          Rozglynuvshi:=Rozglynuvshi+'акт відбору проб';
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value));
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value;
        end;
      2:
        begin
          Rozglynuvshi:=Rozglynuvshi+'акт санітарно-епідеміологічного обстеження';
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value));
          if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value;
        end;
    end;
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

  //виявлено....
  Viyvleno:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV').IsNull then Viyvleno:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VSTANOVIV').Value;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM').IsNull then Viyvleno:=Viyvleno+', що є порушенням '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('SCHO_E_PORUSHENNYM').Value+'.';
    BookmarkName:='viyavleno';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Viyvleno);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

  //на підставі...
  NaPidstavi:='';
  if
    not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull
  then
    NaPidstavi:=NaPidstavi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value
  else
  begin
    Position:=0;
    Position:=INIAZZ.ReadInteger('System','Position',Position);
    case Position of
      0: Posada_GDSL:=INIAZZ.ReadString('Director','Position_RV',Posada_GDSL);
      1: Posada_GDSL:=INIAZZ.ReadString('Director1','Position_RV',Posada_GDSL);
      2: Posada_GDSL:=INIAZZ.ReadString('Director2','Position_RV',Posada_GDSL);
    end;
  end;
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').IsNull then NaPidstavi:=NaPidstavi+' від '+DateToStr(int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value));
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then NaPidstavi:=NaPidstavi+' № '+IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVAPOSTANOVIPOVIDOMLENNY').IsNull then NaPidstavi:=NaPidstavi+' '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVAPOSTANOVIPOVIDOMLENNY').Value;
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

  //підписи
  PIB_GDSL:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIB_GDSL').Value;
  Posada_GDSL:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSADA_GDSL').Value;
  if (PIB_GDSL='')or(Posada_GDSL='') then
  begin
    Position:=INIAZZ.ReadInteger('System','Position',Position);
    case Position of
      0:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
          Posada_GDSL:=INIAZZ.ReadString('Director','Position_NV',Posada_GDSL);
        end;
      1:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
          Posada_GDSL:=INIAZZ.ReadString('Director1','Position_NV',Posada_GDSL);
        end;
      2:
        begin
          PIB_GDSL:=INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
          Posada_GDSL:=INIAZZ.ReadString('Director2','Position_NV',Posada_GDSL);
        end;
    end;
  end;
    BookmarkName:='PosadaGDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Posada_GDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    BookmarkName:='PIBGDSL';
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
end;

procedure TfrmAdminZapobizhZahodi.aRozdilT23F18Execute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmFilter.Show;
  frmMain.Enabled:=false;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.Caption:='Адмін. заходи: Розділ т.23 ф.18';
  frmFilter.lblFilter.Caption:='Розділ т.23 ф.18';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
  frmFilter.cbFilter.SetFocus;
end;

procedure TfrmAdminZapobizhZahodi.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmAdminZapobizhZahodi.dsAdminZapobizhZahidi;
end;

procedure TfrmAdminZapobizhZahodi.aPidpisatiExecute(Sender: TObject);
var
  RecNo: integer;
begin
  with frmAdminZapobizhZahodi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVA_ADMIN set PIDPIS=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  RecNo:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value;
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
  frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmAdminZapobizhZahodi.qAdminZapobizhZahidiAfterScroll(
  DataSet: TDataSet);
begin
  if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDPIS').IsNull then
  begin
    frmAdminZapobizhZahodi.aPidpisati.Caption:='Підписати';
    frmAdminZapobizhZahodi.aPidpisati.Enabled:=true;
    frmAdminZapobizhZahodi.aEdit.Enabled:=true;
    frmAdminZapobizhZahodi.aDelete.Enabled:=true;
  end
  else
  begin
    frmAdminZapobizhZahodi.aPidpisati.Caption:='Підписано';
    case frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('PIDPIS').Value of
      0:
        begin
          frmAdminZapobizhZahodi.aPidpisati.Caption:='Підписати';
          frmAdminZapobizhZahodi.aPidpisati.Enabled:=true;
          frmAdminZapobizhZahodi.aEdit.Enabled:=true;
          frmAdminZapobizhZahodi.aDelete.Enabled:=true;
        end;
      1:
        begin
          frmAdminZapobizhZahodi.aPidpisati.Caption:='Підписано';
          frmAdminZapobizhZahodi.aPidpisati.Enabled:=false;
          frmAdminZapobizhZahodi.aEdit.Enabled:=false;
          frmAdminZapobizhZahodi.aDelete.Enabled:=false;
        end;
    end;
  end;
end;

end.
