unit VidPostanoviEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, SysUtils, Dialogs;

type
  TfrmVidPostanoviEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodViduPostanovi: TEdit;
    btnKodViduPostanovi: TButton;
    edtVidPostanovi: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alVidPostanoviEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    Label3: TLabel;
    edtRecord_ID: TEdit;
    aRecord_ID_Update: TAction;
    qVidPostanoviEdit: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aRecord_ID_UpdateExecute(Sender: TObject);
  end;

var
  frmVidPostanoviEdit: TfrmVidPostanoviEdit;

implementation

uses
  Main, AdminZapobizhZahodiEdit, VidPostanovi;

{$R *.dfm}

procedure TfrmVidPostanoviEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір виду постанови' then
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
  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmVidPostanoviEdit.Caption<>'Вибір виду постанови' then
    begin
      frmVidPostanovi.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmVidPostanovi.Close;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidPostanoviEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmVidPostanovi do
  begin
    qVidPostanovi.SQL.Clear;
    qVidPostanovi.SQL.Text:='select * from VIDPOSTANOVI order by KODVIDA';
    qVidPostanovi.Open;
  end;
  with frmVidPostanoviEdit do
  begin
    edtKodViduPostanovi.Text:=IntToStr(frmVidPostanovi.qVidPostanovi.RecordCount+1);
    if frmVidPostanovi.qVidPostanovi.Locate('KODVIDA',StrToInt(edtKodViduPostanovi.Text),[]) then
      while frmVidPostanovi.qVidPostanovi.Locate('KODVIDA',StrToInt(edtKodViduPostanovi.Text),[]) do edtKodViduPostanovi.Text:=IntToStr(StrToInt(edtKodViduPostanovi.Text)+1);
  end;
end;

