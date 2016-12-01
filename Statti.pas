unit Statti;

interface

uses
  Forms, Menus, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmStatti = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    btnUpdate: TButton;
    aStatti: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    dsStatti: TDataSource;
    qStatti: TIBQuery;
    aSortByKod: TAction;
    aSortByNazva: TAction;
    aSortByNomerStatti: TAction;
    aSortByNomerDokumentu: TAction;
    aClose: TAction;
    PopupMenu: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aUpdateExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByNazvaExecute(Sender: TObject);
    procedure aSortByNomerStattiExecute(Sender: TObject);
    procedure aSortByNomerDokumentuExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmStatti: TfrmStatti;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit,
  AdminZapobizhZahodiEdit, ShtrafiEdit, StattiEdit;

{$R *.dfm}

procedure TfrmStatti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then
  begin
    frmAdminZapobizhZahodiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmStatti.aUpdateExecute(Sender: TObject);
begin
  with frmStatti do
  begin
    if Caption='Довідник нормативних актів' then
    begin
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from NORMATIVI order by NAZVANORMDOK';
      qStatti.Open;
      aSortByKod.Checked:=false;
      aSortByNazva.Checked:=true;
      aSortByNomerStatti.Checked:=false;
      aSortByNomerDokumentu.Checked:=false;
    end;

    if Caption='Довідник статей законодавства' then
    begin
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from STATTI order by NAZVANORMDOK';
      qStatti.Open;
      aSortByKod.Checked:=false;
      aSortByNazva.Checked:=true;
      aSortByNomerStatti.Checked:=false;
      aSortByNomerDokumentu.Checked:=false;
    end;
  end;
end;

procedure TfrmStatti.aChoiceExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmStatti.Caption='Довідник нормативних актів' then
  begin
    if frmStatti.qStatti.RecordCount<=0 then exit;
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmShtrafiEdit') then frmStatti.Enabled:=false;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Вибрати статтю';
      if not frmStatti.qStatti.FieldByName('KODSTATTI').IsNull then edtKodStatti.Text:=IntToStr(frmStatti.qStatti.FieldByName('KODSTATTI').Value) else frmStattiEdit.aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMERSTATTI').IsNull then edtNomerStatti.Text:=frmStatti.qStatti.FieldByName('NOMERSTATTI').Value else edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').IsNull then edtNomNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').Value else edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NAZVANORMDOK').IsNull then edtNazvaNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NAZVANORMDOK').Value else edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=false;
      BlobStream:=TMemoryStream.Create;
      try
        (frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField).SaveToStream(BlobStream);
        BlobStream.Position:=0;
        if BlobStream<>nil then frmStattiEdit.reTekstStatti.Lines.Assign(frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField) else frmStattiEdit.reTekstStatti.Lines.Clear;
      finally
        BlobStream.Free;
      end;
      reTekstStatti.Enabled:=false;
      btnZavantazhiti.Enabled:=false;
      reTekstStatti.Enabled:=false;
      btnZminiti.Enabled:=false;
      btnVikonati.SetFocus;
    end;
  end;

  if frmStatti.Caption='Довідник статей законодавства' then
  begin
    if frmStatti.qStatti.RecordCount<=0 then exit;
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Вибрати статтю';
      if frmMain.IsFormOpen('frmShtrafiEdit') then frmStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('KODSTATTI').IsNull then edtKodStatti.Text:=IntToStr(frmStatti.qStatti.FieldByName('KODSTATTI').Value) else frmStattiEdit.aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMERSTATTI').IsNull then edtNomerStatti.Text:=frmStatti.qStatti.FieldByName('NOMERSTATTI').Value else edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').IsNull then edtNomNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').Value else edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NAZVANORMDOK').IsNull then edtNazvaNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NAZVANORMDOK').Value else edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=false;
      BlobStream:=TMemoryStream.Create;
      try
        (frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField).SaveToStream(BlobStream);
        BlobStream.Position:=0;
        if BlobStream<>nil then frmStattiEdit.reTekstStatti.Lines.Assign(frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField) else frmStattiEdit.reTekstStatti.Lines.Clear;
      finally
        BlobStream.Free;
      end;
      reTekstStatti.Enabled:=false;
      btnZavantazhiti.Enabled:=false;
      btnVikonati.SetFocus;
    end;
  end;
