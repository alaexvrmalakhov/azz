unit Napravlenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmNapravlenny = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    alNapravlenny: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    btnUpdate: TButton;
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
    aSortByPrizvische: TAction;
    aSortByPosada: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    dsNapravlenny: TDataSource;
    qNapravlenny: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByPrizvischeExecute(Sender: TObject);
    procedure aSortByPosadaExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmNapravlenny: TfrmNapravlenny;

implementation

uses
  Main, NapravlenoDoVidoma, NapravlennyEdit;

{$R *.dfm}

procedure TfrmNapravlenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
  begin
    frmNapravlenoDoVidoma.Enabled:=true;
    frmMain.Enabled:=False;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmNapravlenny.aCloseExecute(Sender: TObject);
begin
  frmNapravlenny.Close;
end;

procedure TfrmNapravlenny.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmNapravlennyEdit') then frmNapravlennyEdit:=TfrmNapravlennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmNapravlennyEdit.Show;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenny.Enabled:=false;
  frmNapravlennyEdit.BorderStyle:=bsDialog;
  frmNapravlennyEdit.Position:=poMainFormCenter;
  frmNapravlennyEdit.Caption:='Додавання отримувача';
  frmNapravlennyEdit.aKodUpdateExecute(sender);
  frmNapravlennyEdit.edtKod.Enabled:=false;
  frmNapravlennyEdit.btnKod.Enabled:=false;
  frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:='';
  frmNapravlennyEdit.edtPIB_Otrimuvacha.Enabled:=true;

  frmNapravlennyEdit.aPosadaOtrimuvacha_UpdateExecute(sender);
  frmNapravlennyEdit.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Choice.Enabled:=true;
  frmNapravlennyEdit.edtPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmNapravlenny.aEditExecute(Sender: TObject);
begin
  if frmNapravlenny.qNapravlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlennyEdit') then frmNapravlennyEdit:=TfrmNapravlennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmNapravlennyEdit.Show;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenny.Enabled:=false;
  frmNapravlennyEdit.BorderStyle:=bsDialog;
  frmNapravlennyEdit.Position:=poMainFormCenter;
  frmNapravlennyEdit.Caption:='Редагування отримувача';
  if not frmNapravlenny.qNapravlenny.FieldByName('KODNAPRAVLENNY').IsNull then frmNapravlennyEdit.edtKod.Text:=IntToStr(frmNapravlenny.qNapravlenny.FieldByName('KODNAPRAVLENNY').Value) else frmNapravlennyEdit.aKodUpdateExecute(sender);
  frmNapravlennyEdit.edtKod.Enabled:=false;
  frmNapravlennyEdit.btnKod.Enabled:=false;

  if not frmNapravlenny.qNapravlenny.FieldByName('PIB').IsNull then frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:=frmNapravlenny.qNapravlenny.FieldByName('PIB').Value else frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:='';
  frmNapravlennyEdit.edtPIB_Otrimuvacha.Enabled:=true;

  frmNapravlennyEdit.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmNapravlenny.qNapravlenny.FieldByName('POSADA').IsNull then frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:=frmNapravlenny.qNapravlenny.FieldByName('POSADA').Value else frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:='';
  frmNapravlennyEdit.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Choice.Enabled:=true;
  frmNapravlennyEdit.edtPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmNapravlenny.aDeleteExecute(Sender: TObject);
begin
  if frmNapravlenny.qNapravlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlennyEdit') then frmNapravlennyEdit:=TfrmNapravlennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmNapravlennyEdit.Show;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenny.Enabled:=false;
  frmNapravlennyEdit.BorderStyle:=bsDialog;
  frmNapravlennyEdit.Position:=poMainFormCenter;
  frmNapravlennyEdit.Caption:='Видалення отримувача';
  if not frmNapravlenny.qNapravlenny.FieldByName('KODNAPRAVLENNY').IsNull then frmNapravlennyEdit.edtKod.Text:=IntToStr(frmNapravlenny.qNapravlenny.FieldByName('KODNAPRAVLENNY').Value) else frmNapravlennyEdit.aKodUpdateExecute(sender);
  frmNapravlennyEdit.edtKod.Enabled:=false;
  frmNapravlennyEdit.btnKod.Enabled:=false;

  if not frmNapravlenny.qNapravlenny.FieldByName('PIB').IsNull then frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:=frmNapravlenny.qNapravlenny.FieldByName('PIB').Value else frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:='';
  frmNapravlennyEdit.edtPIB_Otrimuvacha.Enabled:=false;

  frmNapravlennyEdit.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmNapravlenny.qNapravlenny.FieldByName('POSADA').IsNull then frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:=frmNapravlenny.qNapravlenny.FieldByName('POSADA').Value else frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:='';
  frmNapravlennyEdit.cbPosadaOtrimuvacha.Enabled:=false;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Update.Enabled:=false;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Choice.Enabled:=false;
  frmNapravlennyEdit.btnVidminiti.SetFocus;
