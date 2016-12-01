{
POVODZHENNYZVILUCHENIM,
}
{
CREATE TABLE VILUCHENNY_Z_REALIZACII (
//    RECORD_ID                  INTEGER NOT NULL,
//    MINISTRY                   INTEGER,
//    TERITORY                   INTEGER,
//    DISTRICT                   INTEGER,
//    NOMER_POSTANOVI            INTEGER,
//    DATA_POSTANOVI             DATE,
//    NOMER_AKTU_OBSTEZHENNY     VARCHAR(15),
//    DATA_AKTU_OBSTEZHENNY      DATE,
//    DODATKOVA_INFORMACIY       VARCHAR(300),
//    NAZVA_OBJEKTU              VARCHAR(100),
//    VIDOMCHA_PIDPORYDKOVANIST  VARCHAR(100),
//    ADRESA                     VARCHAR(100),
//    PIB_KERIVNIKA              VARCHAR(100),
//    POSADA_KERIVNIKA           VARCHAR(100),
//    OSOBA_SES                  VARCHAR(100),
//    VIDDIL_SES                 VARCHAR(100),
//    POSADA_SES                 VARCHAR(100),
//    VSTANOVIV                  BLOB SUB_TYPE 1 SEGMENT SIZE 2000,
//    NE_VIDPOVIDAJUT            BLOB SUB_TYPE 1 SEGMENT SIZE 2000,
//    VILUCHITI                  VARCHAR(300),
//    DATA_VILUCHENNY            DATE,
//    CHAS_VILUCHENNY            VARCHAR(15),
//    ROZDIL_F18                 VARCHAR(100),
//    AKT_ZAPISKA                INTEGER,
//    DATA_VRUCHENNY             DATE,
//    DATA_OSKARZHENNY           DATE,
//    KUDI_OSKARZHENO            VARCHAR(150),
//    REZULTAT_OSKARZHENNY       VARCHAR(150),
//    NOMER_PLATIZHKI            VARCHAR(20),
//    DATA_SPLATI                DATE,
//    TIP_SHTRAFU                VARCHAR(75),
//    YEAR_                      INTEGER,
    POVODZHENNYZVILUCHENIM     INTEGER,
//    VIDOMOSTI_PRO_VILUCHENNY   SMALLINT,
//    TERMIN_REALIZACII          DATE,
//    TIPPRODUKCII               INTEGER,
//    DATA_AKTU_OBSTEZHENNY_DO   DATE,
//    POSADA_GDSL                VARCHAR(125),
//    PIB_GDSL                   VARCHAR(125)
);
}
unit ViluchennyZRealizacii;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils, Dialogs,
  Variants;
// , IBTable,
//  , ComObj;
// , Windows, Messages, Graphics,

type
  TfrmViluchennyZRealizacii = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    alViluchennyZRealizacii: TActionList;
    Panel2: TPanel;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    btnTeritoryUpdate: TButton;
    aTeritoryUpdate: TAction;
    qTeritory: TIBQuery;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    aDistrictChange: TAction;
    aAddViluchenny: TAction;
    aEditViluchenny: TAction;
    aDeleteViluchenny: TAction;
    aUpdateViluchenny: TAction;
    aCloseViluchenny: TAction;
    btnAddViluchenny: TButton;
    btnEditViluchenny: TButton;
    btnDeleteViluchenny: TButton;
    btnUpdateViluchenny: TButton;
    btnCloseViluchenny: TButton;
    btnVruchenny: TButton;
    btnVikonanny: TButton;
    btnOskazhenny: TButton;
    btnKopiy: TButton;
    Label3: TLabel;
    edtYear: TEdit;
    udYear: TUpDown;
    btnYearChoice: TButton;
    aYearChoice: TAction;
    dsViluchennyZRealizacii: TDataSource;
    qViluchennyZRealizacii: TIBQuery;
    PopupMenu: TPopupMenu;
    aSortByNomerPostanovi: TAction;
    aSortByDataPostanovi: TAction;
    aSortByNazvaObjektu: TAction;
    aSortByTipPostanovi: TAction;
    aSortByPIB_SES: TAction;
    aSortByPosadaSES: TAction;
    aSortByTipProdukcii: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    aViluchennyNeVrucheni: TAction;
    aViluchennyOskarzheni: TAction;
    aViluchennyNazvaObjektu: TAction;
    aViluchennyAdresaObjektu: TAction;
    aViluchennyTipPostanovi: TAction;
    aViluchennyPIB_SES: TAction;
    aViluchennyPosadaSES: TAction;
    aViluchennyTipProdukcii: TAction;
    aViluchennyRobochaBaza: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    aVruchenny: TAction;
    aOskarzhenny: TAction;
    aVikonanny: TAction;
    aCopy: TAction;
    Label2: TLabel;
    btnPostanovaDruk: TButton;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    aPrintPostanovaViluchenny: TAction;
    N32: TMenuItem;
    aViluchennyT23F18: TAction;
    N18231: TMenuItem;
    btnPidpis: TButton;
    aPidpis: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aDistrictChangeExecute(Sender: TObject);
    procedure aAddViluchennyExecute(Sender: TObject);
    procedure aEditViluchennyExecute(Sender: TObject);
    procedure aDeleteViluchennyExecute(Sender: TObject);
    procedure aUpdateViluchennyExecute(Sender: TObject);
    procedure aCloseViluchennyExecute(Sender: TObject);
    procedure aYearChoiceExecute(Sender: TObject);
    procedure aSortByNomerPostanoviExecute(Sender: TObject);
    procedure aSortByDataPostanoviExecute(Sender: TObject);
    procedure aSortByNazvaObjektuExecute(Sender: TObject);
    procedure aSortByTipPostanoviExecute(Sender: TObject);
    procedure aSortByPIB_SESExecute(Sender: TObject);
    procedure aSortByPosadaSESExecute(Sender: TObject);
    procedure aSortByTipProdukciiExecute(Sender: TObject);
    procedure aViluchennyRobochaBazaExecute(Sender: TObject);
    procedure aViluchennyNeVrucheniExecute(Sender: TObject);
    procedure aViluchennyOskarzheniExecute(Sender: TObject);
    procedure aViluchennyNazvaObjektuExecute(Sender: TObject);
    procedure aViluchennyAdresaObjektuExecute(Sender: TObject);
    procedure aViluchennyTipPostanoviExecute(Sender: TObject);
    procedure aViluchennyPIB_SESExecute(Sender: TObject);
    procedure aViluchennyPosadaSESExecute(Sender: TObject);
    procedure aViluchennyTipProdukciiExecute(Sender: TObject);
    procedure aVruchennyExecute(Sender: TObject);
    procedure aOskarzhennyExecute(Sender: TObject);
    procedure aVikonannyExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aPrintPostanovaViluchennyExecute(Sender: TObject);
    procedure aViluchennyT23F18Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aPidpisExecute(Sender: TObject);
    procedure qViluchennyZRealizaciiAfterScroll(DataSet: TDataSet);
  end;

