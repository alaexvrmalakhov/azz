unit FinansoviSankciiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls, Grids,
  DBGrids, ComCtrls, Controls, ExtCtrls, IniFiles, SysUtils, Dialogs;

const
  N1: array[0..9] of string = ('нуль',
    'одна',
    'дві',
    'три',
    'чотири',
    'п''ять',
    'шість',
    'сімь',
    'вісімь',
    'дев''ять');

const
  N1000: array[1..9] of string = ('одна',
    'дві',
    'три',
    'чотири',
    'п''ять',
    'шість',
    'сімь',
    'вісімь',
    'дев''ять');

const
  N11: array[0..9] of string = ('десять',
    'одинадцять',
    'дванадцять',
    'тринадцять',
    'чотирнадцять',
    'п''ятнадцять',
    'шістнадцять',
    'сімнадцять',
    'вісімнадцять',
    'дев''ятнадцять');

const
  N2: array[1..9] of string = ('десять',
    'двадцять',
    'тридцять',
    'сорок',
    'п''ятдесят',
    'шістьдесят',
    'сімьдесят',
    'вісімьдесят',
    'дев''яносто'
    );

const
  N3: array[1..9] of string = ('сто',
    'двісті',
    'триста',
    'чотириста',
    'п''ятьсот',
    'шістьсот',
    'сімьсот',
    'вісімьсот',
    'дев''ятьсот'
    );

const
  NThousand: array[1..3] of string = ('тисяча ',
    'тисячи ',
    'тисяч ');

const
  NMillion: array[1..3] of string = ('мільйон ',
    'мільйона ',
    'мільйонів ');

type
  TfrmFinansoviSankciiEdit = class(TForm)
    Label1: TLabel;
    edtNomerPostanovi: TEdit;
    btnNomerPostanovi: TButton;
    Label2: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    Panel2: TPanel;
    lblData: TLabel;
    lblNomer: TLabel;
    rgAkt_Dovidka: TRadioGroup;
    dtpData: TDateTimePicker;
    edtNomer: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label24: TLabel;
    dtpDataProtokolu: TDateTimePicker;
    dtpDataDo: TDateTimePicker;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    edtRecord_ID: TEdit;
    GroupBox3: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    edtPosada_GDSL: TEdit;
    edtPIB_GDSL: TEdit;
    btnGDSL: TButton;
    alFinansoviSankciiEdit: TActionList;
    qTeritory: TIBQuery;
    aTeritoryUpdate: TAction;
    aRecord_ID_Update: TAction;
    aNomerPostanoviUpdate: TAction;
    aAktDovidkaUpdate: TAction;
    pcFinansoviSankcii: TPageControl;
    tsVidomostiProObjekt: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    edtNajmenuvannyObjektu: TEdit;
    edtVidomchaPidporydkovanist: TEdit;
    btnVidomchaPidporydkovanist: TButton;
    edtAdresa: TEdit;
    edtPIBKerivnika: TEdit;
    edtPosadaKerivnika: TEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    edtRozrahunkovijRahunok: TEdit;
    edtKodDKPP: TEdit;
    edtViddilennyBanku: TEdit;
    edtMFO: TEdit;
    btnVidomostiProObjekt: TButton;
    cbRozdil_F18: TComboBox;
    btnRozdil_F18_Update: TButton;
    btnRozdil_F18_Choice: TButton;
    cbTipShtrafiv: TComboBox;
    btnTipShtrafivUpdate: TButton;
    btnTipShtrafivChoice: TButton;
    cbTipProdukcii: TComboBox;
    btnTipProdukcii_Update: TButton;
    btnTipProdukcii_Choice: TButton;
    aVidomchaPidporydkovanistChoice: TAction;
    aObjektChoice: TAction;
    Label3: TLabel;
    edtYear: TEdit;
    btnYearUpdate: TButton;
    aRozdil_F18Update: TAction;
    aRozdil_F18Choice: TAction;
    aTipShtrafiv_Update: TAction;
    aTipShtrafiv_Choice: TAction;
    aTipProdukcii_Update: TAction;
    aTipProdukcii_Choice: TAction;
    aYearUpdate: TAction;
    tsVidomostiProPereviryjuchogo: TTabSheet;
    gbVidomostiProFinansovu: TGroupBox;
    Panel4: TPanel;
    btnAddVidomosti: TButton;
    btnEditVidomosti: TButton;
    btnDeleteVidomosti: TButton;
    btnUpdateVidomosti: TButton;
    btnPererahuvatiVidomosti: TButton;
    gbPredstavnikSES: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbPIB_SES: TComboBox;
    btnPIB_SES_Update: TButton;
    btnPIB_SES_Choice: TButton;
    cbViddilSES: TComboBox;
    btnViddilSES_Update: TButton;
    btnViddilSES_Choice: TButton;
    cbPosadaSES: TComboBox;
    btnPosadaSES_Update: TButton;
    btnPosadaSES_Choice: TButton;
    aPIB_SES_Update: TAction;
    aPIB_SES_Choice: TAction;
    aPIB_SES_Change: TAction;
    aViddil_Update: TAction;
    aViddil_Choice: TAction;
    aPosadaSES_Update: TAction;
    aPosadaSES_Choice: TAction;
    dgVidomostiProFinansovu: TDBGrid;
    dsVidomostiProFinansovu: TDataSource;
    qVidomostiProFinansovu: TIBQuery;
    aAddVidomosti: TAction;
    aEditVidomosti: TAction;
    aDeleteVidomosti: TAction;
    aUpdateVidomosti: TAction;
    aPererahuvatiVidomosti: TAction;
    Label7: TLabel;
    Label8: TLabel;
    edtSumaSankcii: TEdit;
    edtSumaSankciiPropisom: TEdit;
    btnSumaSankcii: TButton;
    aSumaSankcii: TAction;
    aVidomchaPidporydkovanist_AdresaUpdate: TAction;
    aVstanoviv: TAction;
    aSchoEPorushennymUpdate: TAction;
    aTaZasluhavshiOsibUpdate: TAction;
    tsDodatkovo: TTabSheet;
    tsZmistPostanovi: TTabSheet;
    Label9: TLabel;
    edtVidomchaPidporydkovanist_Adresa: TEdit;
    btnVidomchaPidporydkovanist_Adresa: TButton;
    Label10: TLabel;
    memVstanoviv: TMemo;
    btnVstanoviv: TButton;
    Label11: TLabel;
    memSchoEPorushennym: TMemo;
    btnSchoEPorushennym: TButton;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    edtPIB_Posada_NazvaObjectu: TEdit;
    edtPIB_Posada_OsobiSES: TEdit;
    btnTaZasluhavshiOsib: TButton;
    Label14: TLabel;
    edtSchodoPorushenny: TEdit;
    btnSchodoPorushenny: TButton;
    aSchodoPorushennyUpdate: TAction;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    btnAddLaboratory: TButton;
    btnEditLaboratory: TButton;
    btnDeleteLaboratory: TButton;
    btnUpdateLaboratory: TButton;
    aAddLaboratory: TAction;
    aEditLaboratory: TAction;
    aDeleteLaboratory: TAction;
    aUpdateLaboratory: TAction;
    dgLaboratory: TDBGrid;
    dsLaboratory: TDataSource;
    qLaboratory: TIBQuery;
    rgVisnovki: TRadioGroup;
    dtpTerminTealizacii: TDateTimePicker;
    aVisnovkiChoice: TAction;
    aGDSL_Update: TAction;
    aOK: TAction;
    aCancel: TAction;
    function CinaPropisom(suma: Real): string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aRecord_ID_UpdateExecute(Sender: TObject);
    procedure aNomerPostanoviUpdateExecute(Sender: TObject);
    procedure aAktDovidkaUpdateExecute(Sender: TObject);
    procedure aVidomchaPidporydkovanistChoiceExecute(Sender: TObject);
    procedure aObjektChoiceExecute(Sender: TObject);
    procedure aRozdil_F18UpdateExecute(Sender: TObject);
    procedure aRozdil_F18ChoiceExecute(Sender: TObject);
    procedure aTipShtrafiv_UpdateExecute(Sender: TObject);
    procedure aTipShtrafiv_ChoiceExecute(Sender: TObject);
    procedure aTipProdukcii_UpdateExecute(Sender: TObject);
    procedure aTipProdukcii_ChoiceExecute(Sender: TObject);
    procedure aYearUpdateExecute(Sender: TObject);
    procedure aPIB_SES_UpdateExecute(Sender: TObject);
    procedure aPIB_SES_ChoiceExecute(Sender: TObject);
    procedure aPIB_SES_ChangeExecute(Sender: TObject);
    procedure aViddil_UpdateExecute(Sender: TObject);
    procedure aViddil_ChoiceExecute(Sender: TObject);
    procedure aPosadaSES_UpdateExecute(Sender: TObject);
    procedure aPosadaSES_ChoiceExecute(Sender: TObject);
    procedure aAddVidomostiExecute(Sender: TObject);
    procedure aEditVidomostiExecute(Sender: TObject);
    procedure aDeleteVidomostiExecute(Sender: TObject);
    procedure aUpdateVidomostiExecute(Sender: TObject);
    procedure aPererahuvatiVidomostiExecute(Sender: TObject);
    procedure edtNomerPostanoviExit(Sender: TObject);
    procedure dtpDataPostanoviExit(Sender: TObject);
    procedure aSumaSankciiExecute(Sender: TObject);
    procedure edtSumaSankciiExit(Sender: TObject);
    procedure aVidomchaPidporydkovanist_AdresaUpdateExecute(
      Sender: TObject);
    procedure aVstanovivExecute(Sender: TObject);
    procedure aSchoEPorushennymUpdateExecute(Sender: TObject);
    procedure aTaZasluhavshiOsibUpdateExecute(Sender: TObject);
    procedure aSchodoPorushennyUpdateExecute(Sender: TObject);
    procedure aAddLaboratoryExecute(Sender: TObject);
    procedure aEditLaboratoryExecute(Sender: TObject);
    procedure aDeleteLaboratoryExecute(Sender: TObject);
    procedure aUpdateLaboratoryExecute(Sender: TObject);
    procedure aVisnovkiChoiceExecute(Sender: TObject);
    procedure aGDSL_UpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure pcFinansoviSankciiChange(Sender: TObject);
  private
    function IntToStroka(n: Integer): String;
  end;

var
  frmFinansoviSankciiEdit: TfrmFinansoviSankciiEdit;

implementation

uses
  Main, VidomchaPidporydkovanist, FinansoviSankcii, Objekti, Rozdil_T23_F18,
  TipiShtrafiv, TipiProdukcii, Spivrobitniki, Viddilenny, Posadi,
  VidomostiProFinansovu, Statti, LaboratornijKontrol;

{$R *.dfm}

function TfrmFinansoviSankciiEdit.CinaPropisom(suma: real):string;
var
  valuta, str: string;
  DecPartToInt, IntPart: integer;
  DecPart: Real;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  valuta:=INIAZZ.ReadString('System','Money',valuta);
  IntPart:=trunc(int(suma));
  DecPart:=suma-IntPart;
  str:='';
  DecPartToInt:=trunc(int(DecPart*100));
  str:=str+FloatToStr(suma)+' (';
  if IntPart=0 then str:=str+'нуль '+valuta else str:=str+IntToStroka(IntPart)+' '+valuta;
  if DecPartToInt=0 then str:=str+' 00 коп.)' else str:=str+' '+IntToStr(DecPartToInt)+' коп.)';
  INIAZZ.Free;
  CinaPropisom:=str;
end;

function TfrmFinansoviSankciiEdit.IntToStroka(n: integer): string;
var
  i, dec, j, j0: integer;
  s: string;
  degt, degm: boolean;
  buf: string;
