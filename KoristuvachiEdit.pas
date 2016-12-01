unit KoristuvachiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, SysUtils, Dialogs;
//  Windows, Messages, Variants, Graphics,

type
  TfrmKoristuvachiEdit = class(TForm)
    edtMinistry: TEdit;
    edtTeritory: TEdit;
    edtDistrict: TEdit;
    edtRecord_ID: TEdit;
    alKoristuvachiEdit: TActionList;
    qUpdate: TIBQuery;
    Bevel1: TBevel;
    Label2: TLabel;
    edtLogin: TEdit;
    Label3: TLabel;
    edtPassword: TEdit;
    Label4: TLabel;
    edtPasswordConfirm: TEdit;
    btnPIB_Choice: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    Label8: TLabel;
    cbPIB: TComboBox;
    btnPIB_Update: TButton;
    aRecordIDUpdate: TAction;
    aPIB_Update: TAction;
    aPIB_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aPIB_UpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aPIB_ChoiceExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKoristuvachiEdit: TfrmKoristuvachiEdit;

implementation

uses Main, Spivrobitniki, Koristuvachi;

{$R *.dfm}

procedure TfrmKoristuvachiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmKoristuvachiEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmKoristuvachiEdit do
  begin
    qUpdate.SQL.Clear;
    qUpdate.SQL.Text:='insert into USERS (RECORD_ID) values(gen_id(GET_DICTIONARIES_RECORD_ID,1))';
