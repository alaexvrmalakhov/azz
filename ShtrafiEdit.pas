unit ShtrafiEdit;

interface

uses
  Forms, DB, Classes, ActnList, IBCustomDataSet, IBQuery, Menus, StdCtrls,
  ExtCtrls, Grids, DBGrids, Controls, ComCtrls, Dialogs, SysUtils, IniFiles;

type
  TfrmShtrafiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtNomerPostanovi: TEdit;
    pcShtrafi: TPageControl;
    tsVidomostiProObjekt: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    edtNazvaObjectu: TEdit;
    edtAdresaObjectu: TEdit;
    edtPIBPorushnika: TEdit;
    edtPosadaPorushnika: TEdit;
    edtIdentifikacijnijNomer: TEdit;
    edtMisceNarodgenny: TEdit;
    btnVidomostiProObjekt: TButton;
    tsVidomostiProPereviryjuchogo: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    btnOsobaSchoViyvilaPorushnnyUpdate: TButton;
    btnViddilChoice: TButton;
    btnRozmirShtrafuChoice: TButton;
    Label19: TLabel;
    tsZmistPostanovi: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtPIBPorushnikaRV: TEdit;
    btnPIBPorushnikaRV: TButton;
    btnPerelikPorushnihAktiv: TButton;
    btnPorushennyStatej: TButton;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label13: TLabel;
    edtMisceProzhivanny: TEdit;
    tsDodatkovo: TTabSheet;
    Label30: TLabel;
    Label31: TLabel;
    edtPIBPorushnikaTV: TEdit;
    edtPIB_Posada_NazvaObjectu: TEdit;
    Label32: TLabel;
    btnRozdil_F18_Select: TButton;
    Label34: TLabel;
    Label35: TLabel;
    btnPosadaOsobiSESChoice: TButton;
    edtPosadaPorushnika_AdresaObjektu: TEdit;
    btnPosadaPorushnika_AdresaObjektu: TButton;
    btnViznatiVinnim: TButton;
    Label3: TLabel;
    Label23: TLabel;
    edtPIB_Posada_OsobiSES: TEdit;
    btnTaZasluhavshiOsib: TButton;
    Label27: TLabel;
    btnTipShtrafiv_Select: TButton;
    PopupMenu1: TPopupMenu;
    mnLabKontrolDodati: TMenuItem;
    mnLabKontrolZminiti: TMenuItem;
    mnLabKontrolVidaliti: TMenuItem;
    dtpDataPostanovi: TDateTimePicker;
    dtpDataProtokolu: TDateTimePicker;
    dtpDataNarodzhenny: TDateTimePicker;
    rePorushennyStatej: TMemo;
    reViznatiVinnim: TMemo;
    rePerelikPorushnihAktiv: TMemo;
    Label24: TLabel;
    edtVidomchaPidporydkovanist: TEdit;
    btnVidomchaPidporydkovanist: TButton;
    N1: TMenuItem;
    mnSortuvanny: TMenuItem;
    mnZaVidom: TMenuItem;
    mnZaDatoju: TMenuItem;
    mnBezSortuvany: TMenuItem;
    tsLaboratornijKontrol: TTabSheet;
    Panel1: TPanel;
    btnLabKontrolDodati: TButton;
    btnLabKontrolZminiti: TButton;
    btnLabKontrolVidaliti: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    lblData: TLabel;
    lblPosada_Nomer: TLabel;
    rgAkt_Papiska: TRadioGroup;
    dtpData: TDateTimePicker;
    edtNomer: TEdit;
    btnNomerPostanovi: TButton;
    Label5: TLabel;
    edtRik: TEdit;
    btnRik: TButton;
    lblDataDo: TLabel;
    dtpDataDo: TDateTimePicker;
    cbRozdil_F18: TComboBox;
    qComboBoxes: TIBQuery;
    cbTipShtrafiv: TComboBox;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    gbOsobaSchoVineslaPostanovu: TGroupBox;
    Label6: TLabel;
    Label25: TLabel;
    edtPosadaGDSL: TEdit;
    edtPrizvischeGDSL: TEdit;
    btnGDSL: TButton;
    alShtrafiEdit: TActionList;
    aOK: TAction;
    aCancel: TAction;
    aNomerPostanoviUpdate: TAction;
    aActRaspiskaChange: TAction;
    aVidomchaPidporadkovanistChange: TAction;
    aVidomostriProObjectChange: TAction;
    aOsobaSchoViyvilaPorushennyUpdate: TAction;
    aViddilChoice: TAction;
    aPosadaOsobiSesChoice: TAction;
    aRozmirShtrafuChoice: TAction;
    aStattiChange: TAction;
    aPIBPorushnikaChange: TAction;
    aViznatiVinnimChange: TAction;
    aNormativniAktiChange: TAction;
    aSchodoPorushennyChange: TAction;
    aTaZasluhavshiOsibChange: TAction;
    aRozdilt23f18_Update: TAction;
    aRozdilt23f18_Select: TAction;
    aTipShtrafiv_Update: TAction;
    aTipShtrafiv_Select: TAction;
    aRikUpdate: TAction;
    btnRozdil_T18_Update: TButton;
    btnTipShtrafivUpdate: TButton;
    btnUpdate: TButton;
    aLaboratoryAdd: TAction;
    aLaboratoryEdit: TAction;
    aLaboratoryDelete: TAction;
    aLaboratoryUpdate: TAction;
    aGDSL_Update: TAction;
    dsLaboratornijKontrol: TDataSource;
    qLaboratornijKontrol: TIBQuery;
    cbxUchast: TCheckBox;
    Label26: TLabel;
    edtKod: TEdit;
    aKodUpdate: TAction;
    btnOsobaSchoViyvilaPorushnnyChoice: TButton;
    aOsobaSchoViyvilaPorushennyChoice: TAction;
    cbOsobaSchoViyvilaPorushnny: TComboBox;
    cbViddil: TComboBox;
    btnViddilUpdate: TButton;
    aViddilUpdate: TAction;
    cbPosadaOsobiSES: TComboBox;
    btnPosadaOsobiSESUpdate: TButton;
    aPosadaOsobiSesUpdate: TAction;
    cbMinistry: TComboBox;
    cbRozmirShtrafu: TComboBox;
    btnRozmirShtrafuUpdate: TButton;
    aRozmirShtrafuUpdate: TAction;
    aOsobaSchoViyvilaPorushennyChange: TAction;
    cbxKlopotannyProPerenos: TCheckBox;
    dtpKlopotannyProPerenos: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aNomerPostanoviUpdateExecute(Sender: TObject);
    procedure aActRaspiskaChangeExecute(Sender: TObject);
    procedure aVidomchaPidporadkovanistChangeExecute(Sender: TObject);
    procedure aVidomostriProObjectChangeExecute(Sender: TObject);
    procedure aOsobaSchoViyvilaPorushennyUpdateExecute(Sender: TObject);
    procedure aViddilChoiceExecute(Sender: TObject);
    procedure aPosadaOsobiSesChoiceExecute(Sender: TObject);
    procedure aStattiChangeExecute(Sender: TObject);
    procedure aPIBPorushnikaChangeExecute(Sender: TObject);
    procedure aViznatiVinnimChangeExecute(Sender: TObject);
    procedure aNormativniAktiChangeExecute(Sender: TObject);
    procedure aSchodoPorushennyChangeExecute(Sender: TObject);
    procedure aTaZasluhavshiOsibChangeExecute(Sender: TObject);
    procedure aRozdilt23f18_UpdateExecute(Sender: TObject);
    procedure aTipShtrafiv_UpdateExecute(Sender: TObject);
    procedure aRikUpdateExecute(Sender: TObject);
    procedure aLaboratoryAddExecute(Sender: TObject);
    procedure aLaboratoryEditExecute(Sender: TObject);
    procedure aLaboratoryDeleteExecute(Sender: TObject);
    procedure aGDSL_UpdateExecute(Sender: TObject);
    procedure aLaboratoryUpdateExecute(Sender: TObject);
    procedure aRozdilt23f18_SelectExecute(Sender: TObject);
    procedure aTipShtrafiv_SelectExecute(Sender: TObject);
    procedure cbxUchastClick(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOsobaSchoViyvilaPorushennyChoiceExecute(Sender: TObject);
    procedure aViddilUpdateExecute(Sender: TObject);
    procedure aPosadaOsobiSesUpdateExecute(Sender: TObject);
    procedure aRozmirShtrafuUpdateExecute(Sender: TObject);
    procedure aRozmirShtrafuChoiceExecute(Sender: TObject);
    procedure aOsobaSchoViyvilaPorushennyChangeExecute(Sender: TObject);
    procedure cbxKlopotannyProPerenosClick(Sender: TObject);
  end;

var
  frmShtrafiEdit: TfrmShtrafiEdit;

implementation

uses
  Main, Shtrafi, VidomchaPidporydkovanist, Objekti, Viddilenny, Posadi,
  Statti, VizmatiVinnim, LaboratornijKontrol, Rozdil_T23_F18, TipiShtrafiv,
  Spivrobitniki, SumiShtrafu;

{$R *.dfm}

procedure TfrmShtrafiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmShtrafi.aUpdateExecute(sender);
  with frmShtrafi.qShtrafi do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=0 where KOD=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmShtrafiEdit.edtKod.Text);
    Open;
    frmMain.trAzz.CommitRetaining;
    frmShtrafi.aUpdateExecute(sender);
    frmShtrafi.qShtrafi.Last;
  end;
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmShtrafiEdit.aCancelExecute(Sender: TObject);
begin
  frmShtrafiEdit.Close;
end;

procedure TfrmShtrafiEdit.aOKExecute(Sender: TObject);
var
  Ministry,Teritory,Rajon: integer;
  temp: string;
  fs: TFileStream;
