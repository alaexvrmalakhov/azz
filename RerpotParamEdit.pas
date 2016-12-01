unit RerpotParamEdit;

interface

uses
  Forms, ImgList, Controls, ExtCtrls, StdCtrls, Classes, DB,
  IBCustomDataSet, IBQuery, ActnList, Graphics, ComCtrls, SysUtils;
//  Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmRerpotParamEdit = class(TForm)
    Label1: TLabel;
    edtRecordID: TEdit;
    Label2: TLabel;
    edtReportID: TEdit;
    Label3: TLabel;
    edtParamName: TEdit;
    iParamName: TImage;
    Label4: TLabel;
    edtBookmarkName: TEdit;
    iBookmarkName: TImage;
    Label5: TLabel;
    edtFormula: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    alReportParamEdit: TActionList;
    qReportParamEdit: TIBQuery;
    aRecordIDUpdate: TAction;
    aReportNameUpdate: TAction;
    aParamNameUpdate: TAction;
    aBookmarkNameUpdate: TAction;
    aFormula: TAction;
    aOK: TAction;
    aCancel: TAction;
    btnField: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aReportNameUpdateExecute(Sender: TObject);
    procedure aParamNameUpdateExecute(Sender: TObject);
    procedure aBookmarkNameUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aFormulaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRerpotParamEdit: TfrmRerpotParamEdit;

implementation

uses Main, ReportsEdit, ChoiceVariable;

{$R *.dfm}

procedure TfrmRerpotParamEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=false;
  frmReportsEdit.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRerpotParamEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmRerpotParamEdit.qReportParamEdit do
  begin
    SQL.Clear;
    SQL.Text:='insert into REPORTPARAMS (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    Open;
    SQL.Clear;
    SQL.Text:='select * from REPORTPARAMS order by RECORD_ID';
    Open;
    Last;
    frmRerpotParamEdit.edtRecordID.Text:=IntToStr(FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmRerpotParamEdit.aReportNameUpdateExecute(Sender: TObject);
begin
  frmRerpotParamEdit.edtReportID.Text:=frmReportsEdit.edtReportName.Text;
end;

procedure TfrmRerpotParamEdit.aParamNameUpdateExecute(Sender: TObject);
begin
  with frmRerpotParamEdit do
  begin
    with qReportParamEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from REPORTPARAMS order by PARAMNAME';
      Open;
    end;
    if (not qReportParamEdit.Locate('PARAMNAME',edtParamName.Text,[]))and(edtParamName.Text<>'') then iParamName.Visible:=true else iParamName.Visible:=false;
  end;
end;

procedure TfrmRerpotParamEdit.aBookmarkNameUpdateExecute(Sender: TObject);
begin
  with frmRerpotParamEdit do
  begin
    with qReportParamEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from REPORTPARAMS order by BOOKMARKNAME';
      Open;
    end;
    if (not qReportParamEdit.Locate('BOOKMARKNAME',edtBookmarkName.Text,[]))and(edtBookmarkName.Text<>'') then iBookmarkName.Visible:=true else iBookmarkName.Visible:=false;
  end;
end;

procedure TfrmRerpotParamEdit.aOKExecute(Sender: TObject);
begin
  if frmRerpotParamEdit.Caption='Видалити параметр' then
  begin
  end;

  if frmRerpotParamEdit.Caption='Змінити параметр' then
  begin
  end;

  if frmRerpotParamEdit.Caption='Додати параметр' then
  begin
    if frmRerpotParamEdit.edtRecordID.Text='' then
    begin
      frmRerpotParamEdit.aRecordIDUpdateExecute(sender);
      edtParamName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmRerpotParamEdit.edtRecordID.Text);
    except;
      frmRerpotParamEdit.aRecordIDUpdateExecute(sender);
      edtParamName.SetFocus;
      exit;
    end;
    if frmRerpotParamEdit.edtReportID.Text='' then
    begin
      frmRerpotParamEdit.aReportNameUpdateExecute(sender);
      edtParamName.SetFocus;
      exit;
    end;
    with frmRerpotParamEdit.qReportParamEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from REPORTS where REPORTNAME=:ReportName order by REPORTNAME';
      Params.Clear;
      Params.Add;
      Params[0].Name:='ReportName';
      Params[0].Value:=frmRerpotParamEdit.edtReportID.Text;
      Open;
    end;
    if not frmRerpotParamEdit.qReportParamEdit.Locate('REPORTNAME',frmRerpotParamEdit.edtReportID.Text,[]) then
    begin
      frmRerpotParamEdit.aReportNameUpdateExecute(sender);
      frmRerpotParamEdit.edtParamName.SetFocus;
      exit;
    end;
    if frmRerpotParamEdit.edtParamName.Text='' then
    begin
      frmRerpotParamEdit.edtParamName.SetFocus;
      exit;
    end;
    if frmRerpotParamEdit.edtBookmarkName.Text='' then
    begin
      frmRerpotParamEdit.edtBookmarkName.SetFocus;
      exit;
    end;
    if frmRerpotParamEdit.edtFormula.Text='' then
    begin
      frmRerpotParamEdit.edtFormula.SetFocus;
      exit;
    end;
  end;
end;

procedure TfrmRerpotParamEdit.aCancelExecute(Sender: TObject);
begin
  frmRerpotParamEdit.Close;
end;

procedure TfrmRerpotParamEdit.aFormulaExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmChoiceVariable') then frmChoiceVariable:=TfrmChoiceVariable.Create(self);
  frmRerpotParamEdit.Enabled:=false;
  with frmChoiceVariable do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати поле';
    tsField.Caption:='Поле БД';
    tsInit.Caption:='Налаштування';
    cbTablesList.Text:='';
    cbTablesList.Items.Clear;
    aUpdateTablesListExecute(sender);
    aUpdateFieldsListExecute(sender);
    aUpdateInitListExecute(sender);
    Show;
    pcChoiceVariable.ActivePage:=tsField;
    cbTablesList.SetFocus;
  end;
end;

end.
