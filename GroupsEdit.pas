unit GroupsEdit;

interface

uses
  Forms, Classes, ActnList, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Controls, ComCtrls, ExtCtrls, SysUtils, IniFiles;
//  Windows, Messages, Variants, Graphics, Dialogs;

type
  TfrmGroupsEdit = class(TForm)
    Label1: TLabel;
    edtRecord_ID: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtGroupName: TEdit;
    edtGroupDescription: TEdit;
    qGroupEdit: TIBQuery;
    Bevel2: TBevel;
    lvGroupMembers: TListView;
    btnAddGroup: TButton;
    btnAddUser: TButton;
    btnDelete: TButton;
    btnUpdate: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    alGroupsEdit: TActionList;
    aCancel: TAction;
    btnApply: TButton;
    aRecordIDUpdate: TAction;
    aAddGroup: TAction;
    aAddUser: TAction;
    aDeleteMember: TAction;
    aUpdateMember: TAction;
    aOK: TAction;
    aApply: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aUpdateMemberExecute(Sender: TObject);
    procedure edtGroupNameChange(Sender: TObject);
    procedure edtGroupDescriptionChange(Sender: TObject);
    procedure aApplyExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aAddGroupExecute(Sender: TObject);
    procedure aAddUserExecute(Sender: TObject);
    procedure aDeleteMemberExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGroupsEdit: TfrmGroupsEdit;

implementation

uses Main, Groups, AddMember;

{$R *.dfm}

procedure TfrmGroupsEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmGroupsEdit.aCancelExecute(Sender: TObject);
begin
  frmGroupsEdit.Close;
end;

