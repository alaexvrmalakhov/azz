unit OdiniciVimiru;

interface

uses
  Forms, Menus, Classes, ActnList, DB, IBCustomDataSet, IBQuery, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, SysUtils;

type
  TfrmOdiniciVimiru = class(TForm)
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    DBGrid1: TDBGrid;
    qOdiniciVimiru: TIBQuery;
    dsOdiniciVimiru: TDataSource;
    alOdiniciVimiru: TActionList;
    btnUpdate: TButton;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aUpdate: TAction;
    aChoice: TAction;
    aClose: TAction;
    aSortByPovnaNazva: TAction;
    aSortBySkorochenNazva: TAction;
    aSortByMnozhnik: TAction;
    aSortByKod: TAction;
    PopupMenu: TPopupMenu;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aSortByKodExecute(Sender: TObject);
    procedure aSortByPovnaNazvaExecute(Sender: TObject);
    procedure aSortBySkorochenNazvaExecute(Sender: TObject);
    procedure aSortByMnozhnikExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmOdiniciVimiru: TfrmOdiniciVimiru;

implementation

uses
  Main, OdiniciVimiruEdit;

{$R *.dfm}

procedure TfrmOdiniciVimiru.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOdiniciVimiru.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOdiniciVimiruEdit') then frmOdiniciVimiruEdit:=TfrmOdiniciVimiruEdit.Create(self);
  frmMain.Enabled:=false;
  frmOdiniciVimiruEdit.Show;
  frmOdiniciVimiruEdit.Caption:='Додавання одиниці виміру';
  frmOdiniciVimiruEdit.BorderStyle:=bsDialog;
  frmOdiniciVimiruEdit.Position:=poMainFormCenter;
  frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
  frmOdiniciVimiruEdit.edtKod.Enabled:=false;
  frmOdiniciVimiruEdit.btnKod.Enabled:=false;
  frmOdiniciVimiruEdit.edtPovnaNazva.Text:='';
  frmOdiniciVimiruEdit.edtPovnaNazva.Enabled:=true;
  frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:='';
  frmOdiniciVimiruEdit.edtPovanaNazvaRV.Enabled:=true;
  frmOdiniciVimiruEdit.btnPovnaNazvaRV.Enabled:=true;
  frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:='';
  frmOdiniciVimiruEdit.edtSkorochenaNazva.Enabled:=true;
  frmOdiniciVimiruEdit.edtMnozhnik.Text:='';
  frmOdiniciVimiruEdit.edtMnozhnik.Enabled:=true;
  frmOdiniciVimiruEdit.rgVid.ItemIndex:=-1;
  frmOdiniciVimiruEdit.rgVid.Enabled:=true;
  frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
end;

procedure TfrmOdiniciVimiru.aEditExecute(Sender: TObject);
begin
  if frmOdiniciVimiru.qOdiniciVimiru.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOdiniciVimiruEdit') then frmOdiniciVimiruEdit:=TfrmOdiniciVimiruEdit.Create(self);
  frmMain.Enabled:=false;
  frmOdiniciVimiruEdit.Show;
  frmOdiniciVimiruEdit.Caption:='Редагування одиниці виміру';
  frmOdiniciVimiruEdit.BorderStyle:=bsDialog;
  frmOdiniciVimiruEdit.Position:=poMainFormCenter;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('KOD').IsNull then frmOdiniciVimiruEdit.edtKod.Text:=IntToStr(frmOdiniciVimiru.qOdiniciVimiru.FieldByName('KOD').Value) else frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
  frmOdiniciVimiruEdit.edtKod.Enabled:=false;
  frmOdiniciVimiruEdit.btnKod.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANIE').IsNull then frmOdiniciVimiruEdit.edtPovnaNazva.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANIE').Value else frmOdiniciVimiruEdit.edtPovnaNazva.Text:=''; 
  frmOdiniciVimiruEdit.edtPovnaNazva.Enabled:=true;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANE_RP').IsNull then frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANE_RP').Value else frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:='';
  frmOdiniciVimiruEdit.edtPovanaNazvaRV.Enabled:=true;
  frmOdiniciVimiruEdit.btnPovnaNazvaRV.Enabled:=true;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('SOKRASCHENNOE_NAZVANIE').IsNull then frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('SOKRASCHENNOE_NAZVANIE').Value else frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:='';
  frmOdiniciVimiruEdit.edtSkorochenaNazva.Enabled:=true;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('MNOZHITEL').IsNull then frmOdiniciVimiruEdit.edtMnozhnik.Text:=FloatToStr(frmOdiniciVimiru.qOdiniciVimiru.FieldByName('MNOZHITEL').Value) else frmOdiniciVimiruEdit.edtMnozhnik.Text:='';
  frmOdiniciVimiruEdit.edtMnozhnik.Enabled:=true;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('VID').IsNull then frmOdiniciVimiruEdit.rgVid.ItemIndex:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('VID').Value else frmOdiniciVimiruEdit.rgVid.ItemIndex:=-1; 
  frmOdiniciVimiruEdit.rgVid.Enabled:=true;
  frmOdiniciVimiruEdit.edtPovnaNazva.SetFocus;
