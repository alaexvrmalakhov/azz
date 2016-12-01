unit NalashnuvannySistemi;

interface

uses
  Forms, Classes, ActnList, StdCtrls, ComCtrls, Controls, IniFiles, SysUtils,
  Dialogs, ExtCtrls;

type
  TfrmNalashnuvannySistemi = class(TForm)
    Label1: TLabel;
    edtGroshovaOdinicy: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alNalashtuvannySystemi: TActionList;
    aOK: TAction;
    aCancel: TAction;
    aTemporary: TAction;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtUserName: TEdit;
    edtPassword: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtServerName: TEdit;
    edtAliasName: TEdit;
    Label2: TLabel;
    edtTemporary: TEdit;
    btnTemporary: TButton;
    Label3: TLabel;
    edtRik: TEdit;
    udRik: TUpDown;
    cbxUpdateUserWrites: TCheckBox;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    edtTemplatePath: TEdit;
    btnTemplatePath: TButton;
    aTemplatePath: TAction;
    rgPrintToWord: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnShlyhDoTablicClick(Sender: TObject);
    procedure btnShlyhDoZvitivClick(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aTemporaryExecute(Sender: TObject);
    procedure aTemplatePathExecute(Sender: TObject);
  end;

var
  frmNalashnuvannySistemi: TfrmNalashnuvannySistemi;

implementation

uses
  LogOn, Main, Path;

{$R *.dfm}

procedure TfrmNalashnuvannySistemi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmNalashnuvannySistemi.btnShlyhDoTablicClick(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmPath') then frmPath:=TfrmPath.Create(self);
  frmNalashnuvannySistemi.Enabled:=false;
  frmPath.Show;
  frmPath.Caption:='Шлях до таблиць';
  frmPath.Position:=poMainFormCenter;
  frmPath.BorderStyle:=bsDialog;
}
end;

procedure TfrmNalashnuvannySistemi.btnShlyhDoZvitivClick(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmPath') then frmPath:=TfrmPath.Create(self);
  frmNalashnuvannySistemi.Enabled:=false;
  frmPath.Show;
  frmPath.Caption:='Шлях до звітів';
  frmPath.Position:=poMainFormCenter;
  frmPath.BorderStyle:=bsDialog;
}
end;

procedure TfrmNalashnuvannySistemi.aOKExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.INI');
  with frmNalashnuvannySistemi do
  begin
    INIAZZ.WriteString('DataBase','UserName',edtUserName.Text);
    INIAZZ.WriteString('DataBase','Password',edtPassword.Text);
    INIAZZ.WriteString('DataBase','ServerName',edtServerName.Text);
    INIAZZ.WriteString('DataBase','AliasName',edtAliasName.Text);
    INIAZZ.WriteString('System','Money',edtGroshovaOdinicy.Text);
    INIAZZ.WriteInteger('System','Year',udRik.Position);
    INIAZZ.WriteString('System','Temp',edtTemporary.Text);
    INIAZZ.WriteString('System','TemplatePath',edtTemplatePath.Text);
    if cbxUpdateUserWrites.Checked then INIAZZ.WriteInteger('System','UpdateUserWrites',1) else INIAZZ.WriteInteger('System','UpdateUserWrites',0);
    case rgPrintToWord.ItemIndex of
     -1: exit;
      0: INIAZZ.WriteInteger('System','PrintToWord',0);  // MS Word
      1: INIAZZ.WriteInteger('System','PrintToWord',1);  // OpenOffice
    end;
//    if cbxPrintToWord.Checked then INIAZZ.WriteInteger('System','PrintToWord',1) else INIAZZ.WriteInteger('System','PrintToWord',0);
  end;

  INIAZZ.Free;
  try
    frmMain.trAzz.Active:=false;
    frmMain.dbAzz.Connected:=false;
    frmMain.dbAzz.DatabaseName:=frmNalashnuvannySistemi.edtServerName.Text+':'+frmNalashnuvannySistemi.edtAliasName.Text;
  finally
    if not frmMain.IsFormOpen('frmLogOn') then frmLogOn:=TfrmLogOn.Create(Self);
    frmLogOn.Show;
    frmLogOn.FormStyle:=fsStayOnTop;
    frmLogOn.BorderStyle:=bsDialog;
    frmLogOn.Caption:='Підключення до ДБ';
    frmLogOn.Position:=poMainFormCenter;
    frmLogOn.edtServer.Text:=frmMain.dbAzz.DatabaseName;
    frmLogOn.edtUser_Name.Text:='';
    frmLogOn.edtPassword.Text:='';
    ShowMessage('доделать проверку пользователя и пароля');
    frmNalashnuvannySistemi.Enabled:=false;
    frmLogOn.edtUser_Name.SetFocus;
  end;
end;

procedure TfrmNalashnuvannySistemi.aCancelExecute(Sender: TObject);
begin
  frmNalashnuvannySistemi.Close;
end;

procedure TfrmNalashnuvannySistemi.aTemporaryExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmPath') then frmPath:=TfrmPath.Create(self);
  frmNalashnuvannySistemi.Enabled:=false;
  frmPath.Show;
  frmPath.Caption:='Шлях до тимчасової папки';
  frmPath.BorderStyle:=bsDialog;
  frmPath.Position:=poMainFormCenter;
end;

procedure TfrmNalashnuvannySistemi.aTemplatePathExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmPath') then frmPath:=TfrmPath.Create(self);
  frmNalashnuvannySistemi.Enabled:=false;
  with frmPath do
  begin
    Show;
    Caption:='Шлях до шаблонів';
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    DirectoryListBox.Directory:=ExtractFilePath(Application.ExeName);
  end;
end;

end.
