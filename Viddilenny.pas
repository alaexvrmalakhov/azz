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
    aSortByKod: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    mnSortByKod: TMenuItem;
    mnSortByViddilenny: TMenuItem;
    aSortByViddilenny: TAction;
    qEdit: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure aSortByViddilennyExecute(Sender: TObject);
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
  frmViddilenny.qViddilenny.Close;
{
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
}
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

procedure TfrmViddilenny.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmViddilennyEdit') then frmViddilennyEdit:=TfrmViddilennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmViddilennyEdit.Show;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Caption:='Додавання нового відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;
  frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

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
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Caption:='Редагування відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;

  with frmViddilenny do
  begin
    with qEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from VIDDILENNY where KODVIDDILENNY=:kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='kod';
      Params[0].Value:=frmViddilenny.qViddilenny.FieldByName('Код відділення').Value;
      Open;
    end;
  end;

  if not frmViddilenny.qEdit.FieldByName('KODVIDDILENNY').IsNull then frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(frmViddilenny.qEdit.FieldByName('KODVIDDILENNY').Value) else frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY').IsNull then frmViddilennyEdit.edtNazvaViddilenny.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY').Value else frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=true;
  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_RV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_RV').Value else frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=true;
  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_TV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_TV').Value else frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
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
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Caption:='Видалення відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;

  with frmViddilenny do
  begin
    with qEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from VIDDILENNY where KODVIDDILENNY=:kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='kod';
      Params[0].Value:=frmViddilenny.qViddilenny.FieldByName('Код відділення').Value;
      Open;
    end;
  end;

  if not frmViddilenny.qEdit.FieldByName('KODVIDDILENNY').IsNull then frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(frmViddilenny.qEdit.FieldByName('KODVIDDILENNY').Value) else frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY').IsNull then frmViddilennyEdit.edtNazvaViddilenny.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY').Value else frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=false;
  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_RV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_RV').Value else frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=false;
  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_TV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_TV').Value else frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_TV.Enabled:=false;
  frmViddilennyEdit.btnVidminok.Enabled:=false;
  frmViddilennyEdit.btnVidmina.SetFocus;
end;

procedure TfrmViddilenny.aChoiceExecute(Sender: TObject);
begin
  if frmViddilenny.qViddilenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmViddilennyEdit') then frmViddilennyEdit:=TfrmViddilennyEdit.Create(self);
  frmMain.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmViddilenny.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmViddilenny.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmViddilenny.Enabled:=false;
  frmViddilennyEdit.Show;
  frmViddilennyEdit.Caption:='Вибір відділення';
  frmViddilennyEdit.BorderStyle:=bsDialog;
  frmViddilennyEdit.Position:=poMainFormCenter;

  with frmViddilenny do
  begin
    with qEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from VIDDILENNY where KODVIDDILENNY=:kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='kod';
      Params[0].Value:=frmViddilenny.qViddilenny.FieldByName('Код відділення').Value;
      Open;
    end;
  end;

  if not frmViddilenny.qEdit.FieldByName('KODVIDDILENNY').IsNull then frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(frmViddilenny.qEdit.FieldByName('KODVIDDILENNY').Value) else frmViddilennyEdit.aKodUpdateExecute(sender);
  frmViddilennyEdit.edtKodViddilenny.Enabled:=false;
  frmViddilennyEdit.btnKodViddilenny.Enabled:=false;

  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY').IsNull then frmViddilennyEdit.edtNazvaViddilenny.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY').Value else frmViddilennyEdit.edtNazvaViddilenny.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny.Enabled:=false;
  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_RV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_RV').Value else frmViddilennyEdit.edtNazvaViddilenny_RV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_RV.Enabled:=false;
  if not frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_TV').IsNull then frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilenny.qEdit.FieldByName('NAZVAVIDDILENNY_TV').Value else frmViddilennyEdit.edtNazvaViddilenny_TV.Text:='';
  frmViddilennyEdit.edtNazvaViddilenny_TV.Enabled:=false;
  frmViddilennyEdit.btnVidminok.Enabled:=false;
  frmViddilennyEdit.btnVikonati.SetFocus;
{

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
}
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
    qViddilenny.SQL.Text:='select KODVIDDILENNY as "Код відділення", NAZVAVIDDILENNY as "Відділення" from VIDDILENNY where not NAZVAVIDDILENNY is null order by NAZVAVIDDILENNY';
    qViddilenny.Open;
    aSortByViddilenny.Checked:=true;
    aSortByKod.Checked:=false;
  end;
end;

procedure TfrmViddilenny.aSortByKodExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qViddilenny.SQL.Clear;
    qViddilenny.SQL.Text:='select KODVIDDILENNY as "Код відділення", NAZVAVIDDILENNY as "Відділення" from VIDDILENNY where not NAZVAVIDDILENNY is null order by KODVIDDILENNY';
    qViddilenny.Open;
    aSortByViddilenny.Checked:=false;
    aSortByKod.Checked:=true;
  end;
end;

procedure TfrmViddilenny.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmViddilenny.dsViddilenny;
end;

procedure TfrmViddilenny.aSortByViddilennyExecute(Sender: TObject);
begin
  frmViddilenny.aUpdateExecute(sender);
end;

end.
