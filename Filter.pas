unit Filter;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, SysUtils;

type
  TfrmFilter = class(TForm)
    lblFilter: TLabel;
    btnFilter_Choice: TButton;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alFirlter: TActionList;
    aChoice: TAction;
    aOK: TAction;
    aCancel: TAction;
    btnFilter_Update: TButton;
    aUpdate: TAction;
    cbFilter: TComboBox;
    qFilter: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aChoiceExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
  end;

var
  frmFilter: TfrmFilter;

implementation

uses Main, Shtrafi, Spivrobitniki, TipiShtrafiv, Objekti,
  AdminZapobizhZahodi, ViluchennyZRealizacii, Posadi, TipiProdukcii,
  FinansoviSankcii, Rozdil_T23_F18;

{$R *.dfm}

procedure TfrmFilter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmFilter.Enabled:=true;
  frmMain.Enabled:=true;
  Action:=caFree;
  exit;
end;

procedure TfrmFilter.aChoiceExecute(Sender: TObject);
begin
  if frmFilter.Caption='Фінансові санкції: Тип продукції' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aTipProdukciiExecute(sender);
    frmTipiProdukcii.aChoice.Enabled:=true;
    frmTipiProdukcii.Left:=frmMain.Left+70;
    frmTipiProdukcii.Top:=frmMain.Top+70;
    frmTipiProdukcii.Width:=frmMain.Width-70;
    frmTipiProdukcii.Height:=frmMain.Height-70;
    frmTipiProdukcii.Position:=poMainFormCenter;
    frmTipiProdukcii.FormStyle:=fsNormal;
    frmTipiProdukcii.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Розділ т.23 ф.18' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aRozdil_t23_f18Execute(sender);
    frmRozdil_T23_F18.aChoice.Enabled:=true;
    frmRozdil_T23_F18.Left:=frmMain.Left+70;
    frmRozdil_T23_F18.Top:=frmMain.Top+70;
    frmRozdil_T23_F18.Width:=frmMain.Width-70;
    frmRozdil_T23_F18.Height:=frmMain.Height-70;
    frmRozdil_T23_F18.Position:=poMainFormCenter;
    frmRozdil_T23_F18.FormStyle:=fsNormal;
    frmRozdil_T23_F18.BorderStyle:=bsDialog;
    exit;
  end;
  
  if frmFilter.Caption='Фінансові санкції: Посада представника СЕС' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aPosadiExecute(sender);
    frmPosadi.aChoice.Enabled:=true;
    frmPosadi.Left:=frmMain.Left+70;
    frmPosadi.Top:=frmMain.Top+70;
    frmPosadi.Width:=frmMain.Width-70;
    frmPosadi.Height:=frmMain.Height-70;
    frmPosadi.Position:=poMainFormCenter;
    frmPosadi.FormStyle:=fsNormal;
    frmPosadi.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: П.І.Б. представника СЕС' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aSpivrobitnikiExecute(sender);
    frmSpivrobitniki.aChoice.Enabled:=true;
    frmSpivrobitniki.Left:=frmMain.Left+70;
    frmSpivrobitniki.Top:=frmMain.Top+70;
    frmSpivrobitniki.Width:=frmMain.Width-70;
    frmSpivrobitniki.Height:=frmMain.Height-70;
    frmSpivrobitniki.Position:=poMainFormCenter;
    frmSpivrobitniki.FormStyle:=fsNormal;
    frmSpivrobitniki.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Адреса об''єкту' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Назва об''єкту' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;                         
  end;

  if frmFilter.Caption='Вилучення з реалізації: Розділ т.23 ф.18' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aRozdil_t23_f18Execute(sender);
    frmRozdil_T23_F18.aChoice.Enabled:=true;
    frmRozdil_T23_F18.Left:=frmMain.Left+70;
    frmRozdil_T23_F18.Top:=frmMain.Top+70;
    frmRozdil_T23_F18.Width:=frmMain.Width-70;
    frmRozdil_T23_F18.Height:=frmMain.Height-70;
    frmRozdil_T23_F18.Position:=poMainFormCenter;
    frmRozdil_T23_F18.FormStyle:=fsNormal;
    frmRozdil_T23_F18.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Тип вилученої продукції' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aTipProdukciiExecute(sender);
    frmTipiProdukcii.aChoice.Enabled:=true;
    frmTipiProdukcii.Left:=frmMain.Left+70;
    frmTipiProdukcii.Top:=frmMain.Top+70;
    frmTipiProdukcii.Width:=frmMain.Width-70;
    frmTipiProdukcii.Height:=frmMain.Height-70;
    frmTipiProdukcii.Position:=poMainFormCenter;
    frmTipiProdukcii.FormStyle:=fsNormal;
    frmTipiProdukcii.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Посада представника СЕС' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aPosadiExecute(sender);
    frmPosadi.aChoice.Enabled:=true;
    frmPosadi.Left:=frmMain.Left+70;
    frmPosadi.Top:=frmMain.Top+70;
    frmPosadi.Width:=frmMain.Width-70;
    frmPosadi.Height:=frmMain.Height-70;
    frmPosadi.Position:=poMainFormCenter;
    frmPosadi.FormStyle:=fsNormal;
    frmPosadi.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: П.І.Б. особи СЕС' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aSpivrobitnikiExecute(sender);
    frmSpivrobitniki.aChoice.Enabled:=true;
    frmSpivrobitniki.Left:=frmMain.Left+70;
    frmSpivrobitniki.Top:=frmMain.Top+70;
    frmSpivrobitniki.Width:=frmMain.Width-70;
    frmSpivrobitniki.Height:=frmMain.Height-70;
    frmSpivrobitniki.Position:=poMainFormCenter;
    frmSpivrobitniki.FormStyle:=fsNormal;
    frmSpivrobitniki.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Тип постанови' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aTipShtrafuExecute(sender);
    frmTipiShtrafiv.aChoice.Enabled:=true;
    frmTipiShtrafiv.Left:=frmMain.Left+70;
    frmTipiShtrafiv.Top:=frmMain.Top+70;
    frmTipiShtrafiv.Width:=frmMain.Width-70;
    frmTipiShtrafiv.Height:=frmMain.Height-70;
    frmTipiShtrafiv.Position:=poMainFormCenter;
    frmTipiShtrafiv.FormStyle:=fsNormal;
    frmTipiShtrafiv.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Адреса об''єкту' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Назва об''єкту' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Розділ т.23 ф.18' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aRozdil_t23_f18Execute(sender);
    frmRozdil_T23_F18.aChoice.Enabled:=true;
    frmRozdil_T23_F18.Left:=frmMain.Left+70;
    frmRozdil_T23_F18.Top:=frmMain.Top+70;
    frmRozdil_T23_F18.Width:=frmMain.Width-70;
    frmRozdil_T23_F18.Height:=frmMain.Height-70;
    frmRozdil_T23_F18.Position:=poMainFormCenter;
    frmRozdil_T23_F18.FormStyle:=fsNormal;
    frmRozdil_T23_F18.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Тип постанови' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aTipShtrafuExecute(sender);
    frmTipiShtrafiv.aChoice.Enabled:=true;
    frmTipiShtrafiv.Left:=frmMain.Left+70;
    frmTipiShtrafiv.Top:=frmMain.Top+70;
    frmTipiShtrafiv.Width:=frmMain.Width-70;
    frmTipiShtrafiv.Height:=frmMain.Height-70;
    frmTipiShtrafiv.Position:=poMainFormCenter;
    frmTipiShtrafiv.FormStyle:=fsNormal;
    frmTipiShtrafiv.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Представник СЕС' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aSpivrobitnikiExecute(sender);
    frmSpivrobitniki.aChoice.Enabled:=true;
    frmSpivrobitniki.Left:=frmMain.Left+70;
    frmSpivrobitniki.Top:=frmMain.Top+70;
    frmSpivrobitniki.Width:=frmMain.Width-70;
    frmSpivrobitniki.Height:=frmMain.Height-70;
    frmSpivrobitniki.Position:=poMainFormCenter;
    frmSpivrobitniki.FormStyle:=fsNormal;
    frmSpivrobitniki.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Адреса об''єкту' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
   frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Об''єкти' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Розділ т.23 ф.18' then
  begin
    frmFilter.Enabled:=false;
    frmMain.aRozdil_t23_f18Execute(sender);
    frmRozdil_T23_F18.aChoice.Enabled:=true;
    frmRozdil_T23_F18.Left:=frmMain.Left+70;
    frmRozdil_T23_F18.Top:=frmMain.Top+70;
    frmRozdil_T23_F18.Width:=frmMain.Width-70;
    frmRozdil_T23_F18.Height:=frmMain.Height-70;
    frmRozdil_T23_F18.Position:=poMainFormCenter;
    frmRozdil_T23_F18.FormStyle:=fsNormal;
    frmRozdil_T23_F18.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Назва об''єкту' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Адреса об''єкту' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aObjektiExecute(sender);
    frmObjekti.aChoice.Enabled:=true;
    frmObjekti.Left:=frmMain.Left+70;
    frmObjekti.Top:=frmMain.Top+70;
    frmObjekti.Width:=frmMain.Width-70;
    frmObjekti.Height:=frmMain.Height-70;
    frmObjekti.Position:=poMainFormCenter;
    frmObjekti.FormStyle:=fsNormal;
    frmObjekti.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Тип штрафу' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aTipShtrafuExecute(sender);
    frmTipiShtrafiv.aChoice.Enabled:=true;
    frmTipiShtrafiv.Left:=frmMain.Left+70;
    frmTipiShtrafiv.Top:=frmMain.Top+70;
    frmTipiShtrafiv.Width:=frmMain.Width-70;
    frmTipiShtrafiv.Height:=frmMain.Height-70;
    frmTipiShtrafiv.Position:=poMainFormCenter;
    frmTipiShtrafiv.FormStyle:=fsNormal;
    frmTipiShtrafiv.BorderStyle:=bsDialog;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Співробітник' then
  begin
    frmMain.Enabled:=false;
    frmFilter.Enabled:=false;
    frmMain.aSpivrobitnikiExecute(sender);
    frmSpivrobitniki.aChoice.Enabled:=true;
    frmSpivrobitniki.Left:=frmMain.Left+70;
    frmSpivrobitniki.Top:=frmMain.Top+70;
    frmSpivrobitniki.Width:=frmMain.Width-70;
    frmSpivrobitniki.Height:=frmMain.Height-70;
    frmSpivrobitniki.Position:=poMainFormCenter;
    frmSpivrobitniki.FormStyle:=fsNormal;
    frmSpivrobitniki.BorderStyle:=bsDialog;
    exit;
  end;
