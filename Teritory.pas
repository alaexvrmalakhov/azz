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
    Panel2: TPanel;
    cbMinistry: TComboBox;
    btnMinistry: TButton;
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
    aMinistryUpdate: TAction;
    qMinistry: TIBQuery;
    aSortByKod: TAction;
    aSortByTeritory: TAction;
    N1: TMenuItem;
    mnSort: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aMinistryUpdateExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByTeritoryExecute(Sender: TObject);
    procedure cbMinistryChange(Sender: TObject);
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

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmTeritory.FormResize(Sender: TObject);
begin
  frmTeritory.btnMinistry.Left:=frmTeritory.Width-32;
  frmTeritory.cbMinistry.Width:=frmTeritory.btnMinistry.Left-4;
end;

procedure TfrmTeritory.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTeritoryEdit') then frmTeritoryEdit:=TfrmTeritoryEdit.Create(self);
  frmMain.Enabled:=false;
  frmTeritoryEdit.Show;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;
  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Додати територію';
  frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  frmTeritoryEdit.aMinistryUpdateExecute(sender);
  frmTeritoryEdit.cbMinistry.Enabled:=true;
  frmTeritoryEdit.btnMinistryUpdate.Enabled:=true;
  frmTeritoryEdit.btnMinistryChoice.Enabled:=true;
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
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;
  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Редагувати територію';

  if not frmTeritory.qTeritory.FieldByName('KOD').IsNull then frmTeritoryEdit.edtKod.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('KOD').Value) else frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  frmTeritoryEdit.aMinistryUpdateExecute(sender);
  if not frmTeritory.qTeritory.FieldByName('MINISTRY').IsNull then frmTeritoryEdit.cbMinistry.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('MINISTRY').Value) else frmTeritoryEdit.cbMinistry.Text:='0';
  if frmTeritoryEdit.qTeritoryUpdates.Locate('KOD',StrToInt(frmTeritoryEdit.cbMinistry.Text),[]) then frmTeritoryEdit.cbMinistry.Text:=frmTeritoryEdit.qTeritoryUpdates.FieldByName('MINISTRY').Value else frmTeritoryEdit.cbMinistry.Text:='';
  frmTeritoryEdit.cbMinistry.Enabled:=true;
  frmTeritoryEdit.btnMinistryUpdate.Enabled:=true;
  frmTeritoryEdit.btnMinistryChoice.Enabled:=true;
  if not frmTeritory.qTeritory.FieldByName('TERITORY').IsNull then frmTeritoryEdit.edtTeritory.Text:=frmTeritory.qTeritory.FieldByName('TERITORY').Value else frmTeritoryEdit.edtTeritory.Text:='';
  frmTeritoryEdit.edtTeritory.Enabled:=true;
  frmTeritoryEdit.edtTeritory.SetFocus;
end;

