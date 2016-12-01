unit Oskarzhenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, ComCtrls, SysUtils;

type
  TfrmOskarzhenny = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnKudiOskarzheno_Update: TButton;
    Label3: TLabel;
    btnRezultatOskarzhenny_Update: TButton;
    vrbVikonati: TButton;
    btnVidminiti: TButton;
    dtpDataOskarzhenny: TDateTimePicker;
    cbKudiOskarzheno: TComboBox;
    cbRezultatOskarzhenny: TComboBox;
    alOskarzhenny: TActionList;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtNomerPostanovi: TEdit;
    dtpDataPostanovi: TDateTimePicker;
    edtKod: TEdit;
    aKudiOskarzheno_Update: TAction;
    aKudiOskarzheno_Choice: TAction;
    btnKudiOskarzheno_Choice: TButton;
    btnRezultatOskarzhenny_Choice: TButton;
    aRezultatOskarzhenny_Update: TAction;
    aRezultatOskarzhenny_Choice: TAction;
    aOK: TAction;
    aCancel: TAction;
    qOskarzhenny: TIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKudiOskarzheno_UpdateExecute(Sender: TObject);
    procedure aKudiOskarzheno_ChoiceExecute(Sender: TObject);
    procedure aRezultatOskarzhenny_UpdateExecute(Sender: TObject);
    procedure aRezultatOskarzhenny_ChoiceExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  end;

var
  frmOskarzhenny: TfrmOskarzhenny;

implementation

uses
  Main, FinansoviSankcii, ViluchennyZRealizacii, AdminZapobizhZahodi,
  Shtrafi, KudiOskarzheno, Oskargenny;

{$R *.dfm}

procedure TfrmOskarzhenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
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
      Params[0].Value:=StrToInt(frmOskarzhenny.edtKod.Text);
      Open;
      frmMain.trAzz.CommitRetaining;
      frmShtrafi.aUpdateExecute(sender);
      frmShtrafi.qShtrafi.Last;
    end;
  end;
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmOskarzhenny.aKudiOskarzheno_UpdateExecute(Sender: TObject);
begin
  with frmOskarzhenny do
  begin
    qOskarzhenny.SQL.Clear;
    qOskarzhenny.SQL.Text:='select * from KUDIOSKARZHENO order by NAZVAORGANIZACIIOSKARZHENO';
    qOskarzhenny.Open;
    cbKudiOskarzheno.Text:='';
    cbKudiOskarzheno.Items.Clear;
    qOskarzhenny.First;
    while not qOskarzhenny.Eof do
    begin
      cbKudiOskarzheno.Items.Add(qOskarzhenny.FieldByName('NAZVAORGANIZACIIOSKARZHENO').Value);
      qOskarzhenny.Next;
    end;
  end;
end;

procedure TfrmOskarzhenny.aKudiOskarzheno_ChoiceExecute(Sender: TObject);
begin
  frmOskarzhenny.Enabled:=false;
  frmMain.aKudiOskarzhenoExecute(sender);
  frmKudiOskarzheno.aChoice.Enabled:=true;
  frmKudiOskarzheno.Left:=frmMain.Left+70;
  frmKudiOskarzheno.Top:=frmMain.Top+70;
  frmKudiOskarzheno.Width:=frmMain.Width-70;
  frmKudiOskarzheno.Height:=frmMain.Height-70;
  frmKudiOskarzheno.Position:=poMainFormCenter;
  frmKudiOskarzheno.FormStyle:=fsNormal;
  frmKudiOskarzheno.BorderStyle:=bsDialog;
end;

procedure TfrmOskarzhenny.aRezultatOskarzhenny_UpdateExecute(
  Sender: TObject);
begin
  with frmOskarzhenny do
  begin
    qOskarzhenny.SQL.Clear;
    qOskarzhenny.SQL.Text:='select * from OSKARZHENNY order by OSKARZHENNY';
    qOskarzhenny.Open;
    cbRezultatOskarzhenny.Text:='';
    cbRezultatOskarzhenny.Items.Clear;
    qOskarzhenny.First;
    while not qOskarzhenny.Eof do
    begin
      cbRezultatOskarzhenny.Items.Add(qOskarzhenny.FieldByName('OSKARZHENNY').Value);
      qOskarzhenny.Next;
    end;
  end;
end;

procedure TfrmOskarzhenny.aRezultatOskarzhenny_ChoiceExecute(
  Sender: TObject);
begin
  frmOskarzhenny.Enabled:=false;
  frmMain.Enabled:=false;
  frmMain.aOskarzhennyExecute(sender);
  frmOskargenny.aChoice.Enabled:=true;
  frmOskargenny.Left:=frmMain.Left+70;
  frmOskargenny.Top:=frmMain.Top+70;
  frmOskargenny.Width:=frmMain.Width-70;
  frmOskargenny.Height:=frmMain.Height-70;
  frmOskargenny.Position:=poMainFormCenter;
  frmOskargenny.FormStyle:=fsNormal;
  frmOskargenny.BorderStyle:=bsDialog;
end;

