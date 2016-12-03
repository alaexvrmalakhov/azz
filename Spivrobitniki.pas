unit Spivrobitniki;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils, Dialogs;

type
  TfrmSpivrobitniki = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    Panel2: TPanel;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    btnMin_Ter_Raj: TButton;
    btnUpdate: TButton;
    alSpivrobitniki: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    mnClose: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    mnSort: TMenuItem;
    aSortByKod: TAction;
    aSortByViddilenny: TAction;
    aSortByPosada: TAction;
    aSortByPrizvische: TAction;
    dsSpivrobitniki: TDataSource;
    qSpivrobitniki: TIBQuery;
    qTeritory: TIBQuery;
    aTeritoryUpdate: TAction;
    aTeritoryChange: TAction;
    aRajonChange: TAction;
    mnSortByKod: TMenuItem;
    mnSortByPosada: TMenuItem;
    mnSortByPrizvisxhe: TMenuItem;
    mnSortByViddilenny: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByPrizvischeExecute(Sender: TObject);
    procedure aSortByPosadaExecute(Sender: TObject);
    procedure aSortByViddilennyExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure cbRajonChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmSpivrobitniki: TfrmSpivrobitniki;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, Raport, Opechanuvanny,
  SpivrobitnikiEdit, Filter, KoristuvachiEdit;

{$R *.dfm}

procedure TfrmSpivrobitniki.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmKoristuvachiEdit') then
  begin
    frmKoristuvachiEdit.Enabled:=true;
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

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
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

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmSpivrobitniki.FormResize(Sender: TObject);
begin
  frmSpivrobitniki.btnMin_Ter_Raj.Left:=frmSpivrobitniki.Width-90;
  frmSpivrobitniki.cbTeritory.Left:=8;
  frmSpivrobitniki.cbTeritory.Width:=trunc(frmSpivrobitniki.Width/2)-52;
  frmSpivrobitniki.cbRajon.Left:=frmSpivrobitniki.cbTeritory.Left+frmSpivrobitniki.cbTeritory.Width+4;
  frmSpivrobitniki.cbRajon.Width:=trunc(frmSpivrobitniki.Width/2)-52;
end;

procedure TfrmSpivrobitniki.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmSpivrobitnikiEdit:=TfrmSpivrobitnikiEdit.Create(self);
  frmMain.Enabled:=false;
  frmSpivrobitnikiEdit.Show;
//  if frmMain.IsFormOpen('frmKoristuvachiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmRaport') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmSpivrobitniki.Enabled:=false;
  frmSpivrobitnikiEdit.Caption:='Додавання нового співробітника';
  frmSpivrobitnikiEdit.BorderStyle:=bsDialog;
  frmSpivrobitnikiEdit.Position:=poMainFormCenter;

  frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
  frmSpivrobitnikiEdit.edtKodSpivrobitnika.Enabled:=false;
  frmSpivrobitnikiEdit.btnKodSpivrobitnika.Enabled:=false;

  frmSpivrobitnikiEdit.aTeritoryUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbTeritory.Enabled:=true;
  frmSpivrobitnikiEdit.btnTeritoryUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnTeritoryChoice.Enabled:=true;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmSpivrobitnikiEdit.cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',frmSpivrobitnikiEdit.cbTeritory.Text);
  INIAZZ.Free;
  with frmSpivrobitniki.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from TERITORY order by KOD';
    Open;
  end;
  if frmSpivrobitniki.qTeritory.Locate('KOD',StrToInt(frmSpivrobitnikiEdit.cbTeritory.Text),[]) then frmSpivrobitnikiEdit.cbTeritory.Text:=frmSpivrobitniki.qTeritory.FieldByName('TERITORY').Value else frmSpivrobitnikiEdit.cbTeritory.Text:='';

  frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbRajon.Enabled:=true;
  frmSpivrobitnikiEdit.btnRajonUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnRajonChoice.Enabled:=true;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmSpivrobitnikiEdit.cbRajon.Text:=INIAZZ.ReadString('Teritory','District',frmSpivrobitnikiEdit.cbRajon.Text);
  INIAZZ.Free;
  if frmSpivrobitniki.qTeritory.Locate('KOD',StrToInt(frmSpivrobitnikiEdit.cbRajon.Text),[]) then frmSpivrobitnikiEdit.cbRajon.Text:=frmSpivrobitniki.qTeritory.FieldByName('RAJON').Value else frmSpivrobitnikiEdit.cbRajon.Text:='';

  frmSpivrobitnikiEdit.aViddilennyUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbViddilenny.Enabled:=true;
  frmSpivrobitnikiEdit.btnViddilennyUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnViddilennyChoice.Enabled:=true;

  frmSpivrobitnikiEdit.aPosadaUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbPosada.Enabled:=true;
  frmSpivrobitnikiEdit.btnPosadaUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnPosadaChoice.Enabled:=true;

  frmSpivrobitnikiEdit.edtPrizvische.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische.Enabled:=true;
  frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=true;
  frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=true;
  frmSpivrobitnikiEdit.btnVidminok.Enabled:=true;
  frmSpivrobitnikiEdit.edtPrizvische.SetFocus;
