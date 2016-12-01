unit ObjektiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, Controls,
  StdCtrls, Grids, DBGrids, ExtCtrls, Dialogs, SysUtils, IniFiles;

type
  TfrmObjektiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodObjekta: TEdit;
    edtNazvaObjekta: TEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    Label16: TLabel;
    edtAdresaObjekta: TEdit;
    Label6: TLabel;
    edtVidomchaPidporydkovanist: TEdit;
    btnVidomchaPidporydkovanist: TButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtViddilennyBanku: TEdit;
    edtKod_DKPP: TEdit;
    edtKod_MFO: TEdit;
    edtRozrahunkovijRahunok: TEdit;
    btnKodObjekta: TButton;
    Label8: TLabel;
    Label9: TLabel;
    cbTeritory: TComboBox;
    btnTeritory: TButton;
    cbDistrict: TComboBox;
    btnDistrict: TButton;
    btnPerepraviti: TButton;
    btnUpdate: TButton;
    alObjektiEdit: TActionList;
    aCancel: TAction;
    aOK: TAction;
    aKodUpdate: TAction;
    aTeritoryUpdate: TAction;
    aTeritoryChange: TAction;
    aDistrictUpdate: TAction;
    aVidomchaPidporydkovanistChange: TAction;
    PopupMenu: TPopupMenu;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aMove: TAction;
    aUpdate: TAction;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnMove: TMenuItem;
    mnUpdate: TMenuItem;
    dsSpivrobitniki: TDataSource;
    qSpivrobitniki: TIBQuery;
    Label10: TLabel;
    cbMinistry: TComboBox;
    btnMinistryUpdate: TButton;
    aMinistryUpdate: TAction;
    aMinistryChange: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictUpdateExecute(Sender: TObject);
    procedure aVidomchaPidporydkovanistChangeExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aMinistryUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
  end;

var
  frmObjektiEdit: TfrmObjektiEdit;

implementation

uses
  Main, Objekti, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  Opechanuvanny, AdminZapobizhZahodiEdit, ShtrafiEdit,
  VidomchaPidporydkovanist, SotrudnikiObjektivEdit, Filter;

{$R *.dfm}

procedure TfrmObjektiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmObjekti.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    if frmObjektiEdit.Caption<>'Вибрати відомості про об''єкт' then
    begin
      frmObjekti.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmObjekti.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmObjekti.Enabled:=true;
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    if frmObjektiEdit.Caption<>'Вибрати відомості про об''єкт' then
    begin
      frmObjekti.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmObjekti.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmObjekti.Enabled:=true;
    frmOpechanuvanny.Enabled:=true;
    if frmObjektiEdit.Caption<>'Вибрати відомості про об''єкт' then
    begin
      frmObjekti.Enabled:=true;
      frmOpechanuvanny.Enabled:=false;
    end
    else
      frmObjekti.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    if frmObjektiEdit.Caption<>'Вибрати відомості про об''єкт' then
    begin
      frmObjekti.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmObjekti.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
    if frmObjektiEdit.Caption<>'Вибрати відомості про об''єкт' then
    begin
      frmObjekti.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmObjekti.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
      frmShtrafiEdit.Enabled:=true;
      if frmObjektiEdit.Caption<>'Вибрати відомості про об''єкт' then 
      begin
        frmObjekti.Enabled:=true;
        frmShtrafiEdit.Enabled:=false;
      end
      else
        frmObjekti.Close;
      frmMain.Enabled:=false;
      Action:=caFree;
      exit;
  end;

  frmMain.Enabled:=True;
  Action:=caFree;
end;

procedure TfrmObjektiEdit.aCancelExecute(Sender: TObject);
begin
  frmObjektiEdit.Close;
end;