procedure TfrmOskarzhenny.aOKExecute(Sender: TObject);
begin
  if (frmMain.IsFormOpen('frmFinansoviSankcii'))and(frmMain.ActiveMDIChild=frmFinansoviSankcii) then
   begin
    with frmFinansoviSankcii do
    begin
        qFinansoviSankcii.SQL.Clear;
        qFinansoviSankcii.SQL.Text:='update FINANSOVI_SANKCII set DATA_OSKARZHENNY=:DATA_OSKARZHENNY,KUDI_OSKARZHENO=:KUDI_OSKARZHENO,REZULTAT_OSKARZHENNY=:REZULTAT_OSKARZHENNY where RECORD_ID=:Kod';
        qFinansoviSankcii.Params.Clear;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[0].Name:='DATA_OSKARZHENNY';
        qFinansoviSankcii.Params[0].Value:=DateToStr(int(frmOskarzhenny.dtpDataOskarzhenny.Date));
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[1].Name:='KUDI_OSKARZHENO';
        qFinansoviSankcii.Params[1].Value:=frmOskarzhenny.cbKudiOskarzheno.Text;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[2].Name:='REZULTAT_OSKARZHENNY';
        qFinansoviSankcii.Params[2].Value:=frmOskarzhenny.cbRezultatOskarzhenny.Text;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[3].Name:='Kod';
        qFinansoviSankcii.Params[3].Value:=frmOskarzhenny.edtKod.Text;
        qFinansoviSankcii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmOskarzhenny.Close;
    frmFinansoviSankcii.aUpdateExecute(sender);
    exit;
  end;

  if (frmMain.IsFormOpen('frmViluchennyZRealizacii'))and(frmMain.ActiveMDIChild=frmViluchennyZRealizacii) then
  begin
    with frmViluchennyZRealizacii.qViluchennyZRealizacii do
    begin
        SQL.Clear;
        SQL.Text:='update VILUCHENNY_Z_REALIZACII set DATA_OSKARZHENNY=:DataOskarzhenny,KUDI_OSKARZHENO=:KudiOskarzheno,REZULTAT_OSKARZHENNY=:RezultatOskarzhenny where RECORD_ID=:Kod';
        Params.Clear;
        Params.Add;
        Params[0].Name:='DataOskarzhenny';
        Params[0].Value:=DateToStr(int(frmOskarzhenny.dtpDataOskarzhenny.Date));
        Params.Add;
        Params[1].Name:='KudiOskarzheno';
        Params[1].Value:=frmOskarzhenny.cbKudiOskarzheno.Text;
        Params.Add;
        Params[2].Name:='RezultatOskarzhenny';
        Params[2].Value:=frmOskarzhenny.cbRezultatOskarzhenny.Text;
        Params.Add;
        Params[3].Name:='Kod';
        Params[3].Value:=frmOskarzhenny.edtKod.Text;
        Open;
    end;
      frmMain.trAzz.CommitRetaining;
      frmOskarzhenny.Close;
      frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
      exit;
  end;

  if (frmMain.IsFormOpen('frmAdminZapobizhZahodi'))and(frmMain.ActiveMDIChild=frmAdminZapobizhZahodi) then
  begin
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Clear;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set DATA_OSKARZHENNY=:DATA_OSKARZHENNY,KUDI_OSKARZHENO=:KUDI_OSKARZHENO,REZULTAT_OSKARZHENNY=:REZULTAT_OSKARZHENNY where RECORD_ID=:Kod';
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Clear;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Name:='DATA_OSKARZHENNY';
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Value:=DateToStr(int(frmOskarzhenny.dtpDataOskarzhenny.Date));
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Name:='KUDI_OSKARZHENO';
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Value:=frmOskarzhenny.cbKudiOskarzheno.Text;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[2].Name:='REZULTAT_OSKARZHENNY';
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[2].Value:=frmOskarzhenny.cbRezultatOskarzhenny.Text;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[3].Name:='Kod';
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[3].Value:=frmOskarzhenny.edtKod.Text;
    frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Open;
    frmMain.trAzz.CommitRetaining;
    frmOskarzhenny.Close;
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafi')and(frmMain.ActiveMDIChild=frmShtrafi) then
  begin
    if frmShtrafi.ActiveControl=frmShtrafi.btnOskarzgenny then
    begin
      frmShtrafi.qShtrafi.SQL.Clear;
      frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set DATAOSKARZHENNYPOSTANOVI=:DATAOSKARZHENNYPOSTANOVI,KUDIOSKARGENO=:KUDIOSKARGENO,PRIJNYTERISHENNYPOOSKARZH=:PRIJNYTERISHENNYPOOSKARZH,EDITING=0 where KOD=:Kod';
      frmShtrafi.qShtrafi.Params.Clear;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[0].Name:='DATAOSKARZHENNYPOSTANOVI';
      frmShtrafi.qShtrafi.Params[0].Value:=DateToStr(frmOskarzhenny.dtpDataOskarzhenny.Date);
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[1].Name:='KUDIOSKARGENO';
      frmShtrafi.qShtrafi.Params[1].Value:=frmOskarzhenny.cbKudiOskarzheno.Text;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[2].Name:='PRIJNYTERISHENNYPOOSKARZH';
      frmShtrafi.qShtrafi.Params[2].Value:=frmOskarzhenny.cbRezultatOskarzhenny.Text;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[3].Name:='Kod';
      frmShtrafi.qShtrafi.Params[3].Value:=frmOskarzhenny.edtKod.Text;
      frmShtrafi.qShtrafi.Open;
      frmMain.trAzz.CommitRetaining;
      frmShtrafi.aUpdateExecute(sender);
      frmOskarzhenny.Close;
      exit;
    end;
  end;
end;

procedure TfrmOskarzhenny.aCancelExecute(Sender: TObject);
begin
  frmOskarzhenny.Close;
end;

end.
