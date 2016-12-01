unit VidPostanovi;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, SysUtils;

type
  TfrmVidPostanovi = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    DBGrid1: TDBGrid;
    btnUpdate: TButton;
    alVidPostanovi: TActionList;
    dsVidPostanovi: TDataSource;
    qVidPostanovi: TIBQuery;
    PopupMenu: TPopupMenu;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aUpdate: TAction;
    aClose: TAction;
    aChoice: TAction;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmVidPostanovi: TfrmVidPostanovi;

implementation

uses
  Main, AdminZapobizhZahodiEdit, VidPostanoviEdit, VidPostanoviSetting;

{$R *.dfm}

procedure TfrmVidPostanovi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidPostanovi.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidPostanoviEdit') then frmVidPostanoviEdit:=TfrmVidPostanoviEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidPostanoviEdit.Show;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidPostanovi.Enabled:=false;
  frmVidPostanoviEdit.Position:=poMainFormCenter;
  frmVidPostanoviEdit.BorderStyle:=bsDialog;
  frmVidPostanoviEdit.Caption:='Додавання виду постанови';
  frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
  frmVidPostanoviEdit.edtRecord_ID.Enabled:=false;
  frmVidPostanoviEdit.aKodUpdateExecute(sender);
  frmVidPostanoviEdit.edtKodViduPostanovi.Enabled:=true;
  frmVidPostanoviEdit.btnKodViduPostanovi.Enabled:=true;
  frmVidPostanoviEdit.edtVidPostanovi.Text:='';
  frmVidPostanoviEdit.edtVidPostanovi.Enabled:=true;
  frmVidPostanoviEdit.edtVidPostanovi.SetFocus;
end;

procedure TfrmVidPostanovi.aEditExecute(Sender: TObject);
begin
  if frmVidPostanovi.qVidPostanovi.RecordCount<=0 then exit;
  if frmVidPostanovi.Caption='Довідник видів постанов' then
  begin
    frmMain.Enabled:=false;
    if not frmMain.IsFormOpen('frmVidPostanoviEdit') then frmVidPostanoviEdit:=TfrmVidPostanoviEdit.Create(self);
    frmVidPostanoviEdit.Show;
    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidPostanovi.Enabled:=false;
    frmVidPostanoviEdit.Position:=poMainFormCenter;
    frmVidPostanoviEdit.BorderStyle:=bsDialog;
    frmVidPostanoviEdit.Caption:='Редагування виду постанови';
    if not frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').IsNull then frmVidPostanoviEdit.edtRecord_ID.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').Value) else frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
    frmVidPostanoviEdit.edtRecord_ID.Enabled:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').IsNull then frmVidPostanoviEdit.edtKodViduPostanovi.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').Value) else frmVidPostanoviEdit.aKodUpdateExecute(sender);
    frmVidPostanoviEdit.edtKodViduPostanovi.Enabled:=true;
    frmVidPostanoviEdit.btnKodViduPostanovi.Enabled:=true;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').IsNull then frmVidPostanoviEdit.edtVidPostanovi.Text:=frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').Value else frmVidPostanoviEdit.edtVidPostanovi.Text:='';
    frmVidPostanoviEdit.edtVidPostanovi.Enabled:=true;
    frmVidPostanoviEdit.edtVidPostanovi.SetFocus;
  end;

  if frmVidPostanovi.Caption='Налаштування видів постанов' then
  begin
    if not frmMain.IsFormOpen('frmVidPostanoviSetting') then frmVidPostanoviSetting:=TfrmVidPostanoviSetting.Create(self);
    frmMain.Enabled:=false;
    frmVidPostanoviSetting.Show;
    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidPostanovi.Enabled:=false;
    frmVidPostanoviSetting.Position:=poMainFormCenter;
    frmVidPostanoviSetting.BorderStyle:=bsDialog;
    frmVidPostanoviSetting.Caption:='Налаштування видів постанов';
    if not frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').IsNull then frmVidPostanoviSetting.edtRecord_ID.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').Value);
    frmVidPostanoviSetting.edtRecord_ID.Enabled:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').IsNull then frmVidPostanoviSetting.edtKodViduPostanovi.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').Value);
    frmVidPostanoviSetting.edtKodViduPostanovi.Enabled:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').IsNull then frmVidPostanoviSetting.edtVidPostanovi.Text:=frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').Value;
    frmVidPostanoviSetting.edtVidPostanovi.Enabled:=false;

    if not frmVidPostanovi.qVidPostanovi.FieldByName('NAJMENUVANNYTOVARU').IsNull then
    begin
      case frmVidPostanovi.qVidPostanovi.FieldByName('NAJMENUVANNYTOVARU').Value of
        0: frmVidPostanoviSetting.cbNajmenuvannyTovaru.Checked:=false;
        1: frmVidPostanoviSetting.cbNajmenuvannyTovaru.Checked:=true;
      end;
    end
    else
      frmVidPostanoviSetting.cbNajmenuvannyTovaru.Checked:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('KILKIST').IsNull then
    begin
      case frmVidPostanovi.qVidPostanovi.FieldByName('KILKIST').Value of
        0: frmVidPostanoviSetting.cbKilkist.Checked:=false;
        1: frmVidPostanoviSetting.cbKilkist.Checked:=true;
      end;
    end
    else
      frmVidPostanoviSetting.cbKilkist.Checked:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('VAGAODINICI').IsNull then
    begin
      case frmVidPostanovi.qVidPostanovi.FieldByName('VAGAODINICI').Value of
        0: frmVidPostanoviSetting.cbVagaOdinici.Checked:=false;
        1: frmVidPostanoviSetting.cbVagaOdinici.Checked:=true;
      end;
    end
    else
      frmVidPostanoviSetting.cbVagaOdinici.Checked:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('ZAGALNAVAGA').IsNull then
    begin
      case frmVidPostanovi.qVidPostanovi.FieldByName('ZAGALNAVAGA').Value of
        0: frmVidPostanoviSetting.cbZagalnaVaga.Checked:=false;
        1: frmVidPostanoviSetting.cbZagalnaVaga.Checked:=true;
      end;
    end
    else
      frmVidPostanoviSetting.cbZagalnaVaga.Checked:=false;
    if not frmVidPostanovi.qVidPostanovi.FieldByName('OTRIMANOGO').IsNull then
    begin
      case frmVidPostanovi.qVidPostanovi.FieldByName('OTRIMANOGO').Value of
        0: frmVidPostanoviSetting.cbOtrimanogo.Checked:=false;
        1: frmVidPostanoviSetting.cbOtrimanogo.Checked:=true;
      end;
    end
    else
      frmVidPostanoviSetting.cbOtrimanogo.Checked:=false;
  end;