end;

procedure TfrmFilter.aOKExecute(Sender: TObject);
var
  Ministry, Teritory, District: integer;
  TipProdukcii: integer;
  ObjektNaglydu: integer;
begin
  //фінансові санкції
  if frmFilter.Caption='Фінансові санкції: Тип продукції' then
  begin
    with frmFinansoviSankcii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;

        SQL.Clear;
        SQL.Text:='select * from TIPIPRODUKCII where TIPPRODUKCII=:TipProdukcii order by TIPPRODUKCII';
        Params.Clear;
        Params.Add;
        Params[0].Name:='TipProdukcii';
        Params[0].Value:=frmFilter.cbFilter.Text;
        Open;
        if Locate('TIPPRODUKCII',frmFilter.cbFilter.Text,[]) then TipProdukcii:=FieldByName('KOD').Value else TipProdukcii:=-1;
      end;

      qFinansoviSankcii.SQL.Clear;
      qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and TIP_PRODUKCII=:Adres order by NOMER_POSTANOVI';
      qFinansoviSankcii.Params.Clear;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[0].Name:='Ministry';
      qFinansoviSankcii.Params[0].Value:=Ministry;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[1].Name:='Teritory';
      qFinansoviSankcii.Params[1].Value:=Teritory;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[2].Name:='Rajon';
      qFinansoviSankcii.Params[2].Value:=District;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[3].Name:='Rik';
      qFinansoviSankcii.Params[3].Value:=IntToStr(udYear.Position);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='Adres';
      qFinansoviSankcii.Params[4].Value:=TipProdukcii;
      qFinansoviSankcii.Open;
      Caption:='Фінансові санкції: Тип продукції';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Розділ т.23 ф.18' then
  begin
    with frmFinansoviSankcii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;

        SQL.Clear;
        SQL.Text:='select * from ROZDILT23F18 where OBJEKTNAGLYDU=:ObjektNaglydu order by OBJEKTNAGLYDU';
        Params.Clear;
        Params.Add;
        Params[0].Name:='ObjektNaglydu';
        Params[0].Value:=frmFilter.cbFilter.Text;
        Open;
        if Locate('OBJEKTNAGLYDU',frmFilter.cbFilter.Text,[]) then ObjektNaglydu:=FieldByName('KODSTROKI').Value else ObjektNaglydu:=-1;
      end;

      qFinansoviSankcii.SQL.Clear;
