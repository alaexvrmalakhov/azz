unit Opechanuvanny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, ComCtrls, SysUtils;

type
  TfrmOpechanuvanny = class(TForm)
    Label1: TLabel;
    edtNomerAktuOplombuvanny: TEdit;
    Label2: TLabel;
    dtpDataOplombuvanny: TDateTimePicker;
    rgOpechatuvanny: TRadioGroup;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    btnNomerAktu: TButton;
    Label9: TLabel;
    edtNomerPostanovi: TEdit;
    Label10: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    Label11: TLabel;
    edtRecord_ID: TEdit;
    alOpechatuvanny: TActionList;
    aNomerAktuUpdate: TAction;
    qID: TIBQuery;
    aPIBPredstavnikaSES_Update: TAction;
    aPIBPredstavnikaSES_Choice: TAction;
    gbPredstavnikSES: TGroupBox;
    Label12: TLabel;
    cbPIBPredstavnikaSES: TComboBox;
    btnPIBPredstavnikaSES_Update: TButton;
    btnPIBPredstavnikaSES_Choice: TButton;
    Label3: TLabel;
    cbPosadaPredstavnikaSES: TComboBox;
    btnPosadaPredstavnikaSES_Update: TButton;
    btnPosadaPredstavnikaSES_Choice: TButton;
    aPosadaPredstavnikaSES_Update: TAction;
    aPosadaPredstavnikaSES_Choice: TAction;
    gbObjekt: TGroupBox;
    Label4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtPIBPredstavnikaObjektu: TEdit;
    edtPosadaPredstavnikaObjektu: TEdit;
    btnNazvaObjektu_Choice: TButton;
    aNazvaObjektu_Choice: TAction;
    edtNazvaObjektu: TEdit;
    aPIBPredstavnikaSES_Change: TAction;
    Label5: TLabel;
    cbNazvaUstatkuvanny: TComboBox;
    btnNazvaUstatkuvanny_Update: TButton;
    btnNazvaUstatkuvanny_Choice: TButton;
    aNazvaUstatkuvanny_Update: TAction;
    aNazvaUstatkuvanny_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    aRecordID_Update: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aNomerAktuUpdateExecute(Sender: TObject);
    procedure aPIBPredstavnikaSES_UpdateExecute(Sender: TObject);
    procedure aPIBPredstavnikaSES_ChoiceExecute(Sender: TObject);
    procedure aPosadaPredstavnikaSES_UpdateExecute(Sender: TObject);
    procedure aPosadaPredstavnikaSES_ChoiceExecute(Sender: TObject);
    procedure aNazvaObjektu_ChoiceExecute(Sender: TObject);
    procedure aPIBPredstavnikaSES_ChangeExecute(Sender: TObject);
    procedure aNazvaUstatkuvanny_ChoiceExecute(Sender: TObject);
    procedure aNazvaUstatkuvanny_UpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aRecordID_UpdateExecute(Sender: TObject);
  end;

var
  frmOpechanuvanny: TfrmOpechanuvanny;

implementation

uses
  Main, AdminZapobizhZahodi, Spivrobitniki, Posadi, Objekti, VidObmezhen;

{$R *.dfm}

procedure TfrmOpechanuvanny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOpechanuvanny.aNomerAktuUpdateExecute(Sender: TObject);
begin
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU_OPLOMBUVANNY').IsNull then frmOpechanuvanny.edtNomerAktuOplombuvanny.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_AKTU_OPLOMBUVANNY').Value) else frmOpechanuvanny.edtNomerAktuOplombuvanny.Text:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OPLOMBUVANNY').IsNull then frmOpechanuvanny.dtpDataOplombuvanny.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_OPLOMBUVANNY').Value) else frmOpechanuvanny.dtpDataOplombuvanny.Date:=int(date);
end;

