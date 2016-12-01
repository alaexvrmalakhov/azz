unit NapravlennyEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, SysUtils, Dialogs;

type
  TfrmNapravlennyEdit = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    edtPIB_Otrimuvacha: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label1: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    alNapravlennyEdit: TActionList;
    aKodUpdate: TAction;
    cbPosadaOtrimuvacha: TComboBox;
    btnPosadaOtrimuvacha_Update: TButton;
    btnPosadaOtrimuvacha_Choice: TButton;
    aPosadaOtrimuvacha_Update: TAction;
    aPosadaOtrimuvacha_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    qUpdates: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aPosadaOtrimuvacha_ChoiceExecute(Sender: TObject);
    procedure aPosadaOtrimuvacha_UpdateExecute(Sender: TObject);
  end;

var
  frmNapravlennyEdit: TfrmNapravlennyEdit;

implementation

uses
  Main, NapravlenoDoVidoma, Napravlenny, Posadi;

{$R *.dfm}

procedure TfrmNapravlennyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір отримувача' then
    begin
      frmViddilenny.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmViddilenny.Close;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
  begin
    frmNapravlenoDoVidoma.Enabled:=true;
    if frmNapravlennyEdit.Caption<>'Вибір отримувача' then
    begin
      frmNapravlenny.Enabled:=true;
      frmNapravlenoDoVidoma.Enabled:=false;
    end
    else
      frmNapravlenny.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmNapravlennyEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmNapravlenny do
  begin
    qNapravlenny.SQL.Clear;
    qNapravlenny.SQL.Text:='insert into NAPRAVLENNY (KODNAPRAVLENNY) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qNapravlenny.Open;
    qNapravlenny.SQL.Clear;
    qNapravlenny.SQL.Text:='select * from NAPRAVLENNY order by KODNAPRAVLENNY';
    qNapravlenny.Open;
    qNapravlenny.Last;
    frmNapravlennyEdit.edtKod.Text:=IntToStr(qNapravlenny.FieldByName('KODNAPRAVLENNY').Value);
  end;
end;

procedure TfrmNapravlennyEdit.aCancelExecute(Sender: TObject);
begin
  frmNapravlennyEdit.Close;
end;

