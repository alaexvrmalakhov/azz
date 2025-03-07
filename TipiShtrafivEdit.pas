unit TipiShtrafivEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs;

type
  TfrmTipiShtrafivEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodTipuShtrafiv: TEdit;
    edtTipShtrafu: TEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    btnKodTipuShtrafiv: TButton;
    alTipiShtrafivEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmTipiShtrafivEdit: TfrmTipiShtrafivEdit;

implementation

uses
  Main, FinansoviSankciiEdit, TipiShtrafiv, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, Filter;

{$R *.dfm}

procedure TfrmTipiShtrafivEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    if frmViddilennyEdit.Caption<>'���� ���� �������' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmFinansoviSankciiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmFilter.Enabled:=true;
    frmMain.Enabled:=false;
    if frmTipiShtrafivEdit.Caption<>'���� ���� �������' then
    begin
      frmTipiShtrafiv.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmTipiShtrafiv.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmTipiShtrafivEdit.Caption<>'���� ���� �������' then
    begin
      frmTipiShtrafiv.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmTipiShtrafiv.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmTipiShtrafivEdit.Caption<>'���� ���� �������' then
    begin
      frmTipiShtrafiv.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmTipiShtrafiv.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmTipiShtrafivEdit.Caption<>'���� ���� �������' then
    begin
      frmTipiShtrafiv.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmTipiShtrafiv.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmTipiShtrafivEdit.Caption<>'���� ���� �������' then
    begin
      frmTipiShtrafiv.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmTipiShtrafiv.Close;
    Action:=caFree;
    exit;
  end;
}
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmTipiShtrafivEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmTipiShtrafiv do
  begin
    edtFind.Text:='';
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='insert into TIPISHTRAFIV (KODTIPUSHTRAFIV) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTemp.Open;
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='select * from TIPISHTRAFIV order by KODTIPUSHTRAFIV';
    qTemp.Open;
    qTemp.Last;
    frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text:=IntToStr(frmTipiShtrafiv.qTemp.FieldByName('KODTIPUSHTRAFIV').Value);
  end;
end;

procedure TfrmTipiShtrafivEdit.aOKExecute(Sender: TObject);
begin
  if frmTipiShtrafivEdit.Caption='���� ���� �������' then
  begin
{
    if frmMain.IsFormOpen('frmFilter') then
    begin
      frmFilter.cbFilter.Text:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      frmTipiShtrafivEdit.Close;
      frmTipiShtrafiv.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbTipShtrafiv.Text:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      frmTipiShtrafivEdit.Close;
      frmTipiShtrafiv.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      frmTipiShtrafivEdit.Close;
      frmTipiShtrafiv.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbTipPostanovi.Text:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      frmTipiShtrafivEdit.Close;
      frmTipiShtrafiv.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.cbTipShtrafiv.Text:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      frmTipiShtrafivEdit.Close;
      frmTipiShtrafiv.Close;
      exit;
    end;
}
  end;

  if frmTipiShtrafivEdit.Caption='��������� ���� �������' then
  begin
    if MessageDlg('��������� ����� ������ ���� ������������ �� ����� �������� � ������!!!'+#13+'�� ����� ������ �������� ��� �����?'+#13+'',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmTipiShtrafiv.qTemp do
      begin
        SQL.Clear;
        SQL.Text:='delete from TIPISHTRAFIV where KODTIPUSHTRAFIV=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text;
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmTipiShtrafivEdit.Close;
      frmTipiShtrafiv.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmTipiShtrafivEdit.Caption='����������� ���� �������' then
  begin
    if frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text='' then
    begin
      frmTipiShtrafivEdit.aKodUpdateExecute(sender);
      frmTipiShtrafivEdit.edtKodTipuShtrafiv.SetFocus;
      exit;
    end;
    try
      StrToInt(frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text);
    except
      frmTipiShtrafivEdit.aKodUpdateExecute(sender);
      frmTipiShtrafivEdit.edtKodTipuShtrafiv.SetFocus;
      exit;
    end;
    if frmTipiShtrafivEdit.edtTipShtrafu.Text='' then
    begin
      frmTipiShtrafivEdit.edtTipShtrafu.SetFocus;
      exit;
    end;

    with frmTipiShtrafiv.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='update TIPISHTRAFIV set TIPSHTRAFU=:Tip where KODTIPUSHTRAFIV=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Tip';
      Params[0].Value:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      Params.Add;
      Params[1].Name:='Kod';
      Params[1].Value:=frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmTipiShtrafivEdit.Close;
    frmTipiShtrafiv.aUpdateExecute(sender);
    exit;
  end;

  if frmTipiShtrafivEdit.Caption='��������� ���� �������' then
  begin
    if frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text='' then
    begin
      frmTipiShtrafivEdit.aKodUpdateExecute(sender);
      frmTipiShtrafivEdit.edtKodTipuShtrafiv.SetFocus;
      exit;
    end;
    try
      StrToInt(frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text);
    except
      frmTipiShtrafivEdit.aKodUpdateExecute(sender);
      frmTipiShtrafivEdit.edtKodTipuShtrafiv.SetFocus;
      exit;
    end;
    if frmTipiShtrafivEdit.edtTipShtrafu.Text='' then
    begin
      frmTipiShtrafivEdit.edtTipShtrafu.SetFocus;
      exit;
    end;

    with frmTipiShtrafiv.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='update TIPISHTRAFIV set TIPSHTRAFU=:Tip where KODTIPUSHTRAFIV=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Tip';
      Params[0].Value:=frmTipiShtrafivEdit.edtTipShtrafu.Text;
      Params.Add;
      Params[1].Name:='Kod';
      Params[1].Value:=frmTipiShtrafivEdit.edtKodTipuShtrafiv.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmTipiShtrafivEdit.Close;
    frmTipiShtrafiv.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmTipiShtrafivEdit.aCancelExecute(Sender: TObject);
begin
  frmTipiShtrafivEdit.Close;
end;

end.
