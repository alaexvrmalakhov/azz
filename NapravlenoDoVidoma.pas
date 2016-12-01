unit NapravlenoDoVidoma;

interface

uses
  Forms, Classes, ActnList, DB, IBCustomDataSet, IBQuery, Controls,
  StdCtrls, ComCtrls, Dialogs, SysUtils;

type
  TfrmNapravlenoDoVidoma = class(TForm)
    Label1: TLabel;
    edtNomerPostanovi: TEdit;
    Label2: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dtpDataNapravlenny: TDateTimePicker;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label6: TLabel;
    edtKod: TEdit;
    qID: TIBQuery;
    cbPIB_Otrimuvacha: TComboBox;
    btnPIB_Otrimuvacha_Update: TButton;
    btnPIB_Otrimuvacha_Choice: TButton;
    cbPosadaOtrimuvacha: TComboBox;
    btnPosadaOtrimuvacha_Update: TButton;
    btnPosadaOtrimuvacha_Choice: TButton;
    alNapravlenoDoVidoma: TActionList;
    aPIBOtrimuvacha_Change: TAction;
    aPIBOtrimuvacha_Update: TAction;
    aPIBOtrimuvacha_Choice: TAction;
    aPosadaOtrimuvacha_Update: TAction;
    aPosadaOtrimuvacha_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    aKodUpdate: TAction;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aPIBOtrimuvacha_ChangeExecute(Sender: TObject);
    procedure aPIBOtrimuvacha_UpdateExecute(Sender: TObject);
    procedure aPIBOtrimuvacha_ChoiceExecute(Sender: TObject);
    procedure aPosadaOtrimuvacha_UpdateExecute(Sender: TObject);
    procedure aPosadaOtrimuvacha_ChoiceExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
  end;

var
  frmNapravlenoDoVidoma: TfrmNapravlenoDoVidoma;

implementation

uses
  Main, AdminZapobizhZahodiEdit, VidnovlennyRobit, Povidomlenny, Posadi,
  ZayvaDoVDVS, Napravlenny;

{$R *.dfm}

procedure TfrmNapravlenoDoVidoma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmVidnovlennyRobit') then
  begin
    frmVidnovlennyRobit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmPovidomlenny') then
  begin
    frmPovidomlenny.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmZayvaDoVDVS') then
  begin
    frmZayvaDoVDVS.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmNapravlenoDoVidoma.aCancelExecute(Sender: TObject);
begin
  frmNapravlenoDoVidoma.Close;
end;

