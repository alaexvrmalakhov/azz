unit Groups;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, Controls,
  ComCtrls, StdCtrls, ExtCtrls, SysUtils;
//  , Windows, Messages, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmGroups = class(TForm)
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    alGroups: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    lvGroups: TListView;
    qGroups: TIBQuery;
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
  frmGroups: TfrmGroups;

implementation

uses Main, GroupsEdit;

{$R *.dfm}

procedure TfrmGroups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmGroups.aCloseExecute(Sender: TObject);
begin
  frmGroups.Close;
end;

procedure TfrmGroups.aUpdateExecute(Sender: TObject);
begin
  with frmGroups do
  begin
    qGroups.SQL.Clear;
    qGroups.SQL.Text:='select * from GROUPS order by GROUPNAME';
    qGroups.Open;
    lvGroups.Items.BeginUpdate;
    lvGroups.Items.Clear;
    qGroups.First;
    while not qGroups.Eof do
    begin
      with lvGroups.Items.Add do if not qGroups.FieldByName('GROUPNAME').IsNull then Caption:=qGroups.FieldByName('GROUPNAME').Value;
      qGroups.Next;
    end;
    lvGroups.Items.EndUpdate;
  end;
end;

procedure TfrmGroups.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGroupsEdit') then frmGroupsEdit:=TfrmGroupsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmGroupsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додати групу';
    Show;
    edtRecord_ID.Text:='';
    edtRecord_ID.Enabled:=false;
    aRecordIDUpdateExecute(sender);
    edtGroupName.Text:='';
    edtGroupName.ReadOnly:=false;
    edtGroupName.Enabled:=true;
    edtGroupDescription.Text:='';
    edtGroupDescription.ReadOnly:=false;
    edtGroupDescription.Enabled:=true;
    aAddGroup.Enabled:=false;
    aAddUser.Enabled:=false;
    aDeleteMember.Enabled:=false;
    aUpdateMember.Enabled:=true;
    aUpdateMemberExecute(sender);
    aOK.Enabled:=true;
    aCancel.Enabled:=true;
    aApply.Enabled:=false;
    edtGroupName.SetFocus;
  end;
end;

procedure TfrmGroups.aEditExecute(Sender: TObject);
begin
  if frmGroups.lvGroups.Items.Count<=0 then exit;
  try
    frmGroups.lvGroups.ItemFocused.Selected
  except
    frmGroups.aUpdateExecute(sender);
    exit;
  end;
  if not frmMain.IsFormOpen('frmGroupsEdit') then frmGroupsEdit:=TfrmGroupsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmGroupsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Редагувати групу';
    Show;
    frmGroups.qGroups.SQL.Clear;
    frmGroups.qGroups.SQL.Text:='select * from GROUPS where GROUPNAME=:GroupName order by GROUPNAME';
    frmGroups.qGroups.Params.Clear;
    frmGroups.qGroups.Params.Add;
    frmGroups.qGroups.Params[0].Name:='GroupName';
    frmGroups.qGroups.Params[0].Value:=frmGroups.lvGroups.Selected.Caption;
    frmGroups.qGroups.Open;
    if frmGroups.qGroups.Locate('GROUPNAME',frmGroups.lvGroups.Selected.Caption,[]) then
    begin
      if not frmGroups.qGroups.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmGroups.qGroups.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
      edtRecord_ID.Enabled:=false;
      if not frmGroups.qGroups.FieldByName('GROUPNAME').IsNull then edtGroupName.Text:=frmGroups.qGroups.FieldByName('GROUPNAME').Value else edtGroupName.Text:='';
      edtGroupName.ReadOnly:=true;
      edtGroupName.Enabled:=true;
      if not frmGroups.qGroups.FieldByName('GROUPDESCRIPTION').IsNull then edtGroupDescription.Text:=frmGroups.qGroups.FieldByName('GROUPDESCRIPTION').Value else edtGroupDescription.Text:='';
      edtGroupDescription.ReadOnly:=true;
      edtGroupDescription.Enabled:=true;
      aAddGroup.Enabled:=true;
      aAddUser.Enabled:=true;
      aDeleteMember.Enabled:=true;
      aUpdateMember.Enabled:=true;
      aUpdateMemberExecute(sender);
      aOK.Enabled:=true;
      aCancel.Enabled:=true;
      aApply.Enabled:=false;
      edtGroupName.SetFocus;
    end;
  end;
end;

