unit ZvitShtrafi;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, ComCtrls;
//, Dialogs, SysUtils, IniFiles;

type
  TfrmZvitShtrafi = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    lblZagolovok: TLabel;
    edtZagolovok: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    dtpZaPeriodZ: TDateTimePicker;
    dtpZaPeriodPo: TDateTimePicker;
    alZvitShtrafi: TActionList;
    aOK: TAction;
    aCancel: TAction;
    rgTeritory: TRadioGroup;
    cbTeritory: TComboBox;
    btnTeritoryUpdate: TButton;
    btnTeritoryChoice: TButton;
    aTeritoryUpdate: TAction;
    aTeritoryChoice: TAction;
    qZvitSchomisychnij: TIBQuery;
    Bevel1: TBevel;
    edtMinistry: TEdit;
    edtTeritory: TEdit;
    edtDistrict: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure rgTeritoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmZvitShtrafi: TfrmZvitShtrafi;

implementation

uses Main;

{$R *.dfm}

procedure TfrmZvitShtrafi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmZvitShtrafi.aCancelExecute(Sender: TObject);
begin
  frmZvitShtrafi.Close;
end;

procedure TfrmZvitShtrafi.aOKExecute(Sender: TObject);
{
var
  iKG, iGH, iGDP, iGPr, iRV, iEV, iVMP: string;
  Ministry, Teritory, District: string;
  iMinistry, iTeritory, iDistrict: string;
  sum_strafi: Real;
  iVidmineno, iNaNovijRozglyad, iZalishenoVSili: string;
  
  iVsjogo, iZaVodopostachannym, iZaOhoronojuVodojm, iZaOhoronojuGruntu,
  iZaOhoronojuAtmosfernogoPovitry, iRadiacijnoiBezpeki, iZaKomunalnimiObjektami,
  iZaLPZ, iZaPromislovimiPidpriemstvami, iZaDityachimiTaPidlitkovimi,
  iZaHarchovimiObjektami, iZaPidpriemstvamiHarchovoiPromislovaosti,
  iGromadskogoHarchuvanny, iTorgivli, iZaSudnami: string;
}
begin
{
  if frmZvitShtrafi.rgTeritory.ItemIndex=-1 then
  begin
    frmZvitShtrafi.rgTeritory.ItemIndex:=0;
    frmZvitShtrafi.aTeritoryUpdateExecute(sender);
    frmZvitShtrafi.cbTeritory.SetFocus;
    exit;
  end;
  if frmZvitShtrafi.cbTeritory.Text='' then
  begin
    frmZvitShtrafi.aTeritoryUpdateExecute(sender);
    cbTeritory.SetFocus;
    exit;
  end;
  if int(frmZvitShtrafi.dtpZaPeriodZ.Date)=int(date) then
  begin
    MessageDlg('Не вказано дату початку періоду!!!',mtWarning,[mbOK],0);
    frmZvitShtrafi.dtpZaPeriodZ.SetFocus;
    exit;
  end;
  if int(frmZvitShtrafi.dtpZaPeriodPo.Date)<int(frmZvitShtrafi.dtpZaPeriodZ.Date) then
  begin
    MessageDlg('Не правильно вказано період!!!',mtWarning,[mbOK],0);
    frmZvitShtrafi.dtpZaPeriodPo.SetFocus;
    exit;
  end;

  case frmZvitShtrafi.rgTeritory.ItemIndex of
    0:
      begin
      end;
    1:
      begin
      end;
    2:
      begin
        if frmZvitShtrafi.Caption='Звіт про заходи адмінвпливу т.23 ф.18' then
        begin
          with frmPrintF18T23 do
          begin
            if not frmMain.IsFormOpen('frmPrintF18T23') then frmPrintF18T23:=TfrmPrintF18T23.Create(self);
            Caption:='Перегляд постанови про накладення штрафу';
            QuickRep1.ReportTitle:='Звіт про адмін. заходи т.23 ф.18';
            INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'Azz.INI');

            iZaVodopostachannym:=INIAZZ.ReadString('Schokvartalnij','ZaVodopostachannym',iZaVodopostachannym);
            iZaOhoronojuVodojm:=INIAZZ.ReadString('Schokvartalnij','ZaOhoronojuVodojm',iZaOhoronojuVodojm);
            iZaOhoronojuAtmosfernogoPovitry:=INIAZZ.ReadString('Schokvartalnij','ZaOhoronojuAtmosfernogoPovitry',iZaOhoronojuAtmosfernogoPovitry);
            iZaOhoronojuGruntu:=INIAZZ.ReadString('Schokvartalnij','ZaOhoronojuGrunta',iZaOhoronojuGruntu);
            iRadiacijnoiBezpeki:=INIAZZ.ReadString('Schokvartalnij','RadiacijnoiBezpeki',iRadiacijnoiBezpeki);
            iZaKomunalnimiObjektami:=INIAZZ.ReadString('Schokvartalnij','ZaKomunalnimiObjektami',iZaKomunalnimiObjektami);
            iZaLPZ:=INIAZZ.ReadString('Schokvartalnij','ZaLPZ',iZaLPZ);
            iZaPromislovimiPidpriemstvami:=INIAZZ.ReadString('Schokvartalnij','ZaPromislovimiPidpriemstvami',iZaPromislovimiPidpriemstvami);
            iZaDityachimiTaPidlitkovimi:=INIAZZ.ReadString('Schokvartalnij','ZaDDZ',iZaDityachimiTaPidlitkovimi);
            iZaHarchovimiObjektami:=INIAZZ.ReadString('Schokvartalnij','ZaHarchovimiObjektami',iZaHarchovimiObjektami);
            iZaPidpriemstvamiHarchovoiPromislovaosti:=INIAZZ.ReadString('Schokvartalnij','ZaPid[riemstvamiHarchovoiPromislovosti',iZaPidpriemstvamiHarchovoiPromislovaosti);
            iGromadskogoHarchuvanny:=INIAZZ.ReadString('Schokvartalnij','GromadskogoHarchuvanny',iGromadskogoHarchuvanny);
            iTorgivli:=INIAZZ.ReadString('Schokvartalnij','Torgivli',iTorgivli);
            iZaSudnami:=INIAZZ.ReadString('Schokvartalnij','ZaSudnami',iZaSudnami);

            INIAZZ.Free;

            Ministry:=frmZvitShtrafi.edtMinistry.Text;
            Teritory:=frmZvitShtrafi.edtTeritory.Text;
            District:=frmZvitShtrafi.edtDistrict.Text;
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from MINISTRY where MINISTRY='''+Ministry+''' order by MINISTRY';
            qZvitSchomisychnij.Open;
            if qZvitSchomisychnij.Locate('MINISTRY',Ministry,[]) then iMinistry:=IntToStr(qZvitSchomisychnij.FieldByName('KOD').Value) else iMinistry:='0';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from TERITORY where MINISTRY='+iMinistry+' and TERITORY='''+Teritory+''' order by TERITORY';
            qZvitSchomisychnij.Open;
            if qZvitSchomisychnij.Locate('TERITORY',Teritory,[]) then iTeritory:=IntToStr(qZvitSchomisychnij.FieldByName('KOD').Value) else iTeritory:='0';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from RAJONI where TERITORY='+iTeritory+' and RAJON='''+District+''' order by RAJON';
            qZvitSchomisychnij.Open;
            if qZvitSchomisychnij.Locate('RAJON',District,[]) then iDistrict:=IntToStr(qZvitSchomisychnij.FieldByName('KOD').Value) else iDistrict:='0';

            //Кількість штрафів
            //Усього
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за водопостачанням
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaVodopostachannym+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaVodopostachannym.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною водойм
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaOhoronojuVodojm+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaOhoronojuVodojm.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною атмосферного повітря
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaOhoronojuAtmosfernogoPovitry+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaOhoronojuAtmosfernogoPovitry.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною грунта
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaOhoronojuGruntu+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaOhoronojuGrunta.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //радіаційної безпеки
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iRadiacijnoiBezpeki+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_RadiacijnoiBezpeki.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за комунальними об'єктами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaKomunalnimiObjektami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaKomunalnimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за лікувально-профілактичними закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaLPZ+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaLPZ.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за промисловими підприємствами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaPromislovimiPidpriemstvami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaPromislovimiPidpriemstvami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за дитячими та підлітковими закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaDityachimiTaPidlitkovimi+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaDitychimiTaPidlitkovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaHarchovimiObjektami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaHarchovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за підприємствами харчової промисловості
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaPidpriemstvamiHarchovoiPromislovaosti+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaPidpriemstvamiHarchovoiPromislovosti.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //громадського харчування
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iGromadskogoHarchuvanny+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_GromadskogoHarchuvanny.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //торгівлі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iTorgivli+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_Torgivli.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaSudnami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qrlShtrafi_Kilkist_ZaHarchovimi.Caption:=IntToStr(StrToInt(qrlShtrafi_Kilkist_ZaHarchovimi.Caption)+StrToInt(qrlShtrafi_Kilkist_ZaPidpriemstvamiHarchovoiPromislovosti.Caption)+StrToInt(qrlShtrafi_Kilkist_GromadskogoHarchuvanny.Caption)+StrToInt(qrlShtrafi_Kilkist_Torgivli.Caption));
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaSudnami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Kilkist_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //з них утримано
            //всього
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за водопостачанням
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaVodopostachannym+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaVodopostachannym.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною водойм
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaOhoronojuVodojm+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaOhoronojuVodojm.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною атмосферного повітря
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaOhoronojuAtmosfernogoPovitry+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaOhoronojuAtmosfernogoPovitry.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною грунта
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaOhoronojuGruntu+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaOhoronojuGrunta.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //радіаційної безпеки
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iRadiacijnoiBezpeki+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_RadiacijnoiBezpeki.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за комунальними об'єктами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaKomunalnimiObjektami+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaKomunalnimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за лікувально-профілактичними закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaLPZ+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaLPZ.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за промисловими підприємствами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaPromislovimiPidpriemstvami+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaPromislovimiPidpriemstvami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за дитячими та підлітковими закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaDityachimiTaPidlitkovimi+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaDitychimiTaPidlitkovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaHarchovimiObjektami+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaHarchovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за підприємствами харчової промисловості
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaPidpriemstvamiHarchovoiPromislovaosti+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaPidpriemstvamiHarchovoiPromislovosti.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //громадського харчування
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iGromadskogoHarchuvanny+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_GromadskogoHarchuvanny.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //торгівлі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iTorgivli+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_Torgivli.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaSudnami+''' and (not NOMERPLATIZHNOGODOKUMENTU is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qrlShtrafi_Utrimano_ZaHarchovimi.Caption:=IntToStr(StrToInt(qrlShtrafi_Utrimano_ZaHarchovimi.Caption)+StrToInt(qrlShtrafi_Utrimano_ZaPidpriemstvamiHarchovoiPromislovosti.Caption)+StrToInt(qrlShtrafi_Utrimano_GromadskogoHarchuvanny.Caption)+StrToInt(qrlShtrafi_Utrimano_Torgivli.Caption));
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and ROZDIL_F18_T23='''+iZaSudnami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Utrimano_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //адміністративно-запобіжні заходи
            //Кількість винесених постанов про припинення експлуатації об'єктів
            //всього
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за водопостачанням
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaVodopostachannym+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaVodopostachannym.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною водойм
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuVodojm+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaOhoronojuVodojm.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною атмосферного повітря
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuAtmosfernogoPovitry+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaOhoronojuAtmosfernogoPovitry.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною грунта
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuGruntu+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaOhoronojuGruntu.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //радіаційної безпеки
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iRadiacijnoiBezpeki+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_RadiacijnoiBezpeki.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за комунальними об'єктами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaKomunalnimiObjektami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaKomunalnimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за лікувально-профілактичними закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaLPZ+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaLPZ.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за промисловими підприємствами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaPromislovimiPidpriemstvami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaPromislovimiPidpriemstvami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за дитячими та підлітковими закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaDityachimiTaPidlitkovimi+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaDitychimiTaPidlitkovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaHarchovimiObjektami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaHarchovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за підприємствами харчової промисловості
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaPidpriemstvamiHarchovoiPromislovaosti+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaPidpriemstvamiHarchovoi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //громадського харчування
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iGromadskogoHarchuvanny+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_GromadskogoHarchuvanny.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //торгівлі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iTorgivli+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Torgivli.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qrlAdmin_Pripinenny_ZaHarchovimi.Caption:=IntToStr(StrToInt(qrlAdmin_Pripinenny_ZaHarchovimi.Caption)+StrToInt(qrlAdmin_Pripinenny_ZaPidpriemstvamiHarchovoi.Caption)+StrToInt(qrlAdmin_Pripinenny_GromadskogoHarchuvanny.Caption)+StrToInt(qrlAdmin_Pripinenny_Torgivli.Caption));
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaSudnami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Кількість об'єктів експлуатація яких припинена
            //тимчасово
            //всього
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за водопостачанням
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaVodopostachannym+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaVodopostachannym.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною водойм
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuVodojm+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaOhoronojuVodojm.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною атмосферного повітря
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuAtmosfernogoPovitry+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaOhoronojuAtmosfernogoPovitry.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною грунта
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuGruntu+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaOhoronojuGruntu.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //радіаційної безпеки
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iRadiacijnoiBezpeki+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_RadiacijnoiBezpeki.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за комунальними об'єктами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaKomunalnimiObjektami+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaKomunalnimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за лікувально-профілактичними закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaLPZ+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaLPZ.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за промисловими підприємствами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaPromislovimiPidpriemstvami+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaPromislovimiPidpriemstvami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за дитячими та підлітковими закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaDityachimiTaPidlitkovimi+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaDitychimiTaPidlitkovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaHarchovimiObjektami+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaHarchovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за підприємствами харчової промисловості
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaPidpriemstvamiHarchovoiPromislovaosti+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaPidpriemstvamiHarchovoiPromisl.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //громадського харчування
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iGromadskogoHarchuvanny+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_GromadskogoHarchuvanny.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //торгівлі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iTorgivli+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_Torgivli.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qrlAdmin_Pripinenny_Timchasovo_ZaHarchovimi.Caption:=IntToStr(StrToInt(qrlAdmin_Pripinenny_Timchasovo_ZaHarchovimi.Caption)+StrToInt(qrlAdmin_Pripinenny_Timchasovo_ZaPidpriemstvamiHarchovoiPromisl.Caption)+StrToInt(qrlAdmin_Pripinenny_Timchasovo_GromadskogoHarchuvanny.Caption)+StrToInt(qrlAdmin_Pripinenny_Timchasovo_Torgivli.Caption));
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaSudnami+''' and (POSTIJNO<>1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Timchasovo_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Кількість об'єктів експлуатація яких припинена
            //постійно
            //всього
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за водопостачанням
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaVodopostachannym+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaVodopostachannym.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною водойм
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuVodojm+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaOhoronojuVodojm.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною атмосферного повітря
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuAtmosfernogoPovitry+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaOhoronojuAtmosfernogoPovitry.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною грунта
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaOhoronojuGruntu+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaOhoronojuGruntu.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //радіаційної безпеки
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iRadiacijnoiBezpeki+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_RadiacijnoiBezpeki.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за комунальними об'єктами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaKomunalnimiObjektami+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaKomunalnimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за лікувально-профілактичними закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaLPZ+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaLPZ.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за промисловими підприємствами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaPromislovimiPidpriemstvami+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaPromislovimiPidpriemstvami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за дитячими та підлітковими закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaDityachimiTaPidlitkovimi+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaDitychimiTaPidlitkovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaHarchovimiObjektami+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaHarchovimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за підприємствами харчової промисловості
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaPidpriemstvamiHarchovoiPromislovaosti+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaPidpriemstvamiHarchovoiPromislov.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //громадського харчування
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iGromadskogoHarchuvanny+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_GromadskogoHarchuvanny.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //торгівлі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iTorgivli+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_Torgivli.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qrlAdmin_Pripinenny_Postijno_ZaHarchovimiObjektami.Caption:=IntToStr(StrToInt(qrlAdmin_Pripinenny_Postijno_ZaHarchovimiObjektami.Caption)+StrToInt(qrlAdmin_Pripinenny_Postijno_ZaPidpriemstvamiHarchovoiPromislov.Caption)+StrToInt(qrlAdmin_Pripinenny_Postijno_GromadskogoHarchuvanny.Caption)+StrToInt(qrlAdmin_Pripinenny_Postijno_Torgivli.Caption));
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU<>1) and ROZDIL_F18_T23='''+iZaSudnami+''' and (POSTIJNO=1)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Pripinenny_Postijno_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Кількість об'єктів, на яких було обмежено асортимент продукції, що вироблялась
            //всього
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) ';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за водопостачанням
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaVodopostachannym+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaVodopostachannym.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною водойм
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaOhoronojuVodojm+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaOhoronojuVodojm.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною атмосферного повітря
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaOhoronojuAtmosfernogoPovitry+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaOhoronojuAtmosfernogoPovitry.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за охороною грунта
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaOhoronojuGruntu+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaOhoronojuGruntu.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //радіаційної безпеки
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iRadiacijnoiBezpeki+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_RadiacijnoiBezpeki.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за комунальними об'єктами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaKomunalnimiObjektami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaKomunalnimiObjektami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за лікувально-профілактичними закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaLPZ+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaLPZ.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за промисловими підприємствами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaPromislovimiPidpriemstvami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaPromislovimiPidpriemstvami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за дитячими та підлітковими закладами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaDityachimiTaPidlitkovimi+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaDitychimiTaPidlitkovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaHarchovimiObjektami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaHarchovimi.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за підприємствами харчової промисловості
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaPidpriemstvamiHarchovoiPromislovaosti+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaPidpriemstvamiHarchovoiPromislovosti.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //громадського харчування
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iGromadskogoHarchuvanny+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_GromadskogoHarchuvanny.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //торгівлі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iTorgivli+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_Torgivli.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            //за харчовими об'єктами, в т.ч.
            qrlAdmin_Obmezhenny_ZaHarchovimi.Caption:=IntToStr(StrToInt(qrlAdmin_Obmezhenny_ZaHarchovimi.Caption)+StrToInt(qrlAdmin_Obmezhenny_ZaPidpriemstvamiHarchovoiPromislovosti.Caption)+StrToInt(qrlAdmin_Obmezhenny_GromadskogoHarchuvanny.Caption)+StrToInt(qrlAdmin_Obmezhenny_Torgivli.Caption));
            //за суднами
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and (OBMEZHENNY_ASORTIMENTU=1) and ROZDIL_F18_T23='''+iZaSudnami+'''';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlAdmin_Obmezhenny_ZaSudnami.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            QuickRep1.Preview;
            frmPrintF18T23.Close;
            frmZvitShtrafi.Close;
            exit;
          end;
        end;
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        if frmZvitShtrafi.Caption='Звіт про заходи адмінвпливу' then
        begin
          if not frmMain.IsFormOpen('frmPrintZvitShtrafiSchomisychnij') then frmPrintZvitShtrafiSchomisychnij:=TfrmPrintZvitShtrafiSchomisychnij.Create(self);
          with frmPrintZvitShtrafiSchomisychnij do
          begin
            Caption:='Перегляд постанови про накладення штрафу';
            QuickRep1.ReportTitle:='Звіт про адмін. заходи';
            QRLabel1.Caption:='Заходи адміністративного впливу';
            qrlFirmName.Caption:=cbTeritory.Text;
            qrlPochatokPerioda.Caption:=DateToStr(int(dtpZaPeriodZ.Date));
            QRLabel4.Left:=qrlPochatokPerioda.Left+qrlPochatokPerioda.Width+4;
            qrlKinecPerioda.Caption:=DateToStr(int(dtpZaPeriodPo.Date));
            qrlKinecPerioda.Left:=QRLabel4.Left+QRLabel4.Width+4;
            qrlZagolovok.Caption:=edtZagolovok.Text;   //3234944@ukr.net
            qrlFirmName1.Caption:=edtDistrict.Text;
            INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
            iKG:=INIAZZ.ReadString('Order','KG',iKG);
            iGH:=INIAZZ.ReadString('Order','GH',iGH);
            iGDP:=INIAZZ.ReadString('Order','GDP',iGDP);
            iGPr:=INIAZZ.ReadString('Order','GPr',iGPr);
            iRV:=INIAZZ.ReadString('Order','RV',iRV);
            iEV:=INIAZZ.ReadString('Order','EV',iEV);
            iVMP:=INIAZZ.ReadString('Order','VMP',iVMP);
            Ministry:=frmZvitShtrafi.edtMinistry.Text;
            Teritory:=frmZvitShtrafi.edtTeritory.Text;
            District:=frmZvitShtrafi.edtDistrict.Text;
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from MINISTRY where MINISTRY='''+Ministry+''' order by MINISTRY';
            qZvitSchomisychnij.Open;
            if qZvitSchomisychnij.Locate('MINISTRY',Ministry,[]) then iMinistry:=IntToStr(qZvitSchomisychnij.FieldByName('KOD').Value) else iMinistry:='0';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from TERITORY where MINISTRY='+iMinistry+' and TERITORY='''+Teritory+''' order by TERITORY';
            qZvitSchomisychnij.Open;
            if qZvitSchomisychnij.Locate('TERITORY',Teritory,[]) then iTeritory:=IntToStr(qZvitSchomisychnij.FieldByName('KOD').Value) else iTeritory:='0';

            iVidmineno:=INIAZZ.ReadString('Results','Vidmineno',iVidmineno);
            iNaNovijRozglyad:=INIAZZ.ReadString('Results','NovijRozglyad',iNaNovijRozglyad);
            iZalishenoVSili:=INIAZZ.ReadString('Results','ZalishenoVSili',iZalishenoVSili);

            INIAZZ.Free;

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from RAJONI where TERITORY='+iTeritory+' and RAJON='''+District+''' order by RAJON';
            qZvitSchomisychnij.Open;
            if qZvitSchomisychnij.Locate('RAJON',District,[]) then iDistrict:=IntToStr(qZvitSchomisychnij.FieldByName('KOD').Value) else iDistrict:='0';

            //Оформлено штрафів
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iKG+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_KG.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_KG_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iGH+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_GH.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_GH_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iGDP+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_GDP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_GDP_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iGPr+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_GPr.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_GPr_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iRV+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_RV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_RV_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iEV+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_EV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_EV_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDILSES='''+iVMP+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_VMP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_VMP_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafi_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ROZMIRSHTRAFU').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlShtrafi_Vsjogo_Suma.Caption:=FloatToStr(sum_strafi);

            //Оформлено фінансових санкцій
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iKG+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_KG.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_KG_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iGH+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_GH.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_GH_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iGDP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_GDP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_GDP_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iGPr+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_GPr.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_GPr_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iRV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_RV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_RV_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iEV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_EV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_EV_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_OSOBI_SES='''+iVMP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_VMP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_VMP_Suma.Caption:=FloatToStr(sum_strafi);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from FINANSOVI_SANKCII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlFinansovi_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('SUMA_SANKCII').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlFinansovi_Vsjogo_Suma.Caption:=FloatToStr(sum_strafi);

            //Оформлено постанов ГДСЛ щодо заборони випуску продукції та зняття з реалізації
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iKG+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_KG.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_KG_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iGH+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_GH.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_GH_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iGDP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_GDP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_GDP_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iGPr+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_GPr.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_GPr_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iRV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_RV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_RV_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iEV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_EV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_EV_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDDIL_SES='''+iVMP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
           qrlViluchenny_VMP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_VMP_Suma.Caption:='-';

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where DISTRICT='+iDistrict+' and DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlViluchenny_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);
            qrlViluchenny_Vsjogo_Suma.Caption:='-';

            //Закрито об'єктів Тимчасово
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iKG+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_KG.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iGH+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_GH.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iGDP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_GDP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iGPr+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_GPr.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iRV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_RV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iEV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_EV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iVMP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_VMP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=0 order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Timchasovo_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Закрито об'єктів Постійно
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iKG+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_KG.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iGH+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_GH.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iGDP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_GDP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iGPr+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_GPr.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iRV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_RV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iEV+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_EV.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN,SPIVROBITNIKI,VIDDILENNY where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 and PIB_OSOBI_SES=SPIVROBITNIKI.PRIZVISXHE and VIDDILENNY.KODVIDDILENNY=SPIVROBITNIKI.KODVIDDILENNY and VIDDILENNY.NAZVAVIDDILENNY='''+iVMP+''' order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_VMP.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVA_ADMIN where DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and POSTIJNO=1 order by NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlZakrito_Postijno_Vsjogo.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Оформлено штрафів
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from POSTANOVASHTRAF where RAJON='+iDistrict+' and DATAPOSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and DATAPOSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' order by NOMERPOSTANOVI';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlOformlenoShtrafiv.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Стягнуто штрафів
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from postanovashtraf where rajon='+iDistrict+' and ((DATAPOSTANOVI >= '''+DateToStr(int(dtpZaPeriodZ.Date))+''') AND (DATAPOSTANOVI <= '''+DateToStr(int(dtpZaPeriodPo.Date))+''')) AND ((NOT DATAPLATIZHNOGODOKUMENTU IS NULL) or (NOT DATAPEREDACHIDOVDVS IS NULL))';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlStygnotoShtrafiv.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Оскаржено штрафів
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from postanovashtraf where rajon='+iDistrict+' and ((DATAPOSTANOVI >= '''+DateToStr(int(dtpZaPeriodZ.Date))+''') AND (DATAPOSTANOVI <= '''+DateToStr(int(dtpZaPeriodPo.Date))+''')) AND (NOT DATAOSKARZHENNYPOSTANOVI IS NULL)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlOskarzhenoZhtrafiv.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //З оскаржених штрафів: відмінено
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from postanovashtraf where rajon='+iDistrict+' and ((DATAPOSTANOVI >= '''+DateToStr(int(dtpZaPeriodZ.Date))+''') AND (DATAPOSTANOVI <= '''+DateToStr(int(dtpZaPeriodPo.Date))+''')) AND (NOT DATAOSKARZHENNYPOSTANOVI IS NULL) and PRIJNYTERISHENNYPOOSKARZH='''+iVidmineno+''' and (not DATAOSKARZHENNYPOSTANOVI is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafivVidmineno.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //З оскаржених штрафів: на новий розгляд
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from postanovashtraf where rajon='+iDistrict+' and ((DATAPOSTANOVI >= '''+DateToStr(int(dtpZaPeriodZ.Date))+''') AND (DATAPOSTANOVI <= '''+DateToStr(int(dtpZaPeriodPo.Date))+''')) AND (NOT DATAOSKARZHENNYPOSTANOVI IS NULL) and PRIJNYTERISHENNYPOOSKARZH='''+iNaNovijRozglyad+''' and (not DATAOSKARZHENNYPOSTANOVI is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafivNaNovijRozglyd.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //З оскаржених штрафів: залишено в силі
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from postanovashtraf where rajon='+iDistrict+' and ((DATAPOSTANOVI >= '''+DateToStr(int(dtpZaPeriodZ.Date))+''') AND (DATAPOSTANOVI <= '''+DateToStr(int(dtpZaPeriodPo.Date))+''')) AND (NOT DATAOSKARZHENNYPOSTANOVI IS NULL) and PRIJNYTERISHENNYPOOSKARZH='''+iZalishenoVSili+''' and (not DATAOSKARZHENNYPOSTANOVI is null)';
            qZvitSchomisychnij.Open;
            qZvitSchomisychnij.Last;
            qrlShtrafivZalishenoVSili.Caption:=IntToStr(qZvitSchomisychnij.RecordCount);

            //Знято продуктів з реалізації
            qZvitSchomisychnij.SQL.Clear;
            qZvitSchomisychnij.SQL.Text:='select * from VIDOMOSTI_PRO_VILUCHENNY,VILUCHENNY_Z_REALIZACII where VILUCHENNY_Z_REALIZACII.DISTRICT='+iDistrict+' and VILUCHENNY_Z_REALIZACII.DATA_POSTANOVI>='''+DateToStr(int(dtpZaPeriodZ.Date))+''' and VILUCHENNY_Z_REALIZACII.DATA_POSTANOVI<='''+DateToStr(int(dtpZaPeriodPo.Date))+''' and VIDOMOSTI_PRO_VILUCHENNY.DATA_POSTANOVI=VILUCHENNY_Z_REALIZACII.DATA_POSTANOVI and VIDOMOSTI_PRO_VILUCHENNY.NOMER_POSTANOVI=VILUCHENNY_Z_REALIZACII.NOMER_POSTANOVI';
            qZvitSchomisychnij.Open;
            sum_strafi:=0;
            qZvitSchomisychnij.First;
            while not qZvitSchomisychnij.Eof do
            begin
              if not qZvitSchomisychnij.FieldByName('ZAGALNA_VAGA_KG').IsNull then sum_strafi:=sum_strafi+qZvitSchomisychnij.FieldByName('ZAGALNA_VAGA_KG').Value;
              qZvitSchomisychnij.Next;
            end;
            qrlZnytoProduktiv.Caption:=FloatToStr(sum_strafi);

            frmZvitShtrafi.Enabled:=false;
            QuickRep1.Preview;
            frmPrintZvitShtrafiSchomisychnij.Close;
            frmZvitShtrafi.Close;
            exit;
          end;
      end;
    end;
  end;
}
end;

procedure TfrmZvitShtrafi.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmZvitShtrafi do
  begin
    case rgTeritory.ItemIndex of
      0:
        begin
          qZvitSchomisychnij.SQL.Clear;
          qZvitSchomisychnij.SQL.Text:='select * from MINISTRY order by MINISTRY';
          qZvitSchomisychnij.Open;
          cbTeritory.Text:='';
          cbTeritory.Items.Clear;
          qZvitSchomisychnij.First;
          while not qZvitSchomisychnij.Eof do
          begin
            cbTeritory.Items.Add(qZvitSchomisychnij.FieldByName('MINISTRY').Value);
            qZvitSchomisychnij.Next;
          end;
        end;
      1:
        begin
          qZvitSchomisychnij.SQL.Clear;
          qZvitSchomisychnij.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
          qZvitSchomisychnij.Params.Clear;
          qZvitSchomisychnij.Params.Add;
          qZvitSchomisychnij.Params[0].Name:='Ministry';
          qZvitSchomisychnij.Params[0].Value:=edtMinistry.Text;
          qZvitSchomisychnij.Open;
          cbTeritory.Text:='';
          cbTeritory.Items.Clear;
          qZvitSchomisychnij.First;
          while not qZvitSchomisychnij.Eof do
          begin
            cbTeritory.Items.Add(qZvitSchomisychnij.FieldByName('TERITORY').Value);
            qZvitSchomisychnij.Next;
          end;
        end;
      2:
        begin
          qZvitSchomisychnij.SQL.Clear;
          qZvitSchomisychnij.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
          qZvitSchomisychnij.Params.Clear;
          qZvitSchomisychnij.Params.Add;
          qZvitSchomisychnij.Params[0].Name:='Teritory';
          qZvitSchomisychnij.Params[0].Value:=edtTeritory.Text;
          qZvitSchomisychnij.Open;
          cbTeritory.Text:='';
          cbTeritory.Items.Clear;
          qZvitSchomisychnij.First;
          while not qZvitSchomisychnij.Eof do
          begin
            cbTeritory.Items.Add(qZvitSchomisychnij.FieldByName('RAJON').Value);
            qZvitSchomisychnij.Next;
          end;
        end;
    end;
  end;
end;

procedure TfrmZvitShtrafi.rgTeritoryClick(Sender: TObject);
begin
  frmZvitShtrafi.aTeritoryUpdateExecute(sender);
end;

end.
