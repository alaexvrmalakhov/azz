unit Koristuvachi;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  Controls, ExtCtrls, Grids, DBGrids, IniFiles, SysUtils;
//  , Windows, Messages, Variants, Graphics, Dialogs,

type
  TfrmKoristuvachi = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    btnTeritoryUpdate: TButton;
    alKoristuvachi: TActionList;
    aMinistryChange: TAction;
    aTeritoryChange: TAction;
    aDistrictChange: TAction;
    aTeritoryUpdate: TAction;
    Panel2: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    cbChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
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
    qTeritory: TIBQuery;
    qKoristuvachi: TIBQuery;
    dsKoristuvachi: TDataSource;
    aByKod: TAction;
    aByLogin: TAction;
    aByPrizvische: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictChangeExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aByPrizvischeExecute(Sender: TObject);
    procedure aByLoginExecute(Sender: TObject);
    procedure aByKodExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKoristuvachi: TfrmKoristuvachi;

implementation

uses Main, KoristuvachiEdit;

{$R *.dfm}

procedure TfrmKoristuvachi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
  exit;
end;

procedure TfrmKoristuvachi.FormResize(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
    cbMinistry.Left:=4;
    cbMinistry.Width:=trunc(int((Width-47)/3));
    cbTeritory.Left:=cbMinistry.Left+cbMinistry.Width+4;
    cbTeritory.Width:=trunc(int((Width-47)/3));
    cbDistrict.Left:=cbTeritory.Left+cbTeritory.Width+4;
    cbDistrict.Width:=trunc(int((Width-47)/3));
    btnTeritoryUpdate.Left:=cbDistrict.Left+cbDistrict.Width+4;
  end;
end;

procedure TfrmKoristuvachi.aMinistryChangeExecute(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
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
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';
    INIAZZ.Free;
    aTeritoryChangeExecute(sender);
  end;
end;

procedure TfrmKoristuvachi.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
//    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY='''+cbTeritory.Text+''' and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=cbTeritory.Text;
    qTeritory.Open;
    cbDistrict.Text:='';
    cbDistrict.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      cbDistrict.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    cbDistrict.Text:=INIAZZ.ReadString('Teritory','District',cbDistrict.Text);
    if qTeritory.Locate('KOD',StrToInt(cbDistrict.Text),[]) then cbDistrict.Text:=qTeritory.FieldByName('RAJON').Value else cbDistrict.Text:='';
    INIAZZ.Free;
    aDistrictChangeExecute(sender);
  end;
end;

procedure TfrmKoristuvachi.aDistrictChangeExecute(Sender: TObject);
begin
  frmKoristuvachi.aUpdateExecute(sender);
end;

procedure TfrmKoristuvachi.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmKoristuvachi do
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
    if qTeritory.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qTeritory.FieldByName('MINISTRY').Value else cbMinistry.Text:='';
    INIAZZ.Free;
    aMinistryChangeExecute(sender);
  end;
end;

procedure TfrmKoristuvachi.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmKoristuvachiEdit') then frmKoristuvachiEdit:=TfrmKoristuvachiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmKoristuvachiEdit do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Додавання користувача';
    edtMinistry.Text:=frmKoristuvachi.cbMinistry.Text;
    edtMinistry.Enabled:=false;
    edtTeritory.Text:=frmKoristuvachi.cbTeritory.Text;
    edtTeritory.Enabled:=false;
    edtDistrict.Text:=frmKoristuvachi.cbDistrict.Text;
    edtDistrict.Enabled:=false;
    edtRecord_ID.Text:='';
    edtRecord_ID.Enabled:=false;
    aRecordIDUpdateExecute(sender);
    edtLogin.Text:='';
    edtLogin.Enabled:=true;
    edtPassword.Text:='';
    edtPassword.Enabled:=true;
    edtPassword.PasswordChar:='#';
    edtPasswordConfirm.Text:='';
    edtPasswordConfirm.Enabled:=true;
    edtPasswordConfirm.PasswordChar:='#';
    cbPIB.Text:='';
    cbPIB.Items.Clear;
    aPIB_UpdateExecute(sender);
    cbPIB.Enabled:=true;
    btnPIB_Update.Enabled:=true;
    btnPIB_Choice.Enabled:=true;
    edtLogin.SetFocus;
  end;
end;

procedure TfrmKoristuvachi.aDeleteExecute(Sender: TObject);
begin
  if frmKoristuvachi.qKoristuvachi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmKoristuvachiEdit') then frmKoristuvachiEdit:=TfrmKoristuvachiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmKoristuvachiEdit do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Видалення користувача';
    edtMinistry.Text:=frmKoristuvachi.cbMinistry.Text;
    edtMinistry.Enabled:=false;
    edtTeritory.Text:=frmKoristuvachi.cbTeritory.Text;
    edtTeritory.Enabled:=false;
    edtDistrict.Text:=frmKoristuvachi.cbDistrict.Text;
    edtDistrict.Enabled:=false;
    edtRecord_ID.Text:='';
    edtRecord_ID.Enabled:=false;
    if not qKoristuvachi.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(qKoristuvachi.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    edtLogin.Text:='';
    edtLogin.Enabled:=false;
    if not qKoristuvachi.FieldByName('LOGIN').IsNull then edtLogin.Text:=qKoristuvachi.FieldByName('LOGIN').Value else edtLogin.Text:='';
    edtPassword.Text:='';
    edtPassword.Enabled:=false;
    edtPassword.PasswordChar:='#';
    edtPasswordConfirm.Text:='';
    edtPasswordConfirm.Enabled:=false;
    edtPasswordConfirm.PasswordChar:='#';
    cbPIB.Text:='';
    cbPIB.Items.Clear;
    cbPIB.Enabled:=false;
    btnPIB_Update.Enabled:=false;
    btnPIB_Choice.Enabled:=false;
    aPIB_UpdateExecute(sender);
    if not qKoristuvachi.FieldByName('USERKOD').IsNull then
    begin
      cbPIB.Text:=IntToStr(qKoristuvachi.FieldByName('USERKOD').Value);
      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD and SPIVROBITNIKI.KODSPIVROBITNIKA=:Kod order by SPIVROBITNIKI.KODSPIVROBITNIKA';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='District';
      qUpdate.Params[0].Value:=frmKoristuvachi.cbDistrict.Text;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Kod';
      qUpdate.Params[1].Value:=cbPIB.Text;
      qUpdate.Open;
      if qUpdate.Locate('KODSPIVROBITNIKA',StrToInt(cbPIB.Text),[]) then cbPIB.Text:=qUpdate.FieldByName('PRIZVISXHE').Value;
    end
    else
      aPIB_UpdateExecute(sender);
    ActiveControl:=btnCancel;
  end;
end;

procedure TfrmKoristuvachi.aChoiceExecute(Sender: TObject);
begin
  if frmKoristuvachi.qKoristuvachi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmKoristuvachiEdit') then frmKoristuvachiEdit:=TfrmKoristuvachiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmKoristuvachiEdit do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Вибір користувача';
    edtMinistry.Text:=frmKoristuvachi.cbMinistry.Text;
    edtMinistry.Enabled:=false;
    edtTeritory.Text:=frmKoristuvachi.cbTeritory.Text;
    edtTeritory.Enabled:=false;
    edtDistrict.Text:=frmKoristuvachi.cbDistrict.Text;
    edtDistrict.Enabled:=false;
    edtRecord_ID.Text:='';
    edtRecord_ID.Enabled:=false;
    if not qKoristuvachi.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(qKoristuvachi.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    edtLogin.Text:='';
    edtLogin.Enabled:=false;
    if not qKoristuvachi.FieldByName('LOGIN').IsNull then edtLogin.Text:=qKoristuvachi.FieldByName('LOGIN').Value else edtLogin.Text:='';
    edtPassword.Text:='';
    edtPassword.Enabled:=false;
    edtPassword.PasswordChar:='#';
    edtPasswordConfirm.Text:='';
    edtPasswordConfirm.Enabled:=false;
    edtPasswordConfirm.PasswordChar:='#';
    cbPIB.Text:='';
    cbPIB.Items.Clear;
    cbPIB.Enabled:=false;
    btnPIB_Update.Enabled:=false;
    btnPIB_Choice.Enabled:=false;
    aPIB_UpdateExecute(sender);
    if not qKoristuvachi.FieldByName('USERKOD').IsNull then
    begin
      cbPIB.Text:=IntToStr(qKoristuvachi.FieldByName('USERKOD').Value);
      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD and SPIVROBITNIKI.KODSPIVROBITNIKA=:Kod order by SPIVROBITNIKI.KODSPIVROBITNIKA';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='District';
      qUpdate.Params[0].Value:=frmKoristuvachi.cbDistrict.Text;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Kod';
      qUpdate.Params[1].Value:=cbPIB.Text;
      qUpdate.Open;
      if qUpdate.Locate('KODSPIVROBITNIKA',StrToInt(cbPIB.Text),[]) then cbPIB.Text:=qUpdate.FieldByName('PRIZVISXHE').Value;
    end
    else
      aPIB_UpdateExecute(sender);
    ActiveControl:=btnOK;
  end;
end;

procedure TfrmKoristuvachi.aUpdateExecute(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
    qKoristuvachi.SQL.Clear;
    qKoristuvachi.SQL.Text:='select * from USERS,SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and USERS.DISTRICT=RAJONI.KOD and USERS.USERKOD=SPIVROBITNIKI.KODSPIVROBITNIKA order by SPIVROBITNIKI.PRIZVISXHE';
    qKoristuvachi.Params.Clear;
    qKoristuvachi.Params.Add;
    qKoristuvachi.Params[0].Name:='District';
    qKoristuvachi.Params[0].Value:=cbDistrict.Text;
    qKoristuvachi.Open;
    Caption:='Користувачі системи';
    aByKod.Checked:=false;
    aByLogin.Checked:=false;
    aByPrizvische.Checked:=true;
  end;
end;

procedure TfrmKoristuvachi.aCloseExecute(Sender: TObject);
begin
  frmKoristuvachi.Close;
end;

procedure TfrmKoristuvachi.aByPrizvischeExecute(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
    qKoristuvachi.SQL.Clear;
    qKoristuvachi.SQL.Text:='select * from USERS,SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and USERS.DISTRICT=RAJONI.KOD and USERS.USERKOD=SPIVROBITNIKI.KODSPIVROBITNIKA order by SPIVROBITNIKI.PRIZVISXHE';
    qKoristuvachi.Params.Clear;
    qKoristuvachi.Params.Add;
    qKoristuvachi.Params[0].Name:='District';
    qKoristuvachi.Params[0].Value:=cbDistrict.Text;
    qKoristuvachi.Open;
    Caption:='Користувачі системи';
    aByKod.Checked:=false;
    aByLogin.Checked:=false;
    aByPrizvische.Checked:=true;
  end;
end;

procedure TfrmKoristuvachi.aByLoginExecute(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
    qKoristuvachi.SQL.Clear;
    qKoristuvachi.SQL.Text:='select * from USERS,SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and USERS.DISTRICT=RAJONI.KOD and USERS.USERKOD=SPIVROBITNIKI.KODSPIVROBITNIKA order by USERS.LOGIN';
    qKoristuvachi.Params.Clear;
    qKoristuvachi.Params.Add;
    qKoristuvachi.Params[0].Name:='District';
    qKoristuvachi.Params[0].Value:=cbDistrict.Text;
    qKoristuvachi.Open;
    Caption:='Користувачі системи';
    aByKod.Checked:=false;
    aByLogin.Checked:=true;
    aByPrizvische.Checked:=false;
  end;
end;

procedure TfrmKoristuvachi.aByKodExecute(Sender: TObject);
begin
  with frmKoristuvachi do
  begin
    qKoristuvachi.SQL.Clear;
    qKoristuvachi.SQL.Text:='select * from USERS,SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and USERS.DISTRICT=RAJONI.KOD and USERS.USERKOD=SPIVROBITNIKI.KODSPIVROBITNIKA order by USERS.KOD';
    qKoristuvachi.Params.Clear;
    qKoristuvachi.Params.Add;
    qKoristuvachi.Params[0].Name:='District';
    qKoristuvachi.Params[0].Value:=cbDistrict.Text;
    qKoristuvachi.Open;
    Caption:='Користувачі системи';
    aByKod.Checked:=true;
    aByLogin.Checked:=false;
    aByPrizvische.Checked:=false;
  end;
end;

procedure TfrmKoristuvachi.aEditExecute(Sender: TObject);
begin
  if frmKoristuvachi.qKoristuvachi.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmKoristuvachiEdit') then frmKoristuvachiEdit:=TfrmKoristuvachiEdit.Create(self);
  frmMain.Enabled:=false;
  with frmKoristuvachiEdit do
  begin
    Show;
    BorderStyle:=bsDialog;
    Position:=poMainFormCenter;
    Caption:='Редагування користувача';
    edtMinistry.Text:=frmKoristuvachi.cbMinistry.Text;
    edtMinistry.Enabled:=false;
    edtTeritory.Text:=frmKoristuvachi.cbTeritory.Text;
    edtTeritory.Enabled:=false;
    edtDistrict.Text:=frmKoristuvachi.cbDistrict.Text;
    edtDistrict.Enabled:=false;
    edtRecord_ID.Text:='';
    edtRecord_ID.Enabled:=false;
    if not qKoristuvachi.FieldByName('RECORD_ID').IsNull then edtRecord_ID.Text:=IntToStr(qKoristuvachi.FieldByName('RECORD_ID').Value) else aRecordIDUpdateExecute(sender);
    edtLogin.Text:='';
    edtLogin.Enabled:=true;
    if not qKoristuvachi.FieldByName('LOGIN').IsNull then edtLogin.Text:=qKoristuvachi.FieldByName('LOGIN').Value else edtLogin.Text:='';
    edtPassword.Text:='';
    edtPassword.Enabled:=true;
    edtPassword.PasswordChar:='#';
    edtPasswordConfirm.Text:='';
    edtPasswordConfirm.Enabled:=true;
    edtPasswordConfirm.PasswordChar:='#';
    cbPIB.Text:='';
    cbPIB.Items.Clear;
    cbPIB.Enabled:=true;
    btnPIB_Update.Enabled:=true;
    btnPIB_Choice.Enabled:=true;
    aPIB_UpdateExecute(sender);
    if not qKoristuvachi.FieldByName('USERKOD').IsNull then
    begin
      cbPIB.Text:=IntToStr(qKoristuvachi.FieldByName('USERKOD').Value);
      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD and SPIVROBITNIKI.KODSPIVROBITNIKA=:Kod order by SPIVROBITNIKI.KODSPIVROBITNIKA';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='District';
      qUpdate.Params[0].Value:=frmKoristuvachi.cbDistrict.Text;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Kod';
      qUpdate.Params[1].Value:=cbPIB.Text;
      qUpdate.Open;
      if qUpdate.Locate('KODSPIVROBITNIKA',StrToInt(cbPIB.Text),[]) then cbPIB.Text:=qUpdate.FieldByName('PRIZVISXHE').Value;
    end
    else
      aPIB_UpdateExecute(sender);
    ActiveControl:=edtLogin;
  end;
end;

procedure TfrmKoristuvachi.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmKoristuvachi.dsKoristuvachi;
end;

end.
