unit ElementiVikon;

interface

uses
  Forms, Menus, Classes, ActnList, DB, IBCustomDataSet, IBQuery, Controls,
  StdCtrls, ExtCtrls, Grids, DBGrids, SysUtils;
//  Windows, Messages, Variants, Graphics, Dialogs;

type
  TfrmElementiVikon = class(TForm)
    qElementiVikon: TIBQuery;
    DBGrid1: TDBGrid;
    dsElementiVikon: TDataSource;
    alElementiVikon: TActionList;
    Panel1: TPanel;
    Panel2: TPanel;
    cbForms: TComboBox;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    btnFormsUpdate: TButton;
    PopupMenu: TPopupMenu;
    aFormsUpdate: TAction;
    aFormsChange: TAction;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    qUpdates: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aFormsUpdateExecute(Sender: TObject);
    procedure aFormsChangeExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElementiVikon: TfrmElementiVikon;

implementation

uses Main, ElementiVikonEdit;

{$R *.dfm}

procedure TfrmElementiVikon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmElementiVikon.FormResize(Sender: TObject);
begin
  with frmElementiVikon do
  begin
    cbForms.Left:=4;
    cbForms.Width:=Width-btnFormsUpdate.Width-20;
    btnFormsUpdate.Left:=cbForms.Left+cbForms.Width+4;
  end;
end;

procedure TfrmElementiVikon.aFormsUpdateExecute(Sender: TObject);
begin
  with frmElementiVikon do
  begin
    qUpdates.SQL.Clear;
    qUpdates.SQL.Text:='select * from VIKNA order by NAZVAVIKNA';
    qUpdates.Open;
    cbForms.Text:='';
    cbForms.Items.Clear;
    qUpdates.First;
    while not qUpdates.Eof do
    begin
      cbForms.Items.Add(qUpdates.FieldByName('NAZVAVIKNA').Value);
      qUpdates.Next;
    end;
  end;
end;

procedure TfrmElementiVikon.aFormsChangeExecute(Sender: TObject);
begin
  frmElementiVikon.aUpdateExecute(sender);
end;

procedure TfrmElementiVikon.aAddExecute(Sender: TObject);
begin
  if frmElementiVikon.cbForms.Text='' then
  begin
    aFormsUpdateExecute(sender);
    frmElementiVikon.cbForms.SetFocus;
    exit;
  end;
  if not frmMain.IsFormOpen('frmElementiVikonEdit') then frmElementiVikonEdit:=TfrmElementiVikonEdit.Create(self);
  frmMain.Enabled:=false;
  with frmElementiVikonEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати елемент керування';
    Show;
    edtRecordID.Text:='';
    edtRecordID.Enabled:=false;
    aRecordIDUpdateExecute(sender);
    cbVikno.Text:='';
    cbVikno.Items.Clear;
    cbVikno.Enabled:=true;
    btnVikno_Update.Enabled:=true;
    btnVikno_Choice.Enabled:=true;
    aVikno_UpdateExecute(sender);
    cbVikno.Text:=frmElementiVikon.cbForms.Text;
    edtNazvaElementa.Text:='';
    edtNazvaElementa.Enabled:=true;
    edtImjyElementa.Text:='';
    edtImjyElementa.Enabled:=true;
    edtPrimitka.Text:='';
    edtPrimitka.Enabled:=true;
    edtNazvaElementa.SetFocus;
  end;
end;

