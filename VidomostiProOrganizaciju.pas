unit VidomostiProOrganizaciju;

interface

uses
  Forms, Classes, ActnList, DB, IBCustomDataSet, IBQuery, StdCtrls,
  Controls, ExtCtrls, ComCtrls, IniFiles, SysUtils;

type
  TfrmVidomostiProOrganizaciju = class(TForm)
    Label2: TLabel;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    btnRajonUpdate: TButton;
    Label16: TLabel;
    Label17: TLabel;
    btnMinistryUpdate: TButton;
    btnTeritoryUpdate: TButton;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    dsTertory: TDataSource;
    qTeritory: TIBQuery;
    alVidomostriProOrganizaciju: TActionList;
    aCancel: TAction;
    aOK: TAction;
    aMinistryUpdate: TAction;
    aMinistryChange: TAction;
    aTeritoryUpdate: TAction;
    aTeritoryChange: TAction;
    aDistrictUpdate: TAction;
    pcVidomostiProOrganizaciju: TPageControl;
    tsDirector: TTabSheet;
    rgKerivnik: TRadioGroup;
    pcPadezh: TPageControl;
    tsNazivnij: TTabSheet;
    tsRodovij: TTabSheet;
    tsDavalnij: TTabSheet;
    tsZnahidnij: TTabSheet;
    tsOrudnij: TTabSheet;
    tsMiscevij: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    btnVidminok: TButton;
    edtPIBKerivnika_NV: TEdit;
    edtPosadaKerivnika_NV: TEdit;
    edtPidpis1_NV: TEdit;
    edtPidpis2_NV: TEdit;
    edtPIBKerivnika_RV: TEdit;
    Label21: TLabel;
    edtPosadaKerivnika_RV: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    edtPidpis1_RV: TEdit;
    edtPidpis2_RV: TEdit;
    edtPIBKerivnika_DV: TEdit;
    Label24: TLabel;
    edtPosadaKerivnika_DV: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    edtPidpis1_DV: TEdit;
    edtPidpis2_DV: TEdit;
    edtPIBKerivnika_ZV: TEdit;
    Label27: TLabel;
    edtPosadaKerivnika_ZV: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    edtPidpis1_ZV: TEdit;
    edtPidpis2_ZV: TEdit;
    edtPIBKerivnika_OV: TEdit;
    Label30: TLabel;
    edtPosadaKerivnika_OV: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    edtPidpis1_OV: TEdit;
    edtPidpis2_OV: TEdit;
    edtPIBKerivnika_MV: TEdit;
    Label33: TLabel;
    edtPosadaKerivnika_MV: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    edtPidpis1_MV: TEdit;
    edtPidpis2_MV: TEdit;
    tsFirm: TTabSheet;
    Label1: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    edtAdresa: TEdit;
    edtPhone: TEdit;
    edtFax: TEdit;
    edtE_Mail: TEdit;
    edtWWW: TEdit;
    edtFullName: TEdit;
    edtName: TEdit;
    Label3: TLabel;
    edtName_RV: TEdit;
    tsBank: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtRozrahunkovijRahunok: TEdit;
    edtKod: TEdit;
    edtBank: TEdit;
    edtMFO: TEdit;
    edtOKPO: TEdit;
    edtOderzhuvach: TEdit;
    aVidminokChange: TAction;
    Label7: TLabel;
    edtKodKerivnika: TEdit;
    btnMinistryChoice: TButton;
    btnTeritoryChoice: TButton;
    btnRajonChoice: TButton;
    aMinistryChoice: TAction;
    aTeritoryChoice: TAction;
    aDistrictChoice: TAction;
    Label8: TLabel;
    cbSESLevel: TComboBox;
    btnSESLevel_Update: TButton;
    btnSESLevel_Choice: TButton;
    aSESLevel_Update: TAction;
    aSESLevel_Choice: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aMinistryUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictUpdateExecute(Sender: TObject);
    procedure aVidminokChangeExecute(Sender: TObject);
    procedure rgKerivnikClick(Sender: TObject);
    procedure aSESLevel_UpdateExecute(Sender: TObject);
  end;

var
  frmVidomostiProOrganizaciju: TfrmVidomostiProOrganizaciju;
//  azz: TIniFile;

implementation

uses
  Main;