procedure TfrmGroupsEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmGroupsEdit do
  begin
    qGroupEdit.SQL.Clear;
    qGroupEdit.SQL.Text:='insert into GROUPS (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qGroupEdit.Open;
    qGroupEdit.SQL.Clear;
    qGroupEdit.SQL.Text:='select * from GROUPS order by RECORD_ID';
    qGroupEdit.Open;
    qGroupEdit.Last;
    edtRecord_ID.Text:=IntToStr(qGroupEdit.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmGroupsEdit.aUpdateMemberExecute(Sender: TObject);
begin
   //показать группы
  with frmGroupsEdit do
  begin
    qGroupEdit.SQL.Clear;
    qGroupEdit.SQL.Text:='select * from GROUPS,GROUPMEMBERS where GROUPMEMBERS.CHILDTYPE=1 and GROUPMEMBERS.PARENTGROUP=:ParentGroup and GROUPS.RECORD_ID=GROUPMEMBERS.CHILDOBJECT order by GROUPS.GROUPNAME';
    qGroupEdit.Params.Clear;
    qGroupEdit.Params.Add;
    qGroupEdit.Params[0].Name:='ParentGroup';
    qGroupEdit.Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
    qGroupEdit.Open;
    lvGroupMembers.Items.BeginUpdate;
    lvGroupMembers.Items.Clear;
    qGroupEdit.First;
    while not qGroupEdit.Eof do
    begin
      with lvGroupMembers.Items.Add do if not qGroupEdit.FieldByName('GROUPNAME').IsNull then Caption:=qGroupEdit.FieldByName('GROUPNAME').Value;
      qGroupEdit.Next;
    end;
    lvGroupMembers.Items.EndUpdate;
  end;
  //показать пользователей
  with frmGroupsEdit do
  begin
    qGroupEdit.SQL.Clear;
    qGroupEdit.SQL.Text:='select * from USERS,GROUPMEMBERS where GROUPMEMBERS.CHILDTYPE=2 and GROUPMEMBERS.PARENTGROUP=:ParentGroup and USERS.RECORD_ID=GROUPMEMBERS.CHILDOBJECT order by USERS.LOGIN';
    qGroupEdit.Params.Clear;
    qGroupEdit.Params.Add;
    qGroupEdit.Params[0].Name:='ParentGroup';
    qGroupEdit.Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
    qGroupEdit.Open;
    lvGroupMembers.Items.BeginUpdate;
    qGroupEdit.First;
    while not qGroupEdit.Eof do
    begin
      with lvGroupMembers.Items.Add do if not qGroupEdit.FieldByName('LOGIN').IsNull then Caption:=qGroupEdit.FieldByName('LOGIN').Value;
      qGroupEdit.Next;
    end;
    lvGroupMembers.Items.EndUpdate;
  end;
end;

procedure TfrmGroupsEdit.edtGroupNameChange(Sender: TObject);
begin
  aApply.Enabled:=true;
end;

procedure TfrmGroupsEdit.edtGroupDescriptionChange(Sender: TObject);
begin
  aApply.Enabled:=true;
end;

procedure TfrmGroupsEdit.aApplyExecute(Sender: TObject);
begin
  if frmGroupsEdit.Caption='Вибрати групу' then
  begin
  end;

  if frmGroupsEdit.Caption='Видалити групу' then
  begin
    with frmGroupsEdit.qGroupEdit do
    begin
      SQL.Clear;
      SQL.Text:='delete from GROUPS where RECORD_ID=:Record_ID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Record_ID';
      Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmGroups.aUpdateExecute(sender);
    edtGroupName.ReadOnly:=true;
    edtGroupDescription.ReadOnly:=true;
    aApply.Enabled:=false;
    exit;
  end;

  if frmGroupsEdit.Caption='Редагувати групу' then
  begin
  end;

  if frmGroupsEdit.Caption='Додати групу' then
  begin
    if not frmGroupsEdit.aApply.Enabled then exit;
    if frmGroupsEdit.edtGroupName.ReadOnly then
    begin
      edtGroupName.ReadOnly:=false;
      edtGroupDescription.ReadOnly:=false;
      exit;
    end;
    with frmGroupsEdit do
    begin
      if edtRecord_ID.Text='' then
      begin
        edtGroupName.ReadOnly:=false;
        edtGroupDescription.ReadOnly:=false;
        aRecordIDUpdateExecute(sender);
        edtGroupName.SetFocus;
        exit;
      end;
      try
        StrToInt(edtRecord_ID.Text);
      except
        edtGroupName.ReadOnly:=false;
        edtGroupDescription.ReadOnly:=false;
        aRecordIDUpdateExecute(sender);
        edtGroupName.SetFocus;
        exit;
      end;
      if edtGroupName.Text='' then
      begin
        edtGroupName.ReadOnly:=false;
        edtGroupDescription.ReadOnly:=false;
        edtGroupName.SetFocus;
        exit;
      end;
      qGroupEdit.SQL.Clear;
      qGroupEdit.SQL.Text:='select * from GROUPS where GROUPNAME=:GroupName order by GROUPNAME';
      qGroupEdit.Params.Clear;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[0].Name:='GroupName';
      qGroupEdit.Params[0].Value:=edtGroupName.Text;
      qGroupEdit.Open;
      if qGroupEdit.Locate('GROUPNAME',edtGroupName.Text,[]) then
      begin
        edtGroupName.ReadOnly:=false;
        edtGroupDescription.ReadOnly:=false;
        edtGroupName.Text:='';
        edtGroupName.SetFocus;
        exit;
      end;
      qGroupEdit.SQL.Clear;
      qGroupEdit.SQL.Text:='update GROUPS set GROUPNAME=:GROUPNAME,GROUPDESCRIPTION=:GROUPDESCRIPTION where RECORD_ID=:Record_ID';
      qGroupEdit.Params.Clear;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[0].Name:='GROUPNAME';
      qGroupEdit.Params[0].Value:=edtGroupName.Text;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[1].Name:='GROUPDESCRIPTION';
      qGroupEdit.Params[1].Value:=edtGroupDescription.Text;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[2].Name:='RECORD_ID';
      qGroupEdit.Params[2].Value:=edtRecord_ID.Text;
      qGroupEdit.Open;
      frmMain.trAzz.CommitRetaining;
      frmGroups.aUpdateExecute(sender);
      edtGroupName.ReadOnly:=true;
      edtGroupDescription.ReadOnly:=true;
      aApply.Enabled:=false;
      frmGroupsEdit.Caption:='Редагувати групу';
      aAddGroup.Enabled:=true;
      aAddUser.Enabled:=true;
      aDeleteMember.Enabled:=true;
      aUpdateMember.Enabled:=true;
      exit;
    end;
  end;
end;

procedure TfrmGroupsEdit.aOKExecute(Sender: TObject);
begin
  frmGroupsEdit.aApplyExecute(sender);
  frmGroupsEdit.Close;
end;

procedure TfrmGroupsEdit.aAddGroupExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmAddMember') then frmAddMember:=TfrmAddMember.Create(self);
  frmGroupsEdit.Enabled:=false;
  with frmAddMember do
  begin
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    Caption:='Додати групу';
    DBGrid1.Columns[0].Visible:=true;
    DBGrid1.Columns[1].Visible:=false;
    Show;
    qAddMember.SQL.Clear;
    qAddMember.SQL.Text:='select * from GROUPS where RECORD_ID <> :Record_ID order by GROUPNAME';
    qAddMember.Params.Clear;
    qAddMember.Params.Add;
    qAddMember.Params[0].Name:='Record_ID';
    qAddMember.Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
    qAddMember.Open;
  end;
end;

procedure TfrmGroupsEdit.aAddUserExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if not frmMain.IsFormOpen('frmAddMember') then frmAddMember:=TfrmAddMember.Create(self);
  frmGroupsEdit.Enabled:=false;
  with frmAddMember do
  begin
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    Caption:='Додати користувача';
    DBGrid1.Columns[0].Visible:=false;
    DBGrid1.Columns[1].Visible:=true;
    cbAllUsers.Visible:=true;
    Show;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    Ministry:=INIAZZ.ReadInteger('Teritory','Ministry',Ministry);
    Teritory:=INIAZZ.ReadInteger('Teritory','Teritory',Teritory);
    District:=INIAZZ.ReadInteger('Teritory','District',District);
    INIAZZ.Free;
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

procedure TfrmGroupsEdit.aDeleteMemberExecute(Sender: TObject);
var
  RecordID: integer;
begin
  if frmGroupsEdit.lvGroupMembers.Items.Count<=0 then exit;
  try
    frmGroupsEdit.lvGroupMembers.ItemFocused.Selected;
  except
    frmGroupsEdit.aUpdateMemberExecute(sender);
    exit;
  end;
  with frmGroupsEdit do
  begin
    //поиск среди групп
    qGroupEdit.SQL.Clear;
    qGroupEdit.SQL.Text:='select * from GROUPS where GROUPNAME=:GroupName order by GROUPNAME';
    qGroupEdit.Params.Clear;
    qGroupEdit.Params.Add;
    qGroupEdit.Params[0].Name:='GroupName';
    qGroupEdit.Params[0].Value:=lvGroupMembers.ItemFocused.Caption;
    qGroupEdit.Open;
    if qGroupEdit.Locate('GROUPNAME',lvGroupMembers.ItemFocused.Caption,[]) then
    begin
      RecordID:=qGroupEdit.FieldByName('RECORD_ID').Value;
      qGroupEdit.SQL.Clear;
      qGroupEdit.SQL.Text:='delete from GROUPMEMBERS where PARENTGROUP=:ParentGroup and CHILDOBJECT=:ChildObject and CHILDTYPE=1';
      qGroupEdit.Params.Clear;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[0].Name:='ParentGroup';
      qGroupEdit.Params[0].Value:=StrToInt(frmGroupsEdit.edtRecord_ID.Text);
      qGroupEdit.Params.Add;
      qGroupEdit.Params[1].Name:='ChildObject';
      qGroupEdit.Params[1].Value:=RecordID;
      qGroupEdit.Open;
      frmMain.trAzz.CommitRetaining;
      aUpdateMemberExecute(sender);
      exit;
    end;
    //поиск среди пользователей
    qGroupEdit.SQL.Clear;
    qGroupEdit.SQL.Text:='select * from USERS where LOGIN=:Login order by LOGIN';
    qGroupEdit.Params.Clear;
    qGroupEdit.Params.Add;
    qGroupEdit.Params[0].Name:='Login';
    qGroupEdit.Params[0].Value:=lvGroupMembers.ItemFocused.Caption;
    qGroupEdit.Open;
    if qGroupEdit.Locate('LOGIN',lvGroupMembers.ItemFocused.Caption,[]) then
    begin
      RecordID:=qGroupEdit.FieldByName('RECORD_ID').Value;
      qGroupEdit.SQL.Clear;
      qGroupEdit.SQL.Text:='delete from GROUPMEMBERS where PARENTGROUP=:ParentGroup and CHILDOBJECT=:ChileObject and CHILDTYPE=2';
      qGroupEdit.Params.Clear;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[0].Name:='ParentGroup';
      qGroupEdit.Params[0].Value:=frmGroupsEdit.edtRecord_ID.Text;
      qGroupEdit.Params.Add;
      qGroupEdit.Params[1].Name:='ChileObject';
      qGroupEdit.Params[1].Value:=RecordID;
      qGroupEdit.Open;
      frmMain.trAzz.CommitRetaining;
      aUpdateMemberExecute(sender);
      exit;
    end;
  end;
end;

end.
