unit VidnovlennyRobit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  ComCtrls, Controls, Grids, DBGrids, ExtCtrls, SysUtils, IniFiles;

type
  TfrmVidnovlennyRobit = class(TForm)
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edtNomerPostanovi: TEdit;
    dtpDataPostanovi: TDateTimePicker;
    edtRecord_ID: TEdit;
    alVidnovlennyRobit: TActionList;
    aKimPrijnyteRishenny_Choice: TAction;
    aKogoPovidomlenoAdd: TAction;
    aKogoPovidomlenoEdit: TAction;
    aKogoPovidomlenoDelete: TAction;
    aKogoPovidomlenoUpdate: TAction;
    aKimPrijnyteRishenny_Update: TAction;
    aNazvaPostanoviUpdate: TAction;
    pcVidnovlennyRobit: TPageControl;
    tsOne: TTabSheet;
    tsTwo: TTabSheet;
    Label31: TLabel;
    Label1: TLabel;
    edtNazvaPostanovi: TEdit;
    btnNazvaPostanovi: TButton;
    qComboBoxes: TIBQuery;
    gbKogoPovidomleno: TGroupBox;
    Panel3: TPanel;
    btnKogoPovidomlenoAdd: TButton;
    btnKogoPovidomlenoEdit: TButton;
    btnKogoPovidomlenoDelete: TButton;
    btnKogoPovidomlenoUpdate: TButton;
    DBGrid1: TDBGrid;
    dsNapravlenoDoVidoma: TDataSource;
    qNapravlenoDoVidoma: TIBQuery;
    cbKimPrijnyteRishenny: TComboBox;
    btnKimPrijnyteRishenny_Update: TButton;
    btnKimPrijnyteRishenny_Choice: TButton;
    Label10: TLabel;
    edtVidPostanovi: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edtNazvaObjektu: TEdit;
    edtVidomchaPidporydkovanist: TEdit;
    Label13: TLabel;
    edtNomerAktuPerevirki: TEdit;
    Label14: TLabel;
    dtpDataAktuPerevirki: TDateTimePicker;
    aLaboratornijKontrolAdd: TAction;
    aLaboratornijKontrolEdit: TAction;
    aLaboratornijKontrolDelete: TAction;
    aLaboratornijKontrolUpdate: TAction;
    gbLaboratornijKontrol: TGroupBox;
    DBGrid2: TDBGrid;
    dsLaboratornijKontrol: TDataSource;
    qLaboratornijKontrol: TIBQuery;
    Panel2: TPanel;
    btnLaboratornijKontrolAdd: TButton;
    btnLaboratornijKontrolEdit: TButton;
    btnLaboratornijKontrolDelete: TButton;
    btnLaboratornijKontrolupdate: TButton;
    Label5: TLabel;
    memPidstava: TRichEdit;
    btnPidstava: TButton;
    aPidstavaUpdate: TAction;
    Label3: TLabel;
    dtpDataVidnovlennyRobit: TDateTimePicker;
    edtDataVidnovlennyPrimitka: TEdit;
    Label6: TLabel;
    dtpDataLista: TDateTimePicker;
    Label2: TLabel;
    edtNomerLista: TEdit;
    aOK: TAction;
    aCancel: TAction;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKimPrijnyteRishenny_ChoiceExecute(Sender: TObject);
    procedure aKogoPovidomlenoAddExecute(Sender: TObject);
    procedure aKogoPovidomlenoEditExecute(Sender: TObject);
    procedure aKogoPovidomlenoDeleteExecute(Sender: TObject);
    procedure aKogoPovidomlenoUpdateExecute(Sender: TObject);
    procedure aKimPrijnyteRishenny_UpdateExecute(Sender: TObject);
    procedure aNazvaPostanoviUpdateExecute(Sender: TObject);
    procedure aLaboratornijKontrolAddExecute(Sender: TObject);
    procedure aLaboratornijKontrolEditExecute(Sender: TObject);
    procedure aLaboratornijKontrolDeleteExecute(Sender: TObject);
    procedure aLaboratornijKontrolUpdateExecute(Sender: TObject);
    procedure aPidstavaUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmVidnovlennyRobit: TfrmVidnovlennyRobit;

implementation

uses
  Main, NapravlenoDoVidoma, AdminZapobizhZahodi, Organizacii,
  LaboratornijKontrol;

{$R *.dfm}

procedure TfrmVidnovlennyRobit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidnovlennyRobit.aKimPrijnyteRishenny_ChoiceExecute(
  Sender: TObject);