procedure TfrmObjektiEdit.aOKExecute(Sender: TObject);
begin
  if frmObjektiEdit.Caption='Вибрати відомості про об''єкт' then
  begin
    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
      frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:=frmObjektiEdit.edtVidomchaPidporydkovanist.Text;
      frmFinansoviSankciiEdit.edtAdresa.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
      if not frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').IsNull then frmFinansoviSankciiEdit.edtPIBKerivnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value else frmFinansoviSankciiEdit.edtPIBKerivnika.Text:='';
      if not frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').IsNull then frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value else frmFinansoviSankciiEdit.edtPosadaKerivnika.Text:='';
      frmFinansoviSankciiEdit.edtRozrahunkovijRahunok.Text:=frmObjektiEdit.edtRozrahunkovijRahunok.Text;
      frmFinansoviSankciiEdit.edtKodDKPP.Text:=frmObjektiEdit.edtKod_DKPP.Text;
      frmFinansoviSankciiEdit.edtViddilennyBanku.Text:=frmObjektiEdit.edtViddilennyBanku.Text;
      frmFinansoviSankciiEdit.edtMFO.Text:=frmObjektiEdit.edtKod_MFO.Text;
      frmObjektiEdit.Close;
      frmObjekti.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      if frmViluchennyZRealizaciiEdit.ActiveControl=frmViluchennyZRealizaciiEdit.btnVidomostiProObjekt then
      begin
        frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
        frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:=frmObjektiEdit.edtVidomchaPidporydkovanist.Text;
        frmViluchennyZRealizaciiEdit.edtAdresa.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
        if not frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').IsNull then frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value else frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text:='';
        if not frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').IsNull then frmViluchennyZRealizaciiEdit.edtPosada.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value else frmViluchennyZRealizaciiEdit.edtPosada.Text:='';
      end;
      frmObjektiEdit.Close;
      frmObjekti.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmOpechanuvanny') then
    begin
      frmOpechanuvanny.edtNazvaObjektu.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
      if not frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').IsNull then frmOpechanuvanny.edtPIBPredstavnikaObjektu.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value else frmOpechanuvanny.edtPIBPredstavnikaObjektu.Text:='';
      if not frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').IsNull then frmOpechanuvanny.edtPosadaPredstavnikaObjektu.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value else frmOpechanuvanny.edtPosadaPredstavnikaObjektu.Text:='';
      frmObjektiEdit.Close;
      frmObjekti.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.edtNazvaObjektu.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
      frmAdminZapobizhZahodiEdit.edtAdresaObjektu.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
      frmAdminZapobizhZahodiEdit.edtVidomchaPidporydkovanist.Text:=frmObjektiEdit.edtVidomchaPidporydkovanist.Text;
      if not frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').IsNull then frmAdminZapobizhZahodiEdit.edtPIBKerivnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value else frmAdminZapobizhZahodiEdit.edtPIBKerivnika.Text:='';
      if not frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').IsNull then frmAdminZapobizhZahodiEdit.edtPosadaKerivnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value else frmAdminZapobizhZahodiEdit.edtPosadaKerivnika.Text:='';
      frmObjektiEdit.Close;
      frmObjekti.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFilter') then
    begin
      if frmFilter.Caption='Фінансові санкції: Адреса об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;

      if frmFilter.Caption='Фінансові санкції: Назва об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;

      if frmFilter.Caption='Вилучення з реалізації: Адреса об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;

      if frmFilter.Caption='Вилучення з реалізації: Назва об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;

      if frmFilter.Caption='Адмін. заходи: Адреса об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;

      if frmFilter.Caption='Адмін. заходи: Об''єкти' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;

      if frmFilter.Caption='Штрафи: Назва об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;
      if frmFilter.Caption='Штрафи: Адреса об''єкту' then
      begin
        frmFilter.cbFilter.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
        frmObjektiEdit.Close;
        frmObjekti.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.pcShtrafi.ActivePage:=frmShtrafiEdit.tsVidomostiProObjekt;
      frmShtrafiEdit.edtNazvaObjectu.Text:=frmObjektiEdit.edtNazvaObjekta.Text;
      frmShtrafiEdit.edtVidomchaPidporydkovanist.Text:=frmObjektiEdit.edtVidomchaPidporydkovanist.Text;
      frmShtrafiEdit.edtAdresaObjectu.Text:=frmObjektiEdit.edtAdresaObjekta.Text;
      frmShtrafiEdit.edtPIBPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value;
      frmShtrafiEdit.edtPIBPorushnikaRV.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value;
      frmShtrafiEdit.edtPIBPorushnikaTV.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value;
      frmShtrafiEdit.edtPosadaPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value;
      frmShtrafiEdit.dtpDataNarodzhenny.Date:=int(frmObjektiEdit.qSpivrobitniki.FieldByName('DATANARODZHENNYPORUSHNIKA').Value);
      frmShtrafiEdit.edtIdentifikacijnijNomer.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('IDENTIFIKACIJNIJKODPORUSHNIKA').Value;
      frmShtrafiEdit.edtMisceNarodgenny.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('MISCENARODZHENNYPORUSHNIKA').Value;
      frmShtrafiEdit.edtMisceProzhivanny.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('MISCEPROZHIVANNYPORUSHNIKA').Value;
      frmShtrafiEdit.edtPosadaPorushnika_AdresaObjektu.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value+' '+frmObjektiEdit.edtAdresaObjekta.Text;
      frmShtrafiEdit.edtPIB_Posada_NazvaObjectu.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value+' '+frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value+' '+frmObjektiEdit.edtNazvaObjekta.Text;
      frmObjektiEdit.Close;
      frmObjekti.Close;
      exit;
    end;
  end;

  if frmObjektiEdit.Caption='Видалити відомості про об''єкт' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на відомостях бази даних!!!'+#13+'Чи бажаєте Ви видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmObjekti.qObjekti.SQL.Clear;
      frmObjekti.qObjekti.SQL.Text:='delete from OBJEKTI where KODOBJEKTA=:KodObjekta';
      frmObjekti.qObjekti.Params.Clear;
      frmObjekti.qObjekti.Params.Add;
      frmObjekti.qObjekti.Params[0].Name:='KodObjekta';
      frmObjekti.qObjekti.Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
      frmObjekti.qObjekti.Open;
    //удаление записей о сотрудниках
      frmObjektiEdit.qSpivrobitniki.SQL.Clear;
      frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from SPIVROBITNIKI_OBJEKTIV where KOD_OBJEKTA=:KodObjekta';
      frmObjektiEdit.qSpivrobitniki.Params.Clear;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[0].Name:='KodObjekta';
      frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
      frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.RecordCount>0 then
      begin
        with frmObjektiEdit.qSpivrobitniki do
        begin
          SQL.Clear;
          SQL.Text:='delete from SPIVROBITNIKI_OBJEKTIV where KOD_OBJEKTA=:KodObjekta';
          Params.Clear;
          Params.Add;
          Params[0].Name:='KodObjekta';
          Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
          Open;
        end;
      end;
      frmMain.trAzz.CommitRetaining;
      frmObjektiEdit.Close;
      frmObjekti.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmObjektiEdit.Caption='Редагувати відомості про об''єкт' then
  begin
    if frmObjektiEdit.edtKodObjekta.Text='' then
    begin
      frmObjektiEdit.aKodUpdateExecute(sender);
      frmObjektiEdit.edtNazvaObjekta.SetFocus;
      exit;
    end;
    try
      StrToInt(frmObjektiEdit.edtKodObjekta.Text);
    except
      frmObjektiEdit.aKodUpdateExecute(sender);
      frmObjektiEdit.edtNazvaObjekta.SetFocus;
      exit;
    end;

    if frmObjektiEdit.cbMinistry.Text='' then
    begin
      frmObjektiEdit.aMinistryUpdateExecute(sender);
      frmObjektiEdit.cbMinistry.SetFocus;
      exit;
    end;

    if frmObjektiEdit.cbTeritory.Text='' then
    begin
      frmObjektiEdit.aTeritoryUpdateExecute(sender);
      frmObjektiEdit.cbTeritory.SetFocus;
      exit;
    end;

    if frmObjektiEdit.cbDistrict.Text='' then
    begin
      frmObjektiEdit.aDistrictUpdateExecute(sender);
      frmObjektiEdit.cbDistrict.SetFocus;
      exit;
    end;

    if frmObjektiEdit.edtNazvaObjekta.Text='' then
    begin
      frmObjektiEdit.edtNazvaObjekta.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtAdresaObjekta.Text='' then
    begin
      edtAdresaObjekta.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtViddilennyBanku.Text='' then
    begin
      frmObjektiEdit.edtViddilennyBanku.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtKod_DKPP.Text='' then
    begin
      frmObjektiEdit.edtKod_DKPP.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtKod_MFO.Text='' then
    begin
      frmObjektiEdit.edtKod_MFO.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtRozrahunkovijRahunok.Text='' then
    begin
      frmObjektiEdit.edtRozrahunkovijRahunok.SetFocus;
      exit;
    end;
    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    frmObjekti.qTeritory.Open;
    if not frmObjekti.qTeritory.Locate('MINISTRY',frmObjektiEdit.cbMinistry.Text,[]) then
    begin
      frmObjektiEdit.aMinistryUpdateExecute(sender);
      frmObjektiEdit.cbMinistry.SetFocus;
      exit;
    end;

    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    frmObjekti.qTeritory.Params.Clear;
    frmObjekti.qTeritory.Params.Add;
    frmObjekti.qTeritory.Params[0].Name:='Ministry';
    frmObjekti.qTeritory.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
    frmObjekti.qTeritory.Open;
    if not frmObjekti.qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then
    begin
      frmObjektiEdit.aTeritoryUpdateExecute(sender);
      frmObjektiEdit.cbTeritory.SetFocus;
      exit;
    end;

    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    frmObjekti.qTeritory.Params.Clear;
    frmObjekti.qTeritory.Params.Add;
    frmObjekti.qTeritory.Params[0].Name:='Teritory';
    frmObjekti.qTeritory.Params[0].Value:=frmObjektiEdit.cbTeritory.Text;
    frmObjekti.qTeritory.Open;
    if not frmObjekti.qTeritory.Locate('RAJON',cbDistrict.Text,[]) then
    begin
      frmObjektiEdit.aDistrictUpdateExecute(sender);
      frmObjektiEdit.cbDistrict.SetFocus;
      exit;
    end;

    with frmObjekti do
    begin
      qObjekti.SQL.Clear;
      qObjekti.SQL.Text:='update  OBJEKTI set NAZVAOBJEKTA=:NazvaObjekta,ADRESAOBJEKTA=:AdresaObjekta,VIDOMCHAPIPORYDKOVANIST=:VidomchaPidporyadkovanist,';
      qObjekti.SQL.Text:=qObjekti.SQL.Text+'VIDDILENNY_BANKU=:ViddilennyBanku,KOD_DKPP=:KodDKPP,KOD_MFO=:KodMFO,ROZRAHUNKOVIJ_RAHUNOK=:RozahunkovijRahunok,TERITORY=:Teritory,RAJON=:District,MINISTRY=:Ministry ';
      qObjekti.SQL.Text:=qObjekti.SQL.Text+'where KODOBJEKTA=:KodObjekta';
      qObjekti.Params.Clear;
      qObjekti.Params.Add;
      qObjekti.Params[0].Name:='NazvaObjekta';
      qObjekti.Params[0].Value:=frmObjektiEdit.edtNazvaObjekta.Text;
      qObjekti.Params.Add;
      qObjekti.Params[1].Name:='AdresaObjekta';
      qObjekti.Params[1].Value:=frmObjektiEdit.edtAdresaObjekta.Text;
      qObjekti.Params.Add;
      qObjekti.Params[2].Name:='VidomchaPidporyadkovanist';
      qObjekti.Params[2].Value:=frmObjektiEdit.edtVidomchaPidporydkovanist.Text;
      qObjekti.Params.Add;
      qObjekti.Params[3].Name:='ViddilennyBanku';
      qObjekti.Params[3].Value:=frmObjektiEdit.edtViddilennyBanku.Text;
      qObjekti.Params.Add;
      qObjekti.Params[4].Name:='KodDKPP';
      qObjekti.Params[4].Value:=frmObjektiEdit.edtKod_DKPP.Text;
      qObjekti.Params.Add;
      qObjekti.Params[5].Name:='KodMFO';
      qObjekti.Params[5].Value:=frmObjektiEdit.edtKod_MFO.Text;
      qObjekti.Params.Add;
      qObjekti.Params[6].Name:='RozahunkovijRahunok';
      qObjekti.Params[6].Value:=frmObjektiEdit.edtRozrahunkovijRahunok.Text;
      qObjekti.Params.Add;
      qObjekti.Params[7].Name:='Teritory';
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Ministry';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
        frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.Locate('TERITORY',frmObjektiEdit.cbTeritory.Text,[]) then qObjekti.Params[7].Value:=frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value else qObjekti.Params[7].Value:=0;;
      qObjekti.Params.Add;
      qObjekti.Params[8].Name:='District';
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Teritory';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.cbTeritory.Text;
        frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.Locate('RAJON',frmObjektiEdit.cbDistrict.Text,[]) then qObjekti.Params[8].Value:=frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value else qObjekti.Params[8].Value:=0;
      qObjekti.Params.Add;
      qObjekti.Params[9].Name:='Ministry';
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Ministry';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
        frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.Locate('MINISTRY',frmObjektiEdit.cbMinistry.Text,[]) then qObjekti.Params[9].Value:=frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value else qObjekti.Params[9].Value:=0;
      qObjekti.Params.Add;
      qObjekti.Params[10].Name:='KodObjekta';
      qObjekti.Params[10].Value:=frmObjektiEdit.edtKodObjekta.Text;
      qObjekti.Open;
      frmMain.trAzz.CommitRetaining;
      frmObjektiEdit.Close;
      frmObjekti.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmObjektiEdit.Caption='Додати об''єкт нагляду' then
  begin
    if frmObjektiEdit.edtKodObjekta.Text='' then
    begin
      frmObjektiEdit.aKodUpdateExecute(sender);
      frmObjektiEdit.edtNazvaObjekta.SetFocus;
      exit;
    end;
    try
      StrToInt(frmObjektiEdit.edtKodObjekta.Text);
    except
      frmObjektiEdit.aKodUpdateExecute(sender);
      frmObjektiEdit.edtNazvaObjekta.SetFocus;
      exit;
    end;

    if frmObjektiEdit.cbMinistry.Text='' then
    begin
      frmObjektiEdit.aMinistryUpdateExecute(sender);
      frmObjektiEdit.cbMinistry.SetFocus;
      exit;
    end;

    if frmObjektiEdit.cbTeritory.Text='' then
    begin
      frmObjektiEdit.aTeritoryUpdateExecute(sender);
      frmObjektiEdit.cbTeritory.SetFocus;
      exit;
    end;

    if frmObjektiEdit.cbDistrict.Text='' then
    begin
      frmObjektiEdit.aDistrictUpdateExecute(sender);
      frmObjektiEdit.cbDistrict.SetFocus;
      exit;
    end;

    if frmObjektiEdit.edtNazvaObjekta.Text='' then
    begin
      frmObjektiEdit.edtNazvaObjekta.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtAdresaObjekta.Text='' then
    begin
      edtAdresaObjekta.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtViddilennyBanku.Text='' then
    begin
      frmObjektiEdit.edtViddilennyBanku.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtKod_DKPP.Text='' then
    begin
      frmObjektiEdit.edtKod_DKPP.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtKod_MFO.Text='' then
    begin
      frmObjektiEdit.edtKod_MFO.SetFocus;
      exit;
    end;
    if frmObjektiEdit.edtRozrahunkovijRahunok.Text='' then
    begin
      frmObjektiEdit.edtRozrahunkovijRahunok.SetFocus;
      exit;
    end;
    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    frmObjekti.qTeritory.Open;
    if not frmObjekti.qTeritory.Locate('MINISTRY',frmObjektiEdit.cbMinistry.Text,[]) then
    begin
      frmObjektiEdit.aMinistryUpdateExecute(sender);
      frmObjektiEdit.cbMinistry.SetFocus;
      exit;
    end;
    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    frmObjekti.qTeritory.Params.Clear;
    frmObjekti.qTeritory.Params.Add;
    frmObjekti.qTeritory.Params[0].Name:='Ministry';
    frmObjekti.qTeritory.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
    frmObjekti.qTeritory.Open;
    if not frmObjekti.qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then
    begin
      frmObjektiEdit.aTeritoryUpdateExecute(sender);
      frmObjektiEdit.cbTeritory.SetFocus;
      exit;
    end;

    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    frmObjekti.qTeritory.Params.Clear;
    frmObjekti.qTeritory.Params.Add;
    frmObjekti.qTeritory.Params[0].Name:='Teritory';
    frmObjekti.qTeritory.Params[0].Value:=frmObjektiEdit.cbTeritory.Text;
    frmObjekti.qTeritory.Open;
    if not frmObjekti.qTeritory.Locate('RAJON',cbDistrict.Text,[]) then
    begin
      frmObjektiEdit.aDistrictUpdateExecute(sender);
      frmObjektiEdit.cbDistrict.SetFocus;
      exit;
    end;

    with frmObjekti do
    begin
      qObjekti.SQL.Clear;
      qObjekti.SQL.Text:='update  OBJEKTI set NAZVAOBJEKTA=:NazvaObjekta,ADRESAOBJEKTA=:AdresaObjekta,VIDOMCHAPIPORYDKOVANIST=:VidomchaPidporyadkovanist,';
      qObjekti.SQL.Text:=qObjekti.SQL.Text+'VIDDILENNY_BANKU=:ViddilennyBanku,KOD_DKPP=:KodDKPP,KOD_MFO=:KodMFO,ROZRAHUNKOVIJ_RAHUNOK=:RozahunkovijRahunok,TERITORY=:Teritory,RAJON=:District,MINISTRY=:Ministry ';
      qObjekti.SQL.Text:=qObjekti.SQL.Text+'where KODOBJEKTA=:KodObjekta';
      qObjekti.Params.Clear;
      qObjekti.Params.Add;
      qObjekti.Params[0].Name:='NazvaObjekta';
      qObjekti.Params[0].Value:=frmObjektiEdit.edtNazvaObjekta.Text;
      qObjekti.Params.Add;
      qObjekti.Params[1].Name:='AdresaObjekta';
      qObjekti.Params[1].Value:=frmObjektiEdit.edtAdresaObjekta.Text;
      qObjekti.Params.Add;
      qObjekti.Params[2].Name:='VidomchaPidporyadkovanist';
      qObjekti.Params[2].Value:=frmObjektiEdit.edtVidomchaPidporydkovanist.Text;
      qObjekti.Params.Add;
      qObjekti.Params[3].Name:='ViddilennyBanku';
      qObjekti.Params[3].Value:=frmObjektiEdit.edtViddilennyBanku.Text;
      qObjekti.Params.Add;
      qObjekti.Params[4].Name:='KodDKPP';
      qObjekti.Params[4].Value:=frmObjektiEdit.edtKod_DKPP.Text;
      qObjekti.Params.Add;
      qObjekti.Params[5].Name:='KodMFO';
      qObjekti.Params[5].Value:=frmObjektiEdit.edtKod_MFO.Text;
      qObjekti.Params.Add;
      qObjekti.Params[6].Name:='RozahunkovijRahunok';
      qObjekti.Params[6].Value:=frmObjektiEdit.edtRozrahunkovijRahunok.Text;
      qObjekti.Params.Add;
      qObjekti.Params[7].Name:='Teritory';
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Ministry';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
        frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.Locate('TERITORY',frmObjektiEdit.cbTeritory.Text,[]) then qObjekti.Params[7].Value:=frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value else qObjekti.Params[7].Value:=0;;
      qObjekti.Params.Add;
      qObjekti.Params[8].Name:='District';
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Teritory';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.cbTeritory.Text;
        frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.Locate('RAJON',frmObjektiEdit.cbDistrict.Text,[]) then qObjekti.Params[8].Value:=frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value else qObjekti.Params[8].Value:=0;
      qObjekti.Params.Add;
      qObjekti.Params[9].Name:='Ministry';
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Ministry';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
        frmObjektiEdit.qSpivrobitniki.Open;
      if frmObjektiEdit.qSpivrobitniki.Locate('MINISTRY',frmObjektiEdit.cbMinistry.Text,[]) then qObjekti.Params[9].Value:=frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value else qObjekti.Params[9].Value:=0;
      qObjekti.Params.Add;
      qObjekti.Params[10].Name:='KodObjekta';
      qObjekti.Params[10].Value:=frmObjektiEdit.edtKodObjekta.Text;
      qObjekti.Open;
      frmMain.trAzz.CommitRetaining;
      frmObjektiEdit.Close;
      frmObjekti.aUpdateExecute(sender);
      exit;
    end;
  end;