begin
  degt:=false;
  degm:=false;
  s:=IntToStr(n);
  Result:='';
  for i:=length(s) downto 1 do
  begin
    dec:=(length(s)-i+1); // получим разряд
    j:=StrToInt(s[i]); // получим цифру

    if j=0 then j0:=0;
    if (not (j in [1..9])) and (dec<>1) then Continue;

    if Dec in [1,4,7,10] then
    try
      if StrToInt(s[i-1])=1 then
      begin
        j0:=j;
        Continue;
      end; // подготовка к 10..19 тысяч/миллионов
    except
    end;

    if Dec in [2,5,8,11] then
      if j=1 then
      begin
        case dec of
          2: Result:=N11[j0]+' '; // если 10..19 тысяч/миллионов
          5:
            begin
              Result:=N11[j0]+' '+ NThousand[3]+Result;
              degt:=true;
            end;
          8:
            begin
              Result:=N11[j0]+' '+NMillion[3]+Result;
              degm:=true;
            end;
        end;
        Continue;
      end;

    if DEC in [4..6] then
    begin
      if (j<>0) and (not degt) then
      begin
        if dec=4 then
          case j of
            1: buf:=NThousand[1];
            2..4: buf:=NThousand[2];
              // прибавим слово тысяча если ещё не добавляли
            5..9: buf:=NThousand[3];
          end
        else
          buf:=NThousand[3];
        degt:=true;
      end;
    end;

    if DEC in [7..9] then
    begin
      if (j<>0) and (not degm) then
      begin
        if dec=7 then
          case j of
            1: buf:=NMillion[1];
            2..4: buf:=NMillion[2];
              // прибавим слово миллион если ещё не добавляли
            5..9: buf:=NMillion[3];
          end
        else
          buf:=NMillion[3];
        degm:=true;
      end;
    end;

    Result:=buf+Result;

    while dec>3 do
      dec:=dec-3;

    case Dec of
      1: if j<>0 then
          if degt and (not degm) then
            Result:=N1000[j]+' '+Result
          else
            Result:=N1[j]+' '+Result; // 3 три
      2: Result:=N2[j]+' '+Result; // 23 двадцать три
      3: Result:=N3[j]+' '+Result; // 123 сто двадцать три
    end;
    Buf:='';
    j0:=j;
  end;
end;

procedure TfrmFinansoviSankciiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmFinansoviSankciiEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  frmFinansoviSankciiEdit.cbMinistry.Text:=frmFinansoviSankcii.cbMinistry.Text;
  frmFinansoviSankciiEdit.cbMinistry.Enabled:=false;
  frmFinansoviSankciiEdit.cbTeritory.Text:=frmFinansoviSankcii.cbTeritory.Text;
  frmFinansoviSankciiEdit.cbTeritory.Enabled:=false;
  frmFinansoviSankciiEdit.cbDistrict.Text:=frmFinansoviSankcii.cbDistrict.Text;
  frmFinansoviSankciiEdit.cbDistrict.Enabled:=false;
end;

procedure TfrmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(
  Sender: TObject);
begin
  with frmFinansoviSankciiEdit do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='insert into FINANSOVI_SANKCII (RECORD_ID) values (gen_id(GET_FINANSOVI_RECORD_ID,1))';
    qTeritory.Open;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from FINANSOVI_SANKCII order by RECORD_ID';
    qTeritory.Open;
    qTeritory.Last;
    edtRecord_ID.Text:=IntToStr(qTeritory.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankciiEdit do
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

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik order by NOMER_POSTANOVI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
    qTeritory.Params.Add;
    qTeritory.Params[3].Name:='Rik';
    qTeritory.Params[3].Value:=frmFinansoviSankcii.edtYear.Text;
    qTeritory.Open;
    qTeritory.Last;
    edtNomerPostanovi.Text:=IntToStr(qTeritory.RecordCount+1);
    if qTeritory.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[]) then
      while qTeritory.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[])  do edtNomerPostanovi.Text:=IntToStr(StrToInt(edtNomerPostanovi.Text)+1);
  end;
end;

