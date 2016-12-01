unit KudiOskarzheno;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, SysUtils;

type
  TfrmKudiOskarzheno = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    DBGrid1: TDBGrid;
    alKudiOskarzheno: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    btnUpdate: TButton;
    aUpdate: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    dsKudiOskarzheno: TDataSource;
    qKudiOskarzheno: TIBQuery;
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
    N10: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmKudiOskarzheno: TfrmKudiOskarzheno;

implementation

uses
  Main, Oskarzhenny, KudiOskarzhenoEdit;

{$R *.dfm}

procedure TfrmKudiOskarzheno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qKudiOskarzheno.Close;

  if frmMain.IsFormOpen('frmOskarzhenny') then
  begin
    frmOskarzhenny.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmKudiOskarzheno.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmKudiOskarzhenoEdit') then frmKudiOskarzhenoEdit:=TfrmKudiOskarzhenoEdit.Create(self);
  frmMain.Enabled:=false;
  frmKudiOskarzhenoEdit.Show;
  if frmMain.IsFormOpen('frmOskarzhenny') then frmKudiOskarzheno.Enabled:=False;
  frmKudiOskarzhenoEdit.Caption:='Додавання організації';
  frmKudiOskarzhenoEdit.Position:=poMainFormCenter;
  frmKudiOskarzhenoEdit.BorderStyle:=bsDialog;
  frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
  frmKudiOskarzhenoEdit.edtKodOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.btnKodOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:='';
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Enabled:=true;
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.SetFocus;
end;

procedure TfrmKudiOskarzheno.aEditExecute(Sender: TObject);
begin
  if frmKudiOskarzheno.qKudiOskarzheno.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmKudiOskarzhenoEdit') then frmKudiOskarzhenoEdit:=TfrmKudiOskarzhenoEdit.Create(self);
  frmMain.Enabled:=false;
  frmKudiOskarzhenoEdit.Show;
  if frmMain.IsFormOpen('frmOskarzhenny') then frmKudiOskarzheno.Enabled:=False;
  frmKudiOskarzhenoEdit.Caption:='Редагування організації';
  frmKudiOskarzhenoEdit.Position:=poMainFormCenter;
  frmKudiOskarzhenoEdit.BorderStyle:=bsDialog;
  if not frmKudiOskarzheno.qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').IsNull then frmKudiOskarzhenoEdit.edtKodOrganizacii.Text:=IntToStr(frmKudiOskarzheno.qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').Value) else frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
  frmKudiOskarzhenoEdit.edtKodOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.btnKodOrganizacii.Enabled:=false;
  if not frmKudiOskarzheno.qKudiOskarzheno.FieldByName('NAZVAORGANIZACIIOSKARZHENO').IsNull then frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:=frmKudiOskarzheno.qKudiOskarzheno.FieldByName('NAZVAORGANIZACIIOSKARZHENO').Value else frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:='';
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Enabled:=true;
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.SetFocus;
end;

procedure TfrmKudiOskarzheno.aDeleteExecute(Sender: TObject);
begin
  if frmKudiOskarzheno.qKudiOskarzheno.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmKudiOskarzhenoEdit') then frmKudiOskarzhenoEdit:=TfrmKudiOskarzhenoEdit.Create(self);
  frmMain.Enabled:=false;
  frmKudiOskarzhenoEdit.Show;
  if frmMain.IsFormOpen('frmOskarzhenny') then frmKudiOskarzheno.Enabled:=False;
  frmKudiOskarzhenoEdit.Caption:='Видалення організації';
  frmKudiOskarzhenoEdit.Position:=poMainFormCenter;
  frmKudiOskarzhenoEdit.BorderStyle:=bsDialog;
  if not frmKudiOskarzheno.qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').IsNull then frmKudiOskarzhenoEdit.edtKodOrganizacii.Text:=IntToStr(frmKudiOskarzheno.qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').Value) else frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
  frmKudiOskarzhenoEdit.edtKodOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.btnKodOrganizacii.Enabled:=false;
  if not frmKudiOskarzheno.qKudiOskarzheno.FieldByName('NAZVAORGANIZACIIOSKARZHENO').IsNull then frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:=frmKudiOskarzheno.qKudiOskarzheno.FieldByName('NAZVAORGANIZACIIOSKARZHENO').Value else frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:='';
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.btnVidmina.SetFocus;
end;

procedure TfrmKudiOskarzheno.aChoiceExecute(Sender: TObject);
begin
  if frmKudiOskarzheno.qKudiOskarzheno.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmKudiOskarzhenoEdit') then frmKudiOskarzhenoEdit:=TfrmKudiOskarzhenoEdit.Create(self);
  if frmMain.IsFormOpen('frmOskarzhenny') then frmKudiOskarzheno.Enabled:=False;
  frmKudiOskarzheno.Enabled:=false;
  frmKudiOskarzhenoEdit.Show;
  frmKudiOskarzhenoEdit.Caption:='Вибір організації';
  frmKudiOskarzhenoEdit.Position:=poMainFormCenter;
  frmKudiOskarzhenoEdit.BorderStyle:=bsDialog;
  if not frmKudiOskarzheno.qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').IsNull then frmKudiOskarzhenoEdit.edtKodOrganizacii.Text:=IntToStr(frmKudiOskarzheno.qKudiOskarzheno.FieldByName('KODORGANOZACIIOSKARZHENO').Value) else frmKudiOskarzhenoEdit.aKodUpdateExecute(sender);
  frmKudiOskarzhenoEdit.edtKodOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.btnKodOrganizacii.Enabled:=false;
  if not frmKudiOskarzheno.qKudiOskarzheno.FieldByName('NAZVAORGANIZACIIOSKARZHENO').IsNull then frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:=frmKudiOskarzheno.qKudiOskarzheno.FieldByName('NAZVAORGANIZACIIOSKARZHENO').Value else frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Text:='';
  frmKudiOskarzhenoEdit.edtNazvaOrganizacii.Enabled:=false;
  frmKudiOskarzhenoEdit.btnVikonati.SetFocus;
end;

procedure TfrmKudiOskarzheno.aCloseExecute(Sender: TObject);
begin
  frmKudiOskarzheno.Close;
end;

procedure TfrmKudiOskarzheno.aUpdateExecute(Sender: TObject);
begin
  with frmKudiOskarzheno do
  begin
    qKudiOskarzheno.SQL.Clear;
    qKudiOskarzheno.SQL.Text:='select * from KUDIOSKARZHENO order by NAZVAORGANIZACIIOSKARZHENO';
    qKudiOskarzheno.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmKudiOskarzheno.aSortByNazvaExecute(Sender: TObject);
begin
  with frmKudiOskarzheno do
  begin
    qKudiOskarzheno.SQL.Clear;
    qKudiOskarzheno.SQL.Text:='select * from KUDIOSKARZHENO order by NAZVAORGANIZACIIOSKARZHENO';
    qKudiOskarzheno.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmKudiOskarzheno.aSortByKodExecute(Sender: TObject);
begin
  with frmKudiOskarzheno do
  begin
    qKudiOskarzheno.SQL.Clear;
    qKudiOskarzheno.SQL.Text:='select * from KUDIOSKARZHENO order by KODORGANOZACIIOSKARZHENO';
    qKudiOskarzheno.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmKudiOskarzheno.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmKudiOskarzheno.dsKudiOskarzheno;
end;

end.