procedure TfrmElementiVikon.aEditExecute(Sender: TObject);
begin
  if frmElementiVikon.cbForms.Text='' then
  begin
    aFormsUpdateExecute(sender);
    frmElementiVikon.cbForms.SetFocus;
    exit;
  end;
  if frmElementiVikon.qElementiVikon.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmElementiVikonEdit') then frmElementiVikonEdit:=TfrmElementiVikonEdit.Create(self);
  frmMain.Enabled:=false;
  with frmElementiVikonEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Редагувати елемент керування';
    Show;
    if not frmElementiVikon.qElementiVikon.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(frmElementiVikon.qElementiVikon.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    edtRecordID.Enabled:=false;
    cbVikno.Text:='';
    cbVikno.Items.Clear;
    cbVikno.Enabled:=true;
    btnVikno_Update.Enabled:=true;
    btnVikno_Choice.Enabled:=true;
    aVikno_UpdateExecute(sender);
    if not frmElementiVikon.qElementiVikon.FieldByName('PARENTFORM').IsNull then cbVikno.Text:=IntToStr(frmElementiVikon.qElementiVikon.FieldByName('PARENTFORM').Value);
    qElementiVikonEdit.SQL.Clear;
    qElementiVikonEdit.SQL.Text:='select * from VIKNA where RECORD_ID=:Record_ID order by RECORD_ID';
    qElementiVikonEdit.Params.Clear;
    qElementiVikonEdit.Params.Add;
    qElementiVikonEdit.Params[0].Name:='Record_ID';
    qElementiVikonEdit.Params[0].Value:=cbVikno.Text;
    qElementiVikonEdit.Open;
    if qElementiVikonEdit.Locate('RECORD_ID',StrToInt(cbVikno.Text),[]) then cbVikno.Text:=qElementiVikonEdit.FieldByName('NAZVAVIKNA').Value else cbVikno.Text:='';
    if not frmElementiVikon.qElementiVikon.FieldByName('NAZVAELEMENTA').IsNull then edtNazvaElementa.Text:=frmElementiVikon.qElementiVikon.FieldByName('NAZVAELEMENTA').Value else edtNazvaElementa.Text:='';
    edtNazvaElementa.Enabled:=true;
    if not frmElementiVikon.qElementiVikon.FieldByName('IMJYELEMENTA').IsNull then edtImjyElementa.Text:=frmElementiVikon.qElementiVikon.FieldByName('IMJYELEMENTA').Value else edtImjyElementa.Text:='';
    edtImjyElementa.Enabled:=true;
    if not frmElementiVikon.qElementiVikon.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=frmElementiVikon.qElementiVikon.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=true;
    edtNazvaElementa.SetFocus;
  end;
end;

procedure TfrmElementiVikon.aDeleteExecute(Sender: TObject);
begin
  if frmElementiVikon.cbForms.Text='' then
  begin
    aFormsUpdateExecute(sender);
    frmElementiVikon.cbForms.SetFocus;
    exit;
  end;
  if frmElementiVikon.qElementiVikon.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmElementiVikonEdit') then frmElementiVikonEdit:=TfrmElementiVikonEdit.Create(self);
  frmMain.Enabled:=false;
  with frmElementiVikonEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити елемент керування';
    Show;
    if not frmElementiVikon.qElementiVikon.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(frmElementiVikon.qElementiVikon.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    edtRecordID.Enabled:=false;
    cbVikno.Text:='';
    cbVikno.Items.Clear;
    cbVikno.Enabled:=false;
    btnVikno_Update.Enabled:=false;
    btnVikno_Choice.Enabled:=false;
    aVikno_UpdateExecute(sender);
    if not frmElementiVikon.qElementiVikon.FieldByName('PARENTFORM').IsNull then cbVikno.Text:=IntToStr(frmElementiVikon.qElementiVikon.FieldByName('PARENTFORM').Value);
    qElementiVikonEdit.SQL.Clear;
    qElementiVikonEdit.SQL.Text:='select * from VIKNA where RECORD_ID=:Record_ID order by RECORD_ID';
    qElementiVikonEdit.Params.Clear;
    qElementiVikonEdit.Params.Add;
    qElementiVikonEdit.Params[0].Name:='Record_ID';
    qElementiVikonEdit.Params[0].Value:=cbVikno.Text;
    qElementiVikonEdit.Open;
    if qElementiVikonEdit.Locate('RECORD_ID',StrToInt(cbVikno.Text),[]) then cbVikno.Text:=qElementiVikonEdit.FieldByName('NAZVAVIKNA').Value else cbVikno.Text:='';
    if not frmElementiVikon.qElementiVikon.FieldByName('NAZVAELEMENTA').IsNull then edtNazvaElementa.Text:=frmElementiVikon.qElementiVikon.FieldByName('NAZVAELEMENTA').Value else edtNazvaElementa.Text:='';
    edtNazvaElementa.Enabled:=false;
    if not frmElementiVikon.qElementiVikon.FieldByName('IMJYELEMENTA').IsNull then edtImjyElementa.Text:=frmElementiVikon.qElementiVikon.FieldByName('IMJYELEMENTA').Value else edtImjyElementa.Text:='';
    edtImjyElementa.Enabled:=false;
    if not frmElementiVikon.qElementiVikon.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=frmElementiVikon.qElementiVikon.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=false;
    btnCancel.SetFocus;
  end;
end;

procedure TfrmElementiVikon.aChoiceExecute(Sender: TObject);
begin
  if frmElementiVikon.cbForms.Text='' then
  begin
    aFormsUpdateExecute(sender);
    frmElementiVikon.cbForms.SetFocus;
    exit;
  end;
  if frmElementiVikon.qElementiVikon.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmElementiVikonEdit') then frmElementiVikonEdit:=TfrmElementiVikonEdit.Create(self);
  frmMain.Enabled:=false;
  with frmElementiVikonEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати елемент керування';
    Show;
    if not frmElementiVikon.qElementiVikon.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(frmElementiVikon.qElementiVikon.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    edtRecordID.Enabled:=false;
    cbVikno.Text:='';
    cbVikno.Items.Clear;
    cbVikno.Enabled:=false;
    btnVikno_Update.Enabled:=false;
    btnVikno_Choice.Enabled:=false;
    aVikno_UpdateExecute(sender);
    if not frmElementiVikon.qElementiVikon.FieldByName('PARENTFORM').IsNull then cbVikno.Text:=IntToStr(frmElementiVikon.qElementiVikon.FieldByName('PARENTFORM').Value);
    qElementiVikonEdit.SQL.Clear;
    qElementiVikonEdit.SQL.Text:='select * from VIKNA where RECORD_ID=:Record_ID order by RECORD_ID';
    qElementiVikonEdit.Params.Clear;
    qElementiVikonEdit.Params.Add;
    qElementiVikonEdit.Params[0].Name:='Record_ID';
    qElementiVikonEdit.Params[0].Value:=cbVikno.Text;
    qElementiVikonEdit.Open;
    if qElementiVikonEdit.Locate('RECORD_ID',StrToInt(cbVikno.Text),[]) then cbVikno.Text:=qElementiVikonEdit.FieldByName('NAZVAVIKNA').Value else cbVikno.Text:='';
    if not frmElementiVikon.qElementiVikon.FieldByName('NAZVAELEMENTA').IsNull then edtNazvaElementa.Text:=frmElementiVikon.qElementiVikon.FieldByName('NAZVAELEMENTA').Value else edtNazvaElementa.Text:='';
    edtNazvaElementa.Enabled:=false;
    if not frmElementiVikon.qElementiVikon.FieldByName('IMJYELEMENTA').IsNull then edtImjyElementa.Text:=frmElementiVikon.qElementiVikon.FieldByName('IMJYELEMENTA').Value else edtImjyElementa.Text:='';
    edtImjyElementa.Enabled:=false;
    if not frmElementiVikon.qElementiVikon.FieldByName('PRIMITKA').IsNull then edtPrimitka.Text:=frmElementiVikon.qElementiVikon.FieldByName('PRIMITKA').Value else edtPrimitka.Text:='';
    edtPrimitka.Enabled:=false;
    btnOK.SetFocus;
  end;
end;

procedure TfrmElementiVikon.aUpdateExecute(Sender: TObject);
begin
  with frmElementiVikon do
  begin
    qElementiVikon.SQL.Clear;
    qElementiVikon.SQL.Text:='select * from ELEMENTIVIKON,VIKNA where VIKNA.NAZVAVIKNA=:NazvaVikna and ELEMENTIVIKON.PARENTFORM=VIKNA.RECORD_ID order by ELEMENTIVIKON.NAZVAELEMENTA';
    qElementiVikon.Params.Clear;
    qElementiVikon.Params.Add;
    qElementiVikon.Params[0].Name:='NazvaVikna';
    qElementiVikon.Params[0].Value:=cbForms.Text;
    qElementiVikon.Open;
  end;
end;

procedure TfrmElementiVikon.aCloseExecute(Sender: TObject);
begin
  frmElementiVikon.Close;
end;

end.