procedure TfrmOpechanuvanny.aPIBPredstavnikaSES_UpdateExecute(
  Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  with frmOpechanuvanny do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Ministry';
    qID.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
    qID.Open;
    if qID.Locate('MINISTRY',frmAdminZapobizhZahodi.cbMinistry.Text,[]) then Ministry:=qID.FieldByName('KOD').Value else Ministry:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Ministry';
    qID.Params[0].Value:=Ministry;
    qID.Params.Add;
    qID.Params[1].Name:='Teritory';
    qID.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
    qID.Open;
    if qID.Locate('TERITORY',frmAdminZapobizhZahodi.cbTeritory.Text,[]) then Teritory:=qID.FieldByName('KOD').Value else Teritory:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from RAJONI where TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Teritory';
    qID.Params[0].Value:=Teritory;
    qID.Params.Add;
    qID.Params[1].Name:='Rajon';
    qID.Params[1].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
    qID.Open;
    if qID.Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=qID.FIeldByName('KOD').Value else District:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from SPIVROBITNIKI where RAJON=:Rajon order by PRIZVISXHE';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Rajon';
    qID.Params[0].Value:=District;
    qID.Open;
    cbPIBPredstavnikaSES.Text:='';
    cbPIBPredstavnikaSES.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      cbPIBPredstavnikaSES.Items.Add(qID.FieldByName('PRIZVISXHE').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmOpechanuvanny.aPIBPredstavnikaSES_ChoiceExecute(
  Sender: TObject);
begin
  frmOpechanuvanny.Enabled:=false;
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

procedure TfrmOpechanuvanny.aPosadaPredstavnikaSES_UpdateExecute(
  Sender: TObject);
var
  Rajon: integer;
begin
  with frmOpechanuvanny do
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
    if qID.Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then Rajon:=qID.FieldByName('KOD').Value else Rajon:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from POSADI where RAJON=:Rajon order by NAZVAPOSADI';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Rajon';
    qID.Params[0].Value:=Rajon;
    qID.Open;
    cbPosadaPredstavnikaSES.Text:='';
    cbPosadaPredstavnikaSES.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      cbPosadaPredstavnikaSES.Items.Add(qID.FieldByName('NAZVAPOSADI').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmOpechanuvanny.aPosadaPredstavnikaSES_ChoiceExecute(
  Sender: TObject);
begin
  frmOpechanuvanny.Enabled:=false;
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

procedure TfrmOpechanuvanny.aNazvaObjektu_ChoiceExecute(Sender: TObject);
begin
  frmOpechanuvanny.Enabled:=false;
  frmMain.aObjektiExecute(sender);
  frmObjekti.aChoice.Enabled:=true;
  frmObjekti.Left:=frmMain.Left+70;
  frmObjekti.Top:=frmMain.Top+70;
  frmObjekti.Width:=frmMain.Width-70;
  frmObjekti.Height:=frmMain.Height-70;
  frmObjekti.Position:=poMainFormCenter;
  frmObjekti.FormStyle:=fsNormal;
  frmObjekti.BorderStyle:=bsDialog;
end;

procedure TfrmOpechanuvanny.aPIBPredstavnikaSES_ChangeExecute(
  Sender: TObject);
var
  posada: integer;
begin
  with frmOpechanuvanny do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from SPIVROBITNIKI where PRIZVISXHE=:PIB_SES order by PRIZVISXHE';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='PIB_SES';
    qID.Params[0].Value:=cbPIBPredstavnikaSES.Text;
    qID.Open;
    if qID.Locate('PRIZVISXHE',cbPIBPredstavnikaSES.Text,[]) then posada:=qID.FieldByName('KODPOSADI').Value else posada:=0;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from POSADI where KODPOSADI=:Posada order by KODPOSADI';
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='Posada';
    qID.Params[0].Value:=posada;
    qID.Open;
    if qID.Locate('KODPOSADI',posada,[]) then cbPosadaPredstavnikaSES.Text:=qID.FieldByName('NAZVAPOSADI').Value;
  end;
end;

procedure TfrmOpechanuvanny.aNazvaUstatkuvanny_ChoiceExecute(
  Sender: TObject);
begin
  frmOpechanuvanny.Enabled:=false;
  frmMain.aVidObmezhenExecute(sender);
  frmVidObmezhen.aChoice.Enabled:=true;
  frmVidObmezhen.Left:=frmMain.Left+70;
  frmVidObmezhen.Top:=frmMain.Top+70;
  frmVidObmezhen.Width:=frmMain.Width-70;
  frmVidObmezhen.Height:=frmMain.Height-70;
  frmVidObmezhen.Position:=poMainFormCenter;
  frmVidObmezhen.FormStyle:=fsNormal;
  frmVidObmezhen.BorderStyle:=bsDialog;
end;

procedure TfrmOpechanuvanny.aNazvaUstatkuvanny_UpdateExecute(
  Sender: TObject);
begin
//суть постанови
  with frmOpechanuvanny do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from VIDOBMEZHEN order by VIDOBMEZHENNY';
    qID.Open;
    cbNazvaUstatkuvanny.Text:='';
    cbNazvaUstatkuvanny.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      cbNazvaUstatkuvanny.Items.Add(qID.FieldByName('VIDOBMEZHENNY').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmOpechanuvanny.aOKExecute(Sender: TObject);
begin
  if frmOpechanuvanny.edtNomerAktuOplombuvanny.Text='' then
  begin
    frmOpechanuvanny.aNomerAktuUpdateExecute(sender);
    frmOpechanuvanny.edtNomerAktuOplombuvanny.SetFocus;
    exit;
  end;
  try
    StrToInt(frmOpechanuvanny.edtNomerAktuOplombuvanny.Text);
  except
    frmOpechanuvanny.edtNomerAktuOplombuvanny.Text:='';
    frmOpechanuvanny.aNomerAktuUpdateExecute(sender);
    frmOpechanuvanny.edtNomerAktuOplombuvanny.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.cbPIBPredstavnikaSES.Text='' then
  begin
    frmOpechanuvanny.aPIBPredstavnikaSES_UpdateExecute(sender);
   frmOpechanuvanny.cbPIBPredstavnikaSES.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.cbPosadaPredstavnikaSES.Text='' then
  begin
    frmOpechanuvanny.aPosadaPredstavnikaSES_UpdateExecute(sender);
    frmOpechanuvanny.cbPosadaPredstavnikaSES.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.edtNazvaObjektu.Text='' then
  begin
    frmOpechanuvanny.edtNazvaObjektu.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.edtPIBPredstavnikaObjektu.Text='' then
  begin
    frmOpechanuvanny.edtPIBPredstavnikaObjektu.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.edtPosadaPredstavnikaObjektu.Text='' then
  begin
    frmOpechanuvanny.edtPosadaPredstavnikaObjektu.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.rgOpechatuvanny.ItemIndex=-1 then
  begin
    frmOpechanuvanny.rgOpechatuvanny.ItemIndex:=0;
    frmOpechanuvanny.rgOpechatuvanny.SetFocus;
    exit;
  end;
  if frmOpechanuvanny.cbNazvaUstatkuvanny.Text='' then
  begin
    frmOpechanuvanny.aNazvaUstatkuvanny_UpdateExecute(sender);
    frmOpechanuvanny.cbNazvaUstatkuvanny.SetFocus;
    exit;
  end;
  with frmOpechanuvanny do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='update POSTANOVA_ADMIN set NOMER_AKTU_OPLOMBUVANNY=:NOMER_AKTU_OPLOMBUVANNY,DATA_OPLOMBUVANNY=:DATA_OPLOMBUVANNY,PIB_SES_OPLOMBUVANNY=:PIB_SES_OPLOMBUVANNY,';//';
    qID.SQL.Text:=qID.SQL.Text+'POSADA_SES_OPLOMBUVANNY=:POSADA_SES_OPLOMBUVANNY,NAZVA_OBJEKTU_OPLOMBUVANNY=:NAZVA_OBJEKTU_OPLOMBUVANNY,PIB_PREDSTAVNIKA=:PIB_PREDSTAVNIKA,';//';
    qID.SQL.Text:=qID.SQL.Text+'POSADA_PREDSTAVNIKA=:POSADA_PREDSTAVNIKA,OPECHATUVANNY_OPLOMBUVANNY=:OPECHATUVANNY_OPLOMBUVANNY,USTATKUVANNY=:USTATKUVANNY where RECORD_ID=:Kod';//'+;
    qID.Params.Clear;
    qID.Params.Add;
    qID.Params[0].Name:='NOMER_AKTU_OPLOMBUVANNY';
    qID.Params[0].Value:=edtNomerAktuOplombuvanny.Text;
    qID.Params.Add;
    qID.Params[1].Name:='DATA_OPLOMBUVANNY';
    qID.Params[1].Value:=DateToStr(int(dtpDataOplombuvanny.Date));
    qID.Params.Add;
    qID.Params[2].Name:='PIB_SES_OPLOMBUVANNY';
    qID.Params[2].Value:=cbPIBPredstavnikaSES.Text;
    qID.Params.Add;
    qID.Params[3].Name:='POSADA_SES_OPLOMBUVANNY';
    qID.Params[3].Value:=cbPosadaPredstavnikaSES.Text;
    qID.Params.Add;
    qID.Params[4].Name:='NAZVA_OBJEKTU_OPLOMBUVANNY';
    qID.Params[4].Value:=edtNazvaObjektu.Text;
    qID.Params.Add;
    qID.Params[5].Name:='PIB_PREDSTAVNIKA';
    qID.Params[5].Value:=edtPIBPredstavnikaObjektu.Text;
    qID.Params.Add;
    qID.Params[6].Name:='POSADA_PREDSTAVNIKA';
    qID.Params[6].Value:=edtPosadaPredstavnikaObjektu.Text;
    qID.Params.Add;
    qID.Params[7].Name:='OPECHATUVANNY_OPLOMBUVANNY';
    qID.Params[7].Value:=rgOpechatuvanny.ItemIndex;
    qID.Params.Add;
    qID.Params[8].Name:='USTATKUVANNY';
    qID.Params[8].Value:=cbNazvaUstatkuvanny.Text;
    qID.Params.Add;
    qID.Params[9].Name:='Kod';
    qID.Params[9].Value:=edtRecord_ID.Text;
    qID.Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmOpechanuvanny.Close;
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
  exit;
end;

procedure TfrmOpechanuvanny.aCancelExecute(Sender: TObject);
begin
  frmOpechanuvanny.Close;
end;

procedure TfrmOpechanuvanny.aRecordID_UpdateExecute(Sender: TObject);
begin
  frmOpechanuvanny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value);
  frmOpechanuvanny.dtpDataPostanovi.Date:=int(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('DATA_POSTANOVI').Value);
  frmOpechanuvanny.edtRecord_ID.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('RECORD_ID').Value);
end;

end.
