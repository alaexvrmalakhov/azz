unit Ministry;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmMinistry = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    btnUpdate: TButton;
    alMinistry: TActionList;
    PopupMenu: TPopupMenu;
    aAdd: TAction;
    mnAdd: TMenuItem;
    aUpdate: TAction;
    aEdit: TAction;
    mnEdit: TMenuItem;
    aDelete: TAction;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    aChoice: TAction;
    dsMinistry: TDataSource;
    qMinistry: TIBQuery;
    aClose: TAction;
    N1: TMenuItem;
    mnClose: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mnSortByKod: TMenuItem;
    mnSortByNazva: TMenuItem;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    mnUpdate: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmMinistry: TfrmMinistry;

implementation

uses
  Main, SpivrobitnikiEdit, PosadiEdit, ViddilennyEdit, RajoniEdit,
  TeritoryEdit, MinistryEdit;

{$R *.dfm}

procedure TfrmMinistry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMinistry.qMinistry.Close;
  if frmMain.IsFormOpen('frmPosadiEdit') then
  begin
    frmPosadiEdit.Enabled:=true;
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

  if frmMain.IsFormOpen('frmRajoniEdit') then
  begin
    frmRajoniEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmTeritoryEdit') then
  begin
    frmTeritoryEdit.Enabled:=true;
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

procedure TfrmMinistry.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmMinistryEdit') then frmMinistryEdit:=TfrmMinistryEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmTeritoryEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmPosadiEdit') then frmMinistry.Enabled:=false;
  with frmMinistryEdit do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати міністерство';
    aKodUpdateExecute(sender);
    edtKod.Enabled:=false;
    btnKod.Enabled:=false;
    edtMinistry.Text:='';
    edtMinistry.Enabled:=true;
    edtMinistry.SetFocus;
  end;
end;

procedure TfrmMinistry.aEditExecute(Sender: TObject);
begin
  if frmMinistry.qMinistry.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmMinistryEdit') then frmMinistryEdit:=TfrmMinistryEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmTeritoryEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmPosadiEdit') then frmMinistry.Enabled:=false;
  frmMinistryEdit.Show;
  frmMinistryEdit.BorderStyle:=bsDialog;
  frmMinistryEdit.Position:=poMainFormCenter;
  frmMinistryEdit.Caption:='Редагувати міністерство';
  if not frmMinistry.qMinistry.FieldByName('KOD').IsNull then frmMinistryEdit.edtKod.Text:=IntToStr(frmMinistry.qMinistry.FieldByName('KOD').Value) else frmMinistryEdit.aKodUpdateExecute(sender);
  frmMinistryEdit.edtKod.Enabled:=false;
  frmMinistryEdit.btnKod.Enabled:=false;
  if not frmMinistry.qMinistry.FieldByName('MINISTRY').IsNull then frmMinistryEdit.edtMinistry.Text:=frmMinistry.qMinistry.FieldByName('MINISTRY').Value else frmMinistryEdit.edtMinistry.Text:='';
  frmMinistryEdit.edtMinistry.Enabled:=true;
  frmMinistryEdit.edtMinistry.SetFocus;
end;

procedure TfrmMinistry.aDeleteExecute(Sender: TObject);
begin
  if frmMinistry.qMinistry.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmMinistryEdit') then frmMinistryEdit:=TfrmMinistryEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmTeritoryEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmPosadiEdit') then frmMinistry.Enabled:=false;
  frmMinistryEdit.Show;
  frmMinistryEdit.BorderStyle:=bsDialog;
  frmMinistryEdit.Position:=poMainFormCenter;
  frmMinistryEdit.Caption:='Видалити міністерство';
  if not frmMinistry.qMinistry.FieldByName('KOD').IsNull then frmMinistryEdit.edtKod.Text:=IntToStr(frmMinistry.qMinistry.FieldByName('KOD').Value) else frmMinistryEdit.aKodUpdateExecute(sender);
  frmMinistryEdit.edtKod.Enabled:=false;
  frmMinistryEdit.btnKod.Enabled:=false;
  if not frmMinistry.qMinistry.FieldByName('MINISTRY').IsNull then frmMinistryEdit.edtMinistry.Text:=frmMinistry.qMinistry.FieldByName('MINISTRY').Value else frmMinistryEdit.edtMinistry.Text:='';
  frmMinistryEdit.edtMinistry.Enabled:=false;
  frmMinistryEdit.btnCancel.SetFocus;
end;

procedure TfrmMinistry.aChoiceExecute(Sender: TObject);
begin
  if frmMinistry.qMinistry.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmMinistryEdit') then frmMinistryEdit:=TfrmMinistryEdit.Create(self);
  frmMinistry.Enabled:=false;
  frmMinistryEdit.Show;
  frmMinistryEdit.BorderStyle:=bsDialog;
  frmMinistryEdit.Position:=poMainFormCenter;
  frmMinistryEdit.Caption:='Вибрати міністерство';
  if frmMain.IsFormOpen('frmPosadiEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmTeritoryEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmMinistry.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmMinistry.Enabled:=false;
  if not frmMinistry.qMinistry.FieldByName('KOD').IsNull then frmMinistryEdit.edtKod.Text:=IntToStr(frmMinistry.qMinistry.FieldByName('KOD').Value) else frmMinistryEdit.aKodUpdateExecute(sender);
  frmMinistryEdit.edtKod.Enabled:=false;
  frmMinistryEdit.btnKod.Enabled:=false;
  if not frmMinistry.qMinistry.FieldByName('MINISTRY').IsNull then frmMinistryEdit.edtMinistry.Text:=frmMinistry.qMinistry.FieldByName('MINISTRY').Value else frmMinistryEdit.edtMinistry.Text:='';
  frmMinistryEdit.edtMinistry.Enabled:=false;
  frmMinistryEdit.btnOK.SetFocus;
end;

procedure TfrmMinistry.aUpdateExecute(Sender: TObject);
begin
  with frmMinistry do
  begin
    qMinistry.SQL.Clear;
    qMinistry.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qMinistry.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmMinistry.aCloseExecute(Sender: TObject);
begin
  frmMinistry.Close;
end;

procedure TfrmMinistry.aSortByKodExecute(Sender: TObject);
begin
  with frmMinistry do
  begin
    qMinistry.SQL.Clear;
    qMinistry.SQL.Text:='select * from MINISTRY order by KOD';
    qMinistry.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmMinistry.aSortByNazvaExecute(Sender: TObject);
begin
  with frmMinistry do
  begin
    qMinistry.SQL.Clear;
    qMinistry.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qMinistry.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmMinistry.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmMinistry.dsMinistry;
end;

end.
