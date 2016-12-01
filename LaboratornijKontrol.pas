unit LaboratornijKontrol;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ComCtrls, Dialogs, SysUtils;

type
  TfrmLaboratornijKontrol = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnVidKontrolu_Choice: TButton;
    edtNomeriProb: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label4: TLabel;
    Label5: TLabel;
    edtNomerPostanovi: TEdit;
    dtpDataPostanovi: TDateTimePicker;
    dtpDataKontrolu: TDateTimePicker;
    cbVidKontrolu: TComboBox;
    alLaboratornijKontrol: TActionList;
    aVidKontrolu_Update: TAction;
    btnVidKontrolu_Update: TButton;
    aVidKontrolu_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    Label6: TLabel;
    edtKod: TEdit;
    aKodUpdate: TAction;
    qID: TIBQuery;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aVidKontrolu_ChoiceExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aVidKontrolu_UpdateExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
  end;

var
  frmLaboratornijKontrol: TfrmLaboratornijKontrol;

implementation

uses
  Main, AdminZapobizhZahodiEdit, FinansoviSankciiEdit,
  ViluchennyZRealizaciiEdit, VidnovlennyRobit, ShtrafiEdit,
  LaboratorniDoslidzhenny;

{$R *.dfm}

procedure TfrmLaboratornijKontrol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmVidnovlennyRobit') then
  begin
    frmVidnovlennyRobit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
  exit;
end;

procedure TfrmLaboratornijKontrol.aVidKontrolu_ChoiceExecute(
  Sender: TObject);
begin
  frmLaboratornijKontrol.Enabled:=false;
  frmMain.aLaboratorniDoslidzhennyExecute(sender);
  frmLaboratorniDoslidzhenny.aChoice.Enabled:=true;
  frmLaboratorniDoslidzhenny.Left:=frmMain.Left+70;
  frmLaboratorniDoslidzhenny.Top:=frmMain.Top+70;
  frmLaboratorniDoslidzhenny.Width:=frmMain.Width-70;
  frmLaboratorniDoslidzhenny.Height:=frmMain.Height-70;
  frmLaboratorniDoslidzhenny.Position:=poMainFormCenter;
  frmLaboratorniDoslidzhenny.FormStyle:=fsNormal;
  frmLaboratorniDoslidzhenny.BorderStyle:=bsDialog;
end;

