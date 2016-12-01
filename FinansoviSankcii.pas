{
PIB_KERIVNIKA_PORUSHNIKA
}
{
CREATE TABLE FINANSOVI_SANKCII (
    RECORD_ID                  INTEGER NOT NULL,
    MINISTRY                   INTEGER,
    TERITORY                   INTEGER,
    DISTRICT                   INTEGER,
    NOMER_POSTANOVI            INTEGER,
    DATA_POSTANOVI             DATE,
    AKT_DOVIDKA                INTEGER,
    DATA                       DATE,
    NOMER                      VARCHAR(20),
    NAZVA_OBJEKTU              VARCHAR(100),
    VIDOMCHA_PIDPORYDKOVANIST  VARCHAR(100),
    ADRESA_OBJEKTU             VARCHAR(100),
    PIB_KERIVNIKA              VARCHAR(75),
    POSADA_KERIVNIKA           VARCHAR(75),
    ROZRAKUNKOVIJ_RAHUNOK      VARCHAR(25),
    KOD_DKPP                   VARCHAR(20),
    VIDDILENNY_BANKU           VARCHAR(100),
    KOD_MFO                    VARCHAR(10),
    ROZDIL_T23_F18             INTEGER,
    TIP_SHTRAFU                INTEGER,
    YEAR_                      INTEGER,
    PIB_OSOBI_SES              VARCHAR(75),
    POSADA_OSOBI_SES           VARCHAR(75),
    VIDDIL_OSOBI_SES           VARCHAR(75),
    SUMA_SANKCII               NUMERIC(15,4),
    SUMA_SANKCII_PROPISOM      VARCHAR(150),
    VIDOM_PIDPOR_ADRESA        VARCHAR(150),
    VSTANOVIV                  BLOB SUB_TYPE 1 SEGMENT SIZE 1000,
    SCHO_E_PORUSHENNYM         BLOB SUB_TYPE 1 SEGMENT SIZE 1000,
    PIB_KERIVNIKA_PORUSHNIKA   VARCHAR(100),
    DATA_VRUCHENNY             DATE,
    NOMER_PLATIZHKI            VARCHAR(20),
    DATA_SPLATI                DATE,
    DATA_OSKARZHENNY           DATE,
    KUDI_OSKARZHENO            VARCHAR(150),
    REZULTAT_OSKARZHENNY       VARCHAR(100),
    TIP_PRODUKCII              INTEGER,
    VISNOVKI                   SMALLINT,
    TERMIN_REALIZACII          DATE,
    PIB_POSADA_NAZVAOBJECTU    VARCHAR(250),
    PIB_POSADA_OSOBISES        VARCHAR(150),
    DATAPROTOKOLU              DATE,
    DATADO                     DATE,
    POSADA_GDSL                VARCHAR(125),
    PIB_GDSL                   VARCHAR(125)
);
}
unit FinansoviSankcii;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ComCtrls, ExtCtrls, Grids, DBGrids, SysUtils, IniFiles, Dialogs,
  Variants;
//  , ComObj;
//  Windows, Messages, Graphics,

type
  TfrmFinansoviSankcii = class(TForm)
    DBGrid1: TDBGrid;
    alFinansoviSankcii: TActionList;
    aTeritoryUpdate: TAction;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    aDistrictChange: TAction;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aYearChoice: TAction;
    aVruchenny: TAction;
    aSplata: TAction;
    aOskarzhenny: TAction;
    aCopy: TAction;
    aPrintPostanovaFinansova: TAction;
    aNeVrucheni: TAction;
    aNeSplacheni: TAction;
    aByNomerPostanovi: TAction;
    aByDataPostanovi: TAction;
    aByNazvaObjektu: TAction;
    aByAdresaObjektu: TAction;
    aByPIBPredstavnikaSES: TAction;
    aByPosadaPredstavnikaSES: TAction;
    qTeritory: TIBQuery;
    dsFinansoviSankcii: TDataSource;
    qFinansoviSankcii: TIBQuery;
    PopupMenu: TPopupMenu;
    aAdd1: TMenuItem;
    aEdit1: TMenuItem;
    aDelete1: TMenuItem;
    N5: TMenuItem;
    N1: TMenuItem;
    aVruchenny1: TMenuItem;
    aSplata1: TMenuItem;
    aOskarzhenny1: TMenuItem;
    aCopy1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    aByNomerPostanovi1: TMenuItem;
    aByDataPostanovi1: TMenuItem;
    aByNazvaObjektu1: TMenuItem;
    aByAdresaObjektu1: TMenuItem;
    aByPIBPredstavnikaSES1: TMenuItem;
    aByPosadaPredstavnikaSES1: TMenuItem;
    N8: TMenuItem;
    aNeVrucheni1: TMenuItem;
    N2: TMenuItem;
    aNazvaObjektu1: TMenuItem;
    aAdresaObjektu1: TMenuItem;
    N3: TMenuItem;
    aPIBPredstavnikaSES1: TMenuItem;
    aPosadaPredstavnikaSES1: TMenuItem;
    N4: TMenuItem;
    aRobochaBaza1: TMenuItem;
    N9: TMenuItem;
    aPrintPostanovaFinansova1: TMenuItem;
    N11: TMenuItem;
    N10: TMenuItem;
    Panel1: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    btnVruchenny: TButton;
    edtYear: TEdit;
    udYear: TUpDown;
    btnYear: TButton;
    btnSplata: TButton;
    btnOskazhenny: TButton;
    btnCopy: TButton;
    btnPrintPostanovaFinansova: TButton;
    Panel2: TPanel;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    btnTeritoryUpdate: TButton;
    N12: TMenuItem;
    aOskarzheni: TAction;
    N13: TMenuItem;
    aNazvaObjektu: TAction;
    aAdresaObjektu: TAction;
    aPIB_SES: TAction;
    aPosada_SES: TAction;
    aTipProdukcii: TAction;
    aRozdilT23F18: TAction;
    N14: TMenuItem;
    N23181: TMenuItem;
    btnPidpis: TButton;
    aPidpis: TAction;
    procedure aPrintPostanovaFinansovaExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aYearChoiceExecute(Sender: TObject);
    procedure aVruchennyExecute(Sender: TObject);
    procedure aSplataExecute(Sender: TObject);
    procedure aOskarzhennyExecute(Sender: TObject);
    procedure aCopyExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictChangeExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aNeVrucheniExecute(Sender: TObject);
    procedure aRobochaBazaExecute(Sender: TObject);
    procedure aNeSplacheniExecute(Sender: TObject);
    procedure aOskarzheniExecute(Sender: TObject);
    procedure aNazvaObjektuExecute(Sender: TObject);
    procedure aAdresaObjektuExecute(Sender: TObject);
    procedure aPIB_SESExecute(Sender: TObject);
    procedure aPosada_SESExecute(Sender: TObject);
    procedure aByNomerPostanoviExecute(Sender: TObject);
    procedure aByDataPostanoviExecute(Sender: TObject);
    procedure aByNazvaObjektuExecute(Sender: TObject);
    procedure aByAdresaObjektuExecute(Sender: TObject);
    procedure aByPIBPredstavnikaSESExecute(Sender: TObject);
    procedure aByPosadaPredstavnikaSESExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aRozdilT23F18Execute(Sender: TObject);
    procedure aTipProdukciiExecute(Sender: TObject);
    procedure aPidpisExecute(Sender: TObject);
    procedure qFinansoviSankciiAfterScroll(DataSet: TDataSet);
  end;

var
  frmFinansoviSankcii: TfrmFinansoviSankcii;

implementation

uses
  Main, FinansoviSankciiEdit, Vruchenny, Splata, Oskarzhenny, Filter;

{$R *.dfm}

procedure TfrmFinansoviSankcii.aPrintPostanovaFinansovaExecute(
  Sender: TObject);
var
  DocumentName, Doc, BookmarkName, R: OleVariant;
  FirmName, DataPostanovi, NomerPostanovi, GDSL1, GDSL2, Rozglynuvshi,
  SchodoPorushenny, TaZasluhavshi, Vstanoviv, SchoEPorushennym,
  RozmirSankcii, PostanovaDo, TerminSplati, URozmiri,
  NaRahunokBudzhenu, NaRahunokBudzhenu1, PosadaGDSL, PidpisGDSL: string;
  Director: integer;
  Ministry,Teritory,District: integer;
