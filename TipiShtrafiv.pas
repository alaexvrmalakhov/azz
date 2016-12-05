unit TipiShtrafiv;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Menus, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmTipiShtrafiv = class(TForm)
    PopupMenu: TPopupMenu;
    mnDodati: TMenuItem;
    mnZminiti: TMenuItem;
    mnVidaliti: TMenuItem;
    mnVibrati: TMenuItem;
    N1: TMenuItem;
    mnVihid: TMenuItem;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    N2: TMenuItem;
    N3: TMenuItem;
    mnZaKodom: TMenuItem;
    mnZaTipom: TMenuItem;
    Panel2: TPanel;
    edtFind: TEdit;
    alTipiShtrafiv: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    btnUpdate: TButton;
    mnUpdate: TMenuItem;
    aSortByKod: TAction;
    aSortByTip: TAction;
    dsTipiShtrafiv: TDataSource;
    qTipiShtrafiv: TIBQuery;
    aFindChange: TAction;
    qTemp: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByTipExecute(Sender: TObject);
    procedure aFindChangeExecute(Sender: TObject);
    procedure qTipiShtrafivFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmTipiShtrafiv: TfrmTipiShtrafiv;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, TipiShtrafivEdit, Filter;

{$R *.dfm}

procedure TfrmTipiShtrafiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
    frmTipiShtrafiv.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmTipiShtrafiv.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmTipiShtrafiv.Enabled:=true;
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

procedure TfrmTipiShtrafiv.FormResize(Sender: TObject);
begin
  frmTipiShtrafiv.edtFind.Left:=4;
  frmTipiShtrafiv.edtFind.Width:=frmTipiShtrafiv.Width-24;
end;

procedure TfrmTipiShtrafiv.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTipiShtrafivEdit') then frmTipiShtrafivEdit:=TfrmTipiShtrafivEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiShtrafivEdit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmTipiShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.Caption:='Додавання типу штрафів';
  frmTipiShtrafivEdit.BorderStyle:=bsDialog;
  frmTipiShtrafivEdit.Position:=poMainFormCenter;

  frmTipiShtrafivEdit.aKodUpdateExecute(sender);
  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.btnKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.edtTipShtrafu.Text:='';
  frmTipiShtrafivEdit.edtTipShtrafu.Enabled:=true;
  frmTipiShtrafivEdit.edtTipShtrafu.SetFocus;
end;

procedure TfrmTipiShtrafiv.aEditExecute(Sender: TObject);
begin
  if frmTipiShtrafiv.qTipiShtrafiv.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTipiShtrafivEdit') then frmTipiShtrafivEdit:=TfrmTipiShtrafivEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiShtrafivEdit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmTipiShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.Caption:='Редагування типу штрафів';
  frmTipiShtrafivEdit.BorderStyle:=bsDialog;
  frmTipiShtrafivEdit.Position:=poMainFormCenter;

  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text:=IntToStr(frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Код').Value);
  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.btnKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.edtTipShtrafu.Text:=frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Тип штрафів').Value;
  frmTipiShtrafivEdit.edtTipShtrafu.Enabled:=true;
  frmTipiShtrafivEdit.edtTipShtrafu.SetFocus;
end;

procedure TfrmTipiShtrafiv.aDeleteExecute(Sender: TObject);
begin
  if frmTipiShtrafiv.qTipiShtrafiv.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTipiShtrafivEdit') then frmTipiShtrafivEdit:=TfrmTipiShtrafivEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiShtrafivEdit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmTipiShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.Caption:='Видалення типу штрафів';
  frmTipiShtrafivEdit.BorderStyle:=bsDialog;
  frmTipiShtrafivEdit.Position:=poMainFormCenter;

  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text:=IntToStr(frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Код').Value);
  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.btnKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.edtTipShtrafu.Text:=frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Тип штрафів').Value;
  frmTipiShtrafivEdit.edtTipShtrafu.Enabled:=false;
  frmTipiShtrafivEdit.btnVidmina.SetFocus;
end;

procedure TfrmTipiShtrafiv.aChoiceExecute(Sender: TObject);
begin
  if frmTipiShtrafiv.qTipiShtrafiv.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTipiShtrafivEdit') then frmTipiShtrafivEdit:=TfrmTipiShtrafivEdit.Create(self);
  frmTipiShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.Show;
//  if frmMain.IsFormOpen('frmFilter') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmTipiShtrafiv.Enabled:=false;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmTipiShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.Caption:='Вибір типу штрафів';
  frmTipiShtrafivEdit.BorderStyle:=bsDialog;
  frmTipiShtrafivEdit.Position:=poMainFormCenter;

  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text:=IntToStr(frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Код').Value);
  frmTipiShtrafivEdit.edtKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.btnKodTipuShtrafiv.Enabled:=false;
  frmTipiShtrafivEdit.edtTipShtrafu.Text:=frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Тип штрафів').Value;
  frmTipiShtrafivEdit.edtTipShtrafu.Enabled:=false;
  frmTipiShtrafivEdit.btnVikonati.SetFocus;
end;

procedure TfrmTipiShtrafiv.aCloseExecute(Sender: TObject);
begin
  frmTipiShtrafiv.Close;
end;

procedure TfrmTipiShtrafiv.aUpdateExecute(Sender: TObject);
begin
  with frmTipiShtrafiv do
  begin
    qTipiShtrafiv.SQL.Clear;
//    qTipiShtrafiv.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qTipiShtrafiv.SQL.Text:='select KODTIPUSHTRAFIV as "Код", TIPSHTRAFU as "Тип штрафів" from TIPISHTRAFIV where not TIPSHTRAFU is null order by TIPSHTRAFU';
    qTipiShtrafiv.Open;
    aSortByKod.Checked:=false;
    aSortByTip.Checked:=true;
  end;
end;

procedure TfrmTipiShtrafiv.aSortByKodExecute(Sender: TObject);
begin
  with frmTipiShtrafiv do
  begin
    qTipiShtrafiv.SQL.Clear;
//    qTipiShtrafiv.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qTipiShtrafiv.SQL.Text:='select KODTIPUSHTRAFIV as "Код", TIPSHTRAFU as "Тип штрафів" from TIPISHTRAFIV where not TIPSHTRAFU is null order by KODTIPUSHTRAFIV';
    qTipiShtrafiv.Open;
    aSortByKod.Checked:=true;
    aSortByTip.Checked:=false;
  end;
end;

procedure TfrmTipiShtrafiv.aSortByTipExecute(Sender: TObject);
begin
  frmTipiShtrafiv.aUpdateExecute(sender);
{
  with frmTipiShtrafiv do
  begin
    qTipiShtrafiv.SQL.Clear;
    qTipiShtrafiv.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qTipiShtrafiv.Open;
    aSortByKod.Checked:=false;
    aSortByTip.Checked:=true;
  end;
}
end;

procedure TfrmTipiShtrafiv.aFindChangeExecute(Sender: TObject);
begin
  frmTipiShtrafiv.qTipiShtrafiv.Filtered:=false;
  if frmTipiShtrafiv.edtFind.Text<>'' then frmTipiShtrafiv.qTipiShtrafiv.Filtered:=true else frmTipiShtrafiv.qTipiShtrafiv.Filtered:=false;
end;

procedure TfrmTipiShtrafiv.qTipiShtrafivFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if frmMain.PosN(frmTipiShtrafiv.edtFind.Text,frmTipiShtrafiv.qTipiShtrafiv.FieldByName('Тип штрафів').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmTipiShtrafiv.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmTipiShtrafiv.dsTipiShtrafiv;
end;

end.