var
  frmViluchennyZRealizacii: TfrmViluchennyZRealizacii;

implementation

uses
  Main, ViluchennyZRealizaciiEdit, Vruchenny, Oskarzhenny, Splata, Filter;

{$R *.dfm}

procedure TfrmViluchennyZRealizacii.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
  with frmMain do
  begin
    mnVibir_Viluchenny_Choices.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiNeVrucheni.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiOskarzheni.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiNazvaObjektu.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiAdresaObjektu.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiTipPostanovi.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciiTipProdukcii.Visible:=false;
    mnZahodiViluchenny_Z_RealizaciilRozdilT23F18.Visible:=false;
  end;
end;

procedure TfrmViluchennyZRealizacii.FormResize(Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    cbMinistry.Left:=4;
    cbMinistry.Width:=trunc((Width-btnTeritoryUpdate.Width-24)/3);
    cbTeritory.Left:=cbMinistry.Left+cbMinistry.Width+4;
    cbTeritory.Width:=trunc((Width-btnTeritoryUpdate.Width-24)/3);
    cbDistrict.Left:=cbTeritory.Left+cbTeritory.Width+4;
    cbDistrict.Width:=trunc((Width-btnTeritoryUpdate.Width-24)/3);
    btnTeritoryUpdate.Left:=cbDistrict.Left+cbDistrict.Width+4;
  end;
end;

procedure TfrmViluchennyZRealizacii.aTeritoryUpdateExecute(
  Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmViluchennyZRealizacii do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    cbMinistry.Text:='';
    cbMinistry.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbMinistry.Items.Add(qTeritory.FieldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
    if qTeritory.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qTeritory.FieldByName('MINISTRY').Value else cbMinistry.Text:='';

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
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';

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
    cbDistrict.Text:=INIAZZ.ReadString('Teritory','District',cbDistrict.Text);
    if qTeritory.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qTeritory.FieldByName('RAJON').Value else cbDistrict.Text:='';
  end;
  INIAZZ.Free;
end;

procedure TfrmViluchennyZRealizacii.aMinistryChangeExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
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

procedure TfrmViluchennyZRealizacii.aTeritoryChangeExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
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

procedure TfrmViluchennyZRealizacii.FormCreate(Sender: TObject);
begin
  with frmMain do
  begin
    mnVibir_Viluchenny_Choices.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiNeVrucheni.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiOskarzheni.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiNazvaObjektu.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiAdresaObjektu.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiTipPostanovi.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciiTipProdukcii.Visible:=true;
    mnZahodiViluchenny_Z_RealizaciilRozdilT23F18.Visible:=true;
  end;
end;

procedure TfrmViluchennyZRealizacii.aDistrictChangeExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aAddViluchennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViluchennyZRealizaciiEdit:=TfrmViluchennyZRealizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmViluchennyZRealizaciiEdit.Show;
  frmViluchennyZRealizaciiEdit.Position:=poMainFormCenter;
  frmViluchennyZRealizaciiEdit.BorderStyle:=bsDialog;
  frmViluchennyZRealizaciiEdit.Caption:='Додавання запису';
  frmViluchennyZRealizaciiEdit.cbMinistry.Text:=frmViluchennyZRealizacii.cbMinistry.Text;
  frmViluchennyZRealizaciiEdit.cbMinistry.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbTeritory.Text:=frmViluchennyZRealizacii.cbTeritory.Text;
  frmViluchennyZRealizaciiEdit.cbTeritory.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbDistrict.Text:=frmViluchennyZRealizacii.cbDistrict.Text;
  frmViluchennyZRealizaciiEdit.cbDistrict.Enabled:=false;
  frmViluchennyZRealizaciiEdit.edtRecordID.Text:='';
  frmViluchennyZRealizaciiEdit.edtRecordID.Enabled:=false;
  frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text:='';
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.btnNomerPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=-1;
  frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aAkt_Dovidka_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text:='';
  frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Enabled:=true;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
  frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text:='';
  frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtAdresa.Text:='';
  frmViluchennyZRealizaciiEdit.edtAdresa.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:='';
  frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtPosada.Text:='';
  frmViluchennyZRealizaciiEdit.edtPosada.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnVidomostiProObjekt.Enabled:=true;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProPereviryjuchogo;
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aOsobaSES_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnOsobaSES_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnOsobaSES_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbViddilSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aViddilSES_UdpateExecute(sender);
  frmViluchennyZRealizaciiEdit.cbViddilSES.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnViddilSES_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnViddilSES_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aPosadaSES_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnPosadaSES_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnPosadaSES_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Items.Clear;
  frmViluchennyZRealizaciiEdit.aTipProdukcii_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipProdukcii_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipProdukcii_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Items.Clear;
  frmViluchennyZRealizaciiEdit.aRozdil_T23_F18_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnRozdil_T23_F18_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnRozdil_T23_F18_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Items.Clear;
  frmViluchennyZRealizaciiEdit.aTipPostanovi_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipPostanovi_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipPostanovi_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtYear.Text:='';
  frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtYear.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnYear.Enabled:=true;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.btnAddViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnEditViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnDeleteViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnUpdateViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.DBGrid1.Align:=alClient;
  frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=-1;
  frmViluchennyZRealizaciiEdit.aVstanoviv_UpdateExecute(sender);

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsLaboratornijKontrol;
  frmViluchennyZRealizaciiEdit.aAddLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aEditLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aDeleteLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aUpdateLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
  frmViluchennyZRealizaciiEdit.GroupBox4.Align:=alClient;
  frmViluchennyZRealizaciiEdit.DBGrid2.Align:=alClient;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsZmistPostanovi;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnVstanoviv.Enabled:=true;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnNeVidpovidajut.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtViluchiti.Text:='';
  frmViluchennyZRealizaciiEdit.edtViluchiti.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnViluchiti.Enabled:=true;
  frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text:='';
  frmViluchennyZRealizaciiEdit.edtChasViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
  frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:='';
  frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:='';
  frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
  frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtPIBGDSL.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnGDSL.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
end;

procedure TfrmViluchennyZRealizacii.aEditViluchennyExecute(
  Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViluchennyZRealizaciiEdit:=TfrmViluchennyZRealizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmViluchennyZRealizaciiEdit.Show;
  frmViluchennyZRealizaciiEdit.Position:=poMainFormCenter;
  frmViluchennyZRealizaciiEdit.BorderStyle:=bsDialog;
  frmViluchennyZRealizaciiEdit.Caption:='Редагування запису';

  frmViluchennyZRealizaciiEdit.cbMinistry.Text:=frmViluchennyZRealizacii.cbMinistry.Text;
  frmViluchennyZRealizaciiEdit.cbMinistry.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbTeritory.Text:=frmViluchennyZRealizacii.cbTeritory.Text;
  frmViluchennyZRealizaciiEdit.cbTeritory.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbDistrict.Text:=frmViluchennyZRealizacii.cbDistrict.Text;
  frmViluchennyZRealizaciiEdit.cbDistrict.Enabled:=false;
  frmViluchennyZRealizaciiEdit.edtRecordID.Text:='';
  frmViluchennyZRealizaciiEdit.edtRecordID.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').IsNull then frmViluchennyZRealizaciiEdit.edtRecordID.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value) else frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').IsNull then frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').Value) else frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnNomerPostanovi.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').IsNull then frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').Value) else frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('AKT_ZAPISKA').IsNull then frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('AKT_ZAPISKA').Value else frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=-1;
  frmViluchennyZRealizaciiEdit.aAkt_Dovidka_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DODATKOVA_INFORMACIY').IsNull then frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DODATKOVA_INFORMACIY').Value else frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text:='';
  frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Enabled:=true;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NAZVA_OBJEKTU').IsNull then frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NAZVA_OBJEKTU').Value else frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text:='';
  frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ADRESA').IsNull then frmViluchennyZRealizaciiEdit.edtAdresa.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ADRESA').Value else frmViluchennyZRealizaciiEdit.edtAdresa.Text:='';
  frmViluchennyZRealizaciiEdit.edtAdresa.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_KERIVNIKA').IsNull then frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_KERIVNIKA').Value else frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:='';
  frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_KERIVNIKA').IsNull then frmViluchennyZRealizaciiEdit.edtPosada.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_KERIVNIKA').Value else frmViluchennyZRealizaciiEdit.edtPosada.Text:='';
  frmViluchennyZRealizaciiEdit.edtPosada.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnVidomostiProObjekt.Enabled:=true;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProPereviryjuchogo;
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aOsobaSES_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('OSOBA_SES').IsNull then frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('OSOBA_SES').Value else frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnOsobaSES_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnOsobaSES_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbViddilSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aViddilSES_UdpateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDDIL_SES').IsNull then frmViluchennyZRealizaciiEdit.cbViddilSES.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDDIL_SES').Value else frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbViddilSES.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnViddilSES_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnViddilSES_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aPosadaSES_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_SES').IsNull then frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_SES').Value else frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnPosadaSES_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnPosadaSES_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Items.Clear;
  frmViluchennyZRealizaciiEdit.aTipProdukcii_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIPPRODUKCII').IsNull then frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIPPRODUKCII').Value else frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizacii.qTeritory.SQL.Clear;
  frmViluchennyZRealizacii.qTeritory.SQL.Text:='select * from TIPIPRODUKCII where KOD=:Kod order by KOD';
  frmViluchennyZRealizacii.qTeritory.Params.Clear;
  frmViluchennyZRealizacii.qTeritory.Params.Add;
  frmViluchennyZRealizacii.qTeritory.Params[0].Name:='Kod';
  frmViluchennyZRealizacii.qTeritory.Params[0].Value:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIPPRODUKCII').Value;
  frmViluchennyZRealizacii.qTeritory.Open;
  if frmViluchennyZRealizacii.qTeritory.Locate('KOD',StrToInt(frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text),[]) then frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:=frmViluchennyZRealizacii.qTeritory.FieldByName('TIPPRODUKCII').Value else frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipProdukcii_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipProdukcii_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Items.Clear;
  frmViluchennyZRealizaciiEdit.aRozdil_T23_F18_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ROZDIL_F18').IsNull then frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ROZDIL_F18').Value else frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnRozdil_T23_F18_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnRozdil_T23_F18_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Items.Clear;
  frmViluchennyZRealizaciiEdit.aTipPostanovi_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIP_SHTRAFU').IsNull then frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIP_SHTRAFU').Value else frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipPostanovi_Update.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnTipPostanovi_Choice.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtYear.Text:='';
  frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('YEAR_').IsNull then frmViluchennyZRealizaciiEdit.edtYear.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('YEAR_').Value else frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtYear.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnYear.Enabled:=true;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.btnAddViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnEditViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnDeleteViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnUpdateViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.DBGrid1.Align:=alClient;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMOSTI_PRO_VILUCHENNY').IsNull then frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMOSTI_PRO_VILUCHENNY').Value else frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=-1;
  frmViluchennyZRealizaciiEdit.aVstanoviv_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.rgVstanoviv.Enabled:=true;
  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsLaboratornijKontrol;
  frmViluchennyZRealizaciiEdit.aAddLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aEditLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aDeleteLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aUpdateLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
  frmViluchennyZRealizaciiEdit.GroupBox4.Align:=alClient;
  frmViluchennyZRealizaciiEdit.DBGrid2.Align:=alClient;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsZmistPostanovi;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
  BlobStream:=TMemoryStream.Create;
  try
    (frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VSTANOVIV') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Assign(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VSTANOVIV') as TBlobField) else frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmViluchennyZRealizaciiEdit.memVstanoviv.MaxLength:=$7FFFFFF0;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnVstanoviv.Enabled:=true;

  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  BlobStream:=TMemoryStream.Create;
  try
    (frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NE_VIDPOVIDAJUT') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Assign(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NE_VIDPOVIDAJUT') as TBlobField) else frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.MaxLength:=$7FFFFFF0;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnNeVidpovidajut.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VILUCHITI').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VILUCHITI').Value else frmViluchennyZRealizaciiEdit.edtViluchiti.Text:='';
  frmViluchennyZRealizaciiEdit.edtViluchiti.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnViluchiti.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Enabled:=true;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('CHAS_VILUCHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('CHAS_VILUCHENNY').Value else frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text:='';
  frmViluchennyZRealizaciiEdit.edtChasViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
  frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:='';
  frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:='';
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').IsNull then frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').Value else frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').IsNull then frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').Value else frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
  frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtPIBGDSL.Enabled:=true;
  frmViluchennyZRealizaciiEdit.btnGDSL.Enabled:=true;
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
end;