end;

procedure TfrmSpivrobitniki.aEditExecute(Sender: TObject);
begin
  if frmSpivrobitniki.qSpivrobitniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmSpivrobitnikiEdit:=TfrmSpivrobitnikiEdit.Create(self);
  frmMain.Enabled:=false;
  frmSpivrobitnikiEdit.Show;
//  if frmMain.IsFormOpen('frmKoristuvachiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmRaport') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmSpivrobitniki.Enabled:=false;
  frmSpivrobitnikiEdit.Caption:='Редагування відомостей про співробітника';
  frmSpivrobitnikiEdit.BorderStyle:=bsDialog;
  frmSpivrobitnikiEdit.Position:=poMainFormCenter;

  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Код співробітника').IsNull then frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text:=IntToStr(frmSpivrobitniki.qSpivrobitniki.FieldByName('Код співробітника').Value) else frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
  frmSpivrobitnikiEdit.edtKodSpivrobitnika.Enabled:=false;
  frmSpivrobitnikiEdit.btnKodSpivrobitnika.Enabled:=false;

  frmSpivrobitnikiEdit.aTeritoryUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbTeritory.Text:=frmSpivrobitniki.cbTeritory.Text;
  frmSpivrobitnikiEdit.cbTeritory.Enabled:=true;
  frmSpivrobitnikiEdit.btnTeritoryUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnTeritoryChoice.Enabled:=true;

  frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbRajon.Text:=frmSpivrobitniki.cbRajon.Text;
  frmSpivrobitnikiEdit.cbRajon.Enabled:=true;
  frmSpivrobitnikiEdit.btnRajonUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnRajonChoice.Enabled:=true;

  frmSpivrobitnikiEdit.aViddilennyUpdateExecute(sender);
  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Відділення').IsNull then frmSpivrobitnikiEdit.cbViddilenny.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Відділення').Value else frmSpivrobitnikiEdit.cbViddilenny.Text:='';
  frmSpivrobitnikiEdit.cbViddilenny.Enabled:=true;
  frmSpivrobitnikiEdit.btnViddilennyUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnViddilennyChoice.Enabled:=true;

  frmSpivrobitnikiEdit.aPosadaUpdateExecute(sender);
  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Посада').IsNull then frmSpivrobitnikiEdit.cbPosada.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Посада').Value else frmSpivrobitnikiEdit.cbPosada.Text:='';
  frmSpivrobitnikiEdit.cbPosada.Enabled:=true;
  frmSpivrobitnikiEdit.btnPosadaUpdate.Enabled:=true;
  frmSpivrobitnikiEdit.btnPosadaChoice.Enabled:=true;

  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Прізвище').IsNull then frmSpivrobitnikiEdit.edtPrizvische.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Прізвище').Value else frmSpivrobitnikiEdit.edtPrizvische.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische.Enabled:=true;

  with frmSpivrobitniki.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from SPIVROBITNIKI where KODSPIVROBITNIKA=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text;
    Open;
  end;
  if frmSpivrobitniki.qTeritory.Locate('KODSPIVROBITNIKA',frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text,[]) then
  begin
    if not frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_RV').IsNull then frmSpivrobitnikiEdit.edtPrizvische_RV.Text:=frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_RV').Value else frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=true;
    if not frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_TV').IsNull then frmSpivrobitnikiEdit.edtPrizvische_TV.Text:=frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_TV').Value else frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=true;
  end
  else
  begin
    frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=true;
    frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=true;
  end;
  frmSpivrobitnikiEdit.btnVidminok.Enabled:=true;
  frmSpivrobitnikiEdit.edtPrizvische.SetFocus;