//      qFinansoviSankcii.SQL.Text:='select * from RAJONI,FINANSOVI_SANKCII where RAJONI.RAJON='''+cbDistrict.Text+''' and FINANSOVI_SANKCII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and POSADA_OSOBI_SES='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and ROZDIL_T23_F18=:Adres order by NOMER_POSTANOVI';
      qFinansoviSankcii.Params.Clear;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[0].Name:='Ministry';
      qFinansoviSankcii.Params[0].Value:=Ministry;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[1].Name:='Teritory';
      qFinansoviSankcii.Params[1].Value:=Teritory;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[2].Name:='Rajon';
      qFinansoviSankcii.Params[2].Value:=District;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[3].Name:='Rik';
      qFinansoviSankcii.Params[3].Value:=IntToStr(udYear.Position);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='Adres';
      qFinansoviSankcii.Params[4].Value:=ObjektNaglydu;
      qFinansoviSankcii.Open;
      Caption:='Фінансові санкції: Розділ т.23 ф.18';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Посада представника СЕС' then
  begin
    with frmFinansoviSankcii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qFinansoviSankcii.SQL.Clear;
//      qFinansoviSankcii.SQL.Text:='select * from RAJONI,FINANSOVI_SANKCII where RAJONI.RAJON='''+cbDistrict.Text+''' and FINANSOVI_SANKCII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and POSADA_OSOBI_SES='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and POSADA_OSOBI_SES=:Adres order by NOMER_POSTANOVI';
      qFinansoviSankcii.Params.Clear;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[0].Name:='Ministry';
      qFinansoviSankcii.Params[0].Value:=Ministry;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[1].Name:='Teritory';
      qFinansoviSankcii.Params[1].Value:=Teritory;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[2].Name:='Rajon';
      qFinansoviSankcii.Params[2].Value:=District;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[3].Name:='Rik';
      qFinansoviSankcii.Params[3].Value:=IntToStr(udYear.Position);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='Adres';
      qFinansoviSankcii.Params[4].Value:=frmFilter.cbFilter.Text;
      qFinansoviSankcii.Open;
      Caption:='Фінансові санкції: Посада представника СЕС';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: П.І.Б. представника СЕС' then
  begin
    with frmFinansoviSankcii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

//      qFinansoviSankcii.SQL.Text:='select * from RAJONI,FINANSOVI_SANKCII where RAJONI.RAJON='''+cbDistrict.Text+''' and FINANSOVI_SANKCII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and PIB_OSOBI_SES='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and PIB_OSOBI_SES=:Adres order by NOMER_POSTANOVI';
      qFinansoviSankcii.Params.Clear;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[0].Name:='Ministry';
      qFinansoviSankcii.Params[0].Value:=Ministry;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[1].Name:='Teritory';
      qFinansoviSankcii.Params[1].Value:=Teritory;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[2].Name:='Rajon';
      qFinansoviSankcii.Params[2].Value:=District;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[3].Name:='Rik';
      qFinansoviSankcii.Params[3].Value:=IntToStr(udYear.Position);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='Adres';
      qFinansoviSankcii.Params[4].Value:=frmFilter.cbFilter.Text;
      qFinansoviSankcii.Open;
      Caption:='Фінансові санкції: П.І.Б. представника СЕС';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Адреса об''єкту' then
  begin
    with frmFinansoviSankcii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qFinansoviSankcii.SQL.Clear;
//      qFinansoviSankcii.SQL.Text:='select * from RAJONI,FINANSOVI_SANKCII where RAJONI.RAJON='''+cbDistrict.Text+''' and FINANSOVI_SANKCII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and ADRESA_OBJEKTU='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and ADRESA_OBJEKTU=:Adres order by NOMER_POSTANOVI';
      qFinansoviSankcii.Params.Clear;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[0].Name:='Ministry';
      qFinansoviSankcii.Params[0].Value:=Ministry;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[1].Name:='Teritory';
      qFinansoviSankcii.Params[1].Value:=Teritory;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[2].Name:='Rajon';
      qFinansoviSankcii.Params[2].Value:=District;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[3].Name:='Rik';
      qFinansoviSankcii.Params[3].Value:=IntToStr(udYear.Position);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='Adres';
      qFinansoviSankcii.Params[4].Value:=frmFilter.cbFilter.Text;
      qFinansoviSankcii.Open;
      Caption:='Фінансові санкції: Адреса об''єкту';
    end;
   frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Фінансові санкції: Назва об''єкту' then
  begin
    with frmFinansoviSankcii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qFinansoviSankcii.SQL.Clear;
