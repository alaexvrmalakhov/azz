unit Povidomlenny;

interface

uses
  Forms, Classes, ActnList, DB, IBCustomDataSet, IBQuery, Controls,
  StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls, SysUtils;

type
  TfrmPovidomlenny = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edtNomerLista: TEdit;
    dtpDataLista: TDateTimePicker;
    Panel2: TPanel;
    btnDoVidomaAdd: TButton;
    btnDoVidomaEdit: TButton;
    btnDoVidomaDelete: TButton;
    DBGrid2: TDBGrid;
    edtNomerAktu: TEdit;
    dtpDataAktu: TDateTimePicker;
    edtNomerPostanovi: TEdit;
    dtpDataPostanovi: TDateTimePicker;
    btnVikonati: TButton;
    btnVidmina: TButton;
    Label5: TLabel;
    edtNazvaPostanovi: TEdit;
    btnNazvaPostanovi: TButton;
    Label6: TLabel;
    edtKod: TEdit;
    btnDoVidomaUpdate: TButton;
    dsPovidomlenny: TDataSource;
    qPovidomlenny: TIBQuery;
    alPovidomlenny: TActionList;
    aKomuNapravlenoUpdate: TAction;
    qRecord_ID: TIBQuery;
    aNazvaPostanoviUpdate: TAction;
    aKomuNapravlenoAdd: TAction;
    aKomuNapravlenoEdit: TAction;
    aKomuNapravlenoDelete: TAction;
    aOK: TAction;
    aCancel: TAction;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKomuNapravlenoUpdateExecute(Sender: TObject);
    procedure aNazvaPostanoviUpdateExecute(Sender: TObject);
    procedure aKomuNapravlenoAddExecute(Sender: TObject);
    procedure aKomuNapravlenoEditExecute(Sender: TObject);
    procedure aKomuNapravlenoDeleteExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmPovidomlenny: TfrmPovidomlenny;

implementation

uses
  Main, AdminZapobizhZahodi, NapravlenoDoVidoma;

{$R *.dfm}

procedure TfrmPovidomlenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmPovidomlenny.aKomuNapravlenoUpdateExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  try
    StrToInt(frmPovidomlenny.edtNomerPostanovi.Text);
  except
    if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').IsNull then frmPovidomlenny.edtNomerPostanovi.Text:=IntToStr(frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NOMER_POSTANOVI').Value) else
    begin
      frmPovidomlenny.edtNomerPostanovi.Text:='';
      exit;
    end;
  end;

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

    qPovidomlenny.SQL.Clear;
    qPovidomlenny.SQL.Text:='select * from NAPRAVLENODOVIDOMA where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and VIDNOVLENNY=:Povidomlenny and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi order by KOD';// and and ';
//    qPovidomlenny.SQL.Text:='select * from NAPRAVLENODOVIDOMA where VIDNOVLENNY=:Povidomlenny and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi and MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon order by KOD';
    qPovidomlenny.Params.Clear;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[0].Name:='Ministry';
    qPovidomlenny.Params[0].Value:=Ministry;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[1].Name:='Teritory';
    qPovidomlenny.Params[1].Value:=Teritory;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[2].Name:='Rajon';
    qPovidomlenny.Params[2].Value:=District;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[3].Name:='Povidomlenny';
    qPovidomlenny.Params[3].Value:='povidomlenny';
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[4].Name:='NomerPostanovi';
    qPovidomlenny.Params[4].Value:=frmPovidomlenny.edtNomerPostanovi.Text;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[5].Name:='DataPostanovi';
    qPovidomlenny.Params[5].Value:=DateToStr(int(frmPovidomlenny.dtpDataPostanovi.Date));
    qPovidomlenny.Open;
  end;
end;

