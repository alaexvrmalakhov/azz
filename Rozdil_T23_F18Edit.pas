unit Rozdil_T23_F18Edit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmRozdil_T23_F18Edit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodStroki: TEdit;
    edtNazvaObjektu: TEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    btnKodStroki: TButton;
    alRozdilt23f18Edit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmRozdil_T23_F18Edit: TfrmRozdil_T23_F18Edit;

implementation

uses
  Main, FinansoviSankciiEdit, Rozdil_T23_F18, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, Filter;

{$R *.dfm}

procedure TfrmRozdil_T23_F18Edit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    if frmViddilennyEdit.Caption<>'Вибір об''єкту нагляду' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmFinansoviSankciiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
    frmMain.Enabled:=false;
    if frmRozdil_T23_F18Edit.Caption<>'Вибір об''єкту нагляду' then
    begin
      frmRozdil_T23_F18.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmRozdil_T23_F18.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmRozdil_T23_F18Edit.Caption<>'Вибір об''єкту нагляду' then
    begin
      frmRozdil_T23_F18.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmRozdil_T23_F18.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmRozdil_T23_F18Edit.Caption<>'Вибір об''єкту нагляду' then
    begin
      frmRozdil_T23_F18.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmRozdil_T23_F18.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmRozdil_T23_F18Edit.Caption<>'Вибір об''єкту нагляду' then
    begin
      frmRozdil_T23_F18.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmRozdil_T23_F18.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmRozdil_T23_F18Edit.Caption<>'Вибір об''єкту нагляду' then
    begin
      frmRozdil_T23_F18.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmRozdil_T23_F18.Close;
    Action:=caFree;
    exit;
  end;
}
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRozdil_T23_F18Edit.aKodUpdateExecute(Sender: TObject);
begin
  with frmRozdil_T23_F18 do
  begin
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='insert into ROZDILT23F18 (KODSTROKI) values (GEN_ID(GET_DICTIONARIES_RECORD_ID,1))';
    qTemp.Open;
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='select * from ROZDILT23F18 order by KODSTROKI';
    qTemp.Open;
    qTemp.Last;
    frmRozdil_T23_F18Edit.edtKodStroki.Text:=IntToStr(qTemp.FieldByName('KODSTROKI').Value);
  end;
end;