//      qFinansoviSankcii.SQL.Text:='select * from RAJONI,FINANSOVI_SANKCII where RAJONI.RAJON='''+cbDistrict.Text+''' and FINANSOVI_SANKCII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and NAZVA_OBJEKTU='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qFinansoviSankcii.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and NAZVA_OBJEKTU=:Adres order by NOMER_POSTANOVI';
      qFinansoviSankcii.Params.Clear;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[0].Name:='Ministry';
      qFinansoviSankcii.Params[0].Value:=Ministry;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[1].Name:='Teritory';
      qFinansoviSankcii.Params[1].Value:=Teritory;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[2].Name:='Rajon';
      qFinansoviSankcii.Params[2].Value:=District;
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[3].Name:='Rik';
      qFinansoviSankcii.Params[3].Value:=IntToStr(udYear.Position);
      qFinansoviSankcii.Params.Add;
      qFinansoviSankcii.Params[4].Name:='Adres';
      qFinansoviSankcii.Params[4].Value:=frmFilter.cbFilter.Text;
      qFinansoviSankcii.Open;
      Caption:='Фінансові санкції: Назва об''єкту';
    end;
    frmFilter.Close;
    exit;
  end;

  //Вилучення з реалізації
  if frmFilter.Caption='Вилучення з реалізації: Розділ т.23 ф.18' then
  begin
    with frmFilter.qFilter do
    begin
      SQL.Clear;
      SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
      Open;
      if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

      SQL.Clear;
      SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
      Open;
      if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;
       SQL.Clear;
      SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
      Open;
      if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
    end;
    with frmViluchennyZRealizacii.qViluchennyZRealizacii do
    begin
      SQL.Clear;
      SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and ROZDIL_F18=:F18 order by NOMER_POSTANOVI';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=District;
      Params.Add;
      Params[3].Name:='Rik';
      Params[3].Value:=frmViluchennyZRealizacii.udYear.Position;
      Params.Add;
      Params[4].Name:='F18';
      Params[4].Value:=frmFilter.cbFilter.Text;
      Open;
      frmViluchennyZRealizacii.Caption:='Вилучення з реалізації: Розділ т.23 ф.18';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Тип вилученої продукції' then
  begin
    with frmViluchennyZRealizacii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      TipProdukcii:=0;
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TIPIPRODUKCII where TIPPRODUKCII=:TipProdukcii order by KOD';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='TipProdukcii';
      qTeritory.Params[0].Value:=frmFilter.cbFilter.Text;
      qTeritory.Open;
      if qTeritory.RecordCount>0 then TipProdukcii:=qTeritory.FieldByName('KOD').Value;
      qViluchennyZRealizacii.SQL.Clear;
//      qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON='''+cbDistrict.Text+''' and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and TIPPRODUKCII='+IntToStr(TipProdukcii)+' order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and TIPPRODUKCII=:Adres order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='Ministry';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='Teritory';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='Rik';
      qViluchennyZRealizacii.Params[3].Value:=IntToStr(udYear.Position);
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='Adres';
      qViluchennyZRealizacii.Params[4].Value:=IntToStr(TipProdukcii);
      qViluchennyZRealizacii.Open;
      Caption:='Вилучення з реалізації: Тип вилученої продукції';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Посада представника СЕС' then
  begin
    with frmViluchennyZRealizacii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and POSADA_SES=:Adres order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='Ministry';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='Teritory';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='Rik';
      qViluchennyZRealizacii.Params[3].Value:=IntToStr(udYear.Position);
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='Adres';
      qViluchennyZRealizacii.Params[4].Value:=frmFilter.cbFilter.Text;
      qViluchennyZRealizacii.Open;
      Caption:='Вилучення з реалізації: Посада представника СЕС';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: П.І.Б. особи СЕС' then
  begin
    with frmViluchennyZRealizacii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and OSOBA_SES=:Adres order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='Ministry';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='Teritory';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='Rik';
      qViluchennyZRealizacii.Params[3].Value:=IntToStr(udYear.Position);
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='Adres';
      qViluchennyZRealizacii.Params[4].Value:=frmFilter.cbFilter.Text;
      qViluchennyZRealizacii.Open;
      Caption:='Вилучення з реалізації: П.І.Б. особи СЕС';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Тип постанови' then
  begin
    with frmViluchennyZRealizacii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and TIP_SHTRAFU=:Adres order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='Ministry';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='Teritory';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='Rik';
      qViluchennyZRealizacii.Params[3].Value:=IntToStr(udYear.Position);
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='Adres';
      qViluchennyZRealizacii.Params[4].Value:=frmFilter.cbFilter.Text;
      qViluchennyZRealizacii.Open;
      Caption:='Вилучення з реалізації: Тип постанови';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Адреса об''єкту' then
  begin
    with frmViluchennyZRealizacii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and ADRESA=:Adres order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='Ministry';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='Teritory';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='Rik';
      qViluchennyZRealizacii.Params[3].Value:=IntToStr(udYear.Position);
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='Adres';
      qViluchennyZRealizacii.Params[4].Value:=frmFilter.cbFilter.Text;
      qViluchennyZRealizacii.Open;
      Caption:='Вилучення з реалізації: Адреса об''єкту';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Вилучення з реалізації: Назва об''єкту' then
  begin
    with frmViluchennyZRealizacii do
    begin
      with qFilter do
      begin
        SQL.Clear;
        SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
        Open;
        if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

        SQL.Clear;
        SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by Teritory';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
        Open;
        if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

        SQL.Clear;
        SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Ministry';
        Params[0].Value:=Ministry;
        Params.Add;
        Params[1].Name:='Teritory';
        Params[1].Value:=Teritory;
        Params.Add;
        Params[2].Name:='Rajon';
        Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
        Open;
        if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
      end;

      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and NAZVA_OBJEKTU=:Adres order by NOMER_POSTANOVI';
//      qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON='''+cbDistrict.Text+''' and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and ='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='Ministry';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='Teritory';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='Rik';
      qViluchennyZRealizacii.Params[3].Value:=IntToStr(udYear.Position);
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='Adres';
      qViluchennyZRealizacii.Params[4].Value:=frmFilter.cbFilter.Text;
//      qViluchennyZRealizacii.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON='''+cbDistrict.Text+''' and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_='+IntToStr(udYear.Position)+' and ADRESA='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qViluchennyZRealizacii.Open;
      Caption:='Вилучення з реалізації: Назва об''єкту';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Розділ т.23 ф.18' then
  begin
    with frmAdminZapobizhZahodi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qAdminZapobizhZahidi.SQL.Clear;