procedure TfrmPovidomlenny.aNazvaPostanoviUpdateExecute(Sender: TObject);
begin
  frmPovidomlenny.edtNazvaPostanovi.Text:='';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').IsNull then frmPovidomlenny.edtNazvaPostanovi.Text:=' про '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VID_POSTANOVI').Value+' ';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('NAZVA_OBJEKTU').IsNull then frmPovidomlenny.edtNazvaPostanovi.Text:=frmPovidomlenny.edtNazvaPostanovi.Text+'роботи '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FIeldByName('NAZVA_OBJEKTU').Value+' ';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').IsNull then frmPovidomlenny.edtNazvaPostanovi.Text:=frmPovidomlenny.edtNazvaPostanovi.Text+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('VIDOMCHA_PIDPORYDKOVANIST').Value+' ';
  if not frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').IsNull then frmPovidomlenny.edtNazvaPostanovi.Text:=frmPovidomlenny.edtNazvaPostanovi.Text+'по '+frmAdminZapobizhZahodi.qAdminZapobizhZahidi.FieldByName('ADRESA_OBJEKTU').Value;
end;

procedure TfrmPovidomlenny.aKomuNapravlenoAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmPovidomlenny.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Додавання направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmPovidomlenny.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmPovidomlenny.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmPovidomlenny.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=frmPovidomlenny.edtNomerPostanovi.Text;
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmPovidomlenny.dtpDataPostanovi.Date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=true;
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=true;
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=true;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmPovidomlenny.aKomuNapravlenoEditExecute(Sender: TObject);
begin
  if frmPovidomlenny.qPovidomlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmPovidomlenny.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Зміна направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmPovidomlenny.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmPovidomlenny.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmPovidomlenny.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('NOMER_POSTANOVI').IsNull then frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=IntToStr(frmPovidomlenny.qPovidomlenny.FieldByName('NOMER_POSTANOVI').Value) else frmNapravlenoDoVidoma.edtNomerPostanovi.Text:='';
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('DATA_POSTANOVI').IsNull then frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmPovidomlenny.qPovidomlenny.FieldByName('DATA_POSTANOVI').Value) else frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('KOD').IsNull then frmNapravlenoDoVidoma.edtKod.Text:=IntToStr(frmPovidomlenny.qPovidomlenny.FieldByName('KOD').Value) else frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  if not frmPovidomlenny.qPovidomlenny.FieldByName('PIB').IsNull then frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmPovidomlenny.qPovidomlenny.FieldByName('PIB').Value else frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=true;
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmPovidomlenny.qPovidomlenny.FieldByName('POSADA').IsNull then frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmPovidomlenny.qPovidomlenny.FieldByName('POSADA').Value else frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=true;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=true;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('DATA_NAPRAVLENNY').IsNull then frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(frmPovidomlenny.qPovidomlenny.FieldByName('DATA_NAPRAVLENNY').Value) else frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=true;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.SetFocus;
end;