begin
  frmVidnovlennyRobit.Enabled:=false;
  frmMain.aOrganizaciiExecute(sender);
  frmOrganizacii.aChoice.Enabled:=true;
  frmOrganizacii.Left:=frmMain.Left+70;
  frmOrganizacii.Top:=frmMain.Top+70;
  frmOrganizacii.Width:=frmMain.Width-70;
  frmOrganizacii.Height:=frmMain.Height-70;
  frmOrganizacii.Position:=poMainFormCenter;
  frmOrganizacii.FormStyle:=fsNormal;
  frmOrganizacii.BorderStyle:=bsDialog;
end;

procedure TfrmVidnovlennyRobit.aKogoPovidomlenoAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmVidnovlennyRobit.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Додавання направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmVidnovlennyRobit.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbMinistry.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmVidnovlennyRobit.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmVidnovlennyRobit.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=frmVidnovlennyRobit.edtNomerPostanovi.Text;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.dtpDataPostanovi.Date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  frmNapravlenoDoVidoma.edtKod.Text:='';
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

procedure TfrmVidnovlennyRobit.aKogoPovidomlenoEditExecute(
  Sender: TObject);
begin
  if frmVidnovlennyRobit.qNapravlenoDoVidoma.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmVidnovlennyRobit.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Зміна направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmVidnovlennyRobit.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbMinistry.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmVidnovlennyRobit.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmVidnovlennyRobit.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').IsNull then frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=IntToStr(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').Value) else frmNapravlenoDoVidoma.edtNomerPostanovi.Text:='';
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').IsNull then frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').Value) else frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('KOD').IsNull then frmNapravlenoDoVidoma.edtKod.Text:=IntToStr(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('KOD').Value) else frmNapravlenoDoVidoma.edtKod.Text:='';
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;

  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('PIB').IsNull then frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('PIB').Value else frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=true;
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('POSADA').IsNull then frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('POSADA').Value else frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=true;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').IsNull then frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').Value) else frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=true;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmVidnovlennyRobit.aKogoPovidomlenoDeleteExecute(
  Sender: TObject);
begin
  if frmVidnovlennyRobit.qNapravlenoDoVidoma.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmVidnovlennyRobit.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Видалення направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmVidnovlennyRobit.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbMinistry.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmVidnovlennyRobit.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmVidnovlennyRobit.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').IsNull then frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=IntToStr(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('NOMER_POSTANOVI').Value) else frmNapravlenoDoVidoma.edtNomerPostanovi.Text:='';
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').IsNull then frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_POSTANOVI').Value) else frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('KOD').IsNull then frmNapravlenoDoVidoma.edtKod.Text:=IntToStr(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('KOD').Value) else frmNapravlenoDoVidoma.edtKod.Text:='';
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;

  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('PIB').IsNull then frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('PIB').Value else frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=false;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=false;
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('POSADA').IsNull then frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('POSADA').Value else frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=false;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=false;
  if not frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').IsNull then frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(frmVidnovlennyRobit.qNapravlenoDoVidoma.FieldByName('DATA_NAPRAVLENNY').Value) else frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=false;
  frmNapravlenoDoVidoma.btnVidminiti.SetFocus;
end;