begin
  if frmFinansoviSankcii.qFinansoviSankcii.RecordCount<=0 then exit;
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
    DocumentName:=DocumentName+'\Finansova.dot';
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
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').IsNull then DataPostanovi:=' '+DateToStr(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value)) else DataPostanovi:='';
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
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').IsNull then NomerPostanovi:=' '+IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value) else NomerPostanovi:='';
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
    GDSL1:='';
    GDSL2:='';
    Director:=INIAZZ.ReadInteger('System','Position',Director);
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_GDSL').IsNull then GDSL1:=GDSL1+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_GDSL').Value;
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_GDSL').IsNull then GDSL1:=GDSL1+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_GDSL').Value;
    if GDSL1='' then
      case Director of
        0:
          begin
            GDSL1:=INIAZZ.ReadString('Director','LNP_NV',GDSL1);
            GDSL2:=INIAZZ.ReadString('Director','Position_NV',GDSL2);
          end;
        1:
          begin
            GDSL1:=INIAZZ.ReadString('Director1','LNP_NV',GDSL1);
            GDSL2:=INIAZZ.ReadString('Director1','Position_NV',GDSL2);
          end;
        2:
          begin
            GDSL1:=INIAZZ.ReadString('Director2','LNP_NV',GDSL1);
            GDSL2:=INIAZZ.ReadString('Director2','Position_NV',GDSL2);
          end;
      end;
    GDSL1:=GDSL1+' '+GDSL2;
    BookmarkName:='PIB_Posada_GolovnogoLikaraySES';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(GDSL1);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Розглянувши
    Rozglynuvshi:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATAPROTOKOLU').IsNull then Rozglynuvshi:=Rozglynuvshi+'протокол від '+DateToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATAPROTOKOLU').Value);
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('AKT_DOVIDKA').IsNull then
      case frmFinansoviSankcii.qFinansoviSankcii.FieldByName('AKT_DOVIDKA').Value of
        0: if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then Rozglynuvshi:=Rozglynuvshi+', інформаційну довідку від '+DateToStr(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value));
        1:
          begin
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').IsNull then Rozglynuvshi:=Rozglynuvshi+', акт відбору проб № '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').Value;
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then Rozglynuvshi:=Rozglynuvshi+' від '+DateToStr(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value));
          end;
        2:
          begin
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').IsNull then Rozglynuvshi:=Rozglynuvshi+', акт санітарно-епідеміологічного обстеження № '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').Value;
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then Rozglynuvshi:=Rozglynuvshi+' від '+DateToStr(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value));
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').IsNull then
              if (not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull)and(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value)>int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').Value)) then Rozglynuvshi:=Rozglynuvshi+' - '+DateToStr(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').Value));
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NAZVA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NAZVA_OBJEKTU').Value;
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value;
            if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ADRESA_OBJEKTU').IsNull then Rozglynuvshi:=Rozglynuvshi+' '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ADRESA_OBJEKTU').Value;
          end;
      end;
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Ministry';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=frmFinansoviSankcii.qTeritory.FieldByName('KOD').Value else Ministry:=0;

      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Ministry';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=Ministry;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[1].Name:='Teritory';
      frmFinansoviSankcii.qTeritory.Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=frmFinansoviSankcii.qTeritory.FieldByName('KOD').Value else Teritory:=0;

      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by Rajon';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Ministry';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=Ministry;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[1].Name:='Teritory';
      frmFinansoviSankcii.qTeritory.Params[1].Value:=Teritory;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[2].Name:='Rajon';
      frmFinansoviSankcii.qTeritory.Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=frmFinansoviSankcii.qTeritory.FieldByName('KOD').Value else District:=0;

    frmFinansoviSankcii.qTeritory.SQL.Clear;
    frmFinansoviSankcii.qTeritory.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministr and TERITORY=:Teritory and DISTRICT=:Rajon and SHTRAFI_ADMIN=:Strafi and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi order by VIDKONTROLU';
    frmFinansoviSankcii.qTeritory.Params.Clear;
    frmFinansoviSankcii.qTeritory.Params.Add;
    frmFinansoviSankcii.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankcii.qTeritory.Params[0].Value:=Ministry;
    frmFinansoviSankcii.qTeritory.Params.Add;
    frmFinansoviSankcii.qTeritory.Params[1].Name:='Teritory';
    frmFinansoviSankcii.qTeritory.Params[1].Value:=Teritory;
    frmFinansoviSankcii.qTeritory.Params.Add;
    frmFinansoviSankcii.qTeritory.Params[2].Name:='Rajon';
    frmFinansoviSankcii.qTeritory.Params[2].Value:=District;
    frmFinansoviSankcii.qTeritory.Params.Add;
    frmFinansoviSankcii.qTeritory.Params[3].Name:='Strafi';
    frmFinansoviSankcii.qTeritory.Params[3].Value:='finansovi';
    frmFinansoviSankcii.qTeritory.Params.Add;
    frmFinansoviSankcii.qTeritory.Params[4].Name:='NomerPostanovi';
    frmFinansoviSankcii.qTeritory.Params[4].Value:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value;
    frmFinansoviSankcii.qTeritory.Params.Add;
    frmFinansoviSankcii.qTeritory.Params[5].Name:='DataPostanovi';
    frmFinansoviSankcii.qTeritory.Params[5].Value:=DateToStr(int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value));
    frmFinansoviSankcii.qTeritory.Open;
    if frmFinansoviSankcii.qTeritory.RecordCount>0 then
    begin
      frmFinansoviSankcii.qTeritory.First;
      while not frmFinansoviSankcii.qTeritory.Eof do
      begin
        if not frmFinansoviSankcii.qTeritory.FieldByName('VIDKONTROLU').IsNull then Rozglynuvshi:=Rozglynuvshi+' результати '+frmFinansoviSankcii.qTeritory.FieldByName('VIDKONTROLU').Value;
        if not frmFinansoviSankcii.qTeritory.FieldByName('DATAKONTROLU').IsNull then Rozglynuvshi:=Rozglynuvshi+' від '+DateToStr(int(frmFinansoviSankcii.qTeritory.FieldByName('DATAKONTROLU').Value));
        if not frmFinansoviSankcii.qTeritory.FieldByName('NOMERIPROB').IsNull then Rozglynuvshi:=Rozglynuvshi+' № '+frmFinansoviSankcii.qTeritory.FieldByName('NOMERIPROB').Value;
        frmFinansoviSankcii.qTeritory.Next;
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

    //щодо порушення санітарного законодавства
    SchodoPorushenny:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA_PORUSHNIKA').IsNull then SchodoPorushenny:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA_PORUSHNIKA').Value;
    BookmarkName:='SchodoPorushennyaSanitarnigoZakonodavstva';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(SchodoPorushenny);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //та заслухавши осіб
    TaZasluhavshi:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_NAZVAOBJECTU').IsNull then TaZasluhavshi:=TaZasluhavshi+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_NAZVAOBJECTU').Value;
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_OSOBISES').IsNull then TaZasluhavshi:=TaZasluhavshi+', '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_OSOBISES').Value;
    BookmarkName:='TaZasluhavshiOsib';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(TaZasluhavshi);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //Встановив
    Vstanoviv:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VSTANOVIV').IsNull then Vstanoviv:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VSTANOVIV').Value;
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

    //Що є порушенням
    SchoEPorushennym:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SCHO_E_PORUSHENNYM').IsNull then SchoEPorushennym:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SCHO_E_PORUSHENNYM').Value;
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

    //застосувати фінансову санкцію у розмірі
    RozmirSankcii:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').IsNull then RozmirSankcii:=RozmirSankcii+' '+frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').Value;
    BookmarkName:='RozmirSankcii';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(RozmirSankcii);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //постанова до
    PostanovaDo:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOM_PIDPOR_ADRESA').IsNull then PostanovaDo:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOM_PIDPOR_ADRESA').Value;
    BookmarkName:='PostanovaDo';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PostanovaDo);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //фінансова санкція ...
    TerminSplati:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').IsNull then TerminSplati:=DateToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value+15);
    BookmarkName:='TerminSplati';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(TerminSplati);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //у розмірі
    URozmiri:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').IsNull then URozmiri:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').Value;
    BookmarkName:='URozmiri';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(URozmiri);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //на рахунок держбюджету...
    NaRahunokBudzhenu:='';
    NaRahunokBudzhenu1:='';
    NaRahunokBudzhenu1:=INIAZZ.ReadString('Bank','RR',NaRahunokBudzhenu1);
    NaRahunokBudzhenu:=NaRahunokBudzhenu+'на рахунок держбюджету р/р '+NaRahunokBudzhenu1;
    NaRahunokBudzhenu1:=INIAZZ.ReadString('Bank','KOD',NaRahunokBudzhenu1);
    NaRahunokBudzhenu:=NaRahunokBudzhenu+' код '+NaRahunokBudzhenu1;
    NaRahunokBudzhenu1:=INIAZZ.ReadString('Bank','Orderzhuvach',NaRahunokBudzhenu1);
    NaRahunokBudzhenu:=NaRahunokBudzhenu+' одержувач '+NaRahunokBudzhenu1;
    NaRahunokBudzhenu1:=INIAZZ.ReadString('Bank','OKPO',NaRahunokBudzhenu1);
    NaRahunokBudzhenu:=NaRahunokBudzhenu+' ОКПО '+NaRahunokBudzhenu1;
    NaRahunokBudzhenu1:=INIAZZ.ReadString('Bank','Bank',NaRahunokBudzhenu1);
    NaRahunokBudzhenu:=NaRahunokBudzhenu+' банк '+NaRahunokBudzhenu1;
    NaRahunokBudzhenu1:=INIAZZ.ReadString('Bank','MFO',NaRahunokBudzhenu1);
    NaRahunokBudzhenu:=NaRahunokBudzhenu+' МФО '+NaRahunokBudzhenu1;
    BookmarkName:='NaRahunokDerzhbudzhetu';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(NaRahunokBudzhenu);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    //підписи
    PosadaGDSL:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_GDSL').IsNull then PosadaGDSL:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_GDSL').Value else
    begin
      Director:=INIAZZ.ReadInteger('System','Position',Director);
      case Director of
        0: PosadaGDSL:=INIAZZ.ReadString('Director','Position_NV',PosadaGDSL);
        1: PosadaGDSL:=INIAZZ.ReadString('Director1','Position_NV',PosadaGDSL);
        2: PosadaGDSL:=INIAZZ.ReadString('Director2','Position_NV',PosadaGDSL);
      end;
    end;
    BookmarkName:='Posada_GDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PosadaGDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;

    PidpisGDSL:='';
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_GDSL').IsNull then PidpisGDSL:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_GDSL').Value;
    BookmarkName:='PIB_GDSL';
    // Check if bookmark exists
    if Doc.Bookmarks.Exists(BookmarkName) then
    begin
      R:=Doc.Bookmarks.Item(BookmarkName).Range;
      R.Delete;
      R.InsertAfter(PidpisGDSL);
    end;
    BookmarkName := Unassigned;
    R := Unassigned;
    frmMain.sWordApp.AutoConnect:=false;
    frmMain.sWordApp.AutoQuit:=false;
  INIAZZ.Free;
