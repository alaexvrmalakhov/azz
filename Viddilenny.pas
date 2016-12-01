unit Viddilenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, Controls,
  StdCtrls, Grids, DBGrids, ExtCtrls, SysUtils, IniFiles;

type
  TfrmViddilenny = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    DBGrid1: TDBGrid;
    btnVibrati: TButton;
    Panel2: TPanel;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    btnMin_Ter_Raj: TButton;
    cbMinistry: TComboBox;
    alViddilenny: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    btnUpdate: TButton;
    aUpdate: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    N6: TMenuItem;
    mnClose: TMenuItem;
    dsViddilenny: TDataSource;
    qViddilenny: TIBQuery;
    aTeritoryUpdate: TAction;
    qTeritory: TIBQuery;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    aSortByKod: TAction;
    aSortByViddilenny: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    mnSortByKod: TMenuItem;
    mnSortByViddilenny: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByViddilennyExecute(Sender: TObject);
    procedure cbRajonChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmViddilenny: TfrmViddilenny;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, ShtrafiEdit,
  SpivrobitnikiEdit, ViddilennyEdit;

{$R *.dfm}

procedure TfrmViddilenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmViddilenny.qTeritory.Close;
  frmViddilenny.qViddilenny.Close;

//  if frmMain.IsFormOpen('frmZvyzok') then
//  begin
//    frmZvyzok.Enabled:=true;
//    frmMain.Enabled:=false;
//    Action:=caFree;
//    exit;
//  end;

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

procedure TfrmViddilenny.FormResize(Sender: TObject);
begin
  frmViddilenny.btnMin_Ter_Raj.Left:=frmViddilenny.Width-32;
  frmViddilenny.cbMinistry.Left:=4;
  frmViddilenny.cbMinistry.Width:=trunc((frmViddilenny.Width)/3);
  frmViddilenny.cbTeritory.Left:=trunc((frmViddilenny.Width)/3)+8;
  frmViddilenny.cbTeritory.Width:=trunc((frmViddilenny.Width)/3)-21;
  frmViddilenny.cbRajon.Left:=trunc((frmViddilenny.Width)/3)+frmViddilenny.cbTeritory.Left-17;
  frmViddilenny.cbRajon.Width:=trunc((frmViddilenny.Width)/3)-25;
end;

procedure TfrmViddilenny.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmViddilennyEdit') then frmViddilennyEdit:=TfrmViddilennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmViddilennyEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Caption:='Додавання нового відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;
  frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  frmViddilennyEdit.aMinistryUpdateExecute(sender);
  frmViddilennyEdit.cbMinistry.Text:=frmViddilenny.cbMinistry.Text;
  frmViddilennyEdit.cbMinistry.Enabled:=true;
  frmViddilennyEdit.btnMinistryUpdate.Enabled:=true;
  frmViddilennyEdit.btnMinistryChoice.Enabled:=true;

  frmViddilennyEdit.aTeritoryUpdateExecute(sender);
  frmViddilennyEdit.cbTeritory.Text:=frmViddilenny.cbTeritory.Text;
  frmViddilennyEdit.cbTeritory.Enabled:=true;
  frmViddilennyEdit.btnTeritoryUpdate.Enabled:=true;
  frmViddilennyEdit.btnTeritoryChoice.Enabled:=true;

  frmViddilennyEdit.aDistrictUpdateExecute(sender);
  frmViddilennyEdit.cbRajon.Text:=frmViddilenny.cbRajon.Text;
  frmViddilennyEdit.cbRajon.Enabled:=true;
  frmViddilennyEdit.btnRajonUpdate.Enabled:=true;
  frmViddilennyEdit.btnRajonChoice.Enabled:=true;

  frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=true;
  frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=true;
  frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_TV.Enabled:=true;
  frmViddilennyEdit.btnVidminok.Enabled:=true;
  frmViddilennyEdit.edtNazvaViddilenny.SetFocus;
end;

