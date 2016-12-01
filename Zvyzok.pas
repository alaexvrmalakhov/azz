unit Zvyzok;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, ComCtrls, ExtCtrls, IniFiles, SysUtils;

type
  TfrmZvyzok = class(TForm)
    pcZvyzok: TPageControl;
    tsZvyzokZSchomisychnimZvitom: TTabSheet;
    tsZvyzokZF18: TTabSheet;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    tsRezultatOskarzhenny: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    alZvyzok: TActionList;
    aOK: TAction;
    aCancel: TAction;
    cbKG: TComboBox;
    btnKG_Update: TButton;
    btnKG_Choice: TButton;
    cbGH: TComboBox;
    btnGH_Update: TButton;
    btnGH_Choice: TButton;
    cbGDP: TComboBox;
    btnGDP_Update: TButton;
    btnGDP_Choice: TButton;
    cbGPr: TComboBox;
    btnGPr_Update: TButton;
    btnGPr_Choice: TButton;
    cbRV: TComboBox;
    btnRV_Update: TButton;
    btnRV_Choice: TButton;
    cbEV: TComboBox;
    btnEV_Update: TButton;
    btnEV_Choice: TButton;
    cbVMP: TComboBox;
    btnVMP_Update: TButton;
    btnVMP_Choice: TButton;
    aKG_Update: TAction;
    aKG_Choice: TAction;
    aGH_Update: TAction;
    aGH_Choice: TAction;
    aGDP_Update: TAction;
    aGDP_Choice: TAction;
    aGPr_Update: TAction;
    aGPr_Choice: TAction;
    aRV_Update: TAction;
    aRV_Choice: TAction;
    aEV_Update: TAction;
    aEV_Choice: TAction;
    aVMP_Update: TAction;
    aVMP_Choice: TAction;
    aUpdate_Schomisychnij_All: TAction;
    qZvyazok: TIBQuery;
    Bevel2: TBevel;
    edtMinistry: TEdit;
    edtTeritory: TEdit;
    edtDistrict: TEdit;
    Bevel3: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cbVidmineno: TComboBox;
    btnVidmineno_Update: TButton;
    btnVidmineno_Choice: TButton;
    cbNaNovijRozglyd: TComboBox;
    btnNaNovijRozglyd_Update: TButton;
    btnNaNovijRozglyd_Choice: TButton;
    cbZalishenoVSili: TComboBox;
    btnZalishenoVSili_Update: TButton;
    btnZalishenoVSili_Choice: TButton;
    aVidmineno_Update: TAction;
    aVidmineno_Choice: TAction;
    aNaNovijRozglyd_Update: TAction;
    aNaNovijRozglyd_Choice: TAction;
    aZalishenoVSili_Update: TAction;
    aZalishenoVSili_Choice: TAction;
    aUpdate_RezultatiOskarzhenny: TAction;
    Bevel4: TBevel;
    Label11: TLabel;
    cbZaVodopostachannym: TComboBox;
    btnZaVodopostachannym_Update: TButton;
    btnZaVodopostachannym_Choice: TButton;
    Label12: TLabel;
    cbZaOhoronojuVodojm: TComboBox;
    btnZaOhoronojuVodojm_Update: TButton;
    btnZaOhoronojuVodojm_Choice: TButton;
    Label13: TLabel;
    cbZaOhoronojuAtmosfernogoPovitrya: TComboBox;
    btnZaOhoronojuAtmosfernogoPovitrya_Update: TButton;
    btnZaOhoronojuAtmosfernogoPovitrya_Choice: TButton;
    Label14: TLabel;
    cbZaOhoronojuGruntu: TComboBox;
    btnZaOhoronojuGruntu_Update: TButton;
    btnZaOhoronojuGruntu_Choice: TButton;
    Label15: TLabel;
    cbRadiacijnoiBezpeki: TComboBox;
    btnRadiacijnoiBezpeki_Update: TButton;
    btnRadiacijnoiBezpeki_Choice: TButton;
    Label16: TLabel;
    cbZaKomunalnimiObjektami: TComboBox;
    btnZaKomunalnimiObjektami_Update: TButton;
    btnZaKomunalnimiObjektami_Choice: TButton;
    Label17: TLabel;
    cbZaLPZ: TComboBox;
    btnZaLPZ_Update: TButton;
    btnZaLPZ_Choice: TButton;
    Label18: TLabel;
    cbZaPromislovimiPidpriemstvami: TComboBox;
    btnZaPromislovimiPidpriemstvami_Update: TButton;
    btnZaPromislovimiPidpriemstvami_Choice: TButton;
    Label19: TLabel;
    cbZaDitychimiTaPidlitkovimiZakladami: TComboBox;
    btnZaDitychimiTaPidlitkovimiZakladami_Update: TButton;
    btnZaDitychimiTaPidlitkovimiZakladami_Choice: TButton;
    Label21: TLabel;
    cbZaPidpriemstvamiHarchovoiPromislovosti: TComboBox;
    btnZaPidpriemstvamiHarchovoiPromislovosti_Update: TButton;
    btnZaPidpriemstvamiHarchovoiPromislovosti_Choice: TButton;
    Label22: TLabel;
    cbGromadskogoHarchuvanny: TComboBox;
    btnGromadskogoHarchuvanny_Update: TButton;
    btnGromadskogoHarchuvanny_Choice: TButton;
    Label23: TLabel;
    cbTorgivli: TComboBox;
    btnTorgivli_Update: TButton;
    btnTorgivli_Choice: TButton;
    Label24: TLabel;
    cbZaSudnami: TComboBox;
    btnZaSudnami_Update: TButton;
    btnZaSudnami_Choice: TButton;
    aZaVodopostachannym_Update: TAction;
    aZaVodopostachannym_Choice: TAction;
    aZaOhoronojuVodojm_Update: TAction;
    aZaOhoronojuVodojm_Choice: TAction;
    aZaOhoronojuAtmosfernogoPovitry_Update: TAction;
    aZaOhoronojuAtmosfernogoPovitry_Choice: TAction;
    aZaOhoronojuGruntu_Update: TAction;
    aZaOhoronojuGruntu_Choice: TAction;
    aRadiacijnoiBezpeki_Update: TAction;
    aRadiacijnoiBezpeki_Choice: TAction;
    aZaKomunalnimiObjektami_Update: TAction;
    aZaKomunalnimiObjektami_Choice: TAction;
    aZaLPZ_Update: TAction;
    aZaLPZ_Choice: TAction;
    aZaPromislovimiPidpriemstvami_Update: TAction;
    aZaPromislovimiPidpriemstvami_Choice: TAction;
    aZaDitychimiTaPidlitkovimiZakladami_Update: TAction;
    aZaDitychimiTaPidlitkovimiZakladami_Choice: TAction;
    aZaPidpriemstvamiHarchovoiPromislovosti_Update: TAction;
    aZaPidpriemstvamiHarchovoiPromislovosti_Choice: TAction;
    aGromadskogoHarchuvanny_Update: TAction;
    aGromadskogoHarchuvanny_Choice: TAction;
    aTorgivli_Update: TAction;
    aTorgivli_Choice: TAction;
    aZaSudnami_Update: TAction;
    aZaSudnami_Choice: TAction;
    aUpdateSchokvartalnij: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aKG_ChoiceExecute(Sender: TObject);
    procedure aGH_ChoiceExecute(Sender: TObject);
    procedure aGDP_ChoiceExecute(Sender: TObject);
    procedure aGPr_ChoiceExecute(Sender: TObject);
    procedure aRV_ChoiceExecute(Sender: TObject);
    procedure aEV_ChoiceExecute(Sender: TObject);
    procedure aVMP_ChoiceExecute(Sender: TObject);
    procedure aKG_UpdateExecute(Sender: TObject);
    procedure aGH_UpdateExecute(Sender: TObject);
    procedure aGDP_UpdateExecute(Sender: TObject);
    procedure aGPr_UpdateExecute(Sender: TObject);
    procedure aRV_UpdateExecute(Sender: TObject);
    procedure aEV_UpdateExecute(Sender: TObject);
    procedure aVMP_UpdateExecute(Sender: TObject);
    procedure aUpdate_Schomisychnij_AllExecute(Sender: TObject);
    procedure aZalishenoVSili_ChoiceExecute(Sender: TObject);
    procedure aNaNovijRozglyd_ChoiceExecute(Sender: TObject);
    procedure aVidmineno_ChoiceExecute(Sender: TObject);
    procedure aVidmineno_UpdateExecute(Sender: TObject);
    procedure aNaNovijRozglyd_UpdateExecute(Sender: TObject);
    procedure aZalishenoVSili_UpdateExecute(Sender: TObject);
    procedure aUpdate_RezultatiOskarzhennyExecute(Sender: TObject);
    procedure aZaVodopostachannym_ChoiceExecute(Sender: TObject);
    procedure aZaOhoronojuVodojm_ChoiceExecute(Sender: TObject);
    procedure aZaOhoronojuAtmosfernogoPovitry_ChoiceExecute(
      Sender: TObject);
    procedure aZaOhoronojuGruntu_ChoiceExecute(Sender: TObject);
    procedure aRadiacijnoiBezpeki_ChoiceExecute(Sender: TObject);
    procedure aZaKomunalnimiObjektami_ChoiceExecute(Sender: TObject);
    procedure aZaLPZ_ChoiceExecute(Sender: TObject);
    procedure aZaPromislovimiPidpriemstvami_ChoiceExecute(Sender: TObject);
    procedure aZaDitychimiTaPidlitkovimiZakladami_ChoiceExecute(
      Sender: TObject);
    procedure aZaPidpriemstvamiHarchovoiPromislovosti_ChoiceExecute(
      Sender: TObject);
    procedure aGromadskogoHarchuvanny_ChoiceExecute(Sender: TObject);
    procedure aTorgivli_ChoiceExecute(Sender: TObject);
    procedure aZaSudnami_ChoiceExecute(Sender: TObject);
    procedure aUpdateSchokvartalnijExecute(Sender: TObject);
    procedure aZaVodopostachannym_UpdateExecute(Sender: TObject);
    procedure aZaOhoronojuVodojm_UpdateExecute(Sender: TObject);
    procedure aZaOhoronojuAtmosfernogoPovitry_UpdateExecute(
      Sender: TObject);
    procedure aZaOhoronojuGruntu_UpdateExecute(Sender: TObject);
    procedure aRadiacijnoiBezpeki_UpdateExecute(Sender: TObject);
    procedure aZaKomunalnimiObjektami_UpdateExecute(Sender: TObject);
    procedure aZaLPZ_UpdateExecute(Sender: TObject);
    procedure aZaPromislovimiPidpriemstvami_UpdateExecute(Sender: TObject);
    procedure aZaDitychimiTaPidlitkovimiZakladami_UpdateExecute(
      Sender: TObject);
    procedure aZaPidpriemstvamiHarchovoiPromislovosti_UpdateExecute(
      Sender: TObject);
    procedure aGromadskogoHarchuvanny_UpdateExecute(Sender: TObject);
    procedure aTorgivli_UpdateExecute(Sender: TObject);
    procedure aZaSudnami_UpdateExecute(Sender: TObject);
  end;