end;

procedure TfrmFinansoviSankcii.aAddExecute(Sender: TObject);
begin
 if not frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmFinansoviSankciiEdit:=TfrmFinansoviSankciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmFinansoviSankciiEdit.Show;
  frmFinansoviSankciiEdit.BorderStyle:=bsDialog;
  frmFinansoviSankciiEdit.Position:=poMainFormCenter;
  frmFinansoviSankciiEdit.Caption:='Додавання запису';
  frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
  frmFinansoviSankciiEdit.edtRecord_ID.Enabled:=false;
  frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtNomerPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.btnNomerPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.dtpDataPostanovi.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.dtpDataProtokolu.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataProtokolu.Enabled:=true;
  frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=-1;
  frmFinansoviSankciiEdit.aAktDovidkaUpdateExecute(sender);
  frmFinansoviSankciiEdit.rgAkt_Dovidka.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
  frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text:='';
  frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Enabled:=true;
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmFinansoviSankciiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  frmFinansoviSankciiEdit.edtAdresa.Text:='';
  frmFinansoviSankciiEdit.edtAdresa.Enabled:=true;
  frmFinansoviSankciiEdit.edtPIBKerivnika.Text:='';
  frmFinansoviSankciiEdit.edtPIBKerivnika.Enabled:=true;
  frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:='';
  frmFinansoviSankciiEdit.edtPosadaKerivnika.Enabled:=true;
  frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text:='';
  frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Enabled:=true;
  frmFinansoviSankciiEdit.edtKodDKPP.Text:='';
  frmFinansoviSankciiEdit.edtKodDKPP.Enabled:=true;
  frmFinansoviSankciiEdit.edtViddilennyBanku.Text:='';
  frmFinansoviSankciiEdit.edtViddilennyBanku.Enabled:=true;
  frmFinansoviSankciiEdit.edtMFO.Text:='';
  frmFinansoviSankciiEdit.edtMFO.Enabled:=true;
  frmFinansoviSankciiEdit.btnVidomostiProObjekt.Enabled:=true;
  frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankciiEdit.cbRozdil_F18.Items.Clear;
  frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
  frmFinansoviSankciiEdit.cbRozdil_F18.Enabled:=true;
  frmFinansoviSankciiEdit.btnRozdil_F18_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnRozdil_F18_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankciiEdit.cbTipShtrafiv.Items.Clear;
  frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
  frmFinansoviSankciiEdit.cbTipShtrafiv.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipShtrafivUpdate.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipShtrafivChoice.Enabled:=true;
  frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankciiEdit.cbTipProdukcii.Items.Clear;
  frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
  frmFinansoviSankciiEdit.cbTipProdukcii.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipProdukcii_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipProdukcii_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.edtYear.Text:='';
  frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtYear.Enabled:=true;
  frmFinansoviSankciiEdit.btnYearUpdate.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProPereviryjuchogo;
  frmFinansoviSankciiEdit.cbPIB_SES.Text:='';
  frmFinansoviSankciiEdit.cbPIB_SES.Items.Clear;
  frmFinansoviSankciiEdit.aPIB_SES_UpdateExecute(sender);
  frmFinansoviSankciiEdit.cbPIB_SES.Enabled:=true;
  frmFinansoviSankciiEdit.btnPIB_SES_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnPIB_SES_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.cbViddilSES.Text:='';
  frmFinansoviSankciiEdit.cbViddilSES.Items.Clear;
  frmFinansoviSankciiEdit.aViddil_UpdateExecute(sender);
  frmFinansoviSankciiEdit.cbViddilSES.Enabled:=true;
  frmFinansoviSankciiEdit.btnViddilSES_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnViddilSES_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.cbPosadaSES.Text:='';
  frmFinansoviSankciiEdit.cbPosadaSES.Items.Clear;
  frmFinansoviSankciiEdit.aPosadaSES_UpdateExecute(sender);
  frmFinansoviSankciiEdit.cbPosadaSES.Enabled:=true;
  frmFinansoviSankciiEdit.btnPosadaSES_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnPosadaSES_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.dgVidomostiProFinansovu.Align:=alClient;
  frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aAddVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aEditVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aDeleteVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aPererahuvatiVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.edtSumaSankcii.Text:='';
  frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text:='';
  frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aSumaSankciiExecute(sender);
  frmFinansoviSankciiEdit.edtSumaSankcii.Enabled:=true;
  frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Enabled:=true;
  frmFinansoviSankciiEdit.btnSumaSankcii.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsDodatkovo;
  frmFinansoviSankciiEdit.edtSchodoPorushenny.Text:='';
  frmFinansoviSankciiEdit.edtSchodoPorushenny.Enabled:=true;
  frmFinansoviSankciiEdit.btnSchodoPorushenny.Enabled:=true;
  frmFinansoviSankciiEdit.dgLaboratory.Align:=alClient;
  frmFinansoviSankciiEdit.aAddLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aEditLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aDeleteLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
  frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=-1;
  frmFinansoviSankciiEdit.aVisnovkiChoiceExecute(sender);
  frmFinansoviSankciiEdit.rgVisnovki.Enabled:=true;
  frmFinansoviSankciiEdit.dtpTerminTealizacii.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsZmistPostanovi;
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text:='';
  frmFinansoviSankciiEdit.aVidomchaPidporydkovanist_AdresaUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Enabled:=true;
  frmFinansoviSankciiEdit.btnVidomchaPidporydkovanist_Adresa.Enabled:=true;
  frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
  frmFinansoviSankciiEdit.memVstanoviv.Enabled:=true;
  frmFinansoviSankciiEdit.btnVstanoviv.Enabled:=true;
  frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Clear;
  frmFinansoviSankciiEdit.memSchoEPorushennym.Enabled:=true;
  frmFinansoviSankciiEdit.btnSchoEPorushennym.Enabled:=true;
  frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text:='';
  frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Enabled:=true;
  frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text:='';
  frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Enabled:=true;
  frmFinansoviSankciiEdit.btnTaZasluhavshiOsib.Enabled:=true;
  frmFinansoviSankciiEdit.edtPosada_GDSL.Text:='';
  frmFinansoviSankciiEdit.edtPosada_GDSL.Enabled:=true;
  frmFinansoviSankciiEdit.edtPIB_GDSL.Text:='';
  frmFinansoviSankciiEdit.edtPIB_GDSL.Enabled:=true;
  frmFinansoviSankciiEdit.btnGDSL.Enabled:=true;
  frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
  frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus
end;

