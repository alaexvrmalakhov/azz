unit Posadi;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils;

type
  TfrmPosadi = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    Panel2: TPanel;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    btnMin_Ter_Raj: TButton;
    alPosadi: TActionList;
    aTeritoryUpdate: TAction;
    qTeritory: TIBQuery;
    aUpdate: TAction;
    btnUpdate: TButton;
    dsPosadi: TDataSource;
    qPosadi: TIBQuery;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    mnSortByKod: TMenuItem;
    mnSortByNazva: TMenuItem;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure cbRajonChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmPosadi: TfrmPosadi;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, Raport,
  AdminZapobizhZahodiEdit, ShtrafiEdit, Opechanuvanny, NapravlenoDoVidoma,
  NapravlennyEdit, SpivrobitnikiEdit, PosadiEdit, Filter;

{$R *.dfm}

procedure TfrmPosadi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPosadi.qTeritory.Close;
  frmPosadi.qPosadi.Close;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
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

  if frmMain.IsFormOpen('frmRaport') then
  begin
    frmRaport.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmOpechanuvanny') then
  begin
    frmOpechanuvanny.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
  begin
    frmNapravlenoDoVidoma.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmNapravlennyEdit') then
  begin
    frmNapravlennyEdit.Enabled:=true;
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

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmSpivrobitnikiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit; 
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmPosadi.FormResize(Sender: TObject);
begin
  frmPosadi.btnMin_Ter_Raj.Left:=frmPosadi.Width-32;
  frmPosadi.cbMinistry.Left:=4;
  frmPosadi.cbMinistry.Width:=trunc(frmPosadi.Width/3)-20;
  frmPosadi.cbTeritory.Left:=frmPosadi.cbMinistry.Left+frmPosadi.cbMinistry.Width+4;
  frmPosadi.cbTeritory.Width:=trunc(frmPosadi.Width/3);
  frmPosadi.cbRajon.Left:=frmPosadi.cbTeritory.Left+frmPosadi.cbTeritory.Width+4;
  frmPosadi.cbRajon.Width:=trunc(frmPosadi.Width/3)-24;
end;

procedure TfrmPosadi.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    cbMinistry.Text:='';
    cbMinistry.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbMinistry.Items.Add(qTeritory.FieldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
    INIAZZ.Free;
    if qTeritory.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qTeritory.FieldByName('MINISTRY').Value else cbMinistry.Text:='';

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
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    INIAZZ.Free;
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    while not qTeritory.Eof do
    begin
      cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbRajon.Text:=INIAZZ.ReadString('Teritory','District',cbRajon.Text);
    INIAZZ.Free;
    if qTeritory.Locate('KOD',StrToInt(cbRajon.Text),[]) then cbRajon.Text:=qTeritory.FieldByName('RAJON').Value else cbRajon.Text:='';
    aUpdateExecute(sender);
  end;
end;

procedure TfrmPosadi.aUpdateExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qPosadi.SQL.Clear;
    qPosadi.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON=:Rajon and POSADI.RAJON=RAJONI.KOD order by NAZVAPOSADI';
    qPosadi.Params.Clear;
    qPosadi.Params.Add;
    qPosadi.Params[0].Name:='Rajon';
    qPosadi.Params[0].Value:=cbRajon.Text;
    qPosadi.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmPosadi.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Додавання нової посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  frmPosadiEdit.aMinistrUpdateExecute(sender);
  frmPosadiEdit.cbMinistry.Enabled:=true;
  frmPosadiEdit.btnMinistryUpdate.Enabled:=true;
  frmPosadiEdit.btnMinistryChoice.Enabled:=true;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmPosadiEdit.cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',frmPosadiEdit.cbMinistry.Text);
  INIAZZ.Free;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbMinistry.Text),[]) then frmPosadiEdit.cbMinistry.Text:=frmPosadi.qTeritory.FieldByName('MINISTRY').Value else frmPosadiEdit.cbMinistry.Text:='';

  frmPosadiEdit.aTeritoryUpdateExecute(sender);
  frmPosadiEdit.cbTeritory.Enabled:=true;
  frmPosadiEdit.btnTeritoryUpdate.Enabled:=true;
  frmPosadiEdit.btnTeritoryChoice.Enabled:=true;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmPosadiEdit.cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',frmPosadiEdit.cbTeritory.Text);
  INIAZZ.Free;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbTeritory.Text),[]) then frmPosadiEdit.cbTeritory.Text:=frmPosadi.qTeritory.FieldByName('TERITORY').Value else frmPosadiEdit.cbTeritory.Text:='';

  frmPosadiEdit.aDistrictUpdateExecute(sender);
  frmPosadiEdit.cbRajon.Enabled:=true;
  frmPosadiEdit.btnRajonUpdate.Enabled:=true;
  frmPosadiEdit.btnRajonChoice.Enabled:=true;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmPosadiEdit.cbRajon.Text:=INIAZZ.ReadString('Teritory','District',frmPosadiEdit.cbRajon.Text);
  INIAZZ.Free;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbRajon.Text),[]) then frmPosadiEdit.cbRajon.Text:=frmPosadi.qTeritory.FieldByName('RAJON').Value else frmPosadiEdit.cbRajon.Text:='';

  frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=true;
  frmPosadiEdit.btnVidminok.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi.SetFocus;
