unit OdiniciVimiruEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Controls,
  StdCtrls, ExtCtrls, SysUtils, Dialogs;

type
  TfrmOdiniciVimiruEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    edtPovnaNazva: TEdit;
    edtPovanaNazvaRV: TEdit;
    btnPovnaNazvaRV: TButton;
    edtSkorochenaNazva: TEdit;
    edtMnozhnik: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    rgVid: TRadioGroup;
    alOdiniciVimiruEdit: TActionList;
    aKodUpdate: TAction;
    qRecord_ID: TIBQuery;
    aPovnaNazva_RV: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aPovnaNazva_RVExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOdiniciVimiruEdit: TfrmOdiniciVimiruEdit;

implementation

uses
  Main, OdiniciVimiru;

{$R *.dfm}

procedure TfrmOdiniciVimiruEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOdiniciVimiruEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmOdiniciVimiruEdit do
  begin
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='insert into ODINICI_VIMIRU (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qRecord_ID.Open;
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU order by KOD';
    qRecord_ID.Open;
    qRecord_ID.Last;
    edtKod.Text:=IntToStr(qRecord_ID.FieldByName('KOD').Value);
  end;
end;

procedure TfrmOdiniciVimiruEdit.aPovnaNazva_RVExecute(Sender: TObject);
begin
  frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:=frmOdiniciVimiruEdit.edtPovnaNazva.Text;
end;