procedure TfrmLaboratornijKontrol.aOKExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if frmLaboratornijKontrol.Caption='Видалити відомості про лабораторний контроль' then
  begin
    if MessageDlg('Увага!'+#13+'Відновлення цього запису буде неможливе!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
      begin
        with frmFinansoviSankciiEdit do
        begin
          qLaboratory.SQL.Clear;
          qLaboratory.SQL.Text:='delete from LABORATORNIJKONTROL where KOD=:Kod';
          qLaboratory.Params.Clear;
          qLaboratory.Params.Add;
          qLaboratory.Params[0].Name:='Kod';
          qLaboratory.Params[0].Value:=frmLaboratornijKontrol.edtKod.Text;
          qLaboratory.Open;
          frmLaboratornijKontrol.Close;
          frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
          exit;
        end;
      end;

      if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
      begin
        with frmViluchennyZRealizaciiEdit do
        begin
          qLaboratornijKontrol.SQL.Clear;
          qLaboratornijKontrol.SQL.Text:='delete from LABORATORNIJKONTROL where KOD=:Kod';
          qLaboratornijKontrol.Params.Clear;
          qLaboratornijKontrol.Params.Add;
          qLaboratornijKontrol.Params[0].Name:='Kod';
          qLaboratornijKontrol.Params[0].Value:=frmLaboratornijKontrol.edtKod.Text;
          qLaboratornijKontrol.Open;
          frmLaboratornijKontrol.Close;
          frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
          exit;
        end;
      end;

      if frmMain.IsFormOpen('frmShtrafiEdit') then
      begin
        with frmShtrafiEdit do
        begin
          qLaboratornijKontrol.SQL.Clear;
          qLaboratornijKontrol.SQL.Text:='delete from LABORATORNIJKONTROL where KOD=:Kod';
          qLaboratornijKontrol.Params.Clear;
          qLaboratornijKontrol.Params.Add;
          qLaboratornijKontrol.Params[0].Name:='Kod';
          qLaboratornijKontrol.Params[0].Value:=frmLaboratornijKontrol.edtKod.Text;
          qLaboratornijKontrol.Open;
          frmLaboratornijKontrol.Close;
          frmShtrafiEdit.aLaboratoryUpdateExecute(sender);
          exit;
        end;
      end;

      if frmMain.IsFormOpen('frmVidnovlennyRobit') then
      begin
        with frmVidnovlennyRobit do
        begin
          qLaboratornijKontrol.SQL.Clear;
          qLaboratornijKontrol.SQL.Text:='delete from LABORATORNIJKONTROL where KOD=:Kod';
          qLaboratornijKontrol.Params.Clear;
          qLaboratornijKontrol.Params.Add;
          qLaboratornijKontrol.Params[0].Name:='Kod';
          qLaboratornijKontrol.Params[0].Value:=frmLaboratornijKontrol.edtKod.Text;
          qLaboratornijKontrol.Open;
          frmLaboratornijKontrol.Close;
          frmVidnovlennyRobit.aLaboratornijKontrolUpdateExecute(sender);
          exit;
        end;
      end;

      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
      begin
        with frmAdminZapobizhZahodiEdit do
        begin
          qLaboratornijKontrol.SQL.Clear;
          qLaboratornijKontrol.SQL.Text:='delete from LABORATORNIJKONTROL where KOD=:Kod';
          qLaboratornijKontrol.Params.Clear;
          qLaboratornijKontrol.Params.Add;
          qLaboratornijKontrol.Params[0].Name:='Kod';
          qLaboratornijKontrol.Params[0].Value:=frmLaboratornijKontrol.edtKod.Text;
          qLaboratornijKontrol.Open;
          frmLaboratornijKontrol.Close;
          frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
          exit;
        end;
      end;
    end;
  end;

  if frmLaboratornijKontrol.Caption='Редагувати відомості про лабораторний контроль' then
  begin
    if frmLaboratornijKontrol.edtKod.Text='' then
    begin
      frmLaboratornijKontrol.aKodUpdateExecute(sender);
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmLaboratornijKontrol.edtKod.Text);
    except
      frmLaboratornijKontrol.aKodUpdateExecute(sender);
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    if frmLaboratornijKontrol.edtNomerPostanovi.Text='' then
    begin
      frmLaboratornijKontrol.edtNomeriProb.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
     end;
    try
      StrToInt64(frmLaboratornijKontrol.edtNomerPostanovi.Text);
    except
      frmLaboratornijKontrol.edtNomeriProb.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    frmLaboratornijKontrol.qID.SQL.Clear;
    frmLaboratornijKontrol.qID.SQL.Text:='select * from MINISTRY order by MINISTRY';
    frmLaboratornijKontrol.qID.Open;
    if not frmLaboratornijKontrol.qID.Locate('MINISTRY',frmLaboratornijKontrol.cbMinistry.Text,[]) then
    begin
      frmLaboratornijKontrol.cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end
    else
      Ministry:=frmLaboratornijKontrol.qID.FieldByName('KOD').Value;
    frmLaboratornijKontrol.qID.SQL.Clear;
    frmLaboratornijKontrol.qID.SQL.Text:='select * from TERITORY where TERITORY.TERITORY=:Teritory and TERITORY.MINISTRY=:Ministry';
    frmLaboratornijKontrol.qID.Params.Clear;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[0].Name:='Teritory';
    frmLaboratornijKontrol.qID.Params[0].Value:=frmLaboratornijKontrol.cbTeritory.Text;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[1].Name:='Ministry';
    frmLaboratornijKontrol.qID.Params[1].Value:=Ministry;
    frmLaboratornijKontrol.qID.Open;
    if not frmLaboratornijKontrol.qID.Locate('TERITORY',frmLaboratornijKontrol.cbTeritory.Text,[]) then
    begin
      frmLaboratornijKontrol.cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end
    else
      Teritory:=frmLaboratornijKontrol.qID.FieldByName('KOD').Value;
    frmLaboratornijKontrol.qID.SQL.Clear;
    frmLaboratornijKontrol.qID.SQL.Text:='select * from RAJONI where RAJON=:Rajon and TERITORY=:Teritory';
    frmLaboratornijKontrol.qID.Params.Clear;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[0].Name:='Rajon';
    frmLaboratornijKontrol.qID.Params[0].Value:=frmLaboratornijKontrol.cbDistrict.Text;;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[1].Name:='Teritory';
    frmLaboratornijKontrol.qID.Params[1].Value:=Teritory;
    frmLaboratornijKontrol.qID.Open;
    if not frmLaboratornijKontrol.qID.Locate('RAJON',cbDistrict.Text,[]) then
    begin
      frmLaboratornijKontrol.cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end
    else
      District:=frmLaboratornijKontrol.qID.FieldByName('KOD').Value;
    if frmLaboratornijKontrol.cbVidKontrolu.Text='' then
    begin
      frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
      frmLaboratornijKontrol.cbVidKontrolu.Text:='';
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    if frmLaboratornijKontrol.edtNomeriProb.Text='' then
    begin
      frmLaboratornijKontrol.edtNomeriProb.Text:='';
      frmLaboratornijKontrol.edtNomeriProb.SetFocus;
      exit;
    end;
    if Int(frmLaboratornijKontrol.dtpDataKontrolu.Date)>int(date) then
    begin
      frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
      frmLaboratornijKontrol.dtpDataKontrolu.SetFocus;
      exit;
    end;

    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      with frmFinansoviSankciiEdit do
      begin
        qLaboratory.SQL.Clear;
        qLaboratory.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratory.SQL.Text:=qLaboratory.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratory.Params.Clear;
        qLaboratory.Params.Add;
        qLaboratory.Params[0].Name:='Ministry';
        qLaboratory.Params[0].Value:=Ministry;
        qLaboratory.Params.Add;
        qLaboratory.Params[1].Name:='Teritory';
        qLaboratory.Params[1].Value:=Teritory;
        qLaboratory.Params.Add;
        qLaboratory.Params[2].Name:='District';
        qLaboratory.Params[2].Value:=District;
        qLaboratory.Params.Add;
        qLaboratory.Params[3].Name:='NomerPostanovi';
        qLaboratory.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratory.Params.Add;
        qLaboratory.Params[4].Name:='DataPostanovi';
        qLaboratory.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratory.Params.Add;
        qLaboratory.Params[5].Name:='VidKontrolu';
        qLaboratory.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratory.Params.Add;
        qLaboratory.Params[6].Name:='NomeriProb';
        qLaboratory.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratory.Params.Add;
        qLaboratory.Params[7].Name:='DataKontrolu';
        qLaboratory.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratory.Params.Add;
        qLaboratory.Params[8].Name:='Shtrafi';
        qLaboratory.Params[8].Value:='finansovi';
        qLaboratory.Params.Add;
        qLaboratory.Params[9].Name:='Kod';
        qLaboratory.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratory.Open;
        frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      with frmViluchennyZRealizaciiEdit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='viluchenny';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      with frmShtrafiEdit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='shtrafi';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmShtrafiEdit.aLaboratoryUpdateExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmVidnovlennyRobit') then
    begin
      with frmVidnovlennyRobit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='vidnovlenny';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmVidnovlennyRobit.aLaboratornijKontrolUpdateExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      with frmAdminZapobizhZahodiEdit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='admin';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;
  end;

  if frmLaboratornijKontrol.Caption='Додати відомості про лабораторний контроль' then
  begin
    if frmLaboratornijKontrol.edtKod.Text='' then
    begin
      frmLaboratornijKontrol.aKodUpdateExecute(sender);
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmLaboratornijKontrol.edtKod.Text);
    except
      frmLaboratornijKontrol.aKodUpdateExecute(sender);
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    if frmLaboratornijKontrol.edtNomerPostanovi.Text='' then
    begin
      frmLaboratornijKontrol.edtNomeriProb.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
     end;
    try
      StrToInt64(frmLaboratornijKontrol.edtNomerPostanovi.Text);
    except
      frmLaboratornijKontrol.edtNomeriProb.Text:=frmAdminZapobizhZahodiEdit.edtNomerPostanovi.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    frmLaboratornijKontrol.qID.SQL.Clear;
    frmLaboratornijKontrol.qID.SQL.Text:='select * from MINISTRY order by MINISTRY';
    frmLaboratornijKontrol.qID.Open;
    if not frmLaboratornijKontrol.qID.Locate('MINISTRY',frmLaboratornijKontrol.cbMinistry.Text,[]) then
    begin
      frmLaboratornijKontrol.cbMinistry.Text:=frmAdminZapobizhZahodiEdit.cbMinistry.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end
    else
      Ministry:=frmLaboratornijKontrol.qID.FieldByName('KOD').Value;
    frmLaboratornijKontrol.qID.SQL.Clear;
    frmLaboratornijKontrol.qID.SQL.Text:='select * from TERITORY where TERITORY.TERITORY=:Teritory and TERITORY.MINISTRY=:Ministry';
    frmLaboratornijKontrol.qID.Params.Clear;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[0].Name:='Teritory';
    frmLaboratornijKontrol.qID.Params[0].Value:=frmLaboratornijKontrol.cbTeritory.Text;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[1].Name:='Ministry';
    frmLaboratornijKontrol.qID.Params[1].Value:=Ministry;
    frmLaboratornijKontrol.qID.Open;
    if not frmLaboratornijKontrol.qID.Locate('TERITORY',frmLaboratornijKontrol.cbTeritory.Text,[]) then
    begin
      frmLaboratornijKontrol.cbTeritory.Text:=frmAdminZapobizhZahodiEdit.cbTeritory.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end
    else
      Teritory:=frmLaboratornijKontrol.qID.FieldByName('KOD').Value;
    frmLaboratornijKontrol.qID.SQL.Clear;
    frmLaboratornijKontrol.qID.SQL.Text:='select * from RAJONI where RAJON=:Rajon and TERITORY=:Teritory';
    frmLaboratornijKontrol.qID.Params.Clear;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[0].Name:='Rajon';
    frmLaboratornijKontrol.qID.Params[0].Value:=frmLaboratornijKontrol.cbDistrict.Text;;
    frmLaboratornijKontrol.qID.Params.Add;
    frmLaboratornijKontrol.qID.Params[1].Name:='Teritory';
    frmLaboratornijKontrol.qID.Params[1].Value:=Teritory;
    frmLaboratornijKontrol.qID.Open;
    if not frmLaboratornijKontrol.qID.Locate('RAJON',cbDistrict.Text,[]) then
    begin
      frmLaboratornijKontrol.cbDistrict.Text:=frmAdminZapobizhZahodiEdit.cbDistrict.Text;
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end
    else
      District:=frmLaboratornijKontrol.qID.FieldByName('KOD').Value;
    if frmLaboratornijKontrol.cbVidKontrolu.Text='' then
    begin
      frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
      frmLaboratornijKontrol.cbVidKontrolu.Text:='';
      frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
      exit;
    end;
    if frmLaboratornijKontrol.edtNomeriProb.Text='' then
    begin
      frmLaboratornijKontrol.edtNomeriProb.Text:='';
      frmLaboratornijKontrol.edtNomeriProb.SetFocus;
      exit;
    end;
    if Int(frmLaboratornijKontrol.dtpDataKontrolu.Date)>int(date) then
    begin
      frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
      frmLaboratornijKontrol.dtpDataKontrolu.SetFocus;
      exit;
    end;

    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      with frmFinansoviSankciiEdit do
      begin
        qLaboratory.SQL.Clear;
        qLaboratory.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratory.SQL.Text:=qLaboratory.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratory.Params.Clear;
        qLaboratory.Params.Add;
        qLaboratory.Params[0].Name:='Ministry';
        qLaboratory.Params[0].Value:=Ministry;
        qLaboratory.Params.Add;
        qLaboratory.Params[1].Name:='Teritory';
        qLaboratory.Params[1].Value:=Teritory;
        qLaboratory.Params.Add;
        qLaboratory.Params[2].Name:='District';
        qLaboratory.Params[2].Value:=District;
        qLaboratory.Params.Add;
        qLaboratory.Params[3].Name:='NomerPostanovi';
        qLaboratory.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratory.Params.Add;
        qLaboratory.Params[4].Name:='DataPostanovi';
        qLaboratory.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratory.Params.Add;
        qLaboratory.Params[5].Name:='VidKontrolu';
        qLaboratory.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratory.Params.Add;
        qLaboratory.Params[6].Name:='NomeriProb';
        qLaboratory.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratory.Params.Add;
        qLaboratory.Params[7].Name:='DataKontrolu';
        qLaboratory.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratory.Params.Add;
        qLaboratory.Params[8].Name:='Shtrafi';
        qLaboratory.Params[8].Value:='finansovi';
        qLaboratory.Params.Add;
        qLaboratory.Params[9].Name:='Kod';
        qLaboratory.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratory.Open;
        frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      with frmViluchennyZRealizaciiEdit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='viluchenny';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      with frmShtrafiEdit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='shtrafi';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmShtrafiEdit.aLaboratoryUpdateExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmVidnovlennyRobit') then
    begin
      with frmVidnovlennyRobit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='vidnovlenny';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmVidnovlennyRobit.aLaboratornijKontrolUpdateExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      with frmAdminZapobizhZahodiEdit do
      begin
        qLaboratornijKontrol.SQL.Clear;
        qLaboratornijKontrol.SQL.Text:='update LABORATORNIJKONTROL set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:District,NOMERPOSTANOVI=:NomerPostanovi,DATAPOSTANOVI=:DataPostanovi,';
        qLaboratornijKontrol.SQL.Text:=qLaboratornijKontrol.SQL.Text+'VIDKONTROLU=:VidKontrolu,NOMERIPROB=:NomeriProb,DATAKONTROLU=:DataKontrolu,SHTRAFI_ADMIN=:Shtrafi where KOD=:Kod';
        qLaboratornijKontrol.Params.Clear;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[0].Name:='Ministry';
        qLaboratornijKontrol.Params[0].Value:=Ministry;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[1].Name:='Teritory';
        qLaboratornijKontrol.Params[1].Value:=Teritory;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[2].Name:='District';
        qLaboratornijKontrol.Params[2].Value:=District;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
        qLaboratornijKontrol.Params[3].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
        qLaboratornijKontrol.Params[4].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[5].Name:='VidKontrolu';
        qLaboratornijKontrol.Params[5].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[6].Name:='NomeriProb';
        qLaboratornijKontrol.Params[6].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[7].Name:='DataKontrolu';
        qLaboratornijKontrol.Params[7].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[8].Name:='Shtrafi';
        qLaboratornijKontrol.Params[8].Value:='admin';
        qLaboratornijKontrol.Params.Add;
        qLaboratornijKontrol.Params[9].Name:='Kod';
        qLaboratornijKontrol.Params[9].Value:=frmLaboratornijKontrol.edtKod.Text;
        qLaboratornijKontrol.Open;
        frmAdminZapobizhZahodiEdit.aUpdateLabKontrolExecute(sender);
        frmLaboratornijKontrol.Close;
        exit;
      end;
    end;
  end;





