//      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON='''+cbDistrict.Text+''' and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and YEAR_='+edtYear.Text+' and TIPSHTRAFIV='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and ROZDIL_F18_T23=:TipShtrafiv order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='Rajon';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='Rik';
      qAdminZapobizhZahidi.Params[3].Value:=edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='TipShtrafiv';
      qAdminZapobizhZahidi.Params[4].Value:=frmFilter.cbFilter.Text;
      qAdminZapobizhZahidi.Open;
      Caption:='Адмін. заходи: Розділ т.23 ф.18';
    end;
    frmFilter.Close;
    exit;
  end;

 if frmFilter.Caption='Адмін. заходи: Тип постанови' then
  begin
    with frmAdminZapobizhZahodi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qAdminZapobizhZahidi.SQL.Clear;
//      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON='''+cbDistrict.Text+''' and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and YEAR_='+edtYear.Text+' and TIPSHTRAFIV='''+frmFilter.cbFilter.Text+''' order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and TIPSHTRAFIV=:TipShtrafiv order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='Rajon';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='Rik';
      qAdminZapobizhZahidi.Params[3].Value:=edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='TipShtrafiv';
      qAdminZapobizhZahidi.Params[4].Value:=frmFilter.cbFilter.Text;
      qAdminZapobizhZahidi.Open;
      Caption:='Адмін. заходи: Тип постанови';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Представник СЕС' then
  begin
    with frmAdminZapobizhZahodi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qAdminZapobizhZahidi.SQL.Clear;
      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and PIB_OSOBI_SES=:PIB_SES order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='Rajon';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='Rik';
      qAdminZapobizhZahidi.Params[3].Value:=edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='PIB_SES';
      qAdminZapobizhZahidi.Params[4].Value:=frmFilter.cbFilter.Text;
      qAdminZapobizhZahidi.Open;
      Caption:='Адмін. заходи: Представник СЕС';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Адреса об''єкту' then
  begin
    with frmAdminZapobizhZahodi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qAdminZapobizhZahidi.SQL.Clear;
      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and ADRESA_OBJEKTU=:AdresaObjektu order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='Rajon';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='Rik';
      qAdminZapobizhZahidi.Params[3].Value:=edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='AdresaObjektu';
      qAdminZapobizhZahidi.Params[4].Value:=frmFilter.cbFilter.Text;
      qAdminZapobizhZahidi.Open;
      Caption:='Адмін. заходи: Адреса об''єкту';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Адмін. заходи: Об''єкти' then
  begin
    with frmAdminZapobizhZahodi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qAdminZapobizhZahidi.SQL.Clear;
      qAdminZapobizhZahidi.SQL.Text:='select * from POSTANOVA_ADMIN where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and NAZVA_OBJEKTU=:NazvaObjektu order by NOMER_POSTANOVI';
      qAdminZapobizhZahidi.Params.Clear;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[0].Name:='Ministry';
      qAdminZapobizhZahidi.Params[0].Value:=Ministry;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[1].Name:='Teritory';
      qAdminZapobizhZahidi.Params[1].Value:=Teritory;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[2].Name:='Rajon';
      qAdminZapobizhZahidi.Params[2].Value:=District;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[3].Name:='Rik';
      qAdminZapobizhZahidi.Params[3].Value:=edtYear.Text;
      qAdminZapobizhZahidi.Params.Add;
      qAdminZapobizhZahidi.Params[4].Name:='NazvaObjektu';
      qAdminZapobizhZahidi.Params[4].Value:=frmFilter.cbFilter.Text;
      qAdminZapobizhZahidi.Open;
      Caption:='Адмін. заходи: Об''єкти';
    end;
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Розділ т.23 ф.18' then
  begin
    with frmShtrafi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbRajon.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF where MINISTRI=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and YEAR_=:Rik and ROZDIL_F18_T23=:Objekt order by NOMERPOSTANOVI';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=District;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='Rik';
      qShtrafi.Params[3].Value:=edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='Objekt';
      qShtrafi.Params[4].Value:=frmFilter.cbFilter.Text;
      qShtrafi.Open;
    end;
    frmShtrafi.Caption:='Перелік постанов за розділом т.23 ф.18';
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Назва об''єкту' then
  begin
    with frmShtrafi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbRajon.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF where MINISTRI=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and YEAR_=:Rik and NAZVAOBJEKTU=:Objekt order by NOMERPOSTANOVI';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=District;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='Rik';
      qShtrafi.Params[3].Value:=edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='Objekt';
      qShtrafi.Params[4].Value:=frmFilter.cbFilter.Text;
      qShtrafi.Open;
    end;
    frmShtrafi.Caption:='Перелік постанов за назвою об''єкту';
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Адреса об''єкту' then
  begin
    with frmShtrafi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbRajon.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF where MINISTRI=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and YEAR_=:Rik and ADRESAOBJEKTU=:Adresa order by NOMERPOSTANOVI';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=District;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='Rik';
      qShtrafi.Params[3].Value:=edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='Adresa';
      qShtrafi.Params[4].Value:=frmFilter.cbFilter.Text;
      qShtrafi.Open;
    end;
    frmShtrafi.Caption:='Перелік постанов за адресою об''єкту';
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Тип штрафу' then
  begin
    with frmShtrafi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbRajon.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF where MINISTRI=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and YEAR_=:Rik and TIPSTRAFIV=:Tip order by NOMERPOSTANOVI';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=District;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='Rik';
      qShtrafi.Params[3].Value:=edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='Tip';
      qShtrafi.Params[4].Value:=frmFilter.cbFilter.Text;
