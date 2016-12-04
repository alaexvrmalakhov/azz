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
    N11: TMenuItem;
    N12: TMenuItem;
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
{
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
}
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
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmObjekti do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where not TERITORY is null order by TERITORY';
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
    cbTeritory.Left:=4;
    cbTeritory.Width:=trunc(int(Width/2)-28);
    cbDistrict.Left:=cbTeritory.Left+cbTeritory.Width+4;
    cbDistrict.Width:=trunc(int(Width/2)-28);
    btnTeritoryUpdate.Left:=cbDistrict.Left+cbDistrict.Width+4;
    edtFind_NazvaObjekta.Left:=4;
    edtFind_NazvaObjekta.Width:=Width-24;
  end;
end;

procedure TfrmObjekti.aUpdateExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'select ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KODOBJEKTA as "Код", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.NAZVAOBJEKTA as "Назва об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ADRESAOBJEKTA as "Адреса об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDOMCHAPIPORYDKOVANIST as "Відомча підпорядкованість", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDDILENNY_BANKU as "Відділення банку", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_DKPP as "Код ДКПП", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_MFO as "Код МФО", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ROZRAHUNKOVIJ_RAHUNOK as "Розрахунковий рахунок"';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'from ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI,';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'where ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI.RAJON=:District ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  and ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.RAJON=RAJONI.KOD ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'order by ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.NAZVAOBJEKTA';
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
  frmObjekti.aUpdateExecute(sender);
end;

procedure TfrmObjekti.aSortByKodExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'select ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KODOBJEKTA as "Код", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.NAZVAOBJEKTA as "Назва об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ADRESAOBJEKTA as "Адреса об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDOMCHAPIPORYDKOVANIST as "Відомча підпорядкованість", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDDILENNY_BANKU as "Відділення банку", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_DKPP as "Код ДКПП", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_MFO as "Код МФО", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ROZRAHUNKOVIJ_RAHUNOK as "Розрахунковий рахунок"';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'from ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI,';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'where ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI.RAJON=:District ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  and ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.RAJON=RAJONI.KOD ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'order by ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KODOBJEKTA';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
    aSortByAdresa.Checked:=false;
    aSortByVidomchaPidporydkovanist.Checked:=false;
    edtFind_NazvaObjekta.Text:='';
  end;
end;