procedure TfrmVidnovlennyRobit.aKogoPovidomlenoUpdateExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmVidnovlennyRobit do
  begin
    qNapravlenoDoVidoma.SQL.Clear;
    qNapravlenoDoVidoma.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qNapravlenoDoVidoma.Params.Clear;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[0].Name:='Ministry';
    qNapravlenoDoVidoma.Params[0].Value:=cbMinistry.Text;
    qNapravlenoDoVidoma.Open;
    if qNapravlenoDoVidoma.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qNapravlenoDoVidoma.FieldByName('KOD').Value else Ministry:=0;

    qNapravlenoDoVidoma.SQL.Clear;
    qNapravlenoDoVidoma.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qNapravlenoDoVidoma.Params.Clear;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[0].Name:='Ministry';
    qNapravlenoDoVidoma.Params[0].Value:=Ministry;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[1].Name:='Teritory';
    qNapravlenoDoVidoma.Params[1].Value:=cbTeritory.Text;
    qNapravlenoDoVidoma.Open;
    if qNapravlenoDoVidoma.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qNapravlenoDoVidoma.FieldByName('KOD').Value else Teritory:=0;

    qNapravlenoDoVidoma.SQL.Clear;
    qNapravlenoDoVidoma.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qNapravlenoDoVidoma.Params.Clear;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[0].Name:='Ministry';
    qNapravlenoDoVidoma.Params[0].Value:=Ministry;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[1].Name:='Teritory';
    qNapravlenoDoVidoma.Params[1].Value:=Teritory;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[2].Name:='Rajon';
    qNapravlenoDoVidoma.Params[2].Value:=cbDistrict.Text;
    qNapravlenoDoVidoma.Open;
    if qNapravlenoDoVidoma.Locate('RAJON',cbDistrict.Text,[]) then District:=qNapravlenoDoVidoma.FieldByName('KOD').Value else District:=0;

    qNapravlenoDoVidoma.SQL.Clear;
    qNapravlenoDoVidoma.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:Vidnovlenny and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by KOD';
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
    qNapravlenoDoVidoma.Params[3].Name:='Vidnovlenny';
    qNapravlenoDoVidoma.Params[3].Value:='rishenny';
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[4].Name:='NomerPostanovi';
    qNapravlenoDoVidoma.Params[4].Value:=frmVidnovlennyRobit.edtNomerPostanovi.Text;
    qNapravlenoDoVidoma.Params.Add;
    qNapravlenoDoVidoma.Params[5].Name:='DataPostanovi';
    qNapravlenoDoVidoma.Params[5].Value:=DateToStr(int(frmVidnovlennyRobit.dtpDataPostanovi.Date));
    qNapravlenoDoVidoma.Open;
  end;
end;

procedure TfrmVidnovlennyRobit.aKimPrijnyteRishenny_UpdateExecute(
  Sender: TObject);
begin
  with frmVidnovlennyRobit do
  begin
    qComboBoxes.SQL.Clear;
    qComboBoxes.SQL.Text:='select * from ORGANIZACII order by NAZVA_OGRANIZACII';
    qComboBoxes.Open;
  end;
  frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text:='';
  frmVidnovlennyRobit.cbKimPrijnyteRishenny.Items.Clear;
  frmVidnovlennyRobit.qComboBoxes.First;
  while not frmVidnovlennyRobit.qComboBoxes.Eof do
  begin
    if not frmVidnovlennyRobit.qComboBoxes.FieldByName('NAZVA_OGRANIZACII').IsNull then frmVidnovlennyRobit.cbKimPrijnyteRishenny.Items.Add(frmVidnovlennyRobit.qComboBoxes.FieldByName('POSADA_OSOBI').Value+' '+frmVidnovlennyRobit.qComboBoxes.FieldByName('PIB_OSOBI').Value);
    frmVidnovlennyRobit.qComboBoxes.Next;
  end;
end;

procedure TfrmVidnovlennyRobit.aNazvaPostanoviUpdateExecute(
  Sender: TObject);
var
////  , PosadaVORV, PosadaZastupnikaRV: string;
  PosadaKerivnikaRV, PIBKerivnikaRV: string;
  Director: integer;
