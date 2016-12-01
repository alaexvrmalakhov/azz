unit PosadiEdit;

interface

uses
  Forms, Classes, ActnList, Controls, StdCtrls, SysUtils, Dialogs;

type
  TfrmPosadiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodPosadi: TEdit;
    edtNazvaposadi: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    edtNazvaposadi_RV: TEdit;
    edtNazvaposadi_TV: TEdit;
    btnVidminok: TButton;
    Label3: TLabel;
    Label4: TLabel;
    btnKodPosadi: TButton;
    alPosadiEdit: TActionList;
    aKodUpdate: TAction;
    aVidminokChange: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aVidminokChangeExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmPosadiEdit: TfrmPosadiEdit;

implementation

uses
  Main, Posadi, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, Raport,
  Opechanuvanny, NapravlenoDoVidoma, NapravlennyEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, SpivrobitnikiEdit, Ministry,
  Teritory, Rajoni, Filter;

{$R *.dfm}

procedure TfrmPosadiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmPosadi.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmPosadi.Enabled:=true;
    frmFilter.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmPosadi.Enabled:=true;
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmRaport') then
  begin
    frmPosadi.Enabled:=true;
    frmRaport.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmRaport.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmPosadi.Enabled:=true;
    frmOpechanuvanny.Enabled:=true;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmOpechanuvanny.Enabled:=false;
    end
    else
      frmPosadi.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
  begin
    frmNapravlenoDoVidoma.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmNapravlenoDoVidoma.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlennyEdit') then
  begin
    frmNapravlennyEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmNapravlennyEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmSpivrobitnikiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmPosadiEdit.Caption<>'Вибір посади' then
    begin
      frmPosadi.Enabled:=true;
      frmSpivrobitnikiEdit.Enabled:=false;
    end
    else
      frmPosadi.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=True;
  Action:=caFree;
end;

procedure TfrmPosadiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='insert into POSADI (KODPOSADI) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTeritory.Open;
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from POSADI order by KODPOSADI';
    qTeritory.Open;
    qTeritory.Last;
    frmPosadiEdit.edtKodPosadi.Text:=IntToStr(qTeritory.FieldByName('KODPOSADI').Value);
  end;
end;

procedure TfrmPosadiEdit.aVidminokChangeExecute(Sender: TObject);
begin
  frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadiEdit.edtNazvaposadi.Text;
  frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadiEdit.edtNazvaposadi.Text;
end;

