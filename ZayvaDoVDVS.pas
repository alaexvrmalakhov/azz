unit ZayvaDoVDVS;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls, Grids,
  DBGrids, ComCtrls, StdCtrls, SysUtils, Dialogs;

type
  TfrmZayvaDoVDVS = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtVihidnijNomer: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label4: TLabel;
    edtPIBPorushnikaTV_Posada_MisceRoboti: TEdit;
    btnPIBPorushnikaTV_Posada_MisceRoboti: TButton;
    dtpDataPeredachiDoVDVS: TDateTimePicker;
    dtpDataReestraciiZayvi: TDateTimePicker;
    btnZakriti: TButton;
    Label5: TLabel;
    edtNomerPostanovi: TEdit;
    Label6: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    Label7: TLabel;
    edtKod: TEdit;
    alZayavaDoVDVS: TActionList;
    aPIBPorushnikaTV_Posada_MisceRoboti: TAction;
    aOK: TAction;
    aCancel: TAction;
    aClose: TAction;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnUpdate: TButton;
    DBGrid1: TDBGrid;
    aAddNapravlenny: TAction;
    aEditNapravlenny: TAction;
    aDeleteNapravlenny: TAction;
    aUpdateNapravlenny: TAction;
    dsNapravlenny: TDataSource;
    qNapravlenny: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aPIBPorushnikaTV_Posada_MisceRobotiExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aAddNapravlennyExecute(Sender: TObject);
    procedure aEditNapravlennyExecute(Sender: TObject);
    procedure aDeleteNapravlennyExecute(Sender: TObject);
    procedure aUpdateNapravlennyExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmZayvaDoVDVS: TfrmZayvaDoVDVS;

implementation

uses
  Main, Shtrafi, NapravlenoDoVidoma;

{$R *.dfm}

procedure TfrmZayvaDoVDVS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmShtrafi.aUpdateExecute(sender);
  with frmShtrafi.qShtrafi do
  begin
    SQL.Clear;
    SQL.Text:='update POSTANOVASHTRAF set EDITING=0 where KOD=:Kod';
    Params.Clear;
    Params.Add;
    Params[0].Name:='Kod';
    Params[0].Value:=StrToInt(frmZayvaDoVDVS.edtKod.Text);
    Open;
    frmMain.trAzz.CommitRetaining;
    frmShtrafi.aUpdateExecute(sender);
    frmShtrafi.qShtrafi.Last;
  end;
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmZayvaDoVDVS.aPIBPorushnikaTV_Posada_MisceRobotiExecute(
  Sender: TObject);
begin
  frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text:='';
  if not frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKA').IsNull then frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text:=frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text+frmShtrafi.qShtrafi.FieldByName('PIBPORUSHNIKA').Value;
  if not frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').IsNull then frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text:=frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text+' '+frmShtrafi.qShtrafi.FieldByName('POSADAPORUSHNIKA').Value;
  if not frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').IsNull then frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text:=frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text+' '+frmShtrafi.qShtrafi.FieldByName('NAZVAOBJEKTU').Value;
end;

