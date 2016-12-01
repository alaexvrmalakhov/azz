unit VidObmezhen;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  Grids, DBGrids, Controls, ExtCtrls, SysUtils;

type
  TfrmVidObmezhen = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    edtFind: TEdit;
    alVidObmezhen: TActionList;
    PopupMenu: TPopupMenu;
    btnUpdate: TButton;
    dsVidObmezhen: TDataSource;
    qVidObmezhen: TIBQuery;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    aAdd1: TMenuItem;
    aEdit1: TMenuItem;
    aDelete1: TMenuItem;
    aChoice1: TMenuItem;
    N1: TMenuItem;
    aSortByKod1: TMenuItem;
    aSortByNazva1: TMenuItem;
    aClose1: TMenuItem;
    aUpdate1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure edtFindChange(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure qVidObmezhenFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmVidObmezhen: TfrmVidObmezhen;

implementation

uses
  Main, Opechanuvanny, AdminZapobizhZahodiEdit, VidObmezhenEdit;

{$R *.dfm}

procedure TfrmVidObmezhen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidObmezhen.FormResize(Sender: TObject);
begin
  frmVidObmezhen.edtFind.Left:=4;
  frmVidObmezhen.edtFind.Width:=frmVidObmezhen.Width-16;
end;

procedure TfrmVidObmezhen.edtFindChange(Sender: TObject);
begin
  frmVidObmezhen.qVidObmezhen.Filtered:=false;
  if frmVidObmezhen.edtFind.Text<>'' then frmVidObmezhen.qVidObmezhen.Filtered:=true else frmVidObmezhen.qVidObmezhen.Filtered:=false;
end;

procedure TfrmVidObmezhen.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidObmezhenEdit') then frmVidObmezhenEdit:=TfrmVidObmezhenEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidObmezhenEdit.Show;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmVidObmezhen.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidObmezhen.Enabled:=false;
  frmVidObmezhenEdit.Caption:='Додавання обмеження';
  frmVidObmezhenEdit.BorderStyle:=bsDialog;
  frmVidObmezhenEdit.Position:=poMainFormCenter;
  frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
  frmVidObmezhenEdit.edtRecord_ID.Enabled:=false;
  frmVidObmezhenEdit.aKodUpdateExecute(sender);
  frmVidObmezhenEdit.edtKodObmezhenny.Enabled:=true;
  frmVidObmezhenEdit.btnKodObmezhenny.Enabled:=true;
  frmVidObmezhenEdit.edtVidObmezhenny.Text:='';
  frmVidObmezhenEdit.edtVidObmezhenny.Enabled:=true;
  frmVidObmezhenEdit.edtVidObmezhenny.SetFocus;
end;

procedure TfrmVidObmezhen.aEditExecute(Sender: TObject);
begin
  if frmVidObmezhen.qVidObmezhen.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidObmezhenEdit') then frmVidObmezhenEdit:=TfrmVidObmezhenEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidObmezhenEdit.Show;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmVidObmezhen.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidObmezhen.Enabled:=false;
  frmVidObmezhenEdit.Caption:='Редагування обмеження';
  frmVidObmezhenEdit.BorderStyle:=bsDialog;
  frmVidObmezhenEdit.Position:=poMainFormCenter;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('RECORD_ID').IsNull then frmVidObmezhenEdit.edtRecord_ID.Text:=IntToStr(frmVidObmezhen.qVidObmezhen.FieldByName('RECORD_ID').Value) else frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
  frmVidObmezhenEdit.edtRecord_ID.Enabled:=false;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('KODOBMEZHENNY').IsNull then frmVidObmezhenEdit.edtKodObmezhenny.Text:=IntToStr(frmVidObmezhen.qVidObmezhen.FieldByName('KODOBMEZHENNY').Value) else frmVidObmezhenEdit.edtKodObmezhenny.Text:='';
  frmVidObmezhenEdit.edtKodObmezhenny.Enabled:=true;
  frmVidObmezhenEdit.btnKodObmezhenny.Enabled:=true;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').IsNull then frmVidObmezhenEdit.edtVidObmezhenny.Text:=frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').Value else frmVidObmezhenEdit.edtVidObmezhenny.Text:='';
  frmVidObmezhenEdit.edtVidObmezhenny.Enabled:=true;
  frmVidObmezhenEdit.edtVidObmezhenny.SetFocus;
end;

