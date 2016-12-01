unit UmoviVidnovlenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Menus, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmUmoviVidnovlenny = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    PopupMenu: TPopupMenu;
    alUmoviVidnovlenny: TActionList;
    dsUmoviVidnovlenny: TDataSource;
    qUmoviVidnovlenny: TIBQuery;
    btnUpdate: TButton;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByName: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNameExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmUmoviVidnovlenny: TfrmUmoviVidnovlenny;

implementation

uses
  Main, AdminZapobizhZahodiEdit, UmoviVidnovlennyEdit;

{$R *.dfm}

procedure TfrmUmoviVidnovlenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmUmoviVidnovlenny.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmUmoviVidnovlennyEdit') then frmUmoviVidnovlennyEdit:=TfrmUmoviVidnovlennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmUmoviVidnovlennyEdit.Show;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmUmoviVidnovlenny.Enabled:=false;
  frmUmoviVidnovlennyEdit.BorderStyle:=bsDialog;
  frmUmoviVidnovlennyEdit.Position:=poMainFormCenter;
  frmUmoviVidnovlennyEdit.Caption:='Додавання умови відновлення';
  frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
  frmUmoviVidnovlennyEdit.edtRecord_ID.Enabled:=false;
  frmUmoviVidnovlennyEdit.aKod_UpdateExecute(sender);
  frmUmoviVidnovlennyEdit.edtKod.Enabled:=true;
  frmUmoviVidnovlennyEdit.btnKod.Enabled:=true;
  frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:='';
  frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Enabled:=true;
  frmUmoviVidnovlennyEdit.edtKod.SetFocus;
end;

procedure TfrmUmoviVidnovlenny.aEditExecute(Sender: TObject);
begin
  if frmUmoviVidnovlenny.qUmoviVidnovlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmUmoviVidnovlennyEdit') then frmUmoviVidnovlennyEdit:=TfrmUmoviVidnovlennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmUmoviVidnovlennyEdit.Show;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmUmoviVidnovlenny.Enabled:=false;
  frmUmoviVidnovlennyEdit.BorderStyle:=bsDialog;
  frmUmoviVidnovlennyEdit.Position:=poMainFormCenter;
  frmUmoviVidnovlennyEdit.Caption:='Редагування умови відновлення';

  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('RECORD_ID').IsNull then frmUmoviVidnovlennyEdit.edtRecord_ID.Text:=IntToStr(frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('RECORD_ID').Value) else frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
  frmUmoviVidnovlennyEdit.edtRecord_ID.Enabled:=false;
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('KOD_UMOVI').IsNull then frmUmoviVidnovlennyEdit.edtKod.Text:=IntToStr(frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('KOD_UMOVI').Value) else frmUmoviVidnovlennyEdit.edtKod.Text:='';
  frmUmoviVidnovlennyEdit.edtKod.Enabled:=true;
  frmUmoviVidnovlennyEdit.btnKod.Enabled:=true;
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('UMOVA_VIDNOVLENNY').IsNull then frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:=frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('UMOVA_VIDNOVLENNY').Value else frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:='';
  frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Enabled:=true;
  frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.SetFocus;
end;

procedure TfrmUmoviVidnovlenny.aDeleteExecute(Sender: TObject);
begin
  if frmUmoviVidnovlenny.qUmoviVidnovlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmUmoviVidnovlennyEdit') then frmUmoviVidnovlennyEdit:=TfrmUmoviVidnovlennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmUmoviVidnovlennyEdit.Show;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmUmoviVidnovlenny.Enabled:=false;
  frmUmoviVidnovlennyEdit.BorderStyle:=bsDialog;
  frmUmoviVidnovlennyEdit.Position:=poMainFormCenter;
  frmUmoviVidnovlennyEdit.Caption:='Видалення умови відновлення';
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('RECORD_ID').IsNull then frmUmoviVidnovlennyEdit.edtRecord_ID.Text:=IntToStr(frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('RECORD_ID').Value) else frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
  frmUmoviVidnovlennyEdit.edtRecord_ID.Enabled:=false;
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('KOD_UMOVI').IsNull then frmUmoviVidnovlennyEdit.edtKod.Text:=IntToStr(frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('KOD_UMOVI').Value) else frmUmoviVidnovlennyEdit.edtKod.Text:='';
  frmUmoviVidnovlennyEdit.edtKod.Enabled:=false;
  frmUmoviVidnovlennyEdit.btnKod.Enabled:=false;
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('UMOVA_VIDNOVLENNY').IsNull then frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:=frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('UMOVA_VIDNOVLENNY').Value else frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:='';
  frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Enabled:=false;
  frmUmoviVidnovlennyEdit.btnVidminiti.SetFocus;