end;

procedure TfrmPosadi.aEditExecute(Sender: TObject);
begin
  if frmPosadi.qPosadi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Редагування посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  if not frmPosadi.qPosadi.FieldByName('KODPOSADI').IsNull then frmPosadiEdit.edtKodPosadi.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('KODPOSADI').Value) else frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  frmPosadiEdit.aMinistrUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('MINISTRY').IsNull then frmPosadiEdit.cbMinistry.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('MINISTRY').Value) else frmPosadiEdit.cbMinistry.Text:='0';
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbMinistry.Text),[]) then frmPosadiEdit.cbMinistry.Text:=frmPosadi.qTeritory.FieldByName('MINISTRY').Value else frmPosadiEdit.cbMinistry.Text:='';
  frmPosadiEdit.cbMinistry.Enabled:=true;
  frmPosadiEdit.btnMinistryUpdate.Enabled:=true;
  frmPosadiEdit.btnMinistryChoice.Enabled:=true;

  frmPosadiEdit.aTeritoryUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('TERITORY').IsNull then frmPosadiEdit.cbTeritory.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('TERITORY').Value) else frmPosadiEdit.cbTeritory.Text:='0';
  frmPosadiEdit.cbTeritory.Enabled:=true;
  frmPosadiEdit.btnTeritoryUpdate.Enabled:=true;
  frmPosadiEdit.btnTeritoryChoice.Enabled:=true;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbTeritory.Text),[]) then frmPosadiEdit.cbTeritory.Text:=frmPosadi.qTeritory.FieldByName('TERITORY').Value else frmPosadiEdit.cbTeritory.Text:='';

  frmPosadiEdit.aDistrictUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('RAJON').IsNull then frmPosadiEdit.cbRajon.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('RAJON').Value) else frmPosadiEdit.cbRajon.Text:='0';
  frmPosadiEdit.cbRajon.Enabled:=true;
  frmPosadiEdit.btnRajonUpdate.Enabled:=true;
  frmPosadiEdit.btnRajonChoice.Enabled:=true;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbRajon.Text),[]) then frmPosadiEdit.cbRajon.Text:=frmPosadi.qTeritory.FieldByName('RAJON').Value else frmPosadiEdit.cbRajon.Text:='';

  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').IsNull then frmPosadiEdit.edtNazvaposadi.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').Value else frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=true;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').IsNull then frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').Value else frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=true;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').IsNull then frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').Value else frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=true;
  frmPosadiEdit.btnVidminok.Enabled:=true;
  frmPosadiEdit.edtNazvaposadi.SetFocus;
end;