begin
  Director:=0;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  Director:=INIAZZ.ReadInteger('System','Position',Director);
  case Director of
    0:
      begin
        PosadaKerivnikaRV:=INIAZZ.ReadString('Director','Position_NV',PosadaKerivnikaRV);
        PIBKerivnikaRV:=INIAZZ.ReadString('Director','LNP_NV',PIBKerivnikaRV);
      end;
    1:
      begin
        PosadaKerivnikaRV:=INIAZZ.ReadString('Director1','Position_NV',PosadaKerivnikaRV);
        PIBKerivnikaRV:=INIAZZ.ReadString('Director1','LNP_NV',PIBKerivnikaRV);
      end;
    2:
      begin
        PosadaKerivnikaRV:=INIAZZ.ReadString('Director2','Position_NV',PosadaKerivnikaRV);
        PIBKerivnikaRV:=INIAZZ.ReadString('Director2','LNP_NV',PIBKerivnikaRV);
      end;
  end;
  frmVidnovlennyRobit.edtNazvaPostanovi.Text:='постанова ';
  case Director of
    0: frmVidnovlennyRobit.edtNazvaPostanovi.Text:=frmVidnovlennyRobit.edtNazvaPostanovi.Text+PosadaKerivnikaRV+' '+PIBKerivnikaRV+' № '+frmVidnovlennyRobit.edtNomerPostanovi.Text+' від '+DateToStr(int(frmVidnovlennyRobit.dtpDataPostanovi.Date))+' про '+frmVidnovlennyRobit.edtVidPostanovi.Text+' роботи '+frmVidnovlennyRobit.edtNazvaObjektu.Text+' '+frmVidnovlennyRobit.edtVidomchaPidporydkovanist.Text;  //назва об"єкту+відомча підпорядкованість
    1: frmVidnovlennyRobit.edtNazvaPostanovi.Text:=frmVidnovlennyRobit.edtNazvaPostanovi.Text+PosadaKerivnikaRV+' '+PIBKerivnikaRV+' № '+frmVidnovlennyRobit.edtNomerPostanovi.Text+' від '+DateToStr(int(frmVidnovlennyRobit.dtpDataPostanovi.Date))+' про '+frmVidnovlennyRobit.edtVidPostanovi.Text+' роботи '+frmVidnovlennyRobit.edtNazvaObjektu.Text+' '+frmVidnovlennyRobit.edtVidomchaPidporydkovanist.Text;  //назва об"єкту+відомча підпорядкованість
    2: frmVidnovlennyRobit.edtNazvaPostanovi.Text:=frmVidnovlennyRobit.edtNazvaPostanovi.Text+PosadaKerivnikaRV+' '+PIBKerivnikaRV+' № '+frmVidnovlennyRobit.edtNomerPostanovi.Text+' від '+DateToStr(int(frmVidnovlennyRobit.dtpDataPostanovi.Date))+' про '+frmVidnovlennyRobit.edtVidPostanovi.Text+' роботи '+frmVidnovlennyRobit.edtNazvaObjektu.Text+' '+frmVidnovlennyRobit.edtVidomchaPidporydkovanist.Text;  //назва об"єкту+відомча підпорядкованість
  end;
  INIAZZ.Free;
end;

procedure TfrmVidnovlennyRobit.aLaboratornijKontrolAddExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmVidnovlennyRobit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.Caption:='Додати відомості про лабораторний контроль';
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;

  frmLaboratornijKontrol.edtKod.Text:='';
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmVidnovlennyRobit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.dtpDataPostanovi.Date);
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;

  frmLaboratornijKontrol.cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;

  frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Items.Clear;
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=true;
  frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=true;
  frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=true;
  frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
end;

procedure TfrmVidnovlennyRobit.aLaboratornijKontrolEditExecute(
  Sender: TObject);
begin
  if frmVidnovlennyRobit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmVidnovlennyRobit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;
  frmLaboratornijKontrol.Caption:='Редагувати відомості про лабораторний контроль';

  frmLaboratornijKontrol.cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;

  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('KOD').IsNull then frmLaboratornijKontrol.edtKod.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('KOD').Value else frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value else frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmVidnovlennyRobit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.dtpDataPostanovi.Date);
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;

  frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Items.Clear;
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then frmLaboratornijKontrol.cbVidKontrolu.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=true;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then frmLaboratornijKontrol.edtNomeriProb.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=true;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=true;
  frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
end;

procedure TfrmVidnovlennyRobit.aLaboratornijKontrolDeleteExecute(
  Sender: TObject);
begin
  if frmVidnovlennyRobit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmVidnovlennyRobit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;
  frmLaboratornijKontrol.Caption:='Видалити відомості про лабораторний контроль';

  frmLaboratornijKontrol.cbMinistry.Text:=frmAdminZapobizhZahodi.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmAdminZapobizhZahodi.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmAdminZapobizhZahodi.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;

  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('KOD').IsNull then frmLaboratornijKontrol.edtKod.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('KOD').Value else frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value else frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmVidnovlennyRobit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmVidnovlennyRobit.dtpDataPostanovi.Date);
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;

  frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Items.Clear;
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then frmLaboratornijKontrol.cbVidKontrolu.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=false;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=false;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=false;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then frmLaboratornijKontrol.edtNomeriProb.Text:=frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=false;
  if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=false;
  frmLaboratornijKontrol.btnVidminiti.SetFocus;
end;

procedure TfrmVidnovlennyRobit.aLaboratornijKontrolUpdateExecute(
  Sender: TObject);
begin
  with frmVidnovlennyRobit do
  begin
    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from LABORATORNIJKONTROL where NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:Shtrafi order by VIDKONTROLU';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='NomerPostanovi';
    qLaboratornijKontrol.Params[0].Value:=edtNomerPostanovi.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='DataPostanovi';
    qLaboratornijKontrol.Params[1].Value:=DateToStr(int(dtpDataPostanovi.Date));
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[2].Name:='Shtrafi';
    qLaboratornijKontrol.Params[2].Value:='vidnovlenny';
    qLaboratornijKontrol.Open;
  end;