procedure TfrmFinansoviSankcii.aEditExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmFinansoviSankcii.qFinansoviSankcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmFinansoviSankciiEdit:=TfrmFinansoviSankciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmFinansoviSankciiEdit.Show;
  frmFinansoviSankciiEdit.BorderStyle:=bsDialog;
  frmFinansoviSankciiEdit.Position:=poMainFormCenter;
  frmFinansoviSankciiEdit.Caption:='Редагування запису';
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('MINISTRY').IsNull then frmFinansoviSankciiEdit.cbMinistry.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('MINISTRY').Value);
  frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
  frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from MINISTRY where KOD=:Kod order by KOD';
  frmFinansoviSankciiEdit.qTeritory.Params.Clear;
  frmFinansoviSankciiEdit.qTeritory.Params.Add;
  frmFinansoviSankciiEdit.qTeritory.Open;
  if frmFinansoviSankciiEdit.qTeritory.Locate('KOD',StrToInt(frmFinansoviSankciiEdit.cbMinistry.Text),[]) then frmFinansoviSankciiEdit.cbMinistry.Text:=frmFinansoviSankciiEdit.qTeritory.FieldByName('MINISTRY').Value else frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.cbMinistry.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TERITORY').IsNull then frmFinansoviSankciiEdit.cbTeritory.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TERITORY').Value);
  frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
  frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.KOD';
  frmFinansoviSankciiEdit.qTeritory.Params.Clear;
  frmFinansoviSankciiEdit.qTeritory.Params.Add;
  frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
  frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmFinansoviSankciiEdit.qTeritory.Open;
  if frmFinansoviSankciiEdit.qTeritory.Locate('KOD',StrToInt(frmFinansoviSankciiEdit.cbTeritory.Text),[]) then frmFinansoviSankciiEdit.cbTeritory.Text:=frmFinansoviSankciiEdit.qTeritory.FieldByName('TERITORY').Value else frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.cbTeritory.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DISTRICT').IsNull then frmFinansoviSankciiEdit.cbDistrict.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DISTRICT').Value);
  frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
  frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.KOD';
  frmFinansoviSankciiEdit.qTeritory.Params.Clear;
  frmFinansoviSankciiEdit.qTeritory.Params.Add;
  frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Teritory';
  frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmFinansoviSankciiEdit.qTeritory.Open;
  if frmFinansoviSankciiEdit.qTeritory.Locate('KOD',StrToInt(frmFinansoviSankciiEdit.cbDistrict.Text),[]) then frmFinansoviSankciiEdit.cbDistrict.Text:=frmFinansoviSankciiEdit.qTeritory.FieldByName('RAJON').Value else frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.cbDistrict.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').IsNull then frmFinansoviSankciiEdit.edtRecord_ID.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value) else frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
  frmFinansoviSankciiEdit.edtRecord_ID.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').IsNull then frmFinansoviSankciiEdit.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value) else frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtNomerPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.btnNomerPostanovi.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').IsNull then frmFinansoviSankciiEdit.dtpDataPostanovi.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value) else frmFinansoviSankciiEdit.dtpDataPostanovi.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataPostanovi.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATAPROTOKOLU').IsNull then frmFinansoviSankciiEdit.dtpDataProtokolu.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATAPROTOKOLU').Value) else frmFinansoviSankciiEdit.dtpDataProtokolu.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataProtokolu.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('AKT_DOVIDKA').IsNull then frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('AKT_DOVIDKA').Value else frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=-1;
  frmFinansoviSankciiEdit.aAktDovidkaUpdateExecute(sender);
  frmFinansoviSankciiEdit.rgAkt_Dovidka.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NAZVA_OBJEKTU').IsNull then frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NAZVA_OBJEKTU').Value else frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text:='';
  frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmFinansoviSankciiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ADRESA_OBJEKTU').IsNull then frmFinansoviSankciiEdit.edtAdresa.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ADRESA_OBJEKTU').Value else frmFinansoviSankciiEdit.edtAdresa.Text:='';
  frmFinansoviSankciiEdit.edtAdresa.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA').IsNull then frmFinansoviSankciiEdit.edtPIBKerivnika.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA').Value else frmFinansoviSankciiEdit.edtPIBKerivnika.Text:='';
  frmFinansoviSankciiEdit.edtPIBKerivnika.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_KERIVNIKA').IsNull then frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_KERIVNIKA').Value else frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:='';
  frmFinansoviSankciiEdit.edtPosadaKerivnika.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZRAKUNKOVIJ_RAHUNOK').IsNull then frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZRAKUNKOVIJ_RAHUNOK').Value else frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text:='';
  frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_DKPP').IsNull then frmFinansoviSankciiEdit.edtKodDKPP.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_DKPP').Value else frmFinansoviSankciiEdit.edtKodDKPP.Text:='';
  frmFinansoviSankciiEdit.edtKodDKPP.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDILENNY_BANKU').IsNull then frmFinansoviSankciiEdit.edtViddilennyBanku.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDILENNY_BANKU').Value else frmFinansoviSankciiEdit.edtViddilennyBanku.Text:='';
  frmFinansoviSankciiEdit.edtViddilennyBanku.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_MFO').IsNull then frmFinansoviSankciiEdit.edtMFO.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_MFO').Value else frmFinansoviSankciiEdit.edtMFO.Text:='';
  frmFinansoviSankciiEdit.edtMFO.Enabled:=true;
  frmFinansoviSankciiEdit.btnVidomostiProObjekt.Enabled:=true;
  frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankciiEdit.cbRozdil_F18.Items.Clear;
  frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZDIL_T23_F18').IsNull then frmFinansoviSankciiEdit.cbRozdil_F18.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZDIL_T23_F18').Value else frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankcii.qTeritory.SQL.Clear;
  frmFinansoviSankcii.qTeritory.SQL.Text:='select * from ROZDILT23F18 where KODSTROKI=:Kod order by KODSTROKI';
  frmFinansoviSankcii.qTeritory.Params.Clear;
  frmFinansoviSankcii.qTeritory.Params.Add;
  frmFinansoviSankcii.qTeritory.Params[0].Name:='Kod';
  frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbRozdil_F18.Text;
  frmFinansoviSankcii.qTeritory.Open;
  if frmFinansoviSankcii.qTeritory.Locate('KODSTROKI',frmFinansoviSankciiEdit.cbRozdil_F18.Text,[]) then frmFinansoviSankciiEdit.cbRozdil_F18.Text:=frmFinansoviSankcii.qTeritory.FieldByName('OBJEKTNAGLYDU').Value else frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankciiEdit.cbRozdil_F18.Enabled:=true;
  frmFinansoviSankciiEdit.btnRozdil_F18_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnRozdil_F18_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankciiEdit.cbTipShtrafiv.Items.Clear;
  frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_SHTRAFU').IsNull then frmFinansoviSankciiEdit.cbTipShtrafiv.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_SHTRAFU').Value else frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankcii.qTeritory.SQL.Clear;
  frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPISHTRAFIV where KODTIPUSHTRAFIV=:Kod order by KODTIPUSHTRAFIV';
  frmFinansoviSankcii.qTeritory.Params.Clear;
  frmFinansoviSankcii.qTeritory.Params.Add;
  frmFinansoviSankcii.qTeritory.Params[0].Name:='Kod';
  frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipShtrafiv.Text;
  frmFinansoviSankcii.qTeritory.Open;
  if frmFinansoviSankcii.qTeritory.Locate('KODTIPUSHTRAFIV',frmFinansoviSankciiEdit.cbTipShtrafiv.Text,[]) then frmFinansoviSankciiEdit.cbTipShtrafiv.Text:=frmFinansoviSankcii.qTeritory.FieldByName('TIPSHTRAFU').Value else frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankciiEdit.cbTipShtrafiv.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipShtrafivUpdate.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipShtrafivChoice.Enabled:=true;
  frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankciiEdit.cbTipProdukcii.Items.Clear;
  frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_PRODUKCII').IsNull then frmFinansoviSankciiEdit.cbTipProdukcii.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_PRODUKCII').Value else frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankcii.qTeritory.SQL.Clear;
  frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPIPRODUKCII where KOD=:Kod order by KOD';
  frmFinansoviSankcii.qTeritory.Params.Clear;
  frmFinansoviSankcii.qTeritory.Params.Add;
  frmFinansoviSankcii.qTeritory.Params[0].Name:='Kod';
  frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipProdukcii.Text;
  frmFinansoviSankcii.qTeritory.Open;
  if frmFinansoviSankcii.qTeritory.Locate('KOD',frmFinansoviSankciiEdit.cbTipProdukcii.Text,[]) then frmFinansoviSankciiEdit.cbTipProdukcii.Text:=frmFinansoviSankcii.qTeritory.FieldByName('TIPPRODUKCII').Value else frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankciiEdit.cbTipProdukcii.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipProdukcii_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnTipProdukcii_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.edtYear.Text:='';
  frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('YEAR_').IsNull then frmFinansoviSankciiEdit.edtYear.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('YEAR_').Value else frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtYear.Enabled:=true;
  frmFinansoviSankciiEdit.btnYearUpdate.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProPereviryjuchogo;
  frmFinansoviSankciiEdit.cbPIB_SES.Text:='';
  frmFinansoviSankciiEdit.cbPIB_SES.Items.Clear;
  frmFinansoviSankciiEdit.aPIB_SES_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_OSOBI_SES').IsNull then frmFinansoviSankciiEdit.cbPIB_SES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_OSOBI_SES').Value else frmFinansoviSankciiEdit.cbPIB_SES.Text:='';
  frmFinansoviSankciiEdit.cbPIB_SES.Enabled:=true;
  frmFinansoviSankciiEdit.btnPIB_SES_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnPIB_SES_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.cbViddilSES.Text:='';
  frmFinansoviSankciiEdit.cbViddilSES.Items.Clear;
  frmFinansoviSankciiEdit.aViddil_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDIL_OSOBI_SES').IsNull then frmFinansoviSankciiEdit.cbViddilSES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDIL_OSOBI_SES').Value else frmFinansoviSankciiEdit.cbViddilSES.Text:='';
  frmFinansoviSankciiEdit.cbViddilSES.Enabled:=true;
  frmFinansoviSankciiEdit.btnViddilSES_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnViddilSES_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.cbPosadaSES.Text:='';
  frmFinansoviSankciiEdit.cbPosadaSES.Items.Clear;
  frmFinansoviSankciiEdit.aPosadaSES_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_OSOBI_SES').IsNull then frmFinansoviSankciiEdit.cbPosadaSES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_OSOBI_SES').Value else frmFinansoviSankciiEdit.cbPosadaSES.Text:='';
  frmFinansoviSankciiEdit.cbPosadaSES.Enabled:=true;
  frmFinansoviSankciiEdit.btnPosadaSES_Update.Enabled:=true;
  frmFinansoviSankciiEdit.btnPosadaSES_Choice.Enabled:=true;
  frmFinansoviSankciiEdit.dgVidomostiProFinansovu.Align:=alClient;
  frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aAddVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aEditVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aDeleteVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aPererahuvatiVidomosti.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII').IsNull then frmFinansoviSankciiEdit.edtSumaSankcii.Text:=FloatToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII').Value) else frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
  frmFinansoviSankciiEdit.edtSumaSankcii.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').IsNull then frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').Value else frmFinansoviSankciiEdit.aSumaSankciiExecute(sender);
  frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Enabled:=true;
  frmFinansoviSankciiEdit.btnSumaSankcii.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsDodatkovo;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA_PORUSHNIKA').IsNull then frmFinansoviSankciiEdit.edtSchodoPorushenny.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA_PORUSHNIKA').Value else frmFinansoviSankciiEdit.aSchodoPorushennyUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtSchodoPorushenny.Enabled:=true;
  frmFinansoviSankciiEdit.btnSchodoPorushenny.Enabled:=true;
  frmFinansoviSankciiEdit.dgLaboratory.Align:=alClient;
  frmFinansoviSankciiEdit.aAddLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aEditLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aDeleteLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VISNOVKI').IsNull then frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VISNOVKI').Value else frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=-1;
  frmFinansoviSankciiEdit.aVisnovkiChoiceExecute(sender);
  frmFinansoviSankciiEdit.rgVisnovki.Enabled:=true;
  frmFinansoviSankciiEdit.dtpTerminTealizacii.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsZmistPostanovi;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOM_PIDPOR_ADRESA').IsNull then frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOM_PIDPOR_ADRESA').Value else frmFinansoviSankciiEdit.aVidomchaPidporydkovanist_AdresaUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Enabled:=true;
  frmFinansoviSankciiEdit.btnVidomchaPidporydkovanist_Adresa.Enabled:=true;
  frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
  frmFinansoviSankciiEdit.memVstanoviv.MaxLength:=$7FFFFFF0;
  BlobStream:=TMemoryStream.Create;
  try
    (frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VSTANOVIV') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmFinansoviSankciiEdit.memVstanoviv.Lines.Assign(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VSTANOVIV') as TBlobField) else frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmFinansoviSankciiEdit.memVstanoviv.Enabled:=true;
  frmFinansoviSankciiEdit.btnVstanoviv.Enabled:=true;
  frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Clear;
  frmFinansoviSankciiEdit.memSchoEPorushennym.MaxLength:=$7FFFFFF0;
  BlobStream:=TMemoryStream.Create;
  try
    (frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Assign(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField) else frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmFinansoviSankciiEdit.memSchoEPorushennym.Enabled:=true;
  frmFinansoviSankciiEdit.btnSchoEPorushennym.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_NAZVAOBJECTU').IsNull then frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_NAZVAOBJECTU').Value else frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text:='';
  frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_OSOBISES').IsNull then frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_OSOBISES').Value else frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text:='';
  frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Enabled:=true;
  frmFinansoviSankciiEdit.btnTaZasluhavshiOsib.Enabled:=true;
  frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);
  frmFinansoviSankciiEdit.edtPosada_GDSL.Enabled:=true;
  frmFinansoviSankciiEdit.edtPIB_GDSL.Enabled:=true;
  frmFinansoviSankciiEdit.btnGDSL.Enabled:=true;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
  frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus
