unit LaboratorniDoslidzhennyEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmLaboratorniDoslidzhennyEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodTipuDoslidzhenny: TEdit;
    edtTipDoslidzhenny: TEdit;                 
    btnVikonati: TButton;
    btnVidminiti: TButton;
    btnKodTipuDoslidzhenny: TButton;
    alLaboratorniDoslidzhennyEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmLaboratorniDoslidzhennyEdit: TfrmLaboratorniDoslidzhennyEdit;

implementation

uses
  Main, LaboratornijKontrol, LaboratorniDoslidzhenny;

{$R *.dfm}

procedure TfrmLaboratorniDoslidzhennyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір типу досліджень' then
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
  if frmMain.IsFormOpen('frmLaboratornijKontrol') then
  begin
    frmLaboratornijKontrol.Enabled:=true;
    frmMain.Enabled:=false;
    if frmLaboratorniDoslidzhennyEdit.Caption<>'Вибір типу досліджень' then
    begin
      frmLaboratorniDoslidzhenny.Enabled:=true;
      frmLaboratornijKontrol.Enabled:=false;
    end
    else
      frmLaboratorniDoslidzhenny.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree
end;

procedure TfrmLaboratorniDoslidzhennyEdit.aKodUpdateExecute(
  Sender: TObject);
begin
  with frmLaboratorniDoslidzhenny do
  begin
    qLaboratorniDoslidzhenny.SQL.Clear;
    qLaboratorniDoslidzhenny.SQL.Text:='insert into LABORATORNIDOSLIDZHENNY (KODTIPUDOSLIDZHENNY) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qLaboratorniDoslidzhenny.Open;
    qLaboratorniDoslidzhenny.SQL.Clear;
    qLaboratorniDoslidzhenny.SQL.Text:='select * from LABORATORNIDOSLIDZHENNY order by KODTIPUDOSLIDZHENNY';
    qLaboratorniDoslidzhenny.Open;
    qLaboratorniDoslidzhenny.Last;
    frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text:=IntToStr(qLaboratorniDoslidzhenny.FieldByName('KODTIPUDOSLIDZHENNY').Value);
  end;
end;

procedure TfrmLaboratorniDoslidzhennyEdit.aOKExecute(Sender: TObject);
begin
  if frmLaboratorniDoslidzhennyEdit.Caption='Вибір типу досліджень' then
  begin
    if frmMain.IsFormOpen('frmLaboratornijKontrol') then
    begin
      frmLaboratornijKontrol.cbVidKontrolu.Text:=frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text;
      frmLaboratorniDoslidzhennyEdit.Close;
      frmLaboratorniDoslidzhenny.Close;
      exit;
    end;
  end;

  if frmLaboratorniDoslidzhennyEdit.Caption='Видалення типу досліджень' then
  begin
    if MessageDlg('Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно бажаєти видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.SQL.Clear;
      frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.SQL.Text:='delete from LABORATORNIDOSLIDZHENNY where KODTIPUDOSLIDZHENNY='+frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text;
      frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Open;
      frmMain.trAzz.CommitRetaining;

      frmLaboratorniDoslidzhennyEdit.Close;
      frmLaboratorniDoslidzhenny.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmLaboratorniDoslidzhennyEdit.Caption='Редагування типу досліджень' then
  begin
    if frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text='' then
    begin
      frmLaboratorniDoslidzhennyEdit.aKodUpdateExecute(sender);
      frmLaboratorniDoslidzhennyEdit.SetFocus;
      exit;
    end;
    try
      StrToInt(frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text);
    except
      frmLaboratorniDoslidzhennyEdit.aKodUpdateExecute(sender);
      frmLaboratorniDoslidzhennyEdit.SetFocus;
      exit;
    end;
    if frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text='' then
    begin
      frmLaboratorniDoslidzhenny.SetFocus;
      exit;
    end;

    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.SQL.Clear;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.SQL.Text:='update LABORATORNIDOSLIDZHENNY set TIPDOSLIDZHENNY=:Tip where KODTIPUDOSLIDZHENNY=:Kod';
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params.Clear;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params.Add;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[0].Name:='Tip';
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[0].Value:=frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params.Add;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[1].Name:='Kod';
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[1].Value:=frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Open;
    frmMain.trAzz.CommitRetaining;
    frmLaboratorniDoslidzhennyEdit.Close;
    frmLaboratorniDoslidzhenny.aUpdateExecute(sender);
    exit;
  end;

  if frmLaboratorniDoslidzhennyEdit.Caption='Додавання типу досліджень' then
  begin
    if frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text='' then
    begin
      frmLaboratorniDoslidzhennyEdit.aKodUpdateExecute(sender);
      frmLaboratorniDoslidzhennyEdit.SetFocus;
      exit;
    end;
    try
      StrToInt(frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text);
    except
      frmLaboratorniDoslidzhennyEdit.aKodUpdateExecute(sender);
      frmLaboratorniDoslidzhennyEdit.SetFocus;
      exit;
    end;
    if frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text='' then
    begin
      frmLaboratorniDoslidzhenny.SetFocus;
      exit;
    end;

    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.SQL.Clear;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.SQL.Text:='update LABORATORNIDOSLIDZHENNY set TIPDOSLIDZHENNY=:Tip where KODTIPUDOSLIDZHENNY=:Kod';
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params.Clear;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params.Add;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[0].Name:='Tip';
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[0].Value:=frmLaboratorniDoslidzhennyEdit.edtTipDoslidzhenny.Text;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params.Add;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[1].Name:='Kod';
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Params[1].Value:=frmLaboratorniDoslidzhennyEdit.edtKodTipuDoslidzhenny.Text;
    frmLaboratorniDoslidzhenny.qLaboratorniDoslidzhenny.Open;
    frmMain.trAzz.CommitRetaining;
    frmLaboratorniDoslidzhennyEdit.Close;
    frmLaboratorniDoslidzhenny.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmLaboratorniDoslidzhennyEdit.aCancelExecute(Sender: TObject);
begin
  frmLaboratorniDoslidzhennyEdit.Close;
end;

end.