procedure TfrmPosadi.aDeleteExecute(Sender: TObject);
begin
  if frmPosadi.qPosadi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Видалення посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  if not frmPosadi.qPosadi.FieldByName('KODPOSADI').IsNull then frmPosadiEdit.edtKodPosadi.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('KODPOSADI').Value) else frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  frmPosadiEdit.aMinistrUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('MINISTRY').IsNull then frmPosadiEdit.cbMinistry.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('MINISTRY').Value) else frmPosadiEdit.cbMinistry.Text:='0';
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbMinistry.Text),[]) then frmPosadiEdit.cbMinistry.Text:=frmPosadi.qTeritory.FieldByName('MINISTRY').Value else frmPosadiEdit.cbMinistry.Text:='';
  frmPosadiEdit.cbMinistry.Enabled:=false;
  frmPosadiEdit.btnMinistryUpdate.Enabled:=false;
  frmPosadiEdit.btnMinistryChoice.Enabled:=false;

  frmPosadiEdit.aTeritoryUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('TERITORY').IsNull then frmPosadiEdit.cbTeritory.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('TERITORY').Value) else frmPosadiEdit.cbTeritory.Text:='0';
  frmPosadiEdit.cbTeritory.Enabled:=false;
  frmPosadiEdit.btnTeritoryUpdate.Enabled:=false;
  frmPosadiEdit.btnTeritoryChoice.Enabled:=false;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbTeritory.Text),[]) then frmPosadiEdit.cbTeritory.Text:=frmPosadi.qTeritory.FieldByName('TERITORY').Value else frmPosadiEdit.cbTeritory.Text:='';

  frmPosadiEdit.aDistrictUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('RAJON').IsNull then frmPosadiEdit.cbRajon.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('RAJON').Value) else frmPosadiEdit.cbRajon.Text:='0';
  frmPosadiEdit.cbRajon.Enabled:=false;
  frmPosadiEdit.btnRajonUpdate.Enabled:=false;
  frmPosadiEdit.btnRajonChoice.Enabled:=false;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbRajon.Text),[]) then frmPosadiEdit.cbRajon.Text:=frmPosadi.qTeritory.FieldByName('RAJON').Value else frmPosadiEdit.cbRajon.Text:='';

  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').IsNull then frmPosadiEdit.edtNazvaposadi.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').Value else frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=false;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').IsNull then frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').Value else frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=false;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').IsNull then frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').Value else frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=false;
  frmPosadiEdit.btnVidminok.Enabled:=false;
  frmPosadiEdit.btnVidminiti.SetFocus;
end;

