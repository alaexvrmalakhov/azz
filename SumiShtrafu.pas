unit SumiShtrafu;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmSumiShtrafu = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    alSumiShtrafu: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    btnUpdate: TButton;
    PopupMenu: TPopupMenu;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    mnClose: TMenuItem;
    N10: TMenuItem;
    dsSumaShtrafu: TDataSource;
    qSumaShtrafu: TIBQuery;
    qTemp: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmSumiShtrafu: TfrmSumiShtrafu;

implementation

uses
  Main, ShtrafiEdit, SumiShtrafuEdit;

{$R *.dfm}

procedure TfrmSumiShtrafu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmSumiShtrafu.qSumaShtrafu.Close;
{
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

procedure TfrmSumiShtrafu.aCloseExecute(Sender: TObject);
begin
  frmSumiShtrafu.Close;
end;

procedure TfrmSumiShtrafu.aChoiceExecute(Sender: TObject);
begin
  if frmSumiShtrafu.qSumaShtrafu.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSumiShtrafuEdit') then frmSumiShtrafuEdit:=TfrmSumiShtrafuEdit.Create(self);
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSumiShtrafu.Enabled:=false;
  frmMain.Enabled:=false;
  frmSumiShtrafuEdit.Show;
  frmSumiShtrafuEdit.Caption:='Вибір суми штрафу';
  frmSumiShtrafuEdit.Position:=poMainFormCenter;
  frmSumiShtrafuEdit.BorderStyle:=bsDialog;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Код').IsNull then frmSumiShtrafuEdit.edtKod.Text:=IntToStr(frmSumiShtrafu.qSumaShtrafu.FieldByName('Код').Value) else frmSumiShtrafuEdit.edtKod.Text:='';
  frmSumiShtrafuEdit.edtKod.Enabled:=false;
  frmSumiShtrafuEdit.btnKod.Enabled:=false;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Сума').IsNull then frmSumiShtrafuEdit.edtCumaShtrafu.Text:=FloatToStr(frmSumiShtrafu.qSumaShtrafu.FieldByName('Сума').Value) else frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
  frmSumiShtrafuEdit.edtCumaShtrafu.Enabled:=false;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Прописом').IsNull then frmSumiShtrafuEdit.edtSumaPropisom.Text:=frmSumiShtrafu.qSumaShtrafu.FieldByName('Прописом').Value else frmSumiShtrafuEdit.aConvertExecute(sender);
  frmSumiShtrafuEdit.edtSumaPropisom.Enabled:=false;
  frmSumiShtrafuEdit.btnPerevesti.Enabled:=false;
  frmSumiShtrafuEdit.btnVikonati.SetFocus;
end;

procedure TfrmSumiShtrafu.aDeleteExecute(Sender: TObject);
begin
  if frmSumiShtrafu.qSumaShtrafu.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSumiShtrafuEdit') then frmSumiShtrafuEdit:=TfrmSumiShtrafuEdit.Create(self);
  frmMain.Enabled:=false;
  frmSumiShtrafuEdit.Show;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSumiShtrafu.Enabled:=false;
  frmSumiShtrafuEdit.Caption:='Видалення суми штрафу';
  frmSumiShtrafuEdit.Position:=poMainFormCenter;
  frmSumiShtrafuEdit.BorderStyle:=bsDialog;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Код').IsNull then frmSumiShtrafuEdit.edtKod.Text:=IntToStr(frmSumiShtrafu.qSumaShtrafu.FieldByName('Код').Value) else frmSumiShtrafuEdit.edtKod.Text:='';
  frmSumiShtrafuEdit.edtKod.Enabled:=false;
  frmSumiShtrafuEdit.btnKod.Enabled:=false;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Сума').IsNull then frmSumiShtrafuEdit.edtCumaShtrafu.Text:=FloatToStr(frmSumiShtrafu.qSumaShtrafu.FieldByName('Сума').Value) else frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
  frmSumiShtrafuEdit.edtCumaShtrafu.Enabled:=false;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Прописом').IsNull then frmSumiShtrafuEdit.edtSumaPropisom.Text:=frmSumiShtrafu.qSumaShtrafu.FieldByName('Прописом').Value else frmSumiShtrafuEdit.aConvertExecute(sender);
  frmSumiShtrafuEdit.edtSumaPropisom.Enabled:=false;
  frmSumiShtrafuEdit.btnPerevesti.Enabled:=false;
  frmSumiShtrafuEdit.btnVidminiti.SetFocus;
end;

procedure TfrmSumiShtrafu.aEditExecute(Sender: TObject);
begin
  if frmSumiShtrafu.qSumaShtrafu.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmSumiShtrafuEdit') then frmSumiShtrafuEdit:=TfrmSumiShtrafuEdit.Create(self);
  frmMain.Enabled:=false;
  frmSumiShtrafuEdit.Show;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSumiShtrafu.Enabled:=false;
  frmSumiShtrafuEdit.Caption:='Редагування суми штрафу';
  frmSumiShtrafuEdit.Position:=poMainFormCenter;
  frmSumiShtrafuEdit.BorderStyle:=bsDialog;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Код').IsNull then frmSumiShtrafuEdit.edtKod.Text:=IntToStr(frmSumiShtrafu.qSumaShtrafu.FieldByName('Код').Value) else frmSumiShtrafuEdit.edtKod.Text:='';
  frmSumiShtrafuEdit.edtKod.Enabled:=false;
  frmSumiShtrafuEdit.btnKod.Enabled:=false;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Сума').IsNull then frmSumiShtrafuEdit.edtCumaShtrafu.Text:=FloatToStr(frmSumiShtrafu.qSumaShtrafu.FieldByName('Сума').Value) else frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
  frmSumiShtrafuEdit.edtCumaShtrafu.Enabled:=true;
  if not frmSumiShtrafu.qSumaShtrafu.FieldByName('Прописом').IsNull then frmSumiShtrafuEdit.edtSumaPropisom.Text:=frmSumiShtrafu.qSumaShtrafu.FieldByName('Прописом').Value else frmSumiShtrafuEdit.aConvertExecute(sender);
  frmSumiShtrafuEdit.edtSumaPropisom.Enabled:=true;
  frmSumiShtrafuEdit.btnPerevesti.Enabled:=true;
  frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
end;

procedure TfrmSumiShtrafu.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmSumiShtrafuEdit') then frmSumiShtrafuEdit:=TfrmSumiShtrafuEdit.Create(self);
  frmMain.Enabled:=false;
  frmSumiShtrafuEdit.Show;
//  if frmMain.IsFormOpen('frmShtrafiEdit') then frmSumiShtrafu.Enabled:=false;
  frmSumiShtrafuEdit.Caption:='Додавання суми штрафу';
  frmSumiShtrafuEdit.Position:=poMainFormCenter;
  frmSumiShtrafuEdit.BorderStyle:=bsDialog;
  frmSumiShtrafuEdit.aKodUpdateExecute(sender);
  frmSumiShtrafuEdit.edtKod.Enabled:=false;
  frmSumiShtrafuEdit.btnKod.Enabled:=false;
  frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
  frmSumiShtrafuEdit.edtCumaShtrafu.Enabled:=true;
  frmSumiShtrafuEdit.edtSumaPropisom.Text:='';
  frmSumiShtrafuEdit.edtSumaPropisom.Enabled:=true;
  frmSumiShtrafuEdit.btnPerevesti.Enabled:=true;
  frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
end;

procedure TfrmSumiShtrafu.aUpdateExecute(Sender: TObject);
begin
  with frmSumiShtrafu do
  begin
    qSumaShtrafu.SQL.Clear;
    qSumaShtrafu.SQL.Text:='select KOD as "Код", SUMASHTAFU as "Сума", SUMAPROPISOM as "Прописом" from SHTRAFI order by SUMASHTAFU';
    qSumaShtrafu.Open;
  end;
end;

procedure TfrmSumiShtrafu.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmSumiShtrafu.dsSumaShtrafu;
end;

end.