end;

procedure TfrmFinansoviSankcii.aDeleteExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmFinansoviSankcii.qFinansoviSankcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmFinansoviSankciiEdit:=TfrmFinansoviSankciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmFinansoviSankciiEdit.Show;
  frmFinansoviSankciiEdit.BorderStyle:=bsDialog;
  frmFinansoviSankciiEdit.Position:=poMainFormCenter;
  frmFinansoviSankciiEdit.Caption:='Видалення запису';
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('MINISTRY').IsNull then frmFinansoviSankciiEdit.cbMinistry.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('MINISTRY').Value);
  frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
  frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from MINISTRY where KOD=:Kod order by KOD';
  frmFinansoviSankciiEdit.qTeritory.Params.Clear;
  frmFinansoviSankciiEdit.qTeritory.Params.Add;
  frmFinansoviSankciiEdit.qTeritory.Open;
  if frmFinansoviSankciiEdit.qTeritory.Locate('KOD',StrToInt(frmFinansoviSankciiEdit.cbMinistry.Text),[]) then frmFinansoviSankciiEdit.cbMinistry.Text:=frmFinansoviSankciiEdit.qTeritory.FieldByName('MINISTRY').Value else frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.cbMinistry.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TERITORY').IsNull then frmFinansoviSankciiEdit.cbTeritory.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TERITORY').Value);
  frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
  frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.KOD';
  frmFinansoviSankciiEdit.qTeritory.Params.Clear;
  frmFinansoviSankciiEdit.qTeritory.Params.Add;
  frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
  frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmFinansoviSankciiEdit.qTeritory.Open;
  if frmFinansoviSankciiEdit.qTeritory.Locate('KOD',StrToInt(frmFinansoviSankciiEdit.cbTeritory.Text),[]) then frmFinansoviSankciiEdit.cbTeritory.Text:=frmFinansoviSankciiEdit.qTeritory.FieldByName('TERITORY').Value else frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.cbTeritory.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DISTRICT').IsNull then frmFinansoviSankciiEdit.cbDistrict.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DISTRICT').Value);
  frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
  frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.KOD';
  frmFinansoviSankciiEdit.qTeritory.Params.Clear;
  frmFinansoviSankciiEdit.qTeritory.Params.Add;
  frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Teritory';
  frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmFinansoviSankciiEdit.qTeritory.Open;
  if frmFinansoviSankciiEdit.qTeritory.Locate('KOD',StrToInt(frmFinansoviSankciiEdit.cbDistrict.Text),[]) then frmFinansoviSankciiEdit.cbDistrict.Text:=frmFinansoviSankciiEdit.qTeritory.FieldByName('RAJON').Value else frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
  frmFinansoviSankciiEdit.cbDistrict.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').IsNull then frmFinansoviSankciiEdit.edtRecord_ID.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value) else frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
  frmFinansoviSankciiEdit.edtRecord_ID.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').IsNull then frmFinansoviSankciiEdit.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value) else frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtNomerPostanovi.Enabled:=false;
  frmFinansoviSankciiEdit.btnNomerPostanovi.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').IsNull then frmFinansoviSankciiEdit.dtpDataPostanovi.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value) else frmFinansoviSankciiEdit.dtpDataPostanovi.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataPostanovi.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATAPROTOKOLU').IsNull then frmFinansoviSankciiEdit.dtpDataProtokolu.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATAPROTOKOLU').Value) else frmFinansoviSankciiEdit.dtpDataProtokolu.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataProtokolu.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('AKT_DOVIDKA').IsNull then frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('AKT_DOVIDKA').Value else frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=-1;
  frmFinansoviSankciiEdit.aAktDovidkaUpdateExecute(sender);
  frmFinansoviSankciiEdit.rgAkt_Dovidka.Enabled:=false;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NAZVA_OBJEKTU').IsNull then frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NAZVA_OBJEKTU').Value else frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text:='';
  frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value else frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Enabled:=false;
  frmFinansoviSankciiEdit.btnVidomchaPidporydkovanist.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ADRESA_OBJEKTU').IsNull then frmFinansoviSankciiEdit.edtAdresa.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ADRESA_OBJEKTU').Value else frmFinansoviSankciiEdit.edtAdresa.Text:='';
  frmFinansoviSankciiEdit.edtAdresa.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA').IsNull then frmFinansoviSankciiEdit.edtPIBKerivnika.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA').Value else frmFinansoviSankciiEdit.edtPIBKerivnika.Text:='';
  frmFinansoviSankciiEdit.edtPIBKerivnika.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_KERIVNIKA').IsNull then frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_KERIVNIKA').Value else frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:='';
  frmFinansoviSankciiEdit.edtPosadaKerivnika.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZRAKUNKOVIJ_RAHUNOK').IsNull then frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZRAKUNKOVIJ_RAHUNOK').Value else frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text:='';
  frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_DKPP').IsNull then frmFinansoviSankciiEdit.edtKodDKPP.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_DKPP').Value else frmFinansoviSankciiEdit.edtKodDKPP.Text:='';
  frmFinansoviSankciiEdit.edtKodDKPP.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDILENNY_BANKU').IsNull then frmFinansoviSankciiEdit.edtViddilennyBanku.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDILENNY_BANKU').Value else frmFinansoviSankciiEdit.edtViddilennyBanku.Text:='';
  frmFinansoviSankciiEdit.edtViddilennyBanku.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_MFO').IsNull then frmFinansoviSankciiEdit.edtMFO.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KOD_MFO').Value else frmFinansoviSankciiEdit.edtMFO.Text:='';
  frmFinansoviSankciiEdit.edtMFO.Enabled:=false;
  frmFinansoviSankciiEdit.btnVidomostiProObjekt.Enabled:=false;
  frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankciiEdit.cbRozdil_F18.Items.Clear;
  frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZDIL_T23_F18').IsNull then frmFinansoviSankciiEdit.cbRozdil_F18.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('ROZDIL_T23_F18').Value else frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankcii.qTeritory.SQL.Clear;
  frmFinansoviSankcii.qTeritory.SQL.Text:='select * from ROZDILT23F18 where KODSTROKI=:Kod order by KODSTROKI';
  frmFinansoviSankcii.qTeritory.Params.Clear;
  frmFinansoviSankcii.qTeritory.Params.Add;
  frmFinansoviSankcii.qTeritory.Params[0].Name:='Kod';
  frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbRozdil_F18.Text;
  frmFinansoviSankcii.qTeritory.Open;
  if frmFinansoviSankcii.qTeritory.Locate('KODSTROKI',frmFinansoviSankciiEdit.cbRozdil_F18.Text,[]) then frmFinansoviSankciiEdit.cbRozdil_F18.Text:=frmFinansoviSankcii.qTeritory.FieldByName('OBJEKTNAGLYDU').Value else frmFinansoviSankciiEdit.cbRozdil_F18.Text:='';
  frmFinansoviSankciiEdit.cbRozdil_F18.Enabled:=false;
  frmFinansoviSankciiEdit.btnRozdil_F18_Update.Enabled:=false;
  frmFinansoviSankciiEdit.btnRozdil_F18_Choice.Enabled:=false;
  frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankciiEdit.cbTipShtrafiv.Items.Clear;
  frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_SHTRAFU').IsNull then frmFinansoviSankciiEdit.cbTipShtrafiv.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_SHTRAFU').Value else frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankcii.qTeritory.SQL.Clear;
  frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPISHTRAFIV where KODTIPUSHTRAFIV=:Kod order by KODTIPUSHTRAFIV';
  frmFinansoviSankcii.qTeritory.Params.Clear;
  frmFinansoviSankcii.qTeritory.Params.Add;
  frmFinansoviSankcii.qTeritory.Params[0].Name:='Kod';
  frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipShtrafiv.Text;
  frmFinansoviSankcii.qTeritory.Open;
  if frmFinansoviSankcii.qTeritory.Locate('KODTIPUSHTRAFIV',frmFinansoviSankciiEdit.cbTipShtrafiv.Text,[]) then frmFinansoviSankciiEdit.cbTipShtrafiv.Text:=frmFinansoviSankcii.qTeritory.FieldByName('TIPSHTRAFU').Value else frmFinansoviSankciiEdit.cbTipShtrafiv.Text:='';
  frmFinansoviSankciiEdit.cbTipShtrafiv.Enabled:=false;
  frmFinansoviSankciiEdit.btnTipShtrafivUpdate.Enabled:=false;
  frmFinansoviSankciiEdit.btnTipShtrafivChoice.Enabled:=false;
  frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankciiEdit.cbTipProdukcii.Items.Clear;
  frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_PRODUKCII').IsNull then frmFinansoviSankciiEdit.cbTipProdukcii.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TIP_PRODUKCII').Value else frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankcii.qTeritory.SQL.Clear;
  frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPIPRODUKCII where KOD=:Kod order by KOD';
  frmFinansoviSankcii.qTeritory.Params.Clear;
  frmFinansoviSankcii.qTeritory.Params.Add;
  frmFinansoviSankcii.qTeritory.Params[0].Name:='Kod';
  frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipProdukcii.Text;
  frmFinansoviSankcii.qTeritory.Open;
  if frmFinansoviSankcii.qTeritory.Locate('KOD',frmFinansoviSankciiEdit.cbTipProdukcii.Text,[]) then frmFinansoviSankciiEdit.cbTipProdukcii.Text:=frmFinansoviSankcii.qTeritory.FieldByName('TIPPRODUKCII').Value else frmFinansoviSankciiEdit.cbTipProdukcii.Text:='';
  frmFinansoviSankciiEdit.cbTipProdukcii.Enabled:=false;
  frmFinansoviSankciiEdit.btnTipProdukcii_Update.Enabled:=false;
  frmFinansoviSankciiEdit.btnTipProdukcii_Choice.Enabled:=false;
  frmFinansoviSankciiEdit.edtYear.Text:='';
  frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('YEAR_').IsNull then frmFinansoviSankciiEdit.edtYear.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('YEAR_').Value else frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtYear.Enabled:=false;
  frmFinansoviSankciiEdit.btnYearUpdate.Enabled:=false;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProPereviryjuchogo;
  frmFinansoviSankciiEdit.cbPIB_SES.Text:='';
  frmFinansoviSankciiEdit.cbPIB_SES.Items.Clear;
  frmFinansoviSankciiEdit.aPIB_SES_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_OSOBI_SES').IsNull then frmFinansoviSankciiEdit.cbPIB_SES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_OSOBI_SES').Value else frmFinansoviSankciiEdit.cbPIB_SES.Text:='';
  frmFinansoviSankciiEdit.cbPIB_SES.Enabled:=false;
  frmFinansoviSankciiEdit.btnPIB_SES_Update.Enabled:=false;
  frmFinansoviSankciiEdit.btnPIB_SES_Choice.Enabled:=false;
  frmFinansoviSankciiEdit.cbViddilSES.Text:='';
  frmFinansoviSankciiEdit.cbViddilSES.Items.Clear;
  frmFinansoviSankciiEdit.aViddil_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDIL_OSOBI_SES').IsNull then frmFinansoviSankciiEdit.cbViddilSES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDDIL_OSOBI_SES').Value else frmFinansoviSankciiEdit.cbViddilSES.Text:='';
  frmFinansoviSankciiEdit.cbViddilSES.Enabled:=false;
  frmFinansoviSankciiEdit.btnViddilSES_Update.Enabled:=false;
  frmFinansoviSankciiEdit.btnViddilSES_Choice.Enabled:=false;
  frmFinansoviSankciiEdit.cbPosadaSES.Text:='';
  frmFinansoviSankciiEdit.cbPosadaSES.Items.Clear;
  frmFinansoviSankciiEdit.aPosadaSES_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_OSOBI_SES').IsNull then frmFinansoviSankciiEdit.cbPosadaSES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_OSOBI_SES').Value else frmFinansoviSankciiEdit.cbPosadaSES.Text:='';
  frmFinansoviSankciiEdit.cbPosadaSES.Enabled:=false;
  frmFinansoviSankciiEdit.btnPosadaSES_Update.Enabled:=false;
  frmFinansoviSankciiEdit.btnPosadaSES_Choice.Enabled:=false;
  frmFinansoviSankciiEdit.dgVidomostiProFinansovu.Align:=alClient;
  frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aAddVidomosti.Enabled:=false;
  frmFinansoviSankciiEdit.aEditVidomosti.Enabled:=false;
  frmFinansoviSankciiEdit.aDeleteVidomosti.Enabled:=false;
  frmFinansoviSankciiEdit.aUpdateVidomosti.Enabled:=true;
  frmFinansoviSankciiEdit.aPererahuvatiVidomosti.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII').IsNull then frmFinansoviSankciiEdit.edtSumaSankcii.Text:=FloatToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII').Value) else frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
  frmFinansoviSankciiEdit.edtSumaSankcii.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').IsNull then frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SUMA_SANKCII_PROPISOM').Value else frmFinansoviSankciiEdit.aSumaSankciiExecute(sender);
  frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Enabled:=false;
  frmFinansoviSankciiEdit.btnSumaSankcii.Enabled:=false;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsDodatkovo;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA_PORUSHNIKA').IsNull then frmFinansoviSankciiEdit.edtSchodoPorushenny.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_KERIVNIKA_PORUSHNIKA').Value else frmFinansoviSankciiEdit.aSchodoPorushennyUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtSchodoPorushenny.Enabled:=false;
  frmFinansoviSankciiEdit.btnSchodoPorushenny.Enabled:=false;
  frmFinansoviSankciiEdit.dgLaboratory.Align:=alClient;
  frmFinansoviSankciiEdit.aAddLaboratory.Enabled:=false;
  frmFinansoviSankciiEdit.aEditLaboratory.Enabled:=false;
  frmFinansoviSankciiEdit.aDeleteLaboratory.Enabled:=false;
  frmFinansoviSankciiEdit.aUpdateLaboratory.Enabled:=true;
  frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VISNOVKI').IsNull then frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VISNOVKI').Value else frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=-1;
  frmFinansoviSankciiEdit.aVisnovkiChoiceExecute(sender);
  frmFinansoviSankciiEdit.rgVisnovki.Enabled:=false;
  frmFinansoviSankciiEdit.dtpTerminTealizacii.Enabled:=false;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsZmistPostanovi;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOM_PIDPOR_ADRESA').IsNull then frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VIDOM_PIDPOR_ADRESA').Value else frmFinansoviSankciiEdit.aVidomchaPidporydkovanist_AdresaUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Enabled:=false;
  frmFinansoviSankciiEdit.btnVidomchaPidporydkovanist_Adresa.Enabled:=false;
  frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
  frmFinansoviSankciiEdit.memVstanoviv.MaxLength:=$7FFFFFF0;
  BlobStream:=TMemoryStream.Create;
  try
    (frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VSTANOVIV') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmFinansoviSankciiEdit.memVstanoviv.Lines.Assign(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('VSTANOVIV') as TBlobField) else frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmFinansoviSankciiEdit.memVstanoviv.Enabled:=false;
  frmFinansoviSankciiEdit.btnVstanoviv.Enabled:=false;
  frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Clear;
  frmFinansoviSankciiEdit.memSchoEPorushennym.MaxLength:=$7FFFFFF0;
  BlobStream:=TMemoryStream.Create;
  try
    (frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField).SaveToStream(BlobStream);
    BlobStream.Position:=0;
    if BlobStream<>nil then frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Assign(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('SCHO_E_PORUSHENNYM') as TBlobField) else frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Clear;
  finally
    BlobStream.Free;
  end;
  frmFinansoviSankciiEdit.memSchoEPorushennym.Enabled:=false;
  frmFinansoviSankciiEdit.btnSchoEPorushennym.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_NAZVAOBJECTU').IsNull then frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_NAZVAOBJECTU').Value else frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text:='';
  frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_OSOBISES').IsNull then frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_POSADA_OSOBISES').Value else frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text:='';
  frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Enabled:=false;
  frmFinansoviSankciiEdit.btnTaZasluhavshiOsib.Enabled:=false;
  frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);
  frmFinansoviSankciiEdit.edtPosada_GDSL.Enabled:=false;
  frmFinansoviSankciiEdit.edtPIB_GDSL.Enabled:=false;
  frmFinansoviSankciiEdit.btnGDSL.Enabled:=false;

  frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
  frmFinansoviSankciiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmFinansoviSankcii.aUpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by NOMER_POSTANOVI';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=true;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aCloseExecute(Sender: TObject);