{$R *.dfm}

procedure TfrmVidomostiProOrganizaciju.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidomostiProOrganizaciju.aCancelExecute(Sender: TObject);
begin
  frmVidomostiProOrganizaciju.Close;
end;

procedure TfrmVidomostiProOrganizaciju.aOKExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RIVEN_SES order by KOD';
    qTeritory.Open;
    if
      qTeritory.Locate('RIVEN',cbSESLevel.Text,[])
    then
      INIAZZ.WriteInteger('Teritory','Level',qTeritory.FieldByName('KOD').Value)
    else
      INIAZZ.WriteInteger('Teritory','Level',-1);

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    if
      qTeritory.Locate('MINISTRY',cbMinistry.Text,[])
    then
      INIAZZ.WriteInteger('Teritory','Ministry',qTeritory.FieldByName('KOD').Value)
    else
      INIAZZ.WriteInteger('Teritory','Ministry',0);

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY='''+cbMinistry.Text+''' and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Open;
    if
      qTeritory.Locate('TERITORY',cbTeritory.Text,[])
    then
      INIAZZ.WriteInteger('Teritory','Teritory',qTeritory.FieldByName('KOD').Value)
    else
      INIAZZ.WriteInteger('Teritory','Teritory',0);

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY='''+cbTeritory.Text+''' and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Open;
    if
      qTeritory.Locate('RAJON',cbRajon.Text,[])
    then
      INIAZZ.WriteInteger('Teritory','District',qTeritory.FieldByName('KOD').Value)
    else
      INIAZZ.WriteInteger('Teritory','District',0);

    pcVidomostiProOrganizaciju.ActivePage:=tsDirector;
    INIAZZ.WriteInteger('System','Position',rgKerivnik.ItemIndex);
    case rgKerivnik.ItemIndex of
      0:
        begin
          pcPadezh.ActivePage:=tsNazivnij;
          INIAZZ.WriteString('Director','LNP_NV',edtPIBKerivnika_NV.Text);
          INIAZZ.WriteString('Director','Position_NV',edtPosadaKerivnika_NV.Text);
          INIAZZ.WriteString('Director','Signature1_NV',edtPidpis1_NV.Text);
          INIAZZ.WriteString('Director','Signature2_NV',edtPidpis2_NV.Text);
          pcPadezh.ActivePage:=tsRodovij;
          INIAZZ.WriteString('Director','LNP_RV',edtPIBKerivnika_RV.Text);
          INIAZZ.WriteString('Director','Position_RV',edtPosadaKerivnika_RV.Text);
          INIAZZ.WriteString('Director','Signature1_RV',edtPidpis1_RV.Text);
          INIAZZ.WriteString('Director','Signature2_RV',edtPidpis2_RV.Text);
          pcPadezh.ActivePage:=tsDavalnij;
          INIAZZ.WriteString('Director','LNP_DV',edtPIBKerivnika_DV.Text);
          INIAZZ.WriteString('Director','Position_DV',edtPosadaKerivnika_DV.Text);
          INIAZZ.WriteString('Director','Signature1_DV',edtPidpis1_DV.Text);
          INIAZZ.WriteString('Director','Signature2_DV',edtPidpis2_DV.Text);
          pcPadezh.ActivePage:=tsZnahidnij;
          INIAZZ.WriteString('Director','LNP_ZV',edtPIBKerivnika_ZV.Text);
          INIAZZ.WriteString('Director','Position_ZV',edtPosadaKerivnika_ZV.Text);
          INIAZZ.WriteString('Director','Signature1_ZV',edtPidpis1_ZV.Text);
          INIAZZ.WriteString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
          pcPadezh.ActivePage:=tsOrudnij;
          INIAZZ.WriteString('Director','LNP_OV',edtPIBKerivnika_OV.Text);
          INIAZZ.WriteString('Director','Position_OV',edtPosadaKerivnika_OV.Text);
          INIAZZ.WriteString('Director','Signature1_OV',edtPidpis1_OV.Text);
          INIAZZ.WriteString('Director','Signature2_OV',edtPidpis2_OV.Text);
          pcPadezh.ActivePage:=tsMiscevij;
          INIAZZ.WriteString('Director','LNP_MV',edtPIBKerivnika_MV.Text);
          INIAZZ.WriteString('Director','Position_MV',edtPosadaKerivnika_MV.Text);
          INIAZZ.WriteString('Director','Signature1_MV',edtPidpis1_MV.Text);
          INIAZZ.WriteString('Director','Signature2_MV',edtPidpis2_MV.Text);
          INIAZZ.WriteString('Director','Kod',edtKodKerivnika.Text);
        end;
      1:
        begin
          pcPadezh.ActivePage:=tsNazivnij;
          INIAZZ.WriteString('Director1','LNP_NV',edtPIBKerivnika_NV.Text);
          INIAZZ.WriteString('Director1','Position_NV',edtPosadaKerivnika_NV.Text);
          INIAZZ.WriteString('Director1','Signature1_NV',edtPidpis1_NV.Text);
          INIAZZ.WriteString('Director1','Signature2_NV',edtPidpis2_NV.Text);
          pcPadezh.ActivePage:=tsRodovij;
          INIAZZ.WriteString('Director1','LNP_RV',edtPIBKerivnika_RV.Text);
          INIAZZ.WriteString('Director1','Position_RV',edtPosadaKerivnika_RV.Text);
          INIAZZ.WriteString('Director1','Signature1_RV',edtPidpis1_RV.Text);
          INIAZZ.WriteString('Director1','Signature2_RV',edtPidpis2_RV.Text);
          pcPadezh.ActivePage:=tsDavalnij;
          INIAZZ.WriteString('Director1','LNP_DV',edtPIBKerivnika_DV.Text);
          INIAZZ.WriteString('Director1','Position_DV',edtPosadaKerivnika_DV.Text);
          INIAZZ.WriteString('Director1','Signature1_DV',edtPidpis1_DV.Text);
          INIAZZ.WriteString('Director1','Signature2_DV',edtPidpis2_DV.Text);
          pcPadezh.ActivePage:=tsZnahidnij;
          INIAZZ.WriteString('Director1','LNP_ZV',edtPIBKerivnika_ZV.Text);
          INIAZZ.WriteString('Director1','Position_ZV',edtPosadaKerivnika_ZV.Text);
          INIAZZ.WriteString('Director1','Signature1_ZV',edtPidpis1_ZV.Text);
          INIAZZ.WriteString('Director1','Signature2_ZV',edtPidpis2_ZV.Text);
          pcPadezh.ActivePage:=tsOrudnij;
          INIAZZ.WriteString('Director1','LNP_OV',edtPIBKerivnika_OV.Text);
          INIAZZ.WriteString('Director1','Position_OV',edtPosadaKerivnika_OV.Text);
          INIAZZ.WriteString('Director1','Signature1_OV',edtPidpis1_OV.Text);
          INIAZZ.WriteString('Director1','Signature2_OV',edtPidpis2_OV.Text);
          pcPadezh.ActivePage:=tsMiscevij;
          INIAZZ.WriteString('Director1','LNP_MV',edtPIBKerivnika_MV.Text);
          INIAZZ.WriteString('Director1','Position_MV',edtPosadaKerivnika_MV.Text);
          INIAZZ.WriteString('Director1','Signature1_MV',edtPidpis1_MV.Text);
          INIAZZ.WriteString('Director1','Signature2_MV',edtPidpis2_MV.Text);
          INIAZZ.WriteString('Director1','Kod',edtKodKerivnika.Text);
        end;
      2:
        begin
          pcPadezh.ActivePage:=tsNazivnij;
          INIAZZ.WriteString('Director2','LNP_NV',edtPIBKerivnika_NV.Text);
          INIAZZ.WriteString('Director2','Position_NV',edtPosadaKerivnika_NV.Text);
          INIAZZ.WriteString('Director2','Signature1_NV',edtPidpis1_NV.Text);
          INIAZZ.WriteString('Director2','Signature2_NV',edtPidpis2_NV.Text);
          pcPadezh.ActivePage:=tsRodovij;
          INIAZZ.WriteString('Director2','LNP_RV',edtPIBKerivnika_RV.Text);
          INIAZZ.WriteString('Director2','Position_RV',edtPosadaKerivnika_RV.Text);
          INIAZZ.WriteString('Director2','Signature1_RV',edtPidpis1_RV.Text);
          INIAZZ.WriteString('Director2','Signature2_RV',edtPidpis2_RV.Text);
          pcPadezh.ActivePage:=tsDavalnij;
          INIAZZ.WriteString('Director2','LNP_DV',edtPIBKerivnika_DV.Text);
          INIAZZ.WriteString('Director2','Position_DV',edtPosadaKerivnika_DV.Text);
          INIAZZ.WriteString('Director2','Signature1_DV',edtPidpis1_DV.Text);
          INIAZZ.WriteString('Director2','Signature2_DV',edtPidpis2_DV.Text);
          pcPadezh.ActivePage:=tsZnahidnij;
          INIAZZ.WriteString('Director2','LNP_ZV',edtPIBKerivnika_ZV.Text);
          INIAZZ.WriteString('Director2','Position_ZV',edtPosadaKerivnika_ZV.Text);
          INIAZZ.WriteString('Director2','Signature1_ZV',edtPidpis1_ZV.Text);
          INIAZZ.WriteString('Director2','Signature2_ZV',edtPidpis2_ZV.Text);
          pcPadezh.ActivePage:=tsOrudnij;
          INIAZZ.WriteString('Director2','LNP_OV',edtPIBKerivnika_OV.Text);
          INIAZZ.WriteString('Director2','Position_OV',edtPosadaKerivnika_OV.Text);
          INIAZZ.WriteString('Director2','Signature1_OV',edtPidpis1_OV.Text);
          INIAZZ.WriteString('Director2','Signature2_OV',edtPidpis2_OV.Text);
          pcPadezh.ActivePage:=tsMiscevij;
          INIAZZ.WriteString('Director2','LNP_MV',edtPIBKerivnika_MV.Text);
          INIAZZ.WriteString('Director2','Position_MV',edtPosadaKerivnika_MV.Text);
          INIAZZ.WriteString('Director2','Signature1_MV',edtPidpis1_MV.Text);
          INIAZZ.WriteString('Director2','Signature2_MV',edtPidpis2_MV.Text);
          INIAZZ.WriteString('Director2','Kod',edtKodKerivnika.Text);
        end;
    end;

    pcVidomostiProOrganizaciju.ActivePage:=tsFirm;
    INIAZZ.WriteString('Firm','Adres',edtAdresa.Text);
    INIAZZ.WriteString('Firm','Phone',edtPhone.Text);
    INIAZZ.WriteString('Firm','Fax',edtFax.Text);
    INIAZZ.WriteString('Firm','E-Mail',edtE_Mail.Text);
    INIAZZ.WriteString('Firm','WWW',edtWWW.Text);
    INIAZZ.WriteString('Firm','FullName',edtFullName.Text);
    INIAZZ.WriteString('Firm','Name',edtName.Text);
    INIAZZ.WriteString('Firm','Name_RV',edtName_RV.Text);

    pcVidomostiProOrganizaciju.ActivePage:=tsBank;
    INIAZZ.WriteString('Bank','RR',edtRozrahunkovijRahunok.Text);
    INIAZZ.WriteString('Bank','Kod',edtKod.Text);
    INIAZZ.WriteString('Bank','Bank',edtBank.Text);
    INIAZZ.WriteString('Bank','MFO',edtMFO.Text);
    INIAZZ.WriteString('Bank','OKPO',edtOKPO.Text);
    INIAZZ.WriteString('Bank','Orderzhuvach',edtOderzhuvach.Text);
  end;
  INIAZZ.Free;
  frmVidomostiProOrganizaciju.Close;