procedure TfrmFinansoviSankciiEdit.aAktDovidkaUpdateExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.dtpData.Date:=int(date);
  frmFinansoviSankciiEdit.dtpDataDo.Date:=int(date);
  frmFinansoviSankciiEdit.edtNomer.Text:='';
  case frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex of
    -1:
       begin
         frmFinansoviSankciiEdit.lblData.Visible:=false;
         frmFinansoviSankciiEdit.dtpData.Visible:=false;
         frmFinansoviSankciiEdit.dtpDataDo.Visible:=false;
         frmFinansoviSankciiEdit.lblNomer.Visible:=false;
         frmFinansoviSankciiEdit.edtNomer.Visible:=false;
       end;
     0:
       begin
         frmFinansoviSankciiEdit.lblData.Visible:=true;
         frmFinansoviSankciiEdit.dtpData.Visible:=true;
         frmFinansoviSankciiEdit.dtpDataDo.Visible:=false;
         frmFinansoviSankciiEdit.lblNomer.Visible:=false;
         frmFinansoviSankciiEdit.edtNomer.Visible:=false;
         if frmFinansoviSankciiEdit.Caption='Додавання запису' then
         begin
           frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=true;
         end;
         if frmFinansoviSankciiEdit.Caption='Редагування запису' then
         begin
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then frmFinansoviSankciiEdit.dtpData.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value) else frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=true;
         end;
         if frmFinansoviSankciiEdit.Caption='Видалення запису' then
         begin
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then frmFinansoviSankciiEdit.dtpData.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value) else frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=false;
         end;
       end;
     1:
       begin
         frmFinansoviSankciiEdit.lblData.Visible:=true;
         frmFinansoviSankciiEdit.dtpData.Visible:=true;
         frmFinansoviSankciiEdit.dtpDataDo.Visible:=false;
         frmFinansoviSankciiEdit.lblNomer.Visible:=true;
         frmFinansoviSankciiEdit.edtNomer.Visible:=true;
         if frmFinansoviSankciiEdit.Caption='Додавання запису' then
         begin
           frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=true;
           frmFinansoviSankciiEdit.edtNomer.Text:='';
           frmFinansoviSankciiEdit.edtNomer.Enabled:=true;
         end;
         if frmFinansoviSankciiEdit.Caption='Редагування запису' then
         begin
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then frmFinansoviSankciiEdit.dtpData.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value) else frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=true;
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').IsNull then frmFinansoviSankciiEdit.edtNomer.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').Value;
           frmFinansoviSankciiEdit.edtNomer.Enabled:=true;
         end;
         if frmFinansoviSankciiEdit.Caption='Видалення запису' then
         begin
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then frmFinansoviSankciiEdit.dtpData.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value) else frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=false;
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').IsNull then frmFinansoviSankciiEdit.edtNomer.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').Value;
           frmFinansoviSankciiEdit.edtNomer.Enabled:=false;
         end;
       end;
     2:
       begin
         frmFinansoviSankciiEdit.lblData.Visible:=true;
         frmFinansoviSankciiEdit.dtpData.Visible:=true;
         frmFinansoviSankciiEdit.dtpDataDo.Visible:=true;
         frmFinansoviSankciiEdit.lblNomer.Visible:=true;
         frmFinansoviSankciiEdit.edtNomer.Visible:=true;
         if frmFinansoviSankciiEdit.Caption='Додавання запису' then
         begin
           frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=true;
           frmFinansoviSankciiEdit.dtpDataDo.Date:=int(date);
           frmFinansoviSankciiEdit.dtpDataDo.Enabled:=true;
           frmFinansoviSankciiEdit.edtNomer.Text:='';
           frmFinansoviSankciiEdit.edtNomer.Enabled:=true;
         end;
         if frmFinansoviSankciiEdit.Caption='Редагування запису' then
         begin
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then frmFinansoviSankciiEdit.dtpData.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value) else frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=true;
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').IsNull then frmFinansoviSankciiEdit.dtpDataDo.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').Value) else frmFinansoviSankciiEdit.dtpDataDo.Date:=int(date);
           frmFinansoviSankciiEdit.dtpDataDo.Enabled:=true;
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').IsNull then frmFinansoviSankciiEdit.edtNomer.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').Value;
           frmFinansoviSankciiEdit.edtNomer.Enabled:=true;
         end;
         if frmFinansoviSankciiEdit.Caption='Видалення запису' then
         begin
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').IsNull then frmFinansoviSankciiEdit.dtpData.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATA').Value) else frmFinansoviSankciiEdit.dtpData.Date:=int(date);
           frmFinansoviSankciiEdit.dtpData.Enabled:=false;
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').IsNull then frmFinansoviSankciiEdit.dtpDataDo.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('DATADO').Value) else frmFinansoviSankciiEdit.dtpDataDo.Date:=int(date);
           frmFinansoviSankciiEdit.dtpDataDo.Enabled:=false;
           if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').IsNull then frmFinansoviSankciiEdit.edtNomer.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('NOMER').Value;
           frmFinansoviSankciiEdit.edtNomer.Enabled:=false;
         end;
       end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aVidomchaPidporydkovanistChoiceExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aVidomchaPidporydkovanistExecute(sender);
  frmVidomchaPidporydkovanist.aChoice.Enabled:=true;
  frmVidomchaPidporydkovanist.Left:=frmMain.Left+70;
  frmVidomchaPidporydkovanist.Top:=frmMain.Top+70;
  frmVidomchaPidporydkovanist.Width:=frmMain.Width-70;
  frmVidomchaPidporydkovanist.Height:=frmMain.Height-70;
  frmVidomchaPidporydkovanist.Position:=poMainFormCenter;
  frmVidomchaPidporydkovanist.FormStyle:=fsNormal;
  frmVidomchaPidporydkovanist.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aObjektChoiceExecute(Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aObjektiExecute(sender);
  frmObjekti.aChoice.Enabled:=true;
  frmObjekti.Left:=frmMain.Left+70;
  frmObjekti.Top:=frmMain.Top+70;
  frmObjekti.Width:=frmMain.Width-70;
  frmObjekti.Height:=frmMain.Height-70;
  frmObjekti.Position:=poMainFormCenter;
  frmObjekti.FormStyle:=fsNormal;
  frmObjekti.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(
  Sender: TObject);
begin
  with frmFinansoviSankciiEdit do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qTeritory.Open;
    cbRozdil_F18.Text:='';
    cbRozdil_F18.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbRozdil_F18.Items.Add(qTeritory.FieldByName('OBJEKTNAGLYDU').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aRozdil_F18ChoiceExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(
  Sender: TObject);
begin
  with frmFinansoviSankciiEdit do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qTeritory.Open;
    cbTipShtrafiv.Text:='';
    cbTipShtrafiv.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTipShtrafiv.Items.Add(qTeritory.FieldByName('TIPSHTRAFU').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aTipShtrafiv_ChoiceExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aTipShtrafuExecute(sender);
  frmTipishtrafiv.aChoice.Enabled:=true;
  frmTipiShtrafiv.Left:=frmMain.Left+70;
  frmTipiShtrafiv.Top:=frmMain.Top+70;
  frmTipiShtrafiv.Width:=frmMain.Width-70;
  frmTipiShtrafiv.Height:=frmMain.Height-70;
  frmTipiShtrafiv.Position:=poMainFormCenter;
  frmTipiShtrafiv.FormStyle:=fsNormal;
  frmTipiShtrafiv.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(
  Sender: TObject);
begin
  with frmFinansoviSankciiEdit do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
    qTeritory.Open;
    cbTipProdukcii.Text:='';
    cbTipProdukcii.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTipProdukcii.Items.Add(qTeritory.FieldByName('TIPPRODUKCII').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aTipProdukcii_ChoiceExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aTipProdukciiExecute(sender);
  frmTipiProdukcii.aChoice.Enabled:=true;
  frmTipiProdukcii.Left:=frmMain.Left+70;
  frmTipiProdukcii.Top:=frmMain.Top+70;
  frmTipiProdukcii.Width:=frmMain.Width-70;
  frmTipiProdukcii.Height:=frmMain.Height-70;
  frmTipiProdukcii.Position:=poMainFormCenter;
  frmTipiProdukcii.FormStyle:=fsNormal;
  frmTipiProdukcii.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aYearUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmFinansoviSankciiEdit.edtYear.Text:=INIAZZ.ReadString('System','Year',frmFinansoviSankciiEdit.edtYear.Text);
  INIAZZ.Free;
end;

procedure TfrmFinansoviSankciiEdit.aPIB_SES_UpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankciiEdit do
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

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
    qTeritory.Open;
    cbPIB_SES.Text:='';
    cbPIB_SES.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbPIB_SES.Items.Add(qTeritory.FieldByName('PRIZVISXHE').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aPIB_SES_ChoiceExecute(Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aSpivrobitnikiExecute(sender);
  frmSpivrobitniki.aChoice.Enabled:=true;
  frmSpivrobitniki.Left:=frmMain.Left+70;
  frmSpivrobitniki.Top:=frmMain.Top+70;
  frmSpivrobitniki.Width:=frmMain.Width-70;
  frmSpivrobitniki.Height:=frmMain.Height-70;
  frmSpivrobitniki.Position:=poMainFormCenter;
  frmSpivrobitniki.FormStyle:=fsNormal;
  frmSpivrobitniki.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aPIB_SES_ChangeExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
  Viddil, Posada: integer;
begin
  with frmFinansoviSankciiEdit do
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

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:=' select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and PRIZVISXHE=:PIB order by PRIZVISXHE';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
    qTeritory.Params.Add;
    qTeritory.Params[3].Name:='PIB';
    qTeritory.Params[3].Value:=cbPIB_SES.Text;
    qTeritory.Open;
    if qTeritory.Locate('PRIZVISXHE',cbPIB_SES.Text,[]) then
    begin
      Viddil:=qTeritory.FieldByName('KODVIDDILENNY').Value;
      Posada:=qTeritory.FieldByName('KODPOSADI').Value;
    end
    else
    begin
      Viddil:=0;
      Posada:=0;
    end;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from VIDDILENNY where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and KODVIDDILENNY=:Kod order by KODVIDDILENNY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
    qTeritory.Params.Add;
    qTeritory.Params[3].Name:='Kod';
    qTeritory.Params[3].Value:=IntToStr(Viddil);
    qTeritory.Open;
    if qTeritory.Locate('KODVIDDILENNY',Viddil,[]) then cbViddilSES.Text:=qTeritory.FieldByName('NAZVAVIDDILENNY').Value else cbViddilSES.Text:='';
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from POSADI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and KODPOSADI=:Kod order by KODPOSADI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
    qTeritory.Params.Add;
    qTeritory.Params[3].Name:='Kod';
    qTeritory.Params[3].Value:=IntToStr(Posada);
    qTeritory.Open;
    if qTeritory.Locate('KODPOSADI',Posada,[]) then cbPosadaSES.Text:=qTeritory.FieldByName('NAZVAPOSADI').Value;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aViddil_UpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankciiEdit do
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

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from VIDDILENNY where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAVIDDILENNY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
//    qTeritory.SQL.Text:='select * from VIDDILENNY,RAJONI where RAJONI.RAJON='''+cbDistrict.Text+''' and VIDDILENNY.RAJON=RAJONI.KOD order by NAZVAVIDDILENNY';
    qTeritory.Open;
    cbViddilSES.Text:='';
    cbViddilSES.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbViddilSES.Items.Add(qTeritory.FieldByName('NAZVAVIDDILENNY').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aViddil_ChoiceExecute(Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
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

procedure TfrmFinansoviSankciiEdit.aPosadaSES_UpdateExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankciiEdit do
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

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from POSADI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAPOSADI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
//    qTeritory.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON='''+cbDistrict.Text+''' and POSADI.RAJON=RAJONI.KOD order by NAZVAPOSADI';
    qTeritory.Open;
    cbPosadaSES.Text:='';
    cbPosadaSES.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbPosadaSES.Items.Add(qTeritory.FieldByName('NAZVAPOSADI').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aPosadaSES_ChoiceExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
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

procedure TfrmFinansoviSankciiEdit.aAddVidomostiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVidomostiProFinansovu:=TfrmVidomostiProFinansovu.Create(self);
  frmFinansoviSankciiEdit.Enabled:=false;
  frmVidomostiProFinansovu.Show;
  frmVidomostiProFinansovu.Position:=poMainFormCenter;
  frmVidomostiProFinansovu.BorderStyle:=bsDialog;
  frmVidomostiProFinansovu.Caption:='Додавання';
  frmVidomostiProFinansovu.cbMinistry.Text:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmVidomostiProFinansovu.cbMinistry.Enabled:=false;
  frmVidomostiProFinansovu.cbTeritory.Text:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmVidomostiProFinansovu.cbTeritory.Enabled:=false;
  frmVidomostiProFinansovu.cbDistrict.Text:=frmFinansoviSankciiEdit.cbDistrict.Text;
  frmVidomostiProFinansovu.cbDistrict.Enabled:=false;

  frmVidomostiProFinansovu.aUpdateNomerDataPostanoviExecute(sender);
  frmVidomostiProFinansovu.edtNomerPostanovi.Enabled:=false;
  frmVidomostiProFinansovu.dtpDataPostanovi.Enabled:=false;
  frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
  frmVidomostiProFinansovu.edtRecordID.Enabled:=false;
  frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text:='';
  frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Enabled:=true;
  frmVidomostiProFinansovu.cbVirobnik.Text:='';
  frmVidomostiProFinansovu.cbVirobnik.Items.Clear;
  frmVidomostiProFinansovu.aVirobnikUpdateExecute(sender);
  frmVidomostiProFinansovu.cbVirobnik.Enabled:=true;
  frmVidomostiProFinansovu.btnVirobnikUpdate.Enabled:=true;
  frmVidomostiProFinansovu.btnVirobnikChoice.Enabled:=true;
  frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
  frmVidomostiProFinansovu.edtKilkistTovaru.Enabled:=true;
  frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
  frmVidomostiProFinansovu.cbOdiniciVimiru.Items.Clear;
  frmVidomostiProFinansovu.aOdiniciVimiruUpdateExecute(sender);
  frmVidomostiProFinansovu.cbOdiniciVimiru.Enabled:=true;
  frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
  frmVidomostiProFinansovu.edtCinaOdinici.Enabled:=true;
  frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:='';
  frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Enabled:=true;
  frmVidomostiProFinansovu.btnCinaOdinici.Enabled:=true;
  frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
  frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:='';
  frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Enabled:=true;
  frmVidomostiProFinansovu.edtZagalnaCina.Enabled:=true;
  frmVidomostiProFinansovu.btnZagalnaCina.Enabled:=true;
  frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
end;

procedure TfrmFinansoviSankciiEdit.aEditVidomostiExecute(Sender: TObject);
begin
  if frmFinansoviSankciiEdit.qVidomostiProFinansovu.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVidomostiProFinansovu:=TfrmVidomostiProFinansovu.Create(self);
  frmFinansoviSankciiEdit.Enabled:=false;
  frmVidomostiProFinansovu.Show;
  frmVidomostiProFinansovu.Position:=poMainFormCenter;
  frmVidomostiProFinansovu.BorderStyle:=bsDialog;
  frmVidomostiProFinansovu.Caption:='Редагування';
  frmVidomostiProFinansovu.cbMinistry.Text:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmVidomostiProFinansovu.cbMinistry.Enabled:=false;
  frmVidomostiProFinansovu.cbTeritory.Text:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmVidomostiProFinansovu.cbTeritory.Enabled:=false;
  frmVidomostiProFinansovu.cbDistrict.Text:=frmFinansoviSankciiEdit.cbDistrict.Text;
  frmVidomostiProFinansovu.cbDistrict.Enabled:=false;

  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NOMER_POSTANOVI').IsNull then frmVidomostiProFinansovu.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NOMER_POSTANOVI').Value) else frmVidomostiProFinansovu.aUpdateNomerDataPostanoviExecute(sender);
  frmVidomostiProFinansovu.edtNomerPostanovi.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('DATA_POSTANOVI').IsNull then frmVidomostiProFinansovu.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('DATA_POSTANOVI').Value) else frmVidomostiProFinansovu.aUpdateNomerDataPostanoviExecute(sender);
  frmVidomostiProFinansovu.dtpDataPostanovi.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('RECORD_ID').IsNull then frmVidomostiProFinansovu.edtRecordID.Text:=IntToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('RECORD_ID').Value) else frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
  frmVidomostiProFinansovu.edtRecordID.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').IsNull then frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').Value else frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text:='';
  frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Enabled:=true;
  frmVidomostiProFinansovu.cbVirobnik.Text:='';
  frmVidomostiProFinansovu.cbVirobnik.Items.Clear;
  frmVidomostiProFinansovu.aVirobnikUpdateExecute(sender);
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').IsNull then frmVidomostiProFinansovu.cbVirobnik.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').Value else frmVidomostiProFinansovu.cbVirobnik.Text:='';
  frmVidomostiProFinansovu.cbVirobnik.Enabled:=true;
  frmVidomostiProFinansovu.btnVirobnikUpdate.Enabled:=true;
  frmVidomostiProFinansovu.btnVirobnikChoice.Enabled:=true;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').IsNull then frmVidomostiProFinansovu.edtKilkistTovaru.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').Value else frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
  frmVidomostiProFinansovu.edtKilkistTovaru.Enabled:=true;
  frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
  frmVidomostiProFinansovu.cbOdiniciVimiru.Items.Clear;
  frmVidomostiProFinansovu.aOdiniciVimiruUpdateExecute(sender);
  frmVidomostiProFinansovu.cbOdiniciVimiru.Enabled:=true;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').IsNull then frmVidomostiProFinansovu.cbOdiniciVimiru.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').Value else frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
  frmVidomostiProFinansovu.cbOdiniciVimiru.Enabled:=true;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').IsNull then frmVidomostiProFinansovu.edtCinaOdinici.Text:=FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').Value) else frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
  frmVidomostiProFinansovu.edtCinaOdinici.Enabled:=true;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').IsNull then frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').Value else frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:='';
  frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Enabled:=true;
  frmVidomostiProFinansovu.btnCinaOdinici.Enabled:=true;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').IsNull then frmVidomostiProFinansovu.edtZagalnaCina.Text:=FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').Value) else frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
  frmVidomostiProFinansovu.edtZagalnaCina.Enabled:=true;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').IsNull then frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').Value else frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:='';
  frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Enabled:=true;
  frmVidomostiProFinansovu.btnZagalnaCina.Enabled:=true;
  frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
end;

procedure TfrmFinansoviSankciiEdit.aDeleteVidomostiExecute(
  Sender: TObject);
begin
  if frmFinansoviSankciiEdit.qVidomostiProFinansovu.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVidomostiProFinansovu:=TfrmVidomostiProFinansovu.Create(self);
  frmFinansoviSankciiEdit.Enabled:=false;
  frmVidomostiProFinansovu.Show;
  frmVidomostiProFinansovu.Position:=poMainFormCenter;
  frmVidomostiProFinansovu.BorderStyle:=bsDialog;
  frmVidomostiProFinansovu.Caption:='Видалення';
  frmVidomostiProFinansovu.cbMinistry.Text:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmVidomostiProFinansovu.cbMinistry.Enabled:=false;
  frmVidomostiProFinansovu.cbTeritory.Text:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmVidomostiProFinansovu.cbTeritory.Enabled:=false;
  frmVidomostiProFinansovu.cbDistrict.Text:=frmFinansoviSankciiEdit.cbDistrict.Text;
  frmVidomostiProFinansovu.cbDistrict.Enabled:=false;

  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NOMER_POSTANOVI').IsNull then frmVidomostiProFinansovu.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NOMER_POSTANOVI').Value) else frmVidomostiProFinansovu.aUpdateNomerDataPostanoviExecute(sender);
  frmVidomostiProFinansovu.edtNomerPostanovi.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('DATA_POSTANOVI').IsNull then frmVidomostiProFinansovu.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('DATA_POSTANOVI').Value) else frmVidomostiProFinansovu.aUpdateNomerDataPostanoviExecute(sender);
  frmVidomostiProFinansovu.dtpDataPostanovi.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('RECORD_ID').IsNull then frmVidomostiProFinansovu.edtRecordID.Text:=IntToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('RECORD_ID').Value) else frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
  frmVidomostiProFinansovu.edtRecordID.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').IsNull then frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').Value else frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text:='';
  frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Enabled:=false;
  frmVidomostiProFinansovu.cbVirobnik.Text:='';
  frmVidomostiProFinansovu.cbVirobnik.Items.Clear;
  frmVidomostiProFinansovu.aVirobnikUpdateExecute(sender);
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').IsNull then frmVidomostiProFinansovu.cbVirobnik.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').Value else frmVidomostiProFinansovu.cbVirobnik.Text:='';
  frmVidomostiProFinansovu.cbVirobnik.Enabled:=false;
  frmVidomostiProFinansovu.btnVirobnikUpdate.Enabled:=false;
  frmVidomostiProFinansovu.btnVirobnikChoice.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').IsNull then frmVidomostiProFinansovu.edtKilkistTovaru.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').Value else frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
  frmVidomostiProFinansovu.edtKilkistTovaru.Enabled:=false;
  frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
  frmVidomostiProFinansovu.cbOdiniciVimiru.Items.Clear;
  frmVidomostiProFinansovu.aOdiniciVimiruUpdateExecute(sender);
  frmVidomostiProFinansovu.cbOdiniciVimiru.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').IsNull then frmVidomostiProFinansovu.cbOdiniciVimiru.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').Value else frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
  frmVidomostiProFinansovu.cbOdiniciVimiru.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').IsNull then frmVidomostiProFinansovu.edtCinaOdinici.Text:=FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').Value) else frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
  frmVidomostiProFinansovu.edtCinaOdinici.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').IsNull then frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').Value else frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:='';
  frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Enabled:=false;
  frmVidomostiProFinansovu.btnCinaOdinici.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').IsNull then frmVidomostiProFinansovu.edtZagalnaCina.Text:=FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').Value) else frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
  frmVidomostiProFinansovu.edtZagalnaCina.Enabled:=false;
  if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').IsNull then frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:=frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').Value else frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:='';
  frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Enabled:=false;
  frmVidomostiProFinansovu.btnZagalnaCina.Enabled:=false;
  frmVidomostiProFinansovu.btnVidminiti.SetFocus;