end;

procedure TfrmVidPostanovi.aDeleteExecute(Sender: TObject);
begin
  if frmVidPostanovi.qVidPostanovi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidPostanoviEdit') then frmVidPostanoviEdit:=TfrmVidPostanoviEdit.Create(self);
  frmMain.Enabled:=false;
  frmVidPostanoviEdit.Show;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidPostanovi.Enabled:=false;
  frmVidPostanoviEdit.Position:=poMainFormCenter;
  frmVidPostanoviEdit.BorderStyle:=bsDialog;
  frmVidPostanoviEdit.Caption:='Видалення виду постанови';
  if not frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').IsNull then frmVidPostanoviEdit.edtRecord_ID.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').Value) else frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
  frmVidPostanoviEdit.edtRecord_ID.Enabled:=false;
  if not frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').IsNull then frmVidPostanoviEdit.edtKodViduPostanovi.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').Value) else frmVidPostanoviEdit.aKodUpdateExecute(sender);
  frmVidPostanoviEdit.edtKodViduPostanovi.Enabled:=false;
  frmVidPostanoviEdit.btnKodViduPostanovi.Enabled:=false;
  if not frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').IsNull then frmVidPostanoviEdit.edtVidPostanovi.Text:=frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').Value else frmVidPostanoviEdit.edtVidPostanovi.Text:='';
  frmVidPostanoviEdit.edtVidPostanovi.Enabled:=false;
  frmVidPostanoviEdit.btnVidminiti.SetFocus;
end;

procedure TfrmVidPostanovi.aChoiceExecute(Sender: TObject);
begin
  if frmVidPostanovi.qVidPostanovi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidPostanoviEdit') then frmVidPostanoviEdit:=TfrmVidPostanoviEdit.Create(self);
  frmAdminZapobizhZahodiEdit.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmVidPostanovi.Enabled:=false;
  frmVidPostanoviEdit.Show;
  frmVidPostanoviEdit.Position:=poMainFormCenter;
  frmVidPostanoviEdit.BorderStyle:=bsDialog;
  frmVidPostanoviEdit.Caption:='Вибір виду постанови';
  if not frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').IsNull then frmVidPostanoviEdit.edtRecord_ID.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('RECORD_ID').Value) else frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
  frmVidPostanoviEdit.edtRecord_ID.Enabled:=false;
  if not frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').IsNull then frmVidPostanoviEdit.edtKodViduPostanovi.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.FieldByName('KODVIDA').Value) else frmVidPostanoviEdit.aKodUpdateExecute(sender);
  frmVidPostanoviEdit.edtKodViduPostanovi.Enabled:=false;
  frmVidPostanoviEdit.btnKodViduPostanovi.Enabled:=false;
  if not frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').IsNull then frmVidPostanoviEdit.edtVidPostanovi.Text:=frmVidPostanovi.qVidPostanovi.FieldByName('VIDPOSTANOVI').Value else frmVidPostanoviEdit.edtVidPostanovi.Text:='';
  frmVidPostanoviEdit.edtVidPostanovi.Enabled:=false;
  frmVidPostanoviEdit.btnVikonati.SetFocus;
end;

procedure TfrmVidPostanovi.aUpdateExecute(Sender: TObject);
begin
  with frmVidPostanovi do
  begin
    qVidPostanovi.SQL.Clear;
    qVidPostanovi.SQL.Text:='select * from VIDPOSTANOVI order by VIDPOSTANOVI';
    qVidPostanovi.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmVidPostanovi.aCloseExecute(Sender: TObject);
begin
  frmVidPostanovi.Close;
end;

procedure TfrmVidPostanovi.aSortByNazvaExecute(Sender: TObject);
begin
  with frmVidPostanovi do
  begin
    qVidPostanovi.SQL.Clear;
    qVidPostanovi.SQL.Text:='select * from VIDPOSTANOVI order by VIDPOSTANOVI';
    qVidPostanovi.Open;
    aSortByKod.Checked:=false;
    aSortByNazva.Checked:=true;
  end;
end;

procedure TfrmVidPostanovi.aSortByKodExecute(Sender: TObject);
begin
  with frmVidPostanovi do
  begin
    qVidPostanovi.SQL.Clear;
    qVidPostanovi.SQL.Text:='select * from VIDPOSTANOVI order by KODVIDA';
    qVidPostanovi.Open;
    aSortByKod.Checked:=true;
    aSortByNazva.Checked:=false;
  end;
end;

procedure TfrmVidPostanovi.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmVidPostanovi.dsVidPostanovi;
end;

end.