end;

procedure TfrmUmoviVidnovlenny.aChoiceExecute(Sender: TObject);
begin
  if frmUmoviVidnovlenny.qUmoviVidnovlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmUmoviVidnovlennyEdit') then frmUmoviVidnovlennyEdit:=TfrmUmoviVidnovlennyEdit.Create(self);
  frmUmoviVidnovlenny.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmUmoviVidnovlenny.Enabled:=false;
  frmUmoviVidnovlennyEdit.Show;
  frmUmoviVidnovlennyEdit.BorderStyle:=bsDialog;
  frmUmoviVidnovlennyEdit.Position:=poMainFormCenter;
  frmUmoviVidnovlennyEdit.Caption:='Вибір умови відновлення';
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('RECORD_ID').IsNull then frmUmoviVidnovlennyEdit.edtRecord_ID.Text:=IntToStr(frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('RECORD_ID').Value) else frmUmoviVidnovlennyEdit.aRecord_ID_UpdateExecute(sender);
  frmUmoviVidnovlennyEdit.edtRecord_ID.Enabled:=false;
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('KOD_UMOVI').IsNull then frmUmoviVidnovlennyEdit.edtKod.Text:=IntToStr(frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('KOD_UMOVI').Value) else frmUmoviVidnovlennyEdit.edtKod.Text:='';
  frmUmoviVidnovlennyEdit.edtKod.Enabled:=false;
  frmUmoviVidnovlennyEdit.btnKod.Enabled:=false;
  if not frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('UMOVA_VIDNOVLENNY').IsNull then frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:=frmUmoviVidnovlenny.qUmoviVidnovlenny.FieldByName('UMOVA_VIDNOVLENNY').Value else frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Text:='';
  frmUmoviVidnovlennyEdit.edtUmovaVidnovlenny.Enabled:=false;
  frmUmoviVidnovlennyEdit.btnVikonati.SetFocus;
end;

procedure TfrmUmoviVidnovlenny.aUpdateExecute(Sender: TObject);
begin
  with frmUmoviVidnovlenny do
  begin
    qUmoviVidnovlenny.SQL.Clear;
    qUmoviVidnovlenny.SQL.Text:='select * from UMOVI_VIDNOVLENNY order by UMOVA_VIDNOVLENNY';
    qUmoviVidnovlenny.Open;
    aSortByKod.Checked:=false;
    aSortByName.Checked:=true;
  end;
end;

procedure TfrmUmoviVidnovlenny.aCloseExecute(Sender: TObject);
begin
  frmUmoviVidnovlenny.Close;
end;

procedure TfrmUmoviVidnovlenny.aSortByKodExecute(Sender: TObject);
begin
  with frmUmoviVidnovlenny do
  begin
    qUmoviVidnovlenny.SQL.Clear;
    qUmoviVidnovlenny.SQL.Text:='select * from UMOVI_VIDNOVLENNY order by KOD_UMOVI';
    qUmoviVidnovlenny.Open;
    aSortByKod.Checked:=true;
    aSortByName.Checked:=false;
  end;
end;

procedure TfrmUmoviVidnovlenny.aSortByNameExecute(Sender: TObject);
begin
  with frmUmoviVidnovlenny do
  begin
    qUmoviVidnovlenny.SQL.Clear;
    qUmoviVidnovlenny.SQL.Text:='select * from UMOVI_VIDNOVLENNY order by UMOVA_VIDNOVLENNY';
    qUmoviVidnovlenny.Open;
    aSortByKod.Checked:=false;
    aSortByName.Checked:=true;
  end;
end;

procedure TfrmUmoviVidnovlenny.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmUmoviVidnovlenny.dsUmoviVidnovlenny;
end;

end.
