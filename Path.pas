unit Path;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, FileCtrl;

type
  TfrmPath = class(TForm)
    DriveComboBox: TDriveComboBox;
    DirectoryListBox: TDirectoryListBox;
    lblPath: TLabel;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alPath: TActionList;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmPath: TfrmPath;

implementation

uses
  Main, NalashnuvannySistemi;

{$R *.dfm}

procedure TfrmPath.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmNalashnuvannySistemi') then
  begin
    frmNalashnuvannySistemi.Enabled:=true;
    Action:=caFree;
    exit;
  end;
  Action:=caFree;
end;

procedure TfrmPath.aCancelExecute(Sender: TObject);
begin
  frmPath.Close;
end;

procedure TfrmPath.aOKExecute(Sender: TObject);
begin
  if frmMain.IsFormOpen('frmNalashnuvannySistemi') then
    if (frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.edtTemporary)or(frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.btnTemporary) then frmNalashnuvannySistemi.edtTemporary.Text:=frmPath.lblPath.Caption;
    if (frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.edtTemplatePath)or(frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.btnTemplatePath) then frmNalashnuvannySistemi.edtTemplatePath.Text:=frmPath.lblPath.Caption;
{
  if (frmMain.IsFormOpen('frmNalashnuvannySistemi')) then
  begin
    if ((frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.edtShlyhDoTablic)or(frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.btnShlyhDoTablic)) then frmNalashnuvannySistemi.edtShlyhDoTablic.Text:=frmPath.lblPath.Caption;
    if ((frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.edtShlyhDoZvitiv)or(frmNalashnuvannySistemi.ActiveControl=frmNalashnuvannySistemi.btnShlyhDoZvitiv)) then frmNalashnuvannySistemi.edtShlyhDoZvitiv.Text:=frmPath.lblPath.Caption;
  end;
}
  frmPath.Close;
end;

end.
