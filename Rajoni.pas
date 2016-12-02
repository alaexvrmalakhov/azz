unit Rajoni;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils;

type
  TfrmRajoni = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    Panel2: TPanel;
    cbTeritory: TComboBox;
    btnMin_Ter: TButton;
    alDistrict: TActionList;
    aTeritoryUpdate: TAction;
    qTeritory: TIBQuery;
    aTeritoryChange: TAction;
    btnUpdate: TButton;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    dsDistrict: TDataSource;
    qDistrict: TIBQuery;
    PopupMenu: TPopupMenu;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    N3: TMenuItem;
    mnClose: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    mnSortByKod: TMenuItem;
    mnSortByNazva: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure cbTeritoryChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmRajoni: TfrmRajoni;

implementation

uses
  Main, PosadiEdit, SpivrobitnikiEdit, RajoniEdit, ViddilennyEdit;

{$R *.dfm}

procedure TfrmRajoni.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmRajoni.qTeritory.Close;
  frmRajoni.qDistrict.Close;

{
  if frmMain.IsFormOpen('frmPosadiEdit') then
  begin
    frmPosadiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViddilennyEdit') then
  begin
    frmViddilennyEdit.Enabled:=true;
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
}

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmRajoni.FormResize(Sender: TObject);
begin
  frmRajoni.btnMin_Ter.Left:=frmRajoni.Width-40;
  frmRajoni.cbTeritory.Left:=8;
  frmRajoni.cbTeritory.Width:=frmRajoni.Width-frmRajoni.btnMin_Ter.Width-32;
end;

