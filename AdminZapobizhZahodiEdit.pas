unit AdminZapobizhZahodiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls, Grids,
  DBGrids, ExtCtrls, ComCtrls, Controls, SysUtils, IniFiles, Dialogs;

type
  TfrmAdminZapobizhZahodiEdit = class(TForm)
    Label1: TLabel;
    edtRecordID: TEdit;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    Label2: TLabel;
    edtNomerPostanovi: TEdit;
    btnNomerPostanoviUpdate: TButton;
    Label3: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    alAdminZahodiEdit: TActionList;
    aNomerPostanoviUpdate: TAction;
    GroupBox1: TGroupBox;
    rgAkt_Raspiska: TRadioGroup;
    lblData_Z: TLabel;
    lblData_Do: TLabel;
    lblNomer: TLabel;
    dtpData_Z: TDateTimePicker;
    dtpData_Do: TDateTimePicker;
    edtNomer: TEdit;
    aAkt_Raspiska_Change: TAction;
    pcAdminZapobizhZahodi: TPageControl;
    tsVidomostiProObjekt: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNazvaObjektu: TEdit;
    edtAdresaObjektu: TEdit;
    edtVidomchaPidporydkovanist: TEdit;
    btnVidomchaPidporydkovanist: TButton;
    edtPIBKerivnika: TEdit;
    edtPosadaKerivnika: TEdit;
    btnObjekt: TButton;
    aVidomchaPidporydkovanistChoice: TAction;
    aObjektiChoice: TAction;
    tsLaboratornijKontrol: TTabSheet;
    Panel1: TPanel;
    btnAddLabKontrol: TButton;
    btnEditLabKontrol: TButton;
    btnDeleteLabKontrol: TButton;
    btnUpdateLabKontrol: TButton;
    DBGrid1: TDBGrid;
    aAddLabKontrol: TAction;
    aEditLabKontrol: TAction;
    aDeleteLabKontrol: TAction;
    aUpdateLabKontrol: TAction;
    dsLaboratornijKontrol: TDataSource;
    qLaboratornijKontrol: TIBQuery;
    qComboBoxes: TIBQuery;
    tsPostanoviv: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cbVidPostanovi: TComboBox;
    btnVidPostanovi_Update: TButton;
    btnVidPostanovi_Choice: TButton;
    edtNaimenovanieTovara: TEdit;
    edtKilkistTovaru: TEdit;
    edtVagaOdinici: TEdit;
    edtZagalnaVaga: TEdit;
    edtOtrimanogo: TEdit;
    aVidPostanovi_Update: TAction;
    aVidPostanovi_Choice: TAction;
    aVidPostanovi_Change: TAction;
    tsSutPorushenny: TTabSheet;
    GroupBox2: TGroupBox;
    memVstanoviv: TMemo;
    btnVstanoviv: TButton;
    GroupBox3: TGroupBox;
    memSchoEPorushennym: TMemo;
    btnSchoEPorushennym: TButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cbPostanoviv: TComboBox;
    btnPostanoviv_Update: TButton;
    btnPostanoviv_Choice: TButton;
    dtpZ_Data: TDateTimePicker;
    edtZ_Chas: TEdit;
    dtpDo_Data: TDateTimePicker;
    edtDo_Chas: TEdit;
    cbxPostijno: TCheckBox;
    cbxObmezhennyAsortimentu: TCheckBox;
    cbUmoviVidnovlenny: TComboBox;
    btnUmoviVidnovlenny_Update: TButton;
    btnUmoviVidnovlenny_Choice: TButton;
    aPostanoviv_Update: TAction;
    aPostanoviv_Choice: TAction;
    aPostijnoChange: TAction;
    aObmezhennyAsortimentuChange: TAction;
    aUmoviVidnovlenny_Update: TAction;
    aUmoviVidnovlenny_Choice: TAction;
    aVstanoviv_Update: TAction;
    aSchoEPorushennym_Choice: TAction;
    tsDodatkovo: TTabSheet;
    Label21: TLabel;
    cbPIBOsobiSES: TComboBox;
    btnPIBOsobiSES_Update: TButton;
    btnPIBOsobiSES_Choice: TButton;
    Label22: TLabel;
    cbPosadaOsobiSES: TComboBox;
    btnPosadaOsobiSES_Update: TButton;
    btnPosadaOsobiSES_Choice: TButton;
    GroupBox4: TGroupBox;
    dsNapravlenoDoVidoma: TDataSource;
    DBGrid2: TDBGrid;
    qNapravlenoDoVidoma: TIBQuery;
    Panel2: TPanel;
    btnAddNapravlenoDoVidoma: TButton;
    btnEditNapravlenoDoVidoma: TButton;
    btnDeleteNapravlenoDoVidoma: TButton;
    btnUpdateNapravlenoDoVidoma: TButton;
    Label23: TLabel;
    edtPrimitka: TEdit;
    Label24: TLabel;
    dtpInformaciyProVikonannyDo: TDateTimePicker;
    aPIBOsobiSES_Update: TAction;
    aPIBOsobiSES_Choice: TAction;
    aPosadaOsobiSES_Update: TAction;
    aPosadaOsobiSES_Choice: TAction;
    aAddNapravlenoDoVidoma: TAction;
    aEditNapravlenoDoVidoma: TAction;
    aDeleteNapravlenoDoVidoma: TAction;
    aUpdateNapravlenoDoVidoma: TAction;
    Label25: TLabel;
    cbRozdilT23F18: TComboBox;
    btnRozdilT23F18_Update: TButton;
    btnRozdilT23F18_Choice: TButton;
    aRozdilT23F18_Update: TAction;
    aRozdilT23F18_Choice: TAction;
    Label26: TLabel;
    cbTipPostanovi: TComboBox;
    btnTipPostanovi_Update: TButton;
    btnTipPostanovi_Choice: TButton;
    aTipPostanovi_Update: TAction;
    aTipPostanovi_Choice: TAction;
    Label27: TLabel;
    edtYear: TEdit;
    udYear: TUpDown;
    btnYear_Update: TButton;
    aYearUpdate: TAction;
    btnOK: TButton;
    btnCancel: TButton;
    aOK: TAction;
    aCancel: TAction;
    GroupBox5: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    edtPosada_GDSL: TEdit;
    edtPIB_GDSL: TEdit;
    btnGDSL: TButton;
    aGDSL_Update: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aNomerPostanoviUpdateExecute(Sender: TObject);
    procedure aAkt_Raspiska_ChangeExecute(Sender: TObject);
    procedure aVidomchaPidporydkovanistChoiceExecute(Sender: TObject);
    procedure aObjektiChoiceExecute(Sender: TObject);
    procedure aAddLabKontrolExecute(Sender: TObject);
    procedure aEditLabKontrolExecute(Sender: TObject);
    procedure aDeleteLabKontrolExecute(Sender: TObject);
    procedure aUpdateLabKontrolExecute(Sender: TObject);
    procedure aVidPostanovi_UpdateExecute(Sender: TObject);
    procedure aVidPostanovi_ChoiceExecute(Sender: TObject);
    procedure aVidPostanovi_ChangeExecute(Sender: TObject);
    procedure aVstanoviv_UpdateExecute(Sender: TObject);
    procedure aSchoEPorushennym_ChoiceExecute(Sender: TObject);
    procedure aPostanoviv_UpdateExecute(Sender: TObject);
    procedure aPostanoviv_ChoiceExecute(Sender: TObject);
    procedure aPostijnoChangeExecute(Sender: TObject);
    procedure aObmezhennyAsortimentuChangeExecute(Sender: TObject);
    procedure aUmoviVidnovlenny_UpdateExecute(Sender: TObject);
    procedure aUmoviVidnovlenny_ChoiceExecute(Sender: TObject);
    procedure aPIBOsobiSES_UpdateExecute(Sender: TObject);
    procedure aPIBOsobiSES_ChoiceExecute(Sender: TObject);
    procedure aPosadaOsobiSES_UpdateExecute(Sender: TObject);
    procedure aPosadaOsobiSES_ChoiceExecute(Sender: TObject);
    procedure aAddNapravlenoDoVidomaExecute(Sender: TObject);
    procedure aEditNapravlenoDoVidomaExecute(Sender: TObject);
    procedure aDeleteNapravlenoDoVidomaExecute(Sender: TObject);
    procedure aUpdateNapravlenoDoVidomaExecute(Sender: TObject);
    procedure aRozdilT23F18_UpdateExecute(Sender: TObject);
    procedure aRozdilT23F18_ChoiceExecute(Sender: TObject);
    procedure aTipPostanovi_UpdateExecute(Sender: TObject);
    procedure aTipPostanovi_ChoiceExecute(Sender: TObject);
    procedure aYearUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aGDSL_UpdateExecute(Sender: TObject);
    procedure dtpDataPostanoviExit(Sender: TObject);
  end;

var
  frmAdminZapobizhZahodiEdit: TfrmAdminZapobizhZahodiEdit;

implementation

uses
  Main, AdminZapobizhZahodi, VidomchaPidporydkovanist, Objekti,
  LaboratornijKontrol, Statti, VidObmezhen, Spivrobitniki, Posadi,
  NapravlenoDoVidoma, Rozdil_T23_F18, TipiShtrafiv, VidPostanovi,
  VizmatiVinnim, UmoviVidnovlenny;

{$R *.dfm}

procedure TfrmAdminZapobizhZahodiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
  with frmAdminZapobizhZahodi.qAdminZapobizhZahidi do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVA_ADMIN set EDITING=0 where RECORD_ID=:KOD';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmAdminZapobizhZahodiEdit.edtRecordID.Text);
    Open;
    frmMain.trAzz.CommitRetaining;
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Last;
  end;
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmAdminZapobizhZahodiEdit.aNomerPostanoviUpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.YEAR_=:Rik order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[0].Name:='District';
    qAdminZapobizhZahidi.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.Params[1].Name:='Rik';
    qAdminZapobizhZahidi.Params[1].Value:=frmAdminZapobizhZahodi.udYear.Position;
    qAdminZapobizhZahidi.Open;
    qAdminZapobizhZahidi.Last;
    edtNomerPostanovi.Text:=IntToStr(qAdminZapobizhZahidi.RecordCount+1);
    if qAdminZapobizhZahidi.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[]) then
      while qAdminZapobizhZahidi.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[]) do edtNomerPostanovi.Text:=IntToStr(StrToInt(edtNomerPostanovi.Text)+1);
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aAkt_Raspiska_ChangeExecute(
  Sender: TObject);
begin
  dtpData_Z.Date:=int(Date);
  dtpData_Do.Date:=int(Date);
  edtNomer.Text:='';
  case rgAkt_Raspiska.ItemIndex of
   -1:
      begin
        lblData_Z.Visible:=false;
        dtpData_Z.Visible:=false;
        lblData_Do.Visible:=false;
        dtpData_Do.Visible:=false;
        lblNomer.Visible:=false;
        edtNomer.Visible:=false;
      end;
    0:
      if frmAdminZapobizhZahodiEdit.Caption<>'Додавання постанови' then
      begin
        lblData_Z.Visible:=true;
        dtpData_Z.Visible:=true;
        if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then dtpData_Z.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value);
        lblData_Do.Visible:=false;
        dtpData_Do.Visible:=false;
        lblNomer.Visible:=false;
        edtNomer.Visible:=false;
      end
      else
      begin
        lblData_Z.Visible:=true;
        dtpData_Z.Visible:=true;
        dtpData_Z.Date:=int(date);
        lblData_Do.Visible:=false;
        dtpData_Do.Visible:=false;
        lblNomer.Visible:=false;
        edtNomer.Visible:=false;
      end;
    1:
      if frmAdminZapobizhZahodiEdit.Caption<>'Додавання постанови' then
      begin
        lblData_Z.Visible:=true;
        dtpData_Z.Visible:=true;
        if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then dtpData_Z.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value);
        lblData_Do.Visible:=false;
        dtpData_Do.Visible:=false;
        lblNomer.Visible:=true;
        edtNomer.Visible:=true;
        if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then edtNomer.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value;
      end
      else
      begin
        lblData_Z.Visible:=true;
        dtpData_Z.Visible:=true;
        dtpData_Z.Date:=int(date);
        lblData_Do.Visible:=false;
        dtpData_Do.Visible:=false;
        lblNomer.Visible:=true;
        edtNomer.Visible:=true;
        edtNomer.Text:='';
      end;
    2:
      if frmAdminZapobizhZahodiEdit.Caption<>'Додавання постанови' then
      begin
        lblData_Z.Visible:=true;
        dtpData_Z.Visible:=true;
        if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').IsNull then dtpData_Z.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU').Value);
        lblData_Do.Visible:=true;
        dtpData_Do.Visible:=true;
        if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_DO').IsNull then dtpData_Do.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_AKTU_DO').Value);
        lblNomer.Visible:=true;
        edtNomer.Visible:=true;
        if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').IsNull then edtNomer.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU').Value;
      end
      else
      begin
        lblData_Z.Visible:=true;
        dtpData_Z.Visible:=true;
        dtpData_Z.Date:=int(date);
        lblData_Do.Visible:=true;
        dtpData_Do.Visible:=true;
        dtpData_Do.Date:=int(date);
        lblNomer.Visible:=true;
        edtNomer.Visible:=true;
        edtNomer.Text:='';
      end
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aVidomchaPidporydkovanistChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aObjektiChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aAddLabKontrolExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  with frmLaboratornijKontrol do
  begin
    Caption:='Додати відомості про лабораторний контроль';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Show;
    edtKod.Text:='0';
    aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    edtNomerPostanovi.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date);
    dtpDataPostanovi.Enabled:=false;
    cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
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

procedure TfrmAdminZapobizhZahodiEdit.aEditLabKontrolExecute(
  Sender: TObject);
begin
  if frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  with frmLaboratornijKontrol do
  begin
    Caption:='Редагувати відомості про лабораторний контроль';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Show;
    edtKod.Text:='0';
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('KOD').Value) else aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value) else edtNomerPostanovi.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date);
    dtpDataPostanovi.Enabled:=false;

    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').IsNull then
    begin
      cbMinistry.Text:=frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').Value;
      qID.SQL.Clear;
      qID.SQL.Text:='select * from MINISTRY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbMinistry.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qID.FieldByName('MINISTRY').Value else cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    end
    else
      cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    cbMinistry.Enabled:=false;

    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('TERITORY').IsNull then
    begin
      cbTeritory.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('TERITORY').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from TERITORY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbTeritory.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qID.FieldByName('TERITORY').Value else cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    end
    else
      cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    cbTeritory.Enabled:=false;

    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').IsNull then
    begin
      cbDistrict.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from RAJONI where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbDistrict.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qID.FieldByName('RAJON').Value else cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    end
    else
      cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    cbDistrict.Enabled:=false;

    cbVidKontrolu.Text:='';
    cbVidKontrolu.Items.Clear;
    aVidKontrolu_UpdateExecute(sender);
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then cbVidKontrolu.Text:=frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else cbVidKontrolu.Text:='';
    cbVidKontrolu.Enabled:=true;
    btnVidKontrolu_Update.Enabled:=true;
    btnVidKontrolu_Choice.Enabled:=true;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then edtNomeriProb.Text:=frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else edtNomeriProb.Text:='';
    edtNomeriProb.Enabled:=true;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then dtpDataKontrolu.Date:=int(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else dtpDataKontrolu.Date:=int(date);
    dtpDataKontrolu.Enabled:=true;
    cbVidKontrolu.SetFocus;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aDeleteLabKontrolExecute(
  Sender: TObject);
begin
  if frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  with frmLaboratornijKontrol do
  begin
    Caption:='Видалити відомості про лабораторний контроль';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Show;
    edtKod.Text:='0';
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('KOD').Value) else aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value) else edtNomerPostanovi.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date);
    dtpDataPostanovi.Enabled:=false;

    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').IsNull then
    begin
      cbMinistry.Text:=frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('MINISTRY').Value;
      qID.SQL.Clear;
      qID.SQL.Text:='select * from MINISTRY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbMinistry.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qID.FieldByName('MINISTRY').Value else cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    end
    else
      cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    cbMinistry.Enabled:=false;

    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('TERITORY').IsNull then
    begin
      cbTeritory.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('TERITORY').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from TERITORY where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbTeritory.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qID.FieldByName('TERITORY').Value else cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    end
    else
      cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    cbTeritory.Enabled:=false;

    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').IsNull then
    begin
      cbDistrict.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DISTRICT').Value);
      qID.SQL.Clear;
      qID.SQL.Text:='select * from RAJONI where KOD=:Kod order by KOD';
      qID.Params.Clear;
      qID.Params.Add;
      qID.Params[0].Name:='Kod';
      qID.Params[0].Value:=cbDistrict.Text;
      qID.Open;
      if qID.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qID.FieldByName('RAJON').Value else cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    end
    else
      cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    cbDistrict.Enabled:=false;

    cbVidKontrolu.Text:='';
    cbVidKontrolu.Items.Clear;
    aVidKontrolu_UpdateExecute(sender);
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then cbVidKontrolu.Text:=frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else cbVidKontrolu.Text:='';
    cbVidKontrolu.Enabled:=false;
    btnVidKontrolu_Update.Enabled:=false;
    btnVidKontrolu_Choice.Enabled:=false;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then edtNomeriProb.Text:=frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else edtNomeriProb.Text:='';
    edtNomeriProb.Enabled:=false;
    if not frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then dtpDataKontrolu.Date:=int(frmAdminZapobizhZahodiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else dtpDataKontrolu.Date:=int(date);
    dtpDataKontrolu.Enabled:=false;
    btnVidminiti.SetFocus;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('MINISTRY',frmAdminZapobizhZahodiEdit.cbMinistry.Text,[]) then Ministry:=qLaboratornijKontrol.FieldByName('KOD').Value else Ministry:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.TERITORY=:Teritory order by TERITORY.KOD';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('TERITORY',frmAdminZapobizhZahodiEdit.cbTeritory.Text,[]) then Teritory:=qLaboratornijKontrol.FieldByName('KOD').Value else Teritory:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.RAJON=:Rajon order by RAJONI.KOD';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Teritory';
    qLaboratornijKontrol.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Rajon';
    qLaboratornijKontrol.Params[1].Value:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('RAJON',frmAdminZapobizhZahodiEdit.cbDistrict.Text,[]) then District:=qLaboratornijKontrol.FieldByName('KOD').Value else District:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:shtrafi';
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
    qLaboratornijKontrol.Params[5].Name:='shtrafi';
    qLaboratornijKontrol.Params[5].Value:='admin';
    qLaboratornijKontrol.Open;

    qNapravlenoDoVidoma.SQL.Clear;
    qNapravlenoDoVidoma.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi and VIDNOVLENNY=:Vidnovlenny';
    qNapravlenoDoVidoma.Params.Clear;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[0].Name:='Ministry';
    qNapravlenoDoVidoma.Params[0].Value:=Ministry;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[1].Name:='Teritory';
    qNapravlenoDoVidoma.Params[1].Value:=Teritory;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[2].Name:='Rajon';
    qNapravlenoDoVidoma.Params[2].Value:=District;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[3].Name:='NomerPostanovi';
    qNapravlenoDoVidoma.Params[3].Value:=edtNomerPostanovi.Text;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[4].Name:='DataPostanovi';
    qNapravlenoDoVidoma.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[5].Name:='Vidnovlenny';
    qNapravlenoDoVidoma.Params[5].Value:='postanova';
    qNapravlenoDoVidoma.Open;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aVidPostanovi_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from VIDPOSTANOVI order by VIDPOSTANOVI';
    qComboBoxes.Open;
    cbVidPostanovi.Text:='';
    cbVidPostanovi.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbVidPostanovi.Items.Add(qComboBoxes.FieldByName('VIDPOSTANOVI').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aVidPostanovi_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  frmMain.aVidPostanoviExecute(sender);
  frmVidPostanovi.aChoice.Enabled:=true;
  frmVidPostanovi.Left:=frmMain.Left+70;
  frmVidPostanovi.Top:=frmMain.Top+70;
  frmVidPostanovi.Width:=frmMain.Width-70;
  frmVidPostanovi.Height:=frmMain.Height-70;
  frmVidPostanovi.Position:=poMainFormCenter;
  frmVidPostanovi.FormStyle:=fsNormal;
  frmVidPostanovi.BorderStyle:=bsDialog;
end;

procedure TfrmAdminZapobizhZahodiEdit.aVidPostanovi_ChangeExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from VIDPOSTANOVI where VIDPOSTANOVI=:VidPostanovi order by VIDPOSTANOVI';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='VidPostanovi';
    qComboBoxes.Params[0].Value:=cbVidPostanovi.Text;
    qComboBoxes.Open;
    if qComboBoxes.Locate('VIDPOSTANOVI',cbVidPostanovi.Text,[]) then
    begin
      if not qComboBoxes.FieldByName('NAJMENUVANNYTOVARU').IsNull then
      begin
        case qComboBoxes.FieldByName('NAJMENUVANNYTOVARU').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Text:='';
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=false;
      if not qComboBoxes.FieldByName('KILKIST').IsNull then
      begin
        case qComboBoxes.FieldByName('KILKIST').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Text:='';
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=false;
      if not qComboBoxes.FieldByName('VAGAODINICI').IsNull then
      begin
        case qComboBoxes.FieldByName('VAGAODINICI').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Text:='';
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=false;
      if not qComboBoxes.FieldByName('ZAGALNAVAGA').IsNull then
      begin
        case qComboBoxes.FieldByName('ZAGALNAVAGA').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Text:='';
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=false;
      if not qComboBoxes.FieldByName('OTRIMANOGO').IsNull then
      begin
        case qComboBoxes.FieldByName('OTRIMANOGO').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Text:='';
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=false;
    end
    else
    begin
      frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=false;
      frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=false;
      frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=false;
      frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=false;
      frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=false;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aVstanoviv_UpdateExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aSchoEPorushennym_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aPostanoviv_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from VIDOBMEZHEN order by VIDOBMEZHENNY';
    qComboBoxes.Open;
    cbPostanoviv.Text:='';
    cbPostanoviv.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbPostanoviv.Items.Add(qComboBoxes.FieldByName('VIDOBMEZHENNY').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aPostanoviv_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  frmMain.aVidObmezhenExecute(sender);
  frmVidObmezhen.aChoice.Enabled:=true;
  frmVidObmezhen.Left:=frmMain.Left+70;
  frmVidObmezhen.Top:=frmMain.Top+70;
  frmVidObmezhen.Width:=frmMain.Width-70;
  frmVidObmezhen.Height:=frmMain.Height-70;
  frmVidObmezhen.Position:=poMainFormCenter;
  frmVidObmezhen.FormStyle:=fsNormal;
  frmVidObmezhen.BorderStyle:=bsDialog;
end;

procedure TfrmAdminZapobizhZahodiEdit.aPostijnoChangeExecute(
  Sender: TObject);
begin
  if frmAdminZapobizhZahodiEdit.cbxPostijno.Checked then
  begin
    frmAdminZapobizhZahodiEdit.dtpZ_Data.Enabled:=true;
    frmAdminZapobizhZahodiEdit.edtZ_Chas.Enabled:=true;
    frmAdminZapobizhZahodiEdit.cbxPostijno.Enabled:=true;
    frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Enabled:=false;
    frmAdminZapobizhZahodiEdit.dtpDo_Data.Enabled:=false;
    frmAdminZapobizhZahodiEdit.edtDo_Chas.Enabled:=false;
    frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Enabled:=false;
    frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Update.Enabled:=false;
    frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Choice.Enabled:=false;
  end
  else
  begin
    frmAdminZapobizhZahodiEdit.dtpZ_Data.Enabled:=true;
    frmAdminZapobizhZahodiEdit.edtZ_Chas.Enabled:=true;
    frmAdminZapobizhZahodiEdit.cbxPostijno.Enabled:=true;
    frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Enabled:=true;
    frmAdminZapobizhZahodiEdit.dtpDo_Data.Enabled:=true;
    if frmAdminZapobizhZahodiEdit.Caption<>'Додавання постанови' then
    begin
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_DATA').IsNull then frmAdminZapobizhZahodiEdit.dtpDo_Data.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_DATA').Value) else frmAdminZapobizhZahodiEdit.dtpDo_Data.Date:=int(date);
      frmAdminZapobizhZahodiEdit.edtDo_Chas.Enabled:=true;
      if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value<>'') then frmAdminZapobizhZahodiEdit.edtDo_Chas.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value else frmAdminZapobizhZahodiEdit.edtDo_Chas.Text:='';
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Enabled:=true;
      if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value<>'') then frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value else frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:='';
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Update.Enabled:=true;
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Choice.Enabled:=true;
    end
    else
    begin
      frmAdminZapobizhZahodiEdit.dtpDo_Data.Date:=int(date);
      frmAdminZapobizhZahodiEdit.edtDo_Chas.Enabled:=true;
      frmAdminZapobizhZahodiEdit.edtDo_Chas.Text:='';
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Enabled:=true;
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:='';
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Update.Enabled:=true;
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Choice.Enabled:=true;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aObmezhennyAsortimentuChangeExecute(
  Sender: TObject);