end;

procedure TfrmFinansoviSankciiEdit.aUpdateVidomostiExecute(
  Sender: TObject);
var
  Ministrty,Teritory,District: integer;
begin
  with frmFinansoviSankciiEdit do
  begin
    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qVidomostiProFinansovu.Params.Clear;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[0].Name:='Ministry';
    qVidomostiProFinansovu.Params[0].Value:=cbMinistry.Text;
    qVidomostiProFinansovu.Open;
    if qVidomostiProFinansovu.Locate('MINISTRY',cbMinistry.Text,[]) then Ministrty:=qVidomostiProFinansovu.FieldByName('KOD').Value else Ministrty:=0;

    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qVidomostiProFinansovu.Params.Clear;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[0].Name:='Ministry';
    qVidomostiProFinansovu.Params[0].Value:=Ministrty;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[1].Name:='Teritory';
    qVidomostiProFinansovu.Params[1].Value:=cbTeritory.Text;
    qVidomostiProFinansovu.Open;
    if qVidomostiProFinansovu.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qVidomostiProFinansovu.FieldByName('KOD').Value else Teritory:=0;

    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qVidomostiProFinansovu.Params.Clear;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[0].Name:='Ministry';
    qVidomostiProFinansovu.Params[0].Value:=Ministrty;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[1].Name:='Teritory';
    qVidomostiProFinansovu.Params[1].Value:=Teritory;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[2].Name:='Rajon';
    qVidomostiProFinansovu.Params[2].Value:=cbDistrict.Text;
    qVidomostiProFinansovu.Open;
    if qVidomostiProFinansovu.Locate('RAJON',cbDistrict.Text,[]) then District:=qVidomostiProFinansovu.FieldByName('KOD').Value else District:=0;

    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from VIDOMOSTI_PRO_FINANSOVU where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by NAJMENUVANNY_TOVARU';
    qVidomostiProFinansovu.Params.Clear;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[0].Name:='Ministry';
    qVidomostiProFinansovu.Params[0].Value:=Ministrty;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[1].Name:='Teritory';
    qVidomostiProFinansovu.Params[1].Value:=Teritory;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[2].Name:='Rajon';
    qVidomostiProFinansovu.Params[2].Value:=District;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[3].Name:='NomerPostanovi';
    qVidomostiProFinansovu.Params[3].Value:=edtNomerPostanovi.Text;
    qVidomostiProFinansovu.Params.Add;
    qVidomostiProFinansovu.Params[4].Name:='DataPostanovi';
    qVidomostiProFinansovu.Params[4].Value:=DateToStr(dtpDataPostanovi.Date);
    qVidomostiProFinansovu.Open;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(
  Sender: TObject);
begin
  with frmFinansoviSankciiEdit do
  begin
    edtSumaSankcii.Text:='0';
    edtSumaSankciiPropisom.Text:='';
    aUpdateVidomostiExecute(sender);
    qVidomostiProFinansovu.First;
    while not qVidomostiProFinansovu.Eof do
    begin
      if not qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').IsNull then edtSumaSankcii.Text:=FloatToStr(StrToFloat(edtSumaSankcii.Text)+qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').Value);
      qVidomostiProFinansovu.Next;
    end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.edtNomerPostanoviExit(Sender: TObject);
begin
  frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
end;

procedure TfrmFinansoviSankciiEdit.dtpDataPostanoviExit(Sender: TObject);
begin
  frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
  frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
end;

procedure TfrmFinansoviSankciiEdit.aSumaSankciiExecute(Sender: TObject);
begin
  if frmFinansoviSankciiEdit.edtSumaSankcii.Text='' then
  begin
    frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
    frmFinansoviSankciiEdit.edtSumaSankcii.SetFocus;
    exit;
  end;
  try
    StrToFloat(frmFinansoviSankciiEdit.edtSumaSankcii.Text);
  except
    frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
    frmFinansoviSankciiEdit.edtSumaSankcii.SetFocus;
    exit;
  end;
  frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text:=CinaPropisom(StrToFloat(frmFinansoviSankciiEdit.edtSumaSankcii.Text));
end;

procedure TfrmFinansoviSankciiEdit.edtSumaSankciiExit(Sender: TObject);
begin
  frmFinansoviSankciiEdit.aSumaSankciiExecute(sender);
end;

procedure TfrmFinansoviSankciiEdit.aVidomchaPidporydkovanist_AdresaUpdateExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text:=frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text+' '+frmFinansoviSankciiEdit.edtAdresa.Text;
end;

procedure TfrmFinansoviSankciiEdit.aVstanovivExecute(Sender: TObject);
var
  Vstanoviv: string;
  laboratory: string;
begin
  Vstanoviv:='';
  case frmFinansoviSankciiEdit.rgVisnovki.ItemIndex of
    -1:
      begin
        frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsDodatkovo;
        frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=0;
        frmFinansoviSankciiEdit.rgVisnovki.SetFocus;
      end;
    0:  //без гігієнічних висновків
      begin
        Vstanoviv:='';
        frmFinansoviSankciiEdit.memVstanoviv.Clear;
        frmFinansoviSankciiEdit.memVstanoviv.Enabled:=true;
        frmFinansoviSankciiEdit.btnVstanoviv.Enabled:=true;
        Vstanoviv:=Vstanoviv+DateToStr(frmFinansoviSankciiEdit.dtpData.Date)+' в '+frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text+' '+frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text+' за адресою '+frmFinansoviSankciiEdit.edtAdresa.Text+' реалізовано ';
        frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
        frmFinansoviSankciiEdit.qVidomostiProFinansovu.First;
        while not frmFinansoviSankciiEdit.qVidomostiProFinansovu.Eof do
        begin
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').IsNull then Vstanoviv:=Vstanoviv+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').IsNull then Vstanoviv:=Vstanoviv+' в кількості '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').IsNull then Vstanoviv:=Vstanoviv+' '+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').IsNull then Vstanoviv:=Vstanoviv+' виробництва '+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').IsNull then Vstanoviv:=Vstanoviv+' ціною за одиницю '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').IsNull then Vstanoviv:=Vstanoviv+' ('+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').IsNull then Vstanoviv:=Vstanoviv+') загальною ціною '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').IsNull then Vstanoviv:=Vstanoviv+' ('+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').Value+')';
          frmFinansoviSankciiEdit.qVidomostiProFinansovu.Next;
        end;
        frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
        frmFinansoviSankciiEdit.qLaboratory.First;
        while not frmFinansoviSankciiEdit.qLaboratory.Eof do
        begin
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').IsNull then Vstanoviv:=Vstanoviv+' результати лабораторного контролю '+frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').Value;
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').IsNull then Vstanoviv:=Vstanoviv+' від '+DateToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').Value);
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').IsNull then Vstanoviv:=Vstanoviv+' № '+frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').Value;
          frmFinansoviSankciiEdit.qLaboratory.Next;
        end;
        Vstanoviv:=Vstanoviv+' без наявності гігієнічного висновку МОЗ України щодо безпечності для життя та здоров''я населення. Продукція є небезпечною для здоров''я та життя населення.';
        frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
        frmFinansoviSankciiEdit.memVstanoviv.Text:=Vstanoviv;
      end;
    1:  //прострочений термін реалізації
      begin
        Vstanoviv:='';
        frmFinansoviSankciiEdit.memVstanoviv.Clear;
        frmFinansoviSankciiEdit.memVstanoviv.Enabled:=true;
        frmFinansoviSankciiEdit.btnVstanoviv.Enabled:=true;
        Vstanoviv:=Vstanoviv+DateToStr(frmFinansoviSankciiEdit.dtpData.Date)+' в '+frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text+' '+frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text+' за адресою '+frmFinansoviSankciiEdit.edtAdresa.Text+' реалізовано ';
        frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
        frmFinansoviSankciiEdit.qVidomostiProFinansovu.First;
        while not frmFinansoviSankciiEdit.qVidomostiProFinansovu.Eof do
        begin
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').IsNull then Vstanoviv:=Vstanoviv+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').IsNull then Vstanoviv:=Vstanoviv+' виробництва '+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').IsNull then Vstanoviv:=Vstanoviv+' в кількості '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').IsNull then Vstanoviv:=Vstanoviv+' '+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').IsNull then Vstanoviv:=Vstanoviv+' ціною за одиницю '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').IsNull then Vstanoviv:=Vstanoviv+' ('+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').IsNull then Vstanoviv:=Vstanoviv+') загальною ціною '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').IsNull then Vstanoviv:=Vstanoviv+' ('+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').Value+')';
          frmFinansoviSankciiEdit.qVidomostiProFinansovu.Next;
        end;
        frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
        frmFinansoviSankciiEdit.qLaboratory.First;
        while not frmFinansoviSankciiEdit.qLaboratory.Eof do
        begin
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').IsNull then Vstanoviv:=Vstanoviv+' результати лабораторного контролю '+frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').Value;
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').IsNull then Vstanoviv:=Vstanoviv+' від '+DateToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').Value);
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').IsNull then Vstanoviv:=Vstanoviv+' № '+frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').Value;
          frmFinansoviSankciiEdit.qLaboratory.Next;
        end;
        Vstanoviv:=Vstanoviv+' з терміном реалізації до '+DateToStr(frmFinansoviSankciiEdit.dtpTerminTealizacii.Date)+', термін реалізації вичерпано, продукція є небезпечною для здоров''я та життя населення.';
        frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
        frmFinansoviSankciiEdit.memVstanoviv.Text:=Vstanoviv;
      end;
    2:  // бак. забруднення
      begin
        Vstanoviv:='';
        frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
        Vstanoviv:=Vstanoviv+DateToStr(frmFinansoviSankciiEdit.dtpData.Date)+' в '+frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text+' '+frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text+' за адресою '+frmFinansoviSankciiEdit.edtAdresa.Text+' реалізовано ';
        frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
        frmFinansoviSankciiEdit.qVidomostiProFinansovu.First;
        while not frmFinansoviSankciiEdit.qVidomostiProFinansovu.Eof do
        begin
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').IsNull then Vstanoviv:=Vstanoviv+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('NAJMENUVANNY_TOVARU').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').IsNull then Vstanoviv:=Vstanoviv+' виробництва '+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('VIROBNIK').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').IsNull then Vstanoviv:=Vstanoviv+' в кількості '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('KILKIST_TOVARU').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').IsNull then Vstanoviv:=Vstanoviv+' '+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ODINICI_VIMIRU').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').IsNull then Vstanoviv:=Vstanoviv+' ціною за одиницю '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').IsNull then Vstanoviv:=Vstanoviv+' ('+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('CINA_ODINICI_PROPISOM').Value;
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').IsNull then Vstanoviv:=Vstanoviv+') загальною ціною '+FloatToStr(frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA').Value);
          if not frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').IsNull then Vstanoviv:=Vstanoviv+' ('+frmFinansoviSankciiEdit.qVidomostiProFinansovu.FieldByName('ZAGALNA_CINA_PROPISOM').Value+')';
          frmFinansoviSankciiEdit.qVidomostiProFinansovu.Next;
        end;
        Vstanoviv:=Vstanoviv+' продукція по бактеріологічним показникам не відповідала санітарно-гігієнічним вимогам. ';
        laboratory:='';
        INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
        laboratory:=INIAZZ.ReadString('Firm','Organizaciy',laboratory);
        INIAZZ.Free;
        Vstanoviv:=Vstanoviv+' Протокол лабораторних досліджень виконаних бактеріологічною лабораторією '+laboratory;
        frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
        frmFinansoviSankciiEdit.qLaboratory.First;
        while not frmFinansoviSankciiEdit.qLaboratory.Eof do
        begin
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').IsNull then Vstanoviv:=Vstanoviv+' результати лабораторного контролю '+frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').Value;
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').IsNull then Vstanoviv:=Vstanoviv+' від '+DateToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').Value);
          if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').IsNull then Vstanoviv:=Vstanoviv+' № '+frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').Value;
          frmFinansoviSankciiEdit.qLaboratory.Next;
        end;
        Vstanoviv:=Vstanoviv+'продукція є небезпечною для здоров''я та життя населення.';
        frmFinansoviSankciiEdit.memVstanoviv.Lines.Clear;
        frmFinansoviSankciiEdit.memVstanoviv.Text:=Vstanoviv;
      end;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aSchoEPorushennymUpdateExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.Enabled:=false;
  frmMain.aNormativniAktiExecute(sender);
  frmStatti.aChoice.Enabled:=true;
  frmStatti.Left:=frmMain.Left+70;
  frmStatti.Top:=frmMain.Top+70;
  frmStatti.Width:=frmMain.Width-70;
  frmStatti.Height:=frmMain.Height-70;
  frmStatti.Position:=poMainFormCenter;
  frmStatti.FormStyle:=fsNormal;
  frmStatti.BorderStyle:=bsDialog;