end;

procedure TfrmStatti.aDeleteExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmStatti.Caption='Довідник нормативних актів' then
  begin
    if frmStatti.qStatti.RecordCount<=0 then exit;
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmShtrafiEdit') then frmStatti.Enabled:=false;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Видалити статтю';
      if not frmStatti.qStatti.FieldByName('KODSTATTI').IsNull then edtKodStatti.Text:=IntToStr(frmStatti.qStatti.FieldByName('KODSTATTI').Value) else frmStattiEdit.aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMERSTATTI').IsNull then edtNomerStatti.Text:=frmStatti.qStatti.FieldByName('NOMERSTATTI').Value else edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').IsNull then edtNomNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').Value else edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NAZVANORMDOK').IsNull then edtNazvaNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NAZVANORMDOK').Value else edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=false;
      BlobStream:=TMemoryStream.Create;
      try
        (frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField).SaveToStream(BlobStream);
        BlobStream.Position:=0;
        if BlobStream<>nil then frmStattiEdit.reTekstStatti.Lines.Assign(frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField) else frmStattiEdit.reTekstStatti.Lines.Clear;
      finally
        BlobStream.Free;
      end;
      reTekstStatti.Enabled:=false;
      btnZavantazhiti.Enabled:=false;
      btnVidmina.SetFocus;
    end;
  end;

  if frmStatti.Caption='Довідник статей законодавства' then
  begin
    if frmStatti.qStatti.RecordCount<=0 then exit;
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
     frmMain.Enabled:=false;
      Show;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Видалити статтю';
      if not frmStatti.qStatti.FieldByName('KODSTATTI').IsNull then edtKodStatti.Text:=IntToStr(frmStatti.qStatti.FieldByName('KODSTATTI').Value) else frmStattiEdit.aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMERSTATTI').IsNull then edtNomerStatti.Text:=frmStatti.qStatti.FieldByName('NOMERSTATTI').Value else edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').IsNull then edtNomNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').Value else edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NAZVANORMDOK').IsNull then edtNazvaNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NAZVANORMDOK').Value else edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=false;
      BlobStream:=TMemoryStream.Create;
      try
        (frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField).SaveToStream(BlobStream);
        BlobStream.Position:=0;
        if BlobStream<>nil then frmStattiEdit.reTekstStatti.Lines.Assign(frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField) else frmStattiEdit.reTekstStatti.Lines.Clear;
      finally
        BlobStream.Free;
      end;
      reTekstStatti.Enabled:=false;
      btnZavantazhiti.Enabled:=false;
      btnVidmina.SetFocus;
    end;
  end;
end;