end;

procedure TfrmVidomostiProOrganizaciju.aMinistryUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    cbMinistry.Text:='';
    cbMinistry.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      if not qTeritory.FieldByName('MINISTRY').IsNull then cbMinistry.Items.Add(qTeritory.FieldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    cbTeritory.Items.Clear;
    cbTeritory.Text:='';
    cbRajon.Items.Clear;
    cbRajon.Text:='';
  end;
end;

procedure TfrmVidomostiProOrganizaciju.aMinistryChangeExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=cbMinistry.Text;
    qTeritory.Open;
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    cbRajon.Items.Clear;
    cbRajon.Text:='';
  end;
end;

procedure TfrmVidomostiProOrganizaciju.aTeritoryUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=cbMinistry.Text;
    qTeritory.Open;
    cbTeritory.Items.Clear;
    cbTeritory.Text:='';
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      if not qTeritory.FieldByName('TERITORY').IsNull then cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    cbRajon.Items.Clear;
    cbRajon.Text:='';
  end;
end;

procedure TfrmVidomostiProOrganizaciju.aTeritoryChangeExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmVidomostiProOrganizaciju.aDistrictUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbRajon.Items.Clear;
    cbRajon.Text:='';
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      if not qTeritory.FieldByName('RAJON').IsNull then cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmVidomostiProOrganizaciju.aVidminokChangeExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    edtPIBKerivnika_RV.Text:=edtPIBKerivnika_NV.Text;
    edtPIBKerivnika_DV.Text:=edtPIBKerivnika_NV.Text;
    edtPIBKerivnika_ZV.Text:=edtPIBKerivnika_NV.Text;
    edtPIBKerivnika_OV.Text:=edtPIBKerivnika_NV.Text;
    edtPIBKerivnika_MV.Text:=edtPIBKerivnika_NV.Text;
    edtPosadaKerivnika_RV.Text:=edtPosadaKerivnika_NV.Text;
    edtPosadaKerivnika_DV.Text:=edtPosadaKerivnika_NV.Text;
    edtPosadaKerivnika_ZV.Text:=edtPosadaKerivnika_NV.Text;
    edtPosadaKerivnika_OV.Text:=edtPosadaKerivnika_NV.Text;
    edtPosadaKerivnika_MV.Text:=edtPosadaKerivnika_NV.Text;
    edtPidpis1_RV.Text:=edtPidpis1_NV.Text;
    edtPidpis1_DV.Text:=edtPidpis1_NV.Text;
    edtPidpis1_ZV.Text:=edtPidpis1_NV.Text;
    edtPidpis1_OV.Text:=edtPidpis1_NV.Text;
    edtPidpis1_MV.Text:=edtPidpis1_NV.Text;
    edtPidpis2_RV.Text:=edtPidpis2_NV.Text;
    edtPidpis2_DV.Text:=edtPidpis2_NV.Text;
    edtPidpis2_ZV.Text:=edtPidpis2_NV.Text;
    edtPidpis2_OV.Text:=edtPidpis2_NV.Text;
    edtPidpis2_MV.Text:=edtPidpis2_NV.Text;
  end;
end;

procedure TfrmVidomostiProOrganizaciju.rgKerivnikClick(Sender: TObject);
var
  position: integer;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  position:=INIAZZ.ReadInteger('System','Position',position);
  case position of
    0:
      begin
      //запись значений
        pcPadezh.ActivePage:=tsNazivnij;
        INIAZZ.WriteString('Director','LNP_NV',edtPIBKerivnika_NV.Text);
        INIAZZ.WriteString('Director','Position_NV',edtPosadaKerivnika_NV.Text);
        INIAZZ.WriteString('Director','Signature1_NV',edtPidpis1_NV.Text);
        INIAZZ.WriteString('Director','Signature2_NV',edtPidpis2_NV.Text);
        pcPadezh.ActivePage:=tsRodovij;
        INIAZZ.WriteString('Director','LNP_RV',edtPIBKerivnika_RV.Text);
        INIAZZ.WriteString('Director','Position_RV',edtPosadaKerivnika_RV.Text);
        INIAZZ.WriteString('Director','Signature1_RV',edtPidpis1_RV.Text);
        INIAZZ.WriteString('Director','Signature2_RV',edtPidpis2_RV.Text);
        pcPadezh.ActivePage:=tsDavalnij;
        INIAZZ.WriteString('Director','LNP_DV',edtPIBKerivnika_DV.Text);
        INIAZZ.WriteString('Director','Position_DV',edtPosadaKerivnika_DV.Text);
        INIAZZ.WriteString('Director','Signature1_DV',edtPidpis1_DV.Text);
        INIAZZ.WriteString('Director','Signature2_DV',edtPidpis2_DV.Text);
        pcPadezh.ActivePage:=tsZnahidnij;
        INIAZZ.WriteString('Director','LNP_ZV',edtPIBKerivnika_ZV.Text);
        INIAZZ.WriteString('Director','Position_ZV',edtPosadaKerivnika_ZV.Text);
        INIAZZ.WriteString('Director','Signature1_ZV',edtPidpis1_ZV.Text);
        INIAZZ.WriteString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
        pcPadezh.ActivePage:=tsOrudnij;
        INIAZZ.WriteString('Director','LNP_OV',edtPIBKerivnika_OV.Text);
        INIAZZ.WriteString('Director','Position_OV',edtPosadaKerivnika_OV.Text);
        INIAZZ.WriteString('Director','Signature1_OV',edtPidpis1_OV.Text);
        INIAZZ.WriteString('Director','Signature2_OV',edtPidpis2_OV.Text);
        pcPadezh.ActivePage:=tsMiscevij;
        INIAZZ.WriteString('Director','LNP_MV',edtPIBKerivnika_MV.Text);
        INIAZZ.WriteString('Director','Position_MV',edtPosadaKerivnika_MV.Text);
        INIAZZ.WriteString('Director','Signature1_MV',edtPidpis1_MV.Text);
        INIAZZ.WriteString('Director','Signature2_MV',edtPidpis2_MV.Text);
        INIAZZ.WriteString('Director','Kod',edtKodKerivnika.Text);
      //чтение значений
        case rgKerivnik.ItemIndex of
          0:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director','Kod',edtKodKerivnika.Text);
            end;
          1:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director1','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director1','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director1','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director1','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director1','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director1','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director1','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director1','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director1','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director1','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director1','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director1','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director1','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director1','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director1','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director1','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director1','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director1','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director1','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director1','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director1','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director1','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director1','Kod',edtKodKerivnika.Text);
            end;
          2:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director2','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director2','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director2','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director2','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director2','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director2','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director2','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director2','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director2','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director2','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director2','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director2','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director2','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director2','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director2','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director2','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director2','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director2','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director2','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director2','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director2','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director2','Kod',edtKodKerivnika.Text);
            end;
        end;
        INIAZZ.WriteInteger('System','Position',rgKerivnik.ItemIndex);
      end;
    1:
      begin
      //запись значений
        pcPadezh.ActivePage:=tsNazivnij;
        INIAZZ.WriteString('Director1','LNP_NV',edtPIBKerivnika_NV.Text);
        INIAZZ.WriteString('Director1','Position_NV',edtPosadaKerivnika_NV.Text);
        INIAZZ.WriteString('Director1','Signature1_NV',edtPidpis1_NV.Text);
        INIAZZ.WriteString('Director1','Signature2_NV',edtPidpis2_NV.Text);
        pcPadezh.ActivePage:=tsRodovij;
        INIAZZ.WriteString('Director1','LNP_RV',edtPIBKerivnika_RV.Text);
        INIAZZ.WriteString('Director1','Position_RV',edtPosadaKerivnika_RV.Text);
        INIAZZ.WriteString('Director1','Signature1_RV',edtPidpis1_RV.Text);
        INIAZZ.WriteString('Director1','Signature2_RV',edtPidpis2_RV.Text);
        pcPadezh.ActivePage:=tsDavalnij;
        INIAZZ.WriteString('Director1','LNP_DV',edtPIBKerivnika_DV.Text);
        INIAZZ.WriteString('Director1','Position_DV',edtPosadaKerivnika_DV.Text);
        INIAZZ.WriteString('Director1','Signature1_DV',edtPidpis1_DV.Text);
        INIAZZ.WriteString('Director1','Signature2_DV',edtPidpis2_DV.Text);
        pcPadezh.ActivePage:=tsZnahidnij;
        INIAZZ.WriteString('Director1','LNP_ZV',edtPIBKerivnika_ZV.Text);
        INIAZZ.WriteString('Director1','Position_ZV',edtPosadaKerivnika_ZV.Text);
        INIAZZ.WriteString('Director1','Signature1_ZV',edtPidpis1_ZV.Text);
        INIAZZ.WriteString('Director1','Signature2_ZV',edtPidpis2_ZV.Text);
        pcPadezh.ActivePage:=tsOrudnij;
        INIAZZ.WriteString('Director1','LNP_OV',edtPIBKerivnika_OV.Text);
        INIAZZ.WriteString('Director1','Position_OV',edtPosadaKerivnika_OV.Text);
        INIAZZ.WriteString('Director1','Signature1_OV',edtPidpis1_OV.Text);
        INIAZZ.WriteString('Director1','Signature2_OV',edtPidpis2_OV.Text);
        pcPadezh.ActivePage:=tsMiscevij;
        INIAZZ.WriteString('Director1','LNP_MV',edtPIBKerivnika_MV.Text);
        INIAZZ.WriteString('Director1','Position_MV',edtPosadaKerivnika_MV.Text);
        INIAZZ.WriteString('Director1','Signature1_MV',edtPidpis1_MV.Text);
        INIAZZ.WriteString('Director1','Signature2_MV',edtPidpis2_MV.Text);
        INIAZZ.WriteString('Director1','Kod',edtKodKerivnika.Text);
      //чтение значений
        case rgKerivnik.ItemIndex of
          0:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director','Kod',edtKodKerivnika.Text);
            end;
          1:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director1','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director1','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director1','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director1','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director1','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director1','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director1','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director1','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director1','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director1','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director1','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director1','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director1','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director1','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director1','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director1','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director1','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director1','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director1','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director1','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director1','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director1','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director1','Kod',edtKodKerivnika.Text);
            end;
          2:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director2','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director2','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director2','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director2','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director2','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director2','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director2','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director2','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director2','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director2','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director2','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director2','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director2','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director2','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director2','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director2','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director2','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director2','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director2','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director2','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director2','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director2','Kod',edtKodKerivnika.Text);
            end;
        end;
        INIAZZ.WriteInteger('System','Position',rgKerivnik.ItemIndex);
      end;
    2:
      begin
      //запись значений
        pcPadezh.ActivePage:=tsNazivnij;
        INIAZZ.WriteString('Director2','LNP_NV',edtPIBKerivnika_NV.Text);
        INIAZZ.WriteString('Director2','Position_NV',edtPosadaKerivnika_NV.Text);
        INIAZZ.WriteString('Director2','Signature1_NV',edtPidpis1_NV.Text);
        INIAZZ.WriteString('Director2','Signature2_NV',edtPidpis2_NV.Text);
        pcPadezh.ActivePage:=tsRodovij;
        INIAZZ.WriteString('Director2','LNP_RV',edtPIBKerivnika_RV.Text);
        INIAZZ.WriteString('Director2','Position_RV',edtPosadaKerivnika_RV.Text);
        INIAZZ.WriteString('Director2','Signature1_RV',edtPidpis1_RV.Text);
        INIAZZ.WriteString('Director2','Signature2_RV',edtPidpis2_RV.Text);
        pcPadezh.ActivePage:=tsDavalnij;
        INIAZZ.WriteString('Director2','LNP_DV',edtPIBKerivnika_DV.Text);
        INIAZZ.WriteString('Director2','Position_DV',edtPosadaKerivnika_DV.Text);
        INIAZZ.WriteString('Director2','Signature1_DV',edtPidpis1_DV.Text);
        INIAZZ.WriteString('Director2','Signature2_DV',edtPidpis2_DV.Text);
        pcPadezh.ActivePage:=tsZnahidnij;
        INIAZZ.WriteString('Director2','LNP_ZV',edtPIBKerivnika_ZV.Text);
        INIAZZ.WriteString('Director2','Position_ZV',edtPosadaKerivnika_ZV.Text);
        INIAZZ.WriteString('Director2','Signature1_ZV',edtPidpis1_ZV.Text);
        INIAZZ.WriteString('Director2','Signature2_ZV',edtPidpis2_ZV.Text);
        pcPadezh.ActivePage:=tsOrudnij;
        INIAZZ.WriteString('Director2','LNP_OV',edtPIBKerivnika_OV.Text);
        INIAZZ.WriteString('Director2','Position_OV',edtPosadaKerivnika_OV.Text);
        INIAZZ.WriteString('Director2','Signature1_OV',edtPidpis1_OV.Text);
        INIAZZ.WriteString('Director2','Signature2_OV',edtPidpis2_OV.Text);
        pcPadezh.ActivePage:=tsMiscevij;
        INIAZZ.WriteString('Director2','LNP_MV',edtPIBKerivnika_MV.Text);
        INIAZZ.WriteString('Director2','Position_MV',edtPosadaKerivnika_MV.Text);
        INIAZZ.WriteString('Director2','Signature1_MV',edtPidpis1_MV.Text);
        INIAZZ.WriteString('Director2','Signature2_MV',edtPidpis2_MV.Text);
        INIAZZ.WriteString('Director2','Kod',edtKodKerivnika.Text);
      //чтение значений
        case rgKerivnik.ItemIndex of
          0:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director','Kod',edtKodKerivnika.Text);
            end;
          1:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director1','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director1','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director1','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director1','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director1','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director1','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director1','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director1','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director1','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director1','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director1','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director1','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director1','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director1','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director1','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director1','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director1','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director1','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director1','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director1','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director1','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director1','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director1','Kod',edtKodKerivnika.Text);
            end;
          2:
            begin
              pcPadezh.ActivePage:=tsNazivnij;
              edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director2','LNP_NV',edtPIBKerivnika_NV.Text);
              edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director2','Position_NV',edtPosadaKerivnika_NV.Text);
              edtPidpis1_NV.Text:=INIAZZ.ReadString('Director2','Signature1_NV',edtPidpis1_NV.Text);
              edtPidpis2_NV.Text:=INIAZZ.ReadString('Director2','Signature2_NV',edtPidpis2_NV.Text);
              pcPadezh.ActivePage:=tsRodovij;
              edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director2','LNP_RV',edtPIBKerivnika_RV.Text);
              edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director2','Position_RV',edtPosadaKerivnika_RV.Text);
              edtPidpis1_RV.Text:=INIAZZ.ReadString('Director2','Signature1_RV',edtPidpis1_RV.Text);
              edtPidpis2_RV.Text:=INIAZZ.ReadString('Director2','Signature2_RV',edtPidpis2_RV.Text);
              pcPadezh.ActivePage:=tsDavalnij;
              edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director2','LNP_DV',edtPIBKerivnika_DV.Text);
              edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director2','Position_DV',edtPosadaKerivnika_DV.Text);
              edtPidpis1_DV.Text:=INIAZZ.ReadString('Director2','Signature1_DV',edtPidpis1_DV.Text);
              edtPidpis2_DV.Text:=INIAZZ.ReadString('Director2','Signature2_DV',edtPidpis2_DV.Text);
              pcPadezh.ActivePage:=tsZnahidnij;
              edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','LNP_ZV',edtPIBKerivnika_ZV.Text);
              edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','Position_ZV',edtPosadaKerivnika_ZV.Text);
              edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director2','Signature1_ZV',edtPidpis1_ZV.Text);
              edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
              pcPadezh.ActivePage:=tsOrudnij;
              edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director2','LNP_OV',edtPIBKerivnika_OV.Text);
              edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director2','Position_OV',edtPosadaKerivnika_OV.Text);
              edtPidpis1_OV.Text:=INIAZZ.ReadString('Director2','Signature1_OV',edtPidpis1_OV.Text);
              edtPidpis2_OV.Text:=INIAZZ.ReadString('Director2','Signature2_OV',edtPidpis2_OV.Text);
              pcPadezh.ActivePage:=tsMiscevij;
              edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director2','LNP_MV',edtPIBKerivnika_MV.Text);
              edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director2','Position_MV',edtPosadaKerivnika_MV.Text);
              edtPidpis1_MV.Text:=INIAZZ.ReadString('Director2','Signature1_MV',edtPidpis1_MV.Text);
              edtPidpis2_MV.Text:=INIAZZ.ReadString('Director2','Signature2_MV',edtPidpis2_MV.Text);
              edtKodKerivnika.Text:=INIAZZ.ReadString('Director2','Kod',edtKodKerivnika.Text);
            end;
        end;
        INIAZZ.WriteInteger('System','Position',rgKerivnik.ItemIndex);
      end;
  end;
  pcPadezh.ActivePage:=tsNazivnij;
  INIAZZ.Free;
end;

procedure TfrmVidomostiProOrganizaciju.aSESLevel_UpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProOrganizaciju do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RIVEN_SES order by KOD';
    qTeritory.Open;
    cbSESLevel.Text:='';
    cbSESLevel.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      if not qTeritory.FieldByName('RIVEN').IsNull then cbSESLevel.Items.Add(qTeritory.FieldByName('RIVEN').Value);
      qTeritory.Next;
    end;
  end;
end;

end.