procedure TfrmGroups.aDeleteExecute(Sender: TObject);
begin
  if frmGroups.lvGroups.Items.Count<=0 then exit;
  try
    frmGroups.lvGroups.ItemFocused.Selected
  except
    frmGroups.aUpdateExecute(sender);
    exit;
  end;
  if not frmMain.IsFormOpen('frmGroupsEdit') then frmGroupsEdit:=TfrmGroupsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmGroupsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалити групу';
    Show;
    frmGroups.qGroups.SQL.Clear;
    frmGroups.qGroups.SQL.Text:='select * from GROUPS where GROUPNAME=:GroupName order by GROUPNAME';
    frmGroups.qGroups.Params.Clear;
    frmGroups.qGroups.Params.Add;
    frmGroups.qGroups.Params[0].Name:='GroupName';
    frmGroups.qGroups.Params[0].Value:=frmGroups.lvGroups.Selected.Caption;
    frmGroups.qGroups.Open;
    if frmGroups.qGroups.Locate('GROUPNAME',frmGroups.lvGroups.Selected.Caption,[]) then
    begin
      if not frmGroups.qGroups.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmGroups.qGroups.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
      edtRecord_ID.Enabled:=false;
      if not frmGroups.qGroups.FieldByName('GROUPNAME').IsNull then edtGroupName.Text:=frmGroups.qGroups.FieldByName('GROUPNAME').Value else edtGroupName.Text:='';
      edtGroupName.ReadOnly:=false;
      edtGroupName.Enabled:=false;
      if not frmGroups.qGroups.FieldByName('GROUPDESCRIPTION').IsNull then edtGroupDescription.Text:=frmGroups.qGroups.FieldByName('GROUPDESCRIPTION').Value else edtGroupDescription.Text:='';
      edtGroupDescription.ReadOnly:=false;
      edtGroupDescription.Enabled:=false;
      aAddGroup.Enabled:=false;
      aAddUser.Enabled:=false;
      aDeleteMember.Enabled:=false;
      aUpdateMember.Enabled:=true;
      aUpdateMemberExecute(sender);
      aOK.Enabled:=true;
      aCancel.Enabled:=true;
      aApply.Enabled:=false;
      btnCancel.SetFocus;
    end;
  end;
end;

procedure TfrmGroups.aChoiceExecute(Sender: TObject);
begin
  if frmGroups.lvGroups.Items.Count<=0 then exit;
  try
    frmGroups.lvGroups.ItemFocused.Selected
  except
    frmGroups.aUpdateExecute(sender);
    exit;
  end;
  if not frmMain.IsFormOpen('frmGroupsEdit') then frmGroupsEdit:=TfrmGroupsEdit.Create(self);
  frmMain.Enabled:=false;
  with frmGroupsEdit do
  begin
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибрати групу';
    Show;
    frmGroups.qGroups.SQL.Clear;
    frmGroups.qGroups.SQL.Text:='select * from GROUPS where GROUPNAME=:GroupName order by GROUPNAME';
    frmGroups.qGroups.Params.Clear;
    frmGroups.qGroups.Params.Add;
    frmGroups.qGroups.Params[0].Name:='GroupName';
    frmGroups.qGroups.Params[0].Value:=frmGroups.lvGroups.Selected.Caption;
    frmGroups.qGroups.Open;
    if frmGroups.qGroups.Locate('GROUPNAME',frmGroups.lvGroups.Selected.Caption,[]) then
    begin
      if not frmGroups.qGroups.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(frmGroups.qGroups.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
      edtRecord_ID.Enabled:=false;
      if not frmGroups.qGroups.FieldByName('GROUPNAME').IsNull then edtGroupName.Text:=frmGroups.qGroups.FieldByName('GROUPNAME').Value else edtGroupName.Text:='';
      edtGroupName.ReadOnly:=false;
      edtGroupName.Enabled:=false;
      if not frmGroups.qGroups.FieldByName('GROUPDESCRIPTION').IsNull then edtGroupDescription.Text:=frmGroups.qGroups.FieldByName('GROUPDESCRIPTION').Value else edtGroupDescription.Text:='';
      edtGroupDescription.ReadOnly:=false;
      edtGroupDescription.Enabled:=false;
      aAddGroup.Enabled:=false;
      aAddUser.Enabled:=false;
      aDeleteMember.Enabled:=false;
      aUpdateMember.Enabled:=true;
      aUpdateMemberExecute(sender);
      aOK.Enabled:=true;
      aCancel.Enabled:=true;
      aApply.Enabled:=false;
      btnOK.SetFocus;
    end;
  end;
end;

end.