end;

procedure TfrmOdiniciVimiru.aDeleteExecute(Sender: TObject);
begin
  if frmOdiniciVimiru.qOdiniciVimiru.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOdiniciVimiruEdit') then frmOdiniciVimiruEdit:=TfrmOdiniciVimiruEdit.Create(self);
  frmMain.Enabled:=false;
  frmOdiniciVimiruEdit.Show;
  frmOdiniciVimiruEdit.Caption:='Видалення одиниці виміру';
  frmOdiniciVimiruEdit.BorderStyle:=bsDialog;
  frmOdiniciVimiruEdit.Position:=poMainFormCenter;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('KOD').IsNull then frmOdiniciVimiruEdit.edtKod.Text:=IntToStr(frmOdiniciVimiru.qOdiniciVimiru.FieldByName('KOD').Value) else frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
  frmOdiniciVimiruEdit.edtKod.Enabled:=false;
  frmOdiniciVimiruEdit.btnKod.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANIE').IsNull then frmOdiniciVimiruEdit.edtPovnaNazva.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANIE').Value else frmOdiniciVimiruEdit.edtPovnaNazva.Text:='';
  frmOdiniciVimiruEdit.edtPovnaNazva.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANE_RP').IsNull then frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANE_RP').Value else frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:='';
  frmOdiniciVimiruEdit.edtPovanaNazvaRV.Enabled:=false;
  frmOdiniciVimiruEdit.btnPovnaNazvaRV.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('SOKRASCHENNOE_NAZVANIE').IsNull then frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('SOKRASCHENNOE_NAZVANIE').Value else frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:='';
  frmOdiniciVimiruEdit.edtSkorochenaNazva.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('MNOZHITEL').IsNull then frmOdiniciVimiruEdit.edtMnozhnik.Text:=FloatToStr(frmOdiniciVimiru.qOdiniciVimiru.FieldByName('MNOZHITEL').Value) else frmOdiniciVimiruEdit.edtMnozhnik.Text:='';
  frmOdiniciVimiruEdit.edtMnozhnik.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('VID').IsNull then frmOdiniciVimiruEdit.rgVid.ItemIndex:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('VID').Value else frmOdiniciVimiruEdit.rgVid.ItemIndex:=-1;
  frmOdiniciVimiruEdit.rgVid.Enabled:=false;
  frmOdiniciVimiruEdit.btnVidminiti.SetFocus;
end;

procedure TfrmOdiniciVimiru.aChoiceExecute(Sender: TObject);
begin
  if frmOdiniciVimiru.qOdiniciVimiru.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOdiniciVimiruEdit') then frmOdiniciVimiruEdit:=TfrmOdiniciVimiruEdit.Create(self);
  frmOdiniciVimiru.Enabled:=false;
  frmOdiniciVimiruEdit.Show;
  frmOdiniciVimiruEdit.Caption:='Вибір одиниці виміру';
  frmOdiniciVimiruEdit.BorderStyle:=bsDialog;
  frmOdiniciVimiruEdit.Position:=poMainFormCenter;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('KOD').IsNull then frmOdiniciVimiruEdit.edtKod.Text:=IntToStr(frmOdiniciVimiru.qOdiniciVimiru.FieldByName('KOD').Value) else frmOdiniciVimiruEdit.aKodUpdateExecute(sender);
  frmOdiniciVimiruEdit.edtKod.Enabled:=false;
  frmOdiniciVimiruEdit.btnKod.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANIE').IsNull then frmOdiniciVimiruEdit.edtPovnaNazva.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANIE').Value else frmOdiniciVimiruEdit.edtPovnaNazva.Text:='';
  frmOdiniciVimiruEdit.edtPovnaNazva.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANE_RP').IsNull then frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('POLNOE_NAZVANE_RP').Value else frmOdiniciVimiruEdit.edtPovanaNazvaRV.Text:='';
  frmOdiniciVimiruEdit.edtPovanaNazvaRV.Enabled:=false;
  frmOdiniciVimiruEdit.btnPovnaNazvaRV.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('SOKRASCHENNOE_NAZVANIE').IsNull then frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('SOKRASCHENNOE_NAZVANIE').Value else frmOdiniciVimiruEdit.edtSkorochenaNazva.Text:='';
  frmOdiniciVimiruEdit.edtSkorochenaNazva.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('MNOZHITEL').IsNull then frmOdiniciVimiruEdit.edtMnozhnik.Text:=FloatToStr(frmOdiniciVimiru.qOdiniciVimiru.FieldByName('MNOZHITEL').Value) else frmOdiniciVimiruEdit.edtMnozhnik.Text:='';
  frmOdiniciVimiruEdit.edtMnozhnik.Enabled:=false;
  if not frmOdiniciVimiru.qOdiniciVimiru.FieldByName('VID').IsNull then frmOdiniciVimiruEdit.rgVid.ItemIndex:=frmOdiniciVimiru.qOdiniciVimiru.FieldByName('VID').Value else frmOdiniciVimiruEdit.rgVid.ItemIndex:=-1;
  frmOdiniciVimiruEdit.rgVid.Enabled:=false;
  frmOdiniciVimiruEdit.btnVikonati.SetFocus;
