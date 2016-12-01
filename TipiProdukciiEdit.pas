unit TipiProdukciiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, Dialogs, SysUtils;

type
  TfrmTipiProdukciiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    edtTipProdukcii: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    rgGrupaTovariv: TRadioGroup;
    alTipiProdukciiEdit: TActionList;
    qRecordID: TIBQuery;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipiProdukciiEdit: TfrmTipiProdukciiEdit;

implementation

uses
  Main, TipiProdukcii, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  Filter;

{$R *.dfm}

procedure TfrmTipiProdukciiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір продукції' then
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
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmTipiProdukcii.Enabled:=true;
    frmFinansoviSankciiEdit.Enabled:=true;
    if frmTipiProdukciiEdit.Caption<>'Вибір продукції' then
    begin
      frmTipiProdukcii.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmTipiProdukcii.Close;
     frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmFilter') then
  begin
    frmTipiProdukcii.Enabled:=true;
    frmFilter.Enabled:=true;
    if frmTipiProdukciiEdit.Caption<>'Вибір продукції' then
    begin
      frmTipiProdukcii.Enabled:=true;
      frmFilter.Enabled:=false;
    end
    else
      frmTipiProdukcii.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmTipiProdukcii.Enabled:=true;
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    if frmTipiProdukciiEdit.Caption<>'Вибір продукції' then
    begin
      frmTipiProdukcii.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmTipiProdukcii.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmTipiProdukciiEdit.aOKExecute(Sender: TObject);
begin
  if frmTipiProdukciiEdit.Caption='Вибір продукції' then
  begin
    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbTipProdukcii.Text:=frmTipiProdukciiEdit.edtTipProdukcii.Text;
      frmTipiProdukciiEdit.Close;
      frmTipiProdukcii.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmFilter') then
    begin
      frmFilter.cbFilter.Text:=frmTipiProdukciiEdit.edtTipProdukcii.Text;
      frmTipiProdukciiEdit.Close;
      frmTipiProdukcii.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:=frmTipiProdukciiEdit.edtTipProdukcii.Text;
      frmTipiProdukciiEdit.Close;
      frmTipiProdukcii.Close;
      exit;
    end;
  end;

  if frmTipiProdukciiEdit.Caption='Видалення продукції' then
  begin
    if MessageDlg('УВАГА!!!'+#13+'Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmTipiProdukcii do
      begin
        qTipiProdukcii.SQL.Clear;
        qTipiProdukcii.SQL.Text:='delete from TIPIPRODUKCII where KOD=:Kod';
        qTipiProdukcii.Params.Clear;
        qTipiProdukcii.Params.Add;
        qTipiProdukcii.Params[0].Name:='Kod';
        qTipiProdukcii.Params[0].Value:=frmTipiProdukciiEdit.edtKod.Text;
        qTipiProdukcii.Open;
      end;
      frmMain.trAzz.CommitRetaining;
    end;
    frmTipiProdukciiEdit.Close;
    frmTipiProdukcii.aUpdateExecute(sender);
    exit;
  end;

  if frmTipiProdukciiEdit.Caption='Редагування продукції' then
  begin
    if frmTipiProdukciiEdit.edtKod.Text='' then
    begin
      frmTipiProdukciiEdit.aKodUpdateExecute(sender);
      frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmTipiProdukciiEdit.edtKod.Text);
    except
      frmTipiProdukciiEdit.aKodUpdateExecute(sender);
      frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
      exit;
    end;
    if frmTipiProdukciiEdit.edtTipProdukcii.Text='' then
    begin
      frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
      exit;
    end;
    if frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex=-1 then
    begin
      frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=0;
      exit;
    end;
    with frmTipiProdukcii do
    begin
      qTipiProdukcii.SQL.Clear;
      qTipiProdukcii.SQL.Text:='update TIPIPRODUKCII set TIPPRODUKCII=:TIPPRODUKCII,GRUPATOVARIV=:GRUPATOVARIV where KOD=:Kod';
      qTipiProdukcii.Params.Clear;
      qTipiProdukcii.Params.Add;
      qTipiProdukcii.Params[0].Name:='TIPPRODUKCII';
      qTipiProdukcii.Params[0].Value:=frmTipiProdukciiEdit.edtTipProdukcii.Text;
      qTipiProdukcii.Params.Add;
      qTipiProdukcii.Params[1].Name:='GRUPATOVARIV';
      qTipiProdukcii.Params[1].Value:=frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex;
      qTipiProdukcii.Params.Add;
      qTipiProdukcii.Params[2].Name:='KOD';
      qTipiProdukcii.Params[2].Value:=frmTipiProdukciiEdit.edtKod.Text;
      qTipiProdukcii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmTipiProdukciiEdit.Close;
    frmTipiProdukcii.aUpdateExecute(sender);
    exit;
  end;

  if frmTipiProdukciiEdit.Caption='Додавання продукції' then
  begin
    if frmTipiProdukciiEdit.edtKod.Text='' then
    begin
      frmTipiProdukciiEdit.aKodUpdateExecute(sender);
      frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmTipiProdukciiEdit.edtKod.Text);
    except
      frmTipiProdukciiEdit.aKodUpdateExecute(sender);
      frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
      exit;
    end;
    if frmTipiProdukciiEdit.edtTipProdukcii.Text='' then
    begin
      frmTipiProdukciiEdit.edtTipProdukcii.SetFocus;
      exit;
    end;
    if frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex=-1 then
    begin
      frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex:=0;
      exit;
    end;
    with frmTipiProdukcii do
    begin
      qTipiProdukcii.SQL.Clear;
      qTipiProdukcii.SQL.Text:='update TIPIPRODUKCII set TIPPRODUKCII=:TIPPRODUKCII,GRUPATOVARIV=:GRUPATOVARIV where KOD=:Kod';
      qTipiProdukcii.Params.Clear;
      qTipiProdukcii.Params.Add;
      qTipiProdukcii.Params[0].Name:='TIPPRODUKCII';
      qTipiProdukcii.Params[0].Value:=frmTipiProdukciiEdit.edtTipProdukcii.Text;
      qTipiProdukcii.Params.Add;
      qTipiProdukcii.Params[1].Name:='GRUPATOVARIV';
      qTipiProdukcii.Params[1].Value:=frmTipiProdukciiEdit.rgGrupaTovariv.ItemIndex;
      qTipiProdukcii.Params.Add;
      qTipiProdukcii.Params[2].Name:='KOD';
      qTipiProdukcii.Params[2].Value:=frmTipiProdukciiEdit.edtKod.Text;
      qTipiProdukcii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmTipiProdukciiEdit.Close;
    frmTipiProdukcii.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmTipiProdukciiEdit.aCancelExecute(Sender: TObject);
begin
  frmTipiProdukciiEdit.Close;
end;

procedure TfrmTipiProdukciiEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmTipiProdukciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='insert into TIPIPRODUKCII (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qRecordID.Open;
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from TIPIPRODUKCII order by KOD';
    qRecordID.Open;
    qRecordID.Last;
    edtKod.Text:=IntToStr(qRecordID.FieldByName('KOD').Value);
  end;
end;

end.
