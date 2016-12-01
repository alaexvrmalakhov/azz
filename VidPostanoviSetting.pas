unit VidPostanoviSetting;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls;

type
  TfrmVidPostanoviSetting = class(TForm)
    Label1: TLabel;
    edtKodViduPostanovi: TEdit;
    Label2: TLabel;
    edtVidPostanovi: TEdit;
    cbNajmenuvannyTovaru: TCheckBox;
    cbKilkist: TCheckBox;
    cbVagaOdinici: TCheckBox;
    cbZagalnaVaga: TCheckBox;
    cbOtrimanogo: TCheckBox;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label3: TLabel;
    edtRecord_ID: TEdit;
    alVidPostanovSettings: TActionList;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmVidPostanoviSetting: TfrmVidPostanoviSetting;

implementation

uses
  Main, VidPostanovi;

{$R *.dfm}

procedure TfrmVidPostanoviSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidPostanoviSetting.aOKExecute(Sender: TObject);
begin
  with frmVidPostanovi do
  begin
    qVidPostanovi.SQL.Clear;
    qVidPostanovi.SQL.Text:='update VIDPOSTANOVI set NAJMENUVANNYTOVARU=:NAJMENUVANNYTOVARU,KILKIST=:KILKIST,VAGAODINICI=:VAGAODINICI,ZAGALNAVAGA=:ZAGALNAVAGA,OTRIMANOGO=:OTRIMANOGO where RECORD_ID=:Kod';
    qVidPostanovi.Params.Clear;
    qVidPostanovi.Params.Add;
    qVidPostanovi.Params[0].Name:='NAJMENUVANNYTOVARU';
    if frmVidPostanoviSetting.cbNajmenuvannyTovaru.Checked then qVidPostanovi.Params[0].Value:=1 else qVidPostanovi.Params[0].Value:=0;
    qVidPostanovi.Params.Add;
    qVidPostanovi.Params[1].Name:='KILKIST';
    if frmVidPostanoviSetting.cbKilkist.Checked then qVidPostanovi.Params[1].Value:=1 else qVidPostanovi.Params[1].Value:=0;
    qVidPostanovi.Params.Add;
    qVidPostanovi.Params[2].Name:='VAGAODINICI';
    if frmVidPostanoviSetting.cbVagaOdinici.Checked then qVidPostanovi.Params[2].Value:=1 else qVidPostanovi.Params[2].Value:=0;
    qVidPostanovi.Params.Add;
    qVidPostanovi.Params[3].Name:='ZAGALNAVAGA';
    if frmVidPostanoviSetting.cbZagalnaVaga.Checked then qVidPostanovi.Params[3].Value:=1 else qVidPostanovi.Params[3].Value:=0;
    qVidPostanovi.Params.Add;
    qVidPostanovi.Params[4].Name:='OTRIMANOGO';
    if frmVidPostanoviSetting.cbOtrimanogo.Checked then qVidPostanovi.Params[4].Value:=1 else qVidPostanovi.Params[4].Value:=0;
    qVidPostanovi.Params.Add;
    qVidPostanovi.Params[5].Name:='Kod';
    qVidPostanovi.Params[5].Value:=frmVidPostanoviSetting.edtRecord_ID.Text;
    qVidPostanovi.Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmVidPostanoviSetting.Close;
  frmVidPostanovi.aUpdateExecute(sender);
  exit;
end;

procedure TfrmVidPostanoviSetting.aCancelExecute(Sender: TObject);
begin
  frmVidPostanoviSetting.Close;
end;

end.
