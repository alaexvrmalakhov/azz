unit Raport;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ComCtrls, SysUtils;

type
  TfrmRaport = class(TForm)
    Label1: TLabel;
    edtNomerPostanovi: TEdit;
    Label2: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    Label3: TLabel;
    edtNomerLista: TEdit;
    Label4: TLabel;
    dtpDataLista: TDateTimePicker;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label7: TLabel;
    edtRecord_ID: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    cbPIBPredstavnika: TComboBox;
    btnPIBPredstavnika_Update: TButton;
    btnPIBPredstavnika_Choice: TButton;
    cbPosadaPredstavnika: TComboBox;
    btnPosadaPredstavnika_Update: TButton;
    btnPosadaPredstavnika_Choice: TButton;
    alRaport: TActionList;
    aRecordID_Update: TAction;
    aPIBPredstavnika_Update: TAction;
    aPIBPredstavnika_Choice: TAction;
    aPIBPredstavnika_Change: TAction;
    aPosadaPredstavnika_Update: TAction;
    aPosadaPredstavnika_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    qID: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordID_UpdateExecute(Sender: TObject);
    procedure aPIBPredstavnika_UpdateExecute(Sender: TObject);
    procedure aPIBPredstavnika_ChoiceExecute(Sender: TObject);
    procedure aPIBPredstavnika_ChangeExecute(Sender: TObject);
    procedure aPosadaPredstavnika_UpdateExecute(Sender: TObject);
    procedure aPosadaPredstavnika_ChoiceExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmRaport: TfrmRaport;

implementation

uses
  Main, AdminZapobizhZahodi, Spivrobitniki, Posadi;

{$R *.dfm}

procedure TfrmRaport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRaport.aRecordID_UpdateExecute(Sender: TObject);
begin
  frmRaport.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
  frmRaport.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value);
  frmRaport.edtRecord_ID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value);
end;

procedure TfrmRaport.aPIBPredstavnika_UpdateExecute(Sender: TObject);
var
  District: integer;