procedure TfrmStatti.aEditExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmStatti.Caption='Довідник нормативних актів' then
  begin
    if frmStatti.qStatti.RecordCount<=0 then exit;
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmShtrafiEdit') then frmStatti.Enabled:=false;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Редагувати статтю';
      if not frmStatti.qStatti.FieldByName('KODSTATTI').IsNull then edtKodStatti.Text:=IntToStr(frmStatti.qStatti.FieldByName('KODSTATTI').Value) else frmStattiEdit.aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMERSTATTI').IsNull then edtNomerStatti.Text:=frmStatti.qStatti.FieldByName('NOMERSTATTI').Value else edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=true;
      if not frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').IsNull then edtNomNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').Value else edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=true;
      if not frmStatti.qStatti.FieldByName('NAZVANORMDOK').IsNull then edtNazvaNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NAZVANORMDOK').Value else edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=true;
      BlobStream:=TMemoryStream.Create;
      try
        (frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField).SaveToStream(BlobStream);
        BlobStream.Position:=0;
        if BlobStream<>nil then frmStattiEdit.reTekstStatti.Lines.Assign(frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField) else frmStattiEdit.reTekstStatti.Lines.Clear;
      finally
        BlobStream.Free;
      end;
      reTekstStatti.Enabled:=true;
      btnZavantazhiti.Enabled:=true;
      edtNomerStatti.SetFocus;
    end;
  end;

  if frmStatti.Caption='Довідник статей законодавства' then
  begin
    if frmStatti.qStatti.RecordCount<=0 then exit;
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Редагувати статтю';
      if not frmStatti.qStatti.FieldByName('KODSTATTI').IsNull then edtKodStatti.Text:=IntToStr(frmStatti.qStatti.FieldByName('KODSTATTI').Value) else frmStattiEdit.aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      if not frmStatti.qStatti.FieldByName('NOMERSTATTI').IsNull then edtNomerStatti.Text:=frmStatti.qStatti.FieldByName('NOMERSTATTI').Value else edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=true;
      if not frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').IsNull then edtNomNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NOMNORMATIVDOK').Value else edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=true;
      if not frmStatti.qStatti.FieldByName('NAZVANORMDOK').IsNull then edtNazvaNormativDokumenta.Text:=frmStatti.qStatti.FieldByName('NAZVANORMDOK').Value else edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=true;
      BlobStream:=TMemoryStream.Create;
      try
        (frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField).SaveToStream(BlobStream);
        BlobStream.Position:=0;
        if BlobStream<>nil then frmStattiEdit.reTekstStatti.Lines.Assign(frmStatti.qStatti.FieldByName('TEKSTSTATTI') as TBlobField) else frmStattiEdit.reTekstStatti.Lines.Clear;
      finally
        BlobStream.Free;
      end;
      reTekstStatti.Enabled:=true;
      btnZminiti.Enabled:=true;
      edtNomerStatti.SetFocus;
    end;
  end;
end;

procedure TfrmStatti.aAddExecute(Sender: TObject);
begin
  if frmStatti.Caption='Довідник нормативних актів' then
  begin
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmAdminZapobizhZahodiEdit') then frmStatti.Enabled:=false;
      if frmMain.IsFormOpen('frmShtrafiEdit') then frmStatti.Enabled:=false;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Додати статтю';
      aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=true;
      edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=true;
      edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=true;
      reTekstStatti.Lines.Clear;
      frmStattiEdit.reTekstStatti.MaxLength:=$7FFFFFF0;
      reTekstStatti.Enabled:=true;
      btnZavantazhiti.Enabled:=true;
      edtNomerStatti.SetFocus;
    end;
  end;

  if frmStatti.Caption='Довідник статей законодавства' then
  begin
    if not frmMain.IsFormOpen('frmStattiEdit') then frmStattiEdit:=TfrmStattiEdit.Create(self);
    with frmStattiEdit do
    begin
      frmMain.Enabled:=false;
      Show;
      BorderStyle:=bsDialog;
      Position:=poMainFormCenter;
      Caption:='Додати статтю';
      aKodUpdateExecute(sender);
      edtKodStatti.Enabled:=false;
      btnKodStatti.Enabled:=false;
      edtNomerStatti.Text:='';
      edtNomerStatti.Enabled:=true;
      edtNomNormativDokumenta.Text:='';
      edtNomNormativDokumenta.Enabled:=true;
      edtNazvaNormativDokumenta.Text:='';
      edtNazvaNormativDokumenta.Enabled:=true;
      reTekstStatti.Lines.Clear;
      frmStattiEdit.reTekstStatti.MaxLength:=$7FFFFFF0;
      reTekstStatti.Enabled:=true;
      btnZavantazhiti.Enabled:=true;
      edtNomerStatti.SetFocus;
    end;
  end;
