unit Vruchenny;

interface

uses
  Forms, Classes, ActnList, StdCtrls, ComCtrls, Controls, SysUtils;

type
  TfrmVruchenny = class(TForm)
    Label1: TLabel;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    dtpDataVruchenny: TDateTimePicker;
    cbSamolikvidaciy: TCheckBox;
    alVruchenny: TActionList;
    aOK: TAction;
    aCancel: TAction;
    Label2: TLabel;
    Label3: TLabel;
    edtNomerPostanovi: TEdit;
    dtpDataPostanovi: TDateTimePicker;
    Label4: TLabel;
    edtKod: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmVruchenny: TfrmVruchenny;

implementation

uses
  Main, Shtrafi, FinansoviSankcii, AdminZapobizhZahodi,
  ViluchennyZRealizacii, IBQuery;

{$R *.dfm}

procedure TfrmVruchenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.ActiveMDIChild.Name='frmShtrafi' then
  begin
    frmShtrafi.aUpdateExecute(sender);
    with frmShtrafi.qShtrafi do
    begin
      SQL.Clear;
      SQL.Text:='update POSTANOVASHTRAF set EDITING=0 where KOD=:Kod';
      Params.Clear;
      Params.Add;
      Params[0].Name:='Kod';
      Params[0].Value:=StrToInt(frmVruchenny.edtKod.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmShtrafi.aUpdateExecute(sender);
    frmShtrafi.qShtrafi.Last;
  end;

  if frmMain.ActiveMDIChild.Name='frmAdminZapobizhZahodi' then
  begin
{
    frmAdminZapobizhZahodi.aUpdateExecute(sender);
    with frmAdminZapobizhZahodi.qAdminZapobizhZahidi do
    begin
      SQL.Clear;
      SQL.Text:='update POSTANOVA_ADMIN set ';
    end;
}
  end;
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVruchenny.aCancelExecute(Sender: TObject);
begin
  frmVruchenny.Close;
end;

procedure TfrmVruchenny.aOKExecute(Sender: TObject);
begin
  if frmVruchenny.Caption='Зняття з контролю' then
  begin
    if (frmMain.IsFormOpen('frmAdminZapobizhZahodi'))and(frmMain.ActiveMDIChild=frmAdminZapobizhZahodi) then
    begin
      if frmAdminZapobizhZahodi.ActiveControl=frmAdminZapobizhZahodi.btnZnyttyZKontrolu then
      begin
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Clear;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set DATA_ZNYTTY=:DATA_ZNYTTY,SAMILIKVADACIY=:SAMILIKVADACIY where RECORD_ID=:Kod';
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Clear;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Name:='DATA_ZNYTTY';
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Value:=DateToStr(int(frmVruchenny.dtpDataVruchenny.Date));
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Name:='SAMILIKVADACIY';
        if frmVruchenny.cbSamolikvidaciy.Checked then frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Value:=1 else frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Value:=0;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[2].Name:='Kod';
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[2].Value:=frmVruchenny.edtKod.Text;
        frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Open;
        frmMain.trAzz.CommitRetaining;
        frmVruchenny.Close;
        frmAdminZapobizhZahodi.aUpdateExecute(sender);
        Exit;
      end;
    end;
  end;

  if frmVruchenny.Caption='Дата примусового стягнення постанови' then
  begin
    if (frmMain.IsFormOpen('frmShtrafi'))and(frmShtrafi.ActiveControl=frmShtrafi.btnStygnenny)and(frmMain.ActiveMDIChild=frmShtrafi) then
    begin
      frmShtrafi.qShtrafi.SQL.Clear;
      frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set DATASTYGNENNY=:DATASTYGNENNY,EDITING=0 where KOD=:Kod';
      frmShtrafi.qShtrafi.Params.Clear;
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[0].Name:='DATASTYGNENNY';
      frmShtrafi.qShtrafi.Params[0].Value:=DateToStr(frmVruchenny.dtpDataVruchenny.Date);
      frmShtrafi.qShtrafi.Params.Add;
      frmShtrafi.qShtrafi.Params[1].Name:='Kod';
      frmShtrafi.qShtrafi.Params[1].Value:=frmVruchenny.edtKod.Text;
      frmShtrafi.qShtrafi.Open;
      frmMain.trAzz.CommitRetaining;
      frmVruchenny.Close;
      frmShtrafi.aUpdateExecute(sender);
      frmShtrafi.aUpdateExecute(sender);
      frmShtrafi.qShtrafi.Last;
      exit;
    end;
  end;

  if frmVruchenny.Caption='Дата вручення постанови' then
  begin
    if (frmMain.IsFormOpen('frmFinansoviSankcii'))and(frmMain.ActiveMDIChild=frmFinansoviSankcii) then
    begin
      with frmFinansoviSankcii do
      begin
        qFinansoviSankcii.SQL.Clear;
        qFinansoviSankcii.SQL.Text:='update FINANSOVI_SANKCII set DATA_VRUCHENNY=:DATA_VRUCHENNY where RECORD_ID=:Kod';
        qFinansoviSankcii.Params.Clear;
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[0].Name:='DATA_VRUCHENNY';
        qFinansoviSankcii.Params[0].Value:=DateToStr(int(frmVruchenny.dtpDataVruchenny.Date));
        qFinansoviSankcii.Params.Add;
        qFinansoviSankcii.Params[1].Name:='Kod';
        qFinansoviSankcii.Params[1].Value:=frmVruchenny.edtKod.Text;
        qFinansoviSankcii.Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmVruchenny.Close;
      frmFinansoviSankcii.aUpdateExecute(sender);
      exit;
    end;

    if ((frmMain.IsFormOpen('frmViluchennyZRealizacii'))and(frmMain.ActiveMDIChild=frmViluchennyZRealizacii)and(frmViluchennyZRealizacii.ActiveControl=frmViluchennyZRealizacii.btnVruchenny)) then
    begin
      with frmViluchennyZRealizacii do
      begin
        qViluchennyZRealizacii.SQL.Clear;
        qViluchennyZRealizacii.SQL.Text:='update VILUCHENNY_Z_REALIZACII set DATA_VRUCHENNY=:DataVruchenny where RECORD_ID=:Kod';
        qViluchennyZRealizacii.Params.Clear;
        qViluchennyZRealizacii.Params.Add;
        qViluchennyZRealizacii.Params[0].Name:='DataVruchenny';
        qViluchennyZRealizacii.Params[0].Value:=DateToStr(int(frmVruchenny.dtpDataVruchenny.Date));
        qViluchennyZRealizacii.Params.Add;
        qViluchennyZRealizacii.Params[1].Name:='Kod';
        qViluchennyZRealizacii.Params[1].Value:=frmVruchenny.edtKod.Text;
        qViluchennyZRealizacii.Open;
      end;
      frmMain.trAzz.CommitRetaining;
      frmVruchenny.Close;
      frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
      exit;
    end;

    if (frmMain.IsFormOpen('frmAdminZapobizhZahodi'))and(frmMain.ActiveMDIChild=frmAdminZapobizhZahodi) then
    begin
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Clear;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.SQL.Text:='update POSTANOVA_ADMIN set DATA_VRUCHENNY=:DATA_VRUCHENNY where RECORD_ID=:Kod';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Clear;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Name:='DATA_VRUCHENNY';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[0].Value:=DateToStr(int(frmVruchenny.dtpDataVruchenny.Date));
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params.Add;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Name:='Kod';
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Params[1].Value:=frmVruchenny.edtKod.Text;
      frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Open;
      frmMain.trAzz.CommitRetaining;
      frmVruchenny.Close;
      frmAdminZapobizhZahodi.aUpdateExecute(sender);
      Exit;
    end;

    if (frmMain.IsFormOpen('frmShtrafi'))and(frmMain.ActiveMDIChild=frmShtrafi) then
    begin
      if frmShtrafi.ActiveControl=frmShtrafi.btnVruchenny then
      begin
          frmShtrafi.qShtrafi.SQL.Clear;
          frmShtrafi.qShtrafi.SQL.Text:='update POSTANOVASHTRAF set DATAVRUCHENNYPOSTANOVI=:DATAVRUCHENNYPOSTANOVI,EDITING=0 where KOD=:Kod';
          frmShtrafi.qShtrafi.Params.Clear;
          frmShtrafi.qShtrafi.Params.Add;
          frmShtrafi.qShtrafi.Params[0].Name:='DATAVRUCHENNYPOSTANOVI';
          frmShtrafi.qShtrafi.Params[0].Value:=DateToStr(frmVruchenny.dtpDataVruchenny.Date);
          frmShtrafi.qShtrafi.Params.Add;
          frmShtrafi.qShtrafi.Params[1].Name:='Kod';
          frmShtrafi.qShtrafi.Params[1].Value:=frmVruchenny.edtKod.Text;
          frmShtrafi.qShtrafi.Open;
          frmMain.trAzz.CommitRetaining;
          frmVruchenny.Close;
          frmShtrafi.aUpdateExecute(sender);
          frmShtrafi.qShtrafi.Last;
          exit;
      end;
    end;
  end;
end;

end.