end;

procedure TfrmSpivrobitniki.aDeleteExecute(Sender: TObject);
begin
  if frmSpivrobitniki.qSpivrobitniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmSpivrobitnikiEdit:=TfrmSpivrobitnikiEdit.Create(self);
  frmMain.Enabled:=false;
  frmSpivrobitnikiEdit.Show;
//  if frmMain.IsFormOpen('frmKoristuvachiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmRaport') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmSpivrobitniki.Enabled:=false;
  frmSpivrobitnikiEdit.Caption:='Видалення відомостей про співробітника';
  frmSpivrobitnikiEdit.BorderStyle:=bsDialog;
  frmSpivrobitnikiEdit.Position:=poMainFormCenter;

  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Код співробітника').IsNull then frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text:=IntToStr(frmSpivrobitniki.qSpivrobitniki.FieldByName('Код співробітника').Value) else frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
  frmSpivrobitnikiEdit.edtKodSpivrobitnika.Enabled:=false;
  frmSpivrobitnikiEdit.btnKodSpivrobitnika.Enabled:=false;

  frmSpivrobitnikiEdit.aTeritoryUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbTeritory.Text:=frmSpivrobitniki.cbTeritory.Text;
  frmSpivrobitnikiEdit.cbTeritory.Enabled:=false;
  frmSpivrobitnikiEdit.btnTeritoryUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnTeritoryChoice.Enabled:=false;

  frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbRajon.Text:=frmSpivrobitniki.cbRajon.Text;
  frmSpivrobitnikiEdit.cbRajon.Enabled:=false;
  frmSpivrobitnikiEdit.btnRajonUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnRajonChoice.Enabled:=false;

  frmSpivrobitnikiEdit.aViddilennyUpdateExecute(sender);
  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Відділення').IsNull then frmSpivrobitnikiEdit.cbViddilenny.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Відділення').Value else frmSpivrobitnikiEdit.cbViddilenny.Text:='';
  frmSpivrobitnikiEdit.cbViddilenny.Enabled:=false;
  frmSpivrobitnikiEdit.btnViddilennyUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnViddilennyChoice.Enabled:=false;

  frmSpivrobitnikiEdit.aPosadaUpdateExecute(sender);
  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Посада').IsNull then frmSpivrobitnikiEdit.cbPosada.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Посада').Value else frmSpivrobitnikiEdit.cbPosada.Text:='';
  frmSpivrobitnikiEdit.cbPosada.Enabled:=false;
  frmSpivrobitnikiEdit.btnPosadaUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnPosadaChoice.Enabled:=false;

  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Прізвище').IsNull then frmSpivrobitnikiEdit.edtPrizvische.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Прізвище').Value else frmSpivrobitnikiEdit.edtPrizvische.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische.Enabled:=false;

  with frmSpivrobitniki.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from SPIVROBITNIKI where KODSPIVROBITNIKA=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text;
    Open;
  end;
  if frmSpivrobitniki.qTeritory.Locate('KODSPIVROBITNIKA',frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text,[]) then
  begin
    if not frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_RV').IsNull then frmSpivrobitnikiEdit.edtPrizvische_RV.Text:=frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_RV').Value else frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=false;
    if not frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_TV').IsNull then frmSpivrobitnikiEdit.edtPrizvische_TV.Text:=frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_TV').Value else frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=false;
  end
  else
  begin
    frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=false;
    frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=false;
  end;
  frmSpivrobitnikiEdit.btnVidminok.Enabled:=false;
  frmSpivrobitnikiEdit.btnVidmina.SetFocus;
end;

procedure TfrmSpivrobitniki.aChoiceExecute(Sender: TObject);
begin
  if frmSpivrobitniki.qSpivrobitniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmSpivrobitnikiEdit:=TfrmSpivrobitnikiEdit.Create(self);
  frmMain.Enabled:=false;
