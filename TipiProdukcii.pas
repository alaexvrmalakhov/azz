unit TipiProdukcii;

interface

uses
  Forms, Menus, Classes, ActnList, DB, IBCustomDataSet, IBQuery, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmTipiProdukcii = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    rgTipProdukcii: TRadioGroup;
    Panel2: TPanel;
    edtFind: TEdit;
    dsTipiProdukcii: TDataSource;
    qTipiProdukcii: TIBQuery;
    alTipiProdukcii: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    btnUpdate: TButton;
    aTipProdukciiChoice: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtFindChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aTipProdukciiChoiceExecute(Sender: TObject);
    procedure qTipiProdukciiFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmTipiProdukcii: TfrmTipiProdukcii;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, TipiProdukciiEdit,
  Filter;

{$R *.dfm}

procedure TfrmTipiProdukcii.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmTipiProdukcii.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
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

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmTipiProdukcii.edtFindChange(Sender: TObject);
begin
  frmTipiProdukcii.qTipiProdukcii.Filtered:=false;
  if frmTipiProdukcii.edtFind.Text<>'' then frmTipiProdukcii.qTipiProdukcii.Filtered:=true else frmTipiProdukcii.qTipiProdukcii.Filtered:=false;
end;

procedure TfrmTipiProdukcii.FormResize(Sender: TObject);
begin
  frmTipiProdukcii.edtFind.Left:=4;
  frmTipiProdukcii.edtFind.Width:=frmTipiProdukcii.Width-16;
end;

procedure TfrmTipiProdukcii.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTipiProdukciiEdit') then frmTipiProdukciiEdit:=TfrmTipiProdukciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiProdukciiEdit.BorderStyle:=bsDialog;
  frmTipiProdukciiEdit.Position:=poMainFormCenter;
  frmTipiProdukciiEdit.Caption:='Додавання продукції';
  frmTipiProdukciiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiProdukcii.Enabled:=false;
  frmTipiProdukciiEdit.edtKod.Text:='';
  frmTipiProdukciiEdit.edtKod.Enabled:=false;
  frmTipiProdukciiEdit.btnKod.Enabled:=false;
  frmTipiProdukciiEdit.aKodUpdateExecute(sender);
  frmTipiProdukciiEdit.edtTipProdukcii.Text:='';
  frmTipiProdukciiEdit.edtTipProdukcii.Enabled:=true;
  frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=-1;
  frmTipiProdukciiEdit.rgGrupaTovariv.Enabled:=true;
  frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
end;

procedure TfrmTipiProdukcii.aEditExecute(Sender: TObject);
begin
  if frmTipiProdukcii.qTipiProdukcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTipiProdukciiEdit') then frmTipiProdukciiEdit:=TfrmTipiProdukciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiProdukciiEdit.BorderStyle:=bsDialog;
  frmTipiProdukciiEdit.Position:=poMainFormCenter;
  frmTipiProdukciiEdit.Caption:='Редагування продукції';
  frmTipiProdukciiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiProdukcii.Enabled:=false;
  frmTipiProdukciiEdit.edtKod.Text:='';
  frmTipiProdukciiEdit.edtKod.Enabled:=false;
  frmTipiProdukciiEdit.btnKod.Enabled:=false;
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('KOD').IsNull then frmTipiProdukciiEdit.edtKod.Text:=IntToStr(frmTipiProdukcii.qTipiProdukcii.FieldByName('KOD').Value) else frmTipiProdukciiEdit.aKodUpdateExecute(sender);
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').IsNull then frmTipiProdukciiEdit.edtTipProdukcii.Text:=frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').Value else frmTipiProdukciiEdit.edtTipProdukcii.Text:='';
  frmTipiProdukciiEdit.edtTipProdukcii.Enabled:=true;
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('GRUPATOVARIV').IsNull then frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=frmTipiProdukcii.qTipiProdukcii.FieldByName('GRUPATOVARIV').Value else frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=-1;
  frmTipiProdukciiEdit.rgGrupaTovariv.Enabled:=true;
  frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
end;

