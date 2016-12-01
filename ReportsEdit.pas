unit ReportsEdit;

interface

uses
  Forms, ExtCtrls, Grids, DBGrids, Controls, StdCtrls, Dialogs, Classes,
  ActnList, DB, IBCustomDataSet, IBQuery, SysUtils, IniFiles;
//  Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmReportsEdit = class(TForm)
    Label1: TLabel;
    edtRecordID: TEdit;
    Label2: TLabel;
    edtReportName: TEdit;
    Label3: TLabel;
    cbReportType: TComboBox;
    Label4: TLabel;
    edtTemplateName: TEdit;
    btnTemplateName: TButton;
    OpenDialog: TOpenDialog;
    Label5: TLabel;
    cbParentForm: TComboBox;
    btnUpdateParentForm: TButton;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnAddParam: TButton;
    btnEditParam: TButton;
    btnDeleteParam: TButton;
    btnUpdateParams: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    alReportEdit: TActionList;
    aRecordIDUpdate: TAction;
    aTemplateName: TAction;
    aUpdateParentForm: TAction;
    aAddParam: TAction;
    aEditParam: TAction;
    aDeleteParam: TAction;
    aUpdateParam: TAction;
    aOK: TAction;
    aCancel: TAction;
    qReportEdit: TIBQuery;
    dsParams: TDataSource;
    qParams: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aTemplateNameExecute(Sender: TObject);
    procedure aUpdateParentFormExecute(Sender: TObject);
    procedure aAddParamExecute(Sender: TObject);
    procedure aEditParamExecute(Sender: TObject);
    procedure aDeleteParamExecute(Sender: TObject);
    procedure aUpdateParamExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportsEdit: TfrmReportsEdit;

implementation

uses Main, Reports, RerpotParamEdit;

{$R *.dfm}

procedure TfrmReportsEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  RecNo: integer;
begin
  RecNo:=frmReports.qReports.FieldByName('RECORD_ID').Value;
  frmReports.aUpdateExecute(sender);
  with frmReports.qReports do
  begin
    SQL.Clear;
    SQL.Text:='update REPORTS set EDITING=0 where RECORD_ID=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=frmReportsEdit.edtRecordID.Text;
    Open;
    frmMain.trAzz.CommitRetaining;
  end;
  frmReports.aUpdateExecute(sender);
  frmReports.qReports.Locate('RECORD_ID',RecNo,[]);
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmReportsEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmReportsEdit.qReportEdit do
  begin
    SQL.Clear;
    SQL.Text:='insert into REPORTS (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    Open;
    SQL.Clear;
    SQL.Text:='select * from REPORTS order by RECORD_ID';
    Open;
    Last;
  end;
  frmReportsEdit.edtRecordID.Text:=IntToStr(frmReportsEdit.qReportEdit.FieldByName('RECORD_ID').Value);
end;

procedure TfrmReportsEdit.aTemplateNameExecute(Sender: TObject);
var
  TemplPath: string;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  TemplPath:=INIAZZ.ReadString('System','TemplatePath',TemplPath);
  INIAZZ.Free;
  frmReportsEdit.OpenDialog.InitialDir:=TemplPath;
  if frmReportsEdit.OpenDialog.Execute then frmReportsEdit.edtTemplateName.Text:=ExtractFileName(frmReportsEdit.OpenDialog.FileName);
end;

procedure TfrmReportsEdit.aUpdateParentFormExecute(Sender: TObject);
begin
  with frmReportsEdit.qReportEdit do
  begin
    SQL.Clear;
    SQL.Text:='select * from VIKNA order by NAZVAVIKNA';
    Open;
    cbParentForm.Text:='';
    cbParentForm.Items.Clear;
    First;
    while not Eof do
    begin
      if not FieldByName('NAZVAVIKNA').IsNull then frmReportsEdit.cbParentForm.Items.Add(FieldByName('NAZVAVIKNA').Value);
      Next;
    end;
  end;
end;

