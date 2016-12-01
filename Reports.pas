unit Reports;

interface

uses
  Forms, StdCtrls, ExtCtrls, DB, IBCustomDataSet, IBQuery, Controls, Grids,
  DBGrids, ActnList, Classes, Menus, SysUtils;
//  Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmReports = class(TForm)
    PopupMenu: TPopupMenu;
    alReports: TActionList;
    DBGrid1: TDBGrid;
    dsReports: TDataSource;
    qReports: TIBQuery;
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCloseExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReports: TfrmReports;

implementation

uses Main, ReportsEdit;

{$R *.dfm}

procedure TfrmReports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmReports.aCloseExecute(Sender: TObject);
begin
  frmReports.Close;
end;

procedure TfrmReports.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmReportsEdit') then frmReportsEdit:=TfrmReportsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmReportsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати звіт';
    aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    edtReportName.Text:='';
    edtReportName.Enabled:=true;
    cbReportType.Text:='';
    cbReportType.Enabled:=true;
    edtTemplateName.Text:='';
    edtTemplateName.Enabled:=true;
    btnTemplateName.Enabled:=true;
    cbParentForm.Text:='';
    cbParentForm.Enabled:=true;
    btnUpdateParentForm.Enabled:=true;
    aUpdateParentFormExecute(sender);
    DBGrid1.Align:=alClient;
    btnAddParam.Enabled:=true;
    btnEditParam.Enabled:=true;
    btnDeleteParam.Enabled:=true;
    btnUpdateParams.Enabled:=true;
    aUpdateParamExecute(sender);
    Show;
    edtReportName.SetFocus;
  end;
end;