procedure TfrmViluchennyZRealizacii.aDeleteViluchennyExecute(
  Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViluchennyZRealizaciiEdit:=TfrmViluchennyZRealizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmViluchennyZRealizaciiEdit.Show;
  frmViluchennyZRealizaciiEdit.Position:=poMainFormCenter;
  frmViluchennyZRealizaciiEdit.BorderStyle:=bsDialog;
  frmViluchennyZRealizaciiEdit.Caption:='Видалення запису';

  frmViluchennyZRealizaciiEdit.cbMinistry.Text:=frmViluchennyZRealizacii.cbMinistry.Text;
  frmViluchennyZRealizaciiEdit.cbMinistry.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbTeritory.Text:=frmViluchennyZRealizacii.cbTeritory.Text;
  frmViluchennyZRealizaciiEdit.cbTeritory.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbDistrict.Text:=frmViluchennyZRealizacii.cbDistrict.Text;
  frmViluchennyZRealizaciiEdit.cbDistrict.Enabled:=false;
  frmViluchennyZRealizaciiEdit.edtRecordID.Text:='';
  frmViluchennyZRealizaciiEdit.edtRecordID.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').IsNull then frmViluchennyZRealizaciiEdit.edtRecordID.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value) else frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').IsNull then frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').Value) else frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').IsNull then frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').Value) else frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('AKT_ZAPISKA').IsNull then frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('AKT_ZAPISKA').Value else frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=-1;
  frmViluchennyZRealizaciiEdit.aAkt_Dovidka_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DODATKOVA_INFORMACIY').IsNull then frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DODATKOVA_INFORMACIY').Value else frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text:='';
  frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Enabled:=false;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NAZVA_OBJEKTU').IsNull then frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NAZVA_OBJEKTU').Value else frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text:='';
  frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnVidomchaPidporydkovanist.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ADRESA').IsNull then frmViluchennyZRealizaciiEdit.edtAdresa.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ADRESA').Value else frmViluchennyZRealizaciiEdit.edtAdresa.Text:='';
  frmViluchennyZRealizaciiEdit.edtAdresa.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_KERIVNIKA').IsNull then frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_KERIVNIKA').Value else frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:='';
  frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_KERIVNIKA').IsNull then frmViluchennyZRealizaciiEdit.edtPosada.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_KERIVNIKA').Value else frmViluchennyZRealizaciiEdit.edtPosada.Text:='';
  frmViluchennyZRealizaciiEdit.edtPosada.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnVidomostiProObjekt.Enabled:=false;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProPereviryjuchogo;
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aOsobaSES_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('OSOBA_SES').IsNull then frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('OSOBA_SES').Value else frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbOsobaSES.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnOsobaSES_Update.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnOsobaSES_Choice.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbViddilSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aViddilSES_UdpateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDDIL_SES').IsNull then frmViluchennyZRealizaciiEdit.cbViddilSES.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDDIL_SES').Value else frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbViddilSES.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnViddilSES_Update.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnViddilSES_Choice.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Items.Clear;
  frmViluchennyZRealizaciiEdit.aPosadaSES_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_SES').IsNull then frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_SES').Value else frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
  frmViluchennyZRealizaciiEdit.cbPosadaSES.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnPosadaSES_Update.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnPosadaSES_Choice.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Items.Clear;
  frmViluchennyZRealizaciiEdit.aTipProdukcii_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIPPRODUKCII').IsNull then frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIPPRODUKCII').Value else frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizacii.qTeritory.SQL.Clear;
  frmViluchennyZRealizacii.qTeritory.SQL.Text:='select * from TIPIPRODUKCII order by KOD';
  frmViluchennyZRealizacii.qTeritory.Open;
  if frmViluchennyZRealizacii.qTeritory.Locate('KOD',StrToInt(frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text),[]) then frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:=frmViluchennyZRealizacii.qTeritory.FieldByName('TIPPRODUKCII').Value else frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipProdukcii.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnTipProdukcii_Update.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnTipProdukcii_Choice.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Items.Clear;
  frmViluchennyZRealizaciiEdit.aRozdil_T23_F18_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ROZDIL_F18').IsNull then frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ROZDIL_F18').Value else frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
  frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnRozdil_T23_F18_Update.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnRozdil_T23_F18_Choice.Enabled:=false;
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Items.Clear;
  frmViluchennyZRealizaciiEdit.aTipPostanovi_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIP_SHTRAFU').IsNull then frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TIP_SHTRAFU').Value else frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
  frmViluchennyZRealizaciiEdit.cbTipPostanovi.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnTipPostanovi_Update.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnTipPostanovi_Choice.Enabled:=false;
  frmViluchennyZRealizaciiEdit.edtYear.Text:='';
  frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('YEAR_').IsNull then frmViluchennyZRealizaciiEdit.edtYear.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('YEAR_').Value else frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.edtYear.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnYear.Enabled:=false;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.btnAddViluchenny.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnEditViluchenny.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnDeleteViluchenny.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnUpdateViluchenny.Enabled:=true;
  frmViluchennyZRealizaciiEdit.DBGrid1.Align:=alClient;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMOSTI_PRO_VILUCHENNY').IsNull then frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VIDOMOSTI_PRO_VILUCHENNY').Value else frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=-1;
  frmViluchennyZRealizaciiEdit.aVstanoviv_UpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.rgVstanoviv.Enabled:=false;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsLaboratornijKontrol;
  frmViluchennyZRealizaciiEdit.aAddLaboratory.Enabled:=false;
  frmViluchennyZRealizaciiEdit.aEditLaboratory.Enabled:=false;
  frmViluchennyZRealizaciiEdit.aDeleteLaboratory.Enabled:=false;
  frmViluchennyZRealizaciiEdit.aUpdateLaboratory.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
  frmViluchennyZRealizaciiEdit.GroupBox4.Align:=alClient;
  frmViluchennyZRealizaciiEdit.DBGrid2.Align:=alClient;

  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsZmistPostanovi;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
  BlobStream:=TMemoryStream.Create;
  try
    (frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VSTANOVIV') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Assign(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VSTANOVIV') as TBlobField) else frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmViluchennyZRealizaciiEdit.memVstanoviv.MaxLength:=$7FFFFFF0;
  frmViluchennyZRealizaciiEdit.memVstanoviv.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnVstanoviv.Enabled:=false;

  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Align:=alClient;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  BlobStream:=TMemoryStream.Create;
  try
    (frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NE_VIDPOVIDAJUT') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Assign(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NE_VIDPOVIDAJUT') as TBlobField) else frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.MaxLength:=$7FFFFFF0;
  frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnNeVidpovidajut.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VILUCHITI').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VILUCHITI').Value else frmViluchennyZRealizaciiEdit.edtViluchiti.Text:='';
  frmViluchennyZRealizaciiEdit.edtViluchiti.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnViluchiti.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('CHAS_VILUCHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('CHAS_VILUCHENNY').Value else frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text:='';
  frmViluchennyZRealizaciiEdit.edtChasViluchenny.Enabled:=false;
  frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
  frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:='';
  frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:='';
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').IsNull then frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').Value else frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').IsNull then frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').Value else frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
  frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Enabled:=false;
  frmViluchennyZRealizaciiEdit.edtPIBGDSL.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnGDSL.Enabled:=false;
  frmViluchennyZRealizaciiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmViluchennyZRealizacii.aUpdateViluchennyExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by NOMER_POSTANOVI';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=true;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aCloseViluchennyExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizacii.Close;