end;

procedure TfrmObjektiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    edtFind_NazvaObjekta.Text:='';
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='insert into OBJEKTI (KODOBJEKTA) values (GEN_ID(GET_DICTIONARIES_RECORD_ID,1))';
    qObjekti.Open;
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='select * from OBJEKTI order by KODOBJEKTA';
    qObjekti.Open;
    qObjekti.Last;
    frmObjektiEdit.edtKodObjekta.Text:=IntToStr(qObjekti.FieldByName('KODOBJEKTA').Value);
  end;
end;

procedure TfrmObjektiEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  frmObjekti.qTeritory.SQL.Clear;
  frmObjekti.qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
  frmObjekti.qTeritory.Params.Clear;
  frmObjekti.qTeritory.Params.Add;
  frmObjekti.qTeritory.Params[0].Name:='Ministry';
  frmObjekti.qTeritory.Params[0].Value:=frmObjektiEdit.cbMinistry.Text;
  frmObjekti.qTeritory.Open;

  frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Items.Clear;
  frmObjekti.qTeritory.First;
  while not frmObjekti.qTeritory.Eof do
  begin
    frmObjektiEdit.cbTeritory.Items.Add(frmObjekti.qTeritory.FieldByName('TERITORY').Value);
    frmObjekti.qTeritory.Next;
  end;
  frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Items.Clear;
