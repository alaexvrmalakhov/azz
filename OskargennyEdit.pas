unit OskargennyEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, Dialogs, SysUtils;

type
  TfrmOskargennyEdit = class(TForm)
    Label1: TLabel;
    edtOskargenny: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label3: TLabel;
    cbVidalenny: TCheckBox;
    Label2: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    alRezultatOskarzhennyEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbVidalennyClick(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmOskargennyEdit: TfrmOskargennyEdit;

implementation

uses
  Main, Oskarzhenny, Oskargenny;

{$R *.dfm}

procedure TfrmOskargennyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір результату оскарження' then
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
  if frmMain.IsFormOpen('frmOskarzhenny') then
  begin
    frmMain.Enabled:=false;
    frmOskarzhenny.Enabled:=true;
    if frmOskargennyEdit.Caption<>'Вибір результату оскарження' then
    begin
      frmOskargenny.Enabled:=true;
      frmOskarzhenny.Enabled:=false;
    end
    else
      frmOskargenny.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOskargennyEdit.cbVidalennyClick(Sender: TObject);
begin
  if frmOskargennyEdit.cbVidalenny.Checked then cbVidalenny.Caption:='Так' else cbVidalenny.Caption:='Ні';
end;

procedure TfrmOskargennyEdit.aOKExecute(Sender: TObject);
begin
  if frmOskargennyEdit.Caption='Вибір результату оскарження' then
  begin
//    if frmMain.IsFormOpen('frmZvyzok') then
//    begin
//      if frmZvyzok.ActiveControl=frmZvyzok.btnVidmineno_Choice then frmZvyzok.cbVidmineno.Text:=frmOskargennyEdit.edtOskargenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnNaNovijRozglyd_Choice then frmZvyzok.cbNaNovijRozglyd.Text:=frmOskargennyEdit.edtOskargenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnZalishenoVSili_Choice then frmZvyzok.cbZalishenoVSili.Text:=frmOskargennyEdit.edtOskargenny.Text;
//      frmOskargennyEdit.Close;
//      frmOskargenny.Close;
//      exit;
//    end;

    if frmMain.IsFormOpen('frmOskarzhenny') then
    begin
      frmOskarzhenny.cbRezultatOskarzhenny.Text:=frmOskargennyEdit.edtOskargenny.Text;
      frmOskargennyEdit.Close;
      frmOskargenny.Close;
      exit;
    end;
  end;

  if frmOskargennyEdit.Caption='Видалення результату оскарження' then
  begin
    if MessageDlg('Видалення цього запису може відобразитись на інших данних!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmOskargenny.qRezultatOskarzhenny.SQL.Clear;
      frmOskargenny.qRezultatOskarzhenny.SQL.Text:='delete from OSKARZHENNY where KOD=:Kod';
      frmOskargenny.qRezultatOskarzhenny.Params.Clear;
      frmOskargenny.qRezultatOskarzhenny.Params.Add;
      frmOskargenny.qRezultatOskarzhenny.Params[0].Name:='Kod';
      frmOskargenny.qRezultatOskarzhenny.Params[0].Value:=frmOskargennyEdit.edtKod.Text;
      frmOskargenny.qRezultatOskarzhenny.Open;
      frmMain.trAzz.CommitRetaining;
    end;
    frmOskargennyEdit.Close;
    frmOskargenny.aUpdateExecute(sender);
    exit;
  end;

  if frmOskargennyEdit.Caption='Редагування результату оскарження' then
  begin
    if frmOskargennyEdit.edtKod.Text='' then
    begin
      frmOskargennyEdit.aKodUpdateExecute(sender);
      frmOskargennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmOskargennyEdit.edtKod.Text);
    except
      frmOskargennyEdit.aKodUpdateExecute(sender);
      frmOskargennyEdit.edtKod.SetFocus;
      exit;
    end;
    if frmOskargennyEdit.edtOskargenny.Text='' then
    begin
      frmOskargennyEdit.edtOskargenny.SetFocus;
      exit;
    end;

    frmOskargenny.qRezultatOskarzhenny.SQL.Clear;
    frmOskargenny.qRezultatOskarzhenny.SQL.Text:='update OSKARZHENNY set OSKARZHENNY=:OSKARZHENNY,UDALENIE=:UDALENIE where KOD=:KOD';
    frmOskargenny.qRezultatOskarzhenny.Params.Clear;
    frmOskargenny.qRezultatOskarzhenny.Params.Add;
    frmOskargenny.qRezultatOskarzhenny.Params[0].Name:='OSKARZHENNY';
    frmOskargenny.qRezultatOskarzhenny.Params[0].Value:=frmOskargennyEdit.edtOskargenny.Text;
    frmOskargenny.qRezultatOskarzhenny.Params.Add;
    frmOskargenny.qRezultatOskarzhenny.Params[1].Name:='UDALENIE';
    if frmOskargennyEdit.cbVidalenny.Checked then
      frmOskargenny.qRezultatOskarzhenny.Params[1].Value:=1 else frmOskargenny.qRezultatOskarzhenny.Params[1].Value:=0;
    frmOskargenny.qRezultatOskarzhenny.Params.Add;
    frmOskargenny.qRezultatOskarzhenny.Params[2].Name:='KOD';
    frmOskargenny.qRezultatOskarzhenny.Params[2].Value:=frmOskargennyEdit.edtKod.Text;
    frmOskargenny.qRezultatOskarzhenny.Open;
    frmMain.trAzz.CommitRetaining;
    frmOskargennyEdit.Close;
    frmOskargenny.aUpdateExecute(sender);
    exit;
  end;

  if frmOskargennyEdit.Caption='Додавання результату оскарження' then
  begin
    if frmOskargennyEdit.edtKod.Text='' then
    begin
      frmOskargennyEdit.aKodUpdateExecute(sender);
      frmOskargennyEdit.edtKod.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmOskargennyEdit.edtKod.Text);
    except
      frmOskargennyEdit.aKodUpdateExecute(sender);
      frmOskargennyEdit.edtKod.SetFocus;
      exit;
    end;
    if frmOskargennyEdit.edtOskargenny.Text='' then
    begin
      frmOskargennyEdit.edtOskargenny.SetFocus;
      exit;
    end;

    frmOskargenny.qRezultatOskarzhenny.SQL.Clear;
    frmOskargenny.qRezultatOskarzhenny.SQL.Text:='update OSKARZHENNY set OSKARZHENNY=:OSKARZHENNY,UDALENIE=:UDALENIE where KOD=:KOD';
    frmOskargenny.qRezultatOskarzhenny.Params.Clear;
    frmOskargenny.qRezultatOskarzhenny.Params.Add;
    frmOskargenny.qRezultatOskarzhenny.Params[0].Name:='OSKARZHENNY';
    frmOskargenny.qRezultatOskarzhenny.Params[0].Value:=frmOskargennyEdit.edtOskargenny.Text;
    frmOskargenny.qRezultatOskarzhenny.Params.Add;
    frmOskargenny.qRezultatOskarzhenny.Params[1].Name:='UDALENIE';
    if frmOskargennyEdit.cbVidalenny.Checked then
      frmOskargenny.qRezultatOskarzhenny.Params[1].Value:=1 else frmOskargenny.qRezultatOskarzhenny.Params[1].Value:=0;
    frmOskargenny.qRezultatOskarzhenny.Params.Add;
    frmOskargenny.qRezultatOskarzhenny.Params[2].Name:='KOD';
    frmOskargenny.qRezultatOskarzhenny.Params[2].Value:=frmOskargennyEdit.edtKod.Text;
    frmOskargenny.qRezultatOskarzhenny.Open;
    frmMain.trAzz.CommitRetaining;
    frmOskargennyEdit.Close;
    frmOskargenny.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmOskargennyEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmOskargenny do
  begin
    qRezultatOskarzhenny.SQL.Clear;
    qRezultatOskarzhenny.SQL.Text:='insert into OSKARZHENNY (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qRezultatOskarzhenny.Open;
    qRezultatOskarzhenny.SQL.Clear;
    qRezultatOskarzhenny.SQL.Text:='select * from OSKARZHENNY order by KOD';
    qRezultatOskarzhenny.Open;
    qRezultatOskarzhenny.Last;
    frmOskargennyEdit.edtKod.Text:=IntToStr(qRezultatOskarzhenny.FieldByName('KOD').Value);
  end;
end;

procedure TfrmOskargennyEdit.aCancelExecute(Sender: TObject);
begin
  frmOskargennyEdit.Close;
end;

end.