procedure TfrmVidObmezhen.aDeleteExecute(Sender: TObject);
begin
  if frmVidObmezhen.qVidObmezhen.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidObmezhenEdit') then frmVidObmezhenEdit:=TfrmVidObmezhenEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidObmezhenEdit.Show;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmVidObmezhen.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidObmezhen.Enabled:=false;
  frmVidObmezhenEdit.Caption:='Видалення обмеження';
  frmVidObmezhenEdit.BorderStyle:=bsDialog;
  frmVidObmezhenEdit.Position:=poMainFormCenter;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('RECORD_ID').IsNull then frmVidObmezhenEdit.edtRecord_ID.Text:=IntToStr(frmVidObmezhen.qVidObmezhen.FieldByName('RECORD_ID').Value) else frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
  frmVidObmezhenEdit.edtRecord_ID.Enabled:=false;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('KODOBMEZHENNY').IsNull then frmVidObmezhenEdit.edtKodObmezhenny.Text:=IntToStr(frmVidObmezhen.qVidObmezhen.FieldByName('KODOBMEZHENNY').Value) else frmVidObmezhenEdit.edtKodObmezhenny.Text:='';
  frmVidObmezhenEdit.edtKodObmezhenny.Enabled:=false;
  frmVidObmezhenEdit.btnKodObmezhenny.Enabled:=false;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').IsNull then frmVidObmezhenEdit.edtVidObmezhenny.Text:=frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').Value else frmVidObmezhenEdit.edtVidObmezhenny.Text:='';
  frmVidObmezhenEdit.edtVidObmezhenny.Enabled:=false;
  frmVidObmezhenEdit.btnVidminiti.SetFocus;
end;

procedure TfrmVidObmezhen.aChoiceExecute(Sender: TObject);
begin
  if frmVidObmezhen.qVidObmezhen.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidObmezhenEdit') then frmVidObmezhenEdit:=TfrmVidObmezhenEdit.Create(self);
  frmVidObmezhenEdit.Show;
  frmVidObmezhen.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmVidObmezhen.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidObmezhen.Enabled:=false;
  frmVidObmezhenEdit.Caption:='Вибір обмеження';
  frmVidObmezhenEdit.BorderStyle:=bsDialog;
  frmVidObmezhenEdit.Position:=poMainFormCenter;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('RECORD_ID').IsNull then frmVidObmezhenEdit.edtRecord_ID.Text:=IntToStr(frmVidObmezhen.qVidObmezhen.FieldByName('RECORD_ID').Value) else frmVidObmezhenEdit.aRecord_ID_UpdateExecute(sender);
  frmVidObmezhenEdit.edtRecord_ID.Enabled:=false;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('KODOBMEZHENNY').IsNull then frmVidObmezhenEdit.edtKodObmezhenny.Text:=IntToStr(frmVidObmezhen.qVidObmezhen.FieldByName('KODOBMEZHENNY').Value) else frmVidObmezhenEdit.edtKodObmezhenny.Text:='';
  frmVidObmezhenEdit.edtKodObmezhenny.Enabled:=false;
  frmVidObmezhenEdit.btnKodObmezhenny.Enabled:=false;
  if not frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').IsNull then frmVidObmezhenEdit.edtVidObmezhenny.Text:=frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').Value else frmVidObmezhenEdit.edtVidObmezhenny.Text:='';
  frmVidObmezhenEdit.edtVidObmezhenny.Enabled:=false;
  frmVidObmezhenEdit.btnVikonati.SetFocus;
end;

procedure TfrmVidObmezhen.aUpdateExecute(Sender: TObject);
begin
  with frmVidObmezhen do
  begin
    qVidObmezhen.SQL.Clear;
    qVidObmezhen.SQL.Text:='select * from VIDOBMEZHEN order by VIDOBMEZHENNY';
    qVidObmezhen.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmVidObmezhen.aCloseExecute(Sender: TObject);
begin
  frmVidObmezhen.Close;
end;

procedure TfrmVidObmezhen.aSortByKodExecute(Sender: TObject);
begin
  with frmVidObmezhen do
  begin
    qVidObmezhen.SQL.Clear;
    qVidObmezhen.SQL.Text:='select * from VIDOBMEZHEN order by KODOBMEZHENNY';
    qVidObmezhen.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmVidObmezhen.aSortByNazvaExecute(Sender: TObject);
begin
  with frmVidObmezhen do
  begin
    qVidObmezhen.SQL.Clear;
    qVidObmezhen.SQL.Text:='select * from VIDOBMEZHEN order by VIDOBMEZHENNY';
    qVidObmezhen.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmVidObmezhen.qVidObmezhenFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if frmMain.PosN(frmVidObmezhen.edtFind.Text,frmVidObmezhen.qVidObmezhen.FieldByName('VIDOBMEZHENNY').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmVidObmezhen.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmVidObmezhen.dsVidObmezhen;
end;

end.
