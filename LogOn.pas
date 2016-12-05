unit LogOn;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs, DB,
  IBCustomDataSet, IBQuery;

type
  TfrmLogOn = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUser_Name: TEdit;
    edtPassword: TEdit;
    btnConnect: TButton;
    btnClose: TButton;
    Label3: TLabel;
    edtServer: TEdit;
    alLogOn: TActionList;
    aCancel: TAction;
    aOK: TAction;
    qUser: TIBQuery;
    dsUser: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

const
  clWindow=$FFFFFF;
  clError=$008080FF;
  clCorrect=$0080FF80;

var
  frmLogOn: TfrmLogOn;

implementation

uses
  Main, NalashnuvannySistemi;

{$R *.dfm}

procedure TfrmLogOn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmLogOn.aOKExecute(Sender: TObject);
var
  MandatoryFields: boolean;
begin
  MandatoryFields:=false;
  with frmLogOn do
  begin
    edtServer.Color:=clWindow;
    edtUser_Name.Color:=clWindow;
    edtPassword.Color:=clWindow;

    if edtPassword.Text='' then
    begin
      MandatoryFields:=true;
      edtPassword.Text:='';
      edtPassword.Color:=clError;
    end
    else
      edtPassword.Color:=clCorrect;
    if edtUser_Name.Text='' then
    begin
      MandatoryFields:=true;
      edtUser_Name.Text:='';
      edtUser_Name.Color:=clError;
    end
    else
      edtUser_Name.Color:=clCorrect;
    if edtServer.Text='' then
    begin
      MandatoryFields:=true;
      edtServer.Text:='';
      edtServer.Color:=clError;
    end
    else
      edtServer.Color:=clCorrect;
    if MandatoryFields then
    begin
      edtServer.SetFocus;
      ShowMessage('Заповніть обов"язкові поля!');
      Exit;
    end;
  end;

  if frmMain.IsFormOpen('frmNalashnuvannySistemi') then
  begin
    frmNalashnuvannySistemi.Enabled:=True;
    frmNalashnuvannySistemi.Close;
  end;
  try
    frmMain.dbAzz.DatabaseName:=frmLogOn.edtServer.Text;
    frmMain.dbAzz.Connected:=true;
    frmMain.trAzz.Active:=true;
  except
    frmLogOn.edtServer.Color:=clError;
    ShowMessage('Не вірний щлях до сервера ДБ.'+#13+'Зверніться до адміністратора для корректного налаштування!');
    Exit;
  end;

  frmMain.dbAzz.DatabaseName:=frmLogOn.edtServer.Text;
  frmMain.dbAzz.Connected:=true;
  frmMain.trAzz.Active:=true;
  with frmLogOn do
  begin
        //Проверка базы данных в.2.0.3.4:
    //добавлено поле ID_POSTANOVI в таблицу LABORATORNIJKONTROL
    try
      with frmLogOn.qUser do
      begin
        SQL.Clear;
        SQL.Text:='insert into LABORATORNIJKONTROL (KOD, ID_POSTANOVI) values (gen_id(GET_DICTIONARIES_RECORD_ID,1), (gen_id(GET_DICTIONARIES_RECORD_ID,1)))';
        {qTemp.SQL.Text:='insert into TIPISHTRAFIV (KODTIPUSHTRAFIV) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';}
        SQL.Text:=SQL.Text+'';
        Open;
      end;
      frmMain.trAzz.RollbackRetaining;
    except
{
     ALTER TABLE LABORATORNIJKONTROL
     ADD ID_POSTANOVI INTEGER
}
      frmMain.trAzz.RollbackRetaining;
      with frmLogOn.qUser do
      begin
        SQL.Clear;
        SQL.Text:='ALTER TABLE LABORATORNIJKONTROL';
        SQL.Text:=SQL.Text+'ADD ID_POSTANOVI INTEGER';
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
    end;
  end;

  with qUser do
    begin
      SQL.Clear;
      SQL.Text:='select * from USERS where LOGIN=:login and PASSWD=:pass';
      Params.Clear;
      Params.Add;
      Params[0].Name:='login';
      Params[0].Value:=frmLogOn.edtUser_Name.Text;
      Params.Add;
      Params[1].Name:='pass';
      Params[1].Value:=frmLogOn.edtPassword.Text;
      Open;
    end;
    if qUser.RecordCount>0 then
    begin
      if (qUser.FieldByName('LOGIN').AsString=frmLogOn.edtUser_Name.Text)and(qUser.FieldByName('PASSWD').AsString=frmLogOn.edtPassword.Text) then
      begin
        frmMain.StatusBar.Panels[1].Text:=TimeToStr(Time);
        frmMain.StatusBar.Panels[2].Text:=DateToStr(Date);
        frmMain.StatusBar.Panels[3].Text:=frmLogOn.edtUser_Name.Text;
        frmLogOn.Close;
        Exit;
      end
      else
      begin
        edtPassword.Text:='';
        edtPassword.Color:=clError;
        edtUser_Name.Text:='';
        edtUser_Name.Color:=clError;
        edtUser_Name.SetFocus;
        ShowMessage('Користувача не знайдено!');
        Exit;
      end;
    end
    else
    begin
      edtPassword.Text:='';
      edtPassword.Color:=clError;
      edtUser_Name.Text:='';
      edtUser_Name.Color:=clError;
      edtUser_Name.SetFocus;
      ShowMessage('Користувача не знайдено!');
      Exit;
    end;
end;

procedure TfrmLogOn.aCancelExecute(Sender: TObject);
begin
  frmLogOn.Close;
  frmMain.Close;
end;

procedure TfrmLogOn.FormActivate(Sender: TObject);
begin
  with frmLogOn do
  begin
    edtServer.Color:=clWindow;
    edtUser_Name.Color:=clWindow;
    edtPassword.Color:=clWindow;
  end;
end;

end.
