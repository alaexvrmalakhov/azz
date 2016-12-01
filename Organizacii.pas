unit Organizacii;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, SysUtils;

type
  TfrmOrganizacii = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    DBGrid1: TDBGrid;
    alOrganizacii: TActionList;
    btnUpdate: TButton;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    dsOrganizacii: TDataSource;
    qOrganizacii: TIBQuery;
    N1: TMenuItem;
    aSortByKod: TAction;
    aSortByZaNazvoju: TAction;
    aSortByZaPosadoju: TAction;
    aSortByPrizvische: TAction;
    N6: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aSortByZaNazvojuExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByZaPosadojuExecute(Sender: TObject);
    procedure aSortByPrizvischeExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmOrganizacii: TfrmOrganizacii;

implementation

uses
  Main, VidnovlennyRobit, OrganizaciiEdit;

{$R *.dfm}

procedure TfrmOrganizacii.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then
  begin
    frmVidnovlennyRobit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOrganizacii.aCloseExecute(Sender: TObject);
begin
  frmOrganizacii.Close;
end;

procedure TfrmOrganizacii.aUpdateExecute(Sender: TObject);
begin
  with frmOrganizacii do
  begin
    qOrganizacii.SQL.Clear;
    qOrganizacii.SQL.Text:='select * from ORGANIZACII order by NAZVA_OGRANIZACII';
    qOrganizacii.Open;
    aSortByKod.Checked:=false;
    aSortByZaNazvoju.Checked:=true;
    aSortByZaPosadoju.Checked:=false;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmOrganizacii.aChoiceExecute(Sender: TObject);
begin
  if frmOrganizacii.qOrganizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOrganizaciiEdit') then frmOrganizaciiEdit:=TfrmOrganizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then frmOrganizacii.Enabled:=false;
  frmOrganizaciiEdit.Show;
  frmOrganizaciiEdit.BorderStyle:=bsDialog;
  frmOrganizaciiEdit.Position:=poMainFormCenter;
  frmOrganizaciiEdit.Caption:='Вибір організації';
  if not frmOrganizacii.qOrganizacii.FieldByName('RECORD_ID').IsNull then frmOrganizaciiEdit.edtRecord_ID.Text:=IntToStr(frmOrganizacii.qOrganizacii.FieldByName('RECORD_ID').Value) else frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
  frmOrganizaciiEdit.edtRecord_ID.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('KOD_ORGANIZACII').IsNull then frmOrganizaciiEdit.edtKodOrganizacii.Text:=IntToStr(frmOrganizacii.qOrganizacii.FieldByName('KOD_ORGANIZACII').Value) else frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
  frmOrganizaciiEdit.edtKodOrganizacii.Enabled:=false;
  frmOrganizaciiEdit.btnKodOrganizacii.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('NAZVA_OGRANIZACII').IsNull then frmOrganizaciiEdit.edtNazvaOrganizacii.Text:=frmOrganizacii.qOrganizacii.FieldByName('NAZVA_OGRANIZACII').Value else frmOrganizaciiEdit.edtNazvaOrganizacii.Text:='';
  frmOrganizaciiEdit.edtNazvaOrganizacii.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('POSADA_OSOBI').IsNull then frmOrganizaciiEdit.edtPosadaOsobi.Text:=frmOrganizacii.qOrganizacii.FieldByName('POSADA_OSOBI').Value else frmOrganizaciiEdit.edtPosadaOsobi.Text:='';
  frmOrganizaciiEdit.edtPosadaOsobi.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('PIB_OSOBI').IsNull then frmOrganizaciiEdit.edtPIBOsobi.Text:=frmOrganizacii.qOrganizacii.FieldByName('PIB_OSOBI').Value else frmOrganizaciiEdit.edtPIBOsobi.Text:='';
  frmOrganizaciiEdit.edtPIBOsobi.Enabled:=false;
  frmOrganizaciiEdit.btnVikonati.SetFocus;
end;

