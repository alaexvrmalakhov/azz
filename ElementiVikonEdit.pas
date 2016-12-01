unit ElementiVikonEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, SysUtils, Dialogs;
//  Windows, Messages, Variants, Classes, Graphics, Controls;

type
  TfrmElementiVikonEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtRecordID: TEdit;
    edtImjyElementa: TEdit;
    edtPrimitka: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    edtNazvaElementa: TEdit;
    alElementiVikonEdit: TActionList;
    qElementiVikonEdit: TIBQuery;
    aRecordIDUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    Label5: TLabel;
    cbVikno: TComboBox;
    btnVikno_Update: TButton;
    btnVikno_Choice: TButton;
    aVikno_Update: TAction;
    aVikno_Choice: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aVikno_UpdateExecute(Sender: TObject);
    procedure aVikno_ChoiceExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmElementiVikonEdit: TfrmElementiVikonEdit;

implementation

uses Main, Vikna, ElementiVikon;

{$R *.dfm}

procedure TfrmElementiVikonEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmElementiVikonEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmElementiVikonEdit do
  begin
    qElementiVikonEdit.SQL.Clear;
    qElementiVikonEdit.SQL.Text:='insert into ELEMENTIVIKON (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qElementiVikonEdit.Open;
    qElementiVikonEdit.SQL.Clear;
    qElementiVikonEdit.SQL.Text:='select * from ELEMENTIVIKON order by RECORD_ID';
    qElementiVikonEdit.Open;
    qElementiVikonEdit.Last;
    edtRecordID.Text:=IntToStr(qElementiVikonEdit.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmElementiVikonEdit.aVikno_UpdateExecute(Sender: TObject);
begin
  with frmElementiVikonEdit do
  begin
    qElementiVikonEdit.SQL.Clear;
    qElementiVikonEdit.SQL.Text:='select * from VIKNA order by NAZVAVIKNA';
    qElementiVikonEdit.Open;
    cbVikno.Text:='';
    cbVikno.Items.Clear;
    while not qElementiVikonEdit.Eof do
    begin
      cbVikno.Items.Add(qElementiVikonEdit.FieldByName('NAZVAVIKNA').Value);
      qElementiVikonEdit.Next;
    end;
  end;
end;

procedure TfrmElementiVikonEdit.aVikno_ChoiceExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVikna') then frmVikna:=TfrmVikna.Create(self);
  frmElementiVikonEdit.Enabled:=false;
  frmMain.aNalashtuvanny_ViknaExecute(sender);
  frmVikna.aChoice.Enabled:=true;
  frmVikna.Left:=frmMain.Left+70;
  frmVikna.Top:=frmMain.Top+70;
  frmVikna.Width:=frmMain.Width-70;
  frmVikna.Height:=frmMain.Height-70;
  frmVikna.Position:=poMainFormCenter;
  frmVikna.FormStyle:=fsNormal;
  frmVikna.BorderStyle:=bsDialog;
end;

procedure TfrmElementiVikonEdit.aOKExecute(Sender: TObject);
var
  Vikno: integer;
begin
  if frmElementiVikonEdit.Caption='Вибрати елемент керування' then
  begin
  end;

  if frmElementiVikonEdit.Caption='Видалити елемент керування' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису відобразиться на правах користувачів!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmElementiVikonEdit do
      begin
        qElementiVikonEdit.SQL.Clear;
//        qElementiVikonEdit.SQL.Text:='delete from ELEMENTIVIKON where RECORD_ID='+edtRecordID.Text;
        qElementiVikonEdit.SQL.Text:='delete from ELEMENTIVIKON where RECORD_ID=:Record_ID';
        qElementiVikonEdit.Params.Clear;
        qElementiVikonEdit.Params.Add;
        qElementiVikonEdit.Params[0].Name:='Record_ID';
        qElementiVikonEdit.Params[0].Value:=edtRecordID.Text;
        qElementiVikonEdit.Open;
      end;
    end;
    frmMain.trAzz.CommitRetaining;
    frmElementiVikonEdit.Close;
    frmElementiVikon.aUpdateExecute(sender);
    exit;
  end;

  if frmElementiVikonEdit.Caption='Редагувати елемент керування' then
  begin
    if frmElementiVikonEdit.edtRecordID.Text='' then
    begin
      aRecordIDUpdateExecute(sender);
      edtNazvaElementa.SetFocus;
      exit;
    end;
    try
      StrToInt(frmElementiVikonEdit.edtRecordID.Text);
    except
      aRecordIDUpdateExecute(sender);
      edtNazvaElementa.SetFocus;
      exit;
    end;
    if cbVikno.Text='' then
    begin
      aVikno_UpdateExecute(sender);
      cbVikno.Text:=frmElementiVikon.cbForms.Text;
      cbVikno.SetFocus;
      exit;
    end;
    if edtNazvaElementa.Text='' then
    begin
      edtNazvaElementa.Text:='';
      edtNazvaElementa.SetFocus;
      exit;
    end;
    if edtImjyElementa.Text='' then
    begin
      edtImjyElementa.Text:='';
      edtImjyElementa.SetFocus;
      exit;
    end;
    Vikno:=0;
    with frmElementiVikonEdit do
    begin
      qElementiVikonEdit.SQL.Clear;
      qElementiVikonEdit.SQL.Text:='select * from VIKNA where NAZVAVIKNA=:Vikno order by NAZVAVIKNA';
      qElementiVikonEdit.Params.Clear;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[0].Name:='Vikno';
      qElementiVikonEdit.Params[0].Value:=cbVikno.Text;
      qElementiVikonEdit.Open;
      if qElementiVikonEdit.Locate('NAZVAVIKNA',cbVikno.Text,[]) then Vikno:=qElementiVikonEdit.FieldByName('RECORD_ID').Value else Vikno:=0;
      qElementiVikonEdit.SQL.Clear;
      qElementiVikonEdit.SQL.Text:='update ELEMENTIVIKON set PARENTFORM=:PARENTFORM,NAZVAELEMENTA=:NAZVAELEMENTA,IMJYELEMENTA=:IMJYELEMENTA,PRIMITKA=:PRIMITKA where RECORD_ID=:RECORD_ID';
      qElementiVikonEdit.Params.Clear;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[0].Name:='PARENTFORM';
      qElementiVikonEdit.Params[0].Value:=Vikno;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[1].Name:='NAZVAELEMENTA';
      qElementiVikonEdit.Params[1].Value:=edtNazvaElementa.Text;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[2].Name:='IMJYELEMENTA';
      qElementiVikonEdit.Params[2].Value:=edtImjyElementa.Text;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[3].Name:='PRIMITKA';
      qElementiVikonEdit.Params[3].Value:=edtPrimitka.Text;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[4].Name:='RECORD_ID';
      qElementiVikonEdit.Params[4].Value:=edtRecordID.Text;;
      qElementiVikonEdit.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmElementiVikonEdit.Close;
    frmElementiVikon.aUpdateExecute(sender);
    exit;
  end;

  if frmElementiVikonEdit.Caption='Додати елемент керування' then
  begin
    if frmElementiVikonEdit.edtRecordID.Text='' then
    begin
      aRecordIDUpdateExecute(sender);
      edtNazvaElementa.SetFocus;
      exit;
    end;
    try
      StrToInt(frmElementiVikonEdit.edtRecordID.Text);
    except
      aRecordIDUpdateExecute(sender);
      edtNazvaElementa.SetFocus;
      exit;
    end;
    if cbVikno.Text='' then
    begin
      aVikno_UpdateExecute(sender);
      cbVikno.Text:=frmElementiVikon.cbForms.Text;
      cbVikno.SetFocus;
      exit;
    end;
    if edtNazvaElementa.Text='' then
    begin
      edtNazvaElementa.Text:='';
      edtNazvaElementa.SetFocus;
      exit;
    end;
    if edtImjyElementa.Text='' then
    begin
      edtImjyElementa.Text:='';
      edtImjyElementa.SetFocus;
      exit;
    end;
    Vikno:=0;
    with frmElementiVikonEdit do
    begin
      qElementiVikonEdit.SQL.Clear;
      qElementiVikonEdit.SQL.Text:='select * from VIKNA where NAZVAVIKNA=:Vikno order by NAZVAVIKNA';
      qElementiVikonEdit.Params.Clear;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[0].Name:='Vikno';
      qElementiVikonEdit.Params[0].Value:=cbVikno.Text;
      qElementiVikonEdit.Open;
      if qElementiVikonEdit.Locate('NAZVAVIKNA',cbVikno.Text,[]) then Vikno:=qElementiVikonEdit.FieldByName('RECORD_ID').Value else Vikno:=0;
      qElementiVikonEdit.SQL.Clear;
      qElementiVikonEdit.SQL.Text:='update ELEMENTIVIKON set PARENTFORM=:PARENTFORM,NAZVAELEMENTA=:NAZVAELEMENTA,IMJYELEMENTA=:IMJYELEMENTA,PRIMITKA=:PRIMITKA where RECORD_ID=:RECORD_ID';
      qElementiVikonEdit.Params.Clear;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[0].Name:='PARENTFORM';
      qElementiVikonEdit.Params[0].Value:=Vikno;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[1].Name:='NAZVAELEMENTA';
      qElementiVikonEdit.Params[1].Value:=edtNazvaElementa.Text;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[2].Name:='IMJYELEMENTA';
      qElementiVikonEdit.Params[2].Value:=edtImjyElementa.Text;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[3].Name:='PRIMITKA';
      qElementiVikonEdit.Params[3].Value:=edtPrimitka.Text;
      qElementiVikonEdit.Params.Add;
      qElementiVikonEdit.Params[4].Name:='RECORD_ID';
      qElementiVikonEdit.Params[4].Value:=edtRecordID.Text;;
      qElementiVikonEdit.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmElementiVikonEdit.Close;
    frmElementiVikon.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmElementiVikonEdit.aCancelExecute(Sender: TObject);
begin
  frmElementiVikonEdit.Close;
end;

end.