begin
  if frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Checked then
  begin
    frmAdminZapobizhZahodiEdit.dtpZ_Data.Enabled:=true;
    frmAdminZapobizhZahodiEdit.edtZ_Chas.Enabled:=true;
    frmAdminZapobizhZahodiEdit.cbxPostijno.Enabled:=false;
    frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Enabled:=true;
    frmAdminZapobizhZahodiEdit.dtpDo_Data.Enabled:=false;
    frmAdminZapobizhZahodiEdit.edtDo_Chas.Enabled:=false;
    frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Enabled:=true;
    frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Update.Enabled:=true;
    frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Choice.Enabled:=true;
  end
  else
  begin
    if frmAdminZapobizhZahodiEdit.Caption<>'Додавання постанови' then
    begin
      frmAdminZapobizhZahodiEdit.dtpZ_Data.Enabled:=true;
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').IsNull then frmAdminZapobizhZahodiEdit.dtpZ_Data.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_DATA').Value) else frmAdminZapobizhZahodiEdit.dtpZ_Data.Date:=int(date);
      frmAdminZapobizhZahodiEdit.edtZ_Chas.Enabled:=true;
      if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value<>'') then frmAdminZapobizhZahodiEdit.edtZ_Chas.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('Z_CHASU').Value else frmAdminZapobizhZahodiEdit.edtZ_Chas.Text:='';
      frmAdminZapobizhZahodiEdit.cbxPostijno.Enabled:=true;
      if frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('POSTIJNO').Value=1 then frmAdminZapobizhZahodiEdit.cbxPostijno.Checked:=true else frmAdminZapobizhZahodiEdit.cbxPostijno.Checked:=false;
      frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Enabled:=true;
      frmAdminZapobizhZahodiEdit.dtpDo_Data.Enabled:=true;
      if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_DATA').IsNull then frmAdminZapobizhZahodiEdit.dtpDo_Data.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_DATA').Value) else frmAdminZapobizhZahodiEdit.dtpDo_Data.Date:=int(date);
      frmAdminZapobizhZahodiEdit.edtDo_Chas.Enabled:=true;
      if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value<>'') then frmAdminZapobizhZahodiEdit.edtDo_Chas.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DO_CHASU').Value else frmAdminZapobizhZahodiEdit.edtDo_Chas.Text:='';
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Enabled:=true;
      if (not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull)and(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value<>'') then frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value else frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:='';
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Update.Enabled:=true;
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Choice.Enabled:=true;
    end
    else
    begin
      frmAdminZapobizhZahodiEdit.dtpZ_Data.Enabled:=true;
      frmAdminZapobizhZahodiEdit.dtpZ_Data.Date:=int(date);
      frmAdminZapobizhZahodiEdit.edtZ_Chas.Enabled:=true;
      frmAdminZapobizhZahodiEdit.edtZ_Chas.Text:='';
      frmAdminZapobizhZahodiEdit.cbxPostijno.Enabled:=true;
      frmAdminZapobizhZahodiEdit.cbxPostijno.Checked:=false;
      frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Enabled:=true;
      frmAdminZapobizhZahodiEdit.dtpDo_Data.Enabled:=true;
      frmAdminZapobizhZahodiEdit.dtpDo_Data.Date:=int(date);
      frmAdminZapobizhZahodiEdit.edtDo_Chas.Enabled:=true;
      frmAdminZapobizhZahodiEdit.edtDo_Chas.Text:='';
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Enabled:=true;
      frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text:='';
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Update.Enabled:=true;
      frmAdminZapobizhZahodiEdit.btnUmoviVidnovlenny_Choice.Enabled:=true;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aUmoviVidnovlenny_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from UMOVI_VIDNOVLENNY order by UMOVA_VIDNOVLENNY';
    qComboBoxes.Open;
    cbUmoviVidnovlenny.Text:='';
    cbUmoviVidnovlenny.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbUmoviVidnovlenny.Items.Add(qComboBoxes.FieldByName('UMOVA_VIDNOVLENNY').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aUmoviVidnovlenny_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  frmMain.aUmoviVidnovlennyExecute(sender);
  frmUmoviVidnovlenny.aChoice.Enabled:=true;
  frmUmoviVidnovlenny.Left:=frmMain.Left+70;
  frmUmoviVidnovlenny.Top:=frmMain.Top+70;
  frmUmoviVidnovlenny.Width:=frmMain.Width-70;
  frmUmoviVidnovlenny.Height:=frmMain.Height-70;
  frmUmoviVidnovlenny.Position:=poMainFormCenter;
  frmUmoviVidnovlenny.FormStyle:=fsNormal;
  frmUmoviVidnovlenny.BorderStyle:=bsDialog;
end;

procedure TfrmAdminZapobizhZahodiEdit.aPIBOsobiSES_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD order by SPIVROBITNIKI.PRIZVISXHE';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='District';
    qComboBoxes.Params[0].Value:=cbDistrict.Text;
    qComboBoxes.Open;
    cbPIBOsobiSES.Text:='';
    cbPIBOsobiSES.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbPIBOsobiSES.Items.Add(qComboBoxes.FieldByName('PRIZVISXHE').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aPIBOsobiSES_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aPosadaOsobiSES_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON=:District and POSADI.RAJON=RAJONI.KOD order by NAZVAPOSADI';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='District';
    qComboBoxes.Params[0].Value:=cbDistrict.Text;
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

procedure TfrmAdminZapobizhZahodiEdit.aPosadaOsobiSES_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aAddNapravlenoDoVidomaExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Додавання направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbMinistry.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  
  frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;

  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=true;
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=true;
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=true;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmAdminZapobizhZahodiEdit.aEditNapravlenoDoVidomaExecute(
  Sender: TObject);
begin
  if frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Зміна направлення';
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbMinistry.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  

  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').IsNull then frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').Value) else frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').IsNull then frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').Value) else frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('KOD').IsNull then frmNapravlenoDoVidoma.edtKod.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('KOD').Value) else frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;

  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('PIB').IsNull then frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('PIB').Value else frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=true;

  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('POSADA').IsNull then frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('POSADA').Value else frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=true;

  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').IsNull then frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').Value) else frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=true;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmAdminZapobizhZahodiEdit.aDeleteNapravlenoDoVidomaExecute(
  Sender: TObject);