procedure TfrmOrganizacii.aDeleteExecute(Sender: TObject);
begin
  if frmOrganizacii.qOrganizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOrganizaciiEdit') then frmOrganizaciiEdit:=TfrmOrganizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmOrganizaciiEdit.Show;
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then frmOrganizacii.Enabled:=false;
  frmOrganizaciiEdit.BorderStyle:=bsDialog;
  frmOrganizaciiEdit.Position:=poMainFormCenter;
  frmOrganizaciiEdit.Caption:='Видалення організації';
  if not frmOrganizacii.qOrganizacii.FieldByName('RECORD_ID').IsNull then frmOrganizaciiEdit.edtRecord_ID.Text:=IntToStr(frmOrganizacii.qOrganizacii.FieldByName('RECORD_ID').Value) else frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
  frmOrganizaciiEdit.edtRecord_ID.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('KOD_ORGANIZACII').IsNull then frmOrganizaciiEdit.edtKodOrganizacii.Text:=IntToStr(frmOrganizacii.qOrganizacii.FieldByName('KOD_ORGANIZACII').Value) else frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
  frmOrganizaciiEdit.edtKodOrganizacii.Enabled:=false;
  frmOrganizaciiEdit.btnKodOrganizacii.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('NAZVA_OGRANIZACII').IsNull then frmOrganizaciiEdit.edtNazvaOrganizacii.Text:=frmOrganizacii.qOrganizacii.FieldByName('NAZVA_OGRANIZACII').Value else frmOrganizaciiEdit.edtNazvaOrganizacii.Text:='';
  frmOrganizaciiEdit.edtNazvaOrganizacii.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('POSADA_OSOBI').IsNull then frmOrganizaciiEdit.edtPosadaOsobi.Text:=frmOrganizacii.qOrganizacii.FieldByName('POSADA_OSOBI').Value else frmOrganizaciiEdit.edtPosadaOsobi.Text:='';
  frmOrganizaciiEdit.edtPosadaOsobi.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('PIB_OSOBI').IsNull then frmOrganizaciiEdit.edtPIBOsobi.Text:=frmOrganizacii.qOrganizacii.FieldByName('PIB_OSOBI').Value else frmOrganizaciiEdit.edtPIBOsobi.Text:='';
  frmOrganizaciiEdit.edtPIBOsobi.Enabled:=false;
  frmOrganizaciiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmOrganizacii.aEditExecute(Sender: TObject);
begin
  if frmOrganizacii.qOrganizacii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOrganizaciiEdit') then frmOrganizaciiEdit:=TfrmOrganizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmOrganizaciiEdit.Show;
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then frmOrganizacii.Enabled:=false;
  frmOrganizaciiEdit.BorderStyle:=bsDialog;
  frmOrganizaciiEdit.Position:=poMainFormCenter;
  frmOrganizaciiEdit.Caption:='Редагування організації';
  if not frmOrganizacii.qOrganizacii.FieldByName('RECORD_ID').IsNull then frmOrganizaciiEdit.edtRecord_ID.Text:=IntToStr(frmOrganizacii.qOrganizacii.FieldByName('RECORD_ID').Value) else frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
  frmOrganizaciiEdit.edtRecord_ID.Enabled:=false;
  if not frmOrganizacii.qOrganizacii.FieldByName('KOD_ORGANIZACII').IsNull then frmOrganizaciiEdit.edtKodOrganizacii.Text:=IntToStr(frmOrganizacii.qOrganizacii.FieldByName('KOD_ORGANIZACII').Value) else frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
  frmOrganizaciiEdit.edtKodOrganizacii.Enabled:=true;
  frmOrganizaciiEdit.btnKodOrganizacii.Enabled:=true;
  if not frmOrganizacii.qOrganizacii.FieldByName('NAZVA_OGRANIZACII').IsNull then frmOrganizaciiEdit.edtNazvaOrganizacii.Text:=frmOrganizacii.qOrganizacii.FieldByName('NAZVA_OGRANIZACII').Value else frmOrganizaciiEdit.edtNazvaOrganizacii.Text:='';
  frmOrganizaciiEdit.edtNazvaOrganizacii.Enabled:=true;
  if not frmOrganizacii.qOrganizacii.FieldByName('POSADA_OSOBI').IsNull then frmOrganizaciiEdit.edtPosadaOsobi.Text:=frmOrganizacii.qOrganizacii.FieldByName('POSADA_OSOBI').Value else frmOrganizaciiEdit.edtPosadaOsobi.Text:='';
  frmOrganizaciiEdit.edtPosadaOsobi.Enabled:=true;
  if not frmOrganizacii.qOrganizacii.FieldByName('PIB_OSOBI').IsNull then frmOrganizaciiEdit.edtPIBOsobi.Text:=frmOrganizacii.qOrganizacii.FieldByName('PIB_OSOBI').Value else frmOrganizaciiEdit.edtPIBOsobi.Text:='';
  frmOrganizaciiEdit.edtPIBOsobi.Enabled:=true;
  frmOrganizaciiEdit.edtNazvaOrganizacii.SetFocus;