procedure TfrmRozdil_T23_F18Edit.aOKExecute(Sender: TObject);
begin
  if frmRozdil_T23_F18Edit.Caption='Вибір об''єкту нагляду' then
  begin
{
//    if frmMain.IsFormOpen('frmZvyzok') then
//    begin
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaVodopostachannym_Choice then frmZvyzok.cbZaVodopostachannym.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaOhoronojuVodojm_Choice then frmZvyzok.cbZaOhoronojuVodojm.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaOhoronojuAtmosfernogoPovitrya_Choice then frmZvyzok.cbZaOhoronojuAtmosfernogoPovitrya.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaOhoronojuGruntu_Choice then frmZvyzok.cbZaOhoronojuGruntu.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnRadiacijnoiBezpeki_Choice then frmZvyzok.cbRadiacijnoiBezpeki.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaKomunalnimiObjektami_Choice then frmZvyzok.cbZaKomunalnimiObjektami.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaLPZ_Choice then frmZvyzok.cbZaLPZ.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaPromislovimiPidpriemstvami_Choice then frmZvyzok.cbZaPromislovimiPidpriemstvami.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaDitychimiTaPidlitkovimiZakladami_Choice then frmZvyzok.cbZaDitychimiTaPidlitkovimiZakladami.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaHarchovimiObjektami_Choice then frmZvyzok.cbZaHarchovimiObjektami.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaPidpriemstvamiHarchovoiPromislovosti_Choice then frmZvyzok.cbZaPidpriemstvamiHarchovoiPromislovosti.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnGromadskogoHarchuvanny_Choice then frmZvyzok.cbGromadskogoHarchuvanny.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnTorgivli_Choice then frmZvyzok.cbTorgivli.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZaSudnami_Choice then frmZvyzok.cbZaSudnami.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
//      frmRozdil_T23_F18Edit.Close;
//      frmRozdil_T23_F18.Close;
//      exit;
//    end;

    if frmMain.IsFormOpen('frmFilter') then
    begin
      frmFilter.cbFilter.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      frmRozdil_T23_F18Edit.Close;
      frmRozdil_T23_F18.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbRozdil_F18.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      frmRozdil_T23_F18Edit.Close;
      frmRozdil_T23_F18.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      frmRozdil_T23_F18Edit.Close;
      frmRozdil_T23_F18.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbRozdilT23F18.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      frmRozdil_T23_F18Edit.Close;
      frmRozdil_T23_F18.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.cbRozdil_F18.Text:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      frmRozdil_T23_F18Edit.Close;
      frmRozdil_T23_F18.Close;
      exit;
    end;
}
  end;

  if frmRozdil_T23_F18Edit.Caption='Видалення об''єкту нагляду' then
  begin
    if MessageDlg('Видалення цієї строки може відобразитись на звітах!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmRozdil_T23_F18.qRozdilt23F18 do
      begin
        SQL.Clear;
        SQL.Text:='delete from ROZDILT23F18 where KODSTROKI=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=frmRozdil_T23_F18Edit.edtKodStroki.Text;
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmRozdil_T23_F18.aUpdateExecute(sender);
      frmRozdil_T23_F18Edit.Close;
      exit;
    end;
  end;

  if frmRozdil_T23_F18Edit.Caption='Редагування об''єкту нагляду' then
  begin
    if frmRozdil_T23_F18Edit.edtKodStroki.Text='' then
    begin
      frmRozdil_T23_F18Edit.aKodUpdateExecute(sender);
      frmRozdil_T23_F18Edit.edtKodStroki.SetFocus;
      exit;
    end;
    try
      StrToInt(frmRozdil_T23_F18Edit.edtKodStroki.Text);
    except
      frmRozdil_T23_F18Edit.aKodUpdateExecute(sender);
      frmRozdil_T23_F18Edit.edtKodStroki.SetFocus;
      exit;
    end;

    if frmRozdil_T23_F18Edit.edtNazvaObjektu.Text='' then
    begin
      frmRozdil_T23_F18Edit.edtNazvaObjektu.SetFocus;
      exit;
    end;

    with frmRozdil_T23_F18.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='update ROZDILT23F18 set OBJEKTNAGLYDU=:Objekt where KODSTROKI=:KOD';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Objekt';
      Params[0].Value:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      Params.Add;
      Params[1].Name:='KOD';
      Params[1].Value:=frmRozdil_T23_F18Edit.edtKodStroki.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmRozdil_T23_F18.aUpdateExecute(sender);
    frmRozdil_T23_F18Edit.Close;
    exit;
  end;

  if frmRozdil_T23_F18Edit.Caption='Додавання об''єкту нагляду' then
  begin
    if frmRozdil_T23_F18Edit.edtKodStroki.Text='' then
    begin
      frmRozdil_T23_F18Edit.aKodUpdateExecute(sender);
      frmRozdil_T23_F18Edit.edtKodStroki.SetFocus;
      exit;
    end;
    try
      StrToInt(frmRozdil_T23_F18Edit.edtKodStroki.Text);
    except
      frmRozdil_T23_F18Edit.aKodUpdateExecute(sender);
      frmRozdil_T23_F18Edit.edtKodStroki.SetFocus;
      exit;
    end;

    if frmRozdil_T23_F18Edit.edtNazvaObjektu.Text='' then
    begin
      frmRozdil_T23_F18Edit.edtNazvaObjektu.SetFocus;
      exit;
    end;

    with frmRozdil_T23_F18.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='update ROZDILT23F18 set OBJEKTNAGLYDU=:Objekt where KODSTROKI=:KOD';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Objekt';
      Params[0].Value:=frmRozdil_T23_F18Edit.edtNazvaObjektu.Text;
      Params.Add;
      Params[1].Name:='KOD';
      Params[1].Value:=frmRozdil_T23_F18Edit.edtKodStroki.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmRozdil_T23_F18.aUpdateExecute(sender);
    frmRozdil_T23_F18Edit.Close;
    exit;
  end;
end;

procedure TfrmRozdil_T23_F18Edit.aCancelExecute(Sender: TObject);
begin
  frmRozdil_T23_F18Edit.Close;
end;

end.