procedure TfrmViddilenny.aEditExecute(Sender: TObject);
begin
  if frmViddilenny.qViddilenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViddilennyEdit') then frmViddilennyEdit:=TfrmViddilennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmViddilennyEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Caption:='Редагування відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;

  if not frmViddilenny.qViddilenny.FieldByName('KODVIDDILENNY').IsNull then frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('KODVIDDILENNY').Value) else frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  frmViddilennyEdit.aMinistryUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('MINISTRY').IsNull then frmViddilennyEdit.cbMinistry.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('MINISTRY').Value) else frmViddilennyEdit.cbMinistry.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbMinistry.Text),[]) then frmViddilennyEdit.cbMinistry.Text:=frmViddilenny.qTeritory.FieldByName('MINISTRY').Value else frmViddilennyEdit.cbMinistry.Text:='';
  frmViddilennyEdit.cbMinistry.Enabled:=true;
  frmViddilennyEdit.btnMinistryUpdate.Enabled:=true;
  frmViddilennyEdit.btnMinistryChoice.Enabled:=true;

  frmViddilennyEdit.aTeritoryUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('TERITORY').IsNull then frmViddilennyEdit.cbTeritory.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('TERITORY').Value) else frmViddilennyEdit.cbTeritory.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbTeritory.Text),[]) then frmViddilennyEdit.cbTeritory.Text:=frmViddilenny.qTeritory.FieldByName('TERITORY').Value else frmViddilennyEdit.cbTeritory.Text:='';
  frmViddilennyEdit.cbTeritory.Enabled:=true;
  frmViddilennyEdit.btnTeritoryUpdate.Enabled:=true;
  frmViddilennyEdit.btnTeritoryChoice.Enabled:=true;

  frmViddilennyEdit.aDistrictUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('RAJON').IsNull then frmViddilennyEdit.cbRajon.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('RAJON').Value) else frmViddilennyEdit.cbRajon.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbRajon.Text),[]) then frmViddilennyEdit.cbRajon.Text:=frmViddilenny.qTeritory.FieldByName('RAJON').Value else frmViddilennyEdit.cbRajon.Text:='';
  frmViddilennyEdit.cbRajon.Enabled:=true;
  frmViddilennyEdit.btnRajonUpdate.Enabled:=true;
  frmViddilennyEdit.btnRajonChoice.Enabled:=true;

  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY').IsNull then frmViddilennyEdit.edtNazvaViddilenny.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY').Value else frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=true;
  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_RV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_RV').Value else frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=true;
  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_TV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_TV').Value else frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_TV.Enabled:=true;
  frmViddilennyEdit.btnVidminok.Enabled:=true;
  frmViddilennyEdit.edtNazvaViddilenny.SetFocus;
end;

procedure TfrmViddilenny.aDeleteExecute(Sender: TObject);
begin
  if frmViddilenny.qViddilenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViddilennyEdit') then frmViddilennyEdit:=TfrmViddilennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmViddilennyEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Caption:='Видалення відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;

  if not frmViddilenny.qViddilenny.FieldByName('KODVIDDILENNY').IsNull then frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('KODVIDDILENNY').Value) else frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  frmViddilennyEdit.aMinistryUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('MINISTRY').IsNull then frmViddilennyEdit.cbMinistry.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('MINISTRY').Value) else frmViddilennyEdit.cbMinistry.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbMinistry.Text),[]) then frmViddilennyEdit.cbMinistry.Text:=frmViddilenny.qTeritory.FieldByName('MINISTRY').Value else frmViddilennyEdit.cbMinistry.Text:='';
  frmViddilennyEdit.cbMinistry.Enabled:=false;
  frmViddilennyEdit.btnMinistryUpdate.Enabled:=false;
  frmViddilennyEdit.btnMinistryChoice.Enabled:=false;

  frmViddilennyEdit.aTeritoryUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('TERITORY').IsNull then frmViddilennyEdit.cbTeritory.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('TERITORY').Value) else frmViddilennyEdit.cbTeritory.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbTeritory.Text),[]) then frmViddilennyEdit.cbTeritory.Text:=frmViddilenny.qTeritory.FieldByName('TERITORY').Value else frmViddilennyEdit.cbTeritory.Text:='';
  frmViddilennyEdit.cbTeritory.Enabled:=false;
  frmViddilennyEdit.btnTeritoryUpdate.Enabled:=false;
  frmViddilennyEdit.btnTeritoryChoice.Enabled:=false;

  frmViddilennyEdit.aDistrictUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('RAJON').IsNull then frmViddilennyEdit.cbRajon.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('RAJON').Value) else frmViddilennyEdit.cbRajon.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbRajon.Text),[]) then frmViddilennyEdit.cbRajon.Text:=frmViddilenny.qTeritory.FieldByName('RAJON').Value else frmViddilennyEdit.cbRajon.Text:='';
  frmViddilennyEdit.cbRajon.Enabled:=false;
  frmViddilennyEdit.btnRajonUpdate.Enabled:=false;
  frmViddilennyEdit.btnRajonChoice.Enabled:=false;

  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY').IsNull then frmViddilennyEdit.edtNazvaViddilenny.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY').Value else frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=false;
  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_RV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_RV').Value else frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=false;
  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_TV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_TV').Value else frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_TV.Enabled:=false;
  frmViddilennyEdit.btnVidminok.Enabled:=false;
  frmViddilennyEdit.btnVidmina.SetFocus;
end;