procedure TfrmTeritory.aDeleteExecute(Sender: TObject);
begin
  if frmTeritory.qTeritory.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTeritoryEdit') then frmTeritoryEdit:=TfrmTeritoryEdit.Create(self);
  frmMain.Enabled:=false;
  frmTeritoryEdit.Show;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;
  frmTeritoryEdit.BorderStyle:=bsDialog;
  frmTeritoryEdit.Position:=poMainFormCenter;
  frmTeritoryEdit.Caption:='Видалити територію';

  if not frmTeritory.qTeritory.FieldByName('KOD').IsNull then frmTeritoryEdit.edtKod.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('KOD').Value) else frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  frmTeritoryEdit.aMinistryUpdateExecute(sender);
  if not frmTeritory.qTeritory.FieldByName('MINISTRY').IsNull then frmTeritoryEdit.cbMinistry.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('MINISTRY').Value) else frmTeritoryEdit.cbMinistry.Text:='0';
  if frmTeritoryEdit.qTeritoryUpdates.Locate('KOD',StrToInt(frmTeritoryEdit.cbMinistry.Text),[]) then frmTeritoryEdit.cbMinistry.Text:=frmTeritoryEdit.qTeritoryUpdates.FieldByName('MINISTRY').Value else frmTeritoryEdit.cbMinistry.Text:='';
  frmTeritoryEdit.cbMinistry.Enabled:=false;
  frmTeritoryEdit.btnMinistryUpdate.Enabled:=false;
  frmTeritoryEdit.btnMinistryChoice.Enabled:=false;
  if not frmTeritory.qTeritory.FieldByName('TERITORY').IsNull then frmTeritoryEdit.edtTeritory.Text:=frmTeritory.qTeritory.FieldByName('TERITORY').Value else frmTeritoryEdit.edtTeritory.Text:='';
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
  if frmMain.IsFormOpen('frmPosadiEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmRajoniEdit') then frmTeritory.Enabled:=false;
  if frmMain.IsFormOpen('frmViddilennyEdit') then frmTeritory.Enabled:=false;

  if not frmTeritory.qTeritory.FieldByName('KOD').IsNull then frmTeritoryEdit.edtKod.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('KOD').Value) else frmTeritoryEdit.aKodUpdateExecute(sender);
  frmTeritoryEdit.edtKod.Enabled:=false;
  frmTeritoryEdit.btnKod.Enabled:=false;
  frmTeritoryEdit.aMinistryUpdateExecute(sender);
  if not frmTeritory.qTeritory.FieldByName('MINISTRY').IsNull then frmTeritoryEdit.cbMinistry.Text:=IntToStr(frmTeritory.qTeritory.FieldByName('MINISTRY').Value) else frmTeritoryEdit.cbMinistry.Text:='0';
  if frmTeritoryEdit.qTeritoryUpdates.Locate('KOD',StrToInt(frmTeritoryEdit.cbMinistry.Text),[]) then frmTeritoryEdit.cbMinistry.Text:=frmTeritoryEdit.qTeritoryUpdates.FieldByName('MINISTRY').Value else frmTeritoryEdit.cbMinistry.Text:='';
  frmTeritoryEdit.cbMinistry.Enabled:=false;
  frmTeritoryEdit.btnMinistryUpdate.Enabled:=false;
  frmTeritoryEdit.btnMinistryChoice.Enabled:=false;
  if not frmTeritory.qTeritory.FieldByName('TERITORY').IsNull then frmTeritoryEdit.edtTeritory.Text:=frmTeritory.qTeritory.FieldByName('TERITORY').Value else frmTeritoryEdit.edtTeritory.Text:='';
  frmTeritoryEdit.edtTeritory.Enabled:=false;
  frmTeritoryEdit.btnVikonati.SetFocus;
end;

procedure TfrmTeritory.aUpdateExecute(Sender: TObject);
begin
  with frmTeritory do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmTeritory.cbMinistry.Text;
    qTeritory.Open;
    aSortByKod.Checked:=false;
    aSortByTeritory.Checked:=true;
  end;
end;

procedure TfrmTeritory.aCloseExecute(Sender: TObject);
begin
  frmTeritory.Close;
end;

procedure TfrmTeritory.aMinistryUpdateExecute(Sender: TObject);
begin
  with frmTeritory do
  begin
    qMinistry.SQL.Clear;
    qMinistry.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qMinistry.Open;
    cbMinistry.Items.Clear;
    cbMinistry.Text:='';
    qMinistry.First;
    while not qMinistry.Eof do
    begin
      cbMinistry.Items.Add(qMinistry.FieldByName('MINISTRY').Value);
      qMinistry.Next;
    end;
  end;
end;

procedure TfrmTeritory.aSortByKodExecute(Sender: TObject);
begin
  with frmTeritory do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.KOD';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmTeritory.cbMinistry.Text;
    qTeritory.Open;
    aSortByKod.Checked:=true;
    aSortByTeritory.Checked:=false;
  end;
end;

procedure TfrmTeritory.aSortByTeritoryExecute(Sender: TObject);
begin
  with frmTeritory do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY='''+frmTeritory.cbMinistry.Text+''' and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmTeritory.cbMinistry.Text;
    qTeritory.Open;
    aSortByKod.Checked:=true;
    aSortByTeritory.Checked:=false;
  end;
end;

procedure TfrmTeritory.cbMinistryChange(Sender: TObject);
begin
  frmTeritory.aUpdateExecute(sender);
end;

procedure TfrmTeritory.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmTeritory.dsTeritory;
end;

end.