procedure TfrmZayvaDoVDVS.aOKExecute(Sender: TObject);
begin
  with frmShtrafi do
  begin
    qShtrafi.SQL.Clear;
    qShtrafi.SQL.Text:='update POSTANOVASHTRAF set DATAPEREDACHIDOVDVS=:DATAPEREDACHIDOVDVS,DATAREESTRACIIZAYVI=:DATAREESTRACIIZAYVI,VIHIDNIJNOMER=:VIHIDNIJNOMER,PIBTV_POSADA_MISCERABOTI=:PIBTV_POSADA_MISCERABOTI,EDITING=0 where KOD=:Kod';
    qShtrafi.Params.Clear;
    qShtrafi.Params.Add;
    qShtrafi.Params[0].Name:='DATAPEREDACHIDOVDVS';
    qShtrafi.Params[0].Value:=DateToStr(int(frmZayvaDoVDVS.dtpDataPeredachiDoVDVS.Date));
    qShtrafi.Params.Add;
    qShtrafi.Params[1].Name:='DATAREESTRACIIZAYVI';
    qShtrafi.Params[1].Value:=DateToStr(int(frmZayvaDoVDVS.dtpDataReestraciiZayvi.Date));
    qShtrafi.Params.Add;
    qShtrafi.Params[2].Name:='VIHIDNIJNOMER';
    qShtrafi.Params[2].Value:=frmZayvaDoVDVS.edtVihidnijNomer.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[3].Name:='PIBTV_POSADA_MISCERABOTI';
    qShtrafi.Params[3].Value:=frmZayvaDoVDVS.edtPIBPorushnikaTV_Posada_MisceRoboti.Text;
    qShtrafi.Params.Add;
    qShtrafi.Params[4].Name:='Kod';
    qShtrafi.Params[4].Value:=frmZayvaDoVDVS.edtKod.Text;
    qShtrafi.Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmShtrafi.aUpdateExecute(sender);
  frmZayvaDoVDVS.Close;
end;