end;

procedure TfrmViluchennyZRealizacii.aYearChoiceExecute(Sender: TObject);
begin
  frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aSortByNomerPostanoviExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by NOMER_POSTANOVI';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=true;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aSortByDataPostanoviExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by DATA_POSTANOVI';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=false;
    aSortByDataPostanovi.Checked:=true;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aSortByNazvaObjektuExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by NAZVA_OBJEKTU';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=false;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=true;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aSortByTipPostanoviExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by TIP_SHTRAFU';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=false;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=true;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aSortByPIB_SESExecute(Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by OSOBA_SES';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=false;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=true;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aSortByPosadaSESExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by POSADA_SES';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=false;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=true;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aSortByTipProdukciiExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by TIPPRODUKCII';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=false;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=true;
    Caption:='Вилучення з реалізації';
  end;
end;

procedure TfrmViluchennyZRealizacii.aViluchennyRobochaBazaExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aViluchennyNeVrucheniExecute(
  Sender: TObject);
var
  Ministry, Teritory, District: integer;
begin
  with frmViluchennyZRealizacii do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=cbMinistry.Text;
    qTeritory.Open;
    if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=cbTeritory.Text;
    qTeritory.Open;
    if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=cbDistrict.Text;
    qTeritory.Open;
    if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and (DATA_VRUCHENNY is null) order by NOMER_POSTANOVI';
//    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik and (DATA_VRUCHENNY is null) order by NOMER_POSTANOVI';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Ministry';
    qViluchennyZRealizacii.Params[0].Value:=Ministry;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Teritory';
    qViluchennyZRealizacii.Params[1].Value:=Teritory;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[2].Name:='Rajon';
    qViluchennyZRealizacii.Params[2].Value:=District;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[3].Name:='Rik';
    qViluchennyZRealizacii.Params[3].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=true;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації: Не вручені постанови';
  end;
end;

procedure TfrmViluchennyZRealizacii.aViluchennyOskarzheniExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizacii do
  begin
    qViluchennyZRealizacii.SQL.Clear;
    qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik and (not DATA_OSKARZHENNY is null) order by NOMER_POSTANOVI';
    qViluchennyZRealizacii.Params.Clear;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[0].Name:='Rajon';
    qViluchennyZRealizacii.Params[0].Value:=cbDistrict.Text;
    qViluchennyZRealizacii.Params.Add;
    qViluchennyZRealizacii.Params[1].Name:='Rik';
    qViluchennyZRealizacii.Params[1].Value:=udYear.Position;
    qViluchennyZRealizacii.Open;
    aSortByNomerPostanovi.Checked:=true;
    aSortByDataPostanovi.Checked:=false;
    aSortByNazvaObjektu.Checked:=false;
    aSortByTipPostanovi.Checked:=false;
    aSortByPIB_SES.Checked:=false;
    aSortByPosadaSES.Checked:=false;
    aSortByTipProdukcii.Checked:=false;
    Caption:='Вилучення з реалізації: Оскаржені постанови';
  end;
end;

procedure TfrmViluchennyZRealizacii.aViluchennyNazvaObjektuExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: Назва об''єкту';
  frmFilter.lblFilter.Caption:='Назва об''єкту';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aViluchennyAdresaObjektuExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: Адреса об''єкту';
  frmFilter.lblFilter.Caption:='Адреса об''єкту';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aViluchennyTipPostanoviExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: Тип постанови';
  frmFilter.lblFilter.Caption:='Тип постанови';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aViluchennyPIB_SESExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: П.І.Б. особи СЕС';
  frmFilter.lblFilter.Caption:='П.І.Б. особи СЕС';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aViluchennyPosadaSESExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: Посада представника СЕС';
  frmFilter.lblFilter.Caption:='Посада представника СЕС';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aViluchennyTipProdukciiExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: Тип вилученої продукції';
  frmFilter.lblFilter.Caption:='Тип вилученої продукції';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.aVruchennyExecute(Sender: TObject);
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVruchenny') then frmVruchenny:=TfrmVruchenny.Create(self);
  frmMain.Enabled:=false;
  frmVruchenny.Show;
  frmVruchenny.Enabled:=true;
  frmVruchenny.Caption:='Дата вручення постанови';
  frmVruchenny.Position:=poMainFormCenter;
  frmVruchenny.BorderStyle:=bsDialog;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').IsNull then frmVruchenny.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').Value);
  frmVruchenny.edtNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').IsNull then frmVruchenny.dtpDataPostanovi.Date:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').Value;
  frmVruchenny.dtpDataPostanovi.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').IsNull then frmVruchenny.edtKod.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value);
  frmVruchenny.edtKod.Enabled:=false;
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VRUCHENNY').IsNull then
    MessageDlg('Увага!!!'+#13+'Цю постанову не було вручено або не введено дату вручення!!!'+#13+'Введіть дату вручення та збережіть ці відомості!!!',mtWarning,[mbOK],0);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VRUCHENNY').IsNull then frmVruchenny.dtpDataVruchenny.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VRUCHENNY').Value) else frmVruchenny.dtpDataVruchenny.Date:=int(date);
  frmVruchenny.Label1.Caption:='Дата вручення постанови';
  frmVruchenny.cbSamolikvidaciy.Visible:=false;
  frmVruchenny.cbSamolikvidaciy.Enabled:=false;
end;

procedure TfrmViluchennyZRealizacii.aOskarzhennyExecute(Sender: TObject);
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOskarzhenny') then frmOskarzhenny:=TfrmOskarzhenny.Create(self);
  frmMain.Enabled:=false;
  frmOskarzhenny.Show;
  frmOskarzhenny.Caption:='Оскарження постанови';
  frmOskarzhenny.Position:=poMainFormCenter;
  frmOskarzhenny.BorderStyle:=bsDialog;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').IsNull then frmOskarzhenny.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').Value);
  frmOskarzhenny.edtNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').IsNull then frmOskarzhenny.dtpDataOskarzhenny.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').Value);
  frmOskarzhenny.dtpDataOskarzhenny.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').IsNull then frmOskarzhenny.edtKod.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value);
  frmOskarzhenny.edtKod.Enabled:=false;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_OSKARZHENNY').IsNull then frmOskarzhenny.dtpDataOskarzhenny.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_OSKARZHENNY').Value) else frmOskarzhenny.dtpDataOskarzhenny.Date:=int(date);
  frmOskarzhenny.dtpDataOskarzhenny.Enabled:=true;
  frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbKudiOskarzheno.Items.Clear;
  frmOskarzhenny.aKudiOskarzheno_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('KUDI_OSKARZHENO').IsNull then frmOskarzhenny.cbKudiOskarzheno.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('KUDI_OSKARZHENO').Value else frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbKudiOskarzheno.Enabled:=true;
  frmOskarzhenny.btnKudiOskarzheno_Update.Enabled:=true;
  frmOskarzhenny.btnKudiOskarzheno_Choice.Enabled:=true;
  frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Items.Clear;
  frmOskarzhenny.aRezultatOskarzhenny_UpdateExecute(sender);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('REZULTAT_OSKARZHENNY').IsNull then frmOskarzhenny.cbRezultatOskarzhenny.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('REZULTAT_OSKARZHENNY').Value else frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Enabled:=true;
  frmOskarzhenny.btnRezultatOskarzhenny_Update.Enabled:=true;
  frmOskarzhenny.btnRezultatOskarzhenny_Choice.Enabled:=true;
  frmOskarzhenny.dtpDataOskarzhenny.SetFocus;
