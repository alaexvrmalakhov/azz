unit VizmatiVinnimEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, Dialogs, IniFiles, DB;

type
  TfrmVizmatiVinnimEdit = class(TForm)
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label1: TLabel;
    edtKodPoly: TEdit;
    Label2: TLabel;
    reViznatiVinnim: TMemo;
    Label3: TLabel;
    edtZmist: TEdit;
    btnKodPoly: TButton;
    alViznatiVinnimEdit: TActionList;
    aKodUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmVizmatiVinnimEdit: TfrmVizmatiVinnimEdit;

implementation

uses
  Main, AdminZapobizhZahodiEdit, VizmatiVinnim, ShtrafiEdit;

{$R *.dfm}

procedure TfrmVizmatiVinnimEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    if frmViddilennyEdit.Caption<>'Вибір суті порушення' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmFinansoviSankciiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmVizmatiVinnimEdit.Caption<>'Вибір суті порушення' then
    begin
      frmVizmatiVinnim.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmVizmatiVinnim.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmVizmatiVinnimEdit.Caption<>'Вибір суті порушення' then
    begin
      frmVizmatiVinnim.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmVizmatiVinnim.Close;
    Action:=caFree;
    exit;
  end;
}

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVizmatiVinnimEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmVizmatiVinnim do
  begin
    edtFind.Text:='';
    frmVizmatiVinnim.DBRichEdit1.DataField:='';
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='insert into VIZNATIVINNIM (KODPOLY) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTemp.Open;
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='select * from VIZNATIVINNIM order by KODPOLY';
    qTemp.Open;
    qTemp.Last;
    frmVizmatiVinnimEdit.edtKodPoly.Text:=IntToStr(qTemp.FieldByName('KODPOLY').Value);
    frmVizmatiVinnim.DBRichEdit1.DataField:='Суть';
  end;
end;

procedure TfrmVizmatiVinnimEdit.aOKExecute(Sender: TObject);
var
  temp: String;
  fs: TFileStream;
begin
  if frmVizmatiVinnimEdit.Caption='Вибір суті порушення' then
  begin
{
    if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
    begin
      frmAdminZapobizhZahodiEdit.memVstanoviv.Lines.Clear;
      frmAdminZapobizhZahodiEdit.memVstanoviv.Lines.AddStrings(frmVizmatiVinnimEdit.reViznatiVinnim.Lines);
      frmVizmatiVinnimEdit.Close;
      frmVizmatiVinnim.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.reViznatiVinnim.Text:=frmVizmatiVinnimEdit.reViznatiVinnim.Text;
      frmVizmatiVinnimEdit.Close;
      frmVizmatiVinnim.Close;
      exit;
    end
}
  end;

  if frmVizmatiVinnimEdit.Caption='Видалення суті порушення' then
  begin
    if MessageDlg('Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Відновлення видалених даних буде неможливе!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmVizmatiVinnim.DBRichEdit1.DataField:='';
      frmVizmatiVinnim.qTemp.SQL.Clear;
      frmVizmatiVinnim.qTemp.SQL.Text:='delete from VIZNATIVINNIM where KODPOLY=:Kod';
      frmVizmatiVinnim.qTemp.Params.Clear;
      frmVizmatiVinnim.qTemp.Params.Add;
      frmVizmatiVinnim.qTemp.Params[0].Name:='Kod';
      frmVizmatiVinnim.qTemp.Params[0].Value:=frmVizmatiVinnimEdit.edtKodPoly.Text;
      frmVizmatiVinnim.qTemp.Open;
      frmMain.trAzz.CommitRetaining;

//      frmVizmatiVinnim.aUpdateExecute(sender);
      frmVizmatiVinnim.DBRichEdit1.DataField:='Суть';
      frmVizmatiVinnimEdit.Close;
      frmVizmatiVinnim.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmVizmatiVinnimEdit.Caption='Редагування суті порушення' then
  begin
    if frmVizmatiVinnimEdit.edtKodPoly.Text='' then
    begin
      frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
      frmVizmatiVinnimEdit.edtKodPoly.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVizmatiVinnimEdit.edtKodPoly.Text);
    except
      frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
      frmVizmatiVinnimEdit.edtKodPoly.SetFocus;
      exit;
    end;
    if frmVizmatiVinnimEdit.edtZmist.Text='' then
    begin
      frmVizmatiVinnimEdit.edtZmist.Text:='';
      frmVizmatiVinnimEdit.edtZmist.SetFocus;
      exit;
    end;
    if frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Count<=0 then
    begin
      frmVizmatiVinnimEdit.reViznatiVinnim.SetFocus;
      exit;
    end;

    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    temp:=INIAZZ.ReadString('System','Temp',temp);
    INIAZZ.Free;

    frmVizmatiVinnim.DBRichEdit1.DataField:='';

    try
      fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
      frmVizmatiVinnimEdit.reViznatiVinnim.Lines.SaveToStream(fs);
      fs.Free;
    except
      temp:=ExtractFilePath(Application.ExeName);
      fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
      frmVizmatiVinnimEdit.reViznatiVinnim.Lines.SaveToStream(fs);
      fs.Free;
    end;
    with frmVizmatiVinnim.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='update VIZNATIVINNIM set ZMIST=:Zmist,VIZVINNIM=:fil where KODPOLY=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Zmist';
      Params[0].Value:=frmVizmatiVinnimEdit.edtZmist.Text;;
      Params.Add;
      Params[1].LoadFromFile(temp+'\file.tmp',ftMemo);
      Params[1].Name:='fil';
      Params.Add;
      Params[2].Name:='Kod';
      Params[2].Value:=frmVizmatiVinnimEdit.edtKodPoly.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    DeleteFile(temp+'\file.tmp');

