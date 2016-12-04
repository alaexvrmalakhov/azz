unit StattiEdit;

interface

uses
  Forms, Classes, ActnList, Dialogs, StdCtrls, ComCtrls, Controls, SysUtils,
  IniFiles, DB;

type
  TfrmStattiEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    edtKodStatti: TEdit;
    edtNomerStatti: TEdit;
    edtNomNormativDokumenta: TEdit;
    edtNazvaNormativDokumenta: TEdit;
    reTekstStatti: TRichEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    btnZavantazhiti: TButton;
    OpenDialog1: TOpenDialog;
    btnKodStatti: TButton;
    alStattiEdit: TActionList;
    aKodUpdate: TAction;
    aLoad: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aLoadExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmStattiEdit: TfrmStattiEdit;

implementation

uses Main, FinansoviSankciiEdit, Statti, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit;

{$R *.dfm}

procedure TfrmStattiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    if frmViddilennyEdit.Caption<>'Вибрати статтю' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmFinansoviSankciiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmStattiEdit.Caption<>'Вибрати статтю' then
    begin
      frmStatti.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmStatti.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmStattiEdit.Caption<>'Вибрати статтю' then
    begin
      frmStatti.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmStatti.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmStattiEdit.Caption<>'Вибрати статтю' then
    begin
      frmStatti.Enabled:=true;
      frmAdminZapobizhZahodiEdit.Enabled:=false;
    end
    else
      frmStatti.Close;
    Action:=caFree;
    exit;
  end;
}
  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmStatti.BorderStyle=bsDialog then
    begin
      frmStatti.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end;
//    if frmStattiEdit.Caption<>'Вибрати статтю' then
//    begin
//      frmStatti.Enabled:=true;
//      frmShtrafiEdit.Enabled:=false;
//    end
//    else
//      frmStatti.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmStattiEdit.aKodUpdateExecute(Sender: TObject);
begin
  if frmStatti.Caption='Довідник нормативних актів' then
  begin
    with frmStatti do
    begin
      qTemp.SQL.Clear;
      qTemp.SQL.Text:='insert into NORMATIVI (KODSTATTI) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
      qTemp.Open;
      qTemp.SQL.Clear;
      qTemp.SQL.Text:='select * from NORMATIVI order by KODSTATTI';
      qTemp.Open;
      qTemp.Last;
      frmStattiEdit.edtKodStatti.Text:=IntToStr(qTemp.FieldByName('KODSTATTI').Value);
{
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='insert into NORMATIVI (KODSTATTI) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
      qStatti.Open;
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from NORMATIVI order by KODSTATTI';
      qStatti.Open;
      qStatti.Last;
      frmStattiEdit.edtKodStatti.Text:=IntToStr(qStatti.FieldByName('KODSTATTI').Value);
}
    end;
  end;

  if frmStatti.Caption='Довідник статей законодавства' then
  begin
    with frmStatti do
    begin
      qTemp.SQL.Clear;
      qTemp.SQL.Text:='insert into STATTI (KODSTATTI) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
      qTemp.Open;
      qTemp.SQL.Clear;
      qTemp.SQL.Text:='select * from STATTI order by KODSTATTI';
      qTemp.Open;
      qTemp.Last;
      frmStattiEdit.edtKodStatti.Text:=IntToStr(qTemp.FieldByName('KODSTATTI').Value);
    end;
  end;
end;

procedure TfrmStattiEdit.aLoadExecute(Sender: TObject);
begin
  if OpenDialog1.Execute then frmStattiEdit.reTekstStatti.Lines.LoadFromFile(frmStattiEdit.OpenDialog1.FileName);
end;

procedure TfrmStattiEdit.aCancelExecute(Sender: TObject);
begin
  frmStattiEdit.Close;
end;

procedure TfrmStattiEdit.aOKExecute(Sender: TObject);
var
  temp: string;
  fs: TFileStream;
