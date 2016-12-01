unit AddMember;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls, Grids,
  DBGrids, StdCtrls, ExtCtrls, SysUtils, IniFiles;
//  Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmAddMember = class(TForm)
    Bevel1: TBevel;
    btnOK: TButton;
    btnCancel: TButton;
    alAddMember: TActionList;
    qAddMember: TIBQuery;
    DBGrid1: TDBGrid;
    dsAddMember: TDataSource;
    aOK: TAction;
    aCancel: TAction;
    cbAllUsers: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure cbAllUsersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddMember: TfrmAddMember;

implementation

uses GroupsEdit, Main;

{$R *.dfm}

procedure TfrmAddMember.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmAddMember.cbAllUsers.Visible:=false;
  frmGroupsEdit.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmAddMember.aCancelExecute(Sender: TObject);
begin
  frmAddMember.Close;
end;

procedure TfrmAddMember.aOKExecute(Sender: TObject);
begin
  if frmAddMember.Caption='Додати користувача' then
  begin
    frmGroupsEdit.qGroupEdit.SQL.Clear;
    frmGroupsEdit.qGroupEdit.SQL.Text:='select * from GROUPMEMBERS where CHILDTYPE=2 and CHILDOBJECT=:ChildObject order by CHILDOBJECT';
    frmGroupsEdit.qGroupEdit.Params.Clear;
    frmGroupsEdit.qGroupEdit.Params.Add;
    frmGroupsEdit.qGroupEdit.Params[0].Name:='ChildObject';
    frmGroupsEdit.qGroupEdit.Params[0].Value:=frmAddMember.qAddMember.FieldByName('RECORD_ID').Value;
    frmGroupsEdit.qGroupEdit.Open;
    if frmGroupsEdit.qGroupEdit.Locate('CHILDOBJECT',frmAddMember.qAddMember.FieldByName('RECORD_ID').Value,[]) then
    begin
      frmAddMember.cbAllUsersClick(sender);
      exit;
    end;

    with frmGroupsEdit.qGroupEdit do
    begin
      SQL.Clear;
      SQL.Text:='insert into GROUPMEMBERS (RECORD_ID,PARENTGROUP,CHILDOBJECT,CHILDTYPE) values (gen_id(GET_DICTIONARIES_RECORD_ID,1),:PARENTGROUP,:CHILDOBJECT,:CHILDTYPE)';
      Params.Clear;
      Params.Add;
      Params[0].Name:='PARENTGROUP';
      Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
      Params.Add;
      Params[1].Name:='CHILDOBJECT';
      Params[1].Value:=frmAddMember.qAddMember.FieldByName('RECORD_ID').Value;
      Params.Add;
      Params[2].Name:='CHILDTYPE';
      Params[2].Value:=2;
      Open;
    end;

    frmMain.trAzz.CommitRetaining;
    frmAddMember.Close;
    frmGroupsEdit.aUpdateMemberExecute(sender);
    exit;
  end;

  if frmAddMember.Caption='Додати групу' then
  begin
    frmGroupsEdit.qGroupEdit.SQL.Clear;
    frmGroupsEdit.qGroupEdit.SQL.Text:='select * from GROUPMEMBERS where CHILDTYPE=1 and CHILDOBJECT=:ChildObject order by CHILDOBJECT';
    frmGroupsEdit.qGroupEdit.Params.Clear;
    frmGroupsEdit.qGroupEdit.Params.Add;
    frmGroupsEdit.qGroupEdit.Params[0].Name:='ChildObject';
    frmGroupsEdit.qGroupEdit.Params[0].Value:=frmAddMember.qAddMember.FieldByName('RECORD_ID').Value;
    frmGroupsEdit.qGroupEdit.Open;
    if frmGroupsEdit.qGroupEdit.Locate('CHILDOBJECT',frmAddMember.qAddMember.FieldByName('RECORD_ID').Value,[]) then
    begin
      qAddMember.SQL.Clear;
      qAddMember.SQL.Text:='select * from GROUPS where RECORD_ID <> :Record_ID order by GROUPNAME';
      qAddMember.Params.Clear;
      qAddMember.Params.Add;
      qAddMember.Params[0].Name:='Record_ID';
      qAddMember.Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
      qAddMember.Open;
      exit;
    end;
    with frmGroupsEdit.qGroupEdit do
    begin
      SQL.Clear;
      SQL.Text:='insert into GROUPMEMBERS (RECORD_ID,PARENTGROUP,CHILDOBJECT,CHILDTYPE) values (gen_id(GET_DICTIONARIES_RECORD_ID,1),:PARENTGROUP,:CHILDOBJECT,:CHILDTYPE)';
      Params.Clear;
      Params.Add;
      Params[0].Name:='PARENTGROUP';
      Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
      Params.Add;
      Params[1].Name:='CHILDOBJECT';
      Params[1].Value:=frmAddMember.qAddMember.FieldByName('RECORD_ID').Value;
      Params.Add;
      Params[2].Name:='CHILDTYPE';
      Params[2].Value:=1;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmAddMember.Close;
    frmGroupsEdit.aUpdateMemberExecute(sender);
    exit;
  end;
end;

procedure TfrmAddMember.cbAllUsersClick(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if frmAddMember.cbAllUsers.Checked then
  begin
    with frmAddMember do
    begin
      qAddMember.SQL.Clear;
      qAddMember.SQL.Text:='select * from USERS order by LOGIN';
      qAddMember.Open;
    end;
  end
  else
  begin
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    Ministry:=INIAZZ.ReadInteger('Teritory','Ministry',Ministry);
    Teritory:=INIAZZ.ReadInteger('Teritory','Teritory',Teritory);
    District:=INIAZZ.ReadInteger('Teritory','District',District);
    INIAZZ.Free;
    with frmAddMember do
    begin
      qAddMember.SQL.Clear;
      qAddMember.SQL.Text:='select * from USERS where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:District order by LOGIN';
      qAddMember.Params.Clear;
      qAddMember.Params.Add;
      qAddMember.Params[0].Name:='Ministry';
      qAddMember.Params[0].Value:=Ministry;
      qAddMember.Params.Add;
      qAddMember.Params[1].Name:='Teritory';
      qAddMember.Params[1].Value:=Teritory;
      qAddMember.Params.Add;
      qAddMember.Params[2].Name:='District';
      qAddMember.Params[2].Value:=District;
      qAddMember.Open;
    end;
  end;
end;

end.