procedure TfrmTipiProdukcii.aDeleteExecute(Sender: TObject);
begin
  if frmTipiProdukcii.qTipiProdukcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTipiProdukciiEdit') then frmTipiProdukciiEdit:=TfrmTipiProdukciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiProdukciiEdit.BorderStyle:=bsDialog;
  frmTipiProdukciiEdit.Position:=poMainFormCenter;
  frmTipiProdukciiEdit.Caption:='Видалення продукції';
  frmTipiProdukciiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiProdukcii.Enabled:=false;
  frmTipiProdukciiEdit.edtKod.Text:='';
  frmTipiProdukciiEdit.edtKod.Enabled:=false;
  frmTipiProdukciiEdit.btnKod.Enabled:=false;
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('KOD').IsNull then frmTipiProdukciiEdit.edtKod.Text:=IntToStr(frmTipiProdukcii.qTipiProdukcii.FieldByName('KOD').Value) else frmTipiProdukciiEdit.aKodUpdateExecute(sender);
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').IsNull then frmTipiProdukciiEdit.edtTipProdukcii.Text:=frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').Value else frmTipiProdukciiEdit.edtTipProdukcii.Text:='';
  frmTipiProdukciiEdit.edtTipProdukcii.Enabled:=false;
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('GRUPATOVARIV').IsNull then frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=frmTipiProdukcii.qTipiProdukcii.FieldByName('GRUPATOVARIV').Value else frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=-1;
  frmTipiProdukciiEdit.rgGrupaTovariv.Enabled:=false;
  frmTipiProdukciiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmTipiProdukcii.aChoiceExecute(Sender: TObject);
begin
  if frmTipiProdukcii.qTipiProdukcii.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmTipiProdukciiEdit') then frmTipiProdukciiEdit:=TfrmTipiProdukciiEdit.Create(self);
  frmMain.Enabled:=false;
  frmTipiProdukciiEdit.BorderStyle:=bsDialog;
  frmTipiProdukciiEdit.Position:=poMainFormCenter;
  frmTipiProdukciiEdit.Caption:='Вибір продукції';
  frmTipiProdukciiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmTipiProdukcii.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmTipiProdukcii.Enabled:=false;
  frmTipiProdukciiEdit.edtKod.Text:='';
  frmTipiProdukciiEdit.edtKod.Enabled:=false;
  frmTipiProdukciiEdit.btnKod.Enabled:=false;
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('KOD').IsNull then frmTipiProdukciiEdit.edtKod.Text:=IntToStr(frmTipiProdukcii.qTipiProdukcii.FieldByName('KOD').Value) else frmTipiProdukciiEdit.aKodUpdateExecute(sender);
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').IsNull then frmTipiProdukciiEdit.edtTipProdukcii.Text:=frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').Value else frmTipiProdukciiEdit.edtTipProdukcii.Text:='';
  frmTipiProdukciiEdit.edtTipProdukcii.Enabled:=false;
  if not frmTipiProdukcii.qTipiProdukcii.FieldByName('GRUPATOVARIV').IsNull then frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=frmTipiProdukcii.qTipiProdukcii.FieldByName('GRUPATOVARIV').Value else frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=-1;
  frmTipiProdukciiEdit.rgGrupaTovariv.Enabled:=false;
  frmTipiProdukciiEdit.btnVikonati.SetFocus;
end;

procedure TfrmTipiProdukcii.aUpdateExecute(Sender: TObject);
begin
  with frmTipiProdukcii do
  begin
    qTipiProdukcii.SQL.Clear;
    case rgTipProdukcii.ItemIndex of
      0: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII order by KOD';
      1: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII where GRUPATOVARIV=0 order by KOD';
      2: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII where GRUPATOVARIV=1 order by KOD';
    end;
    qTipiProdukcii.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmTipiProdukcii.aCloseExecute(Sender: TObject);
begin
  frmTipiProdukcii.Close;
end;

procedure TfrmTipiProdukcii.aSortByKodExecute(Sender: TObject);
begin
  with frmTipiProdukcii do
  begin
    qTipiProdukcii.SQL.Clear;
    case rgTipProdukcii.ItemIndex of
      0: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII order by KOD';
      1: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII where GRUPATOVARIV=0 order by KOD';
      2: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII where GRUPATOVARIV=1 order by KOD';
    end;
    qTipiProdukcii.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmTipiProdukcii.aSortByNazvaExecute(Sender: TObject);
begin
  with frmTipiProdukcii do
  begin
    qTipiProdukcii.SQL.Clear;
    case rgTipProdukcii.ItemIndex of
      0: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
      1: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII where GRUPATOVARIV=0 order by TIPPRODUKCII';
      2: qTipiProdukcii.SQL.Text:='select * from TIPIPRODUKCII where GRUPATOVARIV=1 order by TIPPRODUKCII';
    end;
    qTipiProdukcii.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmTipiProdukcii.aTipProdukciiChoiceExecute(Sender: TObject);
begin
  frmTipiProdukcii.aUpdateExecute(sender);
end;

procedure TfrmTipiProdukcii.qTipiProdukciiFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if frmMain.PosN(frmTipiProdukcii.edtFind.Text,frmTipiProdukcii.qTipiProdukcii.FieldByName('TIPPRODUKCII').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmTipiProdukcii.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmTipiProdukcii.dsTipiProdukcii;
end;

end.