end;

procedure TfrmFinansoviSankciiEdit.aTaZasluhavshiOsibUpdateExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text:=frmFinansoviSankciiEdit.edtPIBKerivnika.Text+' - '+frmFinansoviSankciiEdit.edtPosadaKerivnika.Text+', '+frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text;
  frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text:=frmFinansoviSankciiEdit.cbPIB_SES.Text+' - '+frmFinansoviSankciiEdit.cbPosadaSES.Text;
end;

procedure TfrmFinansoviSankciiEdit.aSchodoPorushennyUpdateExecute(
  Sender: TObject);
begin
  frmFinansoviSankciiEdit.edtSchodoPorushenny.Text:=frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text+' '+frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text+' '+frmFinansoviSankciiEdit.edtAdresa.Text;
end;

procedure TfrmFinansoviSankciiEdit.aAddLaboratoryExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmFinansoviSankciiEdit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.Caption:='Додати відомості про лабораторний контроль';

  frmLaboratornijKontrol.cbMinistry.Text:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmFinansoviSankciiEdit.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;
  frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date);
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=true;
  frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=true;
  frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=true;
  frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
end;

procedure TfrmFinansoviSankciiEdit.aEditLaboratoryExecute(Sender: TObject);
begin
  if frmFinansoviSankciiEdit.qLaboratory.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmFinansoviSankciiEdit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.Caption:='Редагувати відомості про лабораторний контроль';

  frmLaboratornijKontrol.cbMinistry.Text:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmFinansoviSankciiEdit.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('KOD').IsNull then frmLaboratornijKontrol.edtKod.Text:=IntToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('KOD').Value) else frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERPOSTANOVI').IsNull then frmLaboratornijKontrol.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERPOSTANOVI').Value) else frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAPOSTANOVI').IsNull then frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAPOSTANOVI').Value) else frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date);
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').IsNull then frmLaboratornijKontrol.cbVidKontrolu.Text:=frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').Value else frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=true;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').IsNull then frmLaboratornijKontrol.edtNomeriProb.Text:=frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').Value else frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=true;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').IsNull then frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').Value) else frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=true;
  frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
end;

procedure TfrmFinansoviSankciiEdit.aDeleteLaboratoryExecute(
  Sender: TObject);
begin
  if frmFinansoviSankciiEdit.qLaboratory.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmFinansoviSankciiEdit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.Caption:='Видалити відомості про лабораторний контроль';

  frmLaboratornijKontrol.cbMinistry.Text:=frmFinansoviSankciiEdit.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmFinansoviSankciiEdit.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmFinansoviSankciiEdit.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('KOD').IsNull then frmLaboratornijKontrol.edtKod.Text:=IntToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('KOD').Value) else frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERPOSTANOVI').IsNull then frmLaboratornijKontrol.edtNomerPostanovi.Text:=IntToStr(frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERPOSTANOVI').Value) else frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAPOSTANOVI').IsNull then frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAPOSTANOVI').Value) else frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date);
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').IsNull then frmLaboratornijKontrol.cbVidKontrolu.Text:=frmFinansoviSankciiEdit.qLaboratory.FieldByName('VIDKONTROLU').Value else frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=false;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=false;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').IsNull then frmLaboratornijKontrol.edtNomeriProb.Text:=frmFinansoviSankciiEdit.qLaboratory.FieldByName('NOMERIPROB').Value else frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=false;
  if not frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').IsNull then frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(frmFinansoviSankciiEdit.qLaboratory.FieldByName('DATAKONTROLU').Value) else frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=false;
  frmLaboratornijKontrol.btnVidminiti.SetFocus;
end;

procedure TfrmFinansoviSankciiEdit.aUpdateLaboratoryExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmFinansoviSankciiEdit do
  begin
    qLaboratory.SQL.Clear;
    qLaboratory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qLaboratory.Params.Clear;
    qLaboratory.Params.Add;
    qLaboratory.Params[0].Name:='Ministry';
    qLaboratory.Params[0].Value:=cbMinistry.Text;
    qLaboratory.Open;
    if qLaboratory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qLaboratory.FieldByName('KOD').Value else Ministry:=0;

    qLaboratory.SQL.Clear;
    qLaboratory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qLaboratory.Params.Clear;
    qLaboratory.Params.Add;
    qLaboratory.Params[0].Name:='Ministry';
    qLaboratory.Params[0].Value:=Ministry;
    qLaboratory.Params.Add;
    qLaboratory.Params[1].Name:='Teritory';
    qLaboratory.Params[1].Value:=cbTeritory.Text;
    qLaboratory.Open;
    if qLaboratory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qLaboratory.FieldByName('KOD').Value else Teritory:=0;

    qLaboratory.SQL.Clear;
    qLaboratory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qLaboratory.Params.Clear;
    qLaboratory.Params.Add;
    qLaboratory.Params[0].Name:='Ministry';
    qLaboratory.Params[0].Value:=Ministry;
    qLaboratory.Params.Add;
    qLaboratory.Params[1].Name:='Teritory';
    qLaboratory.Params[1].Value:=Teritory;
    qLaboratory.Params.Add;
    qLaboratory.Params[2].Name:='Rajon';
    qLaboratory.Params[2].Value:=cbDistrict.Text;
    qLaboratory.Open;
    if qLaboratory.Locate('RAJON',cbDistrict.Text,[]) then District:=qLaboratory.FieldByName('KOD').Value else District:=0;

    qLaboratory.SQL.Clear;
    qLaboratory.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and SHTRAFI_ADMIN=:Shtraf and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi order by VIDKONTROLU';
    qLaboratory.Params.Clear;
    qLaboratory.Params.Add;
    qLaboratory.Params[0].Name:='Ministry';
    qLaboratory.Params[0].Value:=Ministry;
    qLaboratory.Params.Add;
    qLaboratory.Params[1].Name:='Teritory';
    qLaboratory.Params[1].Value:=Teritory;
    qLaboratory.Params.Add;
    qLaboratory.Params[2].Name:='Rajon';
    qLaboratory.Params[2].Value:=District;
    qLaboratory.Params.Add;
    qLaboratory.Params[3].Name:='Shtraf';
    qLaboratory.Params[3].Value:='finansovi';
    qLaboratory.Params.Add;
    qLaboratory.Params[4].Name:='NomerPostanovi';
    qLaboratory.Params[4].Value:=StrToInt(frmFinansoviSankciiEdit.edtNomerPostanovi.Text);
    qLaboratory.Params.Add;
    qLaboratory.Params[5].Name:='DataPostanovi';
    qLaboratory.Params[5].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date));
    qLaboratory.Open;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aVisnovkiChoiceExecute(Sender: TObject);
begin
  case frmFinansoviSankciiEdit.rgVisnovki.ItemIndex of
    -1: frmFinansoviSankciiEdit.dtpTerminTealizacii.Visible:=false;
    0: frmFinansoviSankciiEdit.dtpTerminTealizacii.Visible:=false;
    1:
      begin
        frmFinansoviSankciiEdit.dtpTerminTealizacii.Visible:=true;
        if frmFinansoviSankciiEdit.Caption<>'Додавання запису' then
        begin
          if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TERMIN_REALIZACII').IsNull then frmFinansoviSankciiEdit.dtpTerminTealizacii.Date:=int(frmFinansoviSankcii.qFinansoviSankcii.FieldByName('TERMIN_REALIZACII').Value) else frmFinansoviSankciiEdit.dtpTerminTealizacii.Date:=int(date);
        end
        else
          frmFinansoviSankciiEdit.dtpTerminTealizacii.Date:=int(date);
      end;
    2: frmFinansoviSankciiEdit.dtpTerminTealizacii.Visible:=false;
  end;
end;

procedure TfrmFinansoviSankciiEdit.aGDSL_UpdateExecute(Sender: TObject);
var
  position_gdsl: integer;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  position_gdsl:=INIAZZ.ReadInteger('System','Position',position_gdsl);
  if frmFinansoviSankciiEdit.Caption='Додавання запису' then
  begin
    case position_gdsl of
      0:
        begin
          frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director','Position_NV',frmFinansoviSankciiEdit.edtPosada_GDSL.Text);
          frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director','LNP_NV',frmFinansoviSankciiEdit.edtPIB_GDSL.Text);
        end;
      1:
        begin
          frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director1','Position_NV',frmFinansoviSankciiEdit.edtPosada_GDSL.Text);
          frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director1','LNP_NV',frmFinansoviSankciiEdit.edtPIB_GDSL.Text);
        end;
      2:
        begin
          frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director2','Position_NV',frmFinansoviSankciiEdit.edtPosada_GDSL.Text);
          frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director2','LNP_NV',frmFinansoviSankciiEdit.edtPIB_GDSL.Text);
        end;
    end;
  end
  else
  begin
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_GDSL').IsNull then frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('PIB_GDSL').Value else
      case position_gdsl of
        0: frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director','LNP_NV',frmFinansoviSankciiEdit.edtPIB_GDSL.Text);
        1: frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director1','LNP_NV',frmFinansoviSankciiEdit.edtPIB_GDSL.Text);
        2: frmFinansoviSankciiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director2','LNP_NV',frmFinansoviSankciiEdit.edtPIB_GDSL.Text);
      end;
    if not frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_GDSL').IsNull then frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=frmFinansoviSankcii.qFinansoviSankcii.FieldByName('POSADA_GDSL').Value else
      case position_gdsl of
        0: frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director','Position_NV',frmFinansoviSankciiEdit.edtPosada_GDSL.Text);
        1: frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director1','Position_NV',frmFinansoviSankciiEdit.edtPosada_GDSL.Text);
        2: frmFinansoviSankciiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director2','Position_NV',frmFinansoviSankciiEdit.edtPosada_GDSL.Text);
      end;
  end;
  INIAZZ.Free;
end;

procedure TfrmFinansoviSankciiEdit.aOKExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
  R_T23_F18: integer;