end;

procedure TfrmObjektiEdit.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmObjektiEdit do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='Teritory';
    qSpivrobitniki.Params[0].Value:=cbTeritory.Text;
    qSpivrobitniki.Open;
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    qSpivrobitniki.First;
    while not qSpivrobitniki.Eof do
    begin
      cbDistrict.Items.Add(qSpivrobitniki.FieldByName('RAJON').Value);
      qSpivrobitniki.Next;
    end;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmObjektiEdit.aDistrictUpdateExecute(Sender: TObject);
begin
  with frmObjektiEdit do
  begin
    frmObjekti.qTeritory.SQL.Clear;
    frmObjekti.qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    frmObjekti.qTeritory.Params.Clear;
    frmObjekti.qTeritory.Params.Add;
    frmObjekti.qTeritory.Params[0].Name:='Teritory';
    frmObjekti.qTeritory.Params[0].Value:=frmObjektiEdit.cbTeritory.Text;
    frmObjekti.qTeritory.Open;
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    frmObjekti.qTeritory.First;
    while not frmObjekti.qTeritory.Eof do
    begin
      cbDistrict.Items.Add(frmObjekti.qTeritory.FieldByName('RAJON').Value);
      frmObjekti.qTeritory.Next;
    end;
  end;
end;

procedure TfrmObjektiEdit.aVidomchaPidporydkovanistChangeExecute(
  Sender: TObject);