procedure TfrmReportsEdit.aAddParamExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRerpotParamEdit') then frmRerpotParamEdit:=TfrmRerpotParamEdit.Create(Self);
  frmReportsEdit.Enabled:=false;
  with frmRerpotParamEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати параметр';
    edtRecordID.Text:='';
    aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    edtReportID.Text:='';
    aReportNameUpdateExecute(sender);
    Label2.Enabled:=false;
    edtReportID.Enabled:=false;
    edtParamName.Text:='';
    edtParamName.Enabled:=true;
    iParamName.Enabled:=true;
    iParamName.Visible:=false;
    edtBookmarkName.Text:='';
    edtBookmarkName.Enabled:=true;
    iBookmarkName.Enabled:=true;
    iBookmarkName.Visible:=false;
    edtFormula.Text:='';
    edtFormula.Enabled:=true;
    Show;
    edtParamName.SetFocus;
  end;
end;

procedure TfrmReportsEdit.aEditParamExecute(Sender: TObject);
begin
  if frmReportsEdit.qParams.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRerpotParamEdit') then frmRerpotParamEdit:=TfrmRerpotParamEdit.Create(Self);
  frmReportsEdit.Enabled:=false;
  with frmRerpotParamEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Змінити параметр';
    if not qParams.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(qParams.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not qParams.FieldByName('REPORT_ID').IsNull then edtReportID.Text:=IntToStr(qParams.FieldByName('REPORT_ID').Value) else aReportNameUpdateExecute(sender);
    with frmRerpotParamEdit.qReportParamEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from REPORTS where RECORD_ID=:RecordID order by RECORD_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='RecordID';
      Params[0].Value:=StrToInt(frmRerpotParamEdit.edtReportID.Text);
      Open;
      if Locate('RECORD_ID',StrToInt(frmRerpotParamEdit.edtReportID.Text),[]) then frmRerpotParamEdit.edtReportID.Text:=FieldByName('REPORTNAME').Value else frmRerpotParamEdit.edtReportID.Text:='';
    end;
    Label2.Enabled:=false;
    edtReportID.Enabled:=false;
    if not qParams.FieldByName('PARAMNAME').IsNull then edtParamName.Text:=qParams.FieldByName('PARAMNAME').Value else edtParamName.Text:='';
    edtParamName.Enabled:=true;
    iParamName.Enabled:=true;
    iParamName.Visible:=false;
    if not qParams.FieldByName('BOOKMARKNAME').IsNull then edtBookmarkName.Text:=qParams.FieldByName('BOOKMARKNAME').Value else edtBookmarkName.Text:='';
    edtBookmarkName.Enabled:=true;
    iBookmarkName.Enabled:=true;
    iBookmarkName.Visible:=false;
    if not qParams.FieldByName('FIELDNAME').IsNull then edtFormula.Text:=qParams.FieldByName('FIELDNAME').Value else edtFormula.Text:='';
    edtFormula.Enabled:=true;
    Show;
    edtParamName.SetFocus;
  end;
end;

procedure TfrmReportsEdit.aDeleteParamExecute(Sender: TObject);
begin
  if frmReportsEdit.qParams.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRerpotParamEdit') then frmRerpotParamEdit:=TfrmRerpotParamEdit.Create(Self);
  frmReportsEdit.Enabled:=false;
  with frmRerpotParamEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити параметр';
    if not qParams.FieldByName('RECORD_ID').IsNull then edtRecordID.Text:=IntToStr(qParams.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    Label1.Enabled:=false;
    edtRecordID.Enabled:=false;
    if not qParams.FieldByName('REPORT_ID').IsNull then edtReportID.Text:=IntToStr(qParams.FieldByName('REPORT_ID').Value) else aReportNameUpdateExecute(sender);
    with frmRerpotParamEdit.qReportParamEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from REPORTS where RECORD_ID=:RecordID order by RECORD_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='RecordID';
      Params[0].Value:=StrToInt(frmRerpotParamEdit.edtReportID.Text);
      Open;
      if Locate('RECORD_ID',StrToInt(frmRerpotParamEdit.edtReportID.Text),[]) then frmRerpotParamEdit.edtReportID.Text:=FieldByName('REPORTNAME').Value else frmRerpotParamEdit.edtReportID.Text:='';
    end;
    Label2.Enabled:=false;
    edtReportID.Enabled:=false;
    if not qParams.FieldByName('PARAMNAME').IsNull then edtParamName.Text:=qParams.FieldByName('PARAMNAME').Value else edtParamName.Text:='';
    edtParamName.Enabled:=false;
    iParamName.Enabled:=false;
    iParamName.Visible:=false;
    if not qParams.FieldByName('BOOKMARKNAME').IsNull then edtBookmarkName.Text:=qParams.FieldByName('BOOKMARKNAME').Value else edtBookmarkName.Text:='';
    edtBookmarkName.Enabled:=false;
    iBookmarkName.Enabled:=false;
    iBookmarkName.Visible:=false;
    if not qParams.FieldByName('FIELDNAME').IsNull then edtFormula.Text:=qParams.FieldByName('FIELDNAME').Value else edtFormula.Text:='';
    edtFormula.Enabled:=false;
    Show;
    btnCancel.SetFocus;
  end;
end;

procedure TfrmReportsEdit.aUpdateParamExecute(Sender: TObject);
begin
  with frmReportsEdit.qParams do
  begin
    SQL.Clear;
    SQL.Text:='select * from REPORTPARAMS where not PARAMNAME is null and REPORT_ID=:ReportID order by PARAMNAME';
    Params.Clear;
    Params.Add;
    Params[0].Name:='ReportID';
    Params[0].Value:=StrToInt(frmReportsEdit.edtRecordID.Text);
    Open;
  end;
end;

procedure TfrmReportsEdit.aOKExecute(Sender: TObject);
begin
  if frmReportsEdit.Caption='Вибрати звіт' then
  begin
  end;

  if frmReportsEdit.Caption='Видалити звіт' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на звітах,'+#13+'що формуються програмою!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmReportsEdit.qReportEdit do
      begin
        SQL.Clear;
        SQL.Text:='delete from REPORTS where RECORD_ID=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=StrToInt(frmReportsEdit.edtRecordID.Text);
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
    end;
    frmReports.aUpdateExecute(sender);
    frmReportsEdit.Close;
    exit;
  end;

  if frmReportsEdit.Caption='Змінити звіт' then
  begin
    if frmReportsEdit.edtRecordID.Text='' then
    begin
      frmReportsEdit.aRecordIDUpdateExecute(sender);
      frmReportsEdit.edtReportName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmReportsEdit.edtRecordID.Text);
    except
      frmReportsEdit.aRecordIDUpdateExecute(sender);
      frmReportsEdit.edtReportName.SetFocus;
      exit;
    end;
    if frmReportsEdit.edtReportName.Text='' then
    begin
      frmReportsEdit.edtReportName.SetFocus;
      exit;
    end;
    if frmReportsEdit.cbReportType.Text='' then
    begin
      frmReportsEdit.cbReportType.SetFocus;
      exit;
    end;
    if frmReportsEdit.edtTemplateName.Text='' then
    begin
      frmReportsEdit.edtReportName.SetFocus;
      frmReportsEdit.aTemplateNameExecute(sender);
      exit;
    end;
    if frmReportsEdit.cbParentForm.Text='' then
    begin
      frmReportsEdit.aUpdateParentFormExecute(sender);
      frmReportsEdit.cbParentForm.SetFocus;
      exit;
    end;
    with frmReports.qReports do
    begin
      SQL.Clear;
      SQL.Text:='update REPORTS set REPORTNAME=:ReportName,REPORTTYPE=:ReportType,TEMPLATENAME=:TemplateName,PARENTFORM=:ParentForm,EDITING=0 where RECORD_ID=:RecordID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='ReportName';
      Params[0].Value:=frmReportsEdit.edtReportName.Text;
      Params.Add;
      Params[1].Name:='ReportType';
      if frmReportsEdit.cbReportType.Text='документ' then Params[1].Value:=0;
      if frmReportsEdit.cbReportType.Text='таблиця' then Params[1].Value:=1;
      Params.Add;
      Params[2].Name:='TemplateName';
      Params[2].Value:=frmReportsEdit.edtTemplateName.Text;
      with frmReportsEdit.qReportEdit do
      begin
        SQL.Clear;
        SQL.Text:='select * from VIKNA where NAZVAVIKNA=:NazvaVikna order by NAZVAVIKNA';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NazvaVikna';
        Params[0].Value:=frmReportsEdit.cbParentForm.Text;
        Open;
      end;
      Params.Add;
      Params[3].Name:='ParentForm';
      if frmReportsEdit.qReportEdit.Locate('NAZVAVIKNA',frmReportsEdit.cbParentForm.Text,[]) then Params[3].Value:=frmReportsEdit.qReportEdit.FieldByName('RECORD_ID').Value else Params[3].Value:=0;
      Params.Add;
      Params[4].Name:='RecordID';
      Params[4].Value:=StrToInt(frmReportsEdit.edtRecordID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmReports.aUpdateExecute(sender);
    frmReports.qReports.Last;
    frmReportsEdit.Close;
    exit;
  end;

  if frmReportsEdit.Caption='Додати звіт' then
  begin
    if frmReportsEdit.edtRecordID.Text='' then
    begin
      frmReportsEdit.aRecordIDUpdateExecute(sender);
      frmReportsEdit.edtReportName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmReportsEdit.edtRecordID.Text);
    except
      frmReportsEdit.aRecordIDUpdateExecute(sender);
      frmReportsEdit.edtReportName.SetFocus;
      exit;
    end;
    if frmReportsEdit.edtReportName.Text='' then
    begin
      frmReportsEdit.edtReportName.SetFocus;
      exit;
    end;
    if frmReportsEdit.cbReportType.Text='' then
    begin
      frmReportsEdit.cbReportType.SetFocus;
      exit;
    end;
    if frmReportsEdit.edtTemplateName.Text='' then
    begin
      frmReportsEdit.edtReportName.SetFocus;
      frmReportsEdit.aTemplateNameExecute(sender);
      exit;
    end;
    if frmReportsEdit.cbParentForm.Text='' then
    begin
      frmReportsEdit.aUpdateParentFormExecute(sender);
      frmReportsEdit.cbParentForm.SetFocus;
      exit;
    end;
    with frmReports.qReports do
    begin
      SQL.Clear;
      SQL.Text:='update REPORTS set REPORTNAME=:ReportName,REPORTTYPE=:ReportType,TEMPLATENAME=:TemplateName,PARENTFORM=:ParentForm,EDITING=0 where RECORD_ID=:RecordID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='ReportName';
      Params[0].Value:=frmReportsEdit.edtReportName.Text;
      Params.Add;
      Params[1].Name:='ReportType';
      if frmReportsEdit.cbReportType.Text='документ' then Params[1].Value:=0;
      if frmReportsEdit.cbReportType.Text='таблиця' then Params[1].Value:=1;
      Params.Add;
      Params[2].Name:='TemplateName';
      Params[2].Value:=frmReportsEdit.edtTemplateName.Text;
      with frmReportsEdit.qReportEdit do
      begin
        SQL.Clear;
        SQL.Text:='select * from VIKNA where NAZVAVIKNA=:NazvaVikna order by NAZVAVIKNA';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NazvaVikna';
        Params[0].Value:=frmReportsEdit.cbParentForm.Text;
        Open;
      end;
      Params.Add;
      Params[3].Name:='ParentForm';
      if frmReportsEdit.qReportEdit.Locate('NAZVAVIKNA',frmReportsEdit.cbParentForm.Text,[]) then Params[3].Value:=frmReportsEdit.qReportEdit.FieldByName('RECORD_ID').Value else Params[3].Value:=0;
      Params.Add;
      Params[4].Name:='RecordID';
      Params[4].Value:=StrToInt(frmReportsEdit.edtRecordID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmReports.aUpdateExecute(sender);
    frmReports.qReports.Last;
    frmReportsEdit.Close;
    exit;
  end;
end;

procedure TfrmReportsEdit.aCancelExecute(Sender: TObject);
begin
  frmReportsEdit.Close;
end;

end.
