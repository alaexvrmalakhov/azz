unit LaboratorniDoslidzhenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmLaboratorniDoslidzhenny = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    Panel2: TPanel;
    edtFind: TEdit;
    alLaboratorniDoslidzhenny: TActionList;
    btnUpdate: TButton;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aUpdate: TAction;
    aChoice: TAction;
    aClose: TAction;
    aSortByKod: TAction;
    aSortByTip: TAction;
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
    dsLaboratorniDoslidzhenny: TDataSource;
    qLaboratorniDoslidzhenny: TIBQuery;
    aFindChange: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByTipExecute(Sender: TObject);
    procedure aFindChangeExecute(Sender: TObject);
    procedure qLaboratorniDoslidzhennyFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmLaboratorniDoslidzhenny: TfrmLaboratorniDoslidzhenny;

implementation

uses
  Main, LaboratornijKontrol, LaboratorniDoslidzhennyEdit;

{$R *.dfm}

procedure TfrmLaboratorniDoslidzhenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmLaboratornijKontrol') then
  begin
    frmLaboratornijKontrol.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmLaboratorniDoslidzhenny.FormResize(Sender: TObject);
begin
  frmLaboratorniDoslidzhenny.edtFind.Left:=4;
  frmLaboratorniDoslidzhenny.edtFind.Width:=frmLaboratorniDoslidzhenny.Width-16;
end;

procedure TfrmLaboratorniDoslidzhenny.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratorniDoslidzhennyEdit') then frmLaboratorniDoslidzhennyEdit:=TfrmLaboratorniDoslidzhennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Show;
  if frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratorniDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Caption:='Додавання типу досліджень';
  frmLaboratorniDoslidzhennyEdit.Position:=poMainFormCenter;
  frmLaboratorniDoslidzhennyEdit.BorderStyle:=bsDialog;
  frmLaboratorniDoslidzhennyEdit.aKodUpdateExecute(sender);
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.btnKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text:='';
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Enabled:=true;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.SetFocus;
end;

procedure TfrmLaboratorniDoslidzhenny.aEditExecute(Sender: TObject);
begin
  if frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratorniDoslidzhennyEdit') then frmLaboratorniDoslidzhennyEdit:=TfrmLaboratorniDoslidzhennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Show;
  if frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratorniDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Caption:='Редагування типу досліджень';
  frmLaboratorniDoslidzhennyEdit.Position:=poMainFormCenter;
  frmLaboratorniDoslidzhennyEdit.BorderStyle:=bsDialog;
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text:=IntToStr(frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('KODTIPUDOSLIDZHENNY').Value);
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.btnKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text:=frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('TIPDOSLIDZHENNY').Value;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Enabled:=true;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.SetFocus;
end;

procedure TfrmLaboratorniDoslidzhenny.aDeleteExecute(Sender: TObject);
begin
  if frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratorniDoslidzhennyEdit') then frmLaboratorniDoslidzhennyEdit:=TfrmLaboratorniDoslidzhennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Show;
  if frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratorniDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Caption:='Видалення типу досліджень';
  frmLaboratorniDoslidzhennyEdit.Position:=poMainFormCenter;
  frmLaboratorniDoslidzhennyEdit.BorderStyle:=bsDialog;
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text:=IntToStr(frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('KODTIPUDOSLIDZHENNY').Value);
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.btnKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text:=frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('TIPDOSLIDZHENNY').Value;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.btnVidminiti.SetFocus;
end;

procedure TfrmLaboratorniDoslidzhenny.aChoiceExecute(Sender: TObject);
begin
  if frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratorniDoslidzhennyEdit') then frmLaboratorniDoslidzhennyEdit:=TfrmLaboratorniDoslidzhennyEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratorniDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.Show;
  frmLaboratorniDoslidzhennyEdit.Caption:='Вибір типу досліджень';
  frmLaboratorniDoslidzhennyEdit.Position:=poMainFormCenter;
  frmLaboratorniDoslidzhennyEdit.BorderStyle:=bsDialog;
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text:=IntToStr(frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('KODTIPUDOSLIDZHENNY').Value);
  frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.btnKodTipuDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text:=frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('TIPDOSLIDZHENNY').Value;
  frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Enabled:=false;
  frmLaboratorniDoslidzhennyEdit.btnVikonati.SetFocus;
end;

procedure TfrmLaboratorniDoslidzhenny.aUpdateExecute(Sender: TObject);
begin
  with frmLaboratorniDoslidzhenny do
  begin
    qLaboratorniDoslidzhenny.SQL.Clear;
    qLaboratorniDoslidzhenny.SQL.Text:='select * from LABORATORNIDOSLIDZHENNY order by TIPDOSLIDZHENNY';
    qLaboratorniDoslidzhenny.Open;
    aSortByKod.Checked:=false;
    aSortByTip.Checked:=true;
  end;
end;

procedure TfrmLaboratorniDoslidzhenny.aCloseExecute(Sender: TObject);
begin
  frmLaboratorniDoslidzhenny.Close;
end;

procedure TfrmLaboratorniDoslidzhenny.aSortByKodExecute(Sender: TObject);
begin
  with frmLaboratorniDoslidzhenny do
  begin
    qLaboratorniDoslidzhenny.SQL.Clear;
    qLaboratorniDoslidzhenny.SQL.Text:='select * from LABORATORNIDOSLIDZHENNY order by KODTIPUDOSLIDZHENNY';
    qLaboratorniDoslidzhenny.Open;
    aSortByKod.Checked:=true;
    aSortByTip.Checked:=false;
  end;
end;

procedure TfrmLaboratorniDoslidzhenny.aSortByTipExecute(Sender: TObject);
begin
  with frmLaboratorniDoslidzhenny do
  begin
    qLaboratorniDoslidzhenny.SQL.Clear;
    qLaboratorniDoslidzhenny.SQL.Text:='select * from LABORATORNIDOSLIDZHENNY order by TIPDOSLIDZHENNY';
    qLaboratorniDoslidzhenny.Open;
    aSortByKod.Checked:=false;
    aSortByTip.Checked:=true;
  end;
end;

procedure TfrmLaboratorniDoslidzhenny.aFindChangeExecute(Sender: TObject);
begin
  frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Filtered:=false;
  if frmLaboratorniDoslidzhenny.edtFind.Text<>'' then frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Filtered:=true else frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Filtered:=false;
end;

procedure TfrmLaboratorniDoslidzhenny.qLaboratorniDoslidzhennyFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  if frmMain.PosN(frmLaboratorniDoslidzhenny.edtFind.Text,frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.FieldByName('TIPDOSLIDZHENNY').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmLaboratorniDoslidzhenny.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmLaboratorniDoslidzhenny.dsLaboratorniDoslidzhenny;
end;

end.
