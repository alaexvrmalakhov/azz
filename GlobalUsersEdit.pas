unit GlobalUsersEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, ExtCtrls, Dialogs;
//  Windows, Messages, SysUtils, Variants, Graphics, 

type
  TfrmGlobalUsersEdit = class(TForm)
    btnOK: TButton;
    btnCancel: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    edtConfirmPassword: TEdit;
    edtPrizvische: TEdit;
    edtImjy: TEdit;
    edtPoBatkovi: TEdit;
    alGlobalUsersEdit: TActionList;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmGlobalUsersEdit: TfrmGlobalUsersEdit;

implementation

uses Main, GlobalUsers;

{$R *.dfm}

procedure TfrmGlobalUsersEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmGlobalUsersEdit.aOKExecute(Sender: TObject);
var
  i: integer;
begin
  frmMain.ssUsers.Params.Clear;
  frmMain.ssUsers.Params.Text:=frmMain.dbAzz.Params.Text;

  if frmGlobalUsersEdit.Caption='Вибір користувача' then
  begin
  end;

  if frmGlobalUsersEdit.Caption='Видалення користувача' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може віжобразитись на роботі програми,'+#13+'Навіть може привести програму до неможливості використання!'+#13+'Ви дійсно бажаєти видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmMain.ssUsers do
      begin
        try
          Params.Clear;
          Params.Text:=frmMain.dbAzz.Params.Text;
          Active:=true;
          UserName:=frmGlobalUsersEdit.edtLogin.Text;
          DeleteUser;
        finally
          Active:=false;
        end;
      end;
    end;
    frmMain.trAzz.CommitRetaining;
    frmGlobalUsersEdit.Close;
    frmGlobalUsers.aUpdateExecute(sender);
    exit;
  end;

  if frmGlobalUsersEdit.Caption='Редагування відомостей про користувача' then
  begin
    if (frmGlobalUsersEdit.edtPassword.Text='')or(frmGlobalUsersEdit.edtConfirmPassword.Text='') then
    begin
      frmGlobalUsersEdit.edtPassword.Text:='';
      frmGlobalUsersEdit.edtConfirmPassword.Text:='';
      frmGlobalUsersEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmGlobalUsersEdit.edtPassword.Text<>frmGlobalUsersEdit.edtConfirmPassword.Text then
    begin
      frmGlobalUsersEdit.edtPassword.Text:='';
      frmGlobalUsersEdit.edtConfirmPassword.Text:='';
      frmGlobalUsersEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmGlobalUsersEdit.edtPrizvische.Text='' then
    begin
      frmGlobalUsersEdit.edtPrizvische.SetFocus;
      exit;
    end;
    with frmMain.ssUsers do
    begin
      try
        Params.Clear;
        Params.Text:=frmMain.dbAzz.Params.Text;
        frmMain.SecurityService:=frmMain.ssUsers;
        Active:=true;
        UserName:=frmGlobalUsersEdit.edtLogin.Text;
        Password:=frmGlobalUsersEdit.edtPassword.Text;
        FirstName:=frmGlobalUsersEdit.edtImjy.Text;
        MiddleName:=frmGlobalUsersEdit.edtPoBatkovi.Text;
        LastName:=frmGlobalUsersEdit.edtPrizvische.Text;
      finally
        ModifyUser;
        Active:=false;
      end;
    end;
    frmGlobalUsersEdit.Close;
    frmGlobalUsers.aUpdateExecute(sender);
    exit;
  end;

  if frmGlobalUsersEdit.Caption='Додавання користувача' then
  begin
    if (frmGlobalUsersEdit.edtPassword.Text='')or(frmGlobalUsersEdit.edtConfirmPassword.Text='') then
    begin
      frmGlobalUsersEdit.edtPassword.Text:='';
      frmGlobalUsersEdit.edtConfirmPassword.Text:='';
      frmGlobalUsersEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmGlobalUsersEdit.edtPassword.Text<>frmGlobalUsersEdit.edtConfirmPassword.Text then
    begin
      frmGlobalUsersEdit.edtPassword.Text:='';
      frmGlobalUsersEdit.edtConfirmPassword.Text:='';
      frmGlobalUsersEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmGlobalUsersEdit.edtPrizvische.Text='' then
    begin
      frmGlobalUsersEdit.edtPrizvische.SetFocus;
      exit;
    end;
    with frmMain.ssUsers do
    begin
      try
        Params.Clear;
        Params.Text:=frmMain.dbAzz.Params.Text;
        frmMain.SecurityService:=frmMain.ssUsers;
        Active:=true;
        DisplayUsers;
        for i:=0 to UserInfoCount-1 do
         if UserName=frmGlobalUsersEdit.edtLogin.Text then
          begin
            frmGlobalUsersEdit.edtLogin.Text:='';
            frmGlobalUsersEdit.edtLogin.SetFocus;
            Active:=false;
            exit;
          end;
      finally
        Active:=false;
      end;
    end;
    with frmMain.ssUsers do
    begin
      try
        Params.Clear;
        Params.Text:=frmMain.dbAzz.Params.Text;
        frmMain.SecurityService:=frmMain.ssUsers;
        Active:=true;
        UserName:=frmGlobalUsersEdit.edtLogin.Text;
        Password:=frmGlobalUsersEdit.edtPassword.Text;
        FirstName:=frmGlobalUsersEdit.edtImjy.Text;
        MiddleName:=frmGlobalUsersEdit.edtPoBatkovi.Text;
        LastName:=frmGlobalUsersEdit.edtPrizvische.Text;
      finally
        AddUser;
        Active:=false;
      end;
    end;
    frmGlobalUsersEdit.Close;
    frmGlobalUsers.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmGlobalUsersEdit.aCancelExecute(Sender: TObject);
begin
  frmGlobalUsersEdit.Close;
end;

end.