procedure TfrmVidPostanoviEdit.aOKExecute(Sender: TObject);
begin
  if frmVidPostanoviEdit.Caption='Вибір виду постанови' then
  begin
    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.cbVidPostanovi.Text:=frmVidPostanoviEdit.edtVidPostanovi.Text;
      if not frmVidPostanovi.qVidPostanovi.FieldByName('NAJMENUVANNYTOVARU').IsNull then
      begin
        case frmVidPostanovi.qVidPostanovi.FieldByName('NAJMENUVANNYTOVARU').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Text:='';
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtNaimenovanieTovara.Visible:=false;
      if not frmVidPostanovi.qVidPostanovi.FieldByName('KILKIST').IsNull then
      begin
        case frmVidPostanovi.qVidPostanovi.FieldByName('KILKIST').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Text:='';
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtKilkistTovaru.Visible:=false;
      if not frmVidPostanovi.qVidPostanovi.FieldByName('VAGAODINICI').IsNull then
      begin
        case frmVidPostanovi.qVidPostanovi.FieldByName('VAGAODINICI').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Text:='';
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtVagaOdinici.Visible:=false;
      if not frmVidPostanovi.qVidPostanovi.FieldByName('ZAGALNAVAGA').IsNull then
      begin
        case frmVidPostanovi.qVidPostanovi.FieldByName('ZAGALNAVAGA').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=false;
         1:
            begin
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Text:='';
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtZagalnaVaga.Visible:=false;
      if not frmVidPostanovi.qVidPostanovi.FieldByName('OTRIMANOGO').IsNull then
      begin
        case frmVidPostanovi.qVidPostanovi.FieldByName('OTRIMANOGO').Value of
          0:
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=false;
          1:
            begin
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Text:='';
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Enabled:=true;
              frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=true;
            end;
        end;
      end
      else
        frmAdminZapobizhZahodiEdit.edtOtrimanogo.Visible:=false;
      frmVidPostanoviEdit.Close;
      frmVidPostanovi.Close;
      exit;
    end;
  end;

  if frmVidPostanoviEdit.Caption='Видалення виду постанови' then
  begin
    if MessageDlg('Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmVidPostanovi do
      begin
        qVidPostanovi.SQL.Clear;
        qVidPostanovi.SQL.Text:='delete from VIDPOSTANOVI where RECORD_ID=:Kod';
        qVidPostanovi.Params.Clear;
        qVidPostanovi.Params.Add;
        qVidPostanovi.Params[0].Name:='Kod';
        qVidPostanovi.Params[0].Value:=frmVidPostanoviEdit.edtRecord_ID.Text;
        qVidPostanovi.Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmVidPostanovi.aUpdateExecute(sender);
      frmVidPostanoviEdit.Close;
      exit;
    end;
  end;

  if frmVidPostanoviEdit.Caption='Редагування виду постанови' then
  begin
    if frmVidPostanoviEdit.edtRecord_ID.Text='' then
    begin
      frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmVidPostanoviEdit.edtRecord_ID.Text);
    except
      frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    if frmVidPostanoviEdit.edtKodViduPostanovi.Text='' then
    begin
      frmVidPostanoviEdit.aKodUpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmVidPostanoviEdit.edtKodViduPostanovi.Text);
    except
      frmVidPostanoviEdit.aKodUpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    if frmVidPostanoviEdit.edtVidPostanovi.Text='' then
    begin
      frmVidPostanoviEdit.edtVidPostanovi.SetFocus;
      exit;
    end;

    with frmVidPostanovi do
    begin
      qVidPostanovi.SQL.Clear;
      qVidPostanovi.SQL.Text:='update VIDPOSTANOVI set KODVIDA=:KodVida,VIDPOSTANOVI=:VidPostanovi where RECORD_ID=:Record_ID';
      qVidPostanovi.Params.Clear;
      qVidPostanovi.Params.Add;
      qVidPostanovi.Params[0].Name:='KodVida';
      qVidPostanovi.Params[0].Value:=frmVidPostanoviEdit.edtKodViduPostanovi.Text;
      qVidPostanovi.Params.Add;
      qVidPostanovi.Params[1].Name:='VidPostanovi';
      qVidPostanovi.Params[1].Value:=frmVidPostanoviEdit.edtVidPostanovi.Text;
      qVidPostanovi.Params.Add;
      qVidPostanovi.Params[2].Name:='Record_ID';
      qVidPostanovi.Params[2].Value:=frmVidPostanoviEdit.edtRecord_ID.Text;
      qVidPostanovi.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidPostanovi.aUpdateExecute(sender);
    frmVidPostanoviEdit.Close;
    exit;
  end;

  if frmVidPostanoviEdit.Caption='Додавання виду постанови' then
  begin
    if frmVidPostanoviEdit.edtRecord_ID.Text='' then
    begin
      frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmVidPostanoviEdit.edtRecord_ID.Text);
    except
      frmVidPostanoviEdit.aRecord_ID_UpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    if frmVidPostanoviEdit.edtKodViduPostanovi.Text='' then
    begin
      frmVidPostanoviEdit.aKodUpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmVidPostanoviEdit.edtKodViduPostanovi.Text);
    except
      frmVidPostanoviEdit.aKodUpdateExecute(sender);
      frmVidPostanoviEdit.edtKodViduPostanovi.SetFocus;
      exit;
    end;
    if frmVidPostanoviEdit.edtVidPostanovi.Text='' then
    begin
      frmVidPostanoviEdit.edtVidPostanovi.SetFocus;
      exit;
    end;

    with frmVidPostanovi do
    begin
      qVidPostanovi.SQL.Clear;
      qVidPostanovi.SQL.Text:='update VIDPOSTANOVI set KODVIDA=:KodVida,VIDPOSTANOVI=:VidPostanovi where RECORD_ID=:Record_ID';
      qVidPostanovi.Params.Clear;
      qVidPostanovi.Params.Add;
      qVidPostanovi.Params[0].Name:='KodVida';
      qVidPostanovi.Params[0].Value:=frmVidPostanoviEdit.edtKodViduPostanovi.Text;
      qVidPostanovi.Params.Add;
      qVidPostanovi.Params[1].Name:='VidPostanovi';
      qVidPostanovi.Params[1].Value:=frmVidPostanoviEdit.edtVidPostanovi.Text;
      qVidPostanovi.Params.Add;
      qVidPostanovi.Params[2].Name:='Record_ID';
      qVidPostanovi.Params[2].Value:=frmVidPostanoviEdit.edtRecord_ID.Text;
      qVidPostanovi.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidPostanovi.aUpdateExecute(sender);
    frmVidPostanoviEdit.Close;
    exit;
  end;
end;

procedure TfrmVidPostanoviEdit.aCancelExecute(Sender: TObject);
begin
  frmVidPostanoviEdit.Close;
end;

procedure TfrmVidPostanoviEdit.aRecord_ID_UpdateExecute(Sender: TObject);
begin
  with frmVidPostanoviEdit do
  begin
    qVidPostanoviEdit.SQL.Clear;
    qVidPostanoviEdit.SQL.Text:='insert into VIDPOSTANOVI (RECORD_ID) values (GEN_ID(GET_DICTIONARIES_RECORD_ID,1))';
    qVidPostanoviEdit.Open;
    qVidPostanoviEdit.SQL.Clear;
    qVidPostanoviEdit.SQL.Text:='select * from VIDPOSTANOVI order by RECORD_ID';
    qVidPostanoviEdit.Open;
    qVidPostanoviEdit.Last;
    edtRecord_ID.Text:=IntToStr(qVidPostanoviEdit.FieldByName('RECORD_ID').Value);
  end;
end;

end.