end;

procedure TfrmOrganizacii.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOrganizaciiEdit') then frmOrganizaciiEdit:=TfrmOrganizaciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmOrganizaciiEdit.Show;
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then frmOrganizacii.Enabled:=false;
  frmOrganizaciiEdit.BorderStyle:=bsDialog;
  frmOrganizaciiEdit.Position:=poMainFormCenter;
  frmOrganizaciiEdit.Caption:='Додавання організації';
  frmOrganizaciiEdit.aRecord_ID_UpdateExecute(sender);
  frmOrganizaciiEdit.edtRecord_ID.Enabled:=false;
  frmOrganizaciiEdit.aKodOrganizaciiUpdateExecute(sender);
  frmOrganizaciiEdit.edtKodOrganizacii.Enabled:=true;
  frmOrganizaciiEdit.btnKodOrganizacii.Enabled:=true;
  frmOrganizaciiEdit.edtNazvaOrganizacii.Text:='';
  frmOrganizaciiEdit.edtNazvaOrganizacii.Enabled:=true;
  frmOrganizaciiEdit.edtPosadaOsobi.Text:='';
  frmOrganizaciiEdit.edtPosadaOsobi.Enabled:=true;
  frmOrganizaciiEdit.edtPIBOsobi.Text:='';
  frmOrganizaciiEdit.edtPIBOsobi.Enabled:=true;
  frmOrganizaciiEdit.edtNazvaOrganizacii.SetFocus;
end;

procedure TfrmOrganizacii.aSortByZaNazvojuExecute(Sender: TObject);
begin
  with frmOrganizacii do
  begin
    qOrganizacii.SQL.Clear;
    qOrganizacii.SQL.Text:='select * from ORGANIZACII order by NAZVA_OGRANIZACII';
    qOrganizacii.Open;
    aSortByKod.Checked:=false;
    aSortByZaNazvoju.Checked:=true;
    aSortByZaPosadoju.Checked:=false;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmOrganizacii.aSortByKodExecute(Sender: TObject);
begin
  with frmOrganizacii do
  begin
    qOrganizacii.SQL.Clear;
    qOrganizacii.SQL.Text:='select * from ORGANIZACII order by KOD_ORGANIZACII';
    qOrganizacii.Open;
    aSortByKod.Checked:=true;
    aSortByZaNazvoju.Checked:=false;
    aSortByZaPosadoju.Checked:=false;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmOrganizacii.aSortByZaPosadojuExecute(Sender: TObject);
begin
  with frmOrganizacii do
  begin
    qOrganizacii.SQL.Clear;
    qOrganizacii.SQL.Text:='select * from ORGANIZACII order by POSADA_OSOBI';
    qOrganizacii.Open;
    aSortByKod.Checked:=false;
    aSortByZaNazvoju.Checked:=false;
    aSortByZaPosadoju.Checked:=true;
    aSortByPrizvische.Checked:=false;
  end;
end;

procedure TfrmOrganizacii.aSortByPrizvischeExecute(Sender: TObject);
begin
  with frmOrganizacii do
  begin
    qOrganizacii.SQL.Clear;
    qOrganizacii.SQL.Text:='select * from ORGANIZACII order by PIB_OSOBI';
    qOrganizacii.Open;
    aSortByKod.Checked:=false;
    aSortByZaNazvoju.Checked:=false;
    aSortByZaPosadoju.Checked:=false;
    aSortByPrizvische.Checked:=true;
  end;
end;

procedure TfrmOrganizacii.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmOrganizacii.dsOrganizacii;
end;

end.
