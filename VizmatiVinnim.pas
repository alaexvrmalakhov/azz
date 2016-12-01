unit VizmatiVinnim;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Menus, Classes, ActnList, StdCtrls,
  ComCtrls, DBCtrls, ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmVizmatiVinnim = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    Panel2: TPanel;
    DBRichEdit1: TDBRichEdit;
    btnDokladno: TButton;
    Panel3: TPanel;
    edtFind: TEdit;
    alViznatiVinnim: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    btnUpdate: TButton;
    aDokladno: TAction;
    PopupMenu: TPopupMenu;
    mnAdd: TMenuItem;
    mnEdit: TMenuItem;
    mnDelete: TMenuItem;
    mnChoice: TMenuItem;
    mnUpdate: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    mnClose: TMenuItem;
    aSortByKod: TAction;
    aSortByZmist: TAction;
    mnSortByKod: TMenuItem;
    mnSortByZmist: TMenuItem;
    qViznatiVinnim: TIBQuery;
    dsViznatiVinnim: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure edtFindChange(Sender: TObject);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aDokladnoExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByZmistExecute(Sender: TObject);
    procedure qViznatiVinnimFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmVizmatiVinnim: TfrmVizmatiVinnim;

implementation

uses
  Main, AdminZapobizhZahodiEdit, ShtrafiEdit, VizmatiVinnimEdit;

{$R *.dfm}

procedure TfrmVizmatiVinnim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmVizmatiVinnim.qViznatiVinnim.Close;

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

procedure TfrmVizmatiVinnim.FormResize(Sender: TObject);
begin
  frmVizmatiVinnim.edtFind.Left:=4;
  frmVizmatiVinnim.edtFind.Width:=frmVizmatiVinnim.Width-16;
end;

procedure TfrmVizmatiVinnim.edtFindChange(Sender: TObject);
begin
  frmVizmatiVinnim.qViznatiVinnim.Filtered:=false;
  if frmVizmatiVinnim.edtFind.Text<>'' then frmVizmatiVinnim.qViznatiVinnim.Filtered:=true else frmVizmatiVinnim.qViznatiVinnim.Filtered:=false;
end;

procedure TfrmVizmatiVinnim.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVizmatiVinnimEdit') then frmVizmatiVinnimEdit:=TfrmVizmatiVinnimEdit.Create(self);
  frmMain.Enabled:=false;
  frmVizmatiVinnimEdit.Show;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVizmatiVinnim.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then frmVizmatiVinnim.Enabled:=false;
  frmVizmatiVinnimEdit.Caption:='Додавання суті порушення';
  frmVizmatiVinnimEdit.Position:=poMainFormCenter;
  frmVizmatiVinnimEdit.BorderStyle:=bsDialog;

  frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
  frmVizmatiVinnimEdit.edtKodPoly.Enabled:=false;
  frmVizmatiVinnimEdit.btnKodPoly.Enabled:=false;

  frmVizmatiVinnimEdit.edtZmist.Text:='';
  frmVizmatiVinnimEdit.edtZmist.Enabled:=true;

  frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
  frmVizmatiVinnimEdit.reViznatiVinnim.MaxLength:=$7FFFFFF0;
  frmVizmatiVinnimEdit.reViznatiVinnim.Enabled:=true;

  frmVizmatiVinnimEdit.edtZmist.SetFocus;
end;