//  if frmMain.IsFormOpen('frmKoristuvachiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmOpechanuvanny') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmRaport') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmSpivrobitniki.Enabled:=false;
//  if frmMain.IsFormOpen('frmFilter') then frmSpivrobitniki.Enabled:=false;
  frmSpivrobitnikiEdit.Show;
  frmSpivrobitnikiEdit.Caption:='Вибір відомостей про співробітника';
  frmSpivrobitnikiEdit.BorderStyle:=bsDialog;
  frmSpivrobitnikiEdit.Position:=poMainFormCenter;

  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Код співробітника').IsNull then frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text:=IntToStr(frmSpivrobitniki.qSpivrobitniki.FieldByName('Код співробітника').Value) else frmSpivrobitnikiEdit.aKodUpdateExecute(sender);
  frmSpivrobitnikiEdit.edtKodSpivrobitnika.Enabled:=false;
  frmSpivrobitnikiEdit.btnKodSpivrobitnika.Enabled:=false;

  frmSpivrobitnikiEdit.aTeritoryUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbTeritory.Text:=frmSpivrobitniki.cbTeritory.Text;
  frmSpivrobitnikiEdit.cbTeritory.Enabled:=false;
  frmSpivrobitnikiEdit.btnTeritoryUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnTeritoryChoice.Enabled:=false;

  frmSpivrobitnikiEdit.aRajonUpdateExecute(sender);
  frmSpivrobitnikiEdit.cbRajon.Text:=frmSpivrobitniki.cbRajon.Text;
  frmSpivrobitnikiEdit.cbRajon.Enabled:=false;
  frmSpivrobitnikiEdit.btnRajonUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnRajonChoice.Enabled:=false;

  frmSpivrobitnikiEdit.aViddilennyUpdateExecute(sender);
  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Відділення').IsNull then frmSpivrobitnikiEdit.cbViddilenny.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Відділення').Value else frmSpivrobitnikiEdit.cbViddilenny.Text:='';
  frmSpivrobitnikiEdit.cbViddilenny.Enabled:=false;
  frmSpivrobitnikiEdit.btnViddilennyUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnViddilennyChoice.Enabled:=false;

  frmSpivrobitnikiEdit.aPosadaUpdateExecute(sender);
  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Посада').IsNull then frmSpivrobitnikiEdit.cbPosada.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Посада').Value else frmSpivrobitnikiEdit.cbPosada.Text:='';
  frmSpivrobitnikiEdit.cbPosada.Enabled:=false;
  frmSpivrobitnikiEdit.btnPosadaUpdate.Enabled:=false;
  frmSpivrobitnikiEdit.btnPosadaChoice.Enabled:=false;

  if not frmSpivrobitniki.qSpivrobitniki.FieldByName('Прізвище').IsNull then frmSpivrobitnikiEdit.edtPrizvische.Text:=frmSpivrobitniki.qSpivrobitniki.FieldByName('Прізвище').Value else frmSpivrobitnikiEdit.edtPrizvische.Text:='';
  frmSpivrobitnikiEdit.edtPrizvische.Enabled:=false;

  with frmSpivrobitniki.qTeritory do
  begin
    SQL.Clear;
    SQL.Text:='select * from SPIVROBITNIKI where KODSPIVROBITNIKA=:kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='kod';
    Params[0].Value:=frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text;
    Open;
  end;
  if frmSpivrobitniki.qTeritory.Locate('KODSPIVROBITNIKA',frmSpivrobitnikiEdit.edtKodSpivrobitnika.Text,[]) then
  begin
    if not frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_RV').IsNull then frmSpivrobitnikiEdit.edtPrizvische_RV.Text:=frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_RV').Value else frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=false;
    if not frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_TV').IsNull then frmSpivrobitnikiEdit.edtPrizvische_TV.Text:=frmSpivrobitniki.qTeritory.FieldByName('PRIZVISXHE_TV').Value else frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=false;
  end
  else
  begin
    frmSpivrobitnikiEdit.edtPrizvische_RV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_RV.Enabled:=false;
    frmSpivrobitnikiEdit.edtPrizvische_TV.Text:='';
    frmSpivrobitnikiEdit.edtPrizvische_TV.Enabled:=false;
  end;
  frmSpivrobitnikiEdit.btnVikonati.SetFocus;
end;

procedure TfrmSpivrobitniki.aUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODSPIVROBITNIKA as "Код співробітника", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.PRIZVISXHE as "Прізвище", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY.NAZVAVIDDILENNY as "Відділення", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI.NAZVAPOSADI as "Посада"  ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'from ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'where ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI.RAJON=:Rajon ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.RAJON=RAJONI.KOD ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODVIDDILENNY=VIDDILENNY.KODVIDDILENNY ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODPOSADI=POSADI.KODPOSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'order by ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.PRIZVISXHE';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='Rajon';
    qSpivrobitniki.Params[0].Value:=frmSpivrobitniki.cbRajon.Text;
    qSpivrobitniki.Open;
    aSortByKod.Checked:=false;
    aSortByViddilenny.Checked:=false;
    aSortByPosada.Checked:=false;
    aSortByPrizvische.Checked:=true;
  end;
