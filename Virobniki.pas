unit Virobniki;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, SysUtils;

type
  TfrmVirobniki = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    Panel2: TPanel;
    edtFind: TEdit;
    alVirobniki: TActionList;
    dsVirobniki: TDataSource;
    qVirobniki: TIBQuery;
    btnUpdate: TButton;
    PopupMenu: TPopupMenu;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    DBGrid1: TDBGrid;
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
    procedure qVirobnikiFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmVirobniki: TfrmVirobniki;

implementation

uses
  Main, VidomostiProViluchenny, VidomostiProFinansovu, VirobnikiEdit;

{$R *.dfm}

procedure TfrmVirobniki.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmVidomostiProFinansovu') then
  begin
    frmVidomostiProFinansovu.Enabled:=true;
    frmVirobniki.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmVidomostiProViluchenny') then
  begin
    frmVidomostiProViluchenny.Enabled:=true;
    frmVirobniki.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVirobniki.FormResize(Sender: TObject);
begin
  frmVirobniki.edtFind.Left:=4;
  frmVirobniki.edtFind.Width:=frmVirobniki.Width-16;
end;

procedure TfrmVirobniki.edtFindChange(Sender: TObject);
begin
  frmVirobniki.qVirobniki.Filtered:=false;
  if frmVirobniki.edtFind.Text<>'' then frmVirobniki.qVirobniki.Filtered:=true else frmVirobniki.qVirobniki.Filtered:=false;
end;

procedure TfrmVirobniki.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVirobnikiEdit') then frmVirobnikiEdit:=TfrmVirobnikiEdit.Create(self);
  frmMain.Enabled:=false;
  frmVirobnikiEdit.Show;
  if frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVirobniki.Enabled:=false;
  if frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVirobniki.Enabled:=false;
  frmVirobnikiEdit.BorderStyle:=bsDialog;
  frmVirobnikiEdit.Position:=poMainFormCenter;
  frmVirobnikiEdit.Caption:='Додавання виробника';
  frmVirobnikiEdit.edtKod.Enabled:=false;
  frmVirobnikiEdit.btnKod.Enabled:=false;
  frmVirobnikiEdit.aKodUpdateExecute(sender);
  frmVirobnikiEdit.edtVirobnik.Text:='';
  frmVirobnikiEdit.edtVirobnik.Enabled:=true;
  frmVirobnikiEdit.edtVirobnik.SetFocus;
end;

procedure TfrmVirobniki.aEditExecute(Sender: TObject);
begin
  if frmVirobniki.qVirobniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVirobnikiEdit') then frmVirobnikiEdit:=TfrmVirobnikiEdit.Create(self);
  frmMain.Enabled:=false;
  frmVirobnikiEdit.Show;
  if frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVirobniki.Enabled:=false;
  if frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVirobniki.Enabled:=false;
  frmVirobnikiEdit.BorderStyle:=bsDialog;
  frmVirobnikiEdit.Position:=poMainFormCenter;
  frmVirobnikiEdit.Caption:='Редагування виробника';
  frmVirobnikiEdit.edtKod.Enabled:=false;
  frmVirobnikiEdit.btnKod.Enabled:=false;
  if not frmVirobniki.qVirobniki.FieldByName('KOD_VIROBNIKA').IsNull then frmVirobnikiEdit.edtKod.Text:=IntToStr(frmVirobniki.qVirobniki.FieldByName('KOD_VIROBNIKA').Value) else frmVirobnikiEdit.aKodUpdateExecute(sender);
  if not frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').IsNull then frmVirobnikiEdit.edtVirobnik.Text:=frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').Value else frmVirobnikiEdit.edtVirobnik.Text:='';
  frmVirobnikiEdit.edtVirobnik.Enabled:=true;
  frmVirobnikiEdit.edtVirobnik.SetFocus;
end;