//    frmVizmatiVinnim.aUpdateExecute(sender);
    frmVizmatiVinnim.DBRichEdit1.DataField:='Суть';
    frmVizmatiVinnimEdit.Close;
    frmVizmatiVinnim.aUpdateExecute(sender);
    exit;
  end;

  if frmVizmatiVinnimEdit.Caption='Додавання суті порушення' then
  begin
    if frmVizmatiVinnimEdit.edtKodPoly.Text='' then
    begin
      frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
      frmVizmatiVinnimEdit.edtKodPoly.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVizmatiVinnimEdit.edtKodPoly.Text);
    except
      frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
      frmVizmatiVinnimEdit.edtKodPoly.SetFocus;
      exit;
    end;
    if frmVizmatiVinnimEdit.edtZmist.Text='' then
    begin
      frmVizmatiVinnimEdit.edtZmist.Text:='';
      frmVizmatiVinnimEdit.edtZmist.SetFocus;
      exit;
    end;
    if frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Count<=0 then
    begin
      frmVizmatiVinnimEdit.reViznatiVinnim.SetFocus;
      exit;
    end;

    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    temp:=INIAZZ.ReadString('System','Temp',temp);
    INIAZZ.Free;

    frmVizmatiVinnim.DBRichEdit1.DataField:='';

    try
      fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
      frmVizmatiVinnimEdit.reViznatiVinnim.Lines.SaveToStream(fs);
      fs.Free;
    except
      temp:=ExtractFilePath(Application.ExeName);
      fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
      frmVizmatiVinnimEdit.reViznatiVinnim.Lines.SaveToStream(fs);
      fs.Free;
    end;
    with frmVizmatiVinnim.qTemp do
    begin
      SQL.Clear;
      SQL.Text:='update VIZNATIVINNIM set ZMIST=:Zmist,VIZVINNIM=:fil where KODPOLY=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Zmist';
      Params[0].Value:=frmVizmatiVinnimEdit.edtZmist.Text;;
      Params.Add;
      Params[1].LoadFromFile(temp+'\file.tmp',ftMemo);
      Params[1].Name:='fil';
      Params.Add;
      Params[2].Name:='Kod';
      Params[2].Value:=frmVizmatiVinnimEdit.edtKodPoly.Text;
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    DeleteFile(temp+'\file.tmp');

//    frmVizmatiVinnim.aUpdateExecute(sender);
    frmVizmatiVinnim.DBRichEdit1.DataField:='Суть';
    frmVizmatiVinnimEdit.Close;
    frmVizmatiVinnim.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmVizmatiVinnimEdit.aCancelExecute(Sender: TObject);
begin
  frmVizmatiVinnimEdit.Close;
end;

end.
