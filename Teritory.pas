unit Teritory;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, Grids, DBGrids, SysUtils;

type
  TfrmTeritory = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    alTeritory: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    btnUpdate: TButton;
    PopupMenu: TPopupMenu;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    N8: TMenuItem;
    mnClose: TMenuItem;
    dsTeritory: TDataSource;
    qTeritory: TIBQuery;
    qMinistry: TIBQuery;
    aSortByKod: TAction;
    aSortByTeritory: TAction;
    N1: TMenuItem;
    mnSort: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByTeritoryExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmTeritory: TfrmTeritory;

implementation

uses
  Main, PosadiEdit, SpivrobitnikiEdit, RajoniEdit, ViddilennyEdit,
  TeritoryEdit;

{$R *.dfm}

procedure TfrmTeritory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmTeritory.qTeritory.Close;
  frmTeritory.qMinistry.Close;

{
  if frmMain.IsFormOpen('frmPosadiEdit') then
  begin
    frmPosadiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

//  if frmMain.IsFormOpen('frmViddilennyEdit') then
//  begin
//    frmViddilennyEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    Action:=caFree;
//    exit;
//  end;
//
//  if frmMain.IsFormOpen('frmVidomostiProOrganizaciju') then
//  begin
//    frmVidomostiProOrganizaciju.Enabled:=true;
//    frmMain.Enabled:=false;
//    Action:=caFree;
//    exit;
//  end;
  if frmMain.IsFormOpen('frmRajoniEdit') then
  begin
    frmRajoniEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViddilennyEdit') then
  begin
    frmViddilennyEdit.Enabled:=true;
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
}

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmTeritory.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTeritoryEdit') then frmTeritoryEdit:=TfrmTeritoryEdit.Create(self);
  frmMain.Enabled:=false;
  frmTeritoryEdit.Show;
//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;

  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Додати територію';
  frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  frmTeritoryEdit.edtTeritory.Text:='';
  frmTeritoryEdit.edtTeritory.Enabled:=true;
  frmTeritoryEdit.edtTeritory.SetFocus;
end;

procedure TfrmTeritory.aEditExecute(Sender: TObject);
begin
  if frmTeritory.qTeritory.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTeritoryEdit') then frmTeritoryEdit:=TfrmTeritoryEdit.Create(self);
  frmMain.Enabled:=false;
  frmTeritoryEdit.Show;
  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Редагувати територію';

//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;

  if not frmTeritory.qTeritory.FieldByName('Код території').IsNull then frmTeritoryEdit.edtKod.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('Код території').Value) else frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  if not frmTeritory.qTeritory.FieldByName('Територія').IsNull then frmTeritoryEdit.edtTeritory.Text:=frmTeritory.qTeritory.FieldByName('Територія').Value else frmTeritoryEdit.edtTeritory.Text:='';
  frmTeritoryEdit.edtTeritory.Enabled:=true;
  frmTeritoryEdit.edtTeritory.SetFocus;
end;

procedure TfrmTeritory.aDeleteExecute(Sender: TObject);
begin
  if frmTeritory.qTeritory.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTeritoryEdit') then frmTeritoryEdit:=TfrmTeritoryEdit.Create(self);
  frmMain.Enabled:=false;
  frmTeritoryEdit.Show;
  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Видалити територію';

//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;

  if not frmTeritory.qTeritory.FieldByName('Код території').IsNull then frmTeritoryEdit.edtKod.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('Код території').Value) else frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  if not frmTeritory.qTeritory.FieldByName('Територія').IsNull then frmTeritoryEdit.edtTeritory.Text:=frmTeritory.qTeritory.FieldByName('Територія').Value else frmTeritoryEdit.edtTeritory.Text:='';
  frmTeritoryEdit.edtTeritory.Enabled:=false;
  frmTeritoryEdit.btnVidminiti.SetFocus;
end;

procedure TfrmTeritory.aChoiceExecute(Sender: TObject);
begin
  if frmTeritory.qTeritory.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTeritoryEdit') then frmTeritoryEdit:=TfrmTeritoryEdit.Create(self);
  frmMain.Enabled:=false;
  frmTeritoryEdit.Show;
  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Вибрати територію';

//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;

  if not frmTeritory.qTeritory.FieldByName('Код території').IsNull then frmTeritoryEdit.edtKod.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('Код території').Value) else frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  if not frmTeritory.qTeritory.FieldByName('Територія').IsNull then frmTeritoryEdit.edtTeritory.Text:=frmTeritory.qTeritory.FieldByName('Територія').Value else frmTeritoryEdit.edtTeritory.Text:='';
  frmTeritoryEdit.edtTeritory.Enabled:=false;
  frmTeritoryEdit.btnVikonati.SetFocus;
end;

procedure TfrmTeritory.aUpdateExecute(Sender: TObject);
begin
  with frmTeritory do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select KOD as "Код території", TERITORY as "Територія" from TERITORY where not TERITORY is null order by TERITORY';
    qTeritory.Open;
    aSortByKod.Checked:=false;
    aSortByTeritory.Checked:=true;
  end;
end;

procedure TfrmTeritory.aCloseExecute(Sender: TObject);
begin
  frmTeritory.Close;
end;

procedure TfrmTeritory.aSortByKodExecute(Sender: TObject);
begin
  with frmTeritory do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select KOD as "Код території", TERITORY as "Територія" from TERITORY where not TERITORY is null order by KOD';
    qTeritory.Open;
    aSortByKod.Checked:=true;
    aSortByTeritory.Checked:=false;
  end;
end;

procedure TfrmTeritory.aSortByTeritoryExecute(Sender: TObject);
begin
  frmTeritory.aUpdateExecute(sender);
end;

procedure TfrmTeritory.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmTeritory.dsTeritory;
end;

end.