procedure TfrmReports.aEditExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmReports.qReports.RecordCount<=0 then exit;
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  frmReports.aUpdateExecute(sender);
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
  if (not frmReports.qReports.FieldByName('EDITING').IsNull)and(frmReports.qReports.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmReportsEdit') then frmReportsEdit:=TfrmReportsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmReportsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити звіт';
    if not frmReports.qReports.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(frmReports.qReports.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not frmReports.qReports.FieldByName('REPORTNAME').IsNull then edtReportName.Text:=frmReports.qReports.FieldByName('REPORTNAME').Value else edtReportName.Text:='';
    edtReportName.Enabled:=true;
    if not frmReports.qReports.FieldByName('REPORTTYPE').IsNull then cbReportType.Text:=IntToStr(frmReports.qReports.FieldByName('REPORTTYPE').Value) else cbReportType.Text:='';
    if cbReportType.Text<>'' then
      case StrToInt(cbReportType.Text) of
        0: cbReportType.Text:='документ';
        1: cbReportType.Text:='таблиця';
      else
        cbReportType.Text:='';
      end;
    cbReportType.Enabled:=true;
    if not frmReports.qReports.FieldByName('TEMPLATENAME').IsNull then edtTemplateName.Text:=frmReports.qReports.FieldByName('TEMPLATENAME').Value else edtTemplateName.Text:='';
    edtTemplateName.Enabled:=true;
    btnTemplateName.Enabled:=true;
    cbParentForm.Text:='';
    cbParentForm.Items.Clear;
    aUpdateParentFormExecute(sender);
    if not frmReports.qReports.FieldByName('PARENTFORM').IsNull then cbParentForm.Text:=IntToStr(frmReports.qReports.FieldByName('PARENTFORM').Value) else cbParentForm.Text:='';
    qReportEdit.SQL.Clear;
    qReportEdit.SQL.Text:='select * from VIKNA where RECORD_ID=:RecordID order by RECORD_ID';
    qReportEdit.Params.Clear;
    qReportEdit.Params.Add;
    qReportEdit.Params[0].Name:='RecordID';
    qReportEdit.Params[0].Value:=StrToInt(cbParentForm.Text);
    qReportEdit.Open;
    if qReportEdit.Locate('RECORD_ID',StrToInt(cbParentForm.Text),[]) then cbParentForm.Text:=qReportEdit.FieldByName('NAZVAVIKNA').Value else cbParentForm.Text:='';
    cbParentForm.Enabled:=true;
    btnUpdateParentForm.Enabled:=true;
    DBGrid1.Align:=alClient;
    btnAddParam.Enabled:=true;
    btnEditParam.Enabled:=true;
    btnDeleteParam.Enabled:=true;
    btnUpdateParams.Enabled:=true;
    aUpdateParamExecute(sender);
    Show;
    edtReportName.SetFocus;
  end;
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  with frmReportsEdit.qReportEdit do
  begin
    SQL.Clear;
    SQL.Text:='update REPORTS set EDITING=1 where RECORD_ID=:RecordID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='RecordID';
    Params[0].Value:=frmReports.qReports.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmReports.aDeleteExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmReports.qReports.RecordCount<=0 then exit;
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  frmReports.aUpdateExecute(sender);
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
  if (not frmReports.qReports.FieldByName('EDITING').IsNull)and(frmReports.qReports.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmReportsEdit') then frmReportsEdit:=TfrmReportsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmReportsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити звіт';
    if not frmReports.qReports.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(frmReports.qReports.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not frmReports.qReports.FieldByName('REPORTNAME').IsNull then edtReportName.Text:=frmReports.qReports.FieldByName('REPORTNAME').Value else edtReportName.Text:='';
    edtReportName.Enabled:=false;
    if not frmReports.qReports.FieldByName('REPORTTYPE').IsNull then cbReportType.Text:=IntToStr(frmReports.qReports.FieldByName('REPORTTYPE').Value) else cbReportType.Text:='';
    if cbReportType.Text<>'' then
      case StrToInt(cbReportType.Text) of
        0: cbReportType.Text:='документ';
        1: cbReportType.Text:='таблиця';
      else
        cbReportType.Text:='';
      end;
    cbReportType.Enabled:=false;
    if not frmReports.qReports.FieldByName('TEMPLATENAME').IsNull then edtTemplateName.Text:=frmReports.qReports.FieldByName('TEMPLATENAME').Value else edtTemplateName.Text:='';
    edtTemplateName.Enabled:=false;
    btnTemplateName.Enabled:=false;
    cbParentForm.Text:='';
    cbParentForm.Items.Clear;
    aUpdateParentFormExecute(sender);
    if not frmReports.qReports.FieldByName('PARENTFORM').IsNull then cbParentForm.Text:=IntToStr(frmReports.qReports.FieldByName('PARENTFORM').Value) else cbParentForm.Text:='';
    qReportEdit.SQL.Clear;
    qReportEdit.SQL.Text:='select * from VIKNA where RECORD_ID=:RecordID order by RECORD_ID';
    qReportEdit.Params.Clear;
    qReportEdit.Params.Add;
    qReportEdit.Params[0].Name:='RecordID';
    qReportEdit.Params[0].Value:=StrToInt(cbParentForm.Text);
    qReportEdit.Open;
    if qReportEdit.Locate('RECORD_ID',StrToInt(cbParentForm.Text),[]) then cbParentForm.Text:=qReportEdit.FieldByName('NAZVAVIKNA').Value else cbParentForm.Text:='';
    cbParentForm.Enabled:=false;
    btnUpdateParentForm.Enabled:=false;
    DBGrid1.Align:=alClient;
    btnAddParam.Enabled:=false;
    btnEditParam.Enabled:=false;
    btnDeleteParam.Enabled:=false;
    btnUpdateParams.Enabled:=true;
    aUpdateParamExecute(sender);
    Show;
    btnCancel.SetFocus;
  end;
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  with frmReportsEdit.qReportEdit do
  begin
    SQL.Clear;
    SQL.Text:='update REPORTS set EDITING=1 where RECORD_ID=:RecordID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='RecordID';
    Params[0].Value:=frmReports.qReports.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmReports.aChoiceExecute(Sender: TObject);
var
  RecNo: integer;
begin
  if frmReports.qReports.RecordCount<=0 then exit;
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  frmReports.aUpdateExecute(sender);
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
  if (not frmReports.qReports.FieldByName('EDITING').IsNull)and(frmReports.qReports.FieldByName('EDITING').Value=1) then exit;
  if not frmMain.IsFormOpen('frmReportsEdit') then frmReportsEdit:=TfrmReportsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmReportsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати звіт';
    if not frmReports.qReports.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(frmReports.qReports.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not frmReports.qReports.FieldByName('REPORTNAME').IsNull then edtReportName.Text:=frmReports.qReports.FieldByName('REPORTNAME').Value else edtReportName.Text:='';
    edtReportName.Enabled:=false;
    if not frmReports.qReports.FieldByName('REPORTTYPE').IsNull then cbReportType.Text:=IntToStr(frmReports.qReports.FieldByName('REPORTTYPE').Value) else cbReportType.Text:='';
    if cbReportType.Text<>'' then
      case StrToInt(cbReportType.Text) of
        0: cbReportType.Text:='документ';
        1: cbReportType.Text:='таблиця';
      else
        cbReportType.Text:='';
      end;
    cbReportType.Enabled:=false;
    if not frmReports.qReports.FieldByName('TEMPLATENAME').IsNull then edtTemplateName.Text:=frmReports.qReports.FieldByName('TEMPLATENAME').Value else edtTemplateName.Text:='';
    edtTemplateName.Enabled:=false;
    btnTemplateName.Enabled:=false;
    cbParentForm.Text:='';
    cbParentForm.Items.Clear;
    aUpdateParentFormExecute(sender);
    if not frmReports.qReports.FieldByName('PARENTFORM').IsNull then cbParentForm.Text:=IntToStr(frmReports.qReports.FieldByName('PARENTFORM').Value) else cbParentForm.Text:='';
    qReportEdit.SQL.Clear;
    qReportEdit.SQL.Text:='select * from VIKNA where RECORD_ID=:RecordID order by RECORD_ID';
    qReportEdit.Params.Clear;
    qReportEdit.Params.Add;
    qReportEdit.Params[0].Name:='RecordID';
    qReportEdit.Params[0].Value:=StrToInt(cbParentForm.Text);
    qReportEdit.Open;
    if qReportEdit.Locate('RECORD_ID',StrToInt(cbParentForm.Text),[]) then cbParentForm.Text:=qReportEdit.FieldByName('NAZVAVIKNA').Value else cbParentForm.Text:='';
    cbParentForm.Enabled:=false;
    btnUpdateParentForm.Enabled:=false;
    DBGrid1.Align:=alClient;
    btnAddParam.Enabled:=false;
    btnEditParam.Enabled:=false;
    btnDeleteParam.Enabled:=false;
    btnUpdateParams.Enabled:=true;
    aUpdateParamExecute(sender);
    Show;
    btnCancel.SetFocus;
  end;
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  with frmReportsEdit.qReportEdit do
  begin
    SQL.Clear;
    SQL.Text:='update REPORTS set EDITING=1 where RECORD_ID=:RecordID';
    Params.Clear;
    Params.Add;
    Params[0].Name:='RecordID';
    Params[0].Value:=frmReports.qReports.FieldByName('RECORD_ID').Value;
    Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
end;

procedure TfrmReports.aUpdateExecute(Sender: TObject);
begin
  with frmReports.qReports do
  begin
    SQL.Clear;
    SQL.Text:='select * from REPORTS where not TEMPLATENAME is null order by REPORTNAME';
    Open;
  end;
end;

end.