end;

procedure TfrmSpivrobitniki.aCloseExecute(Sender: TObject);
begin
  frmSpivrobitniki.Close;
end;

procedure TfrmSpivrobitniki.aSortByPrizvischeExecute(Sender: TObject);
begin
  frmSpivrobitniki.aUpdateExecute(sender);
end;

procedure TfrmSpivrobitniki.aSortByPosadaExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODSPIVROBITNIKA as "Код співробітника", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.PRIZVISXHE as "Прізвище", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY.NAZVAVIDDILENNY as "Відділення", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI.NAZVAPOSADI as "Посада"  ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'from ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'where ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI.RAJON=:Rajon ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.RAJON=RAJONI.KOD ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODVIDDILENNY=VIDDILENNY.KODVIDDILENNY ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODPOSADI=POSADI.KODPOSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'order by ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI.NAZVAPOSADI';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='Rajon';
    qSpivrobitniki.Params[0].Value:=frmSpivrobitniki.cbRajon.Text;
    qSpivrobitniki.Open;
    aSortByKod.Checked:=false;
    aSortByViddilenny.Checked:=false;
    aSortByPosada.Checked:=true;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmSpivrobitniki.aSortByViddilennyExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODSPIVROBITNIKA as "Код співробітника", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.PRIZVISXHE as "Прізвище", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY.NAZVAVIDDILENNY as "Відділення", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI.NAZVAPOSADI as "Посада"  ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'from ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'where ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI.RAJON=:Rajon ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.RAJON=RAJONI.KOD ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODVIDDILENNY=VIDDILENNY.KODVIDDILENNY ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODPOSADI=POSADI.KODPOSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'order by ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY.NAZVAVIDDILENNY';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='Rajon';
    qSpivrobitniki.Params[0].Value:=frmSpivrobitniki.cbRajon.Text;
    qSpivrobitniki.Open;
    aSortByKod.Checked:=false;
    aSortByViddilenny.Checked:=true;
    aSortByPosada.Checked:=false;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmSpivrobitniki.aSortByKodExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODSPIVROBITNIKA as "Код співробітника", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.PRIZVISXHE as "Прізвище", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY.NAZVAVIDDILENNY as "Відділення", ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI.NAZVAPOSADI as "Посада"  ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'from ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  VIDDILENNY,';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  POSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'where ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  RAJONI.RAJON=:Rajon ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.RAJON=RAJONI.KOD ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODVIDDILENNY=VIDDILENNY.KODVIDDILENNY ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  and ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODPOSADI=POSADI.KODPOSADI ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'order by ';
    qSpivrobitniki.SQL.Text:=qSpivrobitniki.SQL.Text+'  SPIVROBITNIKI.KODSPIVROBITNIKA';
    qSpivrobitniki.Params.Clear;
    qSpivrobitniki.Params.Add;
    qSpivrobitniki.Params[0].Name:='Rajon';
    qSpivrobitniki.Params[0].Value:=frmSpivrobitniki.cbRajon.Text;
    qSpivrobitniki.Open;
    aSortByKod.Checked:=true;
    aSortByViddilenny.Checked:=false;
    aSortByPosada.Checked:=false;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmSpivrobitniki.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
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
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    INIAZZ.Free;
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbRajon.Text:=INIAZZ.ReadString('Teritory','District',cbRajon.Text);
    INIAZZ.Free;
    if qTeritory.Locate('KOD',StrToInt(cbRajon.Text),[]) then cbRajon.Text:=qTeritory.FieldByName('RAJON').Value else cbRajon.Text:='';

    aUpdateExecute(sender);
  end;
end;

procedure TfrmSpivrobitniki.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmSpivrobitniki do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmSpivrobitniki.cbRajonChange(Sender: TObject);
begin
  frmSpivrobitniki.aUpdateExecute(sender);
end;

procedure TfrmSpivrobitniki.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmSpivrobitniki.dsSpivrobitniki;
end;

end.

