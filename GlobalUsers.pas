unit GlobalUsers;

interface

uses
  Forms, Menus, Classes, ActnList, StdCtrls, Controls, ExtCtrls, ComCtrls;

type
  TfrmGlobalUsers = class(TForm)
    lvUsers: TListView;
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    alGlobalUsers: TActionList;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
  public
    procedure DisplayUser(UserName: String);
  end;

var
  frmGlobalUsers: TfrmGlobalUsers;

implementation

uses
  Main, GlobalUsersEdit;

{$R *.dfm}

procedure TfrmGlobalUsers.DisplayUser(UserName: string);
begin
  frmMain.ssUsers.Params.Clear;
  frmMain.ssUsers.Params.Text:=frmMain.dbAzz.Params.Text;
  frmMain.ssUsers.Active:=true;
  frmGlobalUsersEdit.edtPassword.PasswordChar:='*';
  frmGlobalUsersEdit.edtConfirmPassword.PasswordChar:='*';
  try
    if UserName<>'' then
    begin
      frmMain.ssUsers.DisplayUser(UserName);
      frmGlobalUsersEdit.edtLogin.Text:=frmMain.ssUsers.UserInfo[0].UserName;
      frmGlobalUsersEdit.edtLogin.ReadOnly:=true;
      frmGlobalUsersEdit.edtPassword.Text:='';
      frmGlobalUsersEdit.edtConfirmPassword.Text:='';
      frmGlobalUsersEdit.edtPrizvische.Text:=frmMain.ssUsers.UserInfo[0].LastName;
      frmGlobalUsersEdit.edtImjy.Text:=frmMain.ssUsers.UserInfo[0].FirstName;
      frmGlobalUsersEdit.edtPoBatkovi.Text:=frmMain.ssUsers.UserInfo[0].MiddleName;
    end
    else
    begin
      frmMain.ssUsers.DisplayUser(UserName);
      frmGlobalUsersEdit.edtLogin.Text:='';
      frmGlobalUsersEdit.edtLogin.ReadOnly:=false;
      frmGlobalUsersEdit.edtPassword.Text:='';
      frmGlobalUsersEdit.edtConfirmPassword.Text:='';
      frmGlobalUsersEdit.edtPrizvische.Text:='';
      frmGlobalUsersEdit.edtImjy.Text:='';
      frmGlobalUsersEdit.edtPoBatkovi.Text:='';
    end;
  finally
    frmMain.ssUsers.Active:=false;
  end;
end;

procedure TfrmGlobalUsers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmGlobalUsers.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGlobalUsersEdit') then frmGlobalUsersEdit:=TfrmGlobalUsersEdit.Create(self);
  frmMain.Enabled:=false;
  frmGlobalUsersEdit.Show;
  frmGlobalUsersEdit.BorderStyle:=bsDialog;
  frmGlobalUsersEdit.Position:=poMainFormCenter;
  frmGlobalUsersEdit.Caption:='Додавання користувача';
  DisplayUser('');
end;

procedure TfrmGlobalUsers.aEditExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGlobalUsersEdit') then frmGlobalUsersEdit:=TfrmGlobalUsersEdit.Create(self);
  frmMain.Enabled:=false;
  frmGlobalUsersEdit.Show;
  frmGlobalUsersEdit.BorderStyle:=bsDialog;
  frmGlobalUsersEdit.Position:=poMainFormCenter;
  frmGlobalUsersEdit.Caption:='Редагування відомостей про користувача';
  DisplayUser(frmGlobalUsers.lvUsers.Selected.Caption);
end;

procedure TfrmGlobalUsers.aDeleteExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGlobalUsersEdit') then frmGlobalUsersEdit:=TfrmGlobalUsersEdit.Create(self);
  frmMain.Enabled:=false;
  frmGlobalUsersEdit.Show;
  frmGlobalUsersEdit.BorderStyle:=bsDialog;
  frmGlobalUsersEdit.Position:=poMainFormCenter;
  frmGlobalUsersEdit.Caption:='Видалення користувача';
  DisplayUser(frmGlobalUsers.lvUsers.Selected.Caption);
end;

procedure TfrmGlobalUsers.aChoiceExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGlobalUsersEdit') then frmGlobalUsersEdit:=TfrmGlobalUsersEdit.Create(self);
  frmMain.Enabled:=false;
  frmGlobalUsersEdit.Show;
  frmGlobalUsersEdit.BorderStyle:=bsDialog;
  frmGlobalUsersEdit.Position:=poMainFormCenter;
  frmGlobalUsersEdit.Caption:='Вибір користувача';
  DisplayUser(frmGlobalUsers.lvUsers.Selected.Caption);
end;

procedure TfrmGlobalUsers.aUpdateExecute(Sender: TObject);
var
  i: integer;
begin
  with frmMain.ssUsers do
  begin
    try
      Params.Clear;
      Params.Text:=frmMain.dbAzz.Params.Text;
      Active:=true;
      DisplayUsers;
      frmGlobalUsers.lvUsers.Items.BeginUpdate;
      frmGlobalUsers.lvUsers.Items.Clear;
      for i:=0 to UserInfoCount-1 do
      begin
        with UserInfo[i] do
        begin
          with frmGlobalUsers.lvUsers.Items.Add do
          begin
            Caption:=UserName;
            SubItems.Add(FirstName+' '+MiddleName+' '+LastName);
          end;
        end;
      end;
    finally
      frmGlobalUsers.lvUsers.Items.EndUpdate;
      Active:=false;
    end;
  end;
end;

procedure TfrmGlobalUsers.aCloseExecute(Sender: TObject);
begin
  frmGlobalUsers.Close;
end;

end.