procedure TfrmNapravlennyEdit.aOKExecute(Sender: TObject);
begin
  if frmNapravlennyEdit.Caption='Вибір отримувача' then
  begin
    if frmMain.IsFormOpen('frmNapravlenoDoVidoma') then
    begin
      frmNapravlenoDoVidoma.cbPIB_Otrimuvacha.Text:=frmNapravlennyEdit.edtPIB_Otrimuvacha.Text;
      frmNapravlenoDoVidoma.cbPosadaOtrimuvacha.Text:=frmNapravlennyEdit.cbPosadaOtrimuvacha.Text;
      frmNapravlennyEdit.Close;
      frmNapravlenny.Close;
      exit;
    end;
  end;

  if frmNapravlennyEdit.Caption='Видалення отримувача' then
  begin
    if MessageDlg('Увага!!!'+#13+'Відновлення цього запису буде неможливе!!!'+#13+'Видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmNapravlenny do
      begin
        qNapravlenny.SQL.Clear;
        qNapravlenny.SQL.Text:='delete from NAPRAVLENNY where KODNAPRAVLENNY=:Kod';
        qNapravlenny.Params.Clear;
        qNapravlenny.Params.Add;
        qNapravlenny.Params[0].Name:='Kod';
        qNapravlenny.Params[0].Value:=frmNapravlennyEdit.edtKod.Text;
        qNapravlenny.Open;
        frmMain.trAzz.CommitRetaining;
      end;
    end;
    frmNapravlennyEdit.Close;
    frmNapravlenny.aUpdateExecute(sender);
    exit;
  end;

  if frmNapravlennyEdit.Caption='Редагування отримувача' then
  begin
    if frmNapravlennyEdit.edtKod.Text='' then
    begin
      frmNapravlennyEdit.aKodUpdateExecute(sender);
      frmNapravlennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmNapravlennyEdit.edtKod.Text);
    except
      frmNapravlennyEdit.aKodUpdateExecute(sender);
      frmNapravlennyEdit.edtKod.SetFocus;
      exit;
    end;
    if frmNapravlennyEdit.edtPIB_Otrimuvacha.Text='' then
    begin
      frmNapravlennyEdit.edtPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    if frmNapravlennyEdit.cbPosadaOtrimuvacha.Text='' then
    begin
      frmNapravlennyEdit.cbPosadaOtrimuvacha.SetFocus;
      exit;
    end;

    with frmNapravlenny do
    begin
      qNapravlenny.SQL.Clear;
      qNapravlenny.SQL.Text:='update NAPRAVLENNY set PIB=:PIB,POSADA=:Posada where KODNAPRAVLENNY=:Kod';
      qNapravlenny.Params.Clear;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[0].Name:='PIB';
      qNapravlenny.Params[0].Value:=frmNapravlennyEdit.edtPIB_Otrimuvacha.Text;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[1].Name:='Posada';
      qNapravlenny.Params[1].Value:=frmNapravlennyEdit.cbPosadaOtrimuvacha.Text;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[2].Name:='Kod';
      qNapravlenny.Params[2].Value:=frmNapravlennyEdit.edtKod.Text;
      qNapravlenny.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmNapravlennyEdit.Close;
    frmNapravlenny.aUpdateExecute(sender);
    exit;
  end;

  if frmNapravlennyEdit.Caption='Додавання отримувача' then
  begin
    if frmNapravlennyEdit.edtKod.Text='' then
    begin
      frmNapravlennyEdit.aKodUpdateExecute(sender);
      frmNapravlennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmNapravlennyEdit.edtKod.Text);
    except
      frmNapravlennyEdit.aKodUpdateExecute(sender);
      frmNapravlennyEdit.edtKod.SetFocus;
      exit;
    end;
    if frmNapravlennyEdit.edtPIB_Otrimuvacha.Text='' then
    begin
      frmNapravlennyEdit.edtPIB_Otrimuvacha.SetFocus;
      exit;
    end;
    if frmNapravlennyEdit.cbPosadaOtrimuvacha.Text='' then
    begin
      frmNapravlennyEdit.cbPosadaOtrimuvacha.SetFocus;
      exit;
    end;

    with frmNapravlenny do
    begin
      qNapravlenny.SQL.Clear;
      qNapravlenny.SQL.Text:='update NAPRAVLENNY set PIB=:PIB,POSADA=:Posada where KODNAPRAVLENNY=:Kod';
      qNapravlenny.Params.Clear;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[0].Name:='PIB';
      qNapravlenny.Params[0].Value:=frmNapravlennyEdit.edtPIB_Otrimuvacha.Text;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[1].Name:='Posada';
      qNapravlenny.Params[1].Value:=frmNapravlennyEdit.cbPosadaOtrimuvacha.Text;
      qNapravlenny.Params.Add;
      qNapravlenny.Params[2].Name:='Kod';
      qNapravlenny.Params[2].Value:=frmNapravlennyEdit.edtKod.Text;
      qNapravlenny.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmNapravlennyEdit.Close;
    frmNapravlenny.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmNapravlennyEdit.aPosadaOtrimuvacha_ChoiceExecute(
  Sender: TObject);
begin
  frmNapravlennyEdit.Enabled:=false;
  frmMain.aPosadiExecute(sender);
  frmPosadi.aChoice.Enabled:=true;
  frmPosadi.Left:=frmMain.Left+70;
  frmPosadi.Top:=frmMain.Top+70;
  frmPosadi.Width:=frmMain.Width-70;
  frmPosadi.Height:=frmMain.Height-70;
  frmPosadi.Position:=poMainFormCenter;
  frmPosadi.FormStyle:=fsNormal;
  frmPosadi.BorderStyle:=bsDialog;
end;

procedure TfrmNapravlennyEdit.aPosadaOtrimuvacha_UpdateExecute(
  Sender: TObject);
begin
  with frmNapravlennyEdit do
  begin
    qUpdates.SQL.Clear;
    qUpdates.SQL.Text:='select * from POSADI order by NAZVAPOSADI';
    qUpdates.Open;
    cbPosadaOtrimuvacha.Text:='';
    cbPosadaOtrimuvacha.Items.Clear;
    qUpdates.First;
    while not qUpdates.Eof do
    begin
      if not qUpdates.FieldByName('NAZVAPOSADI').IsNull then cbPosadaOtrimuvacha.Items.Add(qUpdates.FieldByName('NAZVAPOSADI').Value);
      qUpdates.Next;
    end;
  end;
end;

end.