var
  frmZvyzok: TfrmZvyzok;

implementation

uses
  Main, Viddilenny, Oskargenny, Rozdil_T23_F18;

{$R *.dfm}

procedure TfrmZvyzok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmZvyzok.aOKExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');

  if tsZvyzokZF18.TabVisible then
  begin
    INIAZZ.WriteString('Schokvartalnij','ZaVodopostachannym',cbZaVodopostachannym.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaOhoronojuVodojm',cbZaOhoronojuVodojm.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaOhoronojuAtmosfernogoPovitry',cbZaOhoronojuAtmosfernogoPovitrya.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaOhoronojuGrunta',cbZaOhoronojuGruntu.Text);
    INIAZZ.WriteString('Schokvartalnij','RadiacijnoiBezpeki',cbRadiacijnoiBezpeki.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaKomunalnimiObjektami',cbZaKomunalnimiObjektami.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaLPZ',cbZaLPZ.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaPromislovimiPidpriemstvami',cbZaPromislovimiPidpriemstvami.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaDDZ',cbZaDitychimiTaPidlitkovimiZakladami.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaPid[riemstvamiHarchovoiPromislovosti',cbZaPidpriemstvamiHarchovoiPromislovosti.Text);
    INIAZZ.WriteString('Schokvartalnij','GromadskogoHarchuvanny',cbGromadskogoHarchuvanny.Text);
    INIAZZ.WriteString('Schokvartalnij','Torgivli',cbTorgivli.Text);
    INIAZZ.WriteString('Schokvartalnij','ZaSudnami',cbZaSudnami.Text);
    frmZvyzok.Close;
    INIAZZ.Free;
    exit;
  end;

  if tsZvyzokZSchomisychnimZvitom.TabVisible then
  begin
    INIAZZ.WriteString('Order','KG',cbKG.Text);
    INIAZZ.WriteString('Order','GH',cbGH.Text);
    INIAZZ.WriteString('Order','GDP',cbGDP.Text);
    INIAZZ.WriteString('Order','GPr',cbGPr.Text);
    INIAZZ.WriteString('Order','RV',cbRV.Text);
    INIAZZ.WriteString('Order','EV',cbEV.Text);
    INIAZZ.WriteString('Order','VMP',cbVMP.Text);
    INIAZZ.Free;
    frmZvyzok.Close;
    exit;
  end;

  if tsRezultatOskarzhenny.TabVisible then
  begin
    INIAZZ.WriteString('Results','Vidmineno',cbVidmineno.Text);
    INIAZZ.WriteString('Results','NovijRozglyad',cbNaNovijRozglyd.Text);
    INIAZZ.WriteString('Results','ZalishenoVSili',cbZalishenoVSili.Text);
    frmZvyzok.Close;
    INIAZZ.Free;
    exit;
  end;
end;

procedure TfrmZvyzok.aCancelExecute(Sender: TObject);
begin
  frmZvyzok.Close;
end;

procedure TfrmZvyzok.aKG_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aGH_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aGDP_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aGPr_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aRV_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aEV_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aVMP_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aKG_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbKG.Text:='';
    cbKG.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbKG.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aGH_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbGH.Text:='';
    cbGH.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbGH.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aGDP_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbGDP.Text:='';
    cbGDP.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbGDP.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aGPr_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbGPr.Text:='';
    cbGPr.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbGPr.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aRV_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbRV.Text:='';
    cbRV.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbRV.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aEV_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbEV.Text:='';
    cbEV.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbEV.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aVMP_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from VIDDILENNY, RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by VIDDILENNY.NAZVAVIDDILENNY';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    cbVMP.Text:='';
    cbVMP.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbVMP.Items.Add(qZvyazok.FieldByName('NAZVAVIDDILENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aUpdate_Schomisychnij_AllExecute(Sender: TObject);
begin
  aKG_UpdateExecute(sender);
  aGH_UpdateExecute(sender);
  aGDP_UpdateExecute(sender);
  aGPr_UpdateExecute(sender);
  aRV_UpdateExecute(sender);
  aEV_UpdateExecute(sender);
  aVMP_UpdateExecute(sender);
end;

procedure TfrmZvyzok.aZalishenoVSili_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aOskarzhennyExecute(sender);
  frmOskargenny.aChoice.Enabled:=true;
  frmOskargenny.Left:=frmMain.Left+70;
  frmOskargenny.Top:=frmMain.Top+70;
  frmOskargenny.Width:=frmMain.Width-70;
  frmOskargenny.Height:=frmMain.Height-70;
  frmOskargenny.Position:=poMainFormCenter;
  frmOskargenny.FormStyle:=fsNormal;
  frmOskargenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aNaNovijRozglyd_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aOskarzhennyExecute(sender);
  frmOskargenny.aChoice.Enabled:=true;
  frmOskargenny.Left:=frmMain.Left+70;
  frmOskargenny.Top:=frmMain.Top+70;
  frmOskargenny.Width:=frmMain.Width-70;
  frmOskargenny.Height:=frmMain.Height-70;
  frmOskargenny.Position:=poMainFormCenter;
  frmOskargenny.FormStyle:=fsNormal;
  frmOskargenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aVidmineno_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aOskarzhennyExecute(sender);
  frmOskargenny.aChoice.Enabled:=true;
  frmOskargenny.Left:=frmMain.Left+70;
  frmOskargenny.Top:=frmMain.Top+70;
  frmOskargenny.Width:=frmMain.Width-70;
  frmOskargenny.Height:=frmMain.Height-70;
  frmOskargenny.Position:=poMainFormCenter;
  frmOskargenny.FormStyle:=fsNormal;
  frmOskargenny.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aVidmineno_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from OSKARZHENNY order by OSKARZHENNY';
    qZvyazok.Open;
    cbVidmineno.Text:='';
    cbVidmineno.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbVidmineno.Items.Add(qZvyazok.FieldByName('OSKARZHENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aNaNovijRozglyd_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from OSKARZHENNY order by OSKARZHENNY';
    qZvyazok.Open;
    cbNaNovijRozglyd.Text:='';
    cbNaNovijRozglyd.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbNaNovijRozglyd.Items.Add(qZvyazok.FieldByName('OSKARZHENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZalishenoVSili_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from OSKARZHENNY order by OSKARZHENNY';
    qZvyazok.Open;
    cbZalishenoVSili.Text:='';
    cbZalishenoVSili.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZalishenoVSili.Items.Add(qZvyazok.FieldByName('OSKARZHENNY').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aUpdate_RezultatiOskarzhennyExecute(Sender: TObject);
begin
  aVidmineno_UpdateExecute(sender);
  aNaNovijRozglyd_UpdateExecute(sender);
  aZalishenoVSili_UpdateExecute(sender);
end;

procedure TfrmZvyzok.aZaVodopostachannym_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaOhoronojuVodojm_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaOhoronojuAtmosfernogoPovitry_ChoiceExecute(
  Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaOhoronojuGruntu_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aRadiacijnoiBezpeki_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaKomunalnimiObjektami_ChoiceExecute(
  Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaLPZ_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaPromislovimiPidpriemstvami_ChoiceExecute(
  Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaDitychimiTaPidlitkovimiZakladami_ChoiceExecute(
  Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaPidpriemstvamiHarchovoiPromislovosti_ChoiceExecute(
  Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aGromadskogoHarchuvanny_ChoiceExecute(
  Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aTorgivli_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aZaSudnami_ChoiceExecute(Sender: TObject);
begin
  frmZvyzok.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmZvyzok.aUpdateSchokvartalnijExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    aZaVodopostachannym_UpdateExecute(sender);
    aZaOhoronojuVodojm_UpdateExecute(sender);
    aZaOhoronojuAtmosfernogoPovitry_UpdateExecute(sender);
    aZaOhoronojuGruntu_UpdateExecute(sender);
    aRadiacijnoiBezpeki_UpdateExecute(sender);
    aZaKomunalnimiObjektami_UpdateExecute(sender);
    aZaLPZ_UpdateExecute(sender);
    aZaPromislovimiPidpriemstvami_UpdateExecute(sender);
    aZaDitychimiTaPidlitkovimiZakladami_UpdateExecute(sender);
    aZaPidpriemstvamiHarchovoiPromislovosti_UpdateExecute(sender);
    aGromadskogoHarchuvanny_UpdateExecute(sender);
    aTorgivli_UpdateExecute(sender);
    aZaSudnami_UpdateExecute(sender);
  end;
end;

procedure TfrmZvyzok.aZaVodopostachannym_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaVodopostachannym.Text:='';
    cbZaVodopostachannym.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaVodopostachannym.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaOhoronojuVodojm_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaOhoronojuVodojm.Text:='';
    cbZaOhoronojuVodojm.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaOhoronojuVodojm.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaOhoronojuAtmosfernogoPovitry_UpdateExecute(
  Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaOhoronojuAtmosfernogoPovitrya.Text:='';
    cbZaOhoronojuAtmosfernogoPovitrya.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaOhoronojuAtmosfernogoPovitrya.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaOhoronojuGruntu_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaOhoronojuGruntu.Text:='';
    cbZaOhoronojuGruntu.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaOhoronojuGruntu.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aRadiacijnoiBezpeki_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbRadiacijnoiBezpeki.Text:='';
    cbRadiacijnoiBezpeki.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbRadiacijnoiBezpeki.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaKomunalnimiObjektami_UpdateExecute(
  Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaKomunalnimiObjektami.Text:='';
    cbZaKomunalnimiObjektami.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaKomunalnimiObjektami.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaLPZ_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaLPZ.Text:='';
    cbZaLPZ.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaLPZ.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaPromislovimiPidpriemstvami_UpdateExecute(
  Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaPromislovimiPidpriemstvami.Text:='';
    cbZaPromislovimiPidpriemstvami.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaPromislovimiPidpriemstvami.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaDitychimiTaPidlitkovimiZakladami_UpdateExecute(
  Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaDitychimiTaPidlitkovimiZakladami.Text:='';
    cbZaDitychimiTaPidlitkovimiZakladami.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaDitychimiTaPidlitkovimiZakladami.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaPidpriemstvamiHarchovoiPromislovosti_UpdateExecute(
  Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaPidpriemstvamiHarchovoiPromislovosti.Text:='';
    cbZaPidpriemstvamiHarchovoiPromislovosti.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaPidpriemstvamiHarchovoiPromislovosti.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aGromadskogoHarchuvanny_UpdateExecute(
  Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbGromadskogoHarchuvanny.Text:='';
    cbGromadskogoHarchuvanny.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbGromadskogoHarchuvanny.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aTorgivli_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbTorgivli.Text:='';
    cbTorgivli.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbTorgivli.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

procedure TfrmZvyzok.aZaSudnami_UpdateExecute(Sender: TObject);
begin
  with frmZvyzok do
  begin
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qZvyazok.Open;
    cbZaSudnami.Text:='';
    cbZaSudnami.Items.Clear;
    qZvyazok.First;
    while not qZvyazok.Eof do
    begin
      cbZaSudnami.Items.Add(qZvyazok.FieldByName('OBJEKTNAGLYDU').Value);
      qZvyazok.Next;
    end;
  end;
end;

end.
