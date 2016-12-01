unit ViknaEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, SysUtils, Dialogs;
//  Windows, Messages, Variants, Classes, Graphics, Controls;

type
  TfrmViknaEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtRecord_ID: TEdit;
    edtNazvaVikna: TEdit;
    edtFormName: TEdit;
    edtPrimitka: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    alViknaEdit: TActionList;
    aRecordID_Update: TAction;
    aOK: TAction;
    aCancel: TAction;
    qViknaEdit: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordID_UpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViknaEdit: TfrmViknaEdit;

implementation

uses Main, Vikna, ElementiVikonEdit;

{$R *.dfm}

procedure TfrmViknaEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmElementiVikonEdit') then
  begin
    frmVikna.Enabled:=true;
    frmElementiVikonEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmElementiVikonEdit.Caption<>'Вибрати елемент керування' then
    begin
    frmVikna.Enabled:=true;
    frmElementiVikonEdit.Enabled:=false;
    end
    else
      frmVikna.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmViknaEdit.aRecordID_UpdateExecute(Sender: TObject);
begin
  with frmViknaEdit do
  begin
    qViknaEdit.SQL.Clear;
    qViknaEdit.SQL.Text:='insert into VIKNA (RECORD_ID) values(gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qViknaEdit.Open;
    qViknaEdit.SQL.Clear;
    qViknaEdit.SQL.Text:='select * from VIKNA order by RECORD_ID';
    qViknaEdit.Open;
    qViknaEdit.Last;
    edtRecord_ID.Text:=IntToStr(qViknaEdit.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmViknaEdit.aCancelExecute(Sender: TObject);
begin
  frmViknaEdit.Close;
end;

procedure TfrmViknaEdit.aOKExecute(Sender: TObject);
begin
  if frmViknaEdit.Caption='Вибрати вікно' then
  begin
    if frmMain.IsFormOpen('frmElementiVikonEdit') then
    begin
      frmElementiVikonEdit.cbVikno.Text:=frmViknaEdit.edtNazvaVikna.Text;
      frmViknaEdit.Close;
      frmVikna.Close;
      exit;
    end;
  end;

  if frmViknaEdit.Caption='Видалити вікно' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису відобразиться на правах користувачів!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
    with frmViknaEdit do
    begin
      qViknaEdit.SQL.Clear;
      qViknaEdit.SQL.Text:='delete from VIKNA where RECORD_ID=:RECORD_ID';
//      qViknaEdit.SQL.Text:='delete from VIKNA where RECORD_ID='+edtRecord_ID.Text;
      qViknaEdit.Params.Clear;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[0].Name:='RECORD_ID';
      qViknaEdit.Params[0].Value:=edtRecord_ID.Text;
      qViknaEdit.Open;
    end;
    end;
    frmMain.trAzz.CommitRetaining;
    frmViknaEdit.Close;
    frmVikna.aUpdateExecute(sender);
    exit;
  end;

  if frmViknaEdit.Caption='Змінити вікно' then
  begin
    if edtRecord_ID.Text='' then
    begin
      aRecordID_UpdateExecute(sender);
      edtNazvaVikna.SetFocus;
      exit;
    end;
    try
      StrToInt(edtRecord_ID.Text);
    except
      aRecordID_UpdateExecute(sender);
      edtNazvaVikna.SetFocus;
      exit;
    end;
    if edtNazvaVikna.Text='' then
    begin
      edtNazvaVikna.SetFocus;
      exit;
    end;
    if edtFormName.Text='' then
    begin
      edtFormName.SetFocus;
      exit;
    end;
    with frmViknaEdit do
    begin
      qViknaEdit.SQL.Clear;
      qViknaEdit.SQL.Text:='update VIKNA set NAZVAVIKNA=:NAZVAVIKNA,FORMNAME=:FORMNAME,PRIMITKA=:PRIMITKA where RECORD_ID=:RECORD_ID';
      qViknaEdit.Params.Clear;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[0].Name:='NAZVAVIKNA';
      qViknaEdit.Params[0].Value:=edtNazvaVikna.Text;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[1].Name:='FORMNAME';
      qViknaEdit.Params[1].Value:=edtFormName.Text;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[2].Name:='PRIMITKA';
      qViknaEdit.Params[2].Value:=edtPrimitka.Text;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[3].Name:='RECORD_ID';
      qViknaEdit.Params[3].Value:=edtRecord_ID.Text;
      qViknaEdit.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmViknaEdit.Close;
    frmVikna.aUpdateExecute(sender);
    exit;
  end;

  if frmViknaEdit.Caption='Додати вікно' then
  begin
    if edtRecord_ID.Text='' then
    begin
      aRecordID_UpdateExecute(sender);
      edtNazvaVikna.SetFocus;
      exit;
    end;
    try
      StrToInt(edtRecord_ID.Text);
    except
      aRecordID_UpdateExecute(sender);
      edtNazvaVikna.SetFocus;
      exit;
    end;
    if edtNazvaVikna.Text='' then
    begin
      edtNazvaVikna.SetFocus;
      exit;
    end;
    if edtFormName.Text='' then
    begin
      edtFormName.SetFocus;
      exit;
    end;
    with frmViknaEdit do
    begin
      qViknaEdit.SQL.Clear;
      qViknaEdit.SQL.Text:='update VIKNA set NAZVAVIKNA=:NAZVAVIKNA,FORMNAME=:FORMNAME,PRIMITKA=:PRIMITKA where RECORD_ID=:RECORD_ID';
      qViknaEdit.Params.Clear;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[0].Name:='NAZVAVIKNA';
      qViknaEdit.Params[0].Value:=edtNazvaVikna.Text;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[1].Name:='FORMNAME';
      qViknaEdit.Params[1].Value:=edtFormName.Text;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[2].Name:='PRIMITKA';
      qViknaEdit.Params[2].Value:=edtPrimitka.Text;
      qViknaEdit.Params.Add;
      qViknaEdit.Params[3].Name:='RECORD_ID';
      qViknaEdit.Params[3].Value:=edtRecord_ID.Text;
      qViknaEdit.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmViknaEdit.Close;
    frmVikna.aUpdateExecute(sender);
    exit;
  end;
end;

end.