begin
  frmFinansoviSankcii.Close;
end;

procedure TfrmFinansoviSankcii.aYearChoiceExecute(Sender: TObject);
begin
  frmFinansoviSankcii.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aVruchennyExecute(Sender: TObject);
begin
  if frmFinansoviSankcii.qFinansoviSankcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVruchenny') then frmVruchenny:=TfrmVruchenny.Create(self);
  frmMain.Enabled:=false;
  frmVruchenny.Show;
  frmVruchenny.Enabled:=true;
  frmVruchenny.Caption:='Дата вручення постанови';
  frmVruchenny.Position:=poMainFormCenter;
  frmVruchenny.BorderStyle:=bsDialog;
  frmVruchenny.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value);
  frmVruchenny.edtNomerPostanovi.Enabled:=false;
  frmVruchenny.dtpDataPostanovi.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value);
  frmVruchenny.dtpDataPostanovi.Enabled:=false;
  frmVruchenny.edtKod.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value);
  frmVruchenny.edtKod.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_VRUCHENNY').IsNull then frmVruchenny.dtpDataVruchenny.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_VRUCHENNY').Value) else frmVruchenny.dtpDataVruchenny.Date:=int(date);
  frmVruchenny.Label1.Caption:='Дата вручення постанови';
  frmVruchenny.cbSamolikvidaciy.Visible:=false;
  frmVruchenny.cbSamolikvidaciy.Enabled:=false;