procedure TfrmOdiniciVimiruEdit.aOKExecute(Sender: TObject);
begin
  if frmOdiniciVimiruEdit.Caption='Вибір одиниці виміру' then
  begin
  end;

  if frmOdiniciVimiruEdit.Caption='Видалення одиниці виміру' then
  begin
    if MessageDlg('Увага!!!'+#13+'Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmOdiniciVimiru.qOdiniciVimiru.SQL.Clear;
      frmOdiniciVimiru.qOdiniciVimiru.SQL.Text:='delete from ODINICI_VIMIRU where KOD=:Kod';
      frmOdiniciVimiru.qOdiniciVimiru.Params.Clear;
      frmOdiniciVimiru.qOdiniciVimiru.Params.Add;
      frmOdiniciVimiru.qOdiniciVimiru.Params[0].Name:='Kod';
      frmOdiniciVimiru.qOdiniciVimiru.Params[0].Value:=frmOdiniciVimiruEdit.edtKod.Text;
      frmOdiniciVimiru.qOdiniciVimiru.Open;
      frmMain.trAzz.CommitRetaining;
    end;
    frmOdiniciVimiruEdit.Close;
    frmOdiniciVimiru.aUpdateExecute(sender);
    exit;
  end;

  if frmOdiniciVimiruEdit.Caption='Редагування одиниці виміру' then
  begin
    if frmOdiniciVimiruEdit.edtKod.Text='' then
    begin
      frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
      frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmOdiniciVimiruEdit.edtKod.Text);
    except
      frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
      frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.edtPovnaNazva.Text='' then
    begin
      frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.edtSkorochenaNazva.Text='' then
    begin
      frmOdiniciVimiruEdit.edtSkorochenaNazva.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.edtMnozhnik.Text='' then
    begin
      frmOdiniciVimiruEdit.edtMnozhnik.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmOdiniciVimiruEdit.edtMnozhnik.Text);
    except
      MessageDlg('В якості множника для одиниці виміру може бути ціле або дрібне число'+#13+'яке повинно ділитись на 10.'+#13+'В якості десятичного знаку можна використовувати або крапку (.) або кому (,).'+#13+'Якщо з''являеться це повідомлення, то слід змінити десятичний знак на інший'+#13+'(крапку (.) на кому (,) або навпаки, кому (,) на крапку (.)',mtInformation,[mbOK],0);
      frmOdiniciVimiruEdit.edtMnozhnik.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.rgVid.ItemIndex=-1 then
    begin
      frmOdiniciVimiruEdit.rgVid.ItemIndex:=0;
      exit;
    end;
    with frmOdiniciVimiru do
    begin
      qOdiniciVimiru.SQL.Clear;
      qOdiniciVimiru.SQL.Text:='update ODINICI_VIMIRU set POLNOE_NAZVANIE=:PolnoeNazvanie,POLNOE_NAZVANE_RP=:PolnoeNazvaniRV,SOKRASCHENNOE_NAZVANIE=:SokrNazvanie,MNOZHITEL=:Mnozhitel,VID=:Vid where KOD=:Kod';
      qOdiniciVimiru.Params.Clear;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[0].Name:='PolnoeNazvanie';
      qOdiniciVimiru.Params[0].Value:=edtPovnaNazva.Text;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[1].Name:='PolnoeNazvaniRV';
      qOdiniciVimiru.Params[1].Value:=edtPovanaNazvaRV.Text;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[2].Name:='SokrNazvanie';
      qOdiniciVimiru.Params[2].Value:=edtSkorochenaNazva.Text;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[3].Name:='Mnozhitel';
      qOdiniciVimiru.Params[3].Value:=StrToFloat(edtMnozhnik.Text);
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[4].Name:='Vid';
      qOdiniciVimiru.Params[4].Value:=rgVid.ItemIndex;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[5].Name:='Kod';
      qOdiniciVimiru.Params[5].Value:=edtKod.Text;
      qOdiniciVimiru.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmOdiniciVimiruEdit.Close;
    frmOdiniciVimiru.aUpdateExecute(sender);
    exit;
  end;

  if frmOdiniciVimiruEdit.Caption='Додавання одиниці виміру' then
  begin
    if frmOdiniciVimiruEdit.edtKod.Text='' then
    begin
      frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
      frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmOdiniciVimiruEdit.edtKod.Text);
    except
      frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
      frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.edtPovnaNazva.Text='' then
    begin
      frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.edtSkorochenaNazva.Text='' then
    begin
      frmOdiniciVimiruEdit.edtSkorochenaNazva.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.edtMnozhnik.Text='' then
    begin
      frmOdiniciVimiruEdit.edtMnozhnik.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmOdiniciVimiruEdit.edtMnozhnik.Text);
    except
      MessageDlg('В якості множника для одиниці виміру може бути ціле або дрібне число'+#13+'яке повинно ділитись на 10.'+#13+'В якості десятичного знаку можна використовувати або крапку (.) або кому (,).'+#13+'Якщо з''являеться це повідомлення, то слід змінити десятичний знак на інший'+#13+'(крапку (.) на кому (,) або навпаки, кому (,) на крапку (.)',mtInformation,[mbOK],0);
      frmOdiniciVimiruEdit.edtMnozhnik.SetFocus;
      exit;
    end;
    if frmOdiniciVimiruEdit.rgVid.ItemIndex=-1 then
    begin
      frmOdiniciVimiruEdit.rgVid.ItemIndex:=0;
      exit;
    end;
    with frmOdiniciVimiru do
    begin
      qOdiniciVimiru.SQL.Clear;
      qOdiniciVimiru.SQL.Text:='update ODINICI_VIMIRU set POLNOE_NAZVANIE=:PolnoeNazvanie,POLNOE_NAZVANE_RP=:PolnoeNazvaniRV,SOKRASCHENNOE_NAZVANIE=:SokrNazvanie,MNOZHITEL=:Mnozhitel,VID=:Vid where KOD=:Kod';
      qOdiniciVimiru.Params.Clear;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[0].Name:='PolnoeNazvanie';
      qOdiniciVimiru.Params[0].Value:=edtPovnaNazva.Text;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[1].Name:='PolnoeNazvaniRV';
      qOdiniciVimiru.Params[1].Value:=edtPovanaNazvaRV.Text;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[2].Name:='SokrNazvanie';
      qOdiniciVimiru.Params[2].Value:=edtSkorochenaNazva.Text;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[3].Name:='Mnozhitel';
      qOdiniciVimiru.Params[3].Value:=StrToFloat(edtMnozhnik.Text);
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[4].Name:='Vid';
      qOdiniciVimiru.Params[4].Value:=rgVid.ItemIndex;
      qOdiniciVimiru.Params.Add;
      qOdiniciVimiru.Params[5].Name:='Kod';
      qOdiniciVimiru.Params[5].Value:=edtKod.Text;
      qOdiniciVimiru.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmOdiniciVimiruEdit.Close;
    frmOdiniciVimiru.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmOdiniciVimiruEdit.aCancelExecute(Sender: TObject);
begin
  frmOdiniciVimiruEdit.Close;
end;

end.