{
  if frmLaboratornijKontrol.Caption='Редагування лабораторного контролю' then
  begin
//    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//    begin
//      if frmLaboratornijKontrol.edtKod.Text='' then
//      begin
//        frmLaboratornijKontrol.aKodUpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      try
//        StrToInt(frmLaboratornijKontrol.edtKod.Text);
//      except
//        frmLaboratornijKontrol.aKodUpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//       exit;
//      end;
//      if frmLaboratornijKontrol.edtNomerPostanovi.Text='' then
//      begin
//        frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      if frmLaboratornijKontrol.cbVidKontrolu.Text='' then
//      begin
//        frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      if frmLaboratornijKontrol.edtNomeriProb.Text='' then
//      begin
//        frmLaboratornijKontrol.edtNomeriProb.SetFocus;
//        exit;
//      end;
//      with frmLaboratornijKontrol do
//      begin
//        qID.SQL.Clear;
//        qID.SQL.Text:='update LABORATORNIJKONTROL set VIDKONTROLU=:VIDKONTROLU,NOMERIPROB=:NOMERIPROB,DATAKONTROLU=:DATAKONTROLU where KOD='+frmLaboratornijKontrol.edtKod.Text;
//        qID.Params.Clear;
//        qID.Params.Add;
//        qID.Params[0].Name:='VIDKONTROLU';
//        qID.Params[0].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;
//        qID.Params.Add;
//        qID.Params[1].Name:='NOMERIPROB';
//        qID.Params[1].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
//        qID.Params.Add;
//        qID.Params[2].Name:='DATAKONTROLU';
//        qID.Params[2].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
//        qID.Open;
//      end;
//      frmMain.trAzz.CommitRetaining;
//      frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
//      frmLaboratornijKontrol.Close;
//      exit;
//    end;
  end;

  if frmLaboratornijKontrol.Caption='Додавання лабораторного контролю' then
  begin
//    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//    begin
//      if frmLaboratornijKontrol.edtKod.Text='' then
//      begin
//        frmLaboratornijKontrol.aKodUpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      try
//        StrToInt(frmLaboratornijKontrol.edtKod.Text);
//      except
//        frmLaboratornijKontrol.aKodUpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      frmLaboratornijKontrol.qID.SQL.Clear;
//      frmLaboratornijKontrol.qID.SQL.Text:='select * from LABORATORNIJKONTROL order by KOD';
//      frmLaboratornijKontrol.qID.Open;
//      if frmLaboratornijKontrol.qID.Locate('KOD',StrToInt(frmLaboratornijKontrol.edtKod.Text),[]) then
//      begin
//        frmLaboratornijKontrol.aKodUpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      if frmLaboratornijKontrol.edtNomerPostanovi.Text='' then
//      begin
//        frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      if frmLaboratornijKontrol.cbVidKontrolu.Text='' then
//      begin
//        frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
//        frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
//        exit;
//      end;
//      if frmLaboratornijKontrol.edtNomeriProb.Text='' then
//      begin
//        frmLaboratornijKontrol.edtNomeriProb.SetFocus;
//        exit;
//      end;
//      with frmLaboratornijKontrol do
//      begin
//        qID.SQL.Clear;
//        qID.SQL.Text:='insert into LABORATORNIJKONTROL (KOD,NOMERPOSTANOVI,DATAPOSTANOVI,VIDKONTROLU,NOMERIPROB,DATAKONTROLU,SHTRAFI_ADMIN) values (:KOD,:NOMERPOSTANOVI,:DATAPOSTANOVI,:VIDKONTROLU,:NOMERIPROB,:DATAKONTROLU,:SHTRAFI_ADMIN)';
//        qID.Params.Clear;
//        qID.Params.Add;
//        qID.Params[0].Name:='KOD';
//        qID.Params[0].Value:=frmLaboratornijKontrol.edtKod.Text;
//        qID.Params.Add;
//        qID.Params[1].Name:='NOMERPOSTANOVI';
//        qID.Params[1].Value:=frmLaboratornijKontrol.edtNomerPostanovi.Text;
//        qID.Params.Add;
//        qID.Params[2].Name:='DATAPOSTANOVI';
//        qID.Params[2].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataPostanovi.Date));
//        qID.Params.Add;
//        qID.Params[3].Name:='VIDKONTROLU';
//        qID.Params[3].Value:=frmLaboratornijKontrol.cbVidKontrolu.Text;
//        qID.Params.Add;
//        qID.Params[4].Name:='NOMERIPROB';
//        qID.Params[4].Value:=frmLaboratornijKontrol.edtNomeriProb.Text;
//        qID.Params.Add;
//        qID.Params[5].Name:='DATAKONTROLU';
//        qID.Params[5].Value:=DateToStr(int(frmLaboratornijKontrol.dtpDataKontrolu.Date));
//        qID.Params.Add;
//        qID.Params[6].Name:='SHTRAFI_ADMIN';
//        qID.Params[6].Value:='finansovi';
//        qID.Open;
//      end;
//      frmMain.trAzz.CommitRetaining;
//      frmFinansoviSankciiEdit.aUpdateLaboratoryExecute(sender);
//      frmLaboratornijKontrol.Close;
//      exit;
//    end;
  end;
}
end;