begin
  if frmStatti.Caption='Довідник нормативних актів' then
  begin
    if frmStattiEdit.Caption='Вибрати статтю' then
    begin
{
      if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
      begin
        frmFinansoviSankciiEdit.memSchoEPorushennym.Lines.Add('ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' №'+frmStattiEdit.edtNomNormativDokumenta.Text);
        frmStattiEdit.Close;
        frmStatti.Close;
        exit;
      end;

      if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
      begin
        frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Lines.Add('ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' №'+frmStattiEdit.edtNomNormativDokumenta.Text);
        frmStattiEdit.Close;
        frmStatti.Close;
        exit;
      end;

      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
      begin
        frmAdminZapobizhZahodiEdit.memSchoEPorushennym.Lines.Add('ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' '+frmStattiEdit.edtNomNormativDokumenta.Text);
        frmStattiEdit.Close;
        frmStatti.Close;
        exit;
      end;
}
      if frmMain.IsFormOpen('frmShtrafiEdit') then
      begin
        // зміст постанови
        if (frmShtrafiEdit.pcShtrafi.ActivePage=frmShtrafiEdit.tsZmistPostanovi)and(frmShtrafiEdit.ActiveControl=frmShtrafiEdit.btnPerelikPorushnihAktiv) then
        begin
//          frmShtrafiEdit.rePerelikPorushnihAktiv.Lines.Add('ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' '+frmStattiEdit.edtNomNormativDokumenta.Text);
          frmShtrafiEdit.rePerelikPorushnihAktiv.Lines.Text:=frmShtrafiEdit.rePerelikPorushnihAktiv.Lines.Text+('ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' '+frmStattiEdit.edtNomNormativDokumenta.Text);
          frmStattiEdit.Close;
          frmStatti.Close;
          exit;
        end;
      end;
    end;

    if frmStattiEdit.Caption='Видалити статтю' then
    begin
      if MessageDlg('Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
      begin
        frmStatti.qTemp.SQL.Clear;
        frmStatti.qTemp.SQL.Text:='delete from NORMATIVI where KODSTATTI=:Kod';
        frmStatti.qTemp.Params.Clear;
        frmStatti.qTemp.Params.Add;
        frmStatti.qTemp.Params[0].Name:='Kod';
        frmStatti.qTemp.Params[0].Value:=frmStattiEdit.edtKodStatti.Text;
        frmStatti.qTemp.Open;
        frmMain.trAzz.CommitRetaining;
      end;
      frmStatti.aUpdateExecute(sender);
      frmStattiEdit.Close;
      exit;
    end;

    if frmStattiEdit.Caption='Редагувати статтю' then
    begin
{
      if frmStattiEdit.edtKodStatti.Text='' then
      begin
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;
      try
        StrToInt(frmStattiEdit.edtKodStatti.Text);
      except
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomerStatti.Text='' then
      begin
        frmStattiEdit.edtNomerStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNomNormativDokumenta.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNazvaNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNazvaNormativDokumenta.SetFocus;
        exit;
      end;
      if (frmStattiEdit.reTekstStatti.Text='')or(frmStattiEdit.reTekstStatti.Lines.Count<=0) then
      begin
        frmStattiEdit.reTekstStatti.SetFocus;
        exit;
      end;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;

      fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
      frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
      fs.Free;

      frmStatti.qStatti.SQL.Clear;
      frmStatti.qStatti.SQL.Text:='update NORMATIVI set NAZVANORMDOK=:NazvaNormDoc,NOMERSTATTI=:NomerStatti,NOMNORMATIVDOK=:NomerNormativnogoDocumenta,TEKSTSTATTI=:tekststatti where KODSTATTI=:Kod';
      frmStatti.qStatti.Params.Clear;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[0].Name:='NazvaNormDoc';
      frmStatti.qStatti.Params[0].Value:=frmStattiEdit.edtNazvaNormativDokumenta.Text;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[1].Name:='NomerStatti';
      frmStatti.qStatti.Params[1].Value:=frmStattiEdit.edtNomerStatti.Text;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[2].Name:='NomerNormativnogoDocumenta';
      frmStatti.qStatti.Params[2].Value:=frmStattiEdit.edtNomNormativDokumenta.Text;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[3].LoadFromFile(temp+'\file.tmp',ftMemo);
      frmStatti.qStatti.Params[3].Name:='tekststatti';
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[4].Name:='Kod';
      frmStatti.qStatti.Params[4].Value:=frmStattiEdit.edtKodStatti.Text;
      frmStatti.qStatti.Open;
      frmMain.trAzz.CommitRetaining;
      DeleteFile(temp+'\file.tmp');
      frmStatti.aUpdateExecute(sender);
      frmStattiEdit.Close;
      exit;
}
      if frmStattiEdit.edtKodStatti.Text='' then
      begin
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;
      try
        StrToInt(frmStattiEdit.edtKodStatti.Text);
      except
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomerStatti.Text='' then
      begin
        frmStattiEdit.edtNomerStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNomNormativDokumenta.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNazvaNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNazvaNormativDokumenta.SetFocus;
        exit;
      end;
      if (frmStattiEdit.reTekstStatti.Text='')or(frmStattiEdit.reTekstStatti.Lines.Count<=0) then
      begin
        frmStattiEdit.reTekstStatti.SetFocus;
        exit;
      end;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;

      try
        fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      except
        fs:=TFileStream.Create(ExtractFilePath(Application.ExeName)+'file.tmp',fmCreate);
        temp:=ExtractFilePath(Application.ExeName);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      end;

      with frmStatti.qTemp do
      begin
        SQL.Clear;
        SQL.Text:='update NORMATIVI set NAZVANORMDOK=:NazvaNormDoc,NOMERSTATTI=:NomerStatti,NOMNORMATIVDOK=:NomerNormativnogoDocumenta,TEKSTSTATTI=:tekststatti where KODSTATTI=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NazvaNormDoc';
        Params[0].Value:=frmStattiEdit.edtNazvaNormativDokumenta.Text;
        Params.Add;
        Params[1].Name:='NomerStatti';
        Params[1].Value:=frmStattiEdit.edtNomerStatti.Text;
        Params.Add;
        Params[2].Name:='NomerNormativnogoDocumenta';
        Params[2].Value:=frmStattiEdit.edtNomNormativDokumenta.Text;
        Params.Add;
        Params[3].LoadFromFile(temp+'\file.tmp',ftMemo);
        Params[3].Name:='tekststatti';
        Params.Add;
        Params[4].Name:='Kod';
        Params[4].Value:=frmStattiEdit.edtKodStatti.Text;
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
      DeleteFile(temp+'\file.tmp');
      frmStatti.aUpdateExecute(sender);
      frmStattiEdit.Close;
      exit;
    end;

    if frmStattiEdit.Caption='Додати статтю' then
    begin
{
      if frmStattiEdit.edtKodStatti.Text='' then
      begin
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;
      try
        StrToInt(frmStattiEdit.edtKodStatti.Text);
      except
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomerStatti.Text='' then
      begin
        frmStattiEdit.edtNomerStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNomNormativDokumenta.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNazvaNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNazvaNormativDokumenta.SetFocus;
        exit;
      end;
      if (frmStattiEdit.reTekstStatti.Text='')or(frmStattiEdit.reTekstStatti.Lines.Count<=0) then
      begin
        frmStattiEdit.reTekstStatti.SetFocus;
        exit;
      end;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;

      fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
      frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
      fs.Free;

      frmStatti.qStatti.SQL.Clear;
      frmStatti.qStatti.SQL.Text:='update NORMATIVI set NAZVANORMDOK=:NazvaNormDoc,NOMERSTATTI=:NomerStatti,NOMNORMATIVDOK=:NomerNormativnogoDocumenta,TEKSTSTATTI=:tekststatti where KODSTATTI=:Kod';
      frmStatti.qStatti.Params.Clear;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[0].Name:='NazvaNormDoc';
      frmStatti.qStatti.Params[0].Value:=frmStattiEdit.edtNazvaNormativDokumenta.Text;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[1].Name:='NomerStatti';
      frmStatti.qStatti.Params[1].Value:=frmStattiEdit.edtNomerStatti.Text;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[2].Name:='NomerNormativnogoDocumenta';
      frmStatti.qStatti.Params[2].Value:=frmStattiEdit.edtNomNormativDokumenta.Text;
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[3].LoadFromFile(temp+'\file.tmp',ftMemo);
      frmStatti.qStatti.Params[3].Name:='tekststatti';
      frmStatti.qStatti.Params.Add;
      frmStatti.qStatti.Params[4].Name:='Kod';
      frmStatti.qStatti.Params[4].Value:=frmStattiEdit.edtKodStatti.Text;
      frmStatti.qStatti.Open;
//      frmMain.trAzz.CommitRetaining;
//      DeleteFile(temp+'\file.tmp');
//      frmStatti.aUpdateExecute(sender);
//      frmStattiEdit.Close;
//      exit;
}
      if frmStattiEdit.edtKodStatti.Text='' then
      begin
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;
      try
        StrToInt(frmStattiEdit.edtKodStatti.Text);
      except
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomerStatti.Text='' then
      begin
        frmStattiEdit.edtNomerStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNomNormativDokumenta.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNazvaNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNazvaNormativDokumenta.SetFocus;
        exit;
      end;
      if (frmStattiEdit.reTekstStatti.Text='')or(frmStattiEdit.reTekstStatti.Lines.Count<=0) then
      begin
        frmStattiEdit.reTekstStatti.SetFocus;
        exit;
      end;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;

      try
        fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      except
        fs:=TFileStream.Create(ExtractFilePath(Application.ExeName)+'file.tmp',fmCreate);
        temp:=ExtractFilePath(Application.ExeName);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      end;

      with frmStatti.qTemp do
      begin
        SQL.Clear;
        SQL.Text:='update NORMATIVI set NAZVANORMDOK=:NazvaNormDoc,NOMERSTATTI=:NomerStatti,NOMNORMATIVDOK=:NomerNormativnogoDocumenta,TEKSTSTATTI=:tekststatti where KODSTATTI=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NazvaNormDoc';
        Params[0].Value:=frmStattiEdit.edtNazvaNormativDokumenta.Text;
        Params.Add;
        Params[1].Name:='NomerStatti';
        Params[1].Value:=frmStattiEdit.edtNomerStatti.Text;
        Params.Add;
        Params[2].Name:='NomerNormativnogoDocumenta';
        Params[2].Value:=frmStattiEdit.edtNomNormativDokumenta.Text;
        Params.Add;
        Params[3].LoadFromFile(temp+'\file.tmp',ftMemo);
        Params[3].Name:='tekststatti';
        Params.Add;
        Params[4].Name:='Kod';
        Params[4].Value:=frmStattiEdit.edtKodStatti.Text;
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
      DeleteFile(temp+'\file.tmp');
      frmStatti.aUpdateExecute(sender);
      frmStattiEdit.Close;
      exit;
    end;
  end;

  if frmStatti.Caption='Довідник статей законодавства' then
  begin
    if frmStattiEdit.Caption='Вибрати статтю' then
    begin
      if frmMain.IsFormOpen('frmShtrafiEdit') then
      begin
        // порушення статей
        if (frmShtrafiEdit.pcShtrafi.ActivePage=frmShtrafiEdit.tsVidomostiProPereviryjuchogo)and(frmShtrafiEdit.ActiveControl=frmShtrafiEdit.btnPorushennyStatej) then
        begin
//          frmShtrafiEdit.rePorushennyStatej.Lines.Add('ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' '+frmStattiEdit.edtNomNormativDokumenta.Text);
          frmShtrafiEdit.rePorushennyStatej.Lines.Text:=frmShtrafiEdit.rePorushennyStatej.Lines.Text+(' ст.'+frmStattiEdit.edtNomerStatti.Text+' '+frmStattiEdit.edtNazvaNormativDokumenta.Text+' '+frmStattiEdit.edtNomNormativDokumenta.Text);
          frmStattiEdit.Close;
          frmStatti.Close;
          exit;
        end;
      end;
    end;

    if frmStattiEdit.Caption='Видалити статтю' then
    begin
      if MessageDlg('Видалення цього запису може відобразитись на інших відомостях!!!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
      begin
        frmStatti.qTemp.SQL.Clear;
        frmStatti.qTemp.SQL.Text:='delete from STATTI where KODSTATTI=:Kod';
        frmStatti.qTemp.Params.Clear;
        frmStatti.qTemp.Params.Add;
        frmStatti.qTemp.Params[0].Name:='Kod';
        frmStatti.qTemp.Params[0].Value:=frmStattiEdit.edtKodStatti.Text;
        frmStatti.qTemp.Open;
        frmMain.trAzz.CommitRetaining;

        frmStatti.aUpdateExecute(sender);
        frmStattiEdit.Close;
        exit;
      end;
    end;

    if frmStattiEdit.Caption='Редагувати статтю' then
    begin
      if frmStattiEdit.edtKodStatti.Text='' then
      begin
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;
      try
        StrToInt(frmStattiEdit.edtKodStatti.Text);
      except
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomerStatti.Text='' then
      begin
        frmStattiEdit.edtNomerStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNomNormativDokumenta.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNazvaNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNazvaNormativDokumenta.SetFocus;
        exit;
      end;
      if (frmStattiEdit.reTekstStatti.Text='')or(frmStattiEdit.reTekstStatti.Lines.Count<=0) then
      begin
        frmStattiEdit.reTekstStatti.SetFocus;
        exit;
      end;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;

      try
        fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      except
        fs:=TFileStream.Create(ExtractFilePath(Application.ExeName)+'file.tmp',fmCreate);
        temp:=ExtractFilePath(Application.ExeName);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      end;

      with frmStatti.qTemp do
      begin
        SQL.Clear;
        SQL.Text:='update STATTI set NAZVANORMDOK=:NazvaNormDoc,NOMERSTATTI=:NomerStatti,NOMNORMATIVDOK=:NomerNormativnogoDocumenta,TEKSTSTATTI=:tekststatti where KODSTATTI=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NazvaNormDoc';
        Params[0].Value:=frmStattiEdit.edtNazvaNormativDokumenta.Text;
        Params.Add;
        Params[1].Name:='NomerStatti';
        Params[1].Value:=frmStattiEdit.edtNomerStatti.Text;
        Params.Add;
        Params[2].Name:='NomerNormativnogoDocumenta';
        Params[2].Value:=frmStattiEdit.edtNomNormativDokumenta.Text;
        Params.Add;
        Params[3].LoadFromFile(temp+'\file.tmp',ftMemo);
        Params[3].Name:='tekststatti';
        Params.Add;
        Params[4].Name:='Kod';
        Params[4].Value:=frmStattiEdit.edtKodStatti.Text;
        Open;
      end;

      frmMain.trAzz.CommitRetaining;
      DeleteFile(temp+'\file.tmp');
      frmStatti.aUpdateExecute(sender);
      frmStattiEdit.Close;
      exit;
    end;

    if frmStattiEdit.Caption='Додати статтю' then
    begin
      if frmStattiEdit.edtKodStatti.Text='' then
      begin
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;
      try
        StrToInt(frmStattiEdit.edtKodStatti.Text);
      except
        frmStattiEdit.aKodUpdateExecute(sender);
        frmStattiEdit.edtKodStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomerStatti.Text='' then
      begin
        frmStattiEdit.edtNomerStatti.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNomNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNomNormativDokumenta.SetFocus;
        exit;
      end;

      if frmStattiEdit.edtNazvaNormativDokumenta.Text='' then
      begin
        frmStattiEdit.edtNazvaNormativDokumenta.SetFocus;
        exit;
      end;
      if (frmStattiEdit.reTekstStatti.Text='')or(frmStattiEdit.reTekstStatti.Lines.Count<=0) then
      begin
        frmStattiEdit.reTekstStatti.SetFocus;
        exit;
      end;

      INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
      temp:=INIAZZ.ReadString('System','Temp',temp);
      INIAZZ.Free;

      try
        fs:=TFileStream.Create(temp+'\file.tmp',fmCreate);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      except
        fs:=TFileStream.Create(ExtractFilePath(Application.ExeName)+'file.tmp',fmCreate);
        temp:=ExtractFilePath(Application.ExeName);
        frmStattiEdit.reTekstStatti.Lines.SaveToStream(fs);
        fs.Free;
      end;

      with frmStatti.qTemp do
      begin
        SQL.Clear;
        SQL.Text:='update STATTI set NAZVANORMDOK=:NazvaNormDoc,NOMERSTATTI=:NomerStatti,NOMNORMATIVDOK=:NomerNormativnogoDocumenta,TEKSTSTATTI=:tekststatti where KODSTATTI=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NazvaNormDoc';
        Params[0].Value:=frmStattiEdit.edtNazvaNormativDokumenta.Text;
        Params.Add;
        Params[1].Name:='NomerStatti';
        Params[1].Value:=frmStattiEdit.edtNomerStatti.Text;
        Params.Add;
        Params[2].Name:='NomerNormativnogoDocumenta';
        Params[2].Value:=frmStattiEdit.edtNomNormativDokumenta.Text;
        Params.Add;
        Params[3].LoadFromFile(temp+'\file.tmp',ftMemo);
        Params[3].Name:='tekststatti';
        Params.Add;
        Params[4].Name:='Kod';
        Params[4].Value:=frmStattiEdit.edtKodStatti.Text;
        Open;
      end;

      frmMain.trAzz.CommitRetaining;
      DeleteFile(temp+'\file.tmp');
      frmStatti.aUpdateExecute(sender);
      frmStattiEdit.Close;
      exit;
    end;
  end;
end;

end.