end;

procedure TfrmVidnovlennyRobit.aPidstavaUpdateExecute(Sender: TObject);
var
  laboratory: string;
begin
  laboratory:='';
  frmVidnovlennyRobit.memPidstava.Lines.Clear;
  if
    not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').IsNull
  then
    frmVidnovlennyRobit.memPidstava.Lines.Text:=frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('UMOVIVIDNOVLENNY').Value+', що підтверджено актом санітарно-епідеміологічного обстеження №'+frmVidnovlennyRobit.edtNomerAktuPerevirki.Text+' від '+DateToStr(frmVidnovlennyRobit.dtpDataAktuPerevirki.Date)
  else
    frmVidnovlennyRobit.memPidstava.Lines.Text:=', що підтверджено актом санітарно-епідеміологічного обстеження №'+frmVidnovlennyRobit.edtNomerAktuPerevirki.Text+' від '+DateToStr(frmVidnovlennyRobit.dtpDataAktuPerevirki.Date);
  if frmVidnovlennyRobit.qLaboratornijKontrol.RecordCount>0 then
  begin
    laboratory:=' результату лабораторних досліджень ';
    frmVidnovlennyRobit.qLaboratornijKontrol.First;
    while not frmVidnovlennyRobit.qLaboratornijKontrol.Eof do
    begin
      if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then laboratory:=laboratory+' '+frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else laboratory:=laboratory+' ';
      if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then laboratory:=laboratory+' № '+frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else laboratory:=laboratory+' ';
      if not frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then laboratory:=laboratory+' від '+DateToStr(frmVidnovlennyRobit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value)+', ' else laboratory:=laboratory+', ';
      frmVidnovlennyRobit.qLaboratornijKontrol.Next;
    end;
  end;
  if laboratory<>' результату лабораторних досліджень ' then frmVidnovlennyRobit.memPidstava.Lines.Text:=frmVidnovlennyRobit.memPidstava.Lines.Text+laboratory;
end;

procedure TfrmVidnovlennyRobit.aOKExecute(Sender: TObject);
begin
  if frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text='' then
  begin
    frmVidnovlennyRobit.aKimPrijnyteRishenny_UpdateExecute(sender);
    frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsOne;
    frmVidnovlennyRobit.cbKimPrijnyteRishenny.SetFocus;
    exit;
  end;
  if frmVidnovlennyRobit.edtNazvaPostanovi.Text='' then
  begin
    frmVidnovlennyRobit.aNazvaPostanoviUpdateExecute(sender);
    frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsOne;
    frmVidnovlennyRobit.edtNazvaPostanovi.SetFocus;
    exit;
  end;
  if frmVidnovlennyRobit.edtNomerAktuPerevirki.Text='' then
  begin
    frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsTwo;
    frmVidnovlennyRobit.edtNomerAktuPerevirki.SetFocus;
    exit;
  end;
  if frmVidnovlennyRobit.memPidstava.Lines.Count<=0 then
  begin
    frmVidnovlennyRobit.aPidstavaUpdateExecute(sender);
    frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsTwo;
    frmVidnovlennyRobit.memPidstava.SetFocus;
    exit;
  end;
  if frmVidnovlennyRobit.edtNomerLista.Text='' then
  begin
    frmVidnovlennyRobit.pcVidnovlennyRobit.ActivePage:=frmVidnovlennyRobit.tsTwo;
    frmVidnovlennyRobit.edtNomerLista.SetFocus;
    exit;
  end;
  with frmAdminZapobizhZahodi do
  begin
    qAdminZapobizhZahidi.SQL.Clear;
    qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set KIM_RISHENNY_VIDNOVLENNY=:KIM_RISHENNY_VIDNOVLENNY,NAZVA_POSTANOVI_VIDNOVLENNY=:NAZVA_POSTANOVI_VIDNOVLENNY,NOMER_AKTU_PEREVIRKI=:NOMER_AKTU_PEREVIRKI,';