procedure TfrmVizmatiVinnim.aEditExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmVizmatiVinnim.qViznatiVinnim.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVizmatiVinnimEdit') then frmVizmatiVinnimEdit:=TfrmVizmatiVinnimEdit.Create(self);
  frmMain.Enabled:=false;
  frmVizmatiVinnimEdit.Show;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVizmatiVinnim.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then frmVizmatiVinnim.Enabled:=false;
  frmVizmatiVinnimEdit.Caption:='Редагування суті порушення';
  frmVizmatiVinnimEdit.Position:=poMainFormCenter;
  frmVizmatiVinnimEdit.BorderStyle:=bsDialog;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('KODPOLY').IsNull then frmVizmatiVinnimEdit.edtKodPoly.Text:=IntToStr(frmVizmatiVinnim.qViznatiVinnim.FieldByName('KODPOLY').Value) else frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
  frmVizmatiVinnimEdit.edtKodPoly.Enabled:=false;
  frmVizmatiVinnimEdit.btnKodPoly.Enabled:=false;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('ZMIST').IsNull then frmVizmatiVinnimEdit.edtZmist.Text:=frmVizmatiVinnim.qViznatiVinnim.FieldByName('ZMIST').Value else frmVizmatiVinnimEdit.edtZmist.Text:='';
  frmVizmatiVinnimEdit.edtZmist.Enabled:=true;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM').IsNull then
  begin
    frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    frmVizmatiVinnimEdit.reViznatiVinnim.MaxLength:=$7FFFFFF0;
    BlobStream:=TMemoryStream.Create;
    try
      (frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Assign(frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM') as TBlobField) else frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    finally
      BlobStream.Free;
    end;
  end
  else
  begin
    frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    frmVizmatiVinnimEdit.reViznatiVinnim.Text:='';
  end;
  frmVizmatiVinnimEdit.reViznatiVinnim.Enabled:=true;
  frmVizmatiVinnimEdit.edtZmist.SetFocus;
end;

procedure TfrmVizmatiVinnim.aDeleteExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmVizmatiVinnim.qViznatiVinnim.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVizmatiVinnimEdit') then frmVizmatiVinnimEdit:=TfrmVizmatiVinnimEdit.Create(self);
  frmMain.Enabled:=false;
  frmVizmatiVinnimEdit.Show;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVizmatiVinnim.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then frmVizmatiVinnim.Enabled:=false;
  frmVizmatiVinnimEdit.Caption:='Видалення суті порушення';
  frmVizmatiVinnimEdit.Position:=poMainFormCenter;
  frmVizmatiVinnimEdit.BorderStyle:=bsDialog;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('KODPOLY').IsNull then frmVizmatiVinnimEdit.edtKodPoly.Text:=IntToStr(frmVizmatiVinnim.qViznatiVinnim.FieldByName('KODPOLY').Value) else frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
  frmVizmatiVinnimEdit.edtKodPoly.Enabled:=false;
  frmVizmatiVinnimEdit.btnKodPoly.Enabled:=false;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('ZMIST').IsNull then frmVizmatiVinnimEdit.edtZmist.Text:=frmVizmatiVinnim.qViznatiVinnim.FieldByName('ZMIST').Value else frmVizmatiVinnimEdit.edtZmist.Text:='';
  frmVizmatiVinnimEdit.edtZmist.Enabled:=false;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM').IsNull then
  begin
    frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    frmVizmatiVinnimEdit.reViznatiVinnim.MaxLength:=$7FFFFFF0;
    BlobStream:=TMemoryStream.Create;
    try
      (frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Assign(frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM') as TBlobField) else frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    finally
      BlobStream.Free;
    end;
  end
  else
  begin
    frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    frmVizmatiVinnimEdit.reViznatiVinnim.Text:='';
  end;
  frmVizmatiVinnimEdit.reViznatiVinnim.Enabled:=false;
  frmVizmatiVinnimEdit.btnVidminiti.SetFocus;
end;

procedure TfrmVizmatiVinnim.aChoiceExecute(Sender: TObject);
var
  BlobStream: TMemoryStream;
begin
  if frmVizmatiVinnim.qViznatiVinnim.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVizmatiVinnimEdit') then frmVizmatiVinnimEdit:=TfrmVizmatiVinnimEdit.Create(self);
  frmMain.Enabled:=false;
  if frmMain.IsFormOpen('frmShtrafiEdit') then frmVizmatiVinnim.Enabled:=false;
  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then frmVizmatiVinnim.Enabled:=false;
  frmVizmatiVinnimEdit.Show;
  frmVizmatiVinnimEdit.Caption:='Вибір суті порушення';
  frmVizmatiVinnimEdit.Position:=poMainFormCenter;
  frmVizmatiVinnimEdit.BorderStyle:=bsDialog;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('KODPOLY').IsNull then frmVizmatiVinnimEdit.edtKodPoly.Text:=IntToStr(frmVizmatiVinnim.qViznatiVinnim.FieldByName('KODPOLY').Value) else frmVizmatiVinnimEdit.aKodUpdateExecute(sender);
  frmVizmatiVinnimEdit.edtKodPoly.Enabled:=false;
  frmVizmatiVinnimEdit.btnKodPoly.Enabled:=false;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('ZMIST').IsNull then frmVizmatiVinnimEdit.edtZmist.Text:=frmVizmatiVinnim.qViznatiVinnim.FieldByName('ZMIST').Value else frmVizmatiVinnimEdit.edtZmist.Text:='';
  frmVizmatiVinnimEdit.edtZmist.Enabled:=false;

  if not frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM').IsNull then
  begin
    frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    frmVizmatiVinnimEdit.reViznatiVinnim.MaxLength:=$7FFFFFF0;
    BlobStream:=TMemoryStream.Create;
    try
      (frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM') as TBlobField).SaveToStream(BlobStream);
      BlobStream.Position:=0;
      if BlobStream<>nil then frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Assign(frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM') as TBlobField) else frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    finally
      BlobStream.Free;
    end;
  end
  else
  begin
    frmVizmatiVinnimEdit.reViznatiVinnim.Lines.Clear;
    frmVizmatiVinnimEdit.reViznatiVinnim.Text:='';
  end;
  frmVizmatiVinnimEdit.reViznatiVinnim.Enabled:=false;
  frmVizmatiVinnimEdit.btnVikonati.SetFocus;
end;

procedure TfrmVizmatiVinnim.aUpdateExecute(Sender: TObject);
begin
  with frmVizmatiVinnim do
  begin
    qViznatiVinnim.SQL.Clear;
    qViznatiVinnim.SQL.Text:='select * from VIZNATIVINNIM order by ZMIST';
    qViznatiVinnim.Open;
    aSortByKod.Checked:=false;
    aSortByZmist.Checked:=true;
  end;
end;

procedure TfrmVizmatiVinnim.aCloseExecute(Sender: TObject);
begin
  frmVizmatiVinnim.Close;
end;

procedure TfrmVizmatiVinnim.aDokladnoExecute(Sender: TObject);
begin
  if frmVizmatiVinnim.Panel2.Visible then frmVizmatiVinnim.Panel2.Visible:=false else frmVizmatiVinnim.Panel2.Visible:=true;
end;

procedure TfrmVizmatiVinnim.aSortByKodExecute(Sender: TObject);
begin
  with frmVizmatiVinnim do
  begin
    qViznatiVinnim.SQL.Clear;
    qViznatiVinnim.SQL.Text:='select * from VIZNATIVINNIM order by KODPOLY';
    qViznatiVinnim.Open;
    aSortByKod.Checked:=true;
    aSortByZmist.Checked:=false;
  end;
end;

procedure TfrmVizmatiVinnim.aSortByZmistExecute(Sender: TObject);
begin
  with frmVizmatiVinnim do
  begin
    qViznatiVinnim.SQL.Clear;
    qViznatiVinnim.SQL.Text:='select * from VIZNATIVINNIM order by ZMIST';
    qViznatiVinnim.Open;
    aSortByKod.Checked:=false;
    aSortByZmist.Checked:=true;
  end;
end;

procedure TfrmVizmatiVinnim.qViznatiVinnimFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if frmVizmatiVinnim.ActiveControl=frmVizmatiVinnim.edtFind then
    if frmMain.PosN(frmVizmatiVinnim.edtFind.Text,frmVizmatiVinnim.qViznatiVinnim.FieldByName('VIZVINNIM').Value,0)>0 then Accept:=true else Accept:=false;
end;

procedure TfrmVizmatiVinnim.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmVizmatiVinnim.dsViznatiVinnim;
end;

end.