begin
  if frmShtrafiEdit.Caption='Видалення постанови про накладення штрафу' then
  begin
    if MessageDlg('Видаллення цієї постанови може відобразитись на звітах!!!'+#13+'Відновлення даних буде неможливе!!!'+#13+'Ви дійсно бажаєте видалити цю постанову?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmShtrafi.qShtrafi.SQL.Clear;
      frmShtrafi.qShtrafi.SQL.Text:='delete from POSTANOVASHTRAF where KOD=:Kod';
      frmShtrafi.qShtrafi.Params.Clear;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[0].Name:='Kod';
      frmShtrafi.qShtrafi.Params[0].Value:=frmShtrafiEdit.edtKod.Text;
      frmShtrafi.qShtrafi.Open;
      frmMain.trAzz.CommitRetaining;
      frmShtrafiEdit.Close;
      frmShtrafi.aUpdateExecute(sender);
      frmShtrafi.qShtrafi.Last;
      exit;
    end;
  end;

  if frmShtrafiEdit.Caption='Редагування постанови про накладення штрафу' then
  begin
    if frmShtrafiEdit.cbMinistry.Text='' then
    begin
      frmShtrafiEdit.cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbTeritory.Text='' then
    begin
      frmShtrafiEdit.cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbRajon.Text='' then
    begin
      frmShtrafiEdit.cbRajon.Text:=frmShtrafi.cbRajon.Text;
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;

    if frmShtrafiEdit.edtNomerPostanovi.Text='' then
    begin
      frmShtrafiEdit.aNomerPostanoviUpdateExecute(sender);
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmShtrafiEdit.edtNomerPostanovi.Text);
    except
      frmShtrafiEdit.aNomerPostanoviUpdateExecute(sender);
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;

    if frmShtrafiEdit.rgAkt_Papiska.ItemIndex=-1 then
    begin
      frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=1;
      frmShtrafiEdit.dtpData.Date:=int(date);
      frmShtrafiEdit.dtpData.SetFocus;
      exit;
    end;

    case frmShtrafiEdit.rgAkt_Papiska.ItemIndex of
     -1:
        begin
          frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=0;
          frmShtrafiEdit.aActRaspiskaChangeExecute(sender);
          exit;
        end;
      0:
        begin
          if int(frmShtrafiEdit.dtpData.Date)>int(dtpDataPostanovi.Date) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date)-1;
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
        end;
      1:
        begin
          if int(frmShtrafiEdit.dtpData.Date)>int(dtpDataPostanovi.Date) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date)-1;
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmShtrafiEdit.edtNomer.Text='' then
          begin
            frmShtrafiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
      2:
        begin
          if int(frmShtrafiEdit.dtpData.Date)>int(dtpDataPostanovi.Date) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date)-1;
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
          if (int(frmShtrafiEdit.dtpData.Date)>int(frmShtrafiEdit.dtpDataDo.Date))and(frmShtrafiEdit.dtpDataDo.Visible) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(date);
            frmShtrafiEdit.dtpDataDo.Date:=int(date);
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmShtrafiEdit.edtNomer.Text='' then
          begin
            frmShtrafiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsVidomostiProObjekt;
    if frmShtrafiEdit.edtNazvaObjectu.Text='' then
    begin
      frmShtrafiEdit.edtNazvaObjectu.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtAdresaObjectu.Text='' then
    begin
      frmShtrafiEdit.edtAdresaObjectu.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPIBPorushnika.Text='' then
    begin
      frmShtrafiEdit.edtPIBPorushnika.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPosadaPorushnika.Text='' then
    begin
      frmShtrafiEdit.edtPosadaPorushnika.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.dtpDataNarodzhenny.Date>=date then
    begin
      frmShtrafiEdit.dtpDataNarodzhenny.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtIdentifikacijnijNomer.Text='' then
    begin
      frmShtrafiEdit.edtIdentifikacijnijNomer.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.edtIdentifikacijnijNomer.Text)<10 then
    begin
      frmShtrafiEdit.edtIdentifikacijnijNomer.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmShtrafiEdit.edtIdentifikacijnijNomer.Text);
    except
      frmShtrafiEdit.edtIdentifikacijnijNomer.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtMisceNarodgenny.Text='' then
    begin
      frmShtrafiEdit.edtMisceNarodgenny.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtMisceProzhivanny.Text='' then
    begin
      frmShtrafiEdit.edtMisceProzhivanny.SetFocus;
      exit;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsVidomostiProPereviryjuchogo;
    if frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text='' then
    begin
      frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbViddil.Text='' then
    begin
      frmShtrafiEdit.cbViddil.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbPosadaOsobiSES.Text='' then
    begin
      frmShtrafiEdit.cbPosadaOsobiSES.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.rePorushennyStatej.Text)<=0 then
    begin
      frmShtrafiEdit.rePorushennyStatej.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbRozmirShtrafu.Text='' then
    begin
      frmShtrafiEdit.aRozmirShtrafuUpdateExecute(sender);
      frmShtrafiEdit.cbRozmirShtrafu.SetFocus;
      exit;
    end;
    try
      StrToInt(frmShtrafiEdit.cbRozmirShtrafu.Text);
    except
      frmShtrafiEdit.aRozmirShtrafuUpdateExecute(sender);
      frmShtrafiEdit.cbRozmirShtrafu.SetFocus;
      exit;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsZmistPostanovi;
    if frmShtrafiEdit.edtPIBPorushnikaRV.Text='' then
    begin
      frmShtrafiEdit.edtPIBPorushnikaRV.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.reViznatiVinnim.Text)<=0 then
    begin
      frmShtrafiEdit.reViznatiVinnim.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.rePerelikPorushnihAktiv.Text)<=0 then
    begin
      frmShtrafiEdit.rePerelikPorushnihAktiv.SetFocus;
      exit;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsDodatkovo;
    if frmShtrafiEdit.edtPIBPorushnikaTV.Text='' then
    begin
      frmShtrafiEdit.aSchodoPorushennyChangeExecute(sender);
      frmShtrafiEdit.edtPIBPorushnikaTV.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text='' then
    begin
      frmShtrafiEdit.aSchodoPorushennyChangeExecute(sender);
      frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.SetFocus;
      exit;
    end;
    if edtPIB_Posada_NazvaObjectu.Text='' then
    begin
      frmShtrafiEdit.aTaZasluhavshiOsibChangeExecute(sender);
      edtPIB_Posada_NazvaObjectu.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPIB_Posada_OsobiSES.Text='' then
    begin
      frmShtrafiEdit.aTaZasluhavshiOsibChangeExecute(sender);
      edtPIB_Posada_OsobiSES.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbRozdil_F18.Text='' then
    begin
      aRozdilt23f18_UpdateExecute(sender);
      cbRozdil_F18.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbTipShtrafiv.Text='' then
    begin
      aTipShtrafiv_UpdateExecute(sender);
      cbTipShtrafiv.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtRik.Text='' then
    begin
      aRikUpdateExecute(sender);
      edtRik.SetFocus;
      exit;
    end;
    try
      StrToInt(frmShtrafiEdit.edtRik.Text);
    except
      aRikUpdateExecute(sender);
      edtRik.SetFocus;
      exit;
    end;

    with frmShtrafi do
    begin
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qComboBoxes.Params.Clear;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[0].Name:='Ministry';
      qComboBoxes.Params[0].Value:=cbMinistry.Text;
      qComboBoxes.Open;
      if qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qComboBoxes.FieldByName('KOD').Value else Ministry:=0;

      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qComboBoxes.Params.Clear;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[0].Name:='Ministry';
      qComboBoxes.Params[0].Value:=Ministry;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[1].Name:='Teritory';
      qComboBoxes.Params[1].Value:=cbTeritory.Text;
      qComboBoxes.Open;
      if qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qComboBoxes.FieldByName('KOD').Value else Teritory:=0;

      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qComboBoxes.Params.Clear;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[0].Name:='Ministry';
      qComboBoxes.Params[0].Value:=Ministry;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[1].Name:='Teritory';
      qComboBoxes.Params[1].Value:=Teritory;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[2].Name:='Rajon';
      qComboBoxes.Params[2].Value:=cbRajon.Text;
      qComboBoxes.Open;
      if qComboBoxes.Locate('RAJON',cbRajon.Text,[]) then Rajon:=qComboBoxes.FieldByName('KOD').Value else Rajon:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='update POSTANOVASHTRAF set MINISTRI=:Ministry,TERITORY=:Teritory,RAJON=:Rajon,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'DATAPROTOKOLU=:DataProtokolu,ZAPISKA_AKT=:Zapiska,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'DATAAKTUOBSTREZHENNY=:DataAktuObstezhenny,DATAAKTUOBSTREZHENNYDO=:DataAktuObstezhennyDo,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'NOMERAKTUOBSTEZHENNY=:NomerAktuObstezhenny,NAZVAOBJEKTU=:NazvaObjektu,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'VIDOMCHAPIDPORYDKOVANIST=:VidomchaPidporydkovanist,ADRESAOBJEKTU=:AdresaObjektu,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIBPORUSHNIKA=:PIBPorushnika,POSADAPORUSHNIKA=:PosadaPorushnika,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'DATANARODZGENNYPORUSHNIKA=:DataNarodzhennyPorushnika,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'IDENTIFIKACIJNIJNOMPORUSH=:IdentifikacijnijKod,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'MISCENARODZHENNYPORUSHNIK=:MisceNarodzhenny,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'ADRESAPROGIVANNYPORUSHNIK=:AdresaProzhivanny,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIBOSOBISES=:PIBSES,VIDDILSES=:ViddilSES,POSADAOSOBISES=:PosadaSES,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PORUSHENNYSTATEJ=:PorushennyStatej,ROZMIRSHTRAFU=:RozmirShtrafu,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIBPORUSHNIKARV=:PIBPorushnikaRV,VIZNATIVINNIM=:ViznatiVinnim,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PORUSHENINORMATIVNIAKTI=:PorusheniNormativi,PIBPORUSHNIKATV=:PIBPorushnikaTV,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'POSADANAZVAADRESA=:PosadaPorushnikaAdresa,PIB_POSADANAZVAOBJEKTU=:PIBPosadaNazva,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIB_POSADA_OSOBISES=:PIBPosadaSES,KLOPOTANNYPROPERENOS=:Klopotanny,DATAPERENOSU=:DataKlopotanny,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'UCHAST=:Uchast,ROZDIL_F18_T23=:R_F18T23,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'TIPSTRAFIV=:TipShtrafiv,YEAR_=:Rik,POSADA_GDSL=:PosadaGDSL,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIB_GDSL=:PIBGDSL,EDITING=0 where KOD=:Kod';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=Rajon;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='NomerPostanovi';
      qShtrafi.Params[3].Value:=frmShtrafiEdit.edtNomerPostanovi.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='DataPostanovi';
      qShtrafi.Params[4].Value:=DateToStr(int(frmShtrafiEdit.dtpDataPostanovi.Date));
      qShtrafi.Params.Add;
      qShtrafi.Params[5].Name:='DataProtokolu';
      qShtrafi.Params[5].Value:=DateToStr(int(frmShtrafiEdit.dtpDataProtokolu.Date));
      qShtrafi.Params.Add;
      qShtrafi.Params[6].Name:='Zapiska';
      qShtrafi.Params[6].Value:=frmShtrafiEdit.rgAkt_Papiska.ItemIndex;
      case frmShtrafiEdit.rgAkt_Papiska.ItemIndex of
        0:
          begin
            qShtrafi.Params.Add;
            qShtrafi.Params[7].Name:='DataAktuObstezhenny';
            qShtrafi.Params[7].Value:=DateToStr(int(frmShtrafiEdit.dtpData.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[8].Name:='DataAktuObstezhennyDo';
            qShtrafi.Params[8].Value:='';
            qShtrafi.Params.Add;
            qShtrafi.Params[9].Name:='NomerAktuObstezhenny';
            qShtrafi.Params[9].Value:='';
          end;
        1:
          begin
            qShtrafi.Params.Add;
            qShtrafi.Params[7].Name:='DataAktuObstezhenny';
            qShtrafi.Params[7].Value:=DateToStr(int(frmShtrafiEdit.dtpData.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[8].Name:='DataAktuObstezhennyDo';
            qShtrafi.Params[8].Value:='';
            qShtrafi.Params.Add;
            qShtrafi.Params[9].Name:='NomerAktuObstezhenny';
            qShtrafi.Params[9].Value:=frmShtrafiEdit.edtNomer.Text;
          end;
        2:
          begin
            qShtrafi.Params.Add;
            qShtrafi.Params[7].Name:='DataAktuObstezhenny';
            qShtrafi.Params[7].Value:=DateToStr(int(frmShtrafiEdit.dtpData.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[8].Name:='DataAktuObstezhennyDo';
            qShtrafi.Params[8].Value:=DateToStr(int(frmShtrafiEdit.dtpDataDo.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[9].Name:='NomerAktuObstezhenny';
            qShtrafi.Params[9].Value:=frmShtrafiEdit.edtNomer.Text;
          end;
      end;
      qShtrafi.Params.Add;
      qShtrafi.Params[10].Name:='NazvaObjektu';
      qShtrafi.Params[10].Value:=frmShtrafiEdit.edtNazvaObjectu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[11].Name:='VidomchaPidporydkovanist';
      qShtrafi.Params[11].Value:=frmShtrafiEdit.edtVidomchaPidporydkovanist.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[12].Name:='AdresaObjektu';
      qShtrafi.Params[12].Value:=frmShtrafiEdit.edtAdresaObjectu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[13].Name:='PIBPorushnika';
      qShtrafi.Params[13].Value:=frmShtrafiEdit.edtPIBPorushnika.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[14].Name:='PosadaPorushnika';
      qShtrafi.Params[14].Value:=frmShtrafiEdit.edtPosadaPorushnika.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[15].Name:='DataNarodzhennyPorushnika';
      qShtrafi.Params[15].Value:=DateToStr(int(frmShtrafiEdit.dtpDataNarodzhenny.Date));
      qShtrafi.Params.Add;
      qShtrafi.Params[16].Name:='IdentifikacijnijKod';
      qShtrafi.Params[16].Value:=frmShtrafiEdit.edtIdentifikacijnijNomer.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[17].Name:='MisceNarodzhenny';
      qShtrafi.Params[17].Value:=frmShtrafiEdit.edtMisceNarodgenny.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[18].Name:='AdresaProzhivanny';
      qShtrafi.Params[18].Value:=frmShtrafiEdit.edtMisceProzhivanny.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[19].Name:='PIBSES';
      qShtrafi.Params[19].Value:=frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[20].Name:='ViddilSES';
      qShtrafi.Params[20].Value:=frmShtrafiEdit.cbViddil.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[21].Name:='PosadaSES';
      qShtrafi.Params[21].Value:=frmShtrafiEdit.cbPosadaOsobiSES.Text;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;
      fs:=TFileStream.Create(temp+'\file1.tmp',fmCreate);
      frmShtrafiEdit.rePorushennyStatej.Lines.SaveToStream(fs);
      fs.Free;
      qShtrafi.Params.Add;
      qShtrafi.Params[22].Name:='PorushennyStatej';
      qShtrafi.Params[22].LoadFromFile(temp+'\file1.tmp',ftMemo);

      qShtrafi.Params.Add;
      qShtrafi.Params[23].Name:='RozmirShtrafu';
      qShtrafi.Params[23].Value:=frmShtrafiEdit.cbRozmirShtrafu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[24].Name:='PIBPorushnikaRV';
      qShtrafi.Params[24].Value:=frmShtrafiEdit.edtPIBPorushnikaRV.Text;

      fs:=TFileStream.Create(temp+'\file2.tmp',fmCreate);
      frmShtrafiEdit.reViznatiVinnim.Lines.SaveToStream(fs);
      fs.Free;
      qShtrafi.Params.Add;
      qShtrafi.Params[25].Name:='ViznatiVinnim';
      qShtrafi.Params[25].LoadFromFile(temp+'\file2.tmp',ftMemo);

      fs:=TFileStream.Create(temp+'\file3.tmp',fmCreate);
      frmShtrafiEdit.rePerelikPorushnihAktiv.Lines.SaveToStream(fs);
      fs.Free;
      qShtrafi.Params.Add;
      qShtrafi.Params[26].Name:='PorusheniNormativi';
      qShtrafi.Params[26].LoadFromFile(temp+'\file3.tmp',ftMemo);

      qShtrafi.Params.Add;
      qShtrafi.Params[27].Name:='PIBPorushnikaTV';
      qShtrafi.Params[27].Value:=frmShtrafiEdit.edtPIBPorushnikaTV.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[28].Name:='PosadaPorushnikaAdresa';
      qShtrafi.Params[28].Value:=frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[29].Name:='PIBPosadaNazva';
      qShtrafi.Params[29].Value:=frmShtrafiEdit.edtPIB_Posada_NazvaObjectu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[30].Name:='PIBPosadaSES';
      qShtrafi.Params[30].Value:=frmShtrafiEdit.edtPIB_Posada_OsobiSES.Text;

      qShtrafi.Params.Add;
      qShtrafi.Params[31].Name:='Klopotanny';
      if
        frmShtrafiEdit.cbxKlopotannyProPerenos.Checked
      then
        qShtrafi.Params[31].Value:='1'
      else
        qShtrafi.Params[31].Value:='0';
      qShtrafi.Params.Add;
      qShtrafi.Params[32].Name:='DataKlopotanny';
      if
        frmShtrafiEdit.cbxKlopotannyProPerenos.Checked
      then
        qShtrafi.Params[32].Value:=DateToStr(int(frmShtrafiEdit.dtpKlopotannyProPerenos.Date))
      else
        qShtrafi.Params[32].Value:='';

      qShtrafi.Params.Add;
      qShtrafi.Params[33].Name:='Uchast';
      if frmShtrafiEdit.cbxUchast.Checked then qShtrafi.Params[33].Value:='1' else qShtrafi.Params[33].Value:='0';
      qShtrafi.Params.Add;
      qShtrafi.Params[34].Name:='R_F18T23';
      qShtrafi.Params[34].Value:=frmShtrafiEdit.cbRozdil_F18.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[35].Name:='TipShtrafiv';
      qShtrafi.Params[35].Value:=frmShtrafiEdit.cbTipShtrafiv.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[36].Name:='Rik';
      qShtrafi.Params[36].Value:=frmShtrafiEdit.edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[37].Name:='PosadaGDSL';
      qShtrafi.Params[37].Value:=frmShtrafiEdit.edtPosadaGDSL.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[38].Name:='PIBGDSL';
      qShtrafi.Params[38].Value:=frmShtrafiEdit.edtPrizvischeGDSL.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[39].Name:='Kod';
      qShtrafi.Params[39].Value:=frmShtrafiEdit.edtKod.Text;
      qShtrafi.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmShtrafiEdit.Close;
    DeleteFile(temp+'\file1.tmp');
    DeleteFile(temp+'\file2.tmp');
    DeleteFile(temp+'\file3.tmp');
    frmShtrafi.aUpdateExecute(sender);
    frmShtrafi.qShtrafi.Last;
    exit;
  end;

  if frmShtrafiEdit.Caption='Додаваня постанови про накладення штрафу' then
  begin
    if frmShtrafiEdit.cbMinistry.Text='' then
    begin
      frmShtrafiEdit.cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbTeritory.Text='' then
    begin
      frmShtrafiEdit.cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbRajon.Text='' then
    begin
      frmShtrafiEdit.cbRajon.Text:=frmShtrafi.cbRajon.Text;
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;

    if frmShtrafiEdit.edtNomerPostanovi.Text='' then
    begin
      frmShtrafiEdit.aNomerPostanoviUpdateExecute(sender);
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmShtrafiEdit.edtNomerPostanovi.Text);
    except
      frmShtrafiEdit.aNomerPostanoviUpdateExecute(sender);
      frmShtrafiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;

    if frmShtrafiEdit.rgAkt_Papiska.ItemIndex=-1 then
    begin
      frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=1;
      frmShtrafiEdit.dtpData.Date:=int(date);
      frmShtrafiEdit.dtpData.SetFocus;
      exit;
    end;

    case frmShtrafiEdit.rgAkt_Papiska.ItemIndex of
     -1:
        begin
          frmShtrafiEdit.rgAkt_Papiska.ItemIndex:=0;
          frmShtrafiEdit.aActRaspiskaChangeExecute(sender);
          exit;
        end;
      0:
        begin
          if int(frmShtrafiEdit.dtpData.Date)>int(dtpDataPostanovi.Date) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date)-1;
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
        end;
      1:
        begin
          if int(frmShtrafiEdit.dtpData.Date)>int(dtpDataPostanovi.Date) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date)-1;
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmShtrafiEdit.edtNomer.Text='' then
          begin
            frmShtrafiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
      2:
        begin
          if int(frmShtrafiEdit.dtpData.Date)>int(dtpDataPostanovi.Date) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date)-1;
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
          if (int(frmShtrafiEdit.dtpData.Date)>int(frmShtrafiEdit.dtpDataDo.Date))and(frmShtrafiEdit.dtpDataDo.Visible) then
          begin
            frmShtrafiEdit.dtpData.Date:=int(date);
            frmShtrafiEdit.dtpDataDo.Date:=int(date);
            frmShtrafiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmShtrafiEdit.edtNomer.Text='' then
          begin
            frmShtrafiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsVidomostiProObjekt;
    if frmShtrafiEdit.edtNazvaObjectu.Text='' then
    begin
      frmShtrafiEdit.edtNazvaObjectu.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtAdresaObjectu.Text='' then
    begin
      frmShtrafiEdit.edtAdresaObjectu.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPIBPorushnika.Text='' then
    begin
      frmShtrafiEdit.edtPIBPorushnika.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPosadaPorushnika.Text='' then
    begin
      frmShtrafiEdit.edtPosadaPorushnika.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.dtpDataNarodzhenny.Date>=date then
    begin
      frmShtrafiEdit.dtpDataNarodzhenny.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtIdentifikacijnijNomer.Text='' then
    begin
      frmShtrafiEdit.edtIdentifikacijnijNomer.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.edtIdentifikacijnijNomer.Text)<10 then
    begin
      frmShtrafiEdit.edtIdentifikacijnijNomer.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmShtrafiEdit.edtIdentifikacijnijNomer.Text);
    except
      frmShtrafiEdit.edtIdentifikacijnijNomer.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtMisceNarodgenny.Text='' then
    begin
      frmShtrafiEdit.edtMisceNarodgenny.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtMisceProzhivanny.Text='' then
    begin
      frmShtrafiEdit.edtMisceProzhivanny.SetFocus;
      exit;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsVidomostiProPereviryjuchogo;
    if frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text='' then
    begin
      frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbViddil.Text='' then
    begin
      frmShtrafiEdit.cbViddil.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbPosadaOsobiSES.Text='' then
    begin
      frmShtrafiEdit.cbPosadaOsobiSES.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.rePorushennyStatej.Text)<=0 then
    begin
      frmShtrafiEdit.rePorushennyStatej.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbRozmirShtrafu.Text='' then
    begin
      frmShtrafiEdit.aRozmirShtrafuUpdateExecute(sender);
      frmShtrafiEdit.cbRozmirShtrafu.SetFocus;
      exit;
    end;
    try
      StrToInt(frmShtrafiEdit.cbRozmirShtrafu.Text);
    except
      frmShtrafiEdit.aRozmirShtrafuUpdateExecute(sender);
      frmShtrafiEdit.cbRozmirShtrafu.SetFocus;
      exit;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsZmistPostanovi;
    if frmShtrafiEdit.edtPIBPorushnikaRV.Text='' then
    begin
      frmShtrafiEdit.edtPIBPorushnikaRV.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.reViznatiVinnim.Text)<=0 then
    begin
      frmShtrafiEdit.reViznatiVinnim.SetFocus;
      exit;
    end;
    if Length(frmShtrafiEdit.rePerelikPorushnihAktiv.Text)<=0 then
    begin
      frmShtrafiEdit.rePerelikPorushnihAktiv.SetFocus;
      exit;
    end;

    frmShtrafiEdit.pcShtrafi.ActivePage:=tsDodatkovo;
    if frmShtrafiEdit.edtPIBPorushnikaTV.Text='' then
    begin
      frmShtrafiEdit.aSchodoPorushennyChangeExecute(sender);
      frmShtrafiEdit.edtPIBPorushnikaTV.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text='' then
    begin
      frmShtrafiEdit.aSchodoPorushennyChangeExecute(sender);
      frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.SetFocus;
      exit;
    end;
    if edtPIB_Posada_NazvaObjectu.Text='' then
    begin
      frmShtrafiEdit.aTaZasluhavshiOsibChangeExecute(sender);
      edtPIB_Posada_NazvaObjectu.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtPIB_Posada_OsobiSES.Text='' then
    begin
      frmShtrafiEdit.aTaZasluhavshiOsibChangeExecute(sender);
      edtPIB_Posada_OsobiSES.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbRozdil_F18.Text='' then
    begin
      aRozdilt23f18_UpdateExecute(sender);
      cbRozdil_F18.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.cbTipShtrafiv.Text='' then
    begin
      aTipShtrafiv_UpdateExecute(sender);
      cbTipShtrafiv.SetFocus;
      exit;
    end;
    if frmShtrafiEdit.edtRik.Text='' then
    begin
      aRikUpdateExecute(sender);
      edtRik.SetFocus;
      exit;
    end;
    try
      StrToInt(frmShtrafiEdit.edtRik.Text);
    except
      aRikUpdateExecute(sender);
      edtRik.SetFocus;
      exit;
    end;

    with frmShtrafi do
    begin
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qComboBoxes.Params.Clear;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[0].Name:='Ministry';
      qComboBoxes.Params[0].Value:=cbMinistry.Text;
      qComboBoxes.Open;
      if qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qComboBoxes.FieldByName('KOD').Value else Ministry:=0;

      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qComboBoxes.Params.Clear;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[0].Name:='Ministry';
      qComboBoxes.Params[0].Value:=Ministry;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[1].Name:='Teritory';
      qComboBoxes.Params[1].Value:=cbTeritory.Text;
      qComboBoxes.Open;
      if qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qComboBoxes.FieldByName('KOD').Value else Teritory:=0;

      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qComboBoxes.Params.Clear;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[0].Name:='Ministry';
      qComboBoxes.Params[0].Value:=Ministry;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[1].Name:='Teritory';
      qComboBoxes.Params[1].Value:=Teritory;
      qComboBoxes.Params.Add;
      qComboBoxes.Params[2].Name:='Rajon';
      qComboBoxes.Params[2].Value:=cbRajon.Text;
      qComboBoxes.Open;
      if qComboBoxes.Locate('RAJON',cbRajon.Text,[]) then Rajon:=qComboBoxes.FieldByName('KOD').Value else Rajon:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='update POSTANOVASHTRAF set MINISTRI=:Ministry,TERITORY=:Teritory,RAJON=:Rajon,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'DATAPROTOKOLU=:DataProtokolu,ZAPISKA_AKT=:Zapiska,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'DATAAKTUOBSTREZHENNY=:DataAktuObstezhenny,DATAAKTUOBSTREZHENNYDO=:DataAktuObstezhennyDo,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'NOMERAKTUOBSTEZHENNY=:NomerAktuObstezhenny,NAZVAOBJEKTU=:NazvaObjektu,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'VIDOMCHAPIDPORYDKOVANIST=:VidomchaPidporydkovanist,ADRESAOBJEKTU=:AdresaObjektu,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIBPORUSHNIKA=:PIBPorushnika,POSADAPORUSHNIKA=:PosadaPorushnika,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'DATANARODZGENNYPORUSHNIKA=:DataNarodzhennyPorushnika,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'IDENTIFIKACIJNIJNOMPORUSH=:IdentifikacijnijKod,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'MISCENARODZHENNYPORUSHNIK=:MisceNarodzhenny,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'ADRESAPROGIVANNYPORUSHNIK=:AdresaProzhivanny,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIBOSOBISES=:PIBSES,VIDDILSES=:ViddilSES,POSADAOSOBISES=:PosadaSES,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PORUSHENNYSTATEJ=:PorushennyStatej,ROZMIRSHTRAFU=:RozmirShtrafu,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIBPORUSHNIKARV=:PIBPorushnikaRV,VIZNATIVINNIM=:ViznatiVinnim,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PORUSHENINORMATIVNIAKTI=:PorusheniNormativi,PIBPORUSHNIKATV=:PIBPorushnikaTV,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'POSADANAZVAADRESA=:PosadaPorushnikaAdresa,PIB_POSADANAZVAOBJEKTU=:PIBPosadaNazva,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIB_POSADA_OSOBISES=:PIBPosadaSES,KLOPOTANNYPROPERENOS=:Klopotanny,DATAPERENOSU=:DataKlopotanny,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'UCHAST=:Uchast,ROZDIL_F18_T23=:R_F18T23,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'TIPSTRAFIV=:TipShtrafiv,YEAR_=:Rik,POSADA_GDSL=:PosadaGDSL,';
      qShtrafi.SQL.Text:=qShtrafi.SQL.Text+'PIB_GDSL=:PIBGDSL,EDITING=0 where KOD=:Kod';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=Rajon;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='NomerPostanovi';
      qShtrafi.Params[3].Value:=frmShtrafiEdit.edtNomerPostanovi.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='DataPostanovi';
      qShtrafi.Params[4].Value:=DateToStr(int(frmShtrafiEdit.dtpDataPostanovi.Date));
      qShtrafi.Params.Add;
      qShtrafi.Params[5].Name:='DataProtokolu';
      qShtrafi.Params[5].Value:=DateToStr(int(frmShtrafiEdit.dtpDataProtokolu.Date));
      qShtrafi.Params.Add;
      qShtrafi.Params[6].Name:='Zapiska';
      qShtrafi.Params[6].Value:=frmShtrafiEdit.rgAkt_Papiska.ItemIndex;
      case frmShtrafiEdit.rgAkt_Papiska.ItemIndex of
        0:
          begin
            qShtrafi.Params.Add;
            qShtrafi.Params[7].Name:='DataAktuObstezhenny';
            qShtrafi.Params[7].Value:=DateToStr(int(frmShtrafiEdit.dtpData.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[8].Name:='DataAktuObstezhennyDo';
            qShtrafi.Params[8].Value:='';
            qShtrafi.Params.Add;
            qShtrafi.Params[9].Name:='NomerAktuObstezhenny';
            qShtrafi.Params[9].Value:='';
          end;
        1:
          begin
            qShtrafi.Params.Add;
            qShtrafi.Params[7].Name:='DataAktuObstezhenny';
            qShtrafi.Params[7].Value:=DateToStr(int(frmShtrafiEdit.dtpData.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[8].Name:='DataAktuObstezhennyDo';
            qShtrafi.Params[8].Value:='';
            qShtrafi.Params.Add;
            qShtrafi.Params[9].Name:='NomerAktuObstezhenny';
            qShtrafi.Params[9].Value:=frmShtrafiEdit.edtNomer.Text;
          end;
        2:
          begin
            qShtrafi.Params.Add;
            qShtrafi.Params[7].Name:='DataAktuObstezhenny';
            qShtrafi.Params[7].Value:=DateToStr(int(frmShtrafiEdit.dtpData.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[8].Name:='DataAktuObstezhennyDo';
            qShtrafi.Params[8].Value:=DateToStr(int(frmShtrafiEdit.dtpDataDo.Date));
            qShtrafi.Params.Add;
            qShtrafi.Params[9].Name:='NomerAktuObstezhenny';
            qShtrafi.Params[9].Value:=frmShtrafiEdit.edtNomer.Text;
          end;
      end;
      qShtrafi.Params.Add;
      qShtrafi.Params[10].Name:='NazvaObjektu';
      qShtrafi.Params[10].Value:=frmShtrafiEdit.edtNazvaObjectu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[11].Name:='VidomchaPidporydkovanist';
      qShtrafi.Params[11].Value:=frmShtrafiEdit.edtVidomchaPidporydkovanist.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[12].Name:='AdresaObjektu';
      qShtrafi.Params[12].Value:=frmShtrafiEdit.edtAdresaObjectu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[13].Name:='PIBPorushnika';
      qShtrafi.Params[13].Value:=frmShtrafiEdit.edtPIBPorushnika.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[14].Name:='PosadaPorushnika';
      qShtrafi.Params[14].Value:=frmShtrafiEdit.edtPosadaPorushnika.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[15].Name:='DataNarodzhennyPorushnika';
      qShtrafi.Params[15].Value:=DateToStr(int(frmShtrafiEdit.dtpDataNarodzhenny.Date));
      qShtrafi.Params.Add;
      qShtrafi.Params[16].Name:='IdentifikacijnijKod';
      qShtrafi.Params[16].Value:=frmShtrafiEdit.edtIdentifikacijnijNomer.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[17].Name:='MisceNarodzhenny';
      qShtrafi.Params[17].Value:=frmShtrafiEdit.edtMisceNarodgenny.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[18].Name:='AdresaProzhivanny';
      qShtrafi.Params[18].Value:=frmShtrafiEdit.edtMisceProzhivanny.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[19].Name:='PIBSES';
      qShtrafi.Params[19].Value:=frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[20].Name:='ViddilSES';
      qShtrafi.Params[20].Value:=frmShtrafiEdit.cbViddil.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[21].Name:='PosadaSES';
      qShtrafi.Params[21].Value:=frmShtrafiEdit.cbPosadaOsobiSES.Text;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;
      fs:=TFileStream.Create(temp+'\file1.tmp',fmCreate);
      frmShtrafiEdit.rePorushennyStatej.Lines.SaveToStream(fs);
      fs.Free;
      qShtrafi.Params.Add;
      qShtrafi.Params[22].Name:='PorushennyStatej';
      qShtrafi.Params[22].LoadFromFile(temp+'\file1.tmp',ftMemo);

      qShtrafi.Params.Add;
      qShtrafi.Params[23].Name:='RozmirShtrafu';
      qShtrafi.Params[23].Value:=frmShtrafiEdit.cbRozmirShtrafu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[24].Name:='PIBPorushnikaRV';
      qShtrafi.Params[24].Value:=frmShtrafiEdit.edtPIBPorushnikaRV.Text;

      fs:=TFileStream.Create(temp+'\file2.tmp',fmCreate);
      frmShtrafiEdit.reViznatiVinnim.Lines.SaveToStream(fs);
      fs.Free;
      qShtrafi.Params.Add;
      qShtrafi.Params[25].Name:='ViznatiVinnim';
      qShtrafi.Params[25].LoadFromFile(temp+'\file2.tmp',ftMemo);

      fs:=TFileStream.Create(temp+'\file3.tmp',fmCreate);
      frmShtrafiEdit.rePerelikPorushnihAktiv.Lines.SaveToStream(fs);
      fs.Free;
      qShtrafi.Params.Add;
      qShtrafi.Params[26].Name:='PorusheniNormativi';
      qShtrafi.Params[26].LoadFromFile(temp+'\file3.tmp',ftMemo);

      qShtrafi.Params.Add;
      qShtrafi.Params[27].Name:='PIBPorushnikaTV';
      qShtrafi.Params[27].Value:=frmShtrafiEdit.edtPIBPorushnikaTV.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[28].Name:='PosadaPorushnikaAdresa';
      qShtrafi.Params[28].Value:=frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[29].Name:='PIBPosadaNazva';
      qShtrafi.Params[29].Value:=frmShtrafiEdit.edtPIB_Posada_NazvaObjectu.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[30].Name:='PIBPosadaSES';
      qShtrafi.Params[30].Value:=frmShtrafiEdit.edtPIB_Posada_OsobiSES.Text;

      qShtrafi.Params.Add;
      qShtrafi.Params[31].Name:='Klopotanny';
      if
        frmShtrafiEdit.cbxKlopotannyProPerenos.Checked
      then
        qShtrafi.Params[31].Value:='1'
      else
        qShtrafi.Params[31].Value:='0';
      qShtrafi.Params.Add;
      qShtrafi.Params[32].Name:='DataKlopotanny';
      if
        frmShtrafiEdit.cbxKlopotannyProPerenos.Checked
      then
        qShtrafi.Params[32].Value:=DateToStr(int(frmShtrafiEdit.dtpKlopotannyProPerenos.Date))
      else
        qShtrafi.Params[32].Value:='';

      qShtrafi.Params.Add;
      qShtrafi.Params[33].Name:='Uchast';
      if frmShtrafiEdit.cbxUchast.Checked then qShtrafi.Params[33].Value:='1' else qShtrafi.Params[33].Value:='0';
      qShtrafi.Params.Add;
      qShtrafi.Params[34].Name:='R_F18T23';
      qShtrafi.Params[34].Value:=frmShtrafiEdit.cbRozdil_F18.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[35].Name:='TipShtrafiv';
      qShtrafi.Params[35].Value:=frmShtrafiEdit.cbTipShtrafiv.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[36].Name:='Rik';
      qShtrafi.Params[36].Value:=frmShtrafiEdit.edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[37].Name:='PosadaGDSL';
      qShtrafi.Params[37].Value:=frmShtrafiEdit.edtPosadaGDSL.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[38].Name:='PIBGDSL';
      qShtrafi.Params[38].Value:=frmShtrafiEdit.edtPrizvischeGDSL.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[39].Name:='Kod';
      qShtrafi.Params[39].Value:=frmShtrafiEdit.edtKod.Text;
      qShtrafi.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmShtrafiEdit.Close;
    DeleteFile(temp+'\file1.tmp');
    DeleteFile(temp+'\file2.tmp');
    DeleteFile(temp+'\file3.tmp');
    frmShtrafi.aUpdateExecute(sender);
    frmShtrafi.qShtrafi.Last;
    exit;
  end;
end;

procedure TfrmShtrafiEdit.aNomerPostanoviUpdateExecute(Sender: TObject);
var
  y: integer;
begin
  y:=0;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  y:=INIAZZ.ReadInteger('System','Year',y);
  INIAZZ.Free;
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='select * from POSTANOVASHTRAF where YEAR_=:Rik';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='Rik';
    qShtrafi.Params[0].Value:=y;
    qShtrafi.Open;
    qShtrafi.Last;
    frmShtrafiEdit.edtNomerPostanovi.Text:=IntToStr(frmShtrafi.qShtrafi.RecordCount+1);
    if qShtrafi.Locate('NOMERPOSTANOVI',StrToInt(frmShtrafiEdit.edtNomerPostanovi.Text),[]) then
      while qShtrafi.Locate('NOMERPOSTANOVI',StrToInt(frmShtrafiEdit.edtNomerPostanovi.Text),[]) do frmShtrafiEdit.edtNomerPostanovi.Text:=IntToStr(StrToInt(edtNomerPostanovi.Text)+1);
  end;
end;

procedure TfrmShtrafiEdit.aActRaspiskaChangeExecute(Sender: TObject);
begin
  case frmShtrafiEdit.rgAkt_Papiska.ItemIndex of
    -1:
      begin
        frmShtrafiEdit.lblData.Visible:=false;
        frmShtrafiEdit.dtpData.Visible:=false;
        frmShtrafiEdit.dtpData.Enabled:=true;
        frmShtrafiEdit.lblDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Enabled:=true;
        frmShtrafiEdit.lblPosada_Nomer.Visible:=false;
        frmShtrafiEdit.edtNomer.Visible:=false;
        frmShtrafiEdit.edtNomer.Enabled:=true;
      end;
     0:
      begin
        frmShtrafiEdit.lblData.Visible:=true;
        frmShtrafiEdit.dtpData.Visible:=true;
        frmShtrafiEdit.lblPosada_Nomer.Visible:=false;
        frmShtrafiEdit.lblPosada_Nomer.Caption:='Посада';
        frmShtrafiEdit.edtNomer.Visible:=false;
        frmShtrafiEdit.lblDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Enabled:=true;

        if frmShtrafiEdit.Caption='Додаваня постанови про накладення штрафу' then
        begin
          frmShtrafiEdit.dtpData.Date:=int(date);
          frmShtrafiEdit.dtpData.Enabled:=true;
          frmShtrafiEdit.edtNomer.Text:='';
          frmShtrafiEdit.edtNomer.Enabled:=true;
        end;

        if frmShtrafiEdit.Caption='Редагування постанови про накладення штрафу' then
        begin
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then frmShtrafiEdit.dtpData.Date:=int(date) else frmShtrafiEdit.dtpData.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
          frmShtrafiEdit.dtpData.Enabled:=true;
          if frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then frmShtrafiEdit.edtNomer.Text:='' else frmShtrafiEdit.edtNomer.Text:=frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
          frmShtrafiEdit.edtNomer.Enabled:=true;
        end;

        if frmShtrafiEdit.Caption='Видалення постанови про накладення штрафу' then
        begin
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then frmShtrafiEdit.dtpData.Date:=int(date) else frmShtrafiEdit.dtpData.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
          frmShtrafiEdit.dtpData.Enabled:=false;
          if frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then frmShtrafiEdit.edtNomer.Text:='' else frmShtrafiEdit.edtNomer.Text:=frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
          frmShtrafiEdit.edtNomer.Enabled:=false;
        end;
      end;
     1:
      begin
        frmShtrafiEdit.lblData.Visible:=true;
        frmShtrafiEdit.dtpData.Visible:=true;
        frmShtrafiEdit.lblPosada_Nomer.Visible:=true;
        frmShtrafiEdit.lblPosada_Nomer.Caption:='Номер';
        frmShtrafiEdit.edtNomer.Visible:=true;
        frmShtrafiEdit.lblDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Enabled:=true;

        if frmShtrafiEdit.Caption='Додаваня постанови про накладення штрафу' then
        begin
          frmShtrafiEdit.dtpData.Date:=int(date);
          frmShtrafiEdit.dtpData.Enabled:=true;
          frmShtrafiEdit.edtNomer.Text:='';
          frmShtrafiEdit.edtNomer.Enabled:=true;
        end;

        if frmShtrafiEdit.Caption='Редагування постанови про накладення штрафу' then
        begin
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then frmShtrafiEdit.dtpData.Date:=int(date) else frmShtrafiEdit.dtpData.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
          frmShtrafiEdit.dtpData.Enabled:=true;
          if frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then frmShtrafiEdit.edtNomer.Text:='' else frmShtrafiEdit.edtNomer.Text:=frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
          frmShtrafiEdit.edtNomer.Enabled:=true;
        end;

        if frmShtrafiEdit.Caption='Видалення постанови про накладення штрафу' then
        begin
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then frmShtrafiEdit.dtpData.Date:=int(date) else frmShtrafiEdit.dtpData.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
          frmShtrafiEdit.dtpData.Enabled:=false;
          if frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then frmShtrafiEdit.edtNomer.Text:='' else frmShtrafiEdit.edtNomer.Text:=frmShtrafi.qShtrafi.FIeldByName('NOMERAKTUOBSTEZHENNY').Value;
          frmShtrafiEdit.edtNomer.Enabled:=false;
        end;
      end;
     2:
      begin
        frmShtrafiEdit.lblData.Visible:=true;
        frmShtrafiEdit.dtpData.Visible:=true;
        frmShtrafiEdit.lblPosada_Nomer.Visible:=true;
        frmShtrafiEdit.lblPosada_Nomer.Caption:='Номер';
        frmShtrafiEdit.edtNomer.Visible:=true;
        frmShtrafiEdit.lblDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Visible:=false;
        frmShtrafiEdit.dtpDataDo.Enabled:=true;

        if frmShtrafiEdit.Caption='Додаваня постанови про накладення штрафу' then
        begin
          frmShtrafiEdit.dtpData.Date:=int(date);
          frmShtrafiEdit.dtpData.Enabled:=true;
         frmShtrafiEdit.dtpDataDo.Date:=int(date);
          frmShtrafiEdit.dtpDataDo.Visible:=true;
          frmShtrafiEdit.dtpDataDo.Enabled:=true;
          frmShtrafiEdit.edtNomer.Text:='';
          frmShtrafiEdit.edtNomer.Enabled:=true;
        end;

        if frmShtrafiEdit.Caption='Редагування постанови про накладення штрафу' then
        begin
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then frmShtrafiEdit.dtpData.Date:=int(date) else frmShtrafiEdit.dtpData.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
          frmShtrafiEdit.dtpData.Enabled:=true;

          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').IsNull then frmShtrafiEdit.dtpDataDo.Date:=int(date) else frmShtrafiEdit.dtpDataDo.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').Value);
          frmShtrafiEdit.dtpDataDo.Visible:=true;
          frmShtrafiEdit.dtpDataDo.Enabled:=true;

          if frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then frmShtrafiEdit.edtNomer.Text:='' else frmShtrafiEdit.edtNomer.Text:=frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
          frmShtrafiEdit.edtNomer.Enabled:=true;
        end;

        if frmShtrafiEdit.Caption='Видалення постанови про накладення штрафу' then
        begin
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').IsNull then frmShtrafiEdit.dtpData.Date:=int(date) else frmShtrafiEdit.dtpData.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNY').Value);
          frmShtrafiEdit.dtpData.Enabled:=false;
          if frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').IsNull then frmShtrafiEdit.dtpDataDo.Date:=int(date) else frmShtrafiEdit.dtpDataDo.Date:=int(frmShtrafi.qShtrafi.FieldByName('DATAAKTUOBSTREZHENNYDO').Value);
          frmShtrafiEdit.dtpDataDo.Visible:=true;
          frmShtrafiEdit.dtpDataDo.Enabled:=false;
          if frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').IsNull then frmShtrafiEdit.edtNomer.Text:='' else frmShtrafiEdit.edtNomer.Text:=frmShtrafi.qShtrafi.FieldByName('NOMERAKTUOBSTEZHENNY').Value;
          frmShtrafiEdit.edtNomer.Enabled:=false;
        end;
      end;
  end;
end;

procedure TfrmShtrafiEdit.aVidomchaPidporadkovanistChangeExecute(
  Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aVidomostriProObjectChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aOsobaSchoViyvilaPorushennyUpdateExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmShtrafiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=cbMinistry.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qComboBoxes.FieldByName('KOD').Value else Ministry:=0;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=cbTeritory.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qComboBoxes.FieldByName('KOD').Value else Teritory:=0;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=cbRajon.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('RAJON',cbRajon.Text,[]) then District:=qComboBoxes.FieldByName('KOD').Value else District:=0;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=District;
    qComboBoxes.Open;
    cbOsobaSchoViyvilaPorushnny.Text:='';
    cbOsobaSchoViyvilaPorushnny.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbOsobaSchoViyvilaPorushnny.Items.Add(qComboBoxes.FieldByName('PRIZVISXHE').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmShtrafiEdit.aViddilChoiceExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aPosadaOsobiSesChoiceExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aStattiChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
  frmMain.aStattiExecute(sender);
  frmStatti.aChoice.Enabled:=true;
  frmStatti.Left:=frmMain.Left+70;
  frmStatti.Top:=frmMain.Top+70;
  frmStatti.Width:=frmMain.Width-70;
  frmStatti.Height:=frmMain.Height-70;
  frmStatti.Position:=poMainFormCenter;
  frmStatti.FormStyle:=fsNormal;
  frmStatti.BorderStyle:=bsDialog;
end;

procedure TfrmShtrafiEdit.aPIBPorushnikaChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.edtPIBPorushnikaRV.Text:=frmShtrafiEdit.edtPIBPorushnika.Text;
end;

procedure TfrmShtrafiEdit.aViznatiVinnimChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
  frmMain.aViznatiVinnimExecute(sender);
  frmVizmatiVinnim.aChoice.Enabled:=true;
  frmVizmatiVinnim.Left:=frmMain.Left+70;
  frmVizmatiVinnim.Top:=frmMain.Top+70;
  frmVizmatiVinnim.Width:=frmMain.Width-70;
  frmVizmatiVinnim.Height:=frmMain.Height-70;
  frmVizmatiVinnim.Position:=poMainFormCenter;
  frmVizmatiVinnim.FormStyle:=fsNormal;
  frmVizmatiVinnim.BorderStyle:=bsDialog;
end;

procedure TfrmShtrafiEdit.aNormativniAktiChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aSchodoPorushennyChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.edtPIBPorushnikaTV.Text:=frmShtrafiEdit.edtPIBPorushnika.Text;
  frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text:=frmShtrafiEdit.edtPosadaPorushnika.Text+' '+frmShtrafiEdit.edtNazvaObjectu.Text+frmShtrafiEdit.edtVidomchaPidporydkovanist.Text+' ('+frmShtrafiEdit.edtAdresaObjectu.Text+')';
end;

procedure TfrmShtrafiEdit.aTaZasluhavshiOsibChangeExecute(Sender: TObject);
begin
  frmShtrafiEdit.edtPIB_Posada_NazvaObjectu.Text:=frmShtrafiEdit.edtPIBPorushnikaRV.Text+' - '+frmShtrafiEdit.edtPosadaPorushnika.Text+', '+frmShtrafiEdit.edtNazvaObjectu.Text;
  frmShtrafiEdit.edtPIB_Posada_OsobiSES.Text:=frmShtrafiEdit.cbOsobaSchoViyvilaPorushnny.Text+' - '+frmShtrafiEdit.cbPosadaOsobiSES.Text;
end;

procedure TfrmShtrafiEdit.aRozdilt23f18_UpdateExecute(Sender: TObject);
begin
  with frmShtrafiEdit do
  begin
    cbRozdil_F18.Items.Clear;
    cbRozdil_F18.Text:='';
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qComboBoxes.Open;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbRozdil_F18.Items.Add(qComboBoxes.FieldByName('OBJEKTNAGLYDU').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmShtrafiEdit.aTipShtrafiv_UpdateExecute(Sender: TObject);
begin
  with frmShtrafiEdit do
  begin
    cbTipShtrafiv.Items.Clear;
    cbTipShtrafiv.Text:='';
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qComboBoxes.Open;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbTipShtrafiv.Items.Add(qComboBoxes.FieldByName('TIPSHTRAFU').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmShtrafiEdit.aRikUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  frmShtrafiEdit.edtRik.Text:=INIAZZ.ReadString('System','Year',frmShtrafiEdit.edtRik.Text);
  INIAZZ.Free;
end;

procedure TfrmShtrafiEdit.aLaboratoryAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmShtrafiEdit.Enabled:=false;
  with frmLaboratornijKontrol do
  begin
    Caption:='Додати відомості про лабораторний контроль';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Show;
    edtKod.Text:='0';
    aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    edtNomerPostanovi.Text:=frmShtrafiEdit.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    dtpDataPostanovi.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date);
    dtpDataPostanovi.Enabled:=false;
    cbMinistry.Text:=frmShtrafiEdit.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmShtrafiEdit.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbDistrict.Text:=frmShtrafiEdit.cbRajon.Text;
    cbDistrict.Enabled:=false;
    cbVidKontrolu.Text:='';
    cbVidKontrolu.Items.Clear;
    aVidKontrolu_UpdateExecute(sender);
    cbVidKontrolu.Enabled:=true;
    btnVidKontrolu_Update.Enabled:=true;
    btnVidKontrolu_Choice.Enabled:=true;
    edtNomeriProb.Text:='';
    edtNomeriProb.Enabled:=true;
    dtpDataKontrolu.Date:=int(date);
    dtpDataKontrolu.Enabled:=true;
    cbVidKontrolu.SetFocus;
  end;
end;

procedure TfrmShtrafiEdit.aLaboratoryEditExecute(Sender: TObject);
begin
  if frmShtrafiEdit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmShtrafiEdit.Enabled:=false;
  with frmLaboratornijKontrol do
  begin
    Caption:='Редагувати відомості про лабораторний контроль';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Show;
    edtKod.Text:='0';
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('KOD').Value) else aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value) else edtNomerPostanovi.Text:=frmShtrafiEdit.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then dtpDataPostanovi.Date:=int(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else dtpDataPostanovi.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date);
    dtpDataPostanovi.Enabled:=false;

    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').IsNull then
    begin
      cbMinistry.Text:=frmShtrafiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').Value;
      qID.SQL.Clear;
      qID.SQL.Text:='select * from MINISTRY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbMinistry.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qID.FieldByName('MINISTRY').Value else cbMinistry.Text:=frmShtrafiEdit.cbMinistry.Text;
    end
    else
      cbMinistry.Text:=frmShtrafiEdit.cbMinistry.Text;
    cbMinistry.Enabled:=false;

    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('TERITORY').IsNull then
    begin
      cbTeritory.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('TERITORY').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from TERITORY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbTeritory.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qID.FieldByName('TERITORY').Value else cbTeritory.Text:=frmShtrafiEdit.cbTeritory.Text;
    end
    else
      cbTeritory.Text:=frmShtrafiEdit.cbTeritory.Text;
    cbTeritory.Enabled:=false;

    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').IsNull then
    begin
      cbDistrict.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from RAJONI where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbDistrict.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qID.FieldByName('RAJON').Value else cbDistrict.Text:=frmShtrafiEdit.cbRajon.Text;
    end
    else
      cbDistrict.Text:=frmShtrafiEdit.cbRajon.Text;
    cbDistrict.Enabled:=false;

    cbVidKontrolu.Text:='';
    cbVidKontrolu.Items.Clear;
    aVidKontrolu_UpdateExecute(sender);
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then cbVidKontrolu.Text:=frmShtrafiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else cbVidKontrolu.Text:='';
    cbVidKontrolu.Enabled:=true;
    btnVidKontrolu_Update.Enabled:=true;
    btnVidKontrolu_Choice.Enabled:=true;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then edtNomeriProb.Text:=frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else edtNomeriProb.Text:='';
    edtNomeriProb.Enabled:=true;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then dtpDataKontrolu.Date:=int(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else dtpDataKontrolu.Date:=int(date);
    dtpDataKontrolu.Enabled:=true;
    cbVidKontrolu.SetFocus;
  end;
end;

procedure TfrmShtrafiEdit.aLaboratoryDeleteExecute(Sender: TObject);
begin
  if frmShtrafiEdit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmShtrafiEdit.Enabled:=false;
  with frmLaboratornijKontrol do
  begin
    Caption:='Видалити відомості про лабораторний контроль';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Show;
    edtKod.Text:='0';
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('KOD').Value) else aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value) else edtNomerPostanovi.Text:=frmShtrafiEdit.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then dtpDataPostanovi.Date:=int(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else dtpDataPostanovi.Date:=int(frmShtrafiEdit.dtpDataPostanovi.Date);
    dtpDataPostanovi.Enabled:=false;

    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').IsNull then
    begin
      cbMinistry.Text:=frmShtrafiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').Value;
      qID.SQL.Clear;
      qID.SQL.Text:='select * from MINISTRY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbMinistry.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qID.FieldByName('MINISTRY').Value else cbMinistry.Text:=frmShtrafiEdit.cbMinistry.Text;
    end
    else
      cbMinistry.Text:=frmShtrafiEdit.cbMinistry.Text;
    cbMinistry.Enabled:=false;

    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('TERITORY').IsNull then
    begin
      cbTeritory.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('TERITORY').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from TERITORY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbTeritory.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qID.FieldByName('TERITORY').Value else cbTeritory.Text:=frmShtrafiEdit.cbTeritory.Text;
    end
    else
      cbTeritory.Text:=frmShtrafiEdit.cbTeritory.Text;
    cbTeritory.Enabled:=false;

    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').IsNull then
    begin
      cbDistrict.Text:=IntToStr(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from RAJONI where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbDistrict.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qID.FieldByName('RAJON').Value else cbDistrict.Text:=frmShtrafiEdit.cbRajon.Text;
    end
    else
      cbDistrict.Text:=frmShtrafiEdit.cbRajon.Text;
    cbDistrict.Enabled:=false;

    cbVidKontrolu.Text:='';
    cbVidKontrolu.Items.Clear;
    aVidKontrolu_UpdateExecute(sender);
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then cbVidKontrolu.Text:=frmShtrafiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else cbVidKontrolu.Text:='';
    cbVidKontrolu.Enabled:=false;
    btnVidKontrolu_Update.Enabled:=false;
    btnVidKontrolu_Choice.Enabled:=false;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then edtNomeriProb.Text:=frmShtrafiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else edtNomeriProb.Text:='';
    edtNomeriProb.Enabled:=false;
    if not frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then dtpDataKontrolu.Date:=int(frmShtrafiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else dtpDataKontrolu.Date:=int(date);
    dtpDataKontrolu.Enabled:=false;
    btnVidminiti.SetFocus;
  end;
end;

procedure TfrmShtrafiEdit.aGDSL_UpdateExecute(Sender: TObject);
var
  Director:integer;
begin
  Director:=0;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  Director:=INIAZZ.ReadInteger('Firm','Director',Director);
  case Director of
    0:
      begin
        frmShtrafiEdit.edtPosadaGDSL.Text:='Головний державний санітарний лікар '+frmShtrafiEdit.cbRajon.Text+' '+frmShtrafiEdit.cbTeritory.Text;
        frmShtrafiEdit.edtPrizvischeGDSL.Text:=INIAZZ.ReadString('Director','LNP_NV',frmShtrafiEdit.edtPrizvischeGDSL.Text);
      end;
    1:
      begin
        frmShtrafiEdit.edtPosadaGDSL.Text:='Заступник Головного державного санітарного лікаря '+frmShtrafiEdit.cbRajon.Text+' '+frmShtrafiEdit.cbTeritory.Text;
        frmShtrafiEdit.edtPrizvischeGDSL.Text:=INIAZZ.ReadString('Director1','LNP_NV',frmShtrafiEdit.edtPrizvischeGDSL.Text);
      end;
    2:
      begin
        frmShtrafiEdit.edtPosadaGDSL.Text:='в.о.Головного державного санітарного лікаря '+frmShtrafiEdit.cbRajon.Text+' '+frmShtrafiEdit.cbTeritory.Text;
        frmShtrafiEdit.edtPrizvischeGDSL.Text:=INIAZZ.ReadString('Director2','LNP_NV',frmShtrafiEdit.edtPrizvischeGDSL.Text);
      end;
  end;
  INIAZZ.Free;
end;

procedure TfrmShtrafiEdit.aLaboratoryUpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmShtrafiEdit do
  begin
    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmShtrafiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('MINISTRY',frmShtrafiEdit.cbMinistry.Text,[]) then Ministry:=qLaboratornijKontrol.FieldByName('KOD').Value else Ministry:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.TERITORY=:Teritory order by TERITORY.KOD';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmShtrafiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=frmShtrafiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('TERITORY',frmShtrafiEdit.cbTeritory.Text,[]) then Teritory:=qLaboratornijKontrol.FieldByName('KOD').Value else Teritory:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.RAJON=:Rajon order by RAJONI.KOD';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Teritory';
    qLaboratornijKontrol.Params[0].Value:=frmShtrafiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Rajon';
    qLaboratornijKontrol.Params[1].Value:=frmShtrafiEdit.cbRajon.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('RAJON',frmShtrafiEdit.cbRajon.Text,[]) then District:=qLaboratornijKontrol.FieldByName('KOD').Value else District:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:shtraf';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=Ministry;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=Teritory;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[2].Name:='Rajon';
    qLaboratornijKontrol.Params[2].Value:=District;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
    qLaboratornijKontrol.Params[3].Value:=edtNomerPostanovi.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
    qLaboratornijKontrol.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[5].Name:='shtraf';
    qLaboratornijKontrol.Params[5].Value:='shtrafi';
    qLaboratornijKontrol.Open;
  end;
end;

procedure TfrmShtrafiEdit.aRozdilt23f18_SelectExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aTipShtrafiv_SelectExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
  frmMain.aTipShtrafuExecute(sender);
  frmTipiShtrafiv.aChoice.Enabled:=true;
  frmTipiShtrafiv.Left:=frmMain.Left+70;
  frmTipiShtrafiv.Top:=frmMain.Top+70;
  frmTipiShtrafiv.Width:=frmMain.Width-70;
  frmTipiShtrafiv.Height:=frmMain.Height-70;
  frmTipiShtrafiv.Position:=poMainFormCenter;
  frmTipiShtrafiv.FormStyle:=fsNormal;
  frmTipiShtrafiv.BorderStyle:=bsDialog;
end;

procedure TfrmShtrafiEdit.cbxUchastClick(Sender: TObject);
begin
  if frmShtrafiEdit.cbxUchast.Checked then frmShtrafiEdit.cbxUchast.Caption:='Приймав участь у розгляді' else frmShtrafiEdit.cbxUchast.Caption:='Від участі в розгляді відмовився';
end;

procedure TfrmShtrafiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmShtrafiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='insert into POSTANOVASHTRAF (KOD,EDITING) values (gen_id(GET_SHTRAFI_RECORD_ID,1),1)';
    qComboBoxes.Open;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from POSTANOVASHTRAF order by KOD';
    qComboBoxes.Open;
    qComboBoxes.Last;
    edtKod.Text:=IntToStr(qComboBoxes.FieldByName('KOD').Value);
  end;
end;

procedure TfrmShtrafiEdit.aOsobaSchoViyvilaPorushennyChoiceExecute(
  Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
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

procedure TfrmShtrafiEdit.aViddilUpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmShtrafiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=cbMinistry.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qComboBoxes.FieldByName('KOD').Value else Ministry:=0;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=cbTeritory.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qComboBoxes.FieldByName('KOD').Value else Teritory:=0;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=cbRajon.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('RAJON',cbRajon.Text,[]) then District:=qComboBoxes.FieldByName('KOD').Value else District:=0;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from VIDDILENNY where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAVIDDILENNY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=District;
    qComboBoxes.Open;
    cbViddil.Text:='';
    cbViddil.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbViddil.Items.Add(qComboBoxes.FieldByName('NAZVAVIDDILENNY').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmShtrafiEdit.aPosadaOsobiSesUpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmShtrafiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=cbMinistry.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qComboBoxes.FieldByName('KOD').Value else Ministry:=0;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=cbTeritory.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qComboBoxes.FieldByName('KOD').Value else Teritory:=0;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=cbRajon.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('RAJON',cbRajon.Text,[]) then District:=qComboBoxes.FieldByName('KOD').Value else District:=0;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from POSADI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAPOSADI';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=District;
    qComboBoxes.Open;
    cbPosadaOsobiSES.Text:='';
    cbPosadaOsobiSES.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbPosadaOsobiSES.Items.Add(qComboBoxes.FieldByName('NAZVAPOSADI').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmShtrafiEdit.aRozmirShtrafuUpdateExecute(Sender: TObject);
begin
  with frmShtrafiEdit do
  begin
    cbRozmirShtrafu.Text:='';
    cbRozmirShtrafu.Items.Clear;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from SHTRAFI order by SUMASHTAFU';
    qComboBoxes.Open;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbRozmirShtrafu.Items.Add(qComboBoxes.FieldByName('SUMASHTAFU').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmShtrafiEdit.aRozmirShtrafuChoiceExecute(Sender: TObject);
begin
  frmShtrafiEdit.Enabled:=false;
  frmMain.aSumiShtrafuExecute(sender);
  frmSumiShtrafu.aChoice.Enabled:=true;
  frmSumiShtrafu.Left:=frmMain.Left+70;
  frmSumiShtrafu.Top:=frmMain.Top+70;
  frmSumiShtrafu.Width:=frmMain.Width-70;
  frmSumiShtrafu.Height:=frmMain.Height-70;
  frmSumiShtrafu.Position:=poMainFormCenter;
  frmSumiShtrafu.FormStyle:=fsNormal;
  frmSumiShtrafu.BorderStyle:=bsDialog;
end;

procedure TfrmShtrafiEdit.aOsobaSchoViyvilaPorushennyChangeExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmShtrafiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=cbMinistry.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qComboBoxes.FieldByName('KOD').Value else Ministry:=0;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=cbTeritory.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qComboBoxes.FieldByName('KOD').Value else Teritory:=0;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Teritory';
    qComboBoxes.Params[1].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Rajon';
    qComboBoxes.Params[2].Value:=cbRajon.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('RAJON',cbRajon.Text,[]) then District:=qComboBoxes.FieldByName('KOD').Value else District:=0;

    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from SPIVROBITNIKI where PRIZVISXHE=:Prizvische and MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Prizvische';
    qComboBoxes.Params[0].Value:=cbOsobaSchoViyvilaPorushnny.Text;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Ministry';
    qComboBoxes.Params[1].Value:=Ministry;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[2].Name:='Teritory';
    qComboBoxes.Params[2].Value:=Teritory;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[3].Name:='Rajon';
    qComboBoxes.Params[3].Value:=District;
    qComboBoxes.Open;

    if qComboBoxes.Locate('PRIZVISXHE',cbOsobaSchoViyvilaPorushnny.Text,[]) then
    begin
      cbViddil.Text:=IntToStr(qComboBoxes.FieldByName('KODVIDDILENNY').Value);
      cbPosadaOsobiSES.Text:=IntToStr(qComboBoxes.FieldByName('KODPOSADI').Value);
      if cbViddil.Text<>'' then
      begin
        qComboBoxes.SQL.Clear;
        qComboBoxes.SQL.Text:='select * from VIDDILENNY where KODVIDDILENNY=:KodViddilenny order by KODVIDDILENNY';
        qComboBoxes.Params.Clear;
        qComboBoxes.Params.Add;
        qComboBoxes.Params[0].Name:='KodViddilenny';
        qComboBoxes.Params[0].Value:=cbViddil.Text;
        qComboBoxes.Open;
        if qComboBoxes.Locate('KODVIDDILENNY',StrToInt(cbViddil.Text),[]) then cbViddil.Text:=qComboBoxes.FieldByName('NAZVAVIDDILENNY').Value else cbViddil.Text:='';
      end;
      if cbPosadaOsobiSES.Text<>'' then
      begin
        qComboBoxes.SQL.Clear;
        qComboBoxes.SQL.Text:='select * from POSADI where KODPOSADI=:KodPosadi order by KODPOSADI';
        qComboBoxes.Params.Clear;
        qComboBoxes.Params.Add;
        qComboBoxes.Params[0].Name:='KodPosadi';
        qComboBoxes.Params[0].Value:=cbPosadaOsobiSES.Text;
        qComboBoxes.Open;
        if qComboBoxes.Locate('KodPosadi',StrToInt(cbPosadaOsobiSES.Text),[]) then cbPosadaOsobiSES.Text:=qComboBoxes.FIeldByName('NAZVAPOSADI').Value else cbPosadaOsobiSES.Text:='';
      end;
    end;
  end;
end;

procedure TfrmShtrafiEdit.cbxKlopotannyProPerenosClick(Sender: TObject);
begin
  if frmShtrafiEdit.cbxKlopotannyProPerenos.Checked then
  begin
    frmShtrafiEdit.cbxKlopotannyProPerenos.Caption:='Клопотання про перенос терміну розгляду';
    frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=true;
    frmShtrafiEdit.dtpKlopotannyProPerenos.Date:=int(date);
  end
  else
  begin
    frmShtrafiEdit.cbxKlopotannyProPerenos.Caption:='Клопотання про перенос терміну розгляду не надходило';
    frmShtrafiEdit.dtpKlopotannyProPerenos.Visible:=false;
  end;
end;

end.