end;

procedure TfrmViluchennyZRealizacii.aVikonannyExecute(Sender: TObject);
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSplata') then frmSplata:=TfrmSplata.Create(self);
  frmMain.Enabled:=false;
  frmSplata.Show;
  frmSplata.Enabled:=true;
  frmSplata.Caption:='Добровільна сплата';
  frmSplata.BorderStyle:=bsDialog;
  frmSplata.Position:=poMainFormCenter;
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').IsNull then frmSplata.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').Value);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').IsNull then frmSplata.dtpDataSplati.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').Value);
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').IsNull then frmSplata.edtKod.Text:=IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value);
  frmSplata.Label1.Caption:='Номер листа керівника';
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_PLATIZHKI').IsNull then frmSplata.edtNomerPlatizhki.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_PLATIZHKI').Value else frmSplata.edtNomerPlatizhki.Text:='';
  frmSplata.Label2.Caption:='Дата листа керівника';
  if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_SPLATI').IsNull then frmSplata.dtpDataSplati.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_SPLATI').Value) else frmSplata.dtpDataSplati.Date:=int(date);
end;

procedure TfrmViluchennyZRealizacii.aCopyExecute(Sender: TObject);
begin
{
  frmViluchennyZRealizacii.aEditViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text:='0';
  frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmViluchennyZRealizaciiEdit.btnNomerPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date:=int(date);
  frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Enabled:=true;
  frmViluchennyZRealizaciiEdit.Caption:='Додавання запису';
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
}
end;

