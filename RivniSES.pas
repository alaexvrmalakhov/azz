unit RivniSES;

interface

uses
  Forms, Grids, DBGrids, Classes, Controls, ExtCtrls, StdCtrls, ActnList,
  Menus, DB, IBCustomDataSet, IBQuery, SysUtils;
// , Windows, Messages, Variants, Graphics, Dialogs;

type
  TfrmRivniSES = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    alRivniSES: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    mnRivniSES: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    dsRivniSES: TDataSource;
    qRivniSES: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRivniSES: TfrmRivniSES;

implementation

uses Main, RivniSESEdit;

{$R *.dfm}

procedure TfrmRivniSES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRivniSES.aCloseExecute(Sender: TObject);
begin
  frmRivniSES.Close;
end;

procedure TfrmRivniSES.aUpdateExecute(Sender: TObject);
begin
  with frmRivniSES do
  begin
    qRivniSES.SQL.Clear;
    qRivniSES.SQL.Text:='select * from RIVEN_SES order by KOD';
    qRivniSES.Open;
  end;
end;

procedure TfrmRivniSES.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRivniSESEdit') then frmRivniSESEdit:=TfrmRivniSESEdit.Create(self);
  frmMain.Enabled:=false;
  with frmRivniSESEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати рівень СЕС';
    aRecordIDUpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    Label1.Enabled:=false;
    edtKod.Text:='';
    edtKod.Enabled:=true;
    edtRiven.Text:='';
    edtRiven.Enabled:=true;
    edtDescription.Text:='';
    edtDescription.Enabled:=true;
    Show;
    edtKod.SetFocus;
  end;
end;

procedure TfrmRivniSES.aEditExecute(Sender: TObject);
begin
  if frmRivniSES.qRivniSES.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRivniSESEdit') then frmRivniSESEdit:=TfrmRivniSESEdit.Create(self);
  frmMain.Enabled:=false;
  with frmRivniSESEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити рівень СЕС';
    if not frmRivniSES.qRivniSES.FieldByName('RECORD_ID').IsNull then frmRivniSESEdit.edtRecord_ID.Text:=IntToStr(frmRivniSES.qRivniSES.FieldByName('RECORD_ID').Value) else frmRivniSESEdit.aRecordIDUpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    Label1.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmRivniSES.qRivniSES.FieldByName('KOD').Value) else edtKod.Text:='';
    edtKod.Enabled:=true;
    if not frmRivniSES.qRivniSES.FieldByName('RIVEN').IsNull then edtRiven.Text:=frmRivniSES.qRivniSES.FieldByName('RIVEN').Value else edtRiven.Text:='';
    edtRiven.Enabled:=true;
    if not frmRivniSES.qRivniSES.FieldByName('DESCRIPTION').IsNull then edtDescription.Text:=frmRivniSES.qRivniSES.FieldByName('DESCRIPTION').Value else edtDescription.Text:='';
    edtDescription.Enabled:=true;
    Show;
    edtKod.SetFocus;
  end;
end;

procedure TfrmRivniSES.aDeleteExecute(Sender: TObject);
begin
  if frmRivniSES.qRivniSES.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRivniSESEdit') then frmRivniSESEdit:=TfrmRivniSESEdit.Create(self);
  frmMain.Enabled:=false;
  with frmRivniSESEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити рівень СЕС';
    if not frmRivniSES.qRivniSES.FieldByName('RECORD_ID').IsNull then frmRivniSESEdit.edtRecord_ID.Text:=IntToStr(frmRivniSES.qRivniSES.FieldByName('RECORD_ID').Value) else frmRivniSESEdit.aRecordIDUpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    Label1.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmRivniSES.qRivniSES.FieldByName('KOD').Value) else edtKod.Text:='';
    edtKod.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('RIVEN').IsNull then edtRiven.Text:=frmRivniSES.qRivniSES.FieldByName('RIVEN').Value else edtRiven.Text:='';
    edtRiven.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('DESCRIPTION').IsNull then edtDescription.Text:=frmRivniSES.qRivniSES.FieldByName('DESCRIPTION').Value else edtDescription.Text:='';
    edtDescription.Enabled:=false;
    Show;
    btnCancel.SetFocus;
  end;
end;

procedure TfrmRivniSES.aChoiceExecute(Sender: TObject);
begin
  if frmRivniSES.qRivniSES.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRivniSESEdit') then frmRivniSESEdit:=TfrmRivniSESEdit.Create(self);
  frmMain.Enabled:=false;
  with frmRivniSESEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати рівень СЕС';
    if not frmRivniSES.qRivniSES.FieldByName('RECORD_ID').IsNull then frmRivniSESEdit.edtRecord_ID.Text:=IntToStr(frmRivniSES.qRivniSES.FieldByName('RECORD_ID').Value) else frmRivniSESEdit.aRecordIDUpdateExecute(sender);
    edtRecord_ID.Enabled:=false;
    Label1.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(frmRivniSES.qRivniSES.FieldByName('KOD').Value) else edtKod.Text:='';
    edtKod.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('RIVEN').IsNull then edtRiven.Text:=frmRivniSES.qRivniSES.FieldByName('RIVEN').Value else edtRiven.Text:='';
    edtRiven.Enabled:=false;
    if not frmRivniSES.qRivniSES.FieldByName('DESCRIPTION').IsNull then edtDescription.Text:=frmRivniSES.qRivniSES.FieldByName('DESCRIPTION').Value else edtDescription.Text:='';
    edtDescription.Enabled:=false;
    Show;
    btnOK.SetFocus;
  end;
end;

end.
