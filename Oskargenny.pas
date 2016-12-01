unit Oskargenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, Menus, StdCtrls,
  ExtCtrls, Controls, Grids, DBGrids, SysUtils;

type
  TfrmOskargenny = class(TForm)
    PopupMenu: TPopupMenu;
    mnDodati: TMenuItem;
    mnZminiti: TMenuItem;
    mnVidaliti: TMenuItem;
    mnVibrati: TMenuItem;
    N1: TMenuItem;
    mnVihid: TMenuItem;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnDodati: TButton;
    btnZminiti: TButton;
    btnVidaliti: TButton;
    btnZaktiti: TButton;
    btnVibrati: TButton;
    btnUpdate: TButton;
    alRezultatOskarzhenny: TActionList;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    mnUpdate: TMenuItem;
    dsRezultatOskarzhenny: TDataSource;
    qRezultatOskarzhenny: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  end;

var
  frmOskargenny: TfrmOskargenny;

implementation

uses
  Main, Oskarzhenny, OskargennyEdit;

{$R *.dfm}

procedure TfrmOskargenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmOskargenny.qRezultatOskarzhenny.Close;
//  if frmMain.IsFormOpen('frmZvyzok') then
//  begin
//    frmMain.Enabled:=false;
//    frmZvyzok.Enabled:=true;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmOskarzhenny') then
  begin
    frmMain.Enabled:=false;
    frmOskarzhenny.Enabled:=true;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOskargenny.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOskargennyEdit') then frmOskargennyEdit:=TfrmOskargennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmOskargennyEdit.Show;
  if frmMain.IsFormOpen('frmOskarzhenny') then frmOskargenny.Enabled:=false;
  frmOskargennyEdit.Caption:='Додавання результату оскарження';
  frmOskargennyEdit.Position:=poMainFormCenter;
  frmOskargennyEdit.BorderStyle:=bsDialog;

  frmOskargennyEdit.aKodUpdateExecute(sender);
  frmOskargennyEdit.edtKod.Enabled:=false;
  frmOskargennyEdit.btnKod.Enabled:=false;
  frmOskargennyEdit.edtOskargenny.Text:='';
  frmOskargennyEdit.edtOskargenny.Enabled:=true;
  frmOskargennyEdit.cbVidalenny.Checked:=false;
  frmOskargennyEdit.cbVidalenny.Caption:='Ні';
  frmOskargennyEdit.cbVidalenny.Enabled:=true;
  frmOskargennyEdit.edtOskargenny.SetFocus;
end;

procedure TfrmOskargenny.aEditExecute(Sender: TObject);
begin
  if frmOskargenny.qRezultatOskarzhenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOskargennyEdit') then frmOskargennyEdit:=TfrmOskargennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmOskargennyEdit.Show;
  if frmMain.IsFormOpen('frmOskarzhenny') then frmOskargenny.Enabled:=false;
  frmOskargennyEdit.Caption:='Редагування результату оскарження';
  frmOskargennyEdit.Position:=poMainFormCenter;
  frmOskargennyEdit.BorderStyle:=bsDialog;

  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('KOD').IsNull then frmOskargennyEdit.edtKod.Text:=IntToStr(frmOskargenny.qRezultatOskarzhenny.FieldByName('KOD').Value) else frmOskargennyEdit.aKodUpdateExecute(sender);
  frmOskargennyEdit.edtKod.Enabled:=false;
  frmOskargennyEdit.btnKod.Enabled:=false;
  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('OSKARZHENNY').IsNull then frmOskargennyEdit.edtOskargenny.Text:=frmOskargenny.qRezultatOskarzhenny.FieldByName('OSKARZHENNY').Value else frmOskargennyEdit.edtOskargenny.Text:='';
  frmOskargennyEdit.edtOskargenny.Enabled:=true;
  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('UDALENIE').IsNull then
    case frmOskargenny.qRezultatOskarzhenny.FieldByName('UDALENIE').Value of
      0:
        begin
          frmOskargennyEdit.cbVidalenny.Checked:=false;
          frmOskargennyEdit.cbVidalenny.Caption:='Ні';
        end;
      1:
        begin
          frmOskargennyEdit.cbVidalenny.Checked:=true;
          frmOskargennyEdit.cbVidalenny.Caption:='Так';
        end;
    end;
  frmOskargennyEdit.cbVidalenny.Enabled:=true;
  frmOskargennyEdit.edtOskargenny.SetFocus;
end;