procedure TfrmObjekti.aSortByAdresaExecute(Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:='';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'select ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KODOBJEKTA as "Код", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.NAZVAOBJEKTA as "Назва об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ADRESAOBJEKTA as "Адреса об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDOMCHAPIPORYDKOVANIST as "Відомча підпорядкованість", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDDILENNY_BANKU as "Відділення банку", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_DKPP as "Код ДКПП", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_MFO as "Код МФО", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ROZRAHUNKOVIJ_RAHUNOK as "Розрахунковий рахунок"';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'from ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI,';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'where ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI.RAJON=:District ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  and ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.RAJON=RAJONI.KOD ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'order by ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ADRESAOBJEKTA';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=false;
    aSortByAdresa.Checked:=true;
    aSortByVidomchaPidporydkovanist.Checked:=false;
    edtFind_NazvaObjekta.Text:='';
  end;
end;

procedure TfrmObjekti.aSortByVidomchaPidporydkovanistExecute(
  Sender: TObject);
begin
  with frmObjekti do
  begin
    qObjekti.SQL.Clear;
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'select ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KODOBJEKTA as "Код", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.NAZVAOBJEKTA as "Назва об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ADRESAOBJEKTA as "Адреса об''єкта", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDOMCHAPIPORYDKOVANIST as "Відомча підпорядкованість", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDDILENNY_BANKU as "Відділення банку", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_DKPP as "Код ДКПП", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.KOD_MFO as "Код МФО", ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.ROZRAHUNKOVIJ_RAHUNOK as "Розрахунковий рахунок"';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'from ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI,';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'where ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  RAJONI.RAJON=:District ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  and ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.RAJON=RAJONI.KOD ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'order by ';
    qObjekti.SQL.Text:=qObjekti.SQL.Text+'  OBJEKTI.VIDOMCHAPIPORYDKOVANIST';
    qObjekti.Params.Clear;
    qObjekti.Params.Add;
    qObjekti.Params[0].Name:='District';
    qObjekti.Params[0].Value:=cbDistrict.Text;
    qObjekti.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=false;
    aSortByAdresa.Checked:=false;
    aSortByVidomchaPidporydkovanist.Checked:=true;
    edtFind_NazvaObjekta.Text:='';
  end;
end;

procedure TfrmObjekti.aChoiceExecute(Sender: TObject);
var
  Teritory, Rajon: integer;
begin
  if frmObjekti.qObjekti.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Вибрати відомості про об''єкт';
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;

  frmObjektiEdit.edtKodObjekta.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('Код').Value);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  with frmObjekti.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from OBJEKTI where KODOBJEKTA=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
    Open;
  end;
  if frmObjekti.qTeritory.Locate('KODOBJEKTA',StrToInt(frmObjektiEdit.edtKodObjekta.Text),[]) then
  begin
    Teritory:=frmObjekti.qTeritory.FieldByName('TERITORY').Value;
    Rajon:=frmObjekti.qTeritory.FieldByName('RAJON').Value;

    frmObjektiEdit.edtNazvaObjekta.Text:=frmObjekti.qTeritory.FieldByName('NAZVAOBJEKTA').Value;
    frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmObjekti.qTeritory.FieldByName('VIDOMCHAPIPORYDKOVANIST').Value;
    frmObjektiEdit.edtAdresaObjekta.Text:=frmObjekti.qTeritory.FieldByName('ADRESAOBJEKTA').Value;
    frmObjektiEdit.edtViddilennyBanku.Text:=frmObjekti.qTeritory.FieldByName('VIDDILENNY_BANKU').Value;
    frmObjektiEdit.edtKod_DKPP.Text:=frmObjekti.qTeritory.FieldByName('KOD_DKPP').Value;
    frmObjektiEdit.edtKod_MFO.Text:=frmObjekti.qTeritory.FieldByName('KOD_MFO').Value;
    frmObjektiEdit.edtRozrahunkovijRahunok.Text:=frmObjekti.qTeritory.FieldByName('ROZRAHUNKOVIJ_RAHUNOK').Value;
  end
  else
  begin
    Teritory:=-1;
    Rajon:=-1;

    frmObjektiEdit.edtNazvaObjekta.Text:='';
    frmObjektiEdit.edtVidomchaPidporydkovanist.Text:='';
    frmObjektiEdit.edtAdresaObjekta.Text:='';
    frmObjektiEdit.edtViddilennyBanku.Text:='';
    frmObjektiEdit.edtKod_DKPP.Text:='';
    frmObjektiEdit.edtKod_MFO.Text:='';
    frmObjektiEdit.edtRozrahunkovijRahunok.Text:='';
  end;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  if frmObjekti.qTeritory.Locate('KOD',Teritory,[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=false;
  frmObjektiEdit.btnTeritory.Enabled:=false;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  if frmObjekti.qTeritory.Locate('KOD',Rajon,[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Enabled:=false;
  frmObjektiEdit.btnDistrict.Enabled:=false;

  frmObjektiEdit.edtNazvaObjekta.Enabled:=false;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.edtAdresaObjekta.Enabled:=false;
  frmObjektiEdit.edtViddilennyBanku.Enabled:=false;
  frmObjektiEdit.edtKod_DKPP.Enabled:=false;
  frmObjektiEdit.edtKod_MFO.Enabled:=false;
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
    if (frmMain.PosN(frmObjekti.edtFind_NazvaObjekta.Text,frmObjekti.qObjekti.FieldByName('Назва об''єкта').Value,0)>0)or(frmMain.PosN(frmObjekti.edtFind_NazvaObjekta.Text,qObjekti.FieldByName('Адреса об''єкта').Value,0)>0) then Accept:=true else Accept:=false;
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
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;

  frmObjektiEdit.aKodUpdateExecute(sender);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

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
var
  Teritory, Rajon: integer;
begin
  if frmObjekti.qObjekti.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Редагувати відомості про об''єкт';
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;

  frmObjektiEdit.edtKodObjekta.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('Код').Value);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  with frmObjekti.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from OBJEKTI where KODOBJEKTA=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
    Open;
  end;
  if frmObjekti.qTeritory.Locate('KODOBJEKTA',StrToInt(frmObjektiEdit.edtKodObjekta.Text),[]) then
  begin
    Teritory:=frmObjekti.qTeritory.FieldByName('TERITORY').Value;
    Rajon:=frmObjekti.qTeritory.FieldByName('RAJON').Value;

    frmObjektiEdit.edtNazvaObjekta.Text:=frmObjekti.qTeritory.FieldByName('NAZVAOBJEKTA').Value;
    frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmObjekti.qTeritory.FieldByName('VIDOMCHAPIPORYDKOVANIST').Value;
    frmObjektiEdit.edtAdresaObjekta.Text:=frmObjekti.qTeritory.FieldByName('ADRESAOBJEKTA').Value;
    frmObjektiEdit.edtViddilennyBanku.Text:=frmObjekti.qTeritory.FieldByName('VIDDILENNY_BANKU').Value;
    frmObjektiEdit.edtKod_DKPP.Text:=frmObjekti.qTeritory.FieldByName('KOD_DKPP').Value;
    frmObjektiEdit.edtKod_MFO.Text:=frmObjekti.qTeritory.FieldByName('KOD_MFO').Value;
    frmObjektiEdit.edtRozrahunkovijRahunok.Text:=frmObjekti.qTeritory.FieldByName('ROZRAHUNKOVIJ_RAHUNOK').Value;
  end
  else
  begin
    Teritory:=-1;
    Rajon:=-1;

    frmObjektiEdit.edtNazvaObjekta.Text:='';
    frmObjektiEdit.edtVidomchaPidporydkovanist.Text:='';
    frmObjektiEdit.edtAdresaObjekta.Text:='';
    frmObjektiEdit.edtViddilennyBanku.Text:='';
    frmObjektiEdit.edtKod_DKPP.Text:='';
    frmObjektiEdit.edtKod_MFO.Text:='';
    frmObjektiEdit.edtRozrahunkovijRahunok.Text:='';
  end;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  if frmObjekti.qTeritory.Locate('KOD',Teritory,[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=true;
  frmObjektiEdit.btnTeritory.Enabled:=true;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  if frmObjekti.qTeritory.Locate('KOD',Rajon,[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Enabled:=true;
  frmObjektiEdit.btnDistrict.Enabled:=true;

  frmObjektiEdit.edtNazvaObjekta.Enabled:=true;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=true;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=true;
  frmObjektiEdit.edtAdresaObjekta.Enabled:=true;
  frmObjektiEdit.edtViddilennyBanku.Enabled:=true;
  frmObjektiEdit.edtKod_DKPP.Enabled:=true;
  frmObjektiEdit.edtKod_MFO.Enabled:=true;
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
var
  Teritory, Rajon: integer;
begin
  if frmObjekti.qObjekti.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmObjektiEdit') then frmObjektiEdit:=TfrmObjektiEdit.Create(self);
  frmMain.Enabled:=false;
  frmObjektiEdit.Show;
  frmObjektiEdit.Caption:='Видалити відомості про об''єкт';
  frmObjektiEdit.Position:=poMainFormCenter;
  frmObjektiEdit.BorderStyle:=bsDialog;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmObjekti.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmObjekti.Enabled:=false;

  frmObjektiEdit.edtKodObjekta.Text:=IntToStr(frmObjekti.qObjekti.FieldByName('Код').Value);
  frmObjektiEdit.edtKodObjekta.Enabled:=false;
  frmObjektiEdit.btnKodObjekta.Enabled:=false;

  with frmObjekti.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from OBJEKTI where KODOBJEKTA=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmObjektiEdit.edtKodObjekta.Text;
    Open;
  end;
  if frmObjekti.qTeritory.Locate('KODOBJEKTA',StrToInt(frmObjektiEdit.edtKodObjekta.Text),[]) then
  begin
    Teritory:=frmObjekti.qTeritory.FieldByName('TERITORY').Value;
    Rajon:=frmObjekti.qTeritory.FieldByName('RAJON').Value;

    frmObjektiEdit.edtNazvaObjekta.Text:=frmObjekti.qTeritory.FieldByName('NAZVAOBJEKTA').Value;
    frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmObjekti.qTeritory.FieldByName('VIDOMCHAPIPORYDKOVANIST').Value;
    frmObjektiEdit.edtAdresaObjekta.Text:=frmObjekti.qTeritory.FieldByName('ADRESAOBJEKTA').Value;
    frmObjektiEdit.edtViddilennyBanku.Text:=frmObjekti.qTeritory.FieldByName('VIDDILENNY_BANKU').Value;
    frmObjektiEdit.edtKod_DKPP.Text:=frmObjekti.qTeritory.FieldByName('KOD_DKPP').Value;
    frmObjektiEdit.edtKod_MFO.Text:=frmObjekti.qTeritory.FieldByName('KOD_MFO').Value;
    frmObjektiEdit.edtRozrahunkovijRahunok.Text:=frmObjekti.qTeritory.FieldByName('ROZRAHUNKOVIJ_RAHUNOK').Value;
  end
  else
  begin
    Teritory:=-1;
    Rajon:=-1;

    frmObjektiEdit.edtNazvaObjekta.Text:='';
    frmObjektiEdit.edtVidomchaPidporydkovanist.Text:='';
    frmObjektiEdit.edtAdresaObjekta.Text:='';
    frmObjektiEdit.edtViddilennyBanku.Text:='';
    frmObjektiEdit.edtKod_DKPP.Text:='';
    frmObjektiEdit.edtKod_MFO.Text:='';
    frmObjektiEdit.edtRozrahunkovijRahunok.Text:='';
  end;

  frmObjektiEdit.aTeritoryUpdateExecute(sender);
  if frmObjekti.qTeritory.Locate('KOD',Teritory,[]) then frmObjektiEdit.cbTeritory.Text:=frmObjekti.qTeritory.FieldByName('TERITORY').Value else frmObjektiEdit.cbTeritory.Text:='';
  frmObjektiEdit.cbTeritory.Enabled:=false;
  frmObjektiEdit.btnTeritory.Enabled:=false;

  frmObjektiEdit.aDistrictUpdateExecute(sender);
  if frmObjekti.qTeritory.Locate('KOD',Rajon,[]) then frmObjektiEdit.cbDistrict.Text:=frmObjekti.qTeritory.FieldByName('RAJON').Value else frmObjektiEdit.cbDistrict.Text:='';
  frmObjektiEdit.cbDistrict.Enabled:=false;
  frmObjektiEdit.btnDistrict.Enabled:=false;

  frmObjektiEdit.edtNazvaObjekta.Enabled:=false;
  frmObjektiEdit.edtVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.btnVidomchaPidporydkovanist.Enabled:=false;
  frmObjektiEdit.edtAdresaObjekta.Enabled:=false;
  frmObjektiEdit.edtViddilennyBanku.Enabled:=false;
  frmObjektiEdit.edtKod_DKPP.Enabled:=false;
  frmObjektiEdit.edtKod_MFO.Enabled:=false;
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

