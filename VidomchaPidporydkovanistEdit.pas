unit VidomchaPidporydkovanistEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmVidomchaPidporydkovanistEdit = class(TForm)
    Label1: TLabel;
    edtKodVidomstva: TEdit;
    Label2: TLabel;
    edtVidomstvo: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    btnKodVidomstva: TButton;
    alVidomchaPidporydkovanistEdit: TActionList;
    aKodUpdate: TAction;
    aCancel: TAction;
    aOK: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmVidomchaPidporydkovanistEdit: TfrmVidomchaPidporydkovanistEdit;

implementation

uses
  Main, VidomchaPidporydkovanist, FinansoviSankciiEdit,
  ViluchennyZRealizaciiEdit, AdminZapobizhZahodiEdit, ShtrafiEdit,
  ObjektiEdit;

{$R *.dfm}

procedure TfrmVidomchaPidporydkovanistEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'Вибір відомства' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'Вибір відомства' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmObjektiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    frmMain.Enabled:=false;
    if frmVidomchaPidporydkovanist.BorderStyle=bsDialog then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmObjektiEdit.Enabled:=false;
    end;
//    if frmVidomchaPidporydkovanistEdit.Caption<>'Вибір відомства' then
//    begin
//      frmVidomchaPidporydkovanist.Enabled:=true;
//      frmObjektiEdit.Enabled:=false;
//    end
//    else
//      frmVidomchaPidporydkovanist.Close;
    Action:=caFree;
    exit;
  end;
{
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanistEdit.Caption<>'Вибір відомства' then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmVidomchaPidporydkovanist.Enabled:=true;
    if frmVidomchaPidporydkovanist.BorderStyle=bsDialog then
    begin
      frmVidomchaPidporydkovanist.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end;
//    if frmVidomchaPidporydkovanistEdit.Caption<>'Вибір відомства' then
//    begin
//      frmVidomchaPidporydkovanist.Enabled:=true;
//      frmShtrafiEdit.Enabled:=false;
//    end
//    else
//      frmVidomchaPidporydkovanist.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidomchaPidporydkovanistEdit.aKodUpdateExecute(
  Sender: TObject);
begin
  with frmVidomchaPidporydkovanist do
  begin
    edtFind.Text:='';
    qUpdate.SQL.Clear;
    qUpdate.SQL.Text:='insert into VIDOMCHAPIDPORYDKOVANIST (KODVIDOMSTVA) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qUpdate.Open;
    qUpdate.SQL.Clear;
    qUpdate.SQL.Text:='select * from VIDOMCHAPIDPORYDKOVANIST order by KODVIDOMSTVA';
    qUpdate.Open;
    qUpdate.Last;
    frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text:=IntToStr(qUpdate.FieldByName('KODVIDOMSTVA').Value);
  end;
end;

procedure TfrmVidomchaPidporydkovanistEdit.aCancelExecute(Sender: TObject);
begin
  frmVidomchaPidporydkovanistEdit.Close;
end;

procedure TfrmVidomchaPidporydkovanistEdit.aOKExecute(Sender: TObject);
begin
  if frmVidomchaPidporydkovanistEdit.Caption='Вибір відомства' then
  begin
{
    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;
}
    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmObjektiEdit') then
    begin
      frmObjektiEdit.edtVidomchaPidporydkovanist.Text:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      frmVidomchaPidporydkovanistEdit.Close;
      frmVidomchaPidporydkovanist.Close;
      exit;
    end;
  end;

  if frmVidomchaPidporydkovanistEdit.Caption='Видалення відомства' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Відновлення запису буде неможливе!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmVidomchaPidporydkovanist.qUpdate do
      begin
        SQL.Clear;
        SQL.Text:='delete from VIDOMCHAPIDPORYDKOVANIST where KODVIDOMSTVA=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text;
        Open;
      end;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidomchaPidporydkovanist.aUpdateExecute(sender);
    frmVidomchaPidporydkovanistEdit.Close;
    exit;
  end;

  if frmVidomchaPidporydkovanistEdit.Caption='Редагування відомства' then
  begin
    if frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text);
    except
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    if frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    with frmVidomchaPidporydkovanist.qUpdate do
    begin
      SQL.Clear;
      SQL.Text:='update VIDOMCHAPIDPORYDKOVANIST set VIDOMSTVO=:Vidomstrvo where KODVIDOMSTVA=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Vidomstvo';
      Params[0].Value:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      Params.Add;
      Params[1].Name:='Kod';
      Params[1].Value:=frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidomchaPidporydkovanist.aUpdateExecute(sender);
    frmVidomchaPidporydkovanistEdit.Close;
    exit;
  end;

  if frmVidomchaPidporydkovanistEdit.Caption='Додавання відомства' then
  begin
    if frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text);
    except
      frmVidomchaPidporydkovanistEdit.aKodUpdateExecute(sender);
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    if frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text='' then
    begin
      frmVidomchaPidporydkovanistEdit.edtVidomstvo.SetFocus;
      exit;
    end;
    with frmVidomchaPidporydkovanist.qUpdate do
    begin
      SQL.Clear;
      SQL.Text:='update VIDOMCHAPIDPORYDKOVANIST set VIDOMSTVO=:Vidomstrvo where KODVIDOMSTVA=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Vidomstvo';
      Params[0].Value:=frmVidomchaPidporydkovanistEdit.edtVidomstvo.Text;
      Params.Add;
      Params[1].Name:='Kod';
      Params[1].Value:=frmVidomchaPidporydkovanistEdit.edtKodVidomstva.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidomchaPidporydkovanist.aUpdateExecute(sender);
    frmVidomchaPidporydkovanistEdit.Close;
    exit;
  end;
end;

end.
