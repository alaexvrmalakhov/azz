unit VirobnikiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, SysUtils, Dialogs;

type
  TfrmVirobnikiEdit = class(TForm)
    Label1: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    Label2: TLabel;
    edtVirobnik: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alVirobnikiEdit: TActionList;
    aKodUpdate: TAction;
    qRecordID: TIBQuery;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmVirobnikiEdit: TfrmVirobnikiEdit;

implementation

uses
  Main, Virobniki, VidomostiProFinansovu, VidomostiProViluchenny;

{$R *.dfm}

procedure TfrmVirobnikiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmVidomostiProFinansovu') then
  begin
    frmVirobniki.Enabled:=true;
    if frmVirobnikiEdit.Caption<>'���� ���������' then
    begin
      frmVirobniki.Enabled:=true;
      frmVidomostiProFinansovu.Enabled:=false;
    end
    else
      frmVirobniki.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmVidomostiProViluchenny') then
  begin
    frmVirobniki.Enabled:=true;
    if frmVirobnikiEdit.Caption<>'���� ���������' then
    begin
      frmVirobniki.Enabled:=true;
      frmVidomostiProViluchenny.Enabled:=false;
    end
    else
      frmVirobniki.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVirobnikiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmVirobnikiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='insert into VIROBNIKI (KOD_VIROBNIKA) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qRecordID.Open;
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from VIROBNIKI order by KOD_VIROBNIKA';
    qRecordID.Open;
    qRecordID.Last;
    edtKod.Text:=IntToStr(qRecordID.FieldByName('KOD_VIROBNIKA').Value);
  end;
end;

procedure TfrmVirobnikiEdit.aOKExecute(Sender: TObject);
begin
  if frmVirobnikiEdit.Caption='���� ���������' then
  begin
    if frmMain.IsFormOpen('frmVidomostiProFinansovu') then
    begin
      frmVidomostiProFinansovu.cbVirobnik.Text:=frmVirobnikiEdit.edtVirobnik.Text;
      frmVirobnikiEdit.Close;
      frmVirobniki.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmVidomostiProViluchenny') then
    begin
      frmVidomostiProViluchenny.cbVirobnik.Text:=frmVirobnikiEdit.edtVirobnik.Text;
      frmVirobnikiEdit.Close;
      frmVirobniki.Close;
      exit;
    end;
  end;  //���� ���������

  if frmVirobnikiEdit.Caption='��������� ���������' then
  begin
    if MessageDlg('�����!!!'+#13+'��������� ����� ������ ���� ������������ �� ����� ���������!!!'+#13+'�� ����� ������ �������� ��� �����?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmVirobniki.qVirobniki.SQL.Clear;
      frmVirobniki.qVirobniki.SQL.Text:='delete from VIROBNIKI where KOD_VIROBNIKA=:Kod';
      frmVirobniki.qVirobniki.Params.Clear;
      frmVirobniki.qVirobniki.Params.Add;
      frmVirobniki.qVirobniki.Params[0].Name:='Kod';
      frmVirobniki.qVirobniki.Params[0].Value:=frmVirobnikiEdit.edtKod.Text;
      frmVirobniki.qVirobniki.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVirobnikiEdit.Close;
    frmVirobniki.aUpdateExecute(sender);
    exit;
  end;  //��������� ���������

  if frmVirobnikiEdit.Caption='����������� ���������' then
  begin
    if frmVirobnikiEdit.edtKod.Text='' then
    begin
      frmVirobnikiEdit.edtKod.SetFocus;
      frmVirobnikiEdit.aKodUpdateExecute(sender);
      frmVirobnikiEdit.edtVirobnik.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVirobnikiEdit.edtKod.Text);
    except
      frmVirobnikiEdit.edtKod.SetFocus;
      frmVirobnikiEdit.aKodUpdateExecute(sender);
      frmVirobnikiEdit.edtVirobnik.SetFocus;
      exit;
    end;
    if frmVirobnikiEdit.edtVirobnik.Text='' then
    begin
      frmVirobnikiEdit.edtVirobnik.SetFocus;
      exit;
    end;
    frmVirobniki.qVirobniki.SQL.Clear;
    frmVirobniki.qVirobniki.SQL.Text:='update VIROBNIKI set NAZVA_VIROBNIKA=:NAZVA_VIROBNIKA where KOD_VIROBNIKA=:KOD_VIROBNIKA';
    frmVirobniki.qVirobniki.Params.Clear;
    frmVirobniki.qVirobniki.Params.Add;
    frmVirobniki.qVirobniki.Params[0].Name:='NAZVA_VIROBNIKA';
    frmVirobniki.qVirobniki.Params[0].Value:=frmVirobnikiEdit.edtVirobnik.Text;
    frmVirobniki.qVirobniki.Params.Add;
    frmVirobniki.qVirobniki.Params[1].Name:='KOD_VIROBNIKA';
    frmVirobniki.qVirobniki.Params[1].Value:=frmVirobnikiEdit.edtKod.Text;
    frmVirobniki.qVirobniki.Open;
    frmMain.trAzz.CommitRetaining;
    frmVirobnikiEdit.Close;
    frmVirobniki.aUpdateExecute(sender);
    exit;
  end;  //����������� ���������

  if frmVirobnikiEdit.Caption='��������� ���������' then
  begin
    if frmVirobnikiEdit.edtKod.Text='' then
    begin
      frmVirobnikiEdit.edtKod.SetFocus;
      frmVirobnikiEdit.aKodUpdateExecute(sender);
      frmVirobnikiEdit.edtVirobnik.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVirobnikiEdit.edtKod.Text);
    except
      frmVirobnikiEdit.edtKod.SetFocus;
      frmVirobnikiEdit.aKodUpdateExecute(sender);
      frmVirobnikiEdit.edtVirobnik.SetFocus;
      exit;
    end;
    if frmVirobnikiEdit.edtVirobnik.Text='' then
    begin
      frmVirobnikiEdit.edtVirobnik.SetFocus;
      exit;
    end;
    frmVirobniki.qVirobniki.SQL.Clear;
    frmVirobniki.qVirobniki.SQL.Text:='update VIROBNIKI set NAZVA_VIROBNIKA=:NAZVA_VIROBNIKA where KOD_VIROBNIKA=:KOD_VIROBNIKA';
    frmVirobniki.qVirobniki.Params.Clear;
    frmVirobniki.qVirobniki.Params.Add;
    frmVirobniki.qVirobniki.Params[0].Name:='NAZVA_VIROBNIKA';
    frmVirobniki.qVirobniki.Params[0].Value:=frmVirobnikiEdit.edtVirobnik.Text;
    frmVirobniki.qVirobniki.Params.Add;
    frmVirobniki.qVirobniki.Params[1].Name:='KOD_VIROBNIKA';
    frmVirobniki.qVirobniki.Params[1].Value:=frmVirobnikiEdit.edtKod.Text;
    frmVirobniki.qVirobniki.Open;
    frmMain.trAzz.CommitRetaining;
    frmVirobnikiEdit.Close;
    frmVirobniki.aUpdateExecute(sender);
    exit;
  end;  //��������� ���������
end;

procedure TfrmVirobnikiEdit.aCancelExecute(Sender: TObject);
begin
  frmVirobnikiEdit.Close;
end;

end.