procedure TfrmVirobniki.aDeleteExecute(Sender: TObject);
begin
  if frmVirobniki.qVirobniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVirobnikiEdit') then frmVirobnikiEdit:=TfrmVirobnikiEdit.Create(self);
  frmMain.Enabled:=false;
  frmVirobnikiEdit.Show;
  if frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVirobniki.Enabled:=false;
  if frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVirobniki.Enabled:=false;
  frmVirobnikiEdit.BorderStyle:=bsDialog;
  frmVirobnikiEdit.Position:=poMainFormCenter;
  frmVirobnikiEdit.Caption:='Видалення виробника';
  frmVirobnikiEdit.edtKod.Enabled:=false;
  frmVirobnikiEdit.btnKod.Enabled:=false;
  if not frmVirobniki.qVirobniki.FieldByName('KOD_VIROBNIKA').IsNull then frmVirobnikiEdit.edtKod.Text:=IntToStr(frmVirobniki.qVirobniki.FieldByName('KOD_VIROBNIKA').Value) else frmVirobnikiEdit.aKodUpdateExecute(sender);
  if not frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').IsNull then frmVirobnikiEdit.edtVirobnik.Text:=frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').Value else frmVirobnikiEdit.edtVirobnik.Text:='';
  frmVirobnikiEdit.edtVirobnik.Enabled:=false;
  frmVirobnikiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmVirobniki.aChoiceExecute(Sender: TObject);
begin
  if frmVirobniki.qVirobniki.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVirobnikiEdit') then frmVirobnikiEdit:=TfrmVirobnikiEdit.Create(self);
  if frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVirobniki.Enabled:=false;
  if frmMain.IsFormOpen('frmVidomostiProFinansovu') then frmVirobniki.Enabled:=false;
  frmMain.Enabled:=false;
  frmVirobnikiEdit.Show;
  frmVirobnikiEdit.BorderStyle:=bsDialog;
  frmVirobnikiEdit.Position:=poMainFormCenter;
  frmVirobnikiEdit.Caption:='Вибір виробника';
  frmVirobnikiEdit.edtKod.Enabled:=false;
  frmVirobnikiEdit.btnKod.Enabled:=false;
  if not frmVirobniki.qVirobniki.FieldByName('KOD_VIROBNIKA').IsNull then frmVirobnikiEdit.edtKod.Text:=IntToStr(frmVirobniki.qVirobniki.FieldByName('KOD_VIROBNIKA').Value) else frmVirobnikiEdit.aKodUpdateExecute(sender);
  if not frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').IsNull then frmVirobnikiEdit.edtVirobnik.Text:=frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').Value else frmVirobnikiEdit.edtVirobnik.Text:='';
  frmVirobnikiEdit.edtVirobnik.Enabled:=false;
  frmVirobnikiEdit.btnVikonati.SetFocus;
end;

procedure TfrmVirobniki.aUpdateExecute(Sender: TObject);
begin
  with frmVirobniki do
  begin
    qVirobniki.SQL.Clear;
    qVirobniki.SQL.Text:='select * from VIROBNIKI order by KOD_VIROBNIKA';
    qVirobniki.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmVirobniki.aCloseExecute(Sender: TObject);
begin
  frmVirobniki.Close;
end;

procedure TfrmVirobniki.aSortByKodExecute(Sender: TObject);
begin
  with frmVirobniki do
  begin
    qVirobniki.SQL.Clear;
    qVirobniki.SQL.Text:='select * from VIROBNIKI order by KOD_VIROBNIKA';
    qVirobniki.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmVirobniki.aSortByNazvaExecute(Sender: TObject);
begin
  with frmVirobniki do
  begin
    qVirobniki.SQL.Clear;
    qVirobniki.SQL.Text:='select * from VIROBNIKI order by NAZVA_VIROBNIKA';
    qVirobniki.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmVirobniki.qVirobnikiFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if frmVirobniki.ActiveControl=frmVirobniki.edtFind then
    if frmMain.PosN(frmVirobniki.edtFind.Text,frmVirobniki.qVirobniki.FieldByName('NAZVA_VIROBNIKA').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmVirobniki.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmVirobniki.dsVirobniki;
end;

end.