procedure TfrmRajoni.aTeritoryUpdateExecute(Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  with frmRajoni do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where not TERITORY is null order by TERITORY';
    qTeritory.Open;
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';
  end;
  INIAZZ.Free;
end;

procedure TfrmRajoni.aUpdateExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qDistrict.SQL.Clear;
    qDistrict.SQL.Text:='select RAJONI.KOD as "Код району", RAJONI.RAJON as "Район" from RAJONI, TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qDistrict.Params.Clear;
    qDistrict.Params.Add;
    qDistrict.Params[0].Name:='Teritory';
    qDistrict.Params[0].Value:=cbTeritory.Text;
    qDistrict.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmRajoni.aCloseExecute(Sender: TObject);
begin
  frmRajoni.Close;
end;

procedure TfrmRajoni.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRajoniEdit') then frmRajoniEdit:=TfrmRajoniEdit.Create(self);
  frmMain.Enabled:=false;
  frmRajoniEdit.Show;
  frmRajoniEdit.BorderStyle:=bsDialog;
  frmRajoniEdit.Position:=poMainFormCenter;
  frmRajoniEdit.Caption:='Додати район';
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmRajoni.Enabled:=false;

  frmRajoniEdit.edtKod.Text:='';
  frmRajoniEdit.aKodUpdateExecute(sender);
  frmRajoniEdit.edtKod.Enabled:=false;
  frmRajoniEdit.btnKod.Enabled:=false;

  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmRajoniEdit.cbTeritory.Text:='';
  frmRajoniEdit.cbTeritory.Items.Clear;
  frmRajoniEdit.aTeritoryUpdateExecute(sender);
  frmRajoniEdit.cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',frmRajoniEdit.cbTeritory.Text);
  if frmRajoni.qTeritory.Locate('KOD',StrToInt(frmRajoniEdit.cbTeritory.Text),[]) then frmRajoniEdit.cbTeritory.Text:=frmRajoni.qTeritory.FieldByName('TERITORY').Value else frmRajoniEdit.cbTeritory.Text:='';
  frmRajoniEdit.cbTeritory.Enabled:=true;
  frmRajoniEdit.btnTeritoryUpdate.Enabled:=true;
  frmRajoniEdit.btnTeritoryChoice.Enabled:=true;

  frmRajoniEdit.edtRajon.Text:='';
  frmRajoniEdit.edtRajon.Enabled:=true;
  frmRajoniEdit.edtRajon.SetFocus;
  INIAZZ.Free;
end;

procedure TfrmRajoni.aEditExecute(Sender: TObject);
begin
  if frmRajoni.qDistrict.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRajoniEdit') then frmRajoniEdit:=TfrmRajoniEdit.Create(self);
  frmMain.Enabled:=false;
  frmRajoniEdit.Show;
  frmRajoniEdit.BorderStyle:=bsDialog;
  frmRajoniEdit.Position:=poMainFormCenter;
  frmRajoniEdit.Caption:='Редагувати район';
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmRajoni.Enabled:=false;

  if not frmRajoni.qDistrict.FieldByName('Код району').IsNull then frmRajoniEdit.edtKod.Text:=IntToStr(frmRajoni.qDistrict.FieldByName('Код району').Value) else frmRajoniEdit.aKodUpdateExecute(sender);
  frmRajoniEdit.edtKod.Enabled:=false;
  frmRajoniEdit.btnKod.Enabled:=false;

  frmRajoniEdit.cbTeritory.Text:='';
  frmRajoniEdit.cbTeritory.Items.Clear;
  frmRajoniEdit.aTeritoryUpdateExecute(sender);
  frmRajoniEdit.cbTeritory.Text:=frmRajoni.cbTeritory.Text;
  frmRajoniEdit.cbTeritory.Enabled:=true;
  frmRajoniEdit.btnTeritoryUpdate.Enabled:=true;
  frmRajoniEdit.btnTeritoryChoice.Enabled:=true;
  
  if not frmRajoni.qDistrict.FieldByName('Район').IsNull then frmRajoniEdit.edtRajon.Text:=frmRajoni.qDistrict.FieldByName('Район').Value else frmRajoniEdit.edtRajon.Text:='';
  frmRajoniEdit.edtRajon.Enabled:=true;
  frmRajoniEdit.edtRajon.SetFocus;
end;

procedure TfrmRajoni.aDeleteExecute(Sender: TObject);
begin
  if frmRajoni.qDistrict.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRajoniEdit') then frmRajoniEdit:=TfrmRajoniEdit.Create(self);
  frmMain.Enabled:=false;
  frmRajoniEdit.Show;
  frmRajoniEdit.BorderStyle:=bsDialog;
  frmRajoniEdit.Position:=poMainFormCenter;
  frmRajoniEdit.Caption:='Видалити район';
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmRajoni.Enabled:=false;

  if not frmRajoni.qDistrict.FieldByName('Код району').IsNull then frmRajoniEdit.edtKod.Text:=IntToStr(frmRajoni.qDistrict.FieldByName('Код району').Value) else frmRajoniEdit.aKodUpdateExecute(sender);
  frmRajoniEdit.edtKod.Enabled:=false;
  frmRajoniEdit.btnKod.Enabled:=false;

  frmRajoniEdit.cbTeritory.Text:='';
  frmRajoniEdit.cbTeritory.Items.Clear;
  frmRajoniEdit.aTeritoryUpdateExecute(sender);
  frmRajoniEdit.cbTeritory.Text:=frmRajoni.cbTeritory.Text;
  frmRajoniEdit.cbTeritory.Enabled:=false;
  frmRajoniEdit.btnTeritoryUpdate.Enabled:=false;
  frmRajoniEdit.btnTeritoryChoice.Enabled:=false;

  if not frmRajoni.qDistrict.FieldByName('Район').IsNull then frmRajoniEdit.edtRajon.Text:=frmRajoni.qDistrict.FieldByName('Район').Value else frmRajoniEdit.edtRajon.Text:='';
  frmRajoniEdit.edtRajon.Enabled:=false;
  frmRajoniEdit.btnVidminiti.SetFocus;
end;

procedure TfrmRajoni.aChoiceExecute(Sender: TObject);
begin
  if frmRajoni.qDistrict.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmRajoniEdit') then frmRajoniEdit:=TfrmRajoniEdit.Create(self);
  frmMain.Enabled:=false;
  frmRajoniEdit.Show;
  frmRajoniEdit.BorderStyle:=bsDialog;
  frmRajoniEdit.Position:=poMainFormCenter;
  frmRajoniEdit.Caption:='Вибрати район';
//  if frmMain.IsFormOpen('frmPosadiEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then frmRajoni.Enabled:=false;
//  if frmMain.IsFormOpen('frmViddilennyEdit') then frmRajoni.Enabled:=false;

  if not frmRajoni.qDistrict.FieldByName('Код району').IsNull then frmRajoniEdit.edtKod.Text:=IntToStr(frmRajoni.qDistrict.FieldByName('Код району').Value) else frmRajoniEdit.aKodUpdateExecute(sender);
  frmRajoniEdit.edtKod.Enabled:=false;
  frmRajoniEdit.btnKod.Enabled:=false;

  frmRajoniEdit.cbTeritory.Text:='';
  frmRajoniEdit.cbTeritory.Items.Clear;
  frmRajoniEdit.aTeritoryUpdateExecute(sender);
  frmRajoniEdit.cbTeritory.Text:=frmRajoni.cbTeritory.Text;
  frmRajoniEdit.cbTeritory.Enabled:=false;
  frmRajoniEdit.btnTeritoryUpdate.Enabled:=false;
  frmRajoniEdit.btnTeritoryChoice.Enabled:=false;

  if not frmRajoni.qDistrict.FieldByName('Район').IsNull then frmRajoniEdit.edtRajon.Text:=frmRajoni.qDistrict.FieldByName('Район').Value else frmRajoniEdit.edtRajon.Text:='';
  frmRajoniEdit.edtRajon.Enabled:=false;
  frmRajoniEdit.btnVikonati.SetFocus;
end;

procedure TfrmRajoni.aSortByNazvaExecute(Sender: TObject);
begin
  frmRajoni.aUpdateExecute(sender);
end;

procedure TfrmRajoni.aSortByKodExecute(Sender: TObject);
begin
  with frmRajoni do
  begin
    qDistrict.SQL.Clear;
    qDistrict.SQL.Text:='select RAJONI.KOD as "Код району", RAJONI.RAJON as "Район" from RAJONI, TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.KOD';
    qDistrict.Params.Clear;
    qDistrict.Params.Add;
    qDistrict.Params[0].Name:='Teritory';
    qDistrict.Params[0].Value:=cbTeritory.Text;
    qDistrict.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmRajoni.cbTeritoryChange(Sender: TObject);
begin
  frmRajoni.aUpdateExecute(sender);
end;

procedure TfrmRajoni.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmRajoni.dsDistrict;
end;

end.
