unit VidomchaPidporydkovanist;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  Grids, DBGrids, Controls, ExtCtrls, SysUtils;

type
  TfrmVidomchaPidporydkovanist = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    edtFind: TEdit;
    alVidomchaPidporydkovanist: TActionList;
    btnUpdate: TButton;
    PopupMenu: TPopupMenu;
    dsVidomchaPidporydkovanist: TDataSource;
    qVidomchaPidporydkovanist: TIBQuery;
    aUpdate: TAction;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aClose: TAction;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    mnClose: TMenuItem;
    N9: TMenuItem;
    aFindChange: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    aSortByKod: TAction;
    aSortByVidomstrvo: TAction;
    mnSortByKod: TMenuItem;
    mnSortByVidomstrvo: TMenuItem;
    qUpdate: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aFindChangeExecute(Sender: TObject);
    procedure qVidomchaPidporydkovanistFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure aSortByVidomstrvoExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmVidomchaPidporydkovanist: TfrmVidomchaPidporydkovanist;

implementation

uses
  Main, ShtrafiEdit, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ObjektiEdit, VidomchaPidporydkovanistEdit;

{$R *.dfm}

procedure TfrmVidomchaPidporydkovanist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Close;
  frmVidomchaPidporydkovanist.FormStyle:=fsMDIChild;
  frmVidomchaPidporydkovanist.BorderStyle:=bsSizeable;

{
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
    frmMain.Enabled:=False;
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
  if frmMain.IsFormOpen('frmObjektiEdit') then
  begin
    frmObjektiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidomchaPidporydkovanist.FormResize(Sender: TObject);
begin
  frmVidomchaPidporydkovanist.edtFind.Left:=4;
  frmVidomchaPidporydkovanist.edtFind.Width:=frmVidomchaPidporydkovanist.Width-16;
end;

procedure TfrmVidomchaPidporydkovanist.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidomchaPidporydkovanistEdit') then frmVidomchaPidporydkovanistEdit:=TfrmVidomchaPidporydkovanistEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.Show;
  frmVidomchaPidporydkovanistEdit.Caption:='Додавання відомства';
  frmVidomchaPidporydkovanistEdit.BorderStyle:=bsDialog;
  frmVidomchaPidporydkovanistEdit.Position:=poMainFormCenter;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
  if frmMain.IsFormOpen('frmObjektiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;

  frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.btnKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text:='';
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Enabled:=true;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
end;

procedure TfrmVidomchaPidporydkovanist.aEditExecute(Sender: TObject);
begin
  if frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomchaPidporydkovanistEdit') then frmVidomchaPidporydkovanistEdit:=TfrmVidomchaPidporydkovanistEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.Show;
  frmVidomchaPidporydkovanistEdit.Caption:='Редагування відомства';
  frmVidomchaPidporydkovanistEdit.BorderStyle:=bsDialog;
  frmVidomchaPidporydkovanistEdit.Position:=poMainFormCenter;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
  if frmMain.IsFormOpen('frmObjektiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;

  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text:=IntToStr(frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Код').Value);
  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.btnKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text:=frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Відомство').Value;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Enabled:=true;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
end;

procedure TfrmVidomchaPidporydkovanist.aDeleteExecute(Sender: TObject);
begin
  if frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomchaPidporydkovanistEdit') then frmVidomchaPidporydkovanistEdit:=TfrmVidomchaPidporydkovanistEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.Show;
  frmVidomchaPidporydkovanistEdit.Caption:='Видалення відомства';
  frmVidomchaPidporydkovanistEdit.BorderStyle:=bsDialog;
  frmVidomchaPidporydkovanistEdit.Position:=poMainFormCenter;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
  if frmMain.IsFormOpen('frmObjektiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;

  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text:=IntToStr(frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Код').Value);
  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.btnKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text:=frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Відомство').Value;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.btnVidminiti.SetFocus;
end;

procedure TfrmVidomchaPidporydkovanist.aChoiceExecute(Sender: TObject);
begin
  if frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomchaPidporydkovanistEdit') then frmVidomchaPidporydkovanistEdit:=TfrmVidomchaPidporydkovanistEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.Show;
  frmVidomchaPidporydkovanistEdit.Caption:='Вибір відомства';
  frmVidomchaPidporydkovanistEdit.BorderStyle:=bsDialog;
  frmVidomchaPidporydkovanistEdit.Position:=poMainFormCenter;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
  if frmMain.IsFormOpen('frmObjektiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVidomchaPidporydkovanist.Enabled:=false;

  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text:=IntToStr(frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Код').Value);
  frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.btnKodVidomstva.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text:=frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Відомство').Value;
  frmVidomchaPidporydkovanistEdit.edtVidomstvo.Enabled:=false;
  frmVidomchaPidporydkovanistEdit.btnVikonati.SetFocus;
end;

procedure TfrmVidomchaPidporydkovanist.aCloseExecute(Sender: TObject);
begin
  frmVidomchaPidporydkovanist.Close;
end;

procedure TfrmVidomchaPidporydkovanist.aUpdateExecute(Sender: TObject);
begin
  with frmVidomchaPidporydkovanist do
  begin
    qVidomchaPidporydkovanist.SQL.Clear;
    qVidomchaPidporydkovanist.SQL.Text:='select KODVIDOMSTVA as "Код", VIDOMSTVO as "Відомство" from VIDOMCHAPIDPORYDKOVANIST where not VIDOMSTVO is null order by VIDOMSTVO';
    qVidomchaPidporydkovanist.Open;
    aSortByKod.Checked:=false;
    aSortByVidomstrvo.Checked:=true;
    edtFind.Text:='';
  end;
end;

procedure TfrmVidomchaPidporydkovanist.aFindChangeExecute(Sender: TObject);
begin
  frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Filtered:=false;
  if frmVidomchaPidporydkovanist.edtFind.Text<>'' then frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Filtered:=true else frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Filtered:=false;
end;

procedure TfrmVidomchaPidporydkovanist.qVidomchaPidporydkovanistFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if frmVidomchaPidporydkovanist.ActiveControl=frmVidomchaPidporydkovanist.edtFind then
    if frmMain.PosN(frmVidomchaPidporydkovanist.edtFind.Text,frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.FieldByName('Відомство').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmVidomchaPidporydkovanist.aSortByVidomstrvoExecute(
  Sender: TObject);
begin
  frmVidomchaPidporydkovanist.aUpdateExecute(sender);
end;

procedure TfrmVidomchaPidporydkovanist.aSortByKodExecute(Sender: TObject);
begin
  with frmVidomchaPidporydkovanist do
  begin
    qVidomchaPidporydkovanist.SQL.Clear;
    qVidomchaPidporydkovanist.SQL.Text:='select KODVIDOMSTVA as "Код", VIDOMSTVO as "Відомство" from VIDOMCHAPIDPORYDKOVANIST where not VIDOMSTVO is null order by KODVIDOMSTVA';
    qVidomchaPidporydkovanist.Open;
    aSortByKod.Checked:=true;
    aSortByVidomstrvo.Checked:=false;
    edtFind.Text:='';
  end;
end;

procedure TfrmVidomchaPidporydkovanist.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmVidomchaPidporydkovanist.dsVidomchaPidporydkovanist;
end;

end.