procedure TfrmNapravlenoDoVidoma.aOKExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if frmNapravlenoDoVidoma.Caption='Видалення направлення' then
  begin
    if MessageDlg('УВАГА!!!'+#13+'Відновлення цього запису буде неможливе!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      if frmMain.IsFormOpen('frmVidnovlennyRobit') then
      begin
        frmVidnovlennyRobit.qNapravlenoDoVidoma.SQL.Clear;
        frmVidnovlennyRobit.qNapravlenoDoVidoma.SQL.Text:='delete from NAPRAVLENODOVIDOMA where KOD=:Kod';
        frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Clear;
        frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
        frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[0].Name:='Kod';
        frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[0].Value:=frmNapravlenoDoVidoma.edtKod.Text;
        frmVidnovlennyRobit.qNapravlenoDoVidoma.Open;
        frmMain.trAzz.CommitRetaining;
        frmNapravlenoDoVidoma.Close;
        frmVidnovlennyRobit.aKogoPovidomlenoUpdateExecute(sender);
        exit;
      end;

      if frmMain.IsFormOpen('frmPovidomlenny') then
      begin
        frmPovidomlenny.qPovidomlenny.SQL.Clear;
        frmPovidomlenny.qPovidomlenny.SQL.Text:='delete from NAPRAVLENODOVIDOMA where KOD=:Kod';
        frmPovidomlenny.qPovidomlenny.Params.Clear;
        frmPovidomlenny.qPovidomlenny.Params.Add;
        frmPovidomlenny.qPovidomlenny.Params[0].Name:='Kod';
        frmPovidomlenny.qPovidomlenny.Params[0].Value:=frmNapravlenoDoVidoma.edtKod.Text;
        frmPovidomlenny.qPovidomlenny.Open;
        frmNapravlenoDoVidoma.Close;
        frmPovidomlenny.aKomuNapravlenoUpdateExecute(sender);
        exit;
      end;

      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
      begin
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.SQL.Clear;
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.SQL.Text:='delete from NAPRAVLENODOVIDOMA where KOD=:Kod';
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Clear;
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[0].Name:='Kod';
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[0].Value:=frmNapravlenoDoVidoma.edtKod.Text;
        frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Open;
        frmAdminZapobizhZahodiEdit.aUpdateNapravlenoDoVidomaExecute(sender);
        frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
        frmNapravlenoDoVidoma.Close;
        exit;
      end;

      if frmMain.IsFormOpen('frmZayvaDoVDVS') then
      begin
        frmZayvaDoVDVS.qNapravlenny.SQL.Clear;
        frmZayvaDoVDVS.qNapravlenny.SQL.Text:='delete from NAPRAVLENODOVIDOMA where KOD=:Kod';
        frmZayvaDoVDVS.qNapravlenny.Params.Clear;
        frmZayvaDoVDVS.qNapravlenny.Params.Add;
        frmZayvaDoVDVS.qNapravlenny.Params[0].Name:='Kod';
        frmZayvaDoVDVS.qNapravlenny.Params[0].Value:=frmNapravlenoDoVidoma.edtKod.Text;
        frmZayvaDoVDVS.qNapravlenny.Open;
        frmMain.trAzz.CommitRetaining;
        frmNapravlenoDoVidoma.Close;
        frmZayvaDoVDVS.aUpdateNapravlennyExecute(sender);
        exit;
      end;
    end;
  end;

  if frmNapravlenoDoVidoma.Caption='Зміна направлення' then
  begin
    if frmNapravlenoDoVidoma.edtKod.Text='' then
    begin
      frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    try
      StrToInt(frmNapravlenoDoVidoma.edtKod.Text);
    except
      frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    if frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text='' then
    begin
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    if frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text='' then
    begin
      frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.SetFocus;
      exit;
    end;

    if frmMain.IsFormOpen('frmVidnovlennyRobit') then
    begin
      with frmVidnovlennyRobit do
      begin
        qNapravlenoDoVidoma.SQL.Clear;
        qNapravlenoDoVidoma.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        qNapravlenoDoVidoma.Params.Clear;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[0].Name:='Ministry';
        qNapravlenoDoVidoma.Params[0].Value:=cbMinistry.Text;
        qNapravlenoDoVidoma.Open;
        if qNapravlenoDoVidoma.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qNapravlenoDoVidoma.FieldByName('KOD').Value else Ministry:=0;

        qNapravlenoDoVidoma.SQL.Clear;
        qNapravlenoDoVidoma.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
        qNapravlenoDoVidoma.Params.Clear;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[0].Name:='Ministry';
        qNapravlenoDoVidoma.Params[0].Value:=Ministry;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[1].Name:='Teritory';
        qNapravlenoDoVidoma.Params[1].Value:=cbTeritory.Text;
        qNapravlenoDoVidoma.Open;
        if qNapravlenoDoVidoma.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qNapravlenoDoVidoma.FieldByName('KOD').Value else Teritory:=0;

        qNapravlenoDoVidoma.SQL.Clear;
        qNapravlenoDoVidoma.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        qNapravlenoDoVidoma.Params.Clear;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[0].Name:='Ministry';
        qNapravlenoDoVidoma.Params[0].Value:=Ministry;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[1].Name:='Teritory';
        qNapravlenoDoVidoma.Params[1].Value:=Teritory;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[2].Name:='Teritory';
        qNapravlenoDoVidoma.Params[2].Value:=cbDistrict.Text;
        qNapravlenoDoVidoma.Open;
        if qNapravlenoDoVidoma.Locate('RAJON',cbDistrict.Text,[]) then District:=qNapravlenoDoVidoma.FieldByName('KOD').Value else District:=0;
      end;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.SQL.Clear;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.SQL.Text:='update NAPRAVLENODOVIDOMA set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,NOMER_POSTANOVI=:NOMER_POSTANOVI,DATA_POSTANOVI=:DATA_POSTANOVI,PIB=:PIB,POSADA=:POSADA,DATA_NAPRAVLENNY=:DATA_NAPRAVLENNY,VIDNOVLENNY=:VIDNOVLENNY where KOD=:Kod';//,MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Clear;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[0].Name:='Ministry';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[0].Value:=Ministry;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[1].Name:='Teritory';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[1].Value:=Teritory;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[2].Name:='Rajon';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[2].Value:=District;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[3].Name:='NOMER_POSTANOVI';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[3].Value:=frmNapravlenoDoVidoma.edtNomerPostanovi.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[4].Name:='DATA_POSTANOVI';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[4].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataPostanovi.Date));
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[5].Name:='PIB';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[5].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[6].Name:='POSADA';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[6].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[7].Name:='DATA_NAPRAVLENNY';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[7].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[8].Name:='VIDNOVLENNY';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[8].Value:='rishenny';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[9].Name:='Kod';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Open;
      frmNapravlenoDoVidoma.Close;
      frmVidnovlennyRobit.aKogoPovidomlenoUpdateExecute(sender);
      exit;
    end;

    if frmMain.IsFormOpen('frmPovidomlenny') then
    begin
      with frmPovidomlenny do
      begin
        qPovidomlenny.SQL.Clear;
        qPovidomlenny.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        qPovidomlenny.Params.Clear;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[0].Name:='Ministry';
        qPovidomlenny.Params[0].Value:=cbMinistry.Text;
        qPovidomlenny.Open;
        if qPovidomlenny.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qPovidomlenny.FieldByName('KOD').Value else Ministry:=0;

        qPovidomlenny.SQL.Clear;
        qPovidomlenny.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
        qPovidomlenny.Params.Clear;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[0].Name:='Ministry';
        qPovidomlenny.Params[0].Value:=Ministry;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[1].Name:='Teritory';
        qPovidomlenny.Params[1].Value:=cbTeritory.Text;
        qPovidomlenny.Open;
        if qPovidomlenny.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qPovidomlenny.FieldByName('KOD').Value else Teritory:=0;

        qPovidomlenny.SQL.Clear;
        qPovidomlenny.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        qPovidomlenny.Params.Clear;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[0].Name:='Ministry';
        qPovidomlenny.Params[0].Value:=Ministry;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[1].Name:='Teritory';
        qPovidomlenny.Params[1].Value:=Teritory;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[2].Name:='Rajon';
        qPovidomlenny.Params[2].Value:=cbDistrict.Text;
        qPovidomlenny.Open;
        if qPovidomlenny.Locate('RAJON',cbDistrict.Text,[]) then District:=qPovidomlenny.FieldByName('KOD').Value else District:=0;
      end;
      frmPovidomlenny.qPovidomlenny.SQL.Clear;
      frmPovidomlenny.qPovidomlenny.SQL.Text:='update NAPRAVLENODOVIDOMA set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,PIB=:PIB,POSADA=:POSADA,DATA_NAPRAVLENNY=:DATA_NAPRAVLENNY,VIDNOVLENNY=:Vidnovlenny where KOD=:Kod';//
      frmPovidomlenny.qPovidomlenny.Params.Clear;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[0].Name:='Ministry';
      frmPovidomlenny.qPovidomlenny.Params[0].Value:=Ministry;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[1].Name:='Teritory';
      frmPovidomlenny.qPovidomlenny.Params[1].Value:=Teritory;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[2].Name:='Rajon';
      frmPovidomlenny.qPovidomlenny.Params[2].Value:=District;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[3].Name:='NomerPostanovi';
      frmPovidomlenny.qPovidomlenny.Params[3].Value:=edtNomerPostanovi.Text;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[4].Name:='DataPostanovi';
      frmPovidomlenny.qPovidomlenny.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[5].Name:='PIB';
      frmPovidomlenny.qPovidomlenny.Params[5].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[6].Name:='POSADA';
      frmPovidomlenny.qPovidomlenny.Params[6].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[7].Name:='DATA_NAPRAVLENNY';
      frmPovidomlenny.qPovidomlenny.Params[7].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[8].Name:='Vidnovlenny';
      frmPovidomlenny.qPovidomlenny.Params[8].Value:='povidomlenny';
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[9].Name:='Kod';
      frmPovidomlenny.qPovidomlenny.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmPovidomlenny.qPovidomlenny.Open;
      frmNapravlenoDoVidoma.Close;
      frmPovidomlenny.aKomuNapravlenoUpdateExecute(sender);
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmNapravlenoDoVidoma.qID.SQL.Clear;
      frmNapravlenoDoVidoma.qID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      frmNapravlenoDoVidoma.qID.Params.Clear;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[0].Name:='Ministry';
      frmNapravlenoDoVidoma.qID.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
      frmNapravlenoDoVidoma.qID.Open;
      if frmNapravlenoDoVidoma.qID.Locate('MINISTRY',frmAdminZapobizhZahodiEdit.cbMinistry.Text,[]) then Ministry:=frmNapravlenoDoVidoma.qID.FieldByName('KOD').Value else Ministry:=0;

      frmNapravlenoDoVidoma.qID.SQL.Clear;
      frmNapravlenoDoVidoma.qID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      frmNapravlenoDoVidoma.qID.Params.Clear;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[0].Name:='Ministry';
      frmNapravlenoDoVidoma.qID.Params[0].Value:=Ministry;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[1].Name:='Teritory';
      frmNapravlenoDoVidoma.qID.Params[1].Value:=frmNapravlenoDoVidoma.cbTeritory.Text;
      frmNapravlenoDoVidoma.qID.Open;
      if frmNapravlenoDoVidoma.qID.Locate('TERITORY',frmAdminZapobizhZahodiEdit.cbTeritory.Text,[]) then Teritory:=frmNapravlenoDoVidoma.qID.FieldByName('KOD').Value else Teritory:=0;

      frmNapravlenoDoVidoma.qID.SQL.Clear;
      frmNapravlenoDoVidoma.qID.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      frmNapravlenoDoVidoma.qID.Params.Clear;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[0].Name:='Ministry';
      frmNapravlenoDoVidoma.qID.Params[0].Value:=Ministry;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[1].Name:='Teritory';
      frmNapravlenoDoVidoma.qID.Params[1].Value:=Teritory;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[2].Name:='Rajon';
      frmNapravlenoDoVidoma.qID.Params[2].Value:=frmNapravlenoDoVidoma.cbDistrict.Text;
      frmNapravlenoDoVidoma.qID.Open;
      if frmNapravlenoDoVidoma.qID.Locate('RAJON',frmAdminZapobizhZahodiEdit.cbDistrict.Text,[]) then District:=frmNapravlenoDoVidoma.qID.FieldByName('KOD').Value else District:=0;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.SQL.Clear;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.SQL.Text:='update NAPRAVLENODOVIDOMA set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMER_POSTANOVI=:Nomer_Postanovi,DATA_POSTANOVI=:Data_Postanovi,PIB=:PIB,POSADA=:Posada,DATA_NAPRAVLENNY=:DataNapravlenny,VIDNOVLENNY=:Vidnovlenny where KOD=:Kod';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Clear;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[0].Name:='Ministry';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[0].Value:=Ministry;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[1].Name:='Teritory';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[1].Value:=Teritory;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[2].Name:='District';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[2].Value:=District;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[3].Name:='Nomer_Postanovi';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[3].Value:=frmNapravlenoDoVidoma.edtNomerPostanovi.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[4].Name:='Data_Postanovi';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[4].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataPostanovi.Date));
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[5].Name:='PIB';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[5].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[6].Name:='Posada';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[6].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[7].Name:='DataNapravlenny';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[7].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[8].Name:='Vidnovlenny';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[8].Value:='postanova';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[9].Name:='KOD';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Open;
      frmNapravlenoDoVidoma.Close;
      frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
      frmAdminZapobizhZahodiEdit.aUpdateNapravlenoDoVidomaExecute(sender);
      exit;
    end;

    if frmMain.IsFormOpen('frmZayvaDoVDVS') then
    begin
      with frmZayvaDoVDVS do
      begin
        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Ministry';
        qNapravlenny.Params[0].Value:=cbMinistry.Text;
        qNapravlenny.Open;
        if qNapravlenny.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qNapravlenny.FieldByName('KOD').Value else Ministry:=0;

        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Ministry';
        qNapravlenny.Params[0].Value:=Ministry;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[1].Name:='Teritory';
        qNapravlenny.Params[1].Value:=cbTeritory.Text;
        qNapravlenny.Open;
        if qNapravlenny.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qNapravlenny.FieldByName('KOD').Value else Teritory:=0;

        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Ministry';
        qNapravlenny.Params[0].Value:=Ministry;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[1].Name:='Teritory';
        qNapravlenny.Params[1].Value:=Teritory;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[2].Name:='Rajon';
        qNapravlenny.Params[2].Value:=cbDistrict.Text;
        qNapravlenny.Open;
        if qNapravlenny.Locate('RAJON',cbDistrict.Text,[]) then District:=qNapravlenny.FieldByName('KOD').Value else District:=0;
      end;

      frmZayvaDoVDVS.qNapravlenny.SQL.Clear;
      frmZayvaDoVDVS.qNapravlenny.SQL.Text:='update NAPRAVLENODOVIDOMA set NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,PIB=:PIB,POSADA=:Posada,DATA_NAPRAVLENNY=:DataNapravlenny,VIDNOVLENNY=:Vidnovlenny,MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon where KOD=:Kod';
      frmZayvaDoVDVS.qNapravlenny.Params.Clear;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[0].Name:='NomerPostanovi';
      frmZayvaDoVDVS.qNapravlenny.Params[0].Value:=frmNapravlenoDoVidoma.edtNomerPostanovi.Text;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[1].Name:='DataPostanovi';
      frmZayvaDoVDVS.qNapravlenny.Params[1].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataPostanovi.Date));
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[2].Name:='PIB';
      frmZayvaDoVDVS.qNapravlenny.Params[2].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[3].Name:='Posada';
      frmZayvaDoVDVS.qNapravlenny.Params[3].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[4].Name:='DataNapravlenny';
      frmZayvaDoVDVS.qNapravlenny.Params[4].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[5].Name:='Vidnovlenny';
      frmZayvaDoVDVS.qNapravlenny.Params[5].Value:='VDVS';
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[6].Name:='Ministry';
      frmZayvaDoVDVS.qNapravlenny.Params[6].Value:=Ministry;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[7].Name:='Teritory';
      frmZayvaDoVDVS.qNapravlenny.Params[7].Value:=Teritory;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[8].Name:='Rajon';
      frmZayvaDoVDVS.qNapravlenny.Params[8].Value:=District;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[9].Name:='Kod';
      frmZayvaDoVDVS.qNapravlenny.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmZayvaDoVDVS.qNapravlenny.Open;
      frmNapravlenoDoVidoma.Close;
      frmZayvaDoVDVS.aUpdateNapravlennyExecute(sender);
      exit;
    end;
  end;

  if frmNapravlenoDoVidoma.Caption='Додавання направлення' then
  begin
    if frmNapravlenoDoVidoma.edtKod.Text='' then
    begin
      frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    try
      StrToInt(frmNapravlenoDoVidoma.edtKod.Text);
    except
      frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    if frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text='' then
    begin
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    if frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text='' then
    begin
      frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.SetFocus;
      exit;
    end;

    if frmMain.IsFormOpen('frmVidnovlennyRobit') then
    begin
      with frmVidnovlennyRobit do
      begin
        qNapravlenoDoVidoma.SQL.Clear;
        qNapravlenoDoVidoma.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        qNapravlenoDoVidoma.Params.Clear;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[0].Name:='Ministry';
        qNapravlenoDoVidoma.Params[0].Value:=cbMinistry.Text;
        qNapravlenoDoVidoma.Open;
        if qNapravlenoDoVidoma.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qNapravlenoDoVidoma.FieldByName('KOD').Value else Ministry:=0;

        qNapravlenoDoVidoma.SQL.Clear;
        qNapravlenoDoVidoma.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
        qNapravlenoDoVidoma.Params.Clear;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[0].Name:='Ministry';
        qNapravlenoDoVidoma.Params[0].Value:=Ministry;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[1].Name:='Teritory';
        qNapravlenoDoVidoma.Params[1].Value:=cbTeritory.Text;
        qNapravlenoDoVidoma.Open;
        if qNapravlenoDoVidoma.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qNapravlenoDoVidoma.FieldByName('KOD').Value else Teritory:=0;

        qNapravlenoDoVidoma.SQL.Clear;
        qNapravlenoDoVidoma.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        qNapravlenoDoVidoma.Params.Clear;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[0].Name:='Ministry';
        qNapravlenoDoVidoma.Params[0].Value:=Ministry;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[1].Name:='Teritory';
        qNapravlenoDoVidoma.Params[1].Value:=Teritory;
        qNapravlenoDoVidoma.Params.Add;
        qNapravlenoDoVidoma.Params[2].Name:='Teritory';
        qNapravlenoDoVidoma.Params[2].Value:=cbDistrict.Text;
        qNapravlenoDoVidoma.Open;
        if qNapravlenoDoVidoma.Locate('RAJON',cbDistrict.Text,[]) then District:=qNapravlenoDoVidoma.FieldByName('KOD').Value else District:=0;
      end;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.SQL.Clear;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.SQL.Text:='update NAPRAVLENODOVIDOMA set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,NOMER_POSTANOVI=:NOMER_POSTANOVI,DATA_POSTANOVI=:DATA_POSTANOVI,PIB=:PIB,POSADA=:POSADA,DATA_NAPRAVLENNY=:DATA_NAPRAVLENNY,VIDNOVLENNY=:VIDNOVLENNY where KOD=:Kod';//,MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Clear;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[0].Name:='Ministry';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[0].Value:=Ministry;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[1].Name:='Teritory';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[1].Value:=Teritory;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[2].Name:='Rajon';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[2].Value:=District;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[3].Name:='NOMER_POSTANOVI';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[3].Value:=frmNapravlenoDoVidoma.edtNomerPostanovi.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[4].Name:='DATA_POSTANOVI';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[4].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataPostanovi.Date));
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[5].Name:='PIB';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[5].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[6].Name:='POSADA';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[6].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[7].Name:='DATA_NAPRAVLENNY';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[7].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[8].Name:='VIDNOVLENNY';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[8].Value:='rishenny';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params.Add;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[9].Name:='Kod';
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmVidnovlennyRobit.qNapravlenoDoVidoma.Open;
      frmNapravlenoDoVidoma.Close;
      frmVidnovlennyRobit.aKogoPovidomlenoUpdateExecute(sender);
      exit;
    end;

    if frmMain.IsFormOpen('frmPovidomlenny') then
    begin
      with frmPovidomlenny do
      begin
        qPovidomlenny.SQL.Clear;
        qPovidomlenny.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        qPovidomlenny.Params.Clear;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[0].Name:='Ministry';
        qPovidomlenny.Params[0].Value:=cbMinistry.Text;
        qPovidomlenny.Open;
        if qPovidomlenny.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qPovidomlenny.FieldByName('KOD').Value else Ministry:=0;

        qPovidomlenny.SQL.Clear;
        qPovidomlenny.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
        qPovidomlenny.Params.Clear;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[0].Name:='Ministry';
        qPovidomlenny.Params[0].Value:=Ministry;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[1].Name:='Teritory';
        qPovidomlenny.Params[1].Value:=cbTeritory.Text;
        qPovidomlenny.Open;
        if qPovidomlenny.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qPovidomlenny.FieldByName('KOD').Value else Teritory:=0;

        qPovidomlenny.SQL.Clear;
        qPovidomlenny.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        qPovidomlenny.Params.Clear;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[0].Name:='Ministry';
        qPovidomlenny.Params[0].Value:=Ministry;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[1].Name:='Teritory';
        qPovidomlenny.Params[1].Value:=Teritory;
        qPovidomlenny.Params.Add;
        qPovidomlenny.Params[2].Name:='Rajon';
        qPovidomlenny.Params[2].Value:=cbDistrict.Text;
        qPovidomlenny.Open;
        if qPovidomlenny.Locate('RAJON',cbDistrict.Text,[]) then District:=qPovidomlenny.FieldByName('KOD').Value else District:=0;
      end;
      frmPovidomlenny.qPovidomlenny.SQL.Clear;
      frmPovidomlenny.qPovidomlenny.SQL.Text:='update NAPRAVLENODOVIDOMA set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,PIB=:PIB,POSADA=:POSADA,DATA_NAPRAVLENNY=:DATA_NAPRAVLENNY,VIDNOVLENNY=:Vidnovlenny where KOD=:Kod';//
      frmPovidomlenny.qPovidomlenny.Params.Clear;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[0].Name:='Ministry';
      frmPovidomlenny.qPovidomlenny.Params[0].Value:=Ministry;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[1].Name:='Teritory';
      frmPovidomlenny.qPovidomlenny.Params[1].Value:=Teritory;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[2].Name:='Rajon';
      frmPovidomlenny.qPovidomlenny.Params[2].Value:=District;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[3].Name:='NomerPostanovi';
      frmPovidomlenny.qPovidomlenny.Params[3].Value:=edtNomerPostanovi.Text;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[4].Name:='DataPostanovi';
      frmPovidomlenny.qPovidomlenny.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[5].Name:='PIB';
      frmPovidomlenny.qPovidomlenny.Params[5].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[6].Name:='POSADA';
      frmPovidomlenny.qPovidomlenny.Params[6].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[7].Name:='DATA_NAPRAVLENNY';
      frmPovidomlenny.qPovidomlenny.Params[7].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[8].Name:='Vidnovlenny';
      frmPovidomlenny.qPovidomlenny.Params[8].Value:='povidomlenny';
      frmPovidomlenny.qPovidomlenny.Params.Add;
      frmPovidomlenny.qPovidomlenny.Params[9].Name:='Kod';
      frmPovidomlenny.qPovidomlenny.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmPovidomlenny.qPovidomlenny.Open;
      frmNapravlenoDoVidoma.Close;
      frmPovidomlenny.aKomuNapravlenoUpdateExecute(sender);
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmNapravlenoDoVidoma.qID.SQL.Clear;
      frmNapravlenoDoVidoma.qID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      frmNapravlenoDoVidoma.qID.Params.Clear;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[0].Name:='Ministry';
      frmNapravlenoDoVidoma.qID.Params[0].Value:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
      frmNapravlenoDoVidoma.qID.Open;
      if frmNapravlenoDoVidoma.qID.Locate('MINISTRY',frmAdminZapobizhZahodiEdit.cbMinistry.Text,[]) then Ministry:=frmNapravlenoDoVidoma.qID.FieldByName('KOD').Value else Ministry:=0;

      frmNapravlenoDoVidoma.qID.SQL.Clear;
      frmNapravlenoDoVidoma.qID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      frmNapravlenoDoVidoma.qID.Params.Clear;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[0].Name:='Ministry';
      frmNapravlenoDoVidoma.qID.Params[0].Value:=Ministry;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[1].Name:='Teritory';
      frmNapravlenoDoVidoma.qID.Params[1].Value:=frmNapravlenoDoVidoma.cbTeritory.Text;
      frmNapravlenoDoVidoma.qID.Open;
      if frmNapravlenoDoVidoma.qID.Locate('TERITORY',frmAdminZapobizhZahodiEdit.cbTeritory.Text,[]) then Teritory:=frmNapravlenoDoVidoma.qID.FieldByName('KOD').Value else Teritory:=0;

      frmNapravlenoDoVidoma.qID.SQL.Clear;
      frmNapravlenoDoVidoma.qID.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      frmNapravlenoDoVidoma.qID.Params.Clear;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[0].Name:='Ministry';
      frmNapravlenoDoVidoma.qID.Params[0].Value:=Ministry;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[1].Name:='Teritory';
      frmNapravlenoDoVidoma.qID.Params[1].Value:=Teritory;
      frmNapravlenoDoVidoma.qID.Params.Add;
      frmNapravlenoDoVidoma.qID.Params[2].Name:='Rajon';
      frmNapravlenoDoVidoma.qID.Params[2].Value:=frmNapravlenoDoVidoma.cbDistrict.Text;
      frmNapravlenoDoVidoma.qID.Open;
      if frmNapravlenoDoVidoma.qID.Locate('RAJON',frmAdminZapobizhZahodiEdit.cbDistrict.Text,[]) then District:=frmNapravlenoDoVidoma.qID.FieldByName('KOD').Value else District:=0;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.SQL.Clear;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.SQL.Text:='update NAPRAVLENODOVIDOMA set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMER_POSTANOVI=:Nomer_Postanovi,DATA_POSTANOVI=:Data_Postanovi,PIB=:PIB,POSADA=:Posada,DATA_NAPRAVLENNY=:DataNapravlenny,VIDNOVLENNY=:Vidnovlenny where KOD=:Kod';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Clear;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[0].Name:='Ministry';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[0].Value:=Ministry;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[1].Name:='Teritory';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[1].Value:=Teritory;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[2].Name:='District';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[2].Value:=District;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[3].Name:='Nomer_Postanovi';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[3].Value:=frmNapravlenoDoVidoma.edtNomerPostanovi.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[4].Name:='Data_Postanovi';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[4].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataPostanovi.Date));
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[5].Name:='PIB';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[5].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[6].Name:='Posada';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[6].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[7].Name:='DataNapravlenny';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[7].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[8].Name:='Vidnovlenny';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[8].Value:='postanova';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params.Add;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[9].Name:='KOD';
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmAdminZapobizhZahodiEdit.qNapravlenoDoVidoma.Open;
      frmNapravlenoDoVidoma.Close;
      frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
      frmAdminZapobizhZahodiEdit.aUpdateNapravlenoDoVidomaExecute(sender);
      exit;
    end;

    if frmMain.IsFormOpen('frmZayvaDoVDVS') then
    begin
      with frmZayvaDoVDVS do
      begin
        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Ministry';
        qNapravlenny.Params[0].Value:=cbMinistry.Text;
        qNapravlenny.Open;
        if qNapravlenny.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qNapravlenny.FieldByName('KOD').Value else Ministry:=0;

        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Ministry';
        qNapravlenny.Params[0].Value:=Ministry;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[1].Name:='Teritory';
        qNapravlenny.Params[1].Value:=cbTeritory.Text;
        qNapravlenny.Open;
        if qNapravlenny.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qNapravlenny.FieldByName('KOD').Value else Teritory:=0;

        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Ministry';
        qNapravlenny.Params[0].Value:=Ministry;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[1].Name:='Teritory';
        qNapravlenny.Params[1].Value:=Teritory;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[2].Name:='Rajon';
        qNapravlenny.Params[2].Value:=cbDistrict.Text;
        qNapravlenny.Open;
        if qNapravlenny.Locate('RAJON',cbDistrict.Text,[]) then District:=qNapravlenny.FieldByName('KOD').Value else District:=0;
      end;

      frmZayvaDoVDVS.qNapravlenny.SQL.Clear;
      frmZayvaDoVDVS.qNapravlenny.SQL.Text:='update NAPRAVLENODOVIDOMA set NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,PIB=:PIB,POSADA=:Posada,DATA_NAPRAVLENNY=:DataNapravlenny,VIDNOVLENNY=:Vidnovlenny,MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon where KOD=:Kod';
      frmZayvaDoVDVS.qNapravlenny.Params.Clear;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[0].Name:='NomerPostanovi';
      frmZayvaDoVDVS.qNapravlenny.Params[0].Value:=frmNapravlenoDoVidoma.edtNomerPostanovi.Text;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[1].Name:='DataPostanovi';
      frmZayvaDoVDVS.qNapravlenny.Params[1].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataPostanovi.Date));
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[2].Name:='PIB';
      frmZayvaDoVDVS.qNapravlenny.Params[2].Value:=frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[3].Name:='Posada';
      frmZayvaDoVDVS.qNapravlenny.Params[3].Value:=frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[4].Name:='DataNapravlenny';
      frmZayvaDoVDVS.qNapravlenny.Params[4].Value:=DateToStr(int(frmNapravlenoDoVidoma.dtpDataNapravlenny.Date));
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[5].Name:='Vidnovlenny';
      frmZayvaDoVDVS.qNapravlenny.Params[5].Value:='VDVS';
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[6].Name:='Ministry';
      frmZayvaDoVDVS.qNapravlenny.Params[6].Value:=Ministry;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[7].Name:='Teritory';
      frmZayvaDoVDVS.qNapravlenny.Params[7].Value:=Teritory;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[8].Name:='Rajon';
      frmZayvaDoVDVS.qNapravlenny.Params[8].Value:=District;
      frmZayvaDoVDVS.qNapravlenny.Params.Add;
      frmZayvaDoVDVS.qNapravlenny.Params[9].Name:='Kod';
      frmZayvaDoVDVS.qNapravlenny.Params[9].Value:=frmNapravlenoDoVidoma.edtKod.Text;
      frmZayvaDoVDVS.qNapravlenny.Open;
      frmNapravlenoDoVidoma.Close;
      frmZayvaDoVDVS.aUpdateNapravlennyExecute(sender);
      exit;
    end;
  end;