procedure TfrmZayvaDoVDVS.aCancelExecute(Sender: TObject);
begin
  if MessageDlg('УВАГА!!!'+#13+'Всі відомості стосовно цієї заяви буде знищено!!!'+#13+'Продовжити?',mtWarning,[mbYes,mbNo],0)=mrYes then
  begin
    frmShtrafi.qShtrafi.SQL.Clear;
    frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set DATAPEREDACHIDOVDVS=:DataPeredachi,DATAREESTRACIIZAYVI=:DataReestracii,VIHIDNIJNOMER=:VihidnijNomer,PIBTV_POSADA_MISCERABOTI=:PIBPosadaRobota,EDITING=0 where KOD=:Kod';
    frmShtrafi.qShtrafi.Params.Clear;
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[0].Name:='DataPeredachi';
    frmShtrafi.qShtrafi.Params[0].Value:='';
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[1].Name:='DataReestracii';
    frmShtrafi.qShtrafi.Params[1].Value:='';
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[2].Name:='VihidnijNomer';
    frmShtrafi.qShtrafi.Params[2].Value:='';
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[3].Name:='PIBPosadaRobota';
    frmShtrafi.qShtrafi.Params[3].Value:='';
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[4].Name:='Kod';
    frmShtrafi.qShtrafi.Params[4].Value:=frmZayvaDoVDVS.edtKod.Text;
    frmShtrafi.qShtrafi.Open;
    frmMain.trAzz.CommitRetaining;
    frmShtrafi.aUpdateExecute(sender);
    frmZayvaDoVDVS.Close;
  end;
end;

procedure TfrmZayvaDoVDVS.aCloseExecute(Sender: TObject);
begin
  frmZayvaDoVDVS.Close;
end;

procedure TfrmZayvaDoVDVS.aAddNapravlennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmZayvaDoVDVS.Enabled:=false;
  with frmNapravlenoDoVidoma do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додавання направлення';
    edtNomerPostanovi.Text:=frmZayvaDoVDVS.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    dtpDataPostanovi.Date:=frmZayvaDoVDVS.dtpDataPostanovi.Date;
    dtpDataPostanovi.Enabled:=false;

    cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbDistrict.Text:=frmShtrafi.cbRajon.Text;
    cbDistrict.Enabled:=false;

    aKodUpdateExecute(sender);
    edtKod.Enabled:=false;

    aPIBOtrimuvacha_UpdateExecute(sender);
    cbPIB_Otrimuvacha.Enabled:=true;
    btnPIB_Otrimuvacha_Update.Enabled:=true;
    btnPIB_Otrimuvacha_Choice.Enabled:=true;

    aPosadaOtrimuvacha_UpdateExecute(sender);
    cbPosadaOtrimuvacha.Enabled:=true;
    btnPosadaOtrimuvacha_Update.Enabled:=true;
    btnPosadaOtrimuvacha_Choice.Enabled:=true;

    dtpDataNapravlenny.Date:=int(date);
    dtpDataNapravlenny.Enabled:=true;
    cbPIB_Otrimuvacha.SetFocus;
  end;
end;

procedure TfrmZayvaDoVDVS.aEditNapravlennyExecute(Sender: TObject);
begin
  if frmZayvaDoVDVS.qNapravlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmZayvaDoVDVS.Enabled:=false;
  with frmNapravlenoDoVidoma do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Зміна направлення';

    cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbDistrict.Text:=frmShtrafi.cbRajon.Text;
    cbDistrict.Enabled:=false;

    edtNomerPostanovi.Text:=frmZayvaDoVDVS.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    dtpDataPostanovi.Date:=frmZayvaDoVDVS.dtpDataPostanovi.Date;
    dtpDataPostanovi.Enabled:=false;
    if not qNapravlenny.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(qNapravlenny.FieldByName('KOD').Value) else edtKod.Text:='';
    edtKod.Enabled:=false;
    aPIBOtrimuvacha_UpdateExecute(sender);
    if not qNapravlenny.FieldByName('PIB').IsNull then cbPIB_Otrimuvacha.Text:=qNapravlenny.FieldByName('PIB').Value else cbPIB_Otrimuvacha.Text:='';
    cbPIB_Otrimuvacha.Enabled:=true;
    btnPIB_Otrimuvacha_Update.Enabled:=true;
    btnPIB_Otrimuvacha_Choice.Enabled:=true;

    aPosadaOtrimuvacha_UpdateExecute(sender);
    if not qNapravlenny.FieldByName('POSADA').IsNull then cbPosadaOtrimuvacha.Text:=qNapravlenny.FieldByName('POSADA').Value else cbPosadaOtrimuvacha.Text:='';
    cbPosadaOtrimuvacha.Enabled:=true;
    btnPosadaOtrimuvacha_Update.Enabled:=true;
    btnPosadaOtrimuvacha_Choice.Enabled:=true;

    if not qNapravlenny.FieldByName('DATA_NAPRAVLENNY').IsNull then dtpDataNapravlenny.Date:=int(qNapravlenny.FieldByName('DATA_NAPRAVLENNY').Value) else dtpDataNapravlenny.Date:=int(date);
    dtpDataNapravlenny.Enabled:=true;
    cbPIB_Otrimuvacha.SetFocus;
  end;
end;

procedure TfrmZayvaDoVDVS.aDeleteNapravlennyExecute(Sender: TObject);
begin
  if frmZayvaDoVDVS.qNapravlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmZayvaDoVDVS.Enabled:=false;
  with frmNapravlenoDoVidoma do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалення направлення';

    cbMinistry.Text:=frmShtrafi.cbMinistry.Text;
    cbMinistry.Enabled:=false;
    cbTeritory.Text:=frmShtrafi.cbTeritory.Text;
    cbTeritory.Enabled:=false;
    cbDistrict.Text:=frmShtrafi.cbRajon.Text;
    cbDistrict.Enabled:=false;

    edtNomerPostanovi.Text:=frmZayvaDoVDVS.edtNomerPostanovi.Text;
    edtNomerPostanovi.Enabled:=false;
    dtpDataPostanovi.Date:=frmZayvaDoVDVS.dtpDataPostanovi.Date;
    dtpDataPostanovi.Enabled:=false;
    if not qNapravlenny.FieldByName('KOD').IsNull then edtKod.Text:=IntToStr(qNapravlenny.FieldByName('KOD').Value) else edtKod.Text:='';
    edtKod.Enabled:=false;
    aPIBOtrimuvacha_UpdateExecute(sender);
    if not qNapravlenny.FieldByName('PIB').IsNull then cbPIB_Otrimuvacha.Text:=qNapravlenny.FieldByName('PIB').Value else cbPIB_Otrimuvacha.Text:='';
    cbPIB_Otrimuvacha.Enabled:=false;
    btnPIB_Otrimuvacha_Update.Enabled:=false;
    btnPIB_Otrimuvacha_Choice.Enabled:=false;

    aPosadaOtrimuvacha_UpdateExecute(sender);
    if not qNapravlenny.FieldByName('POSADA').IsNull then cbPosadaOtrimuvacha.Text:=qNapravlenny.FieldByName('POSADA').Value else cbPosadaOtrimuvacha.Text:='';
    cbPosadaOtrimuvacha.Enabled:=false;
    btnPosadaOtrimuvacha_Update.Enabled:=false;
    btnPosadaOtrimuvacha_Choice.Enabled:=false;

    if not qNapravlenny.FieldByName('DATA_NAPRAVLENNY').IsNull then dtpDataNapravlenny.Date:=int(qNapravlenny.FieldByName('DATA_NAPRAVLENNY').Value) else dtpDataNapravlenny.Date:=int(date);
    dtpDataNapravlenny.Enabled:=false;
    btnVidminiti.SetFocus;
  end;
end;

procedure TfrmZayvaDoVDVS.aUpdateNapravlennyExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if frmMain.IsFormOpen('frmZayvaDoVDVS') then
    with frmZayvaDoVDVS do
    begin
      qNapravlenny.SQL.Clear;
      qNapravlenny.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qNapravlenny.Params.Clear;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[0].Name:='Ministry';
      qNapravlenny.Params[0].Value:=frmShtrafi.cbMinistry.Text;
      qNapravlenny.Open;
      if qNapravlenny.Locate('MINISTRY',frmShtrafi.cbMinistry.Text,[]) then Ministry:=qNapravlenny.FieldByName('KOD').Value else Ministry:=0;

      qNapravlenny.SQL.Clear;
      qNapravlenny.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qNapravlenny.Params.Clear;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[0].Name:='Ministry';
      qNapravlenny.Params[0].Value:=Ministry;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[1].Name:='Teritory';
      qNapravlenny.Params[1].Value:=frmShtrafi.cbTeritory.Text;
      qNapravlenny.Open;
      if qNapravlenny.Locate('TERITORY',frmShtrafi.cbTeritory.Text,[]) then Teritory:=qNapravlenny.FieldByName('KOD').Value else Teritory:=0;

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
      qNapravlenny.Params[2].Value:=frmShtrafi.cbRajon.Text;
      qNapravlenny.Open;
      if qNapravlenny.Locate('RAJON',frmShtrafi.cbRajon.Text,[]) then District:=qNapravlenny.FieldByName('KOD').Value else District:=0;

      qNapravlenny.SQL.Clear;
      qNapravlenny.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:VIDNOVLENNY and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by PIB';
//      qNapravlenny.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:VIDNOVLENNY and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by PIB';
      qNapravlenny.Params.Clear;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[0].Name:='Ministry';
      qNapravlenny.Params[0].Value:=Ministry;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[1].Name:='Teritory';
      qNapravlenny.Params[1].Value:=Teritory;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[2].Name:='Rajon';
      qNapravlenny.Params[2].Value:=District;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[3].Name:='VIDNOVLENNY';
      qNapravlenny.Params[3].Value:='VDVS';
      qNapravlenny.Params.Add;
      qNapravlenny.Params[4].Name:='NomerPostanovi';
      qNapravlenny.Params[4].Value:=edtNomerPostanovi.Text;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[5].Name:='DataPostanovi';
      qNapravlenny.Params[5].Value:=DateToStr(int(dtpDataPostanovi.Date));
      qNapravlenny.Open;
    end;
end;

procedure TfrmZayvaDoVDVS.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmZayvaDoVDVS.dsNapravlenny;
end;

end.