//    qUpdate.SQL.Text:='select * from USERS order by RECORD_ID';
    qUpdate.Open;
    qUpdate.SQL.Clear;
    qUpdate.SQL.Text:='select * from USERS order by RECORD_ID';
    qUpdate.Open;
    qUpdate.Last;
    edtRecord_ID.Text:=IntToStr(qUpdate.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmKoristuvachiEdit.aPIB_UpdateExecute(Sender: TObject);
begin
  with frmKoristuvachiEdit do
  begin
    qUpdate.SQL.Clear;
    qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
    qUpdate.Params.Clear;
    qUpdate.Params.Add;
    qUpdate.Params[0].Name:='District';
    qUpdate.Params[0].Value:=edtDistrict.Text;
    qUpdate.Open;
    cbPIB.Text:='';
    cbPIB.Items.Clear;
    qUpdate.First;
    while not qUpdate.Eof do
    begin
      cbPIB.Items.Add(qUpdate.FieldByName('PRIZVISXHE').Value);
      qUpdate.Next;
    end;
  end;
end;

procedure TfrmKoristuvachiEdit.aOKExecute(Sender: TObject);
var
  Ministry, Teritory, District, PIB: integer;
begin
  if frmKoristuvachiEdit.Caption='Вибір користувача' then
  begin
  end;

  if frmKoristuvachiEdit.Caption='Видалення користувача' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на інших відомостях!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmKoristuvachi do
      begin
        qKoristuvachi.SQL.Clear;
        qKoristuvachi.SQL.Text:='delete from USERS where RECORD_ID=:RecordID';
        qKoristuvachi.Params.Clear;
        qKoristuvachi.Params.Add;
        qKoristuvachi.Params[0].Name:='RecordID';
        qKoristuvachi.Params[0].Value:=edtRecord_ID.Text;
        qKoristuvachi.Open;
        frmMain.trAzz.CommitRetaining;
      end;
      frmKoristuvachiEdit.Close;
      frmKoristuvachi.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmKoristuvachiEdit.Caption='Редагування користувача' then
  begin
    if frmKoristuvachiEdit.edtLogin.Text='' then
    begin
      frmKoristuvachiEdit.edtLogin.Text:='';
      frmKoristuvachiEdit.edtLogin.SetFocus;
      exit;
    end;
    frmKoristuvachiEdit.qUpdate.SQL.Clear;
    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from USERS,RAJONI where RAJONI.RAJON=:District and USERS.DISTRICT=RAJONI.KOD order by USERS.LOGIN';
    frmKoristuvachiEdit.qUpdate.Params.Clear;
    frmKoristuvachiEdit.qUpdate.Params.Add;
    frmKoristuvachiEdit.qUpdate.Params[0].Name:='District';
    frmKoristuvachiEdit.qUpdate.Params[0].Value:=edtDistrict.Text;
//    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from USERS,RAJONI where RAJONI.RAJON='''+edtDistrict.Text+''' and USERS.DISTRICT=RAJONI.KOD order by USERS.LOGIN';
    frmKoristuvachiEdit.qUpdate.Open;
    if frmKoristuvachiEdit.qUpdate.Locate('LOGIN',frmKoristuvachiEdit.edtLogin.Text,[]) then
    begin
      frmKoristuvachiEdit.edtLogin.Text:='';
      frmKoristuvachiEdit.edtLogin.SetFocus;
      exit;
    end;
    if (frmKoristuvachiEdit.edtPassword.Text='')or(frmKoristuvachiEdit.edtPasswordConfirm.Text='') then
    begin
      frmKoristuvachiEdit.edtPassword.Text:='';
      frmKoristuvachiEdit.edtPasswordConfirm.Text:='';
      frmKoristuvachiEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmKoristuvachiEdit.edtPassword.Text<>frmKoristuvachiEdit.edtPasswordConfirm.Text then
    begin
      frmKoristuvachiEdit.edtPassword.Text:='';
      frmKoristuvachiEdit.edtPasswordConfirm.Text:='';
      frmKoristuvachiEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmKoristuvachiEdit.cbPIB.Text='' then
    begin
      frmKoristuvachiEdit.aPIB_UpdateExecute(sender);
      frmKoristuvachiEdit.cbPIB.SetFocus;
      exit;
    end;
    frmKoristuvachiEdit.qUpdate.SQL.Clear;
    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
    frmKoristuvachiEdit.qUpdate.Params.Clear;
    frmKoristuvachiEdit.qUpdate.Params.Add;
    frmKoristuvachiEdit.qUpdate.Params[0].Name:='District';
    frmKoristuvachiEdit.qUpdate.Params[0].Value:=edtDistrict.Text;
//    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON='''+edtDistrict.Text+''' and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
    frmKoristuvachiEdit.qUpdate.Open;
    if not frmKoristuvachiEdit.qUpdate.Locate('PRIZVISXHE',frmKoristuvachiEdit.cbPIB.Text,[]) then
    begin
      frmKoristuvachiEdit.aPIB_UpdateExecute(sender);
      frmKoristuvachiEdit.cbPIB.SetFocus;
      exit;
    end;
    with frmKoristuvachiEdit do
    begin
      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=edtMinistry.Text;
      qUpdate.Open;
      if qUpdate.Locate('MINISTRY',edtMinistry.Text,[]) then Ministry:=qUpdate.FieldByName('KOD').Value else Ministry:=0;

      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=Ministry;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Teritory';
      qUpdate.Params[1].Value:=edtTeritory.Text;
      qUpdate.Open;
      if qUpdate.Locate('TERITORY',edtTeritory.Text,[]) then Teritory:=qUpdate.FieldByName('KOD').Value else Teritory:=0;


      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:District order by RAJON';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=Ministry;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Teritory';
      qUpdate.Params[1].Value:=Teritory;
      qUpdate.Params.Add;
      qUpdate.Params[2].Name:='District';
      qUpdate.Params[2].Value:=edtDistrict.Text;
      qUpdate.Open;
      if qUpdate.Locate('RAJON',edtDistrict.Text,[]) then District:=qUpdate.FieldByName('KOD').Value else District:=0;

      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:District and PRIZVISXHE=:PIB';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=Ministry;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Teritory';
      qUpdate.Params[1].Value:=Teritory;
      qUpdate.Params.Add;
      qUpdate.Params[2].Name:='District';
      qUpdate.Params[2].Value:=District;
      qUpdate.Params.Add;
      qUpdate.Params[3].Name:='PIB';
      qUpdate.Params[3].Value:=cbPIB.Text;
      qUpdate.Open;
      if qUpdate.Locate('PRIZVISXHE',cbPIB.Text,[]) then PIB:=qUpdate.FieldByName('KODSPIVROBITNIKA').Value else PIB:=0;
    end;

    with frmKoristuvachi do
    begin
      qKoristuvachi.SQL.Clear;
      qKoristuvachi.SQL.Text:='update USERS set MINISTRY=:Ministry, TERITORY=:Teritory,DISTRICT=:District,LOGIN=:Login,PASSWD=:Password,USERKOD=:User where RECORD_ID=:RECORD_ID';
      qKoristuvachi.Params.Clear;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[0].Name:='Ministry';
      qKoristuvachi.Params[0].Value:=Ministry;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[1].Name:='Teritory';
      qKoristuvachi.Params[1].Value:=Teritory;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[2].Name:='District';
      qKoristuvachi.Params[2].Value:=District;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[3].Name:='Login';
      qKoristuvachi.Params[3].Value:=edtLogin.Text;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[4].Name:='Password';
      qKoristuvachi.Params[4].Value:=edtPassword.Text;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[5].Name:='User';
      qKoristuvachi.Params[5].Value:=PIB;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[6].Name:='RECORD_ID';
      qKoristuvachi.Params[6].Value:=edtRecord_ID.Text;
      qKoristuvachi.Open;
      frmMain.trAzz.CommitRetaining;
      frmKoristuvachiEdit.Close;
      aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmKoristuvachiEdit.Caption='Додавання користувача' then
  begin
    if frmKoristuvachiEdit.edtLogin.Text='' then
    begin
      frmKoristuvachiEdit.edtLogin.Text:='';
      frmKoristuvachiEdit.edtLogin.SetFocus;
      exit;
    end;
    frmKoristuvachiEdit.qUpdate.SQL.Clear;
    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from USERS,RAJONI where RAJONI.RAJON=:District and USERS.DISTRICT=RAJONI.KOD order by USERS.LOGIN';
    frmKoristuvachiEdit.qUpdate.Params.Clear;
    frmKoristuvachiEdit.qUpdate.Params.Add;
    frmKoristuvachiEdit.qUpdate.Params[0].Name:='District';
    frmKoristuvachiEdit.qUpdate.Params[0].Value:=edtDistrict.Text;
//    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from USERS,RAJONI where RAJONI.RAJON='''+edtDistrict.Text+''' and USERS.DISTRICT=RAJONI.KOD order by USERS.LOGIN';
    frmKoristuvachiEdit.qUpdate.Open;
    if frmKoristuvachiEdit.qUpdate.Locate('LOGIN',frmKoristuvachiEdit.edtLogin.Text,[]) then
    begin
      frmKoristuvachiEdit.edtLogin.Text:='';
      frmKoristuvachiEdit.edtLogin.SetFocus;
      exit;
    end;
    if (frmKoristuvachiEdit.edtPassword.Text='')or(frmKoristuvachiEdit.edtPasswordConfirm.Text='') then
    begin
      frmKoristuvachiEdit.edtPassword.Text:='';
      frmKoristuvachiEdit.edtPasswordConfirm.Text:='';
      frmKoristuvachiEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmKoristuvachiEdit.edtPassword.Text<>frmKoristuvachiEdit.edtPasswordConfirm.Text then
    begin
      frmKoristuvachiEdit.edtPassword.Text:='';
      frmKoristuvachiEdit.edtPasswordConfirm.Text:='';
      frmKoristuvachiEdit.edtPassword.SetFocus;
      exit;
    end;
    if frmKoristuvachiEdit.cbPIB.Text='' then
    begin
      frmKoristuvachiEdit.aPIB_UpdateExecute(sender);
      frmKoristuvachiEdit.cbPIB.SetFocus;
      exit;
    end;
    frmKoristuvachiEdit.qUpdate.SQL.Clear;
    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:District and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
    frmKoristuvachiEdit.qUpdate.Params.Clear;
    frmKoristuvachiEdit.qUpdate.Params.Add;
    frmKoristuvachiEdit.qUpdate.Params[0].Name:='District';
    frmKoristuvachiEdit.qUpdate.Params[0].Value:=edtDistrict.Text;
//    frmKoristuvachiEdit.qUpdate.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON='''+edtDistrict.Text+''' and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
    frmKoristuvachiEdit.qUpdate.Open;
    if not frmKoristuvachiEdit.qUpdate.Locate('PRIZVISXHE',frmKoristuvachiEdit.cbPIB.Text,[]) then
    begin
      frmKoristuvachiEdit.aPIB_UpdateExecute(sender);
      frmKoristuvachiEdit.cbPIB.SetFocus;
      exit;
    end;
    with frmKoristuvachiEdit do
    begin
      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=edtMinistry.Text;
      qUpdate.Open;
      if qUpdate.Locate('MINISTRY',edtMinistry.Text,[]) then Ministry:=qUpdate.FieldByName('KOD').Value else Ministry:=0;

      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=Ministry;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Teritory';
      qUpdate.Params[1].Value:=edtTeritory.Text;
      qUpdate.Open;
      if qUpdate.Locate('TERITORY',edtTeritory.Text,[]) then Teritory:=qUpdate.FieldByName('KOD').Value else Teritory:=0;


      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:District order by RAJON';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=Ministry;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Teritory';
      qUpdate.Params[1].Value:=Teritory;
      qUpdate.Params.Add;
      qUpdate.Params[2].Name:='District';
      qUpdate.Params[2].Value:=edtDistrict.Text;
      qUpdate.Open;
      if qUpdate.Locate('RAJON',edtDistrict.Text,[]) then District:=qUpdate.FieldByName('KOD').Value else District:=0;

      qUpdate.SQL.Clear;
      qUpdate.SQL.Text:='select * from SPIVROBITNIKI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:District and PRIZVISXHE=:PIB';
      qUpdate.Params.Clear;
      qUpdate.Params.Add;
      qUpdate.Params[0].Name:='Ministry';
      qUpdate.Params[0].Value:=Ministry;
      qUpdate.Params.Add;
      qUpdate.Params[1].Name:='Teritory';
      qUpdate.Params[1].Value:=Teritory;
      qUpdate.Params.Add;
      qUpdate.Params[2].Name:='District';
      qUpdate.Params[2].Value:=District;
      qUpdate.Params.Add;
      qUpdate.Params[3].Name:='PIB';
      qUpdate.Params[3].Value:=cbPIB.Text;
      qUpdate.Open;
      if qUpdate.Locate('PRIZVISXHE',cbPIB.Text,[]) then PIB:=qUpdate.FieldByName('KODSPIVROBITNIKA').Value else PIB:=0;
    end;

    with frmKoristuvachi do
    begin
      qKoristuvachi.SQL.Clear;
      qKoristuvachi.SQL.Text:='update USERS set MINISTRY=:Ministry, TERITORY=:Teritory,DISTRICT=:District,LOGIN=:Login,PASSWD=:Password,USERKOD=:User where RECORD_ID=:RECORD_ID';
      qKoristuvachi.Params.Clear;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[0].Name:='Ministry';
      qKoristuvachi.Params[0].Value:=Ministry;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[1].Name:='Teritory';
      qKoristuvachi.Params[1].Value:=Teritory;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[2].Name:='District';
      qKoristuvachi.Params[2].Value:=District;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[3].Name:='Login';
      qKoristuvachi.Params[3].Value:=edtLogin.Text;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[4].Name:='Password';
      qKoristuvachi.Params[4].Value:=edtPassword.Text;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[5].Name:='User';
      qKoristuvachi.Params[5].Value:=PIB;
      qKoristuvachi.Params.Add;
      qKoristuvachi.Params[6].Name:='RECORD_ID';
      qKoristuvachi.Params[6].Value:=edtRecord_ID.Text;
      qKoristuvachi.Open;
      frmMain.trAzz.CommitRetaining;
      frmKoristuvachiEdit.Close;
      aUpdateExecute(sender);
      exit;
    end;
  end;
end;

procedure TfrmKoristuvachiEdit.aCancelExecute(Sender: TObject);
begin
  frmKoristuvachiEdit.Close;
end;

procedure TfrmKoristuvachiEdit.aPIB_ChoiceExecute(Sender: TObject);
begin
  frmKoristuvachiEdit.Enabled:=false;
  frmMain.aSpivrobitnikiExecute(sender);
  frmSpivrobitniki.aChoice.Enabled:=true;
  frmSpivrobitniki.Left:=frmMain.Left+70;
  frmSpivrobitniki.Top:=frmMain.Top+70;
  frmSpivrobitniki.Width:=frmMain.Width-70;
  frmSpivrobitniki.Height:=frmMain.Height-70;
  frmSpivrobitniki.Position:=poMainFormCenter;
  frmSpivrobitniki.FormStyle:=fsNormal;
  frmSpivrobitniki.BorderStyle:=bsDialog;
end;

end.
