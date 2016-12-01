unit ProProgramu;

interface

uses
  Forms, StdCtrls, Controls, Classes;

type
  TfrmProProgramu = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnZakriti: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnZakritiClick(Sender: TObject);
  end;

var
  frmProProgramu: TfrmProProgramu;

implementation

uses
  Main;

{$R *.dfm}

procedure TfrmProProgramu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmProProgramu.btnZakritiClick(Sender: TObject);
begin
  frmProProgramu.Close;
end;

end.
