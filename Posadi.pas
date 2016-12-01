unit Posadi;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils;

type
  TfrmPosadi = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    alPosadi: TActionList;
    qTeritory: TIBQuery;
    aUpdate: TAction;
    btnUpdate: TButton;
    dsPosadi: TDataSource;
    qPosadi: TIBQuery;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    mnSortByKod: TMenuItem;
    mnSortByNazva: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aUpdateExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmPosadi: TfrmPosadi;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, Raport,
  AdminZapobizhZahodiEdit, ShtrafiEdit, Opechanuvanny, NapravlenoDoVidoma,
  NapravlennyEdit, SpivrobitnikiEdit, PosadiEdit, Filter;

{$R *.dfm}

procedure TfrmPosadi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPosadi.qTeritory.Close;
  frmPosadi.qPosadi.Close;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
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

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmRaport') then
  begin
    frmRaport.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmOpechanuvanny.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
  begin
    frmNapravlenoDoVidoma.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlennyEdit') then
  begin
    frmNapravlennyEdit.Enabled:=true;
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

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmSpivrobitnikiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit; 
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmPosadi.aUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qPosadi.SQL.Clear;
    qPosadi.SQL.Text:='select KODPOSADI as "Код посади", NAZVAPOSADI as "Посада" from POSADI where not NAZVAPOSADI is null order by NAZVAPOSADI';
    qPosadi.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmPosadi.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Додавання нової посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=true;
  frmPosadiEdit.btnVidminok.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi.SetFocus;
end;

procedure TfrmPosadi.aEditExecute(Sender: TObject);
begin
  if frmPosadi.qPosadi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Редагування посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  with frmPosadi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from POSADI where KODPOSADI=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmPosadi.qPosadi.FieldByName('Код посади').Value;
    Open;
  end;
  if not frmPosadi.qTeritory.FieldByName('KODPOSADI').IsNull then frmPosadiEdit.edtKodPosadi.Text:=IntToStr(frmPosadi.qTeritory.FieldByName('KODPOSADI').Value) else frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  if not frmPosadi.qTeritory.FieldByName('NAZVAPOSADI').IsNull then frmPosadiEdit.edtNazvaposadi.Text:=frmPosadi.qTeritory.FieldByName('NAZVAPOSADI').Value else frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=true;
  if not frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_RV').IsNull then frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_RV').Value else frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=true;
  if not frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_TV').IsNull then frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_TV').Value else frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=true;
  frmPosadiEdit.btnVidminok.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi.SetFocus;
end;

procedure TfrmPosadi.aDeleteExecute(Sender: TObject);
begin
  if frmPosadi.qPosadi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Видалення посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  with frmPosadi.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from POSADI where KODPOSADI=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmPosadi.qPosadi.FieldByName('Код посади').Value;
    Open;
  end;
  if not frmPosadi.qTeritory.FieldByName('KODPOSADI').IsNull then frmPosadiEdit.edtKodPosadi.Text:=IntToStr(frmPosadi.qTeritory.FieldByName('KODPOSADI').Value) else frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  if not frmPosadi.qTeritory.FieldByName('NAZVAPOSADI').IsNull then frmPosadiEdit.edtNazvaposadi.Text:=frmPosadi.qTeritory.FieldByName('NAZVAPOSADI').Value else frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=false;
  if not frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_RV').IsNull then frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_RV').Value else frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=false;
  if not frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_TV').IsNull then frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadi.qTeritory.FieldByName('NAZVAPOSADI_TV').Value else frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=false;
  frmPosadiEdit.btnVidminok.Enabled:=false;
  frmPosadiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmPosadi.aChoiceExecute(Sender: TObject);
begin
{
  if frmPosadi.qPosadi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Вибір посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  if not frmPosadi.qPosadi.FieldByName('KODPOSADI').IsNull then frmPosadiEdit.edtKodPosadi.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('KODPOSADI').Value) else frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  frmPosadiEdit.aMinistrUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('MINISTRY').IsNull then frmPosadiEdit.cbMinistry.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('MINISTRY').Value) else frmPosadiEdit.cbMinistry.Text:='0';
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbMinistry.Text),[]) then frmPosadiEdit.cbMinistry.Text:=frmPosadi.qTeritory.FieldByName('MINISTRY').Value else frmPosadiEdit.cbMinistry.Text:='';
  frmPosadiEdit.cbMinistry.Enabled:=false;
  frmPosadiEdit.btnMinistryUpdate.Enabled:=false;
  frmPosadiEdit.btnMinistryChoice.Enabled:=false;

  frmPosadiEdit.aTeritoryUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('TERITORY').IsNull then frmPosadiEdit.cbTeritory.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('TERITORY').Value) else frmPosadiEdit.cbTeritory.Text:='0';
  frmPosadiEdit.cbTeritory.Enabled:=false;
  frmPosadiEdit.btnTeritoryUpdate.Enabled:=false;
  frmPosadiEdit.btnTeritoryChoice.Enabled:=false;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbTeritory.Text),[]) then frmPosadiEdit.cbTeritory.Text:=frmPosadi.qTeritory.FieldByName('TERITORY').Value else frmPosadiEdit.cbTeritory.Text:='';

  frmPosadiEdit.aDistrictUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('RAJON').IsNull then frmPosadiEdit.cbRajon.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('RAJON').Value) else frmPosadiEdit.cbRajon.Text:='0';
  frmPosadiEdit.cbRajon.Enabled:=false;
  frmPosadiEdit.btnRajonUpdate.Enabled:=false;
  frmPosadiEdit.btnRajonChoice.Enabled:=false;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbRajon.Text),[]) then frmPosadiEdit.cbRajon.Text:=frmPosadi.qTeritory.FieldByName('RAJON').Value else frmPosadiEdit.cbRajon.Text:='';

  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').IsNull then frmPosadiEdit.edtNazvaposadi.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').Value else frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=false;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').IsNull then frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').Value else frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=false;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').IsNull then frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').Value else frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=false;
  frmPosadiEdit.btnVidminok.Enabled:=false;
  frmPosadiEdit.btnVikonati.SetFocus;
}
end;

procedure TfrmPosadi.aCloseExecute(Sender: TObject);
begin
  frmPosadi.Close;
end;

procedure TfrmPosadi.aSortByKodExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qPosadi.SQL.Clear;
    qPosadi.SQL.Text:='select KODPOSADI as "Код посади", NAZVAPOSADI as "Посада" from POSADI where not NAZVAPOSADI is null order by KODPOSADI';
    qPosadi.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmPosadi.aSortByNazvaExecute(Sender: TObject);
begin
  frmPosadi.aUpdateExecute(sender);
end;

procedure TfrmPosadi.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmPosadi.dsPosadi;
end;

end.