procedure TfrmPovidomlenny.aKomuNapravlenoDeleteExecute(Sender: TObject);
begin
  if frmPovidomlenny.qPovidomlenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmNapravlenoDoVidoma:=TfrmNapravlenoDoVidoma.Create(self);
  frmPovidomlenny.Enabled:=false;
  frmNapravlenoDoVidoma.Show;
  frmNapravlenoDoVidoma.BorderStyle:=bsDialog;
  frmNapravlenoDoVidoma.Position:=poMainFormCenter;
  frmNapravlenoDoVidoma.Caption:='Видалення направлення';
  frmNapravlenoDoVidoma.cbMinistry.Text:=frmPovidomlenny.cbMinistry.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbTeritory.Text:=frmPovidomlenny.cbTeritory.Text;
  frmNapravlenoDoVidoma.cbTeritory.Enabled:=false;
  frmNapravlenoDoVidoma.cbDistrict.Text:=frmPovidomlenny.cbDistrict.Text;
  frmNapravlenoDoVidoma.cbDistrict.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('NOMER_POSTANOVI').IsNull then frmNapravlenoDoVidoma.edtNomerPostanovi.Text:=IntToStr(frmPovidomlenny.qPovidomlenny.FieldByName('NOMER_POSTANOVI').Value) else frmNapravlenoDoVidoma.edtNomerPostanovi.Text:='';
  frmNapravlenoDoVidoma.edtNomerPostanovi.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('DATA_POSTANOVI').IsNull then frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(frmPovidomlenny.qPovidomlenny.FieldByName('DATA_POSTANOVI').Value) else frmNapravlenoDoVidoma.dtpDataPostanovi.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataPostanovi.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('KOD').IsNull then frmNapravlenoDoVidoma.edtKod.Text:=IntToStr(frmPovidomlenny.qPovidomlenny.FieldByName('KOD').Value) else frmNapravlenoDoVidoma.aKodUpdateExecute(sender);
  frmNapravlenoDoVidoma.edtKod.Enabled:=false;
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPIBOtrimuvacha_UpdateExecute(sender);
  if not frmPovidomlenny.qPovidomlenny.FieldByName('PIB').IsNull then frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmPovidomlenny.qPovidomlenny.FieldByName('PIB').Value else frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Update.Enabled:=false;
  frmNapravlenoDoVidoma.btnPIB_Otrimuvacha_Choice.Enabled:=false;
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Items.Clear;
  frmNapravlenoDoVidoma.aPosadaOtrimuvacha_UpdateExecute(sender);
  if not frmPovidomlenny.qPovidomlenny.FieldByName('POSADA').IsNull then frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmPovidomlenny.qPovidomlenny.FieldByName('POSADA').Value else frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:='';
  frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Enabled:=false;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Update.Enabled:=false;
  frmNapravlenoDoVidoma.btnPosadaOtrimuvacha_Choice.Enabled:=false;
  if not frmPovidomlenny.qPovidomlenny.FieldByName('DATA_NAPRAVLENNY').IsNull then frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(frmPovidomlenny.qPovidomlenny.FieldByName('DATA_NAPRAVLENNY').Value) else frmNapravlenoDoVidoma.dtpDataNapravlenny.Date:=int(date);
  frmNapravlenoDoVidoma.dtpDataNapravlenny.Enabled:=false;
  frmNapravlenoDoVidoma.btnVidminiti.SetFocus;
end;

procedure TfrmPovidomlenny.aOKExecute(Sender: TObject);
begin
  if frmPovidomlenny.edtNomerLista.Text='' then
  begin
    frmPovidomlenny.edtNomerLista.SetFocus;
    exit;
  end;
  if frmPovidomlenny.edtNazvaPostanovi.Text='' then
  begin
    frmPovidomlenny.edtNazvaPostanovi.SetFocus;
    exit;
  end;

  with frmPovidomlenny do
  begin
    qPovidomlenny.SQL.Clear;
    qPovidomlenny.SQL.Text:='update POSTANOVA_ADMIN set NOMER_LISTA_POVIDOMLENNY=:NOMER_LISTA_POVIDOMLENNY,DATA_LISTA_POVIDOMLENNY=:DATA_LISTA_POVIDOMLENNY,NAZVAPOSTANOVIPOVIDOMLENNY=:NAZVAPOSTANOVIPOVIDOMLENNY where RECORD_ID=:Kod';
    qPovidomlenny.Params.Clear;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[0].Name:='NOMER_LISTA_POVIDOMLENNY';
    qPovidomlenny.Params[0].Value:=edtNomerLista.Text;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[1].Name:='DATA_LISTA_POVIDOMLENNY';
    qPovidomlenny.Params[1].Value:=DateToStr(int(dtpDataLista.Date));
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[2].Name:='NAZVAPOSTANOVIPOVIDOMLENNY';
    qPovidomlenny.Params[2].Value:=edtNazvaPostanovi.Text;
    qPovidomlenny.Params.Add;
    qPovidomlenny.Params[3].Name:='Kod';
    qPovidomlenny.Params[3].Value:=edtKod.Text;
    qPovidomlenny.Open;
  end;
  frmMain.trAzz.CommitRetaining;
  frmAdminZapobizhZahodi.aUpdateExecute(sender);
  frmPovidomlenny.Close;
end;

procedure TfrmPovidomlenny.aCancelExecute(Sender: TObject);
begin
  frmPovidomlenny.Close;
end;

end.