end;

procedure TfrmFinansoviSankcii.aSplataExecute(Sender: TObject);
begin
  if frmFinansoviSankcii.qFinansoviSankcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSplata') then frmSplata:=TfrmSplata.Create(self);
  frmMain.Enabled:=false;
  frmSplata.Show;
  frmSplata.Enabled:=true;
  frmSplata.Caption:='Добровільна сплата';
  frmSplata.BorderStyle:=bsDialog;
  frmSplata.Position:=poMainFormCenter;
  frmSplata.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value);
  frmSplata.edtNomerPostanovi.Enabled:=false;
  frmSplata.dtpDataPostanovi.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value);
  frmSplata.dtpDataPostanovi.Enabled:=false;
  frmSplata.edtKod.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value);
  frmSplata.edtKod.Enabled:=false;
  frmSplata.Label1.Caption:='Номер платіжного документу';
  frmSplata.Label2.Caption:='Дата сплати';
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_PLATIZHKI').IsNull then frmSplata.edtNomerPlatizhki.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_PLATIZHKI').Value else frmSplata.edtNomerPlatizhki.Text:='';
  frmSplata.edtNomerPlatizhki.Enabled:=true;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_SPLATI').IsNull then frmSplata.dtpDataSplati.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_SPLATI').Value) else frmSplata.dtpDataSplati.Date:=int(date);
  frmSplata.dtpDataSplati.Enabled:=true;
end;

procedure TfrmFinansoviSankcii.aOskarzhennyExecute(Sender: TObject);
begin
  if frmFinansoviSankcii.qFinansoviSankcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOskarzhenny') then frmOskarzhenny:=TfrmOskarzhenny.Create(self);
  frmMain.Enabled:=false;
  frmOskarzhenny.Show;
  frmOskarzhenny.Caption:='Оскарження постанови';
  frmOskarzhenny.Position:=poMainFormCenter;
  frmOskarzhenny.BorderStyle:=bsDialog;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').IsNull then frmOskarzhenny.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER_POSTANOVI').Value);
  frmOskarzhenny.edtNomerPostanovi.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').IsNull then frmOskarzhenny.dtpDataPostanovi.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_POSTANOVI').Value);
  frmOskarzhenny.dtpDataPostanovi.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').IsNull then frmOskarzhenny.edtKod.Text:=IntToStr(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value);
  frmOskarzhenny.edtKod.Enabled:=false;
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_OSKARZHENNY').IsNull then frmOskarzhenny.dtpDataOskarzhenny.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA_OSKARZHENNY').Value) else frmOskarzhenny.dtpDataOskarzhenny.Date:=int(date);
  frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbKudiOskarzheno.Items.Clear;
  frmOskarzhenny.aKudiOskarzheno_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KUDI_OSKARZHENO').IsNull then frmOskarzhenny.cbKudiOskarzheno.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('KUDI_OSKARZHENO').Value else frmOskarzhenny.cbKudiOskarzheno.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
  frmOskarzhenny.cbRezultatOskarzhenny.Items.Clear;
  frmOskarzhenny.aRezultatOskarzhenny_UpdateExecute(sender);
  if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('REZULTAT_OSKARZHENNY').IsNull then frmOskarzhenny.cbRezultatOskarzhenny.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('REZULTAT_OSKARZHENNY').Value else frmOskarzhenny.cbRezultatOskarzhenny.Text:='';
end;

procedure TfrmFinansoviSankcii.aCopyExecute(Sender: TObject);
begin
{
  frmFinansoviSankcii.aEditExecute(sender);
  frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
  frmFinansoviSankciiEdit.edtNomerPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.btnNomerPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.dtpDataPostanovi.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataPostanovi.Enabled:=true;
  frmFinansoviSankciiEdit.Caption:='Додавання запису';
  frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender)
}
end;