begin
  if frmFinansoviSankciiEdit.Caption='Видалення запису' then
  begin
    if MessageDlg('Увага!!!'+#13+'Видалення цього запису може відобразитись'+#13+'на інших відомостях та звітах!'+#13+'Відновлення цього запису після видалення буде неможливе!!!'+#13+'Ви дійсно хочете видилити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmFinansoviSankcii do
      begin
        qFinansoviSankcii.SQL.Clear;
        qFinansoviSankcii.SQL.Text:='delete from FINANSOVI_SANKCII where RECORD_ID=:Kod';
        qFinansoviSankcii.Params.Clear;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[0].Name:='Kod';
        qFinansoviSankcii.Params[0].Value:=frmFinansoviSankciiEdit.edtRecord_ID.Text;
        qFinansoviSankcii.Open;
      end;
    end;
    frmMain.trAzz.CommitRetaining;
    frmFinansoviSankcii.aUpdateExecute(sender);
    frmFinansoviSankciiEdit.Close;
    exit;
  end;

  if frmFinansoviSankciiEdit.Caption='Редагування запису' then
  begin
    if frmFinansoviSankciiEdit.cbMinistry.Text='' then
    begin
      frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmFinansoviSankciiEdit.qTeritory.Params.Clear;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbMinistry.Text;
    frmFinansoviSankciiEdit.qTeritory.Open;
    if frmFinansoviSankciiEdit.qTeritory.Locate('MINISTRY',frmFinansoviSankciiEdit.cbMinistry.Text,[]) then Ministry:=frmFinansoviSankciiEdit.qTeritory.FieldByName('Kod').Value else Ministry:=0;

    if frmFinansoviSankciiEdit.cbTeritory.Text='' then
    begin
      frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    frmFinansoviSankciiEdit.qTeritory.Params.Clear;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=Ministry;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[1].Name:='Teritory';
    frmFinansoviSankciiEdit.qTeritory.Params[1].Value:=frmFinansoviSankciiEdit.cbTeritory.Text;
    frmFinansoviSankciiEdit.qTeritory.Open;
    if frmFinansoviSankciiEdit.qTeritory.Locate('TERITORY',frmFinansoviSankciiEdit.cbTeritory.Text,[]) then Teritory:=frmFinansoviSankciiEdit.qTeritory.FieldByName('Kod').Value else Teritory:=0;

    if frmFinansoviSankciiEdit.cbDistrict.Text='' then
    begin
      frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    frmFinansoviSankciiEdit.qTeritory.Params.Clear;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=Ministry;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[1].Name:='Teritory';
    frmFinansoviSankciiEdit.qTeritory.Params[1].Value:=Teritory;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[2].Name:='Rajon';
    frmFinansoviSankciiEdit.qTeritory.Params[2].Value:=frmFinansoviSankciiEdit.cbDistrict.Text;
    frmFinansoviSankciiEdit.qTeritory.Open;
    if frmFinansoviSankciiEdit.qTeritory.Locate('RAJON',frmFinansoviSankciiEdit.cbDistrict.Text,[]) then District:=frmFinansoviSankciiEdit.qTeritory.FieldByName('Kod').Value else District:=0;

    if frmFinansoviSankciiEdit.edtRecord_ID.Text='' then
    begin
      frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFinansoviSankciiEdit.edtRecord_ID.Text);
    except
      frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;

    if frmFinansoviSankciiEdit.edtNomerPostanovi.Text='' then
    begin
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFinansoviSankciiEdit.edtNomerPostanovi.Text);
    except;
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex=-1 then
    begin
      frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=0;
      frmFinansoviSankciiEdit.aAktDovidkaUpdateExecute(sender);
      frmFinansoviSankciiEdit.rgAkt_Dovidka.SetFocus;
      exit;
    end;
    case frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex of
      0:
        begin
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
        end;
      1:
        begin
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmFinansoviSankciiEdit.edtNomer.Text='' then
          begin
            frmFinansoviSankciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
      2:
        begin
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataDo.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpDataDo.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmFinansoviSankciiEdit.edtNomer.Text='' then
          begin
            frmFinansoviSankciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
    if frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text='' then
    begin
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtAdresa.Text='' then
    begin
      frmFinansoviSankciiEdit.edtAdresa.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIBKerivnika.Text='' then
    begin
      frmFinansoviSankciiEdit.edtPIBKerivnika.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPosadaKerivnika.Text='' then
    begin
      frmFinansoviSankciiEdit.edtPosadaKerivnika.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text='' then
    begin
      frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtKodDKPP.Text='' then
    begin
      frmFinansoviSankciiEdit.edtKodDKPP.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtViddilennyBanku.Text='' then
    begin
      frmFinansoviSankciiEdit.edtViddilennyBanku.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtMFO.Text='' then
    begin
      frmFinansoviSankciiEdit.edtMFO.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbRozdil_F18.Text='' then
    begin
      frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbRozdil_F18.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    frmFinansoviSankciiEdit.qTeritory.Open;
    if not frmFinansoviSankciiEdit.qTeritory.Locate('OBJEKTNAGLYDU',frmFinansoviSankciiEdit.cbRozdil_F18.Text,[]) then
    begin
      frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbRozdil_F18.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbTipShtrafiv.Text='' then
    begin
      frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipShtrafiv.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    frmFinansoviSankciiEdit.qTeritory.Open;
    if not frmFinansoviSankciiEdit.qTeritory.Locate('TIPSHTRAFU',frmFinansoviSankciiEdit.cbTipShtrafiv.Text,[]) then
    begin
      frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipShtrafiv.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbTipProdukcii.Text='' then
    begin
      frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipProdukcii.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
    frmFinansoviSankciiEdit.qTeritory.Open;
    if not frmFinansoviSankciiEdit.qTeritory.Locate('TIPPRODUKCII',frmFinansoviSankciiEdit.cbTipProdukcii.Text,[]) then
    begin
      frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipProdukcii.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtYear.Text='' then
    begin
      frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtYear.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFinansoviSankciiEdit.edtYear.Text);
    except
      frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtYear.SetFocus;
      exit;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProPereviryjuchogo;
    if frmFinansoviSankciiEdit.cbPIB_SES.Text='' then
    begin
      frmFinansoviSankciiEdit.aPIB_SES_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbPIB_SES.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbViddilSES.Text='' then
    begin
      frmFinansoviSankciiEdit.aViddil_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbViddilSES.SetFocus;
     exit;
    end;
    if frmFinansoviSankciiEdit.cbPosadaSES.Text='' then
    begin
      frmFinansoviSankciiEdit.aPosadaSES_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbPosadaSES.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
    if frmFinansoviSankciiEdit.qVidomostiProFinansovu.RecordCount<=0 then
    begin
      frmFinansoviSankciiEdit.btnAddVidomosti.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtSumaSankcii.Text='' then
    begin
      frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
      frmFinansoviSankciiEdit.edtSumaSankcii.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmFinansoviSankciiEdit.edtSumaSankcii.Text);
    except
      frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
      frmFinansoviSankciiEdit.edtSumaSankcii.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text='' then
    begin
      frmFinansoviSankciiEdit.aSumaSankciiExecute(sender);
      frmFinansoviSankciiEdit.edtSumaSankciiPropisom.SetFocus;
      exit;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsDodatkovo;
    if frmFinansoviSankciiEdit.edtSchodoPorushenny.Text='' then
    begin
      frmFinansoviSankciiEdit.aSchodoPorushennyUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtSchodoPorushenny.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.rgVisnovki.ItemIndex=-1 then
    begin
      frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=0;
      frmFinansoviSankciiEdit.aVisnovkiChoiceExecute(sender);
      frmFinansoviSankciiEdit.rgVisnovki.SetFocus;
      exit;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsZmistPostanovi;
    if frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text='' then
    begin
      frmFinansoviSankciiEdit.aVidomchaPidporydkovanist_AdresaUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.memVstanoviv.Text='' then
    begin
      frmFinansoviSankciiEdit.aVstanovivExecute(sender);
      frmFinansoviSankciiEdit.memVstanoviv.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.memSchoEPorushennym.Text='' then
    begin
      frmFinansoviSankciiEdit.aSchoEPorushennymUpdateExecute(sender);
      frmFinansoviSankciiEdit.memSchoEPorushennym.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text='' then
    begin
      frmFinansoviSankciiEdit.aTaZasluhavshiOsibUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text='' then
    begin
      frmFinansoviSankciiEdit.aTaZasluhavshiOsibUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_GDSL.Text='' then
    begin
      frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPosada_GDSL.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_GDSL.Text='' then
    begin
      frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPosada_GDSL.SetFocus;
      exit;
    end;
    //запис до БД
    with frmFinansoviSankcii do
    begin
      qFinansoviSankcii.SQL.Clear;
      qFinansoviSankcii.SQL.Text:='update FINANSOVI_SANKCII set';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'DATAPROTOKOLU=:DataProtokolu,AKT_DOVIDKA=:Akt,DATA=:DataAktu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'NOMER=:NomerAktu,DATADO=:DataAktuDo,NAZVA_OBJEKTU=:NazvaObjektu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VIDOMCHA_PIDPORYDKOVANIST=:Pidporydkovanist,ADRESA_OBJEKTU=:AdresaObjektu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_KERIVNIKA=:PIBKerivnika,POSADA_KERIVNIKA=:PosadaKerivnika,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'ROZRAKUNKOVIJ_RAHUNOK=:Rahunok,KOD_DKPP=:DKPP,VIDDILENNY_BANKU=:Bank,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'KOD_MFO=:MFO,ROZDIL_T23_F18=:R_T23_F18,TIP_SHTRAFU=:TipShtrafu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'TIP_PRODUKCII=:TipProdukcii,YEAR_=:Rik,PIB_OSOBI_SES=:PIBSES,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VIDDIL_OSOBI_SES=:ViddilSES,POSADA_OSOBI_SES=:PosadaSES,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'SUMA_SANKCII=:SumaSankcii,SUMA_SANKCII_PROPISOM=:SumaPropisom,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_KERIVNIKA_PORUSHNIKA=:SchodoPorushenny,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VISNOVKI=:Visnovki,TERMIN_REALIZACII=:TeriminRealizacii,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VIDOM_PIDPOR_ADRESA=:Pidporydkovanist_Adresa,VSTANOVIV=:Vstanoviv,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'SCHO_E_PORUSHENNYM=:SchoEPorushennym,PIB_POSADA_NAZVAOBJECTU=:PIBNazvaObjektu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_POSADA_OSOBISES=:PIBPosadaOsobiSES,POSADA_GDSL=:PosadaGDSL,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_GDSL=:PIBGDSL';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'where RECORD_ID=:Kod';
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
      qFinansoviSankcii.Params[3].Name:='NomerPostanovi';
      qFinansoviSankcii.Params[3].Value:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='DataPostanovi';
      qFinansoviSankcii.Params[4].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date));
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[5].Name:='DataProtokolu';
      qFinansoviSankcii.Params[5].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataProtokolu.Date));
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[6].Name:='Akt';
      qFinansoviSankcii.Params[6].Value:=frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex;
      case frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex of
        0:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[7].Name:='DataAktu';
            qFinansoviSankcii.Params[7].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpData.Date));
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[8].Name:='NomerAktu';
            qFinansoviSankcii.Params[8].Value:='';
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[9].Name:='DataAktuDo';
            qFinansoviSankcii.Params[9].Value:='';
          end;
        1:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[7].Name:='DataAktu';
            qFinansoviSankcii.Params[7].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpData.Date));
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[8].Name:='NomerAktu';
            qFinansoviSankcii.Params[8].Value:=frmFinansoviSankciiEdit.edtNomer.Text;
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[9].Name:='DataAktuDo';
            qFinansoviSankcii.Params[9].Value:='';
          end;
        2:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[7].Name:='DataAktu';
            qFinansoviSankcii.Params[7].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpData.Date));
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[8].Name:='NomerAktu';
            qFinansoviSankcii.Params[8].Value:=frmFinansoviSankciiEdit.edtNomer.Text;
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[9].Name:='DataAktuDo';
            qFinansoviSankcii.Params[9].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataDo.Date));
          end;
      end;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[10].Name:='NazvaObjektu';
      qFinansoviSankcii.Params[10].Value:=frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[11].Name:='Pidporydkovanist';
      qFinansoviSankcii.Params[11].Value:=frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[12].Name:='AdresaObjektu';
      qFinansoviSankcii.Params[12].Value:=frmFinansoviSankciiEdit.edtAdresa.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[13].Name:='PIBKerivnika';
      qFinansoviSankcii.Params[13].Value:=frmFinansoviSankciiEdit.edtPIBKerivnika.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[14].Name:='PosadaKerivnika';
      qFinansoviSankcii.Params[14].Value:=frmFinansoviSankciiEdit.edtPosadaKerivnika.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[15].Name:='Rahunok';
      qFinansoviSankcii.Params[15].Value:=frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[16].Name:='DKPP';
      qFinansoviSankcii.Params[16].Value:=frmFinansoviSankciiEdit.edtKodDKPP.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[17].Name:='Bank';
      qFinansoviSankcii.Params[17].Value:=frmFinansoviSankciiEdit.edtViddilennyBanku.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[18].Name:='MFO';
      qFinansoviSankcii.Params[18].Value:=frmFinansoviSankciiEdit.edtMFO.Text;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[19].Name:='R_T23_F18';
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from ROZDILT23F18 where OBJEKTNAGLYDU=:ObjektNaglydu order by OBJEKTNAGLYDU';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='ObjektNaglydu';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbRozdil_F18.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('OBJEKTNAGLYDU',frmFinansoviSankciiEdit.cbRozdil_F18.Text,[]) then qFinansoviSankcii.Params[19].Value:=frmFinansoviSankcii.qTeritory.FieldByName('KODSTROKI').Value else qFinansoviSankcii.Params[19].Value:=0;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[20].Name:='TipShtrafu';
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPISHTRAFIV where TIPSHTRAFU=:Tip order by TIPSHTRAFU';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Tip';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipShtrafiv.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('TIPSHTRAFU',frmFinansoviSankciiEdit.cbTipShtrafiv.Text,[]) then qFinansoviSankcii.Params[20].Value:=frmFinansoviSankcii.qTeritory.FieldByName('KODTIPUSHTRAFIV').Value else qFinansoviSankcii.Params[20].Value:=0;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[21].Name:='TipProdukcii';
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPIPRODUKCII where TIPPRODUKCII=:Tip order by TIPPRODUKCII';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Tip';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipProdukcii.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('TIPPRODUKCII',frmFinansoviSankciiEdit.cbTipProdukcii.Text,[]) then qFinansoviSankcii.Params[21].Value:=frmFinansoviSankcii.qTeritory.FieldByName('KOD').Value else qFinansoviSankcii.Params[21].Value:=0;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[22].Name:='Rik';
      qFinansoviSankcii.Params[22].Value:=frmFinansoviSankciiEdit.edtYear.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[23].Name:='PIBSES';
      qFinansoviSankcii.Params[23].Value:=frmFinansoviSankciiEdit.cbPIB_SES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[24].Name:='ViddilSES';
      qFinansoviSankcii.Params[24].Value:=frmFinansoviSankciiEdit.cbViddilSES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[25].Name:='PosadaSES';
      qFinansoviSankcii.Params[25].Value:=frmFinansoviSankciiEdit.cbPosadaSES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[26].Name:='SumaSankcii';
      qFinansoviSankcii.Params[26].Value:=StrToFloat(frmFinansoviSankciiEdit.edtSumaSankcii.Text);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[27].Name:='SumaPropisom';
      qFinansoviSankcii.Params[27].Value:=frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[28].Name:='SchodoPorushenny';
      qFinansoviSankcii.Params[28].Value:=frmFinansoviSankciiEdit.edtSchodoPorushenny.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[29].Name:='Visnovki';
      qFinansoviSankcii.Params[29].Value:=frmFinansoviSankciiEdit.rgVisnovki.ItemIndex;
      case frmFinansoviSankciiEdit.rgVisnovki.ItemIndex of
        0:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[30].Name:='TeriminRealizacii';
            qFinansoviSankcii.Params[30].Value:='';
          end;
        1:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[30].Name:='TeriminRealizacii';
            qFinansoviSankcii.Params[30].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpTerminTealizacii.Date));
          end;
        2:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[30].Name:='TeriminRealizacii';
            qFinansoviSankcii.Params[30].Value:='';
          end;
      end;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[31].Name:='Pidporydkovanist_Adresa';
      qFinansoviSankcii.Params[31].Value:=frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[32].Name:='Vstanoviv';
      qFinansoviSankcii.Params[32].Value:=frmFinansoviSankciiEdit.memVstanoviv.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[33].Name:='SchoEPorushennym';
      qFinansoviSankcii.Params[33].Value:=frmFinansoviSankciiEdit.memSchoEPorushennym.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[34].Name:='PIBNazvaObjektu';
      qFinansoviSankcii.Params[34].Value:=frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[35].Name:='PIBPosadaOsobiSES';
      qFinansoviSankcii.Params[35].Value:=frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[36].Name:='PosadaGDSL';
      qFinansoviSankcii.Params[36].Value:=frmFinansoviSankciiEdit.edtPosada_GDSL.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[37].Name:='PIBGDSL';
      qFinansoviSankcii.Params[37].Value:=frmFinansoviSankciiEdit.edtPIB_GDSL.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[38].Name:='Kod';
      qFinansoviSankcii.Params[38].Value:=frmFinansoviSankciiEdit.edtRecord_ID.Text;
      qFinansoviSankcii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmFinansoviSankcii.aUpdateExecute(sender);
    frmFinansoviSankciiEdit.Close;
    exit;
  end;

  if frmFinansoviSankciiEdit.Caption='Додавання запису' then
  begin
    if frmFinansoviSankciiEdit.cbMinistry.Text='' then
    begin
      frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmFinansoviSankciiEdit.qTeritory.Params.Clear;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbMinistry.Text;
    frmFinansoviSankciiEdit.qTeritory.Open;
    if frmFinansoviSankciiEdit.qTeritory.Locate('MINISTRY',frmFinansoviSankciiEdit.cbMinistry.Text,[]) then Ministry:=frmFinansoviSankciiEdit.qTeritory.FieldByName('Kod').Value else Ministry:=0;

    if frmFinansoviSankciiEdit.cbTeritory.Text='' then
    begin
      frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    frmFinansoviSankciiEdit.qTeritory.Params.Clear;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=Ministry;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[1].Name:='Teritory';
    frmFinansoviSankciiEdit.qTeritory.Params[1].Value:=frmFinansoviSankciiEdit.cbTeritory.Text;
    frmFinansoviSankciiEdit.qTeritory.Open;
    if frmFinansoviSankciiEdit.qTeritory.Locate('TERITORY',frmFinansoviSankciiEdit.cbTeritory.Text,[]) then Teritory:=frmFinansoviSankciiEdit.qTeritory.FieldByName('Kod').Value else Teritory:=0;

    if frmFinansoviSankciiEdit.cbDistrict.Text='' then
    begin
      frmFinansoviSankciiEdit.aTeritoryUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    frmFinansoviSankciiEdit.qTeritory.Params.Clear;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[0].Name:='Ministry';
    frmFinansoviSankciiEdit.qTeritory.Params[0].Value:=Ministry;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[1].Name:='Teritory';
    frmFinansoviSankciiEdit.qTeritory.Params[1].Value:=Teritory;
    frmFinansoviSankciiEdit.qTeritory.Params.Add;
    frmFinansoviSankciiEdit.qTeritory.Params[2].Name:='Rajon';
    frmFinansoviSankciiEdit.qTeritory.Params[2].Value:=frmFinansoviSankciiEdit.cbDistrict.Text;
    frmFinansoviSankciiEdit.qTeritory.Open;
    if frmFinansoviSankciiEdit.qTeritory.Locate('RAJON',frmFinansoviSankciiEdit.cbDistrict.Text,[]) then District:=frmFinansoviSankciiEdit.qTeritory.FieldByName('Kod').Value else District:=0;

    if frmFinansoviSankciiEdit.edtRecord_ID.Text='' then
    begin
      frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFinansoviSankciiEdit.edtRecord_ID.Text);
    except
      frmFinansoviSankciiEdit.aRecord_ID_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;

    if frmFinansoviSankciiEdit.edtNomerPostanovi.Text='' then
    begin
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFinansoviSankciiEdit.edtNomerPostanovi.Text);
    except;
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex=-1 then
    begin
      frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex:=0;
      frmFinansoviSankciiEdit.aAktDovidkaUpdateExecute(sender);
      frmFinansoviSankciiEdit.rgAkt_Dovidka.SetFocus;
      exit;
    end;
    case frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex of
      0:
        begin
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
        end;
      1:
        begin
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmFinansoviSankciiEdit.edtNomer.Text='' then
          begin
            frmFinansoviSankciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
      2:
        begin
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
          if int(frmFinansoviSankciiEdit.dtpData.Date)>int(frmFinansoviSankciiEdit.dtpDataDo.Date) then
          begin
            frmFinansoviSankciiEdit.dtpData.Date:=int(date);
            frmFinansoviSankciiEdit.dtpDataDo.Date:=int(date);
            frmFinansoviSankciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmFinansoviSankciiEdit.edtNomer.Text='' then
          begin
            frmFinansoviSankciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProObjekt;
    if frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text='' then
    begin
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtAdresa.Text='' then
    begin
      frmFinansoviSankciiEdit.edtAdresa.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIBKerivnika.Text='' then
    begin
      frmFinansoviSankciiEdit.edtPIBKerivnika.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPosadaKerivnika.Text='' then
    begin
      frmFinansoviSankciiEdit.edtPosadaKerivnika.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text='' then
    begin
      frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtKodDKPP.Text='' then
    begin
      frmFinansoviSankciiEdit.edtKodDKPP.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtViddilennyBanku.Text='' then
    begin
      frmFinansoviSankciiEdit.edtViddilennyBanku.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtMFO.Text='' then
    begin
      frmFinansoviSankciiEdit.edtMFO.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbRozdil_F18.Text='' then
    begin
      frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbRozdil_F18.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    frmFinansoviSankciiEdit.qTeritory.Open;
    if not frmFinansoviSankciiEdit.qTeritory.Locate('OBJEKTNAGLYDU',frmFinansoviSankciiEdit.cbRozdil_F18.Text,[]) then
    begin
      frmFinansoviSankciiEdit.aRozdil_F18UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbRozdil_F18.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbTipShtrafiv.Text='' then
    begin
      frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipShtrafiv.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    frmFinansoviSankciiEdit.qTeritory.Open;
    if not frmFinansoviSankciiEdit.qTeritory.Locate('TIPSHTRAFU',frmFinansoviSankciiEdit.cbTipShtrafiv.Text,[]) then
    begin
      frmFinansoviSankciiEdit.aTipShtrafiv_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipShtrafiv.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbTipProdukcii.Text='' then
    begin
      frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipProdukcii.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.qTeritory.SQL.Clear;
    frmFinansoviSankciiEdit.qTeritory.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
    frmFinansoviSankciiEdit.qTeritory.Open;
    if not frmFinansoviSankciiEdit.qTeritory.Locate('TIPPRODUKCII',frmFinansoviSankciiEdit.cbTipProdukcii.Text,[]) then
    begin
      frmFinansoviSankciiEdit.aTipProdukcii_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbTipProdukcii.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtYear.Text='' then
    begin
      frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtYear.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFinansoviSankciiEdit.edtYear.Text);
    except
      frmFinansoviSankciiEdit.aYearUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtYear.SetFocus;
      exit;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsVidomostiProPereviryjuchogo;
    if frmFinansoviSankciiEdit.cbPIB_SES.Text='' then
    begin
      frmFinansoviSankciiEdit.aPIB_SES_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbPIB_SES.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.cbViddilSES.Text='' then
    begin
      frmFinansoviSankciiEdit.aViddil_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbViddilSES.SetFocus;
     exit;
    end;
    if frmFinansoviSankciiEdit.cbPosadaSES.Text='' then
    begin
      frmFinansoviSankciiEdit.aPosadaSES_UpdateExecute(sender);
      frmFinansoviSankciiEdit.cbPosadaSES.SetFocus;
      exit;
    end;
    frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
    if frmFinansoviSankciiEdit.qVidomostiProFinansovu.RecordCount<=0 then
    begin
      frmFinansoviSankciiEdit.btnAddVidomosti.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtSumaSankcii.Text='' then
    begin
      frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
      frmFinansoviSankciiEdit.edtSumaSankcii.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmFinansoviSankciiEdit.edtSumaSankcii.Text);
    except
      frmFinansoviSankciiEdit.aPererahuvatiVidomostiExecute(sender);
      frmFinansoviSankciiEdit.edtSumaSankcii.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text='' then
    begin
      frmFinansoviSankciiEdit.aSumaSankciiExecute(sender);
      frmFinansoviSankciiEdit.edtSumaSankciiPropisom.SetFocus;
      exit;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsDodatkovo;
    if frmFinansoviSankciiEdit.edtSchodoPorushenny.Text='' then
    begin
      frmFinansoviSankciiEdit.aSchodoPorushennyUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtSchodoPorushenny.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.rgVisnovki.ItemIndex=-1 then
    begin
      frmFinansoviSankciiEdit.rgVisnovki.ItemIndex:=0;
      frmFinansoviSankciiEdit.aVisnovkiChoiceExecute(sender);
      frmFinansoviSankciiEdit.rgVisnovki.SetFocus;
      exit;
    end;

    frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage:=frmFinansoviSankciiEdit.tsZmistPostanovi;
    if frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text='' then
    begin
      frmFinansoviSankciiEdit.aVidomchaPidporydkovanist_AdresaUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.memVstanoviv.Text='' then
    begin
      frmFinansoviSankciiEdit.aVstanovivExecute(sender);
      frmFinansoviSankciiEdit.memVstanoviv.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.memSchoEPorushennym.Text='' then
    begin
      frmFinansoviSankciiEdit.aSchoEPorushennymUpdateExecute(sender);
      frmFinansoviSankciiEdit.memSchoEPorushennym.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text='' then
    begin
      frmFinansoviSankciiEdit.aTaZasluhavshiOsibUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text='' then
    begin
      frmFinansoviSankciiEdit.aTaZasluhavshiOsibUpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_GDSL.Text='' then
    begin
      frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPosada_GDSL.SetFocus;
      exit;
    end;
    if frmFinansoviSankciiEdit.edtPIB_GDSL.Text='' then
    begin
      frmFinansoviSankciiEdit.aGDSL_UpdateExecute(sender);
      frmFinansoviSankciiEdit.edtPosada_GDSL.SetFocus;
      exit;
    end;
    //запис до БД
    with frmFinansoviSankcii do
    begin
      qFinansoviSankcii.SQL.Clear;
      qFinansoviSankcii.SQL.Text:='update FINANSOVI_SANKCII set';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'DATAPROTOKOLU=:DataProtokolu,AKT_DOVIDKA=:Akt,DATA=:DataAktu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'NOMER=:NomerAktu,DATADO=:DataAktuDo,NAZVA_OBJEKTU=:NazvaObjektu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VIDOMCHA_PIDPORYDKOVANIST=:Pidporydkovanist,ADRESA_OBJEKTU=:AdresaObjektu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_KERIVNIKA=:PIBKerivnika,POSADA_KERIVNIKA=:PosadaKerivnika,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'ROZRAKUNKOVIJ_RAHUNOK=:Rahunok,KOD_DKPP=:DKPP,VIDDILENNY_BANKU=:Bank,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'KOD_MFO=:MFO,ROZDIL_T23_F18=:R_T23_F18,TIP_SHTRAFU=:TipShtrafu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'TIP_PRODUKCII=:TipProdukcii,YEAR_=:Rik,PIB_OSOBI_SES=:PIBSES,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VIDDIL_OSOBI_SES=:ViddilSES,POSADA_OSOBI_SES=:PosadaSES,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'SUMA_SANKCII=:SumaSankcii,SUMA_SANKCII_PROPISOM=:SumaPropisom,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_KERIVNIKA_PORUSHNIKA=:SchodoPorushenny,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VISNOVKI=:Visnovki,TERMIN_REALIZACII=:TeriminRealizacii,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'VIDOM_PIDPOR_ADRESA=:Pidporydkovanist_Adresa,VSTANOVIV=:Vstanoviv,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'SCHO_E_PORUSHENNYM=:SchoEPorushennym,PIB_POSADA_NAZVAOBJECTU=:PIBNazvaObjektu,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_POSADA_OSOBISES=:PIBPosadaOsobiSES,POSADA_GDSL=:PosadaGDSL,';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'PIB_GDSL=:PIBGDSL';
      qFinansoviSankcii.SQL.Text:=qFinansoviSankcii.SQL.Text+'where RECORD_ID=:Kod';
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
      qFinansoviSankcii.Params[3].Name:='NomerPostanovi';
      qFinansoviSankcii.Params[3].Value:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='DataPostanovi';
      qFinansoviSankcii.Params[4].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date));
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[5].Name:='DataProtokolu';
      qFinansoviSankcii.Params[5].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataProtokolu.Date));
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[6].Name:='Akt';
      qFinansoviSankcii.Params[6].Value:=frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex;
      case frmFinansoviSankciiEdit.rgAkt_Dovidka.ItemIndex of
        0:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[7].Name:='DataAktu';
            qFinansoviSankcii.Params[7].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpData.Date));
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[8].Name:='NomerAktu';
            qFinansoviSankcii.Params[8].Value:='';
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[9].Name:='DataAktuDo';
            qFinansoviSankcii.Params[9].Value:='';
          end;
        1:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[7].Name:='DataAktu';
            qFinansoviSankcii.Params[7].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpData.Date));
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[8].Name:='NomerAktu';
            qFinansoviSankcii.Params[8].Value:=frmFinansoviSankciiEdit.edtNomer.Text;
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[9].Name:='DataAktuDo';
            qFinansoviSankcii.Params[9].Value:='';
          end;
        2:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[7].Name:='DataAktu';
            qFinansoviSankcii.Params[7].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpData.Date));
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[8].Name:='NomerAktu';
            qFinansoviSankcii.Params[8].Value:=frmFinansoviSankciiEdit.edtNomer.Text;
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[9].Name:='DataAktuDo';
            qFinansoviSankcii.Params[9].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpDataDo.Date));
          end;
      end;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[10].Name:='NazvaObjektu';
      qFinansoviSankcii.Params[10].Value:=frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[11].Name:='Pidporydkovanist';
      qFinansoviSankcii.Params[11].Value:=frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[12].Name:='AdresaObjektu';
      qFinansoviSankcii.Params[12].Value:=frmFinansoviSankciiEdit.edtAdresa.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[13].Name:='PIBKerivnika';
      qFinansoviSankcii.Params[13].Value:=frmFinansoviSankciiEdit.edtPIBKerivnika.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[14].Name:='PosadaKerivnika';
      qFinansoviSankcii.Params[14].Value:=frmFinansoviSankciiEdit.edtPosadaKerivnika.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[15].Name:='Rahunok';
      qFinansoviSankcii.Params[15].Value:=frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[16].Name:='DKPP';
      qFinansoviSankcii.Params[16].Value:=frmFinansoviSankciiEdit.edtKodDKPP.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[17].Name:='Bank';
      qFinansoviSankcii.Params[17].Value:=frmFinansoviSankciiEdit.edtViddilennyBanku.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[18].Name:='MFO';
      qFinansoviSankcii.Params[18].Value:=frmFinansoviSankciiEdit.edtMFO.Text;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[19].Name:='R_T23_F18';
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from ROZDILT23F18 where OBJEKTNAGLYDU=:ObjektNaglydu order by OBJEKTNAGLYDU';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='ObjektNaglydu';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbRozdil_F18.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('OBJEKTNAGLYDU',frmFinansoviSankciiEdit.cbRozdil_F18.Text,[]) then qFinansoviSankcii.Params[19].Value:=frmFinansoviSankcii.qTeritory.FieldByName('KODSTROKI').Value else qFinansoviSankcii.Params[19].Value:=0;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[20].Name:='TipShtrafu';
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPISHTRAFIV where TIPSHTRAFU=:Tip order by TIPSHTRAFU';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Tip';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipShtrafiv.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('TIPSHTRAFU',frmFinansoviSankciiEdit.cbTipShtrafiv.Text,[]) then qFinansoviSankcii.Params[20].Value:=frmFinansoviSankcii.qTeritory.FieldByName('KODTIPUSHTRAFIV').Value else qFinansoviSankcii.Params[20].Value:=0;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[21].Name:='TipProdukcii';
      frmFinansoviSankcii.qTeritory.SQL.Clear;
      frmFinansoviSankcii.qTeritory.SQL.Text:='select * from TIPIPRODUKCII where TIPPRODUKCII=:Tip order by TIPPRODUKCII';
      frmFinansoviSankcii.qTeritory.Params.Clear;
      frmFinansoviSankcii.qTeritory.Params.Add;
      frmFinansoviSankcii.qTeritory.Params[0].Name:='Tip';
      frmFinansoviSankcii.qTeritory.Params[0].Value:=frmFinansoviSankciiEdit.cbTipProdukcii.Text;
      frmFinansoviSankcii.qTeritory.Open;
      if frmFinansoviSankcii.qTeritory.Locate('TIPPRODUKCII',frmFinansoviSankciiEdit.cbTipProdukcii.Text,[]) then qFinansoviSankcii.Params[21].Value:=frmFinansoviSankcii.qTeritory.FieldByName('KOD').Value else qFinansoviSankcii.Params[21].Value:=0;

      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[22].Name:='Rik';
      qFinansoviSankcii.Params[22].Value:=frmFinansoviSankciiEdit.edtYear.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[23].Name:='PIBSES';
      qFinansoviSankcii.Params[23].Value:=frmFinansoviSankciiEdit.cbPIB_SES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[24].Name:='ViddilSES';
      qFinansoviSankcii.Params[24].Value:=frmFinansoviSankciiEdit.cbViddilSES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[25].Name:='PosadaSES';
      qFinansoviSankcii.Params[25].Value:=frmFinansoviSankciiEdit.cbPosadaSES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[26].Name:='SumaSankcii';
      qFinansoviSankcii.Params[26].Value:=StrToFloat(frmFinansoviSankciiEdit.edtSumaSankcii.Text);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[27].Name:='SumaPropisom';
      qFinansoviSankcii.Params[27].Value:=frmFinansoviSankciiEdit.edtSumaSankciiPropisom.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[28].Name:='SchodoPorushenny';
      qFinansoviSankcii.Params[28].Value:=frmFinansoviSankciiEdit.edtSchodoPorushenny.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[29].Name:='Visnovki';
      qFinansoviSankcii.Params[29].Value:=frmFinansoviSankciiEdit.rgVisnovki.ItemIndex;
      case frmFinansoviSankciiEdit.rgVisnovki.ItemIndex of
        0:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[30].Name:='TeriminRealizacii';
            qFinansoviSankcii.Params[30].Value:='';
          end;
        1:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[30].Name:='TeriminRealizacii';
            qFinansoviSankcii.Params[30].Value:=DateToStr(int(frmFinansoviSankciiEdit.dtpTerminTealizacii.Date));
          end;
        2:
          begin
            qFinansoviSankcii.Params.Add;
            qFinansoviSankcii.Params[30].Name:='TeriminRealizacii';
            qFinansoviSankcii.Params[30].Value:='';
          end;
      end;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[31].Name:='Pidporydkovanist_Adresa';
      qFinansoviSankcii.Params[31].Value:=frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist_Adresa.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[32].Name:='Vstanoviv';
      qFinansoviSankcii.Params[32].Value:=frmFinansoviSankciiEdit.memVstanoviv.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[33].Name:='SchoEPorushennym';
      qFinansoviSankcii.Params[33].Value:=frmFinansoviSankciiEdit.memSchoEPorushennym.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[34].Name:='PIBNazvaObjektu';
      qFinansoviSankcii.Params[34].Value:=frmFinansoviSankciiEdit.edtPIB_Posada_NazvaObjectu.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[35].Name:='PIBPosadaOsobiSES';
      qFinansoviSankcii.Params[35].Value:=frmFinansoviSankciiEdit.edtPIB_Posada_OsobiSES.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[36].Name:='PosadaGDSL';
      qFinansoviSankcii.Params[36].Value:=frmFinansoviSankciiEdit.edtPosada_GDSL.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[37].Name:='PIBGDSL';
      qFinansoviSankcii.Params[37].Value:=frmFinansoviSankciiEdit.edtPIB_GDSL.Text;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[38].Name:='Kod';
      qFinansoviSankcii.Params[38].Value:=frmFinansoviSankciiEdit.edtRecord_ID.Text;
      qFinansoviSankcii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmFinansoviSankcii.aUpdateExecute(sender);
    frmFinansoviSankciiEdit.Close;
    exit;
  end;  //Додавання запису
end;

procedure TfrmFinansoviSankciiEdit.aCancelExecute(Sender: TObject);
begin
  frmFinansoviSankciiEdit.Close;
end;

procedure TfrmFinansoviSankciiEdit.pcFinansoviSankciiChange(
  Sender: TObject);
begin
  if frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage=frmFinansoviSankciiEdit.tsVidomostiProPereviryjuchogo then
    frmMain.DBNavigator1.DataSource:=frmFinansoviSankciiEdit.dsVidomostiProFinansovu;
  if frmFinansoviSankciiEdit.pcFinansoviSankcii.ActivePage=frmFinansoviSankciiEdit.tsDodatkovo then
    frmMain.DBNavigator1.DataSource:=frmFinansoviSankciiEdit.dsLaboratory;
end;

end.