procedure TfrmLaboratornijKontrol.aCancelExecute(Sender: TObject);
begin
  frmLaboratornijKontrol.Close;
end;

procedure TfrmLaboratornijKontrol.aVidKontrolu_UpdateExecute(
  Sender: TObject);
begin
  with frmLaboratornijKontrol do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='select * from LABORATORNIDOSLIDZHENNY order by TIPDOSLIDZHENNY';
    qID.Open;
    cbVidKontrolu.Text:='';
    cbVidKontrolu.Items.Clear;
    qID.First;
    while not qID.Eof do
    begin
      cbVidKontrolu.Items.Add(qID.FieldByName('TIPDOSLIDZHENNY').Value);
      qID.Next;
    end;
  end;
end;

procedure TfrmLaboratornijKontrol.aKodUpdateExecute(Sender: TObject);
begin
  with frmLaboratornijKontrol do
  begin
    qID.SQL.Clear;
    qID.SQL.Text:='insert into LABORATORNIJKONTROL (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qID.Open;
    qID.SQL.Clear;
    qID.SQL.Text:='select * from LABORATORNIJKONTROL order by KOD';
    qID.Open;
    qID.Last;
    edtKod.Text:=IntToStr(qID.FieldByName('KOD').Value);
  end;
end;

end.