end;

procedure TfrmStatti.aSortByKodExecute(Sender: TObject);
begin
  with frmStatti do
  begin
    if Caption='Довідник нормативних актів' then
    begin
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from NORMATIVI order by KODSTATTI';
      qStatti.Open;
      aSortByKod.Checked:=true;
      aSortByNazva.Checked:=false;
      aSortByNomerStatti.Checked:=false;
      aSortByNomerDokumentu.Checked:=false;
    end;

//    if Caption='Довідник статей законодавства' then
//    begin
//      qStatti.SQL.Clear;
//      qStatti.SQL.Text:='select * from STATTI order by KODSTATTI';
//      qStatti.Open;
//      aSortByKod.Checked:=true;
//      aSortByNazva.Checked:=false;
//      aSortByNomerStatti.Checked:=false;
//      aSortByNomerDokumentu.Checked:=false;
//    end;
  end;
end;

procedure TfrmStatti.aSortByNazvaExecute(Sender: TObject);
begin
  with frmStatti do
  begin
    if Caption='Довідник нормативних актів' then
    begin
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from NORMATIVI order by NAZVANORMDOK';
      qStatti.Open;
      aSortByKod.Checked:=false;
      aSortByNazva.Checked:=true;
      aSortByNomerStatti.Checked:=false;
      aSortByNomerDokumentu.Checked:=false;
    end;

//    if Caption='Довідник статей законодавства' then
//    begin
//      qStatti.SQL.Clear;
//      qStatti.SQL.Text:='select * from STATTI order by NAZVANORMDOK';
//      qStatti.Open;
//      aSortByKod.Checked:=false;
//      aSortByNazva.Checked:=true;
//      aSortByNomerStatti.Checked:=false;
//      aSortByNomerDokumentu.Checked:=false;
//    end;
  end;
end;

procedure TfrmStatti.aSortByNomerStattiExecute(Sender: TObject);
begin
  with frmStatti do
  begin
    if Caption='Довідник нормативних актів' then
    begin
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from NORMATIVI order by NOMERSTATTI';
      qStatti.Open;
      aSortByKod.Checked:=false;
      aSortByNazva.Checked:=false;
      aSortByNomerStatti.Checked:=true;
      aSortByNomerDokumentu.Checked:=false;
    end;

//    if Caption='Довідник статей законодавства' then
//    begin
//      qStatti.SQL.Clear;
//      qStatti.SQL.Text:='select * from STATTI order by NOMERSTATTI';
//      qStatti.Open;
//      aSortByKod.Checked:=false;
//      aSortByNazva.Checked:=false;
//      aSortByNomerStatti.Checked:=true;
//      aSortByNomerDokumentu.Checked:=false;
//    end;
  end;
end;

procedure TfrmStatti.aSortByNomerDokumentuExecute(Sender: TObject);
begin
  with frmStatti do
  begin
    if Caption='Довідник нормативних актів' then
    begin
      qStatti.SQL.Clear;
      qStatti.SQL.Text:='select * from NORMATIVI order by NOMNORMATIVDOK';
      qStatti.Open;
      aSortByKod.Checked:=false;
      aSortByNazva.Checked:=false;
      aSortByNomerStatti.Checked:=false;
      aSortByNomerDokumentu.Checked:=true;
    end;

//    if Caption='Довідник статей законодавства' then
//    begin
//      qStatti.SQL.Clear;
//      qStatti.SQL.Text:='select * from STATTI order by NOMNORMATIVDOK';
//      qStatti.Open;
//      aSortByKod.Checked:=false;
//      aSortByNazva.Checked:=false;
//      aSortByNomerStatti.Checked:=false;
//      aSortByNomerDokumentu.Checked:=true;
//    end;
  end;
end;

procedure TfrmStatti.aCloseExecute(Sender: TObject);
begin
  frmStatti.Close;
end;

procedure TfrmStatti.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmStatti.dsStatti;
end;

end.