end;

procedure TfrmNapravlenny.aChoiceExecute(Sender: TObject);
begin
  if frmNapravlenny.qNapravlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlennyEdit') then frmNapravlennyEdit:=TfrmNapravlennyEdit.Create(self);
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenny.Enabled:=false;
  frmMain.Enabled:=false;
  frmNapravlennyEdit.Show;
  frmNapravlennyEdit.BorderStyle:=bsDialog;
  frmNapravlennyEdit.Position:=poMainFormCenter;
  frmNapravlennyEdit.Caption:='Вибір отримувача';
  if not frmNapravlenny.qNapravlenny.FieldByName('KODNAPRAVLENNY').IsNull then frmNapravlennyEdit.edtKod.Text:=IntToStr(frmNapravlenny.qNapravlenny.FieldByName('KODNAPRAVLENNY').Value) else frmNapravlennyEdit.aKodUpdateExecute(sender);
  frmNapravlennyEdit.edtKod.Enabled:=false;
  frmNapravlennyEdit.btnKod.Enabled:=false;

  if not frmNapravlenny.qNapravlenny.FieldByName('PIB').IsNull then frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:=frmNapravlenny.qNapravlenny.FieldByName('PIB').Value else frmNapravlennyEdit.edtPIB_Otrimuvacha.Text:='';
  frmNapravlennyEdit.edtPIB_Otrimuvacha.Enabled:=false;

  frmNapravlennyEdit.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmNapravlenny.qNapravlenny.FieldByName('POSADA').IsNull then frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:=frmNapravlenny.qNapravlenny.FieldByName('POSADA').Value else frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:='';
  frmNapravlennyEdit.cbPosadaOtrimuvacha.Enabled:=false;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Update.Enabled:=false;
  frmNapravlennyEdit.btnPosadaOtrimuvacha_Choice.Enabled:=false;
  frmNapravlennyEdit.btnVidminiti.SetFocus;
end;

procedure TfrmNapravlenny.aSortByKodExecute(Sender: TObject);
begin
  with frmNapravlenny do
  begin
    qNapravlenny.SQL.Clear;
    qNapravlenny.SQL.Text:='select * from NAPRAVLENNY order by KODNAPRAVLENNY';
    qNapravlenny.Open;
    aSortByKod.Checked:=true;
    aSortByPrizvische.Checked:=false;
    aSortByPosada.Checked:=false;
  end;
end;

procedure TfrmNapravlenny.aSortByPrizvischeExecute(Sender: TObject);
begin
  with frmNapravlenny do
  begin
    qNapravlenny.SQL.Clear;
    qNapravlenny.SQL.Text:='select * from NAPRAVLENNY order by PIB';
    qNapravlenny.Open;
    aSortByKod.Checked:=false;
    aSortByPrizvische.Checked:=true;
    aSortByPosada.Checked:=false;
  end;
end;

procedure TfrmNapravlenny.aSortByPosadaExecute(Sender: TObject);
begin
  with frmNapravlenny do
  begin
    qNapravlenny.SQL.Clear;
    qNapravlenny.SQL.Text:='select * from NAPRAVLENNY order by POSADA';
    qNapravlenny.Open;
    aSortByKod.Checked:=false;
    aSortByPrizvische.Checked:=false;
    aSortByPosada.Checked:=true;
  end;
end;

procedure TfrmNapravlenny.aUpdateExecute(Sender: TObject);
begin
  with frmNapravlenny do
  begin
    qNapravlenny.SQL.Clear;
    qNapravlenny.SQL.Text:='select * from NAPRAVLENNY order by PIB';
    qNapravlenny.Open;
    aSortByKod.Checked:=false;
    aSortByPrizvische.Checked:=true;
    aSortByPosada.Checked:=false;
  end;
end;

procedure TfrmNapravlenny.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmNapravlenny.dsNapravlenny;
end;

end.