end;

procedure TfrmOdiniciVimiru.aUpdateExecute(Sender: TObject);
begin
  with frmOdiniciVimiru do
  begin
    qOdiniciVimiru.SQL.Clear;
    qOdiniciVimiru.SQL.Text:='select * from ODINICI_VIMIRU order by POLNOE_NAZVANIE';
    qOdiniciVimiru.Open;
    aSortByKod.Checked:=false;
    aSortByPovnaNazva.Checked:=true;
    aSortBySkorochenNazva.Checked:=false;
    aSortByMnozhnik.Checked:=false;
  end;
end;

procedure TfrmOdiniciVimiru.aCloseExecute(Sender: TObject);
begin
  frmOdiniciVimiru.Close;
end;

procedure TfrmOdiniciVimiru.aSortByKodExecute(Sender: TObject);
begin
  with frmOdiniciVimiru do
  begin
    qOdiniciVimiru.SQL.Clear;
    qOdiniciVimiru.SQL.Text:='select * from ODINICI_VIMIRU order by KOD';
    qOdiniciVimiru.Open;
    aSortByKod.Checked:=true;
    aSortByPovnaNazva.Checked:=false;
    aSortBySkorochenNazva.Checked:=false;
    aSortByMnozhnik.Checked:=false;
  end;
end;

procedure TfrmOdiniciVimiru.aSortByPovnaNazvaExecute(Sender: TObject);
begin
  with frmOdiniciVimiru do
  begin
    qOdiniciVimiru.SQL.Clear;
    qOdiniciVimiru.SQL.Text:='select * from ODINICI_VIMIRU order by POLNOE_NAZVANIE';
    qOdiniciVimiru.Open;
    aSortByKod.Checked:=false;
    aSortByPovnaNazva.Checked:=true;
    aSortBySkorochenNazva.Checked:=false;
    aSortByMnozhnik.Checked:=false;
  end;
end;

procedure TfrmOdiniciVimiru.aSortBySkorochenNazvaExecute(Sender: TObject);
begin
  with frmOdiniciVimiru do
  begin
    qOdiniciVimiru.SQL.Clear;
    qOdiniciVimiru.SQL.Text:='select * from ODINICI_VIMIRU order by SOKRASCHENNOE_NAZVANIE';
    qOdiniciVimiru.Open;
    aSortByKod.Checked:=false;
    aSortByPovnaNazva.Checked:=false;
    aSortBySkorochenNazva.Checked:=true;
    aSortByMnozhnik.Checked:=false;
  end;
end;

procedure TfrmOdiniciVimiru.aSortByMnozhnikExecute(Sender: TObject);
begin
  with frmOdiniciVimiru do
  begin
    qOdiniciVimiru.SQL.Clear;
    qOdiniciVimiru.SQL.Text:='select * from ODINICI_VIMIRU order by MNOZHITEL';
    qOdiniciVimiru.Open;
    aSortByKod.Checked:=false;
    aSortByPovnaNazva.Checked:=false;
    aSortBySkorochenNazva.Checked:=false;
    aSortByMnozhnik.Checked:=true;
  end;
end;

procedure TfrmOdiniciVimiru.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=dsOdiniciVimiru;
end;

end.
