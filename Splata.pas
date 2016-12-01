unit Splata;

interface

uses
  Forms, Classes, ActnList, ComCtrls, StdCtrls, Controls, SysUtils;

type
  TfrmSplata = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtNomerPlatizhki: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    dtpDataSplati: TDateTimePicker;
    alSplata: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtNomerPostanovi: TEdit;
    dtpDataPostanovi: TDateTimePicker;
    edtKod: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmSplata: TfrmSplata;

implementation

uses
  Main, FinansoviSankcii, ViluchennyZRealizacii, Shtrafi;

{$R *.dfm}

procedure TfrmSplata.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
//    if frmShtrafi.ActiveControl=frmShtrafi.btnSplata then
//    begin
//      frmMain.Enabled:=true;
//      Action:=caFree;
//      exit;
//    end;
//
//  if frmMain.IsFormOpen('frmFinansoviSankcii') then
//    if frmFinansoviSankcii.Showing then
//    begin
//      frmMain.Enabled:=true;
//      exit;
//    end;
//
//  if frmMain.IsFormOpen('frmViluchennyZRealizacii') then
//    if frmViluchennyZRealizacii.Showing then
//    begin
//      frmViluchennyZRealizacii.Enabled:=true;
//      exit;
//    end;
  if frmMain.IsFormOpen('frmShtrafi') then
  begin
    frmShtrafi.aUpdateExecute(sender);
    with frmShtrafi.qShtrafi do
    begin
      SQL.Clear;
      SQL.Text:='update POSTANOVASHTRAF set EDITING=0 where KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Kod';
      Params[0].Value:=StrToInt(frmSplata.edtKod.Text);
      Open;
      frmMain.trAzz.CommitRetaining;
      frmShtrafi.aUpdateExecute(sender);
      frmShtrafi.qShtrafi.Last;
    end;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmSplata.aCancelExecute(Sender: TObject);
begin
  frmSplata.Close;
end;

procedure TfrmSplata.aOKExecute(Sender: TObject);
begin
  if (frmMain.IsFormOpen('frmFinansoviSankcii'))and(frmMain.ActiveMDIChild=frmFinansoviSankcii) then
  begin
    with frmFinansoviSankcii do
    begin
        qFinansoviSankcii.SQL.Clear;
        qFinansoviSankcii.SQL.Text:='update FINANSOVI_SANKCII set NOMER_PLATIZHKI=:NOMER_PLATIZHKI,DATA_SPLATI=:DATA_SPLATI where RECORD_ID=:Kod';
        qFinansoviSankcii.Params.Clear;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[0].Name:='NOMER_PLATIZHKI';
        qFinansoviSankcii.Params[0].Value:=frmSplata.edtNomerPlatizhki.Text;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[1].Name:='DATA_SPLATI';
        qFinansoviSankcii.Params[1].Value:=DateToStr(int(frmSplata.dtpDataSplati.Date));
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[2].Name:='Kod';
        qFinansoviSankcii.Params[2].Value:=frmSplata.edtKod.Text;
        qFinansoviSankcii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmSplata.Close;
    frmFinansoviSankcii.aUpdateExecute(sender);
    exit;
  end;
{
  if frmSplata.edtNomerPlatizhki.Text='' then exit;
  if (frmMain.IsFormOpen('frmFinansoviSankcii'))and(frmFinansoviSankcii.Showing) then
  begin
    frmFinansoviSankcii.tblFinansoviSankcii.Edit;
    frmFinansoviSankcii.tblFinansoviSankciiNOMER_PLATIZHKI.Value:=frmSplata.edtNomerPlatizhki.Text;
    frmFinansoviSankcii.tblFinansoviSankciiDATA_SPLATI.Value:=int(frmSplata.dtpDataSplati.Date);
    frmFinansoviSankcii.tblFinansoviSankcii.Post;
    frmMain.IBTransaction1.CommitRetaining;
    frmSplata.Close;
    exit;
  end;
}

  if ((frmMain.IsFormOpen('frmViluchennyZRealizacii'))and(frmMain.ActiveMDIChild=frmViluchennyZRealizacii)and(frmViluchennyZRealizacii.ActiveControl=frmViluchennyZRealizacii.btnVikonanny)) then
  begin
      with frmViluchennyZRealizacii.qViluchennyZRealizacii do
      begin
        SQL.Clear;
        SQL.Text:='update VILUCHENNY_Z_REALIZACII set NOMER_PLATIZHKI=:NomerPlatizhki,DATA_SPLATI=:DataSplati where RECORD_ID=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='NomerPlatizhki';
        Params[0].Value:=frmSplata.edtNomerPlatizhki.Text;
        Params.Add;
        Params[1].Name:='DataSplati';
        Params[1].Value:=DateToStr(int(frmSplata.dtpDataSplati.Date));
        Params.Add;
        Params[2].Name:='Kod';
        Params[2].Value:=frmSplata.edtKod.Text;
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmSplata.Close;
      frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
      exit;
    end;

  if (frmMain.IsFormOpen('frmShtrafi'))and(frmShtrafi.ActiveControl=frmShtrafi.btnSplata)and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    frmShtrafi.qShtrafi.SQL.Clear;
    frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set NOMERPLATIZHNOGODOKUMENTU=:NOMERPLATIZHNOGODOKUMENTU,DATAPLATIZHNOGODOKUMENTU=:DATAPLATIZHNOGODOKUMENTU,EDITING=0 where KOD=:Kod';
    frmShtrafi.qShtrafi.Params.Clear;
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[0].Name:='NOMERPLATIZHNOGODOKUMENTU';
    frmShtrafi.qShtrafi.Params[0].Value:=frmSplata.edtNomerPlatizhki.Text;
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[1].Name:='DATAPLATIZHNOGODOKUMENTU';
    frmShtrafi.qShtrafi.Params[1].Value:=DateToStr(frmSplata.dtpDataSplati.Date);
    frmShtrafi.qShtrafi.Params.Add;
    frmShtrafi.qShtrafi.Params[2].Name:='Kod';
    frmShtrafi.qShtrafi.Params[2].Value:=frmSplata.edtKod.Text;
    frmShtrafi.qShtrafi.Open;
    frmMain.trAzz.CommitRetaining;
    frmShtrafi.aUpdateExecute(sender);
    frmSplata.Close;
    exit;
  end;
//  frmSplata.Close;
end;

end.