begin
  if frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Видалення направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbMinistry.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  

  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').IsNull then frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').Value) else frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').IsNull then frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').Value) else frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('KOD').IsNull then frmNapravlenoDoVidoma.edtKod.Text:=IntToStr(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('KOD').Value) else frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;

  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('PIB').IsNull then frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('PIB').Value else frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=false;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=false;

  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('POSADA').IsNull then frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('POSADA').Value else frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=false;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=false;

  if not frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').IsNull then frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').Value) else frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=false;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnVidminiti.SetFocus;
end;

procedure TfrmAdminZapobizhZahodiEdit.aUpdateNapravlenoDoVidomaExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('MINISTRY',frmAdminZapobizhZahodiEdit.cbMinistry.Text,[]) then Ministry:=qLaboratornijKontrol.FieldByName('KOD').Value else Ministry:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.TERITORY=:Teritory order by TERITORY.KOD';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('TERITORY',frmAdminZapobizhZahodiEdit.cbTeritory.Text,[]) then Teritory:=qLaboratornijKontrol.FieldByName('KOD').Value else Teritory:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.RAJON=:Rajon order by RAJONI.KOD';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Teritory';
    qLaboratornijKontrol.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Rajon';
    qLaboratornijKontrol.Params[1].Value:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('RAJON',frmAdminZapobizhZahodiEdit.cbDistrict.Text,[]) then District:=qLaboratornijKontrol.FieldByName('KOD').Value else District:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:shtrafi';
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
    qLaboratornijKontrol.Params[5].Name:='shtrafi';
    qLaboratornijKontrol.Params[5].Value:='admin';
    qLaboratornijKontrol.Open;

    qNapravlenoDoVidoma.SQL.Clear;
    qNapravlenoDoVidoma.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi and VIDNOVLENNY=:Vidnovlenny';
    qNapravlenoDoVidoma.Params.Clear;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[0].Name:='Ministry';
    qNapravlenoDoVidoma.Params[0].Value:=Ministry;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[1].Name:='Teritory';
    qNapravlenoDoVidoma.Params[1].Value:=Teritory;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[2].Name:='Rajon';
    qNapravlenoDoVidoma.Params[2].Value:=District;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[3].Name:='NomerPostanovi';
    qNapravlenoDoVidoma.Params[3].Value:=edtNomerPostanovi.Text;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[4].Name:='DataPostanovi';
    qNapravlenoDoVidoma.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[5].Name:='Vidnovlenny';
    qNapravlenoDoVidoma.Params[5].Value:='postanova';
    qNapravlenoDoVidoma.Open;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aRozdilT23F18_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qComboBoxes.Open;
    cbRozdilT23F18.Text:='';
    cbRozdilT23F18.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbRozdilT23F18.Items.Add(qComboBoxes.FieldByName('OBJEKTNAGLYDU').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aRozdilT23F18_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aTipPostanovi_UpdateExecute(
  Sender: TObject);
begin
  with frmAdminZapobizhZahodiEdit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qComboBoxes.Open;
    cbTipPostanovi.Text:='';
    cbTipPostanovi.Items.Clear;
    qComboBoxes.First;
    while not qComboBoxes.Eof do
    begin
      cbTipPostanovi.Items.Add(qComboBoxes.FieldByName('TIPSHTRAFU').Value);
      qComboBoxes.Next;
    end;
  end;
end;

procedure TfrmAdminZapobizhZahodiEdit.aTipPostanovi_ChoiceExecute(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Enabled:=false;
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

procedure TfrmAdminZapobizhZahodiEdit.aYearUpdateExecute(Sender: TObject);
begin
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
    udYear.Position:=INIAZZ.ReadInteger('System','Year',udYear.Position);
    edtYear.Text:=IntToStr(udYear.Position);
    INIAZZ.Free;
end;

procedure TfrmAdminZapobizhZahodiEdit.aOKExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
  y: integer;
begin
 //Видалення постанови
  if frmAdminZapobizhZahodiEdit.Caption='Видалення постанови' then
  begin
    if MessageDlg('Увага!!!'+#13+'Ви намагаєтесь видалити запис!!!'+#13+'Відновлення цього запису буде неможливе!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmAdminZapobizhZahodi do
      begin
        qAdminZapobizhZahidi.SQL.Clear;
        qAdminZapobizhZahidi.SQL.Text:='delete from POSTANOVA_ADMIN where RECORD_ID=:RecordID';
        qAdminZapobizhZahidi.Params.Clear;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[0].Name:='RecordID';
        qAdminZapobizhZahidi.Params[0].Value:=frmAdminZapobizhZahodiEdit.edtRecordID.Text;
        qAdminZapobizhZahidi.Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmAdminZapobizhZahodiEdit.Close;
      frmAdminZapobizhZahodi.aUpdateExecute(sender);
      exit;
    end;
  end;  //Видалення постанови

  //Редагування постанови
  if frmAdminZapobizhZahodiEdit.Caption='Редагування постанови' then
  begin
    //загальні відомості про постанову
    if edtRecordID.Text='' then
    begin
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='insert into POSTANOVA_ADMIN (RECORD_ID) values (gen_id(GET_ADMIN_RECORD_ID,1))';
      qComboBoxes.Open;
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from POSTANOVA_ADMIN order by RECORD_ID';
      qComboBoxes.Open;
      qComboBoxes.Last;
      edtRecordID.Text:=IntToStr(qComboBoxes.FieldByName('RECORD_ID').Value);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt64(edtRecordID.Text);
    except
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='insert into POSTANOVA_ADMIN (RECORD_ID) values (gen_id(GET_ADMIN_RECORD_ID,1))';
      qComboBoxes.Open;
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from POSTANOVA_ADMIN order by RECORD_ID';
      qComboBoxes.Open;
      qComboBoxes.Last;
      edtRecordID.Text:=IntToStr(qComboBoxes.FieldByName('RECORD_ID').Value);
      edtNomerPostanovi.SetFocus;
      exit;
    end;

    if cbMinistry.Text='' then
    begin
      cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qComboBoxes.Open;
    if not qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then
    begin
      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
      INIAZZ.Free;
      if not qComboBoxes.Locate('KOD',StrToInt(cbMinistry.Text),[]) then
      begin
        MessageDlg('УВАГА!'+#13+'В налаштуваннях не вказано териториальне розташування організації або не заповнені довідники!!!'+#13+'Перевірте всі налаштуваня програми та повторіть введення відомостей знову!',mtError,[mbOK],0);
        frmAdminZapobizhZahodiEdit.Close;
        exit;
      end
    end
    else
      Ministry:=qComboBoxes.FieldByName('KOD').Value;

    if cbTeritory.Text='' then
    begin
      cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry order by TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Open;
    if not qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then
    begin
      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
      INIAZZ.Free;
      if not qComboBoxes.Locate('KOD',StrToInt(cbTeritory.Text),[]) then
      begin
        MessageDlg('УВАГА!'+#13+'В налаштуваннях не вказано териториальне розташування організації або не заповнені довідники!!!'+#13+'Перевірте всі налаштуваня програми та повторіть введення відомостей знову!',mtError,[mbOK],0);
        frmAdminZapobizhZahodiEdit.Close;
        exit;
      end;
    end
    else
      Teritory:=qComboBoxes.FieldByName('KOD').Value;

    if cbDistrict.Text='' then
    begin
      cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI where TERITORY=:Teritory order by RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Teritory';
    qComboBoxes.Params[0].Value:=Teritory;
    qComboBoxes.Open;
    if not qComboBoxes.Locate('RAJON',cbDistrict.Text,[]) then
    begin
      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      cbDistrict.Text:=INIAZZ.ReadString('Teritory','District',cbDistrict.Text);
      INIAZZ.Free;
      if not qComboBoxes.Locate('KOD',StrToInt(cbDistrict.Text),[]) then
      begin
        MessageDlg('УВАГА!'+#13+'В налаштуваннях не вказано териториальне розташування організації або не заповнені довідники!!!'+#13+'Перевірте всі налаштуваня програми та повторіть введення відомостей знову!',mtError,[mbOK],0);
        frmAdminZapobizhZahodiEdit.Close;
        exit;
      end;
    end
    else
      District:=qComboBoxes.FieldByName('KOD').Value;

    if edtNomerPostanovi.Text='' then
    begin
      aNomerPostanoviUpdateExecute(sender);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(edtNomerPostanovi.Text);
    except
      aNomerPostanoviUpdateExecute(sender);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    if int(dtpDataPostanovi.Date)>int(date) then
    begin
      dtpDataPostanovi.Date:=int(date);
      dtpDataPostanovi.SetFocus;
      exit;
    end;

    if rgAkt_Raspiska.ItemIndex=-1 then
      case rgAkt_Raspiska.ItemIndex of
       -1:
          begin
            rgAkt_Raspiska.ItemIndex:=0;
            aAkt_Raspiska_ChangeExecute(sender);
            dtpData_Z.SetFocus;
            exit;
          end;
        0:
          begin
            if int(dtpData_Z.Date)>int(date) then
            begin
              dtpData_Z.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
          end;
        1:
          begin
            if int(dtpData_Z.Date)>int(date) then
            begin
              dtpData_Z.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
            if edtNomer.Text='' then
            begin
              edtNomer.SetFocus;
              exit;
            end;
          end;
        2:
          begin
            if int(dtpData_Z.Date)>int(date) then
            begin
              dtpData_Z.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
            if int(dtpData_Do.Date)>int(date) then
            begin
              dtpData_Do.Date:=int(date);
              dtpData_Do.SetFocus;
              exit;
            end;
            if int(dtpData_Z.Date)>int(dtpData_Do.Date) then
            begin
              dtpData_Z.Date:=int(Date);
              dtpData_Do.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
            if edtNomer.Text='' then
            begin
              edtNomer.SetFocus;
              exit;
            end;
          end;
      end;

    //відомості про об"єкт
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    if edtNazvaObjektu.Text='' then
    begin
      edtNazvaObjektu.SetFocus;
      exit;
    end;
    if edtAdresaObjektu.Text='' then
    begin
      edtAdresaObjektu.SetFocus;
      exit;
    end;
    if edtPIBKerivnika.Text='' then
    begin
      edtPIBKerivnika.SetFocus;
      exit;
    end;
    if edtPosadaKerivnika.Text='' then
    begin
      edtPosadaKerivnika.SetFocus;
      exit;
    end;
    if cbRozdilT23F18.Text='' then
    begin
      aRozdilT23F18_UpdateExecute(sender);
      cbRozdilT23F18.SetFocus;
      exit;
    end;
    if cbTipPostanovi.Text='' then
    begin
      aTipPostanovi_UpdateExecute(sender);
      cbTipPostanovi.SetFocus;
      exit;
    end;
    if edtYear.Text='' then
    begin
      aYearUpdateExecute(sender);
      edtYear.SetFocus;
      exit;
    end;
    try
      StrToInt(edtYear.Text);
    except
      aYearUpdateExecute(sender);
      edtYear.SetFocus;
      exit;
    end;
    y:=0;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    y:=INIAZZ.ReadInteger('System','Year',y);
    INIAZZ.Free;
    if StrToInt(edtYear.Text)<>y then
    begin
      aYearUpdateExecute(sender);
      edtYear.SetFocus;
      exit;
    end;

    //постановив
    frmAdminZapobizhZahodiEdit.pcAdminZapobizhZahodi.ActivePage:=frmAdminZapobizhZahodiEdit.tsPostanoviv;
    if cbVidPostanovi.Text='' then
    begin
      aVidPostanovi_UpdateExecute(sender);
      aVidPostanovi_ChangeExecute(sender);
      cbVidPostanovi.SetFocus;
      exit;
    end;

    //суть порушення
    pcAdminZapobizhZahodi.ActivePage:=tsSutPorushenny;
    if memVstanoviv.Lines.Count<=0 then
    begin
      memVstanoviv.SetFocus;
      exit;
    end;
    if memVstanoviv.Text='' then
    begin
      memVstanoviv.SetFocus;
      exit;
    end;
    if memSchoEPorushennym.Lines.Count<=0 then
    begin
      memSchoEPorushennym.SetFocus;
      exit;
    end;
    if memSchoEPorushennym.Text='' then
    begin
      memSchoEPorushennym.SetFocus;
      exit;
    end;
    if cbPostanoviv.Text='' then
    begin
      aPostanoviv_UpdateExecute(sender);
      cbPostanoviv.SetFocus;
      exit;
    end;
    if not cbxObmezhennyAsortimentu.Checked then
    begin
      if edtZ_Chas.Text='' then
      begin
        edtZ_Chas.SetFocus;
        exit;
      end;
      if not cbxPostijno.Checked then
        if edtDo_Chas.Text='' then
        begin
          edtDo_Chas.SetFocus;
          exit;
        end;
    end;

    //додатково
    pcAdminZapobizhZahodi.ActivePage:=tsDodatkovo;
    if cbPIBOsobiSES.Text='' then
    begin
      aPIBOsobiSES_UpdateExecute(sender);
      cbPIBOsobiSES.SetFocus;
      exit;
    end;
    if cbPosadaOsobiSES.Text='' then
    begin
      aPosadaOsobiSES_UpdateExecute(sender);
      cbPosadaOsobiSES.SetFocus;
      exit;
    end;

    if edtPosada_GDSL.Text='' then
    begin
      aGDSL_UpdateExecute(sender);
      edtPosada_GDSL.SetFocus;
      exit;
    end;
    if edtPIB_GDSL.Text='' then
    begin
      aGDSL_UpdateExecute(sender);
      edtPIB_GDSL.SetFocus;
      exit;
    end;

    //запис до БД
    with frmAdminZapobizhZahodi do
    begin
      qAdminZapobizhZahidi.SQL.Clear;
      qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'MINISTRY=:Ministry,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'TERITORY=:Teritory,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DISTRICT=:District,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_POSTANOVI=:DataPostanovi,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NAZVA_OBJEKTU=:NazvaObjektu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ADRESA_OBJEKTU=:AdresaObjektu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VIDOMCHA_PIDPORYDKOVANIST=:VidomchaPidporydkovanist,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PIB_KERIVNIKA=:PIBKerivnika,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSADA_KERIVNIKA=:PosadaKerivnika,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ROZDIL_F18_T23=:RozdilF18T23,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'TIPSHTRAFIV=:TipShtrafiv,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'YEAR_=:Rik,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VSTANOVIV=:Vstanoviv,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'SCHO_E_PORUSHENNYM=:SchoEPorushennym,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSTANOVIV=:Postanoviv,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PIB_OSOBI_SES=:PIBOsobiSES,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSADA_OSOBI_SES=:PosadaOsobiSES,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PRIMITKA=:Primitka,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VIKONANNY_DO=:VikonannyDo,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSADA_GDSL=:PosadaGDSL,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PIB_GDSL=:PIBGDSL,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ZAPISKA_AKT=:Zapiska,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_AKTU=:DataAktu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NOMER_AKTU=:NomerAktu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_AKTU_DO=:DataAktuDo,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSTIJNO=:Postijno,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'Z_DATA=:Z_Dati,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'Z_CHASU=:Z_Chasu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DO_DATA=:Do_Dati,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DO_CHASU=:Do_Chasu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'UMOVIVIDNOVLENNY=:UmoviVidnovlenny,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'OBMEZHENNY_ASORTIMENTU=:ObmezhennyAsortimentu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VID_POSTANOVI=:VidPostanovi,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NAJMENUVANNY_TOVARU=:NajmenuvannyTovaru,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'KILKIST_TOVARU=:KilkistTovaru,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VAGA_ODINICI=:VagaOdinici,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ZAGALNA_VAGA=:ZagalnaVaga,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'OTRIMANOGO_VID=:OtrimanogoVid,EDITING=0';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'where RECORD_ID=:Kod';

      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='District';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='NomerPostanovi';
      qAdminZapobizhZahidi.Params[3].Value:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='DataPostanovi';
      qAdminZapobizhZahidi.Params[4].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date));
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[5].Name:='NazvaObjektu';
      qAdminZapobizhZahidi.Params[5].Value:=frmAdminZapobizhZahodiEdit.edtNazvaObjektu.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[6].Name:='AdresaObjektu';
      qAdminZapobizhZahidi.Params[6].Value:=frmAdminZapobizhZahodiEdit.edtAdresaObjektu.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[7].Name:='VidomchaPidporydkovanist';
      qAdminZapobizhZahidi.Params[7].Value:=frmAdminZapobizhZahodiEdit.edtVidomchaPidporydkovanist.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[8].Name:='PIBKerivnika';
      qAdminZapobizhZahidi.Params[8].Value:=frmAdminZapobizhZahodiEdit.edtPIBKerivnika.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[9].Name:='PosadaKerivnika';
      qAdminZapobizhZahidi.Params[9].Value:=frmAdminZapobizhZahodiEdit.edtPosadaKerivnika.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[10].Name:='RozdilF18T23';
      qAdminZapobizhZahidi.Params[10].Value:=frmAdminZapobizhZahodiEdit.cbRozdilT23F18.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[11].Name:='TipShtrafiv';
      qAdminZapobizhZahidi.Params[11].Value:=frmAdminZapobizhZahodiEdit.cbTipPostanovi.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[12].Name:='Rik';
      qAdminZapobizhZahidi.Params[12].Value:=frmAdminZapobizhZahodiEdit.edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[13].Name:='Vstanoviv';
      qAdminZapobizhZahidi.Params[13].Value:=frmAdminZapobizhZahodiEdit.memVstanoviv.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[14].Name:='SchoEPorushennym';
      qAdminZapobizhZahidi.Params[14].Value:=frmAdminZapobizhZahodiEdit.memSchoEPorushennym.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[15].Name:='Postanoviv';
      qAdminZapobizhZahidi.Params[15].Value:=frmAdminZapobizhZahodiEdit.cbPostanoviv.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[16].Name:='PIBOsobiSES';
      qAdminZapobizhZahidi.Params[16].Value:=frmAdminZapobizhZahodiEdit.cbPIBOsobiSES.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[17].Name:='PosadaOsobiSES';
      qAdminZapobizhZahidi.Params[17].Value:=frmAdminZapobizhZahodiEdit.cbPosadaOsobiSES.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[18].Name:='Primitka';
      qAdminZapobizhZahidi.Params[18].Value:=frmAdminZapobizhZahodiEdit.edtPrimitka.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[19].Name:='VikonannyDo';
      qAdminZapobizhZahidi.Params[19].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpInformaciyProVikonannyDo.Date));
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[20].Name:='PosadaGDSL';
      qAdminZapobizhZahidi.Params[20].Value:=frmAdminZapobizhZahodiEdit.edtPosada_GDSL.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[21].Name:='PIBGDSL';
      qAdminZapobizhZahidi.Params[21].Value:=frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[22].Name:='Zapiska';
      qAdminZapobizhZahidi.Params[22].Value:=frmAdminZapobizhZahodiEdit.rgAkt_Raspiska.ItemIndex;
      case frmAdminZapobizhZahodiEdit.rgAkt_Raspiska.ItemIndex of
        0:
          begin
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[23].Name:='DataAktu';
            qAdminZapobizhZahidi.Params[23].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[24].Name:='NomerAktu';
            qAdminZapobizhZahidi.Params[24].Value:='';
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[25].Name:='DataAktuDo';
            qAdminZapobizhZahidi.Params[25].Value:='';
          end;
        1:
          begin
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[23].Name:='DataAktu';
            qAdminZapobizhZahidi.Params[23].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[24].Name:='NomerAktu';
            qAdminZapobizhZahidi.Params[24].Value:=frmAdminZapobizhZahodiEdit.edtNomer.Text;
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[25].Name:='DataAktuDo';
            qAdminZapobizhZahidi.Params[25].Value:='';
          end;
        2:
          begin
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[23].Name:='DataAktu';
            qAdminZapobizhZahidi.Params[23].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[24].Name:='NomerAktu';
            qAdminZapobizhZahidi.Params[24].Value:=frmAdminZapobizhZahodiEdit.edtNomer.Text;
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[25].Name:='DataAktuDo';
            qAdminZapobizhZahidi.Params[25].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Do.Date));
          end;
      end;
      if frmAdminZapobizhZahodiEdit.cbxPostijno.Checked then
      begin
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[26].Name:='Postijno';
        qAdminZapobizhZahidi.Params[26].Value:=1;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[27].Name:='Z_Dati';
        qAdminZapobizhZahidi.Params[27].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[28].Name:='Z_Chasu';
        qAdminZapobizhZahidi.Params[28].Value:=frmAdminZapobizhZahodiEdit.edtZ_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[29].Name:='Do_Dati';
        qAdminZapobizhZahidi.Params[29].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[30].Name:='Do_Chasu';
        qAdminZapobizhZahidi.Params[30].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[31].Name:='UmoviVidnovlenny';
        qAdminZapobizhZahidi.Params[31].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[32].Name:='ObmezhennyAsortimentu';
        qAdminZapobizhZahidi.Params[32].Value:=0;
      end;
      if frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Checked then
      begin
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[26].Name:='Postijno';
        qAdminZapobizhZahidi.Params[26].Value:=0;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[27].Name:='Z_Dati';
        qAdminZapobizhZahidi.Params[27].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[28].Name:='Z_Chasu';
        qAdminZapobizhZahidi.Params[28].Value:=frmAdminZapobizhZahodiEdit.edtZ_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[29].Name:='Do_Dati';
        qAdminZapobizhZahidi.Params[29].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[30].Name:='Do_Chasu';
        qAdminZapobizhZahidi.Params[30].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[31].Name:='UmoviVidnovlenny';
        qAdminZapobizhZahidi.Params[31].Value:=frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[32].Name:='ObmezhennyAsortimentu';
        qAdminZapobizhZahidi.Params[32].Value:='1';
      end;
      if (not frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Checked)and(not frmAdminZapobizhZahodiEdit.cbxPostijno.Checked) then
      begin
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[26].Name:='Postijno';
        qAdminZapobizhZahidi.Params[26].Value:=0;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[27].Name:='Z_Dati';
        qAdminZapobizhZahidi.Params[27].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[28].Name:='Z_Chasu';
        qAdminZapobizhZahidi.Params[28].Value:=frmAdminZapobizhZahodiEdit.edtZ_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[29].Name:='Do_Dati';
        qAdminZapobizhZahidi.Params[29].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpDo_Data.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[30].Name:='Do_Chasu';
        qAdminZapobizhZahidi.Params[30].Value:=frmAdminZapobizhZahodiEdit.edtDo_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[31].Name:='UmoviVidnovlenny';
        qAdminZapobizhZahidi.Params[31].Value:=frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[32].Name:='ObmezhennyAsortimentu';
        qAdminZapobizhZahidi.Params[32].Value:=0;
      end;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[33].Name:='VidPostanovi';
      qAdminZapobizhZahidi.Params[33].Value:=frmAdminZapobizhZahodiEdit.cbVidPostanovi.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[34].Name:='NajmenuvannyTovaru';
      if frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible then qAdminZapobizhZahidi.Params[34].Value:=frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Text else qAdminZapobizhZahidi.Params[34].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[35].Name:='KilkistTovaru';
      if frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible then qAdminZapobizhZahidi.Params[35].Value:=frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Text else qAdminZapobizhZahidi.Params[35].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[36].Name:='VagaOdinici';
      if frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible then qAdminZapobizhZahidi.Params[36].Value:=frmAdminZapobizhZahodiEdit.edtVagaOdinici.Text else qAdminZapobizhZahidi.Params[36].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[37].Name:='ZagalnaVaga';
      if frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible then qAdminZapobizhZahidi.Params[37].Value:=frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Text else qAdminZapobizhZahidi.Params[37].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[38].Name:='OtrimanogoVid';
      if frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible then qAdminZapobizhZahidi.Params[38].Value:=frmAdminZapobizhZahodiEdit.edtOtrimanogo.Text else qAdminZapobizhZahidi.Params[38].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[39].Name:='Kod';
      qAdminZapobizhZahidi.Params[39].Value:=frmAdminZapobizhZahodiEdit.edtRecordID.Text;
      qAdminZapobizhZahidi.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmAdminZapobizhZahodiEdit.Close;
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    exit;
  end; //Редагування постанови

  //Додавання постанови
  if frmAdminZapobizhZahodiEdit.Caption='Додавання постанови' then
  begin
    //загальні відомості про постанову
    if edtRecordID.Text='' then
    begin
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='insert into POSTANOVA_ADMIN (RECORD_ID) values (gen_id(GET_ADMIN_RECORD_ID,1))';
      qComboBoxes.Open;
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from POSTANOVA_ADMIN order by RECORD_ID';
      qComboBoxes.Open;
      qComboBoxes.Last;
      edtRecordID.Text:=IntToStr(qComboBoxes.FieldByName('RECORD_ID').Value);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt64(edtRecordID.Text);
    except
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='insert into POSTANOVA_ADMIN (RECORD_ID) values (gen_id(GET_ADMIN_RECORD_ID,1))';
      qComboBoxes.Open;
      qComboBoxes.SQL.Clear;
      qComboBoxes.SQL.Text:='select * from POSTANOVA_ADMIN order by RECORD_ID';
      qComboBoxes.Open;
      qComboBoxes.Last;
      edtRecordID.Text:=IntToStr(qComboBoxes.FieldByName('RECORD_ID').Value);
      edtNomerPostanovi.SetFocus;
      exit;
    end;

    if cbMinistry.Text='' then
    begin
      cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qComboBoxes.Open;
    if not qComboBoxes.Locate('MINISTRY',cbMinistry.Text,[]) then
    begin
      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
      INIAZZ.Free;
      if not qComboBoxes.Locate('KOD',StrToInt(cbMinistry.Text),[]) then
      begin
        MessageDlg('УВАГА!'+#13+'В налаштуваннях не вказано териториальне розташування організації або не заповнені довідники!!!'+#13+'Перевірте всі налаштуваня програми та повторіть введення відомостей знову!',mtError,[mbOK],0);
        frmAdminZapobizhZahodiEdit.Close;
        exit;
      end
    end
    else
      Ministry:=qComboBoxes.FieldByName('KOD').Value;

    if cbTeritory.Text='' then
    begin
      cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry order by TERITORY';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Ministry';
    qComboBoxes.Params[0].Value:=Ministry;
    qComboBoxes.Open;
    if not qComboBoxes.Locate('TERITORY',cbTeritory.Text,[]) then
    begin
      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
      INIAZZ.Free;
      if not qComboBoxes.Locate('KOD',StrToInt(cbTeritory.Text),[]) then
      begin
        MessageDlg('УВАГА!'+#13+'В налаштуваннях не вказано териториальне розташування організації або не заповнені довідники!!!'+#13+'Перевірте всі налаштуваня програми та повторіть введення відомостей знову!',mtError,[mbOK],0);
        frmAdminZapobizhZahodiEdit.Close;
        exit;
      end;
    end
    else
      Teritory:=qComboBoxes.FieldByName('KOD').Value;

    if cbDistrict.Text='' then
    begin
      cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from RAJONI where TERITORY=:Teritory order by RAJON';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Teritory';
    qComboBoxes.Params[0].Value:=Teritory;
    qComboBoxes.Open;
    if not qComboBoxes.Locate('RAJON',cbDistrict.Text,[]) then
    begin
      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      cbDistrict.Text:=INIAZZ.ReadString('Teritory','District',cbDistrict.Text);
      INIAZZ.Free;
      if not qComboBoxes.Locate('KOD',StrToInt(cbDistrict.Text),[]) then
      begin
        MessageDlg('УВАГА!'+#13+'В налаштуваннях не вказано териториальне розташування організації або не заповнені довідники!!!'+#13+'Перевірте всі налаштуваня програми та повторіть введення відомостей знову!',mtError,[mbOK],0);
        frmAdminZapobizhZahodiEdit.Close;
        exit;
      end;
    end
    else
      District:=qComboBoxes.FieldByName('KOD').Value;

    if edtNomerPostanovi.Text='' then
    begin
      aNomerPostanoviUpdateExecute(sender);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(edtNomerPostanovi.Text);
    except
      aNomerPostanoviUpdateExecute(sender);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT=:Rajon and YEAR_=:Rik order by NOMER_POSTANOVI';
    qComboBoxes.Params.Clear;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[0].Name:='Rajon';
    qComboBoxes.Params[0].Value:=District;
    qComboBoxes.Params.Add;
    qComboBoxes.Params[1].Name:='Rik';
    qComboBoxes.Params[1].Value:=frmAdminZapobizhZahodi.udYear.Position;
    qComboBoxes.Open;
    if qComboBoxes.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[]) then
    begin
      aNomerPostanoviUpdateExecute(sender);
      edtNomerPostanovi.SetFocus;
      exit;
    end;
    if int(dtpDataPostanovi.Date)>int(date) then
    begin
      dtpDataPostanovi.Date:=int(date);
      dtpDataPostanovi.SetFocus;
      exit;
    end;

    if rgAkt_Raspiska.ItemIndex=-1 then
      case rgAkt_Raspiska.ItemIndex of
       -1:
          begin
            rgAkt_Raspiska.ItemIndex:=0;
            aAkt_Raspiska_ChangeExecute(sender);
            dtpData_Z.SetFocus;
            exit;
          end;
        0:
          begin
            if int(dtpData_Z.Date)>int(date) then
            begin
              dtpData_Z.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
          end;
        1:
          begin
            if int(dtpData_Z.Date)>int(date) then
            begin
              dtpData_Z.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
            if edtNomer.Text='' then
            begin
              edtNomer.SetFocus;
              exit;
            end;
          end;
        2:
          begin
            if int(dtpData_Z.Date)>int(date) then
            begin
              dtpData_Z.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
            if int(dtpData_Do.Date)>int(date) then
            begin
              dtpData_Do.Date:=int(date);
              dtpData_Do.SetFocus;
              exit;
            end;
            if int(dtpData_Z.Date)>int(dtpData_Do.Date) then
            begin
              dtpData_Z.Date:=int(Date);
              dtpData_Do.Date:=int(date);
              dtpData_Z.SetFocus;
              exit;
            end;
            if edtNomer.Text='' then
            begin
              edtNomer.SetFocus;
              exit;
            end;
          end;
      end;

    //відомості про об"єкт
    pcAdminZapobizhZahodi.ActivePage:=tsVidomostiProObjekt;
    if edtNazvaObjektu.Text='' then
    begin
      edtNazvaObjektu.SetFocus;
      exit;
    end;
    if edtAdresaObjektu.Text='' then
    begin
      edtAdresaObjektu.SetFocus;
      exit;
    end;
    if edtPIBKerivnika.Text='' then
    begin
      edtPIBKerivnika.SetFocus;
      exit;
    end;
    if edtPosadaKerivnika.Text='' then
    begin
      edtPosadaKerivnika.SetFocus;
      exit;
    end;
    if cbRozdilT23F18.Text='' then
    begin
      aRozdilT23F18_UpdateExecute(sender);
      cbRozdilT23F18.SetFocus;
      exit;
    end;
    if cbTipPostanovi.Text='' then
    begin
      aTipPostanovi_UpdateExecute(sender);
      cbTipPostanovi.SetFocus;
      exit;
    end;
    if edtYear.Text='' then
    begin
      aYearUpdateExecute(sender);
      edtYear.SetFocus;
      exit;
    end;
    try
      StrToInt(edtYear.Text);
    except
      aYearUpdateExecute(sender);
      edtYear.SetFocus;
      exit;
    end;
    y:=0;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    y:=INIAZZ.ReadInteger('System','Year',y);
    INIAZZ.Free;
    if StrToInt(edtYear.Text)<>y then
    begin
      aYearUpdateExecute(sender);
      edtYear.SetFocus;
      exit;
    end;

    //постановив
    frmAdminZapobizhZahodiEdit.pcAdminZapobizhZahodi.ActivePage:=frmAdminZapobizhZahodiEdit.tsPostanoviv;
    if cbVidPostanovi.Text='' then
    begin
      aVidPostanovi_UpdateExecute(sender);
      aVidPostanovi_ChangeExecute(sender);
      cbVidPostanovi.SetFocus;
      exit;
    end;

    //суть порушення
    pcAdminZapobizhZahodi.ActivePage:=tsSutPorushenny;
    if memVstanoviv.Lines.Count<=0 then
    begin
      memVstanoviv.SetFocus;
      exit;
    end;
    if memVstanoviv.Text='' then
    begin
      memVstanoviv.SetFocus;
      exit;
    end;
    if memSchoEPorushennym.Lines.Count<=0 then
    begin
      memSchoEPorushennym.SetFocus;
      exit;
    end;
    if memSchoEPorushennym.Text='' then
    begin
      memSchoEPorushennym.SetFocus;
      exit;
    end;
    if cbPostanoviv.Text='' then
    begin
      aPostanoviv_UpdateExecute(sender);
      cbPostanoviv.SetFocus;
      exit;
    end;
    if not cbxObmezhennyAsortimentu.Checked then
    begin
      if edtZ_Chas.Text='' then
      begin
        edtZ_Chas.SetFocus;
        exit;
      end;
      if not cbxPostijno.Checked then
        if edtDo_Chas.Text='' then
        begin
          edtDo_Chas.SetFocus;
          exit;
        end;
    end;

    //додатково
    pcAdminZapobizhZahodi.ActivePage:=tsDodatkovo;
    if cbPIBOsobiSES.Text='' then
    begin
      aPIBOsobiSES_UpdateExecute(sender);
      cbPIBOsobiSES.SetFocus;
      exit;
    end;
    if cbPosadaOsobiSES.Text='' then
    begin
      aPosadaOsobiSES_UpdateExecute(sender);
      cbPosadaOsobiSES.SetFocus;
      exit;
    end;

    if edtPosada_GDSL.Text='' then
    begin
      aGDSL_UpdateExecute(sender);
      edtPosada_GDSL.SetFocus;
      exit;
    end;
    if edtPIB_GDSL.Text='' then
    begin
      aGDSL_UpdateExecute(sender);
      edtPIB_GDSL.SetFocus;
      exit;
    end;

    //запис до БД
    with frmAdminZapobizhZahodi do
    begin
      qAdminZapobizhZahidi.SQL.Clear;
      qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'MINISTRY=:Ministry,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'TERITORY=:Teritory,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DISTRICT=:District,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_POSTANOVI=:DataPostanovi,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NAZVA_OBJEKTU=:NazvaObjektu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ADRESA_OBJEKTU=:AdresaObjektu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VIDOMCHA_PIDPORYDKOVANIST=:VidomchaPidporydkovanist,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PIB_KERIVNIKA=:PIBKerivnika,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSADA_KERIVNIKA=:PosadaKerivnika,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ROZDIL_F18_T23=:RozdilF18T23,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'TIPSHTRAFIV=:TipShtrafiv,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'YEAR_=:Rik,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VSTANOVIV=:Vstanoviv,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'SCHO_E_PORUSHENNYM=:SchoEPorushennym,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSTANOVIV=:Postanoviv,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PIB_OSOBI_SES=:PIBOsobiSES,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSADA_OSOBI_SES=:PosadaOsobiSES,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PRIMITKA=:Primitka,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VIKONANNY_DO=:VikonannyDo,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSADA_GDSL=:PosadaGDSL,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'PIB_GDSL=:PIBGDSL,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ZAPISKA_AKT=:Zapiska,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_AKTU=:DataAktu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NOMER_AKTU=:NomerAktu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_AKTU_DO=:DataAktuDo,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'POSTIJNO=:Postijno,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'Z_DATA=:Z_Dati,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'Z_CHASU=:Z_Chasu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DO_DATA=:Do_Dati,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DO_CHASU=:Do_Chasu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'UMOVIVIDNOVLENNY=:UmoviVidnovlenny,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'OBMEZHENNY_ASORTIMENTU=:ObmezhennyAsortimentu,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VID_POSTANOVI=:VidPostanovi,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'NAJMENUVANNY_TOVARU=:NajmenuvannyTovaru,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'KILKIST_TOVARU=:KilkistTovaru,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'VAGA_ODINICI=:VagaOdinici,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'ZAGALNA_VAGA=:ZagalnaVaga,';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'OTRIMANOGO_VID=:OtrimanogoVid,EDITING=0';
      qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'where RECORD_ID=:Kod';

      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='District';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='NomerPostanovi';
      qAdminZapobizhZahidi.Params[3].Value:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='DataPostanovi';
      qAdminZapobizhZahidi.Params[4].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpDataPostanovi.Date));
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[5].Name:='NazvaObjektu';
      qAdminZapobizhZahidi.Params[5].Value:=frmAdminZapobizhZahodiEdit.edtNazvaObjektu.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[6].Name:='AdresaObjektu';
      qAdminZapobizhZahidi.Params[6].Value:=frmAdminZapobizhZahodiEdit.edtAdresaObjektu.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[7].Name:='VidomchaPidporydkovanist';
      qAdminZapobizhZahidi.Params[7].Value:=frmAdminZapobizhZahodiEdit.edtVidomchaPidporydkovanist.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[8].Name:='PIBKerivnika';
      qAdminZapobizhZahidi.Params[8].Value:=frmAdminZapobizhZahodiEdit.edtPIBKerivnika.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[9].Name:='PosadaKerivnika';
      qAdminZapobizhZahidi.Params[9].Value:=frmAdminZapobizhZahodiEdit.edtPosadaKerivnika.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[10].Name:='RozdilF18T23';
      qAdminZapobizhZahidi.Params[10].Value:=frmAdminZapobizhZahodiEdit.cbRozdilT23F18.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[11].Name:='TipShtrafiv';
      qAdminZapobizhZahidi.Params[11].Value:=frmAdminZapobizhZahodiEdit.cbTipPostanovi.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[12].Name:='Rik';
      qAdminZapobizhZahidi.Params[12].Value:=frmAdminZapobizhZahodiEdit.edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[13].Name:='Vstanoviv';
      qAdminZapobizhZahidi.Params[13].Value:=frmAdminZapobizhZahodiEdit.memVstanoviv.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[14].Name:='SchoEPorushennym';
      qAdminZapobizhZahidi.Params[14].Value:=frmAdminZapobizhZahodiEdit.memSchoEPorushennym.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[15].Name:='Postanoviv';
      qAdminZapobizhZahidi.Params[15].Value:=frmAdminZapobizhZahodiEdit.cbPostanoviv.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[16].Name:='PIBOsobiSES';
      qAdminZapobizhZahidi.Params[16].Value:=frmAdminZapobizhZahodiEdit.cbPIBOsobiSES.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[17].Name:='PosadaOsobiSES';
      qAdminZapobizhZahidi.Params[17].Value:=frmAdminZapobizhZahodiEdit.cbPosadaOsobiSES.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[18].Name:='Primitka';
      qAdminZapobizhZahidi.Params[18].Value:=frmAdminZapobizhZahodiEdit.edtPrimitka.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[19].Name:='VikonannyDo';
      qAdminZapobizhZahidi.Params[19].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpInformaciyProVikonannyDo.Date));
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[20].Name:='PosadaGDSL';
      qAdminZapobizhZahidi.Params[20].Value:=frmAdminZapobizhZahodiEdit.edtPosada_GDSL.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[21].Name:='PIBGDSL';
      qAdminZapobizhZahidi.Params[21].Value:=frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[22].Name:='Zapiska';
      qAdminZapobizhZahidi.Params[22].Value:=frmAdminZapobizhZahodiEdit.rgAkt_Raspiska.ItemIndex;
      case frmAdminZapobizhZahodiEdit.rgAkt_Raspiska.ItemIndex of
        0:
          begin
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[23].Name:='DataAktu';
            qAdminZapobizhZahidi.Params[23].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[24].Name:='NomerAktu';
            qAdminZapobizhZahidi.Params[24].Value:='';
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[25].Name:='DataAktuDo';
            qAdminZapobizhZahidi.Params[25].Value:='';
          end;
        1:
          begin
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[23].Name:='DataAktu';
            qAdminZapobizhZahidi.Params[23].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[24].Name:='NomerAktu';
            qAdminZapobizhZahidi.Params[24].Value:=frmAdminZapobizhZahodiEdit.edtNomer.Text;
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[25].Name:='DataAktuDo';
            qAdminZapobizhZahidi.Params[25].Value:='';
          end;
        2:
          begin
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[23].Name:='DataAktu';
            qAdminZapobizhZahidi.Params[23].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[24].Name:='NomerAktu';
            qAdminZapobizhZahidi.Params[24].Value:=frmAdminZapobizhZahodiEdit.edtNomer.Text;
            qAdminZapobizhZahidi.Params.Add;
            qAdminZapobizhZahidi.Params[25].Name:='DataAktuDo';
            qAdminZapobizhZahidi.Params[25].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Do.Date));
          end;
      end;
      if frmAdminZapobizhZahodiEdit.cbxPostijno.Checked then
      begin
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[26].Name:='Postijno';
        qAdminZapobizhZahidi.Params[26].Value:=1;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[27].Name:='Z_Dati';
        qAdminZapobizhZahidi.Params[27].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[28].Name:='Z_Chasu';
        qAdminZapobizhZahidi.Params[28].Value:=frmAdminZapobizhZahodiEdit.edtZ_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[29].Name:='Do_Dati';
        qAdminZapobizhZahidi.Params[29].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[30].Name:='Do_Chasu';
        qAdminZapobizhZahidi.Params[30].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[31].Name:='UmoviVidnovlenny';
        qAdminZapobizhZahidi.Params[31].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[32].Name:='ObmezhennyAsortimentu';
        qAdminZapobizhZahidi.Params[32].Value:=0;
      end;
      if frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Checked then
      begin
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[26].Name:='Postijno';
        qAdminZapobizhZahidi.Params[26].Value:=0;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[27].Name:='Z_Dati';
        qAdminZapobizhZahidi.Params[27].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[28].Name:='Z_Chasu';
        qAdminZapobizhZahidi.Params[28].Value:=frmAdminZapobizhZahodiEdit.edtZ_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[29].Name:='Do_Dati';
        qAdminZapobizhZahidi.Params[29].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[30].Name:='Do_Chasu';
        qAdminZapobizhZahidi.Params[30].Value:='';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[31].Name:='UmoviVidnovlenny';
        qAdminZapobizhZahidi.Params[31].Value:=frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[32].Name:='ObmezhennyAsortimentu';
        qAdminZapobizhZahidi.Params[32].Value:='1';
      end;
      if (not frmAdminZapobizhZahodiEdit.cbxObmezhennyAsortimentu.Checked)and(not frmAdminZapobizhZahodiEdit.cbxPostijno.Checked) then
      begin
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[26].Name:='Postijno';
        qAdminZapobizhZahidi.Params[26].Value:='0';
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[27].Name:='Z_Dati';
        qAdminZapobizhZahidi.Params[27].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpData_Z.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[28].Name:='Z_Chasu';
        qAdminZapobizhZahidi.Params[28].Value:=frmAdminZapobizhZahodiEdit.edtZ_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[29].Name:='Do_Dati';
        qAdminZapobizhZahidi.Params[29].Value:=DateToStr(int(frmAdminZapobizhZahodiEdit.dtpDo_Data.Date));
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[30].Name:='Do_Chasu';
        qAdminZapobizhZahidi.Params[30].Value:=frmAdminZapobizhZahodiEdit.edtDo_Chas.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[31].Name:='UmoviVidnovlenny';
        qAdminZapobizhZahidi.Params[31].Value:=frmAdminZapobizhZahodiEdit.cbUmoviVidnovlenny.Text;
        qAdminZapobizhZahidi.Params.Add;
        qAdminZapobizhZahidi.Params[32].Name:='ObmezhennyAsortimentu';
        qAdminZapobizhZahidi.Params[32].Value:='0';
      end;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[33].Name:='VidPostanovi';
      qAdminZapobizhZahidi.Params[33].Value:=frmAdminZapobizhZahodiEdit.cbVidPostanovi.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[34].Name:='NajmenuvannyTovaru';
      if frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible then qAdminZapobizhZahidi.Params[34].Value:=frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Text else qAdminZapobizhZahidi.Params[34].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[35].Name:='KilkistTovaru';
      if frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible then qAdminZapobizhZahidi.Params[35].Value:=frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Text else qAdminZapobizhZahidi.Params[35].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[36].Name:='VagaOdinici';
      if frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible then qAdminZapobizhZahidi.Params[36].Value:=frmAdminZapobizhZahodiEdit.edtVagaOdinici.Text else qAdminZapobizhZahidi.Params[36].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[37].Name:='ZagalnaVaga';
      if frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible then qAdminZapobizhZahidi.Params[37].Value:=frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Text else qAdminZapobizhZahidi.Params[37].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[38].Name:='OtrimanogoVid';
      if frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible then qAdminZapobizhZahidi.Params[38].Value:=frmAdminZapobizhZahodiEdit.edtOtrimanogo.Text else qAdminZapobizhZahidi.Params[38].Value:='';
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[39].Name:='Kod';
      qAdminZapobizhZahidi.Params[39].Value:=frmAdminZapobizhZahodiEdit.edtRecordID.Text;
      qAdminZapobizhZahidi.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmAdminZapobizhZahodiEdit.Close;
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    exit;
  end; //Додавання постанови
end;

procedure TfrmAdminZapobizhZahodiEdit.aCancelExecute(Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.Close;
end;

procedure TfrmAdminZapobizhZahodiEdit.aGDSL_UpdateExecute(Sender: TObject);
var
  Director: integer;
begin
  Director:=0;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  Director:=INIAZZ.ReadInteger('Firm','Director',Director);
  case Director of
    0:
      begin
        frmAdminZapobizhZahodiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director','Position_NV',frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text);
        frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director','LNP_NV',frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text);
      end;
    1:
      begin
        frmAdminZapobizhZahodiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director1','Position_NV',frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text);
        frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director1','LNP_NV',frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text);
      end;
    2:
      begin
        frmAdminZapobizhZahodiEdit.edtPosada_GDSL.Text:=INIAZZ.ReadString('Director2','Position_NV',frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text);
        frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text:=INIAZZ.ReadString('Director2','LNP_NV',frmAdminZapobizhZahodiEdit.edtPIB_GDSL.Text);
      end;
  end;
  INIAZZ.Free;
end;

procedure TfrmAdminZapobizhZahodiEdit.dtpDataPostanoviExit(
  Sender: TObject);
begin
  frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
end;

end.