end;

procedure TfrmNapravlenoDoVidoma.aPIBOtrimuvacha_ChangeExecute(
  Sender: TObject);
begin
  with frmNapravlenoDoVidoma do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from NAPRAVLENNY order by PIB';
    qID.Open;
    if qID.Locate('PIB',cbPIB_Otrimuvacha.Text,[]) then cbPosadaOtrimuvacha.Text:=qID.FieldByName('POSADA').Value;
  end;
end;

procedure TfrmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(
  Sender: TObject);
begin
  with frmNapravlenoDoVidoma do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from NAPRAVLENNY order by PIB';
    qID.Open;
    cbPIB_Otrimuvacha.Text:='';
    cbPIB_Otrimuvacha.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      if not qID.FieldByName('PIB').IsNull then cbPIB_Otrimuvacha.Items.Add(qID.FieldByName('PIB').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmNapravlenoDoVidoma.aPIBOtrimuvacha_ChoiceExecute(
  Sender: TObject);
begin
  frmNapravlenoDoVidoma.Enabled:=false;
  frmMain.aNapravlennyExecute(sender);
  frmNapravlenny.aChoice.Enabled:=true;
  frmNapravlenny.Left:=frmMain.Left+70;
  frmNapravlenny.Top:=frmMain.Top+70;
  frmNapravlenny.Width:=frmMain.Width-70;
  frmNapravlenny.Height:=frmMain.Height-70;
  frmNapravlenny.Position:=poMainFormCenter;
  frmNapravlenny.FormStyle:=fsNormal;
  frmNapravlenny.BorderStyle:=bsDialog;
end;

procedure TfrmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(
  Sender: TObject);
begin
  with frmNapravlenoDoVidoma do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from POSADI order by NAZVAPOSADI';
    qID.Open;
    cbPosadaOtrimuvacha.Text:='';
    cbPosadaOtrimuvacha.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      if not qID.FieldByName('NAZVAPOSADI').IsNull then cbPosadaOtrimuvacha.Items.Add(qID.FieldByName('NAZVAPOSADI').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmNapravlenoDoVidoma.aPosadaOtrimuvacha_ChoiceExecute(
  Sender: TObject);
begin
  frmNapravlenoDoVidoma.Enabled:=false;
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

procedure TfrmNapravlenoDoVidoma.aKodUpdateExecute(Sender: TObject);
begin
  with frmNapravlenoDoVidoma do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='insert into NAPRAVLENODOVIDOMA (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qID.Open;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from NAPRAVLENODOVIDOMA order by KOD';
    qID.Open;
    qID.Last;
    edtKod.Text:=IntToStr(qID.FieldByName('KOD').Value);
  end;
end;

end.