procedure TfrmFinansoviSankcii.aTeritoryUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmFinansoviSankcii do
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
      cbTeritory.Items.Add(qTeritory.FIeldByName('TERITORY').Value);
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
    aUpdateExecute(sender);
  end;
  INIAZZ.Free;
end;

procedure TfrmFinansoviSankcii.aMinistryChangeExecute(Sender: TObject);
begin
  with frmFinansoviSankcii do
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

procedure TfrmFinansoviSankcii.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmFinansoviSankcii do
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

procedure TfrmFinansoviSankcii.aDistrictChangeExecute(Sender: TObject);
begin
  frmFinansoviSankcii.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmFinansoviSankcii.dsFinansoviSankcii;
{
  with frmMain do
  begin
    N13.Visible:=true;
    mnVibir_FinSankcii_NeVrucheni.Visible:=true;
    mnVibir_FinSankcii_NeSplacheni.Visible:=true;
    mnVibir_FinSankcii_Oskarzheni.Visible:=true;
    mnVibir_FinSankcii_Objekt.Visible:=true;
    mnVibir_FinSankcii_SES.Visible:=true;
  end;
}
end;

procedure TfrmFinansoviSankcii.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with frmMain do
  begin
    N13.Visible:=true;
    mnZahodiFinansovi_SankciiNeVrucheni.Visible:=false;
    mnZahodiFinansovi_SankciiNeSplacheni.Visible:=false;
    mnZahodiFinansovi_SankciiOskarzheni.Visible:=false;
    mnZahodiFinansovi_SankciiObjekt.Visible:=false;
    mnZahodiFinansovi_SankciiObjektNazvaObjektu.Visible:=false;
    mnZahodiFinansovi_SankciiObjektAdresaObjektu.Visible:=false;
    mnZahodiFinansovi_SankciiSES.Visible:=false;
    mnZahodiFinansovi_SankciiSESPIBPredstavnika.Visible:=false;
    mnZahodiFinansovi_SankciiSESPosadaPredstavnika.Visible:=false;
    mnZahodiFinansovi_SankciiTipProdukcii.Visible:=false;
    mnZahodiFinansovi_SankciiRozdilT23F18.Visible:=false;
  end;

  Action:=caFree;
  exit;
end;

procedure TfrmFinansoviSankcii.FormResize(Sender: TObject);
begin
  if frmMain.IsFormOpen('frmFinansoviSankcii') then
    with frmFinansoviSankcii do
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

procedure TfrmFinansoviSankcii.aNeVrucheniExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and (DATA_VRUCHENNY is null) order by NOMER_POSTANOVI';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=true;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aRobochaBazaExecute(Sender: TObject);
begin
  frmFinansoviSankcii.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aNeSplacheniExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and (DATA_SPLATI is null) order by NOMER_POSTANOVI';
//    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII,RAJONI where RAJONI.RAJON='''+cbDistrict.Text+''' and FINANSOVI_SANKCII.DISTRICT=RAJONI.KOD and YEAR_='+edtYear.Text+' order by NOMER_POSTANOVI';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=true;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aOskarzheniExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and (not DATA_OSKARZHENNY is null) order by NOMER_POSTANOVI';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=true;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aNazvaObjektuExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Фінансові санкції: Назва об''єкту';
  frmFilter.lblFilter.Caption:='Назва об''єкту';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aAdresaObjektuExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Фінансові санкції: Адреса об''єкту';
  frmFilter.lblFilter.Caption:='Адреса об''єкту';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aPIB_SESExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Фінансові санкції: П.І.Б. представника СЕС';
  frmFilter.lblFilter.Caption:='П.І.Б. представника СЕС';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aPosada_SESExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Фінансові санкції: Посада представника СЕС';
  frmFilter.lblFilter.Caption:='Посада представника СЕС';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aByNomerPostanoviExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by NOMER_POSTANOVI';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=true;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aByDataPostanoviExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by DATA_POSTANOVI';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=false;
    aByDataPostanovi.Checked:=true;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aByNazvaObjektuExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by NAZVA_OBJEKTU';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=false;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=true;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aByAdresaObjektuExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by ADRESA_OBJEKTU';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=false;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=true;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aByPIBPredstavnikaSESExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by PIB_OSOBI_SES';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=false;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=true;
    aByPosadaPredstavnikaSES.Checked:=false;
  end;
end;

procedure TfrmFinansoviSankcii.aByPosadaPredstavnikaSESExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankcii do
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

    qFinansoviSankcii.SQL.Clear;
    qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by POSADA_OSOBI_SES';
    qFinansoviSankcii.Params.Clear;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[0].Name:='Ministry';
    qFinansoviSankcii.Params[0].Value:=Ministry;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[1].Name:='Teritory';
    qFinansoviSankcii.Params[1].Value:=Teritory;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[2].Name:='Rajon';
    qFinansoviSankcii.Params[2].Value:=District;
    qFinansoviSankcii.Params.Add;
    qFinansoviSankcii.Params[3].Name:='Rik';
    qFinansoviSankcii.Params[3].Value:=edtYear.Text;
    qFinansoviSankcii.Open;
    Caption:='Фінансові санкції';
    aByNomerPostanovi.Checked:=false;
    aByDataPostanovi.Checked:=false;
    aByNazvaObjektu.Checked:=false;
    aByAdresaObjektu.Checked:=false;
    aByPIBPredstavnikaSES.Checked:=false;
    aByPosadaPredstavnikaSES.Checked:=true;
  end;
end;

procedure TfrmFinansoviSankcii.FormCreate(Sender: TObject);
begin
  with frmMain do
  begin
    N13.Visible:=true;
    mnZahodiFinansovi_SankciiNeVrucheni.Visible:=true;
    mnZahodiFinansovi_SankciiNeSplacheni.Visible:=true;
    mnZahodiFinansovi_SankciiOskarzheni.Visible:=true;
    mnZahodiFinansovi_SankciiObjekt.Visible:=true;
    mnZahodiFinansovi_SankciiObjektNazvaObjektu.Visible:=true;
    mnZahodiFinansovi_SankciiObjektAdresaObjektu.Visible:=true;
    mnZahodiFinansovi_SankciiSES.Visible:=true;
    mnZahodiFinansovi_SankciiSESPIBPredstavnika.Visible:=true;
    mnZahodiFinansovi_SankciiSESPosadaPredstavnika.Visible:=true;
    mnZahodiFinansovi_SankciiTipProdukcii.Visible:=true;
    mnZahodiFinansovi_SankciiRozdilT23F18.Visible:=true;
  end;
end;

procedure TfrmFinansoviSankcii.aRozdilT23F18Execute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Фінансові санкції: Розділ т.23 ф.18';
  frmFilter.lblFilter.Caption:='Розділ т.23 ф.18';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aTipProdukciiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmFilter') then frmFilter:=TfrmFilter.Create(self);
  frmMain.Enabled:=false;
  frmFilter.Show;
  frmFilter.Position:=poMainFormCenter;
  frmFilter.BorderStyle:=bsDialog;
  frmFilter.Caption:='Фінансові санкції: Тип продукції';
  frmFilter.lblFilter.Caption:='Тип продукції';
  frmFilter.cbFilter.Text:='';
  frmFilter.cbFilter.Items.Clear;
  frmFilter.aUpdateExecute(sender);
end;

procedure TfrmFinansoviSankcii.aPidpisExecute(Sender: TObject);
var
  RecNo: integer;
begin
  with frmFinansoviSankcii.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='update FINANSOVI_SANKCII set PIDPIS=1 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  RecNo:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('RECORD_ID').Value;
  frmFinansoviSankcii.aUpdateExecute(sender);
  frmFinansoviSankcii.qFinansoviSankcii.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmFinansoviSankcii.qFinansoviSankciiAfterScroll(
  DataSet: TDataSet);
begin
  if frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIDPIS').IsNull then
  begin
    frmFinansoviSankcii.aPidpis.Caption:='Підписати';
    frmFinansoviSankcii.aPidpis.Enabled:=true;
    frmFinansoviSankcii.aEdit.Enabled:=true;
    frmFinansoviSankcii.aDelete.Enabled:=true;
  end
  else
  begin
    frmFinansoviSankcii.aPidpis.Caption:='Підписано';
    case frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIDPIS').Value of
      0:
        begin
          frmFinansoviSankcii.aPidpis.Caption:='Підписати';
          frmFinansoviSankcii.aPidpis.Enabled:=true;
          frmFinansoviSankcii.aEdit.Enabled:=true;
          frmFinansoviSankcii.aDelete.Enabled:=true;
        end;
      1:
        begin
          frmFinansoviSankcii.aPidpis.Caption:='Підписано';
          frmFinansoviSankcii.aPidpis.Enabled:=false;
          frmFinansoviSankcii.aEdit.Enabled:=false;
          frmFinansoviSankcii.aDelete.Enabled:=false;
        end;
    end;
  end;
end;

end.