procedure TfrmPosadi.aChoiceExecute(Sender: TObject);
begin
  if frmPosadi.qPosadi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmPosadiEdit') then frmPosadiEdit:=TfrmPosadiEdit.Create(self);
  frmMain.Enabled:=false;
  frmPosadiEdit.Show;
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmFilter') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmRaport') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmOpechanuvanny') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmNapravlennyEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmPosadi.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmPosadi.Enabled:=false;
  frmPosadiEdit.Caption:='Вибір посади';
  frmPosadiEdit.BorderStyle:=bsDialog;
  frmPosadiEdit.Position:=poMainFormCenter;

  if not frmPosadi.qPosadi.FieldByName('KODPOSADI').IsNull then frmPosadiEdit.edtKodPosadi.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('KODPOSADI').Value) else frmPosadiEdit.aKodUpdateExecute(sender);
  frmPosadiEdit.edtKodPosadi.Enabled:=false;
  frmPosadiEdit.btnKodPosadi.Enabled:=false;

  frmPosadiEdit.aMinistrUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('MINISTRY').IsNull then frmPosadiEdit.cbMinistry.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('MINISTRY').Value) else frmPosadiEdit.cbMinistry.Text:='0';
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbMinistry.Text),[]) then frmPosadiEdit.cbMinistry.Text:=frmPosadi.qTeritory.FieldByName('MINISTRY').Value else frmPosadiEdit.cbMinistry.Text:='';
  frmPosadiEdit.cbMinistry.Enabled:=false;
  frmPosadiEdit.btnMinistryUpdate.Enabled:=false;
  frmPosadiEdit.btnMinistryChoice.Enabled:=false;

  frmPosadiEdit.aTeritoryUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('TERITORY').IsNull then frmPosadiEdit.cbTeritory.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('TERITORY').Value) else frmPosadiEdit.cbTeritory.Text:='0';
  frmPosadiEdit.cbTeritory.Enabled:=false;
  frmPosadiEdit.btnTeritoryUpdate.Enabled:=false;
  frmPosadiEdit.btnTeritoryChoice.Enabled:=false;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbTeritory.Text),[]) then frmPosadiEdit.cbTeritory.Text:=frmPosadi.qTeritory.FieldByName('TERITORY').Value else frmPosadiEdit.cbTeritory.Text:='';

  frmPosadiEdit.aDistrictUpdateExecute(sender);
  if not frmPosadi.qPosadi.FieldByName('RAJON').IsNull then frmPosadiEdit.cbRajon.Text:=IntToStr(frmPosadi.qPosadi.FieldByName('RAJON').Value) else frmPosadiEdit.cbRajon.Text:='0';
  frmPosadiEdit.cbRajon.Enabled:=false;
  frmPosadiEdit.btnRajonUpdate.Enabled:=false;
  frmPosadiEdit.btnRajonChoice.Enabled:=false;
  if frmPosadi.qTeritory.Locate('KOD',StrToInt(frmPosadiEdit.cbRajon.Text),[]) then frmPosadiEdit.cbRajon.Text:=frmPosadi.qTeritory.FieldByName('RAJON').Value else frmPosadiEdit.cbRajon.Text:='';

  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').IsNull then frmPosadiEdit.edtNazvaposadi.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI').Value else frmPosadiEdit.edtNazvaposadi.Text:='';
  frmPosadiEdit.edtNazvaposadi.Enabled:=false;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').IsNull then frmPosadiEdit.edtNazvaposadi_RV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_RV').Value else frmPosadiEdit.edtNazvaposadi_RV.Text:='';
  frmPosadiEdit.edtNazvaposadi_RV.Enabled:=false;
  if not frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').IsNull then frmPosadiEdit.edtNazvaposadi_TV.Text:=frmPosadi.qPosadi.FieldByName('NAZVAPOSADI_TV').Value else frmPosadiEdit.edtNazvaposadi_TV.Text:='';
  frmPosadiEdit.edtNazvaposadi_TV.Enabled:=false;
  frmPosadiEdit.btnVidminok.Enabled:=false;
  frmPosadiEdit.btnVikonati.SetFocus;
end;

procedure TfrmPosadi.aCloseExecute(Sender: TObject);
begin
  frmPosadi.Close;
end;

procedure TfrmPosadi.aSortByKodExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qPosadi.SQL.Clear;
    qPosadi.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON=:Rajon and POSADI.RAJON=RAJONI.KOD order by KODPOSADI';
    qPosadi.Params.Clear;
    qPosadi.Params.Add;
    qPosadi.Params[0].Name:='Rajon';
    qPosadi.Params[0].Value:=cbRajon.Text;
    qPosadi.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmPosadi.aSortByNazvaExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qPosadi.SQL.Clear;
    qPosadi.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON=:Rajon and POSADI.RAJON=RAJONI.KOD order by NAZVAPOSADI';
    qPosadi.Params.Clear;
    qPosadi.Params.Add;
    qPosadi.Params[0].Name:='Rajon';
    qPosadi.Params[0].Value:=cbRajon.Text;
    qPosadi.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmPosadi.aMinistryChangeExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
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
    cbRajon.Text:='';
    cbRajon.Items.Clear;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmPosadi.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmPosadi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
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
    aUpdateExecute(sender);
  end;
end;

procedure TfrmPosadi.cbRajonChange(Sender: TObject);
begin
  frmPosadi.aUpdateExecute(sender);
end;

procedure TfrmPosadi.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmPosadi.dsPosadi;
end;

end.
