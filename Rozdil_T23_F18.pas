unit Rozdil_T23_F18;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmRozdil_T23_F18 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    btnUpdate: TButton;
    alRozdilt23f18: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    dsRozdilt23F18: TDataSource;
    qRozdilt23F18: TIBQuery;
    PopupMenu: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N1: TMenuItem;
    N6: TMenuItem;
    qTemp: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmRozdil_T23_F18: TfrmRozdil_T23_F18;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, Rozdil_T23_F18Edit, Filter;

{$R *.dfm}

procedure TfrmRozdil_T23_F18.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  frmRozdil_T23_F18.qRozdilt23F18.Close;
//  if frmMain.IsFormOpen('frmZvyzok') then
//  begin
//    frmZvyzok.Enabled:=true;
//    frmMain.Enabled:=false;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

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

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;
}
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRozdil_T23_F18.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRozdil_T23_F18Edit') then frmRozdil_T23_F18Edit:=TfrmRozdil_T23_F18Edit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmRozdil_T23_F18.Enabled:=false;
  frmRozdil_T23_F18Edit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmRozdil_T23_F18.Enabled:=false;
  frmRozdil_T23_F18Edit.Caption:='Додавання об''єкту нагляду';
  frmRozdil_T23_F18Edit.Position:=poMainFormCenter;
  frmRozdil_T23_F18Edit.BorderStyle:=bsDialog;

  frmRozdil_T23_F18Edit.aKodUpdateExecute(sender);
  frmRozdil_T23_F18Edit.edtKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.btnKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Text:='';
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Enabled:=true;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.SetFocus;
end;

procedure TfrmRozdil_T23_F18.aEditExecute(Sender: TObject);
begin
  if frmRozdil_T23_F18.qRozdilt23F18.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRozdil_T23_F18Edit') then frmRozdil_T23_F18Edit:=TfrmRozdil_T23_F18Edit.Create(self);
  frmMain.Enabled:=false;
  frmRozdil_T23_F18Edit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmRozdil_T23_F18.Enabled:=false;
  frmRozdil_T23_F18Edit.Caption:='Редагування об''єкту нагляду';
  frmRozdil_T23_F18Edit.Position:=poMainFormCenter;
  frmRozdil_T23_F18Edit.BorderStyle:=bsDialog;

  frmRozdil_T23_F18Edit.edtKodStroki.Text:=IntToStr(frmRozdil_T23_F18.qRozdilt23F18.FieldByName('Код').Value);
  frmRozdil_T23_F18Edit.edtKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.btnKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Text:=frmRozdil_T23_F18.qRozdilt23F18.FieldByName('Об''єкт нагляду').Value;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Enabled:=true;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.SetFocus;
end;

procedure TfrmRozdil_T23_F18.aDeleteExecute(Sender: TObject);
begin
  if frmRozdil_T23_F18.qRozdilt23F18.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRozdil_T23_F18Edit') then frmRozdil_T23_F18Edit:=TfrmRozdil_T23_F18Edit.Create(self);
  frmMain.Enabled:=false;
  frmRozdil_T23_F18Edit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmRozdil_T23_F18.Enabled:=false;
  frmRozdil_T23_F18Edit.Caption:='Видалення об''єкту нагляду';
  frmRozdil_T23_F18Edit.Position:=poMainFormCenter;
  frmRozdil_T23_F18Edit.BorderStyle:=bsDialog;

  frmRozdil_T23_F18Edit.edtKodStroki.Text:=IntToStr(frmRozdil_T23_F18.qRozdilt23F18.FieldByName('Код').Value);
  frmRozdil_T23_F18Edit.edtKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.btnKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Text:=frmRozdil_T23_F18.qRozdilt23F18.FieldByName('Об''єкт нагляду').Value;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Enabled:=false;
  frmRozdil_T23_F18Edit.btnVidmina.SetFocus;
end;

procedure TfrmRozdil_T23_F18.aChoiceExecute(Sender: TObject);
begin
  if frmRozdil_T23_F18.qRozdilt23F18.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRozdil_T23_F18Edit') then frmRozdil_T23_F18Edit:=TfrmRozdil_T23_F18Edit.Create(self);
  frmRozdil_T23_F18.Enabled:=false;
  frmRozdil_T23_F18Edit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmRozdil_T23_F18.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmRozdil_T23_F18.Enabled:=false;
  frmRozdil_T23_F18Edit.Caption:='Вибір об''єкту нагляду';
  frmRozdil_T23_F18Edit.Position:=poMainFormCenter;
  frmRozdil_T23_F18Edit.BorderStyle:=bsDialog;

  frmRozdil_T23_F18Edit.edtKodStroki.Text:=IntToStr(frmRozdil_T23_F18.qRozdilt23F18.FieldByName('Код').Value);
  frmRozdil_T23_F18Edit.edtKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.btnKodStroki.Enabled:=false;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Text:=frmRozdil_T23_F18.qRozdilt23F18.FieldByName('Об''єкт нагляду').Value;
  frmRozdil_T23_F18Edit.edtNazvaObjektu.Enabled:=false;
  frmRozdil_T23_F18Edit.btnVikonati.SetFocus;
end;

procedure TfrmRozdil_T23_F18.aCloseExecute(Sender: TObject);
begin
  frmRozdil_T23_F18.Close;
end;

procedure TfrmRozdil_T23_F18.aUpdateExecute(Sender: TObject);
begin
  with frmRozdil_T23_F18 do
  begin
    qRozdilt23F18.SQL.Clear;
//    qRozdilt23F18.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qRozdilt23F18.SQL.Text:='select KODSTROKI as "Код", OBJEKTNAGLYDU as "Об''єкт нагляду" from ROZDILT23F18 where not OBJEKTNAGLYDU is null order by OBJEKTNAGLYDU';
    qRozdilt23F18.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmRozdil_T23_F18.aSortByKodExecute(Sender: TObject);
begin
  with frmRozdil_T23_F18 do
  begin
    qRozdilt23F18.SQL.Clear;
//    qRozdilt23F18.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qRozdilt23F18.SQL.Text:='select KODSTROKI as "Код", OBJEKTNAGLYDU as "Об''єкт нагляду" from ROZDILT23F18 where not OBJEKTNAGLYDU is null order by KODSTROKI';
    qRozdilt23F18.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
{
  with frmRozdil_T23_F18 do
  begin
    qRozdilt23F18.SQL.Clear;
    qRozdilt23F18.SQL.Text:='select * from ROZDILT23F18 order by KODSTROKI';
    qRozdilt23F18.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
}
end;

procedure TfrmRozdil_T23_F18.aSortByNazvaExecute(Sender: TObject);
begin
  frmRozdil_T23_F18.aUpdateExecute(sender);
{
  with frmRozdil_T23_F18 do
  begin
    qRozdilt23F18.SQL.Clear;
    qRozdilt23F18.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qRozdilt23F18.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
}
end;

procedure TfrmRozdil_T23_F18.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmRozdil_T23_F18.dsRozdilt23F18;
end;

end.

