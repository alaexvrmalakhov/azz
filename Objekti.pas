unit Objekti;

interface

uses
  Forms, DB, Menus, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils;

type
  TfrmObjekti = class(TForm)
    DBGrid1: TDBGrid;
    alObjekti: TActionList;
    aTeritoryUpdate: TAction;
    Panel1: TPanel;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    btnTeritoryUpdate: TButton;
    qTeritory: TIBQuery;
    Panel2: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    PopupMenu: TPopupMenu;
    mnUpdate: TMenuItem;
    aUpdate: TAction;
    dsObjekti: TDataSource;
    qObjekti: TIBQuery;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    aSortByAdresa: TAction;
    aSortByVidomchaPidporydkovanist: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    aChoice: TAction;
    N6: TMenuItem;
    aClose: TAction;
    N7: TMenuItem;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    aDistrictChange: TAction;
    Panel3: TPanel;
    edtFind_NazvaObjekta: TEdit;
    aAdd: TAction;
    N8: TMenuItem;
    aEdit: TAction;
    N9: TMenuItem;
    aDelete: TAction;
    N10: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByAdresaExecute(Sender: TObject);
    procedure aSortByVidomchaPidporydkovanistExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictChangeExecute(Sender: TObject);
    procedure qObjektiFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure edtFind_NazvaObjektaChange(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmObjekti: TfrmObjekti;

implementation

uses
  Main, FinansoviSankciiEdit, AdminZapobizhZahodiEdit, ShtrafiEdit,
  ViluchennyZRealizaciiEdit, Opechanuvanny, ObjektiEdit, Filter;

{$R *.dfm}

procedure TfrmObjekti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmObjekti.qObjekti.Close;
  frmObjekti.qTeritory.Close;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmObjekti.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmObjekti.Enabled:=true;
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmObjekti.Enabled:=true;
    frmOpechanuvanny.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmObjekti.aTeritoryUpdateExecute(Sender: TObject);
var
  ministry: integer;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmObjekti do
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
    ministry:=INIAZZ.ReadInteger('Teritory','Ministry',ministry);
    if qTeritory.Locate('KOD',ministry,[]) then cbMinistry.Text:=qTeritory.FieldByName('MINISTRY').Value else cbMinistry.Text:='';

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry order by TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=ministry;
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
    aUpdateExecute(sender);
  end;
  INIAZZ.Free;
end;

procedure TfrmObjekti.FormResize(Sender: TObject);
begin
  with frmObjekti do
  begin
    cbMinistry.Left:=4;
    cbMinistry.Width:=trunc(int(Width/3)-17);
    cbTeritory.Left:=cbMinistry.Width+cbMinistry.Left+4;
    cbTeritory.Width:=trunc(int(Width/3)-17);
    cbDistrict.Left:=cbTeritory.Left+cbTeritory.Width+4;
    cbDistrict.Width:=trunc(int(Width/3)-17);
    btnTeritoryUpdate.Left:=cbDistrict.Left+cbDistrict.Width+4;
    edtFind_NazvaObjekta.Left:=4;
    edtFind_NazvaObjekta.Width:=Width-16;
  end;
end;

procedure TfrmObjekti.aUpdateExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='select * from OBJEKTI,RAJONI where RAJONI.RAJON=:District and OBJEKTI.RAJON=RAJONI.KOD order by OBJEKTI.NAZVAOBJEKTA';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
    aSortByAdresa.Checked:=false;
    aSortByVidomchaPidporydkovanist.Checked:=false;
    edtFind_NazvaObjekta.Text:='';
  end;
end;

procedure TfrmObjekti.aSortByNazvaExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='select * from OBJEKTI,RAJONI where RAJONI.RAJON=:District and OBJEKTI.RAJON=RAJONI.KOD order by OBJEKTI.NAZVAOBJEKTA';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
    aSortByAdresa.Checked:=false;
    aSortByVidomchaPidporydkovanist.Checked:=false;
  end;
end;

procedure TfrmObjekti.aSortByKodExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='select * from OBJEKTI,RAJONI where RAJONI.RAJON=:District and OBJEKTI.RAJON=RAJONI.KOD order by OBJEKTI.KODOBJEKTA';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
    aSortByAdresa.Checked:=false;
    aSortByVidomchaPidporydkovanist.Checked:=false;
  end;
end;

procedure TfrmObjekti.aSortByAdresaExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='select * from OBJEKTI,RAJONI where RAJONI.RAJON=:District and OBJEKTI.RAJON=RAJONI.KOD order by OBJEKTI.ADRESAOBJEKTA';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=false;
    aSortByAdresa.Checked:=true;
    aSortByVidomchaPidporydkovanist.Checked:=false;
  end;
end;

procedure TfrmObjekti.aSortByVidomchaPidporydkovanistExecute(
  Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='select * from OBJEKTI,RAJONI where RAJONI.RAJON=:District and OBJEKTI.RAJON=RAJONI.KOD order by OBJEKTI.VIDOMCHAPIPORYDKOVANIST';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=false;
    aSortByAdresa.Checked:=false;
    aSortByVidomchaPidporydkovanist.Checked:=true;
  end;
end;

procedure TfrmObjekti.aChoiceExecute(Sender: TObject);
begin
  if frmObjekti.qObjekti.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Вибрати відомості про об''єкт';
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;

  frmObjektiEdit.edtKodObjekta.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('KODOBJEKTA').Value);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  frmObjektiEdit.aMinistryUpdateExecute(sender);
  frmObjektiEdit.cbMinistry.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('MINISTRY').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbMinistry.Text),[]) then frmObjektiEdit.cbMinistry.Text:=frmObjekti.qTeritory.FieldByName('MINISTRY').Value else frmObjektiEdit.cbMinistry.Text:='';
  frmObjektiEdit.cbMinistry.Enabled:=false;
  frmObjektiEdit.btnMinistryUpdate.Enabled:=false;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  frmObjektiEdit.cbTeritory.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('TERITORY').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbTeritory.Text),[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=false;
  frmObjektiEdit.btnTeritory.Enabled:=false;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  frmObjektiEdit.cbDistrict.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('RAJON').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbDistrict.Text),[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Enabled:=false;
  frmObjektiEdit.btnDistrict.Enabled:=false;

  frmObjektiEdit.edtNazvaObjekta.Text:=frmObjekti.qObjekti.FieldByName('NAZVAOBJEKTA').Value;
  frmObjektiEdit.edtNazvaObjekta.Enabled:=false;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmObjekti.qObjekti.FieldByName('VIDOMCHAPIPORYDKOVANIST').Value;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.edtAdresaObjekta.Text:=frmObjekti.qObjekti.FieldByName('ADRESAOBJEKTA').Value;
  frmObjektiEdit.edtAdresaObjekta.Enabled:=false;
  frmObjektiEdit.edtViddilennyBanku.Text:=frmObjekti.qObjekti.FieldByName('VIDDILENNY_BANKU').Value;
  frmObjektiEdit.edtViddilennyBanku.Enabled:=false;
  frmObjektiEdit.edtKod_DKPP.Text:=frmObjekti.qObjekti.FieldByName('KOD_DKPP').Value;
  frmObjektiEdit.edtKod_DKPP.Enabled:=false;
  frmObjektiEdit.edtKod_MFO.Text:=frmObjekti.qObjekti.FieldByName('KOD_MFO').Value;
  frmObjektiEdit.edtKod_MFO.Enabled:=false;
  frmObjektiEdit.edtRozrahunkovijRahunok.Text:=frmObjekti.qObjekti.FieldByName('ROZRAHUNKOVIJ_RAHUNOK').Value;
  frmObjektiEdit.edtRozrahunkovijRahunok.Enabled:=false;

  frmObjektiEdit.DBGrid1.Align:=alClient;
  frmObjektiEdit.aUpdateExecute(sender);
  frmObjektiEdit.aAdd.Enabled:=false;
  frmObjektiEdit.aEdit.Enabled:=false;
  frmObjektiEdit.aDelete.Enabled:=false;
  frmObjektiEdit.aMove.Enabled:=false;
  frmObjektiEdit.aUpdate.Enabled:=true;

  frmObjektiEdit.btnVikonati.SetFocus;
end;

procedure TfrmObjekti.aCloseExecute(Sender: TObject);
begin
  frmObjekti.Close;
end;

procedure TfrmObjekti.aMinistryChangeExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
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
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmObjekti.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    qTeritory.SQL.Clear;
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
    aUpdateExecute(sender);
  end;
end;

procedure TfrmObjekti.aDistrictChangeExecute(Sender: TObject);
begin
  frmObjekti.aUpdateExecute(sender);
end;

procedure TfrmObjekti.qObjektiFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if frmObjekti.ActiveControl=frmObjekti.edtFind_NazvaObjekta then
    if (frmMain.PosN(frmObjekti.edtFind_NazvaObjekta.Text,frmObjekti.qObjekti.FieldByName('NAZVAOBJEKTA').Value,0)>0)or(frmMain.PosN(frmObjekti.edtFind_NazvaObjekta.Text,qObjekti.FieldByName('ADRESAOBJEKTA').Value,0)>0) then Accept:=true else Accept:=false;
end;

procedure TfrmObjekti.edtFind_NazvaObjektaChange(Sender: TObject);
begin
  frmObjekti.qObjekti.Filtered:=false;
  if frmObjekti.edtFind_NazvaObjekta.Text<>'' then frmObjekti.qObjekti.Filtered:=true else frmObjekti.qObjekti.Filtered:=false;
end;

procedure TfrmObjekti.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Додати об''єкт нагляду';
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;

  frmObjektiEdit.aKodUpdateExecute(sender);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  frmObjektiEdit.aMinistryUpdateExecute(sender);
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmObjektiEdit.cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',frmObjektiEdit.cbMinistry.Text);
  INIAZZ.Free;
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbMinistry.Text),[]) then frmObjektiEdit.cbMinistry.Text:=frmObjekti.qTeritory.FieldByName('MINISTRY').Value else frmObjektiEdit.cbMinistry.Text:='';
  frmObjektiEdit.cbMinistry.Enabled:=true;
  frmObjektiEdit.btnMinistryUpdate.Enabled:=true;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmObjektiEdit.cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',frmObjektiEdit.cbTeritory.Text);
  INIAZZ.Free;
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbTeritory.Text),[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=true;
  frmObjektiEdit.btnTeritory.Enabled:=true;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  frmObjektiEdit.cbDistrict.Enabled:=true;
  frmObjektiEdit.btnDistrict.Enabled:=true;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmObjektiEdit.cbDistrict.Text:=INIAZZ.ReadString('Teritory','District',frmObjektiEdit.cbDistrict.Text);
  INIAZZ.Free;
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbDistrict.Text),[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';

  frmObjektiEdit.edtNazvaObjekta.Text:='';
  frmObjektiEdit.edtNazvaObjekta.Enabled:=true;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Text:='';
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  frmObjektiEdit.edtAdresaObjekta.Text:='';
  frmObjektiEdit.edtAdresaObjekta.Enabled:=true;
  frmObjektiEdit.edtViddilennyBanku.Text:='';
  frmObjektiEdit.edtViddilennyBanku.Enabled:=true;
  frmObjektiEdit.edtKod_DKPP.Text:='';
  frmObjektiEdit.edtKod_DKPP.Enabled:=true;
  frmObjektiEdit.edtKod_MFO.Text:='';
  frmObjektiEdit.edtKod_MFO.Enabled:=true;
  frmObjektiEdit.edtRozrahunkovijRahunok.Text:='';
  frmObjektiEdit.edtRozrahunkovijRahunok.Enabled:=true;

  frmObjektiEdit.DBGrid1.Align:=alClient;
  frmObjektiEdit.aUpdateExecute(sender);
  frmObjektiEdit.aAdd.Enabled:=true;
  frmObjektiEdit.aEdit.Enabled:=true;
  frmObjektiEdit.aDelete.Enabled:=true;
  frmObjektiEdit.aMove.Enabled:=true;
  frmObjektiEdit.aUpdate.Enabled:=true;

  frmObjektiEdit.edtNazvaObjekta.SetFocus;
end;

procedure TfrmObjekti.aEditExecute(Sender: TObject);
begin
  if frmObjekti.qObjekti.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Редагувати відомості про об''єкт';
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;

  frmObjektiEdit.edtKodObjekta.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('KODOBJEKTA').Value);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  frmObjektiEdit.aMinistryUpdateExecute(sender);
  frmObjektiEdit.cbMinistry.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('MINISTRY').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbMinistry.Text),[]) then frmObjektiEdit.cbMinistry.Text:=frmObjekti.qTeritory.FieldByName('MINISTRY').Value else frmObjektiEdit.cbMinistry.Text:='';
  frmObjektiEdit.cbMinistry.Enabled:=true;
  frmObjektiEdit.btnMinistryUpdate.Enabled:=true;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  frmObjektiEdit.cbTeritory.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('TERITORY').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbTeritory.Text),[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=true;
  frmObjektiEdit.btnTeritory.Enabled:=true;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  frmObjektiEdit.cbDistrict.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('RAJON').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbDistrict.Text),[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Enabled:=true;
  frmObjektiEdit.btnDistrict.Enabled:=true;

  frmObjektiEdit.edtNazvaObjekta.Text:=frmObjekti.qObjekti.FieldByName('NAZVAOBJEKTA').Value;
  frmObjektiEdit.edtNazvaObjekta.Enabled:=true;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmObjekti.qObjekti.FieldByName('VIDOMCHAPIPORYDKOVANIST').Value;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  frmObjektiEdit.edtAdresaObjekta.Text:=frmObjekti.qObjekti.FieldByName('ADRESAOBJEKTA').Value;
  frmObjektiEdit.edtAdresaObjekta.Enabled:=true;
  frmObjektiEdit.edtViddilennyBanku.Text:=frmObjekti.qObjekti.FieldByName('VIDDILENNY_BANKU').Value;
  frmObjektiEdit.edtViddilennyBanku.Enabled:=true;
  frmObjektiEdit.edtKod_DKPP.Text:=frmObjekti.qObjekti.FieldByName('KOD_DKPP').Value;
  frmObjektiEdit.edtKod_DKPP.Enabled:=true;
  frmObjektiEdit.edtKod_MFO.Text:=frmObjekti.qObjekti.FieldByName('KOD_MFO').Value;
  frmObjektiEdit.edtKod_MFO.Enabled:=true;
  frmObjektiEdit.edtRozrahunkovijRahunok.Text:=frmObjekti.qObjekti.FieldByName('ROZRAHUNKOVIJ_RAHUNOK').Value;
  frmObjektiEdit.edtRozrahunkovijRahunok.Enabled:=true;

  frmObjektiEdit.DBGrid1.Align:=alClient;
  frmObjektiEdit.aUpdateExecute(sender);
  frmObjektiEdit.aAdd.Enabled:=true;
  frmObjektiEdit.aEdit.Enabled:=true;
  frmObjektiEdit.aDelete.Enabled:=true;
  frmObjektiEdit.aMove.Enabled:=true;
  frmObjektiEdit.aUpdate.Enabled:=true;

  frmObjektiEdit.edtNazvaObjekta.SetFocus;
end;

procedure TfrmObjekti.aDeleteExecute(Sender: TObject);
begin
  if frmObjekti.qObjekti.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Видалити відомості про об''єкт';
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;

  frmObjektiEdit.edtKodObjekta.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('KODOBJEKTA').Value);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  frmObjektiEdit.aMinistryUpdateExecute(sender);
  frmObjektiEdit.cbMinistry.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('MINISTRY').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbMinistry.Text),[]) then frmObjektiEdit.cbMinistry.Text:=frmObjekti.qTeritory.FieldByName('MINISTRY').Value else frmObjektiEdit.cbMinistry.Text:='';
  frmObjektiEdit.cbMinistry.Enabled:=false;
  frmObjektiEdit.btnMinistryUpdate.Enabled:=false;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  frmObjektiEdit.cbTeritory.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('TERITORY').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbTeritory.Text),[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=false;
  frmObjektiEdit.btnTeritory.Enabled:=false;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  frmObjektiEdit.cbDistrict.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('RAJON').Value);
  if frmObjekti.qTeritory.Locate('KOD',StrToInt(frmObjektiEdit.cbDistrict.Text),[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Enabled:=false;
  frmObjektiEdit.btnDistrict.Enabled:=false;

  frmObjektiEdit.edtNazvaObjekta.Text:=frmObjekti.qObjekti.FieldByName('NAZVAOBJEKTA').Value;
  frmObjektiEdit.edtNazvaObjekta.Enabled:=false;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmObjekti.qObjekti.FieldByName('VIDOMCHAPIPORYDKOVANIST').Value;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.edtAdresaObjekta.Text:=frmObjekti.qObjekti.FieldByName('ADRESAOBJEKTA').Value;
  frmObjektiEdit.edtAdresaObjekta.Enabled:=false;
  frmObjektiEdit.edtViddilennyBanku.Text:=frmObjekti.qObjekti.FieldByName('VIDDILENNY_BANKU').Value;
  frmObjektiEdit.edtViddilennyBanku.Enabled:=false;
  frmObjektiEdit.edtKod_DKPP.Text:=frmObjekti.qObjekti.FieldByName('KOD_DKPP').Value;
  frmObjektiEdit.edtKod_DKPP.Enabled:=false;
  frmObjektiEdit.edtKod_MFO.Text:=frmObjekti.qObjekti.FieldByName('KOD_MFO').Value;
  frmObjektiEdit.edtKod_MFO.Enabled:=false;
  frmObjektiEdit.edtRozrahunkovijRahunok.Text:=frmObjekti.qObjekti.FieldByName('ROZRAHUNKOVIJ_RAHUNOK').Value;
  frmObjektiEdit.edtRozrahunkovijRahunok.Enabled:=false;

  frmObjektiEdit.DBGrid1.Align:=alClient;
  frmObjektiEdit.aUpdateExecute(sender);
  frmObjektiEdit.aAdd.Enabled:=false;
  frmObjektiEdit.aEdit.Enabled:=false;
  frmObjektiEdit.aDelete.Enabled:=false;
  frmObjektiEdit.aMove.Enabled:=false;
  frmObjektiEdit.aUpdate.Enabled:=true;

  frmObjektiEdit.btnVidmina.SetFocus;
end;

procedure TfrmObjekti.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmObjekti.dsObjekti;
end;

end.