procedure TfrmViluchennyZRealizacii.aPrintPostanovaViluchennyExecute(
  Sender: TObject);
var
  DocumentName, BookmarkName, Doc, R: OleVariant;
  FirmName, DataPostanovi, NomerPostanovi, PIB_GDSL, Posada_GDSL,
  GDSL, Rozglynuvshi, Vstanoviv, NeVidpovidajut, Viluchiti,
  Vidpovidalnist, InformaciyProVikonanny: string;
  Director: integer;
//  : OleVariant;
//
//  , i, LinesCount: integer;
//  , GDSL1, Rozglynuvshi1: string;
//  Vstanoviv1, NeVidpovidajut1: string;
//  , CyPostanova, PostanovuOderzhav, Poperedzhaju, Oskarzhenny: string;
//
//  , NaPidstavi: string;
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.RecordCount<=0 then exit;
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
    DocumentName:=DocumentName+'\Viluchenny.dot';
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
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').IsNull then DataPostanovi:=' '+DateToStr(int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_POSTANOVI').Value)) else DataPostanovi:='';
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
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').IsNull then NomerPostanovi:=' '+IntToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_POSTANOVI').Value) else NomerPostanovi:='';
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

    //Я, П.І.Б., посада головного лікаря
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    case Director of
      0:
        begin
          if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').Value else PIB_GDSL:=' '+INIAZZ.ReadString('Director','LNP_NV',PIB_GDSL);
          if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').Value else Posada_GDSL:=' '+INIAZZ.ReadString('Director','Position_NV',Posada_GDSL);
        end;
      1:
        begin
          if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').Value else PIB_GDSL:=' '+INIAZZ.ReadString('Director1','LNP_NV',PIB_GDSL);
          if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').Value else Posada_GDSL:=' '+INIAZZ.ReadString('Director1','Position_NV',Posada_GDSL);
        end;
      2:
        begin
          if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').IsNull then PIB_GDSL:=' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_GDSL').Value else PIB_GDSL:=' '+INIAZZ.ReadString('Director2','LNP_NV',PIB_GDSL);
          if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').IsNull then Posada_GDSL:=' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_GDSL').Value else Posada_GDSL:=' '+INIAZZ.ReadString('Director2','Position_NV',Posada_GDSL);
        end;
    end;
    GDSL:=Posada_GDSL+PIB_GDSL;
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

    //Розглянувши
    Rozglynuvshi:='';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DODATKOVA_INFORMACIY').IsNull then Rozglynuvshi:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DODATKOVA_INFORMACIY').Value+', ';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('AKT_ZAPISKA').IsNull then
      case frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('AKT_ZAPISKA').Value of
        0:
            if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+'інформаційну довідку від '+DateToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value)+', ';
        1:
          begin
            if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+'акт відбору від '+DateToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value);
            if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' №'+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value+', ';
          end;
        2:
          begin
            if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+'акт санітарно-епідеміологічного обстеження від '+DateToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value);
            if not  frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then
              if int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value)<int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) then Rozglynuvshi:=Rozglynuvshi+' - '+DateToStr(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value);
            if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then Rozglynuvshi:=Rozglynuvshi+' №'+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value;
          end;
      end;
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NAZVA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NAZVA_OBJEKTU').Value;
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ADRESA').IsNull then Rozglynuvshi:=Rozglynuvshi+' за адресою: '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('ADRESA').Value;
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

    //Встановив
    Vstanoviv:='';