////    qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set KIM_RISHENNY_VIDNOVLENNY=:KIM_RISHENNY_VIDNOVLENNY,NAZVA_POSTANOVI_VIDNOVLENNY=:NAZVA_POSTANOVI_VIDNOVLENNY,NOMER_AKTU_PEREVIRKI=:NOMER_AKTU_PEREVIRKI,';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_AKTU_PEREVIRKI=:DATA_AKTU_PEREVIRKI,PIDSTAVA_SCHODO_VIDNOVLENNY=:PIDSTAVA_SCHODO_VIDNOVLENNY,Z_YKOI_DATI=:Z_YKOI_DATI,DATA_VIDNOVLENNY_PRIMITKA=:DATA_VIDNOVLENNY_PRIMITKA,';
////    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_AKTU_PEREVIRKI=:DATA_AKTU_PEREVIRKI,PIDSTAVA_SCHODO_VIDNOVLENNY=:PIDSTAVA_SCHODO_VIDNOVLENNY,Z_YKOI_DATI=:Z_YKOI_DATI,DATA_VIDNOVLENNY_PRIMITKA=:DATA_VIDNOVLENNY_PRIMITKA,';
    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_LISTA_RISHENNY=:DATA_LISTA_RISHENNY,NOMER_LISTA_RISHENNY=:NOMER_LISTA_RISHENNY where RECORD_ID=:Kod';
//    qAdminZapobizhZahidi.SQL.Text:=qAdminZapobizhZahidi.SQL.Text+'DATA_LISTA_RISHENNY=:DATA_LISTA_RISHENNY,NOMER_LISTA_RISHENNY=:NOMER_LISTA_RISHENNY where RECORD_ID='+frmVidnovlennyRobit.edtRecord_ID.Text;
    qAdminZapobizhZahidi.Params.Clear;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[0].Name:='KIM_RISHENNY_VIDNOVLENNY';
    qAdminZapobizhZahidi.Params[0].Value:=frmVidnovlennyRobit.cbKimPrijnyteRishenny.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[1].Name:='NAZVA_POSTANOVI_VIDNOVLENNY';
    qAdminZapobizhZahidi.Params[1].Value:=frmVidnovlennyRobit.edtNazvaPostanovi.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[2].Name:='NOMER_AKTU_PEREVIRKI';
    qAdminZapobizhZahidi.Params[2].Value:=frmVidnovlennyRobit.edtNomerAktuPerevirki.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[3].Name:='DATA_AKTU_PEREVIRKI';
    qAdminZapobizhZahidi.Params[3].Value:=DateToStr(int(frmVidnovlennyRobit.dtpDataAktuPerevirki.Date));
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[4].Name:='PIDSTAVA_SCHODO_VIDNOVLENNY';
    qAdminZapobizhZahidi.Params[4].Value:=frmVidnovlennyRobit.memPidstava.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[5].Name:='Z_YKOI_DATI';
    qAdminZapobizhZahidi.Params[5].Value:=DateToStr(int(frmVidnovlennyRobit.dtpDataVidnovlennyRobit.Date));
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[6].Name:='DATA_VIDNOVLENNY_PRIMITKA';
    qAdminZapobizhZahidi.Params[6].Value:=frmVidnovlennyRobit.edtDataVidnovlennyPrimitka.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[7].Name:='DATA_LISTA_RISHENNY';
    qAdminZapobizhZahidi.Params[7].Value:=DateToStr(int(frmVidnovlennyRobit.dtpDataLista.Date));
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[8].Name:='NOMER_LISTA_RISHENNY';
    qAdminZapobizhZahidi.Params[8].Value:=frmVidnovlennyRobit.edtNomerLista.Text;
    qAdminZapobizhZahidi.Params.Add;
    qAdminZapobizhZahidi.params[9].Name:='Kod';
    qAdminZapobizhZahidi.Params[9].Value:=frmVidnovlennyRobit.edtRecord_ID.Text;
    qAdminZapobizhZahidi.Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmVidnovlennyRobit.Close;
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
  exit;
end;

procedure TfrmVidnovlennyRobit.aCancelExecute(Sender: TObject);
begin
  frmVidnovlennyRobit.Close;
end;

procedure TfrmVidnovlennyRobit.FormActivate(Sender: TObject);
begin
{
  try
    StrToInt(frmVidnovlennyRobit.edtNomerPostanovi.Text);
  except
    frmVidnovlennyRobit.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
  end;
  try
    StrToInt(frmVidnovlennyRobit.edtRecord_ID.Text);
  except
    frmVidnovlennyRobit.edtRecord_ID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value);
  end;
  frmVidnovlennyRobit.aKogoPovidomlenoUpdateExecute(sender);
  frmVidnovlennyRobit.aLaboratornijKontrolUpdateExecute(sender);
//  frmAdminZapobizhZahodi.aUpdateExecute(sender);
}
end;

end.