begin
  frmObjektiEdit.Enabled:=false;
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

procedure TfrmObjektiEdit.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmSotrudnikiObjektivEdit') then frmSotrudnikiObjektivEdit:=TfrmSotrudnikiObjektivEdit.Create(self);
  frmObjektiEdit.Enabled:=false;
  frmSotrudnikiObjektivEdit.Show;
  frmSotrudnikiObjektivEdit.Position:=poMainFormCenter;
  frmSotrudnikiObjektivEdit.BorderStyle:=bsDialog;
  frmSotrudnikiObjektivEdit.Caption:='Додавання співробітника';
  frmSotrudnikiObjektivEdit.edtKodObjekta.Text:=frmObjektiEdit.edtKodObjekta.Text;
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmSotrudnikiObjektivEdit.aKodUpdateExecute(sender);
  frmSotrudnikiObjektivEdit.edtKod.Enabled:=false;
  frmSotrudnikiObjektivEdit.btnKod.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtKodObjekta.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text:='';
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text:='';
  frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date:=int(Date);
  frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text:='';
  frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text:='';
  frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text:='';
  frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.SetFocus;
end;

procedure TfrmObjektiEdit.aEditExecute(Sender: TObject);
begin
  if frmObjektiEdit.qSpivrobitniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSotrudnikiObjektivEdit') then frmSotrudnikiObjektivEdit:=TfrmSotrudnikiObjektivEdit.Create(self);
  frmObjektiEdit.Enabled:=false;
  frmSotrudnikiObjektivEdit.Show;
  frmSotrudnikiObjektivEdit.Position:=poMainFormCenter;
  frmSotrudnikiObjektivEdit.BorderStyle:=bsDialog;
  frmSotrudnikiObjektivEdit.Caption:='Редагування співробітника';
  frmSotrudnikiObjektivEdit.edtKodObjekta.Text:=frmObjektiEdit.edtKodObjekta.Text;
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtKodObjekta.Enabled:=false;

  if not frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').IsNull then
    frmSotrudnikiObjektivEdit.edtKod.Text:=IntToStr(frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value) else frmSotrudnikiObjektivEdit.aKodUpdateExecute(sender);
  frmSotrudnikiObjektivEdit.edtKod.Enabled:=false;
  frmSotrudnikiObjektivEdit.btnKod.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date:=int(frmObjektiEdit.qSpivrobitniki.FieldByName('DATANARODZHENNYPORUSHNIKA').Value);
  frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('IDENTIFIKACIJNIJKODPORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('MISCENARODZHENNYPORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('MISCEPROZHIVANNYPORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Enabled:=true;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.SetFocus;
end;

procedure TfrmObjektiEdit.aDeleteExecute(Sender: TObject);
begin
  if frmObjektiEdit.qSpivrobitniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSotrudnikiObjektivEdit') then frmSotrudnikiObjektivEdit:=TfrmSotrudnikiObjektivEdit.Create(self);
  frmObjektiEdit.Enabled:=false;
  frmSotrudnikiObjektivEdit.Show;
  frmSotrudnikiObjektivEdit.Position:=poMainFormCenter;
  frmSotrudnikiObjektivEdit.BorderStyle:=bsDialog;
  frmSotrudnikiObjektivEdit.Caption:='Видалення співробітника';
  frmSotrudnikiObjektivEdit.edtKodObjekta.Text:=frmObjektiEdit.edtKodObjekta.Text;
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtKodObjekta.Enabled:=false;

  frmSotrudnikiObjektivEdit.edtKod.Text:=IntToStr(frmObjektiEdit.qSpivrobitniki.FieldByName('KOD').Value);
  frmSotrudnikiObjektivEdit.edtKod.Enabled:=false;
  frmSotrudnikiObjektivEdit.btnKod.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('PIB_PORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtPIBPorushnika.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('POSADA_PORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Enabled:=false;
  frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date:=int(frmObjektiEdit.qSpivrobitniki.FieldByName('DATANARODZHENNYPORUSHNIKA').Value);
  frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('IDENTIFIKACIJNIJKODPORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('MISCENARODZHENNYPORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Enabled:=false;
  frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text:=frmObjektiEdit.qSpivrobitniki.FieldByName('MISCEPROZHIVANNYPORUSHNIKA').Value;
  frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Enabled:=false;
  frmSotrudnikiObjektivEdit.btnVidminiti.SetFocus;
end;

procedure TfrmObjektiEdit.aUpdateExecute(Sender: TObject);
begin
  with frmObjektiEdit do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select * from SPIVROBITNIKI_OBJEKTIV where KOD_OBJEKTA=:KodObjekta order by PIB_PORUSHNIKA';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='KodObjekta';
    qSpivrobitniki.Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
    qSpivrobitniki.Open;
  end;
end;

procedure TfrmObjektiEdit.aMinistryUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmObjekti.qTeritory.SQL.Clear;
  frmObjekti.qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
  frmObjekti.qTeritory.Open;
  with frmObjektiEdit do
  begin
    cbMinistry.Text:='';
    cbMinistry.Items.Clear;
    frmObjekti.qTeritory.First;
  end;
  while not frmObjekti.qTeritory.Eof do
  begin
    frmObjektiEdit.cbMinistry.Items.Add(frmObjekti.qTeritory.FieldByName('MINISTRY').Value);
    frmObjekti.qTeritory.Next;
  end;
  frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Items.Clear;
  frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Items.Clear;
  INIAZZ.Free;
end;

procedure TfrmObjektiEdit.aMinistryChangeExecute(Sender: TObject);
begin
  with frmObjektiEdit do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='Ministry';
    qSpivrobitniki.Params[0].Value:=cbMinistry.Text;
    qSpivrobitniki.Open;
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    qSpivrobitniki.First;
    while not qSpivrobitniki.Eof do
    begin
      cbTeritory.Items.Add(qSpivrobitniki.FieldByName('TERITORY').Value);
      qSpivrobitniki.Next;
    end;
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    aUpdateExecute(sender);
  end;
end;

end.