//      qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF,RAJONI where POSTANOVASHTRAF.YEAR_='+edtRik.Text+' and RAJONI.RAJON='''+cbRajon.Text+''' and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.TIPSTRAFIV='''+frmFilter.cbFilter.Text+''' order by POSTANOVASHTRAF.NOMERPOSTANOVI';
      qShtrafi.Open;
    end;
    frmShtrafi.Caption:='Перелік постанов за типом';
    frmFilter.Close;
    exit;
  end;

  if frmFilter.Caption='Штрафи: Співробітник' then
  begin
    with frmShtrafi do
    begin
      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=frmShtrafi.cbMinistry.Text;
      qTeritory.Open;
      if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=frmShtrafi.cbTeritory.Text;
      qTeritory.Open;
      if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

      qTeritory.SQL.Clear;
      qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qTeritory.Params.Clear;
      qTeritory.Params.Add;
      qTeritory.Params[0].Name:='Ministry';
      qTeritory.Params[0].Value:=Ministry;
      qTeritory.Params.Add;
      qTeritory.Params[1].Name:='Teritory';
      qTeritory.Params[1].Value:=Teritory;
      qTeritory.Params.Add;
      qTeritory.Params[2].Name:='Rajon';
      qTeritory.Params[2].Value:=frmShtrafi.cbRajon.Text;
      qTeritory.Open;
      if qTeritory.Locate('RAJON',cbRajon.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

      qShtrafi.SQL.Clear;
      qShtrafi.SQL.Text:='Select * from POSTANOVASHTRAF where MINISTRI=:Ministry and TERITORY=:Teritory and RAJON=:Rajon and POSTANOVASHTRAF.YEAR_=:Rik and POSTANOVASHTRAF.PIBOSOBISES=:PIB order by NOMERPOSTANOVI';
      qShtrafi.Params.Clear;
      qShtrafi.Params.Add;
      qShtrafi.Params[0].Name:='Ministry';
      qShtrafi.Params[0].Value:=Ministry;
      qShtrafi.Params.Add;
      qShtrafi.Params[1].Name:='Teritory';
      qShtrafi.Params[1].Value:=Teritory;
      qShtrafi.Params.Add;
      qShtrafi.Params[2].Name:='Rajon';
      qShtrafi.Params[2].Value:=District;
      qShtrafi.Params.Add;
      qShtrafi.Params[3].Name:='Rik';
      qShtrafi.Params[3].Value:=edtRik.Text;
      qShtrafi.Params.Add;
      qShtrafi.Params[4].Name:='PIB';
      qShtrafi.Params[4].Value:=frmFilter.cbFilter.Text;
      qShtrafi.Open;
    end;
    frmShtrafi.Caption:='Перелік постанов у співробітника';
    frmFilter.Close;
    exit;
  end;
end;

procedure TfrmFilter.aCancelExecute(Sender: TObject);
begin
  frmFilter.Close;
end;

procedure TfrmFilter.aUpdateExecute(Sender: TObject);
var
  Ministry, Teritory, District: integer;
begin
  if (frmMain.IsFormOpen('frmFinansoviSankcii'))and(frmMain.ActiveMDIChild=frmFinansoviSankcii) then
  begin
    with frmFilter.qFilter do
    begin
      SQL.Clear;
      SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=frmFinansoviSankcii.cbMinistry.Text;
      Open;
      if Locate('MINISTRY',frmFinansoviSankcii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

      SQL.Clear;
      SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=frmFinansoviSankcii.cbTeritory.Text;
      Open;
      if Locate('TERITORY',frmFinansoviSankcii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

      SQL.Clear;
      SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmFinansoviSankcii.cbDistrict.Text;
      Open;
      if Locate('RAJON',frmFinansoviSankcii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
    end;

    if frmFilter.Caption='Фінансові санкції: Тип продукції' then
    begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('TIPPRODUKCII').Value);
          qFilter.Next;
        end;
    end;

    if frmFilter.Caption='Фінансові санкції: Розділ т.23 ф.18' then
    begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('OBJEKTNAGLYDU').Value);
          qFilter.Next;
        end;
    end;

      if frmFilter.Caption='Фінансові санкції: Посада представника СЕС' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from POSADI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAPOSADI';
        qFilter.Params.Clear;
        qFilter.Params.Add;
        qFilter.Params[0].Name:='Ministry';
        qFilter.Params[0].Value:=Ministry;
        qFilter.Params.Add;
        qFilter.Params[1].Name:='Teritory';
        qFilter.Params[1].Value:=Teritory;
        qFilter.Params.Add;
        qFilter.Params[2].Name:='Rajon';
        qFilter.Params[2].Value:=District;
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('NAZVAPOSADI').Value);
          qFilter.Next;
        end;
    end;

      if frmFilter.Caption='Фінансові санкції: П.І.Б. представника СЕС' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
        qFilter.Params.Clear;
        qFilter.Params.Add;
        qFilter.Params[0].Name:='Ministry';
        qFilter.Params[0].Value:=Ministry;
        qFilter.Params.Add;
        qFilter.Params[1].Name:='Teritory';
        qFilter.Params[1].Value:=Teritory;
        qFilter.Params.Add;
        qFilter.Params[2].Name:='Rajon';
        qFilter.Params[2].Value:=District;
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('PRIZVISXHE').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Фінансові санкції: Адреса об''єкту' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from OBJEKTI order by ADRESAOBJEKTA';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('ADRESAOBJEKTA').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Фінансові санкції: Назва об''єкту' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from OBJEKTI order by NAZVAOBJEKTA';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('NAZVAOBJEKTA').Value);
          qFilter.Next;
        end;
      end;
  end;

  if (frmMain.IsFormOpen('frmViluchennyZRealizacii'))and(frmMain.ActiveMDIChild=frmViluchennyZRealizacii) then
  begin
    with frmFilter.qFilter do
    begin
      SQL.Clear;
      SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=frmViluchennyZRealizacii.cbMinistry.Text;
      Open;
      if Locate('MINISTRY',frmViluchennyZRealizacii.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

      SQL.Clear;
      SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=frmViluchennyZRealizacii.cbTeritory.Text;
      Open;
      if Locate('TERITORY',frmViluchennyZRealizacii.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

      SQL.Clear;
      SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmViluchennyZRealizacii.cbDistrict.Text;
      Open;
      if Locate('RAJON',frmViluchennyZRealizacii.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
    end;

      if frmFilter.Caption='Вилучення з реалізації: Розділ т.23 ф.18' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('OBJEKTNAGLYDU').Value);
          qFilter.Next;
        end;
      end;
      
      if frmFilter.Caption='Вилучення з реалізації: Тип вилученої продукції' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('TIPPRODUKCII').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Вилучення з реалізації: Посада представника СЕС' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from POSADI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAPOSADI';
        qFilter.Params.Clear;
        qFilter.Params.Add;
        qFilter.Params[0].Name:='Ministry';
        qFilter.Params[0].Value:=Ministry;
        qFilter.Params.Add;
        qFilter.Params[1].Name:='Teritory';
        qFilter.Params[1].Value:=Teritory;
        qFilter.Params.Add;
        qFilter.Params[2].Name:='Rajon';
        qFilter.Params[2].Value:=District;
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('NAZVAPOSADI').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Вилучення з реалізації: П.І.Б. особи СЕС' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
        qFilter.Params.Clear;
        qFilter.Params.Add;
        qFilter.Params[0].Name:='Ministry';
        qFilter.Params[0].Value:=Ministry;
        qFilter.Params.Add;
        qFilter.Params[1].Name:='Teritory';
        qFilter.Params[1].Value:=Teritory;
        qFilter.Params.Add;
        qFilter.Params[2].Name:='Rajon';
        qFilter.Params[2].Value:=District;
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('PRIZVISXHE').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Вилучення з реалізації: Тип постанови' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('TIPSHTRAFU').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Вилучення з реалізації: Адреса об''єкту' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from OBJEKTI order by ADRESAOBJEKTA';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('ADRESAOBJEKTA').Value);
          qFilter.Next;
        end;
      end;

    if frmFilter.Caption='Вилучення з реалізації: Назва об''єкту' then
    begin
      qFilter.SQL.Clear;
      qFilter.SQL.Text:='select * from OBJEKTI order by NAZVAOBJEKTA';
      qFilter.Open;
      cbFilter.Text:='';
      cbFilter.Items.Clear;
      qFilter.First;
      while not qFilter.Eof do
      begin
        if not qFilter.FieldByName('NAZVAOBJEKTA').IsNull then cbFilter.Items.Add(qFilter.FieldByName('NAZVAOBJEKTA').Value);
        qFilter.Next;
      end;
    end;
  end;

  if (frmMain.IsFormOpen('frmAdminZapobizhZahodi'))and(frmMain.ActiveMDIChild=frmAdminZapobizhZahodi) then
  begin
    with frmFilter.qFilter do
    begin
      SQL.Clear;
      SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=frmAdminZapobizhZahodi.cbMinistry.Text;
      Open;
      if Locate('MINISTRY',frmAdminZapobizhZahodi.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

      SQL.Clear;
      SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=frmAdminZapobizhZahodi.cbTeritory.Text;
      Open;
      if Locate('TERITORY',frmAdminZapobizhZahodi.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

      SQL.Clear;
      SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmAdminZapobizhZahodi.cbDistrict.Text;
      Open;
      if Locate('RAJON',frmAdminZapobizhZahodi.cbDistrict.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
  end;

      if frmFilter.Caption='Адмін. заходи: Розділ т.23 ф.18' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('OBJEKTNAGLYDU').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Адмін. заходи: Тип постанови' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('TIPSHTRAFU').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Адмін. заходи: Представник СЕС' then
      begin
        qFilter.SQL.Clear;
        qFilter.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
//        qFilter.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON='''+frmAdminZapobizhZahodi.cbDistrict.Text+''' and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
        qFilter.Params.Clear;
          qFilter.Params.Add;
          qFilter.Params[0].Name:='Ministry';
          qFilter.Params[0].Value:=Ministry;
          qFilter.Params.Add;
          qFilter.Params[1].Name:='Teritory';
          qFilter.Params[1].Value:=Teritory;
          qFilter.Params.Add;
          qFilter.Params[2].Name:='Rajon';
          qFilter.Params[2].Value:=District;
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FIeldByName('PRIZVISXHE').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Адмін. заходи: Адреса об''єкту' then
      begin
        qFilter.SQL.Clear;
          qFilter.SQL.Text:='select * from OBJEKTI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by ADRESAOBJEKTA';
          qFilter.Params.Clear;
          qFilter.Params.Add;
          qFilter.Params[0].Name:='Ministry';
          qFilter.Params[0].Value:=Ministry;
          qFilter.Params.Add;
          qFilter.Params[1].Name:='Teritory';
          qFilter.Params[1].Value:=Teritory;
          qFilter.Params.Add;
          qFilter.Params[2].Name:='Rajon';
          qFilter.Params[2].Value:=District;
        qFilter.Open;
        cbFilter.Text:='';
        cbFilter.Items.Clear;
        qFilter.First;
        while not qFilter.Eof do
        begin
          cbFilter.Items.Add(qFilter.FieldByName('ADRESAOBJEKTA').Value);
          qFilter.Next;
        end;
      end;

      if frmFilter.Caption='Адмін. заходи: Об''єкти' then
      begin
        with frmFilter do
        begin
          qFilter.SQL.Clear;
          qFilter.SQL.Text:='select * from OBJEKTI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAOBJEKTA';
          qFilter.Params.Clear;
          qFilter.Params.Add;
          qFilter.Params[0].Name:='Ministry';
          qFilter.Params[0].Value:=Ministry;
          qFilter.Params.Add;
          qFilter.Params[1].Name:='Teritory';
          qFilter.Params[1].Value:=Teritory;
          qFilter.Params.Add;
          qFilter.Params[2].Name:='Rajon';
          qFilter.Params[2].Value:=District;
          qFilter.Open;
          cbFilter.Text:='';
          cbFilter.Items.Clear;
          qFilter.First;
          while not qFilter.Eof do
          begin
            cbFilter.Items.Add(qFilter.FieldByName('NAZVAOBJEKTA').Value);
            qFilter.Next;
          end;
        end;
        exit;
      end;
    end;

  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    with frmFilter.qFilter do
    begin
      SQL.Clear;
      SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=frmShtrafi.cbMinistry.Text;
      Open;
      if Locate('MINISTRY',frmShtrafi.cbMinistry.Text,[]) then Ministry:=FieldByName('KOD').Value else Ministry:=0;

      SQL.Clear;
      SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=frmShtrafi.cbTeritory.Text;
      Open;
      if Locate('TERITORY',frmShtrafi.cbTeritory.Text,[]) then Teritory:=FieldByName('KOD').Value else Teritory:=0;

      SQL.Clear;
      SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Ministry';
      Params[0].Value:=Ministry;
      Params.Add;
      Params[1].Name:='Teritory';
      Params[1].Value:=Teritory;
      Params.Add;
      Params[2].Name:='Rajon';
      Params[2].Value:=frmShtrafi.cbRajon.Text;
      Open;
      if Locate('RAJON',frmShtrafi.cbRajon.Text,[]) then District:=FieldByName('KOD').Value else District:=0;
  end;         

      if frmFilter.Caption='Штрафи: Розділ т.23 ф.18' then
      begin
        with frmShtrafi do
        begin
          qTeritory.SQL.Clear;
          qTeritory.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
          qTeritory.Open;
        end;
        frmFilter.cbFilter.Items.Clear;
        frmFilter.cbFilter.Text:='';
        frmShtrafi.qTeritory.First;
        while not frmShtrafi.qTeritory.Eof do
        begin
          frmFilter.cbFilter.Items.Add(frmShtrafi.qTeritory.FieldByName('OBJEKTNAGLYDU').Value);
          frmShtrafi.qTeritory.Next;
        end;
        exit;
      end;

      if frmFilter.Caption='Штрафи: Назва об''єкту' then
      begin
        with frmShtrafi do
        begin
          qTeritory.SQL.Clear;
          qTeritory.SQL.Text:='select * from OBJEKTI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by NAZVAOBJEKTA';
          qTeritory.Params.Clear;
          qTeritory.Params.Add;
          qTeritory.Params[0].Name:='Ministry';
          qTeritory.Params[0].Value:=Ministry;
          qTeritory.Params.Add;
          qTeritory.Params[1].Name:='Teritory';
          qTeritory.Params[1].Value:=Teritory;
          qTeritory.Params.Add;
          qTeritory.Params[2].Name:='Rajon';
          qTeritory.Params[2].Value:=District;
          qTeritory.Open;
        end;
        frmFilter.cbFilter.Items.Clear;
        frmFilter.cbFilter.Text:='';
        frmShtrafi.qTeritory.First;
        while not frmShtrafi.qTeritory.Eof do
        begin
          frmFilter.cbFilter.Items.Add(frmShtrafi.qTeritory.FieldByName('NAZVAOBJEKTA').Value);
          frmShtrafi.qTeritory.Next;
        end;
        exit;
      end;

      if frmFilter.Caption='Штрафи: Адреса об''єкту' then
      begin
        with frmShtrafi do
        begin
          qTeritory.SQL.Clear;
          qTeritory.SQL.Text:='select * from OBJEKTI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by ADRESAOBJEKTA';
          qTeritory.Params.Clear;
          qTeritory.Params.Add;
          qTeritory.Params[0].Name:='Ministry';
          qTeritory.Params[0].Value:=Ministry;
          qTeritory.Params.Add;
          qTeritory.Params[1].Name:='Teritory';
          qTeritory.Params[1].Value:=Teritory;
          qTeritory.Params.Add;
          qTeritory.Params[2].Name:='Rajon';
          qTeritory.Params[2].Value:=District;
          qTeritory.Open;
        end;
        frmFilter.cbFilter.Items.Clear;
        frmFilter.cbFilter.Text:='';
        frmShtrafi.qTeritory.First;
        while not frmShtrafi.qTeritory.Eof do
        begin
          frmFilter.cbFilter.Items.Add(frmShtrafi.qTeritory.FieldByName('ADRESAOBJEKTA').Value);
          frmShtrafi.qTeritory.Next;
        end;
        exit;
      end;

      if frmFilter.Caption='Штрафи: Тип штрафу' then
      begin
        with frmShtrafi do
        begin
          qTeritory.SQL.Clear;
          qTeritory.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
          qTeritory.Open;
        end;
        frmFilter.cbFilter.Items.Clear;
        frmFilter.cbFilter.Text:='';
        frmShtrafi.qTeritory.First;
        while not frmShtrafi.qTeritory.Eof do
        begin
          frmFilter.cbFilter.Items.Add(frmShtrafi.qTeritory.FieldByName('TIPSHTRAFU').Value);
          frmShtrafi.qTeritory.Next;
        end;
        exit;
      end;

    if frmFilter.Caption='Штрафи: Співробітник' then
    begin
        with frmShtrafi do
        begin
          qTeritory.SQL.Clear;
          qTeritory.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by PRIZVISXHE';
          qTeritory.Params.Clear;
          qTeritory.Params.Add;
          qTeritory.Params[0].Name:='Ministry';
          qTeritory.Params[0].Value:=Ministry;
          qTeritory.Params.Add;
          qTeritory.Params[1].Name:='Teritory';
          qTeritory.Params[1].Value:=Teritory;
          qTeritory.Params.Add;
          qTeritory.Params[2].Name:='Rajon';
          qTeritory.Params[2].Value:=District;
//          qTeritory.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON='''+cbRajon.Text+''' and SPIVROBITNIKI.RAJON=RAJONI.KOD order by SPIVROBITNIKI.PRIZVISXHE';
          qTeritory.Open;
        end;
        frmFilter.cbFilter.Items.Clear;
        frmFilter.cbFilter.Text:='';
        frmShtrafi.qTeritory.First;
        while not frmShtrafi.qTeritory.Eof do
        begin
          frmFilter.cbFilter.Items.Add(frmShtrafi.qTeritory.FieldByName('PRIZVISXHE').Value);
          frmShtrafi.qTeritory.Next;
        end;
        exit;
    end;
  end;
end;

end.
