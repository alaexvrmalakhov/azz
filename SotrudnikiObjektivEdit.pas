unit SotrudnikiObjektivEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, ComCtrls, Controls, Dialogs, SysUtils;

type
  TfrmSotrudnikiObjektivEdit = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label5: TLabel;
    edtPIBPorushnika: TEdit;
    edtPosadaPorushnika: TEdit;
    edtMisceNarodzhennyPorushnika: TEdit;
    edtIdentifikacijnijNomerPorushnika: TEdit;
    dtpDataNarodzhennyPorushnika: TDateTimePicker;
    edtMisceProzhivanny: TEdit;
    Label1: TLabel;
    edtKodObjekta: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alSotrudnikiObjektovEdit: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Label2: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    aKodUpdate: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
  end;

var
  frmSotrudnikiObjektivEdit: TfrmSotrudnikiObjektivEdit;

implementation

uses
  ObjektiEdit, Main;

{$R *.dfm}

procedure TfrmSotrudnikiObjektivEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmObjektiEdit.Enabled:=true;
  frmMain.Enabled:=false;
  Action:=caFree;
end;

procedure TfrmSotrudnikiObjektivEdit.aCancelExecute(Sender: TObject);
begin
  frmSotrudnikiObjektivEdit.Close;
end;

procedure TfrmSotrudnikiObjektivEdit.aOKExecute(Sender: TObject);
begin
  if frmSotrudnikiObjektivEdit.Caption='Видалення співробітника' then
  begin
    if MessageDlg('Увага!!!'+#13+'Цей запис після відновлення відновити буде неможливо!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmSotrudnikiObjektivEdit do
      begin
        frmObjektiEdit.qSpivrobitniki.SQL.Clear;
        frmObjektiEdit.qSpivrobitniki.SQL.Text:='delete from SPIVROBITNIKI_OBJEKTIV where KOD=:Kod';
        frmObjektiEdit.qSpivrobitniki.Params.Clear;
        frmObjektiEdit.qSpivrobitniki.Params.Add;
        frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Kod';
        frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmSotrudnikiObjektivEdit.edtKod.Text;
        frmObjektiEdit.qSpivrobitniki.Open;

        frmObjektiEdit.aUpdateExecute(sender);
        frmSotrudnikiObjektivEdit.Close;
        exit;
      end;
    end;
  end;

  if frmSotrudnikiObjektivEdit.Caption='Редагування співробітника' then
  begin
    with frmSotrudnikiObjektivEdit do
    begin
      if edtKodObjekta.Text='' then
      begin
        edtKodObjekta.Text:=frmObjektiEdit.edtKodObjekta.Text;
        frmObjektiEdit.edtKodObjekta.Enabled:=false;
        edtPIBPorushnika.SetFocus;
        exit;
      end;
      if edtPIBPorushnika.Text='' then
      begin
        edtPIBPorushnika.SetFocus;
        exit;
      end;
      if edtPosadaPorushnika.Text='' then
      begin
        edtPosadaPorushnika.SetFocus;
        exit;
      end;
      if int(dtpDataNarodzhennyPorushnika.Date)>int(date) then
      begin
        dtpDataNarodzhennyPorushnika.Date:=int(date);
        dtpDataNarodzhennyPorushnika.SetFocus;
        exit;
      end;
      if edtIdentifikacijnijNomerPorushnika.Text='' then
      begin
        edtIdentifikacijnijNomerPorushnika.SetFocus;
        exit;
      end;
      if Length(edtIdentifikacijnijNomerPorushnika.Text)<>10 then
      begin
        edtIdentifikacijnijNomerPorushnika.SetFocus;
        edtIdentifikacijnijNomerPorushnika.SelectAll;
        exit;
      end;
      try
        StrToInt64(edtIdentifikacijnijNomerPorushnika.Text);
      except
        edtIdentifikacijnijNomerPorushnika.Text:='';
        edtIdentifikacijnijNomerPorushnika.SetFocus;
        exit;
      end;
      if edtMisceNarodzhennyPorushnika.Text='' then
      begin
        edtMisceNarodzhennyPorushnika.SetFocus;
        exit;
      end;
      if edtMisceProzhivanny.Text='' then
      begin
        edtMisceProzhivanny.SetFocus;
        exit;
      end;
    end;
    with frmObjektiEdit do
    begin
      frmObjektiEdit.qSpivrobitniki.SQL.Clear;
      frmObjektiEdit.qSpivrobitniki.SQL.Text:='update SPIVROBITNIKI_OBJEKTIV  set KOD_OBJEKTA=:KodObjekta,PIB_PORUSHNIKA=:PIBPorushnika,POSADA_PORUSHNIKA=:PosadaPorushnika,DATANARODZHENNYPORUSHNIKA=:DataNarodzhennyPorushnika,';
      frmObjektiEdit.qSpivrobitniki.SQL.Text:=frmObjektiEdit.qSpivrobitniki.SQL.Text+'IDENTIFIKACIJNIJKODPORUSHNIKA=:IdentifikacijnijNomerPorushnika,MISCENARODZHENNYPORUSHNIKA=:MisceNarodzhennyPorushnika,MISCEPROZHIVANNYPORUSHNIKA=:MisceProzhivanny where KOD=:Kod';
      frmObjektiEdit.qSpivrobitniki.Params.Clear;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Kod_Objekta';
      frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmSotrudnikiObjektivEdit.edtKodObjekta.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[1].Name:='PIBPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[1].Value:=frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[2].Name:='PosadaPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[2].Value:=frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[3].Name:='DataNarodzhennyPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[3].Value:=DateToStr(int(frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date));
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[4].Name:='IdentifikacijnijNomerPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[4].Value:=frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[5].Name:='MisceNarodzhennyPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[5].Value:=frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[6].Name:='MisceProzhivanny';
      frmObjektiEdit.qSpivrobitniki.Params[6].Value:=frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[7].Name:='Kod';
      frmObjektiEdit.qSpivrobitniki.Params[7].Value:=frmSotrudnikiObjektivEdit.edtKod.Text;
      frmObjektiEdit.qSpivrobitniki.Open;
      frmObjektiEdit.aUpdateExecute(sender);
      frmSotrudnikiObjektivEdit.Close;
      exit;
    end;
  end;

  if frmSotrudnikiObjektivEdit.Caption='Додавання співробітника' then
  begin
    with frmSotrudnikiObjektivEdit do
    begin
      if edtKodObjekta.Text='' then
      begin
        edtKodObjekta.Text:=frmObjektiEdit.edtKodObjekta.Text;
        frmObjektiEdit.edtKodObjekta.Enabled:=false;
        edtPIBPorushnika.SetFocus;
        exit;
      end;
      if edtKod.Text='' then
      begin
        aKodUpdateExecute(sender);
        edtKod.SetFocus;
        exit;
      end;
      try
        StrToInt(edtKod.Text);
      except
        aKodUpdateExecute(sender);
        edtKod.SetFocus;
        exit;
      end;
      if edtPIBPorushnika.Text='' then
      begin
        edtPIBPorushnika.SetFocus;
        exit;
      end;
      if edtPosadaPorushnika.Text='' then
      begin
        edtPosadaPorushnika.SetFocus;
        exit;
      end;
      if int(dtpDataNarodzhennyPorushnika.Date)>int(date) then
      begin
        dtpDataNarodzhennyPorushnika.Date:=int(date);
        dtpDataNarodzhennyPorushnika.SetFocus;
        exit;
      end;
      if edtIdentifikacijnijNomerPorushnika.Text='' then
      begin
        edtIdentifikacijnijNomerPorushnika.SetFocus;
        exit;
      end;
      if Length(edtIdentifikacijnijNomerPorushnika.Text)<>10 then
      begin
        edtIdentifikacijnijNomerPorushnika.SetFocus;
        edtIdentifikacijnijNomerPorushnika.SelectAll;
        exit;
      end;
      try
        StrToInt64(edtIdentifikacijnijNomerPorushnika.Text);
      except
        edtIdentifikacijnijNomerPorushnika.Text:='';
        edtIdentifikacijnijNomerPorushnika.SetFocus;
        exit;
      end;
      if edtMisceNarodzhennyPorushnika.Text='' then
      begin
        edtMisceNarodzhennyPorushnika.SetFocus;
        exit;
      end;
      if edtMisceProzhivanny.Text='' then
      begin
        edtMisceProzhivanny.SetFocus;
        exit;
      end;
    end;
    with frmObjektiEdit do
    begin
      frmObjektiEdit.qSpivrobitniki.SQL.Clear;
      frmObjektiEdit.qSpivrobitniki.SQL.Text:='update SPIVROBITNIKI_OBJEKTIV  set KOD_OBJEKTA=:KodObjekta,PIB_PORUSHNIKA=:PIBPorushnika,POSADA_PORUSHNIKA=:PosadaPorushnika,DATANARODZHENNYPORUSHNIKA=:DataNarodzhennyPorushnika,';
      frmObjektiEdit.qSpivrobitniki.SQL.Text:=frmObjektiEdit.qSpivrobitniki.SQL.Text+'IDENTIFIKACIJNIJKODPORUSHNIKA=:IdentifikacijnijNomerPorushnika,MISCENARODZHENNYPORUSHNIKA=:MisceNarodzhennyPorushnika,MISCEPROZHIVANNYPORUSHNIKA=:MisceProzhivanny where KOD=:Kod';
      frmObjektiEdit.qSpivrobitniki.Params.Clear;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[0].Name:='Kod_Objekta';
      frmObjektiEdit.qSpivrobitniki.Params[0].Value:=frmSotrudnikiObjektivEdit.edtKodObjekta.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[1].Name:='PIBPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[1].Value:=frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[2].Name:='PosadaPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[2].Value:=frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[3].Name:='DataNarodzhennyPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[3].Value:=DateToStr(int(frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date));
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[4].Name:='IdentifikacijnijNomerPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[4].Value:=frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[5].Name:='MisceNarodzhennyPorushnika';
      frmObjektiEdit.qSpivrobitniki.Params[5].Value:=frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[6].Name:='MisceProzhivanny';
      frmObjektiEdit.qSpivrobitniki.Params[6].Value:=frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text;
      frmObjektiEdit.qSpivrobitniki.Params.Add;
      frmObjektiEdit.qSpivrobitniki.Params[7].Name:='Kod';
      frmObjektiEdit.qSpivrobitniki.Params[7].Value:=frmSotrudnikiObjektivEdit.edtKod.Text;
      frmObjektiEdit.qSpivrobitniki.Open;
      frmObjektiEdit.aUpdateExecute(sender);
      frmSotrudnikiObjektivEdit.Close;
      exit;
    end;
  end;
end;

procedure TfrmSotrudnikiObjektivEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmObjektiEdit do
  begin
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='insert into SPIVROBITNIKI_OBJEKTIV (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qSpivrobitniki.Open;
    qSpivrobitniki.SQL.Clear;
    qSpivrobitniki.SQL.Text:='select * from SPIVROBITNIKI_OBJEKTIV order by KOD';
    qSpivrobitniki.Open;
    qSpivrobitniki.Last;
    frmSotrudnikiObjektivEdit.edtKod.Text:=IntToStr(qSpivrobitniki.FieldByName('KOD').Value);
  end;
end;

end.
