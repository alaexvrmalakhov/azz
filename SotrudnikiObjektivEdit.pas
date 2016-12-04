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
      with frmObjektiEdit.qTemp do
      begin
        SQL.Clear;
        SQL.Text:='delete from SPIVROBITNIKI_OBJEKTIV where KOD=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='Kod';
        Params[0].Value:=frmSotrudnikiObjektivEdit.edtKod.Text;
        Open;
      end;
      frmObjektiEdit.aUpdateExecute(sender);
      frmSotrudnikiObjektivEdit.Close;
      exit;
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
    with frmObjektiEdit.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='';
      SQL.Text:=SQL.Text+'update ';
      SQL.Text:=SQL.Text+'  SPIVROBITNIKI_OBJEKTIV ';
      SQL.Text:=SQL.Text+'set ';
      SQL.Text:=SQL.Text+'  KOD_OBJEKTA=:KodObjekta, ';
      SQL.Text:=SQL.Text+'  PIB_PORUSHNIKA=:PIBPorushnika,';
      SQL.Text:=SQL.Text+'  POSADA_PORUSHNIKA=:PosadaPorushnika,';
      SQL.Text:=SQL.Text+'  DATANARODZHENNYPORUSHNIKA=:DataNarodzhennyPorushnika,';
      SQL.Text:=SQL.Text+'  IDENTIFIKACIJNIJKODPORUSHNIKA=:IdentifikacijnijNomerPorushnika,';
      SQL.Text:=SQL.Text+'  MISCENARODZHENNYPORUSHNIKA=:MisceNarodzhennyPorushnika,';
      SQL.Text:=SQL.Text+'  MISCEPROZHIVANNYPORUSHNIKA=:MisceProzhivanny ';
      SQL.Text:=SQL.Text+'where ';
      SQL.Text:=SQL.Text+'  KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Kod_Objekta';
      Params[0].Value:=frmSotrudnikiObjektivEdit.edtKodObjekta.Text;
      Params.Add;
      Params[1].Name:='PIBPorushnika';
      Params[1].Value:=frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text;
      Params.Add;
      Params[2].Name:='PosadaPorushnika';
      Params[2].Value:=frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text;
      Params.Add;
      Params[3].Name:='DataNarodzhennyPorushnika';
      Params[3].Value:=DateToStr(int(frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date));
      Params.Add;
      Params[4].Name:='IdentifikacijnijNomerPorushnika';
      Params[4].Value:=frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text;
      Params.Add;
      Params[5].Name:='MisceNarodzhennyPorushnika';
      Params[5].Value:=frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text;
      Params.Add;
      Params[6].Name:='MisceProzhivanny';
      Params[6].Value:=frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text;
      Params.Add;
      Params[7].Name:='Kod';
      Params[7].Value:=frmSotrudnikiObjektivEdit.edtKod.Text;
      Open;
    end;
    frmObjektiEdit.aUpdateExecute(sender);
    frmSotrudnikiObjektivEdit.Close;
    exit;
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
    with frmObjektiEdit.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='';
      SQL.Text:=SQL.Text+'update ';
      SQL.Text:=SQL.Text+'  SPIVROBITNIKI_OBJEKTIV ';
      SQL.Text:=SQL.Text+'set ';
      SQL.Text:=SQL.Text+'  KOD_OBJEKTA=:KodObjekta, ';
      SQL.Text:=SQL.Text+'  PIB_PORUSHNIKA=:PIBPorushnika,';
      SQL.Text:=SQL.Text+'  POSADA_PORUSHNIKA=:PosadaPorushnika,';
      SQL.Text:=SQL.Text+'  DATANARODZHENNYPORUSHNIKA=:DataNarodzhennyPorushnika,';
      SQL.Text:=SQL.Text+'  IDENTIFIKACIJNIJKODPORUSHNIKA=:IdentifikacijnijNomerPorushnika,';
      SQL.Text:=SQL.Text+'  MISCENARODZHENNYPORUSHNIKA=:MisceNarodzhennyPorushnika,';
      SQL.Text:=SQL.Text+'  MISCEPROZHIVANNYPORUSHNIKA=:MisceProzhivanny ';
      SQL.Text:=SQL.Text+'where ';
      SQL.Text:=SQL.Text+'  KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Kod_Objekta';
      Params[0].Value:=frmSotrudnikiObjektivEdit.edtKodObjekta.Text;
      Params.Add;
      Params[1].Name:='PIBPorushnika';
      Params[1].Value:=frmSotrudnikiObjektivEdit.edtPIBPorushnika.Text;
      Params.Add;
      Params[2].Name:='PosadaPorushnika';
      Params[2].Value:=frmSotrudnikiObjektivEdit.edtPosadaPorushnika.Text;
      Params.Add;
      Params[3].Name:='DataNarodzhennyPorushnika';
      Params[3].Value:=DateToStr(int(frmSotrudnikiObjektivEdit.dtpDataNarodzhennyPorushnika.Date));
      Params.Add;
      Params[4].Name:='IdentifikacijnijNomerPorushnika';
      Params[4].Value:=frmSotrudnikiObjektivEdit.edtIdentifikacijnijNomerPorushnika.Text;
      Params.Add;
      Params[5].Name:='MisceNarodzhennyPorushnika';
      Params[5].Value:=frmSotrudnikiObjektivEdit.edtMisceNarodzhennyPorushnika.Text;
      Params.Add;
      Params[6].Name:='MisceProzhivanny';
      Params[6].Value:=frmSotrudnikiObjektivEdit.edtMisceProzhivanny.Text;
      Params.Add;
      Params[7].Name:='Kod';
      Params[7].Value:=frmSotrudnikiObjektivEdit.edtKod.Text;
      Open;
    end;
    frmObjektiEdit.aUpdateExecute(sender);
    frmSotrudnikiObjektivEdit.Close;
    exit;
  end;
end;

procedure TfrmSotrudnikiObjektivEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmObjektiEdit do
  begin
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='insert into SPIVROBITNIKI_OBJEKTIV (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTemp.Open;
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='select * from SPIVROBITNIKI_OBJEKTIV order by KOD';
    qTemp.Open;
    qTemp.Last;
    frmSotrudnikiObjektivEdit.edtKod.Text:=IntToStr(qTemp.FieldByName('KOD').Value);
  end;
end;

end.