////    Vstanoviv1:='';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VSTANOVIV').IsNull then Vstanoviv:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VSTANOVIV').Value;
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

    //Не відповідають
    NeVidpovidajut:='';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NE_VIDPOVIDAJUT').IsNull then NeVidpovidajut:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NE_VIDPOVIDAJUT').Value;
    BookmarkName:='NeVidpovidayut';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NeVidpovidajut);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //1. Вилучити з реалізації
    Viluchiti:='';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VILUCHITI').IsNull then Viluchiti:='Вилучити з реалізації '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('VILUCHITI').Value;
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('CHAS_VILUCHENNY').IsNull then Viluchiti:=Viluchiti+' з '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('CHAS_VILUCHENNY').Value;
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').IsNull then Viluchiti:=Viluchiti+' '+DateToStr(int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').Value))+' року';
    BookmarkName:='P_1_Viluchiti_z_realizacii';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Viluchiti);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //2. Відповідальність за виконання
    Vidpovidalnist:='Відповідальність за виконання постанови покладається на ';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_KERIVNIKA').IsNull then Vidpovidalnist:=Vidpovidalnist+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('POSADA_KERIVNIKA').Value;
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_KERIVNIKA').IsNull then Vidpovidalnist:=Vidpovidalnist+' '+frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIB_KERIVNIKA').Value;
    BookmarkName:='P_2_Vidpovidalnist_za_vikonannya_postanovi';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(Vidpovidalnist);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //3. Інформація про виконання...
    InformaciyProVikonanny:='Інформацію про виконання постанови прошу надіслати мені до ';
    if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').IsNull then InformaciyProVikonanny:=InformaciyProVikonanny+DateToStr(int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_VILUCHENNY').Value)+3)+'р.';
    BookmarkName:='P_3_Informaciyu_pro_vikonannya';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(InformaciyProVikonanny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    Director:=INIAZZ.ReadInteger('System','Position',Director);
    case Director of
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
    // name of your bookmark
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

   // name of your bookmark
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

procedure TfrmViluchennyZRealizacii.aViluchennyT23F18Execute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Вилучення з реалізації: Розділ т.23 ф.18';
  frmFilter.lblFilter.Caption:='Розділ т.23 ф.18';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmViluchennyZRealizacii.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmViluchennyZRealizacii.dsViluchennyZRealizacii;
end;

procedure TfrmViluchennyZRealizacii.aPidpisExecute(Sender: TObject);
var
  RecNo: integer;
begin
  with frmViluchennyZRealizacii.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update VILUCHENNY_Z_REALIZACII set PIDPIS=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  RecNo:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('RECORD_ID').Value;
  frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizacii.qViluchennyZRealizacii.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmViluchennyZRealizacii.qViluchennyZRealizaciiAfterScroll(
  DataSet: TDataSet);
begin
  if frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIDPIS').IsNull then
  begin
    frmViluchennyZRealizacii.aPidpis.Caption:='Підписати';
    frmViluchennyZRealizacii.aPidpis.Enabled:=true;
    frmViluchennyZRealizacii.aEditViluchenny.Enabled:=true;
    frmViluchennyZRealizacii.aDeleteViluchenny.Enabled:=true;
  end
  else
  begin
    frmViluchennyZRealizacii.aPidpis.Caption:='Підписано';
    case frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('PIDPIS').Value of
      0:
        begin
          frmViluchennyZRealizacii.aPidpis.Caption:='Підписати';
          frmViluchennyZRealizacii.aPidpis.Enabled:=true;
          frmViluchennyZRealizacii.aEditViluchenny.Enabled:=true;
          frmViluchennyZRealizacii.aDeleteViluchenny.Enabled:=true;
        end;
      1:
        begin
          frmViluchennyZRealizacii.aPidpis.Caption:='Підписано';
          frmViluchennyZRealizacii.aPidpis.Enabled:=false;
          frmViluchennyZRealizacii.aEditViluchenny.Enabled:=false;
          frmViluchennyZRealizacii.aDeleteViluchenny.Enabled:=false;
        end;
    end;
  end;
end;

end.