begin
  with frmRaport do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from RAJONI,TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.TERITORY=:Teritory and RAJONI.RAJON=:Rajon and TERITORY.MINISTRY=MINISTRY.KOD and RAJONI.TERITORY=TERITORY.KOD and RAJONI.MINISTRY=MINISTRY.KOD order by RAJONI.RAJON';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Ministry';
    qID.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    qID.Params.Add;
    qID.Params[1].Name:='Teritory';
    qID.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    qID.Params.Add;
    qID.Params[2].Name:='Rajon';
    qID.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    qID.Open;
    if qID.Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=qID.FieldByName('KOD').Value else District:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from SPIVROBITNIKI where RAJON=:Rajon order by PRIZVISXHE';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Rajon';
    qID.Params[0].Value:=District;
    qID.Open;
    cbPIBPredstavnika.Text:='';
    cbPIBPredstavnika.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      cbPIBPredstavnika.Items.Add(qID.FieldByName('PRIZVISXHE').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmRaport.aPIBPredstavnika_ChoiceExecute(Sender: TObject);
begin
  frmRaport.Enabled:=false;
  frmMain.aSpivrobitnikiExecute(sender);
  frmSpivrobitniki.aChoice.Enabled:=true;
  frmSpivrobitniki.Left:=frmMain.Left+70;
  frmSpivrobitniki.Top:=frmMain.Top+70;
  frmSpivrobitniki.Width:=frmMain.Width-70;
  frmSpivrobitniki.Height:=frmMain.Height-70;
  frmSpivrobitniki.Position:=poMainFormCenter;
  frmSpivrobitniki.FormStyle:=fsNormal;
  frmSpivrobitniki.BorderStyle:=bsDialog;
end;

procedure TfrmRaport.aPIBPredstavnika_ChangeExecute(Sender: TObject);
var
  posada,District: integer;
begin
  with frmRaport do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from RAJONI,TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.TERITORY=:Teritory and RAJONI.RAJON=:Rajon and TERITORY.MINISTRY=MINISTRY.KOD and RAJONI.MINISTRY=MINISTRY.KOD and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Ministry';
    qID.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    qID.Params.Add;
    qID.Params[1].Name:='Teritory';
    qID.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    qID.Params.Add;
    qID.Params[2].Name:='Rajon';
    qID.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    qID.Open;
    if qID.Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=qID.FieldByName('KOD').Value else District:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from SPIVROBITNIKI where RAJON=:Rajon and  PRIZVISXHE=:PIB order by PRIZVISXHE';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Rajon';
    qID.Params[0].Value:=District;
    qID.Params.Add;
    qID.Params[1].Name:='PIB';
    qID.Params[1].Value:=cbPIBPredstavnika.Text;
    qID.Open;
    if qID.Locate('PRIZVISXHE',cbPIBPredstavnika.Text,[]) then posada:=qID.FieldByName('KODPOSADI').Value else posada:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from POSADI where RAJON=:Rajon and KODPOSADI=:Posada order by KODPOSADI';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Rajon';
    qID.Params[0].Value:=District;
    qID.Params.Add;
    qID.Params[1].Name:='Posada';
    qID.Params[1].Value:=posada;
    qID.Open;
    if qID.Locate('KODPOSADI',posada,[]) then cbPosadaPredstavnika.Text:=qID.FieldByName('NAZVAPOSADI').Value;
  end;
end;

procedure TfrmRaport.aPosadaPredstavnika_UpdateExecute(Sender: TObject);
var
  District: integer;
begin
  with frmRaport do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from RAJONI,TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.TERITORY=:Teritory and RAJONI.RAJON=:Rajon and TERITORY.MINISTRY=MINISTRY.KOD and RAJONI.MINISTRY=MINISTRY.KOD and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Ministry';
    qID.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    qID.Params.Add;
    qID.Params[1].Name:='Teritory';
    qID.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    qID.Params.Add;
    qID.Params[2].Name:='Rajon';
    qID.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    qID.Open;
    if qID.Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=qID.FieldByName('KOD').Value else District:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from POSADI where RAJON=:Rajon order by NAZVAPOSADI';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Rajon';
    qID.Params[0].Value:=District;
    qID.Open;
    cbPosadaPredstavnika.Text:='';
    cbPosadaPredstavnika.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      cbPosadaPredstavnika.Items.Add(qID.FieldByName('NAZVAPOSADI').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmRaport.aPosadaPredstavnika_ChoiceExecute(Sender: TObject);
begin
  frmRaport.Enabled:=false;
  frmMain.aPosadiExecute(sender);
  frmPosadi.aChoice.Enabled:=true;
  frmPosadi.Left:=frmMain.Left+70;
  frmPosadi.Top:=frmMain.Top+70;
  frmPosadi.Width:=frmMain.Width-70;
  frmPosadi.Height:=frmMain.Height-70;
  frmPosadi.Position:=poMainFormCenter;
  frmPosadi.FormStyle:=fsNormal;
  frmPosadi.BorderStyle:=bsDialog;
end;

procedure TfrmRaport.aOKExecute(Sender: TObject);
begin
  if frmRaport.edtNomerLista.Text='' then
  begin
    frmRaport.edtNomerLista.SetFocus;
    exit;
  end;
  if frmRaport.cbPIBPredstavnika.Text='' then
  begin
    frmRaport.aPIBPredstavnika_UpdateExecute(sender);
    frmRaport.cbPIBPredstavnika.SetFocus;
    exit;
  end;
  if frmRaport.cbPosadaPredstavnika.Text='' then
  begin
    frmRaport.aPosadaPredstavnika_UpdateExecute(sender);
    frmRaport.cbPosadaPredstavnika.SetFocus;
    exit;
  end;
  with frmRaport do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='update POSTANOVA_ADMIN set NOMER_LISTA=:NOMER_LISTA,DATA_LISTA=:DATA_LISTA,OSOBA_RAPORT=:OSOBA_RAPORT,POSADA_RAPORT=:POSADA_RAPORT where RECORD_ID=:Kod';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='NOMER_LISTA';
    qID.Params[0].Value:=edtNomerLista.Text;
    qID.Params.Add;
    qID.Params[1].Name:='DATA_LISTA';
    qID.Params[1].Value:=DateToStr(int(dtpDataLista.Date));
    qID.Params.Add;
    qID.Params[2].Name:='OSOBA_RAPORT';
    qID.Params[2].Value:=cbPIBPredstavnika.Text;
    qID.Params.Add;
    qID.Params[3].Name:='POSADA_RAPORT';
    qID.Params[3].Value:=cbPosadaPredstavnika.Text;
    qID.Params.Add;
    qID.Params[4].Name:='Kod';
    qID.Params[4].Value:=frmRaport.edtRecord_ID.Text;
    qID.Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmRaport.Close;
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
  exit;
end;

procedure TfrmRaport.aCancelExecute(Sender: TObject);
begin
  frmRaport.Close;
end;

end.