procedure TfrmPosadiEdit.aOKExecute(Sender: TObject);
begin
  if frmPosadiEdit.Caption='Вибір посади' then
  begin
{
    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbPosadaSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFilter') then
    begin
      frmFilter.cbFilter.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmRaport') then
    begin
      frmRaport.cbPosadaPredstavnika.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmOpechanuvanny') then
    begin
      frmOpechanuvanny.cbPosadaPredstavnikaSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
    begin
      frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmNapravlennyEdit') then
    begin
      frmNapravlennyEdit.cbPosadaOtrimuvacha.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbPosadaOsobiSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.cbPosadaOsobiSES.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbPosada.Text:=frmPosadiEdit.edtNazvaposadi.Text;
      frmPosadiEdit.Close;
      frmPosadi.Close;
      exit;
    end;
}
  end;

  if frmPosadiEdit.Caption='Видалення посади' then
  begin
    if MessageDlg('Видалення запису може відобразитись на інших даних!!!'+#13+'Ви дійсно бажаєте видалити запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmPosadi.qTeritory.SQL.Clear;
      frmPosadi.qTeritory.SQL.Text:='delete from POSADI where KODPOSADI=:Kod';
      frmPosadi.qTeritory.Params.Clear;
      frmPosadi.qTeritory.Params.Add;
      frmPosadi.qTeritory.Params[0].Name:='Kod';
      frmPosadi.qTeritory.Params[0].Value:=frmPosadiEdit.edtKodPosadi.Text;
      frmPosadi.qTeritory.Open;
      frmMain.trAzz.CommitRetaining;
      frmPosadiEdit.Close;
      frmPosadi.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmPosadiEdit.Caption='Редагування посади' then
  begin
    if frmPosadiEdit.edtKodPosadi.Text='' then
    begin
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmPosadiEdit.edtKodPosadi.Text);
    except
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;

    if frmPosadiEdit.edtNazvaposadi.Text='' then
    begin
      frmPosadiEdit.edtNazvaposadi.SetFocus;
      exit;
    end;
    if (frmPosadiEdit.edtNazvaposadi_RV.Text='')or(frmPosadiEdit.edtNazvaposadi_TV.Text='') then
    begin
      frmPosadiEdit.aVidminokChangeExecute(sender);
      frmPosadiEdit.edtNazvaposadi_RV.SetFocus;
      exit;
    end;

    frmPosadi.qPosadi.SQL.Clear;
    frmPosadi.qPosadi.SQL.Text:='update POSADI set NAZVAPOSADI=:Nazva,NAZVAPOSADI_RV=:Nazva_RV,NAZVAPOSADI_TV=:Nazva_TV where KODPOSADI=:Kod';
    frmPosadi.qPosadi.Params.Clear;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[0].Name:='Nazva';
    frmPosadi.qPosadi.Params[0].Value:=frmPosadiEdit.edtNazvaposadi.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[1].Name:='Nazva_RV';
    frmPosadi.qPosadi.Params[1].Value:=frmPosadiEdit.edtNazvaposadi_RV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[2].Name:='Nazva_TV';
    frmPosadi.qPosadi.Params[2].Value:=frmPosadiEdit.edtNazvaposadi_TV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[3].Name:='Kod';
    frmPosadi.qPosadi.Params[3].Value:=frmPosadiEdit.edtKodPosadi.Text;

    frmPosadi.qPosadi.Open;
    frmMain.trAzz.CommitRetaining;

    frmPosadiEdit.Close;
    frmPosadi.aUpdateExecute(sender);
    exit;
  end;

  if frmPosadiEdit.Caption='Додавання нової посади' then
  begin
    if frmPosadiEdit.edtKodPosadi.Text='' then
    begin
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmPosadiEdit.edtKodPosadi.Text);
    except
      frmPosadiEdit.aKodUpdateExecute(sender);
      frmPosadiEdit.edtKodPosadi.SetFocus;
      exit;
    end;

    if frmPosadiEdit.edtNazvaposadi.Text='' then
    begin
      frmPosadiEdit.edtNazvaposadi.SetFocus;
      exit;
    end;
    if (frmPosadiEdit.edtNazvaposadi_RV.Text='')or(frmPosadiEdit.edtNazvaposadi_TV.Text='') then
    begin
      frmPosadiEdit.aVidminokChangeExecute(sender);
      frmPosadiEdit.edtNazvaposadi_RV.SetFocus;
      exit;
    end;

    frmPosadi.qPosadi.SQL.Clear;
    frmPosadi.qPosadi.SQL.Text:='update POSADI set NAZVAPOSADI=:Nazva,NAZVAPOSADI_RV=:Nazva_RV,NAZVAPOSADI_TV=:Nazva_TV where KODPOSADI=:Kod';
    frmPosadi.qPosadi.Params.Clear;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[0].Name:='Nazva';
    frmPosadi.qPosadi.Params[0].Value:=frmPosadiEdit.edtNazvaposadi.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[1].Name:='Nazva_RV';
    frmPosadi.qPosadi.Params[1].Value:=frmPosadiEdit.edtNazvaposadi_RV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[2].Name:='Nazva_TV';
    frmPosadi.qPosadi.Params[2].Value:=frmPosadiEdit.edtNazvaposadi_TV.Text;
    frmPosadi.qPosadi.Params.Add;
    frmPosadi.qPosadi.Params[3].Name:='Kod';
    frmPosadi.qPosadi.Params[3].Value:=frmPosadiEdit.edtKodPosadi.Text;
    frmPosadi.qPosadi.Open;
    frmMain.trAzz.CommitRetaining;

    frmPosadiEdit.Close;
    frmPosadi.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmPosadiEdit.aCancelExecute(Sender: TObject);
begin
  frmPosadiEdit.Close;
end;

end.