procedure TfrmOskargenny.aDeleteExecute(Sender: TObject);
begin
  if frmOskargenny.qRezultatOskarzhenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOskargennyEdit') then frmOskargennyEdit:=TfrmOskargennyEdit.Create(self);
  frmMain.Enabled:=false;
  frmOskargennyEdit.Show;
  if frmMain.IsFormOpen('frmOskarzhenny') then frmOskargenny.Enabled:=false;
  frmOskargennyEdit.Caption:='Видалення результату оскарження';
  frmOskargennyEdit.Position:=poMainFormCenter;
  frmOskargennyEdit.BorderStyle:=bsDialog;

  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('KOD').IsNull then frmOskargennyEdit.edtKod.Text:=IntToStr(frmOskargenny.qRezultatOskarzhenny.FieldByName('KOD').Value) else frmOskargennyEdit.aKodUpdateExecute(sender);
  frmOskargennyEdit.edtKod.Enabled:=false;
  frmOskargennyEdit.btnKod.Enabled:=false;
  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('OSKARZHENNY').IsNull then frmOskargennyEdit.edtOskargenny.Text:=frmOskargenny.qRezultatOskarzhenny.FieldByName('OSKARZHENNY').Value else frmOskargennyEdit.edtOskargenny.Text:='';
  frmOskargennyEdit.edtOskargenny.Enabled:=false;
  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('UDALENIE').IsNull then
    case frmOskargenny.qRezultatOskarzhenny.FieldByName('UDALENIE').Value of
      0:
        begin
          frmOskargennyEdit.cbVidalenny.Checked:=false;
          frmOskargennyEdit.cbVidalenny.Caption:='Ні';
        end;
      1:
        begin
          frmOskargennyEdit.cbVidalenny.Checked:=true;
          frmOskargennyEdit.cbVidalenny.Caption:='Так';
        end;
    end;
  frmOskargennyEdit.cbVidalenny.Enabled:=false;
  frmOskargennyEdit.btnVidminiti.SetFocus;
end;

procedure TfrmOskargenny.aChoiceExecute(Sender: TObject);
begin
  if frmOskargenny.qRezultatOskarzhenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmOskargennyEdit') then frmOskargennyEdit:=TfrmOskargennyEdit.Create(self);
  if frmMain.IsFormOpen('frmOskarzhenny') then frmOskargenny.Enabled:=false;
  frmMain.Enabled:=false;
  frmOskargennyEdit.Show;
  frmOskargennyEdit.Caption:='Вибір результату оскарження';
  frmOskargennyEdit.Position:=poMainFormCenter;
  frmOskargennyEdit.BorderStyle:=bsDialog;

  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('KOD').IsNull then frmOskargennyEdit.edtKod.Text:=IntToStr(frmOskargenny.qRezultatOskarzhenny.FieldByName('KOD').Value) else frmOskargennyEdit.aKodUpdateExecute(sender);
  frmOskargennyEdit.edtKod.Enabled:=false;
  frmOskargennyEdit.btnKod.Enabled:=false;
  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('OSKARZHENNY').IsNull then frmOskargennyEdit.edtOskargenny.Text:=frmOskargenny.qRezultatOskarzhenny.FieldByName('OSKARZHENNY').Value else frmOskargennyEdit.edtOskargenny.Text:='';
  frmOskargennyEdit.edtOskargenny.Enabled:=false;
  if not frmOskargenny.qRezultatOskarzhenny.FieldByName('UDALENIE').IsNull then
    case frmOskargenny.qRezultatOskarzhenny.FieldByName('UDALENIE').Value of
      0:
        begin
          frmOskargennyEdit.cbVidalenny.Checked:=false;
          frmOskargennyEdit.cbVidalenny.Caption:='Ні';
        end;
      1:
        begin
          frmOskargennyEdit.cbVidalenny.Checked:=true;
          frmOskargennyEdit.cbVidalenny.Caption:='Так';
        end;
    end;
  frmOskargennyEdit.cbVidalenny.Enabled:=false;
  frmOskargennyEdit.btnVikonati.SetFocus;
end;

procedure TfrmOskargenny.aCloseExecute(Sender: TObject);
begin
  frmOskargenny.Close;
end;

procedure TfrmOskargenny.aUpdateExecute(Sender: TObject);
begin
  with frmOskargenny do
  begin
    qRezultatOskarzhenny.SQL.Clear;
    qRezultatOskarzhenny.SQL.Text:='select * from OSKARZHENNY order by OSKARZHENNY';
    qRezultatOskarzhenny.Open;
  end;
end;

procedure TfrmOskargenny.FormActivate(Sender: TObject);
begin
  frmMain.DBNavigator1.DataSource:=frmOskargenny.dsRezultatOskarzhenny;
end;

end.