procedure TfrmViddilenny.aChoiceExecute(Sender: TObject);
begin
  if frmViddilenny.qViddilenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViddilennyEdit') then frmViddilennyEdit:=TfrmViddilennyEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Show;
  frmViddilennyEdit.Caption:='Вибір відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;

  if not frmViddilenny.qViddilenny.FieldByName('KODVIDDILENNY').IsNull then frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('KODVIDDILENNY').Value) else frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  frmViddilennyEdit.aMinistryUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('MINISTRY').IsNull then frmViddilennyEdit.cbMinistry.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('MINISTRY').Value) else frmViddilennyEdit.cbMinistry.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbMinistry.Text),[]) then frmViddilennyEdit.cbMinistry.Text:=frmViddilenny.qTeritory.FieldByName('MINISTRY').Value else frmViddilennyEdit.cbMinistry.Text:='';
  frmViddilennyEdit.cbMinistry.Enabled:=false;
  frmViddilennyEdit.btnMinistryUpdate.Enabled:=false;
  frmViddilennyEdit.btnMinistryChoice.Enabled:=false;

  frmViddilennyEdit.aTeritoryUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('TERITORY').IsNull then frmViddilennyEdit.cbTeritory.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('TERITORY').Value) else frmViddilennyEdit.cbTeritory.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbTeritory.Text),[]) then frmViddilennyEdit.cbTeritory.Text:=frmViddilenny.qTeritory.FieldByName('TERITORY').Value else frmViddilennyEdit.cbTeritory.Text:='';
  frmViddilennyEdit.cbTeritory.Enabled:=false;
  frmViddilennyEdit.btnTeritoryUpdate.Enabled:=false;
  frmViddilennyEdit.btnTeritoryChoice.Enabled:=false;

  frmViddilennyEdit.aDistrictUpdateExecute(sender);
  if not frmViddilenny.qViddilenny.FieldByName('RAJON').IsNull then frmViddilennyEdit.cbRajon.Text:=IntToStr(frmViddilenny.qViddilenny.FieldByName('RAJON').Value) else frmViddilennyEdit.cbRajon.Text:='0';
  if frmViddilenny.qTeritory.Locate('KOD',StrToInt(frmViddilennyEdit.cbRajon.Text),[]) then frmViddilennyEdit.cbRajon.Text:=frmViddilenny.qTeritory.FieldByName('RAJON').Value else frmViddilennyEdit.cbRajon.Text:='';
  frmViddilennyEdit.cbRajon.Enabled:=false;
  frmViddilennyEdit.btnRajonUpdate.Enabled:=false;
  frmViddilennyEdit.btnRajonChoice.Enabled:=false;

  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY').IsNull then frmViddilennyEdit.edtNazvaViddilenny.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY').Value else frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=false;
  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_RV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_RV').Value else frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=false;
  if not frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_TV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilenny.qViddilenny.FieldByName('NAZVAVIDDILENNY_TV').Value else frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_TV.Enabled:=false;
  frmViddilennyEdit.btnVidminok.Enabled:=false;
  frmViddilennyEdit.btnVikonati.SetFocus;
end;

procedure TfrmViddilenny.aCloseExecute(Sender: TObject);
begin
  frmViddilenny.Close;
end;

procedure TfrmViddilenny.aUpdateExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qViddilenny.SQL.Clear;
    qViddilenny.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:District and VIDDILENNY.RAJON=RAJONI.KOD order by NAZVAVIDDILENNY';
    qViddilenny.Params.Clear;
    qViddilenny.Params.Add;
    qViddilenny.Params[0].Name:='District';
    qViddilenny.Params[0].Value:=cbRajon.Text;
    qViddilenny.Open;
    aSortByViddilenny.Checked:=true;
    aSortByKod.Checked:=false;
  end;
end;

procedure TfrmViddilenny.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmViddilenny do
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
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
    INIAZZ.Free;
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

procedure TfrmViddilenny.aMinistryChangeExecute(Sender: TObject);
begin
  with frmViddilenny do
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
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmViddilenny.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmViddilenny do
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

procedure TfrmViddilenny.aSortByKodExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qViddilenny.SQL.Clear;
    qViddilenny.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:District and VIDDILENNY.KODVIDDILENNY=RAJONI.KOD order by KODVIDDILENNY';
    qViddilenny.Params.Clear;
    qViddilenny.Params.Add;
    qViddilenny.Params[0].Name:='District';
    qViddilenny.Params[0].Value:=cbRajon.Text;
    qViddilenny.Open;
    aSortByViddilenny.Checked:=false;
    aSortByKod.Checked:=true;
  end;
end;

procedure TfrmViddilenny.aSortByViddilennyExecute(Sender: TObject);
begin
  frmViddilenny.aUpdateExecute(sender);
end;

procedure TfrmViddilenny.cbRajonChange(Sender: TObject);
begin
  frmViddilenny.aUpdateExecute(sender);
end;

procedure TfrmViddilenny.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmViddilenny.dsViddilenny;
end;

end.
