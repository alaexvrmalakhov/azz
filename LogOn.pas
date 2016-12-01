unit LogOn;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils;

type
  TfrmLogOn = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUser_Name: TEdit;
    edtPassword: TEdit;
    btnConnect: TButton;
    btnClose: TButton;
    Label3: TLabel;
    edtServer: TEdit;
    alLogOn: TActionList;
    aCancel: TAction;
    aOK: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmLogOn: TfrmLogOn;

implementation

uses
  Main, NalashnuvannySistemi;

{$R *.dfm}

procedure TfrmLogOn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmLogOn.aOKExecute(Sender: TObject);
begin
  if (frmLogOn.edtUser_Name.Text='')or(frmLogOn.edtPassword.Text='') then
  begin
    frmLogOn.edtUser_Name.Text:='';
    frmLogOn.edtPassword.Text:='';
    frmLogOn.edtUser_Name.SetFocus;
    exit;
  end;
  if frmMain.IsFormOpen('frmNalashnuvannySistemi') then
  begin
    frmNalashnuvannySistemi.Enabled:=True;
    frmNalashnuvannySistemi.Close;
  end;
  frmMain.dbAzz.DatabaseName:=frmLogOn.edtServer.Text;
  frmMain.dbAzz.Connected:=true;
  frmMain.trAzz.Active:=true;
  frmMain.StatusBar.Panels[1].Text:=TimeToStr(Time);
  frmMain.StatusBar.Panels[2].Text:=DateToStr(Date);
  frmMain.StatusBar.Panels[3].Text:=frmLogOn.edtUser_Name.Text;
  frmLogOn.Close;
end;

procedure TfrmLogOn.aCancelExecute(Sender: TObject);
begin
  frmLogOn.Close;
  frmMain.Close;
end;

end.
