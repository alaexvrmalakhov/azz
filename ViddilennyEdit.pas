unit ViddilennyEdit;

interface

uses
  Forms, Classes, ActnList, Controls, StdCtrls, SysUtils, Dialogs;

type
  TfrmViddilennyEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtKodViddilenny: TEdit;
    edtNazvaViddilenny: TEdit;
    btnVikonati: TButton;
    btnVidmina: TButton;
    Label3: TLabel;
    Label4: TLabel;
    edtNazvaViddilenny_RV: TEdit;
    edtNazvaViddilenny_TV: TEdit;
    btnVidminok: TButton;
    btnKodViddilenny: TButton;
    Label5: TLabel;
    btnRajonUpdate: TButton;
    Label6: TLabel;
    Label7: TLabel;
    btnMinistryUpdate: TButton;
    btnTeritoryUpdate: TButton;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbRajon: TComboBox;
    alViddilennyEdit: TActionList;
    aKodUpdate: TAction;
    aMinistryUpdate: TAction;
    aMinistryChange: TAction;
    aTeritoryUpdate: TAction;
    aTeritoryChange: TAction;
    aDistrictUpdate: TAction;
    aViddilennyChange: TAction;
    aOK: TAction;
    aCancel: TAction;
    btnMinistryChoice: TButton;
    btnTeritoryChoice: TButton;
    btnRajonChoice: TButton;
    aMinistryChoice: TAction;
    aTeritoryChoice: TAction;
    aDistrictChoice: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aMinistryUpdateExecute(Sender: TObject);
    procedure aMinistryChangeExecute(Sender: TObject);
    procedure aTeritoryUpdateExecute(Sender: TObject);
    procedure aTeritoryChangeExecute(Sender: TObject);
    procedure aDistrictUpdateExecute(Sender: TObject);
    procedure aViddilennyChangeExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aMinistryChoiceExecute(Sender: TObject);
    procedure aTeritoryChoiceExecute(Sender: TObject);
    procedure aDistrictChoiceExecute(Sender: TObject);
  end;

var
  frmViddilennyEdit: TfrmViddilennyEdit;

implementation

uses
  Main, FinansoviSankciiEdit, ViluchennyZRealizaciiEdit, ShtrafiEdit,
  SpivrobitnikiEdit, Viddilenny, Ministry, Teritory, Rajoni;

{$R *.dfm}

procedure TfrmViddilennyEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
  begin
    frmFinansoviSankciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір відділення' then
    begin
      frmViddilenny.Enabled:=true;
      frmFinansoviSankciiEdit.Enabled:=false;
    end
    else
      frmViddilenny.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір відділення' then
    begin
      frmViddilenny.Enabled:=true;
      frmViluchennyZRealizaciiEdit.Enabled:=false;
    end
    else
      frmViddilenny.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilennyEdit.Caption<>'Вибір відділення' then
    begin
      frmViddilenny.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end
    else
      frmViddilenny.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmViddilenny.Enabled:=true;
    frmSpivrobitnikiEdit.Enabled:=true;
    if frmViddilennyEdit.Caption<>'Вибір відділення' then
    begin
      frmViddilenny.Enabled:=true;
      frmSpivrobitnikiEdit.Enabled:=false;
    end
    else
      frmViddilenny.Close;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmViddilennyEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qViddilenny.SQL.Clear;
    qViddilenny.SQL.Text:='insert into VIDDILENNY (KODVIDDILENNY) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qViddilenny.Open;
    qViddilenny.SQL.Clear;
    qViddilenny.SQL.Text:='select * from VIDDILENNY order by KODVIDDILENNY';
    qViddilenny.Open;
    qViddilenny.Last;
    frmViddilennyEdit.edtKodViddilenny.Text:=IntToStr(qViddilenny.FieldByName('KODVIDDILENNY').Value);
  end;
end;

procedure TfrmViddilennyEdit.aMinistryUpdateExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY order by MINISTRY';
    qTeritory.Open;
    frmViddilennyEdit.cbMinistry.Text:='';
    frmViddilennyEdit.cbMinistry.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmViddilennyEdit.cbMinistry.Items.Add(qTeritory.FieldByName('MINISTRY').Value);
      qTeritory.Next;
    end;
    frmViddilennyEdit.cbTeritory.Text:='';
    frmViddilennyEdit.cbTeritory.Items.Clear;
    frmViddilennyEdit.cbRajon.Text:='';
    frmViddilennyEdit.cbRajon.Items.Clear;
  end;
end;

procedure TfrmViddilennyEdit.aMinistryChangeExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmViddilennyEdit.cbMinistry.Text;
    qTeritory.Open;
    frmViddilennyEdit.cbTeritory.Text:='';
    frmViddilennyEdit.cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmViddilennyEdit.cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    frmViddilennyEdit.cbRajon.Text:='';
    frmViddilennyEdit.cbRajon.Items.Clear;
  end;
end;

procedure TfrmViddilennyEdit.aTeritoryUpdateExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD order by TERITORY.TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=frmViddilennyEdit.cbMinistry.Text;
    qTeritory.Open;
    frmViddilennyEdit.cbTeritory.Text:='';
    frmViddilennyEdit.cbTeritory.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmViddilennyEdit.cbTeritory.Items.Add(qTeritory.FieldByName('TERITORY').Value);
      qTeritory.Next;
    end;
    frmViddilennyEdit.cbRajon.Text:='';
    frmViddilennyEdit.cbRajon.Items.Clear;
  end;
end;

procedure TfrmViddilennyEdit.aTeritoryChangeExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=frmViddilennyEdit.cbTeritory.Text;
    qTeritory.Open;
    frmViddilennyEdit.cbRajon.Text:='';
    frmViddilennyEdit.cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmViddilennyEdit.cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmViddilennyEdit.aDistrictUpdateExecute(Sender: TObject);
begin
  with frmViddilenny do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD order by RAJONI.RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Teritory';
    qTeritory.Params[0].Value:=frmViddilennyEdit.cbTeritory.Text;
    qTeritory.Open;
    frmViddilennyEdit.cbRajon.Text:='';
    frmViddilennyEdit.cbRajon.Items.Clear;
    qTeritory.First;
    while not qTeritory.Eof do
    begin
      frmViddilennyEdit.cbRajon.Items.Add(qTeritory.FieldByName('RAJON').Value);
      qTeritory.Next;
    end;
  end;
end;

procedure TfrmViddilennyEdit.aViddilennyChangeExecute(Sender: TObject);
begin
  frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
  frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
end;

procedure TfrmViddilennyEdit.aOKExecute(Sender: TObject);
var
  Ministry, Teritory, District: integer;
begin
  if frmViddilennyEdit.Caption='Вибір відділення' then
  begin
//    if frmMain.IsFormOpen('frmZvyzok') then
//    begin
//      if frmZvyzok.ActiveControl=frmZvyzok.btnKG_Choice then frmZvyzok.cbKG.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnGH_Choice then frmZvyzok.cbGH.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnGDP_Choice then frmZvyzok.cbGDP.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnGPr_Choice then frmZvyzok.cbGPr.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnRV_Choice then frmZvyzok.cbRV.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnEV_Choice then frmZvyzok.cbEV.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      if frmZvyzok.ActiveControl=frmZvyzok.btnVMP_Choice then frmZvyzok.cbVMP.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
//      frmViddilennyEdit.Close;
//      frmViddilenny.Close;
//      exit;
//    end;

    if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
    begin
      frmFinansoviSankciiEdit.cbViddilSES.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilennyEdit.Close;
      frmViddilenny.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
    begin
      frmViluchennyZRealizaciiEdit.cbViddilSES.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilennyEdit.Close;
      frmViddilenny.Close;
      exit;
    end;

    if (frmMain.IsFormOpen('frmShtrafiEdit'))and(not frmShtrafiEdit.Enabled) then
    begin
      frmShtrafiEdit.cbViddil.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilennyEdit.Close;
      frmViddilenny.Close;
      exit;
    end;

    if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
    begin
      frmSpivrobitnikiEdit.cbViddilenny.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilennyEdit.Close;
      frmViddilenny.Close;
      exit;
    end;
  end;

  if frmViddilennyEdit.Caption='Видалення відділення' then
  begin
    if MessageDlg('Видалення запису може відобразитись на інших даних!!!'+#13+'Ви дійсно бажаєте видалити запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmViddilennyEdit do
      begin
        frmViddilenny.qViddilenny.SQL.Clear;
        frmViddilenny.qViddilenny.SQL.Text:='delete from VIDDILENNY where KODVIDDILENNY=:Kod';
        frmViddilenny.qViddilenny.Params.Clear;
        frmViddilenny.qViddilenny.Params.Add;
        frmViddilenny.qViddilenny.Params[0].Name:='Kod';
        frmViddilenny.qViddilenny.Params[0].Value:=edtKodViddilenny.Text;
        frmViddilenny.qViddilenny.Open;
        frmMain.trAzz.CommitRetaining;
      end;
      frmViddilennyEdit.Close;
      frmViddilenny.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmViddilennyEdit.Caption='Редагування відділення' then
  begin
    with frmViddilennyEdit do
    begin
      if edtKodViddilenny.Text='' then
      begin
        aKodUpdateExecute(sender);
        edtNazvaViddilenny.SetFocus;
        exit;
      end;
      try
        StrToInt64(edtKodViddilenny.Text);
      except
        aKodUpdateExecute(sender);
        edtNazvaViddilenny.SetFocus;
        exit;
      end;
      if cbMinistry.Text='' then
      begin
        aMinistryUpdateExecute(sender);
        cbMinistry.SetFocus;
        exit;
      end;
      frmViddilenny.qTeritory.SQL.Clear;
      frmViddilenny.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministr order by MINISTRY';
      frmViddilenny.qTeritory.Params.Clear;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[0].Name:='Ministry';
      frmViddilenny.qTeritory.Params[0].Value:=cbMinistry.Text;
      frmViddilenny.qTeritory.Open;
      if not frmViddilenny.qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then
      begin
        aMinistryUpdateExecute(sender);
        cbMinistry.SetFocus;
        exit;
      end
      else
        Ministry:=frmViddilenny.qTeritory.FieldByName('KOD').Value;
      if cbTeritory.Text='' then
      begin
        aTeritoryUpdateExecute(sender);
        cbTeritory.SetFocus;
        exit;
      end;
      frmViddilenny.qTeritory.SQL.Clear;
      frmViddilenny.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      frmViddilenny.qTeritory.Params.Clear;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[0].Name:='Ministry';
      frmViddilenny.qTeritory.Params[0].Value:=Ministry;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[1].Name:='Teritory';
      frmViddilenny.qTeritory.Params[1].Value:=cbTeritory.Text;
      frmViddilenny.qTeritory.Open;
      if not frmViddilenny.qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then
      begin
        aTeritoryUpdateExecute(sender);
        cbTeritory.SetFocus;
        exit;
      end
      else
        Teritory:=frmViddilenny.qTeritory.FieldByName('Kod').Value;
      if cbRajon.Text='' then
      begin
        aDistrictUpdateExecute(sender);
        cbRajon.SetFocus;
        exit;
      end;
      frmViddilenny.qTeritory.SQL.Clear;
      frmViddilenny.qTeritory.SQL.Text:='select * from RAJONI where TERITORY=:Teritory and RAJON=:Rajon order by RAJONI.RAJON';
      frmViddilenny.qTeritory.Params.Clear;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[0].Name:='Teritory';
      frmViddilenny.qTeritory.Params[0].Value:=Teritory;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[1].Name:='Rajon';
      frmViddilenny.qTeritory.Params[1].Value:=cbRajon.Text;
      frmViddilenny.qTeritory.Open;
      if not frmViddilenny.qTeritory.Locate('RAJON',cbRajon.Text,[]) then
      begin
        aTeritoryUpdateExecute(sender);
        cbTeritory.SetFocus;
        exit;
      end
      else
        District:=frmViddilenny.qTeritory.FieldByName('KOD').Value;
      if edtNazvaViddilenny.Text='' then
      begin
        edtNazvaViddilenny.SetFocus;
        exit;
      end;
      if (edtNazvaViddilenny_RV.Text='')or(edtNazvaViddilenny_TV.Text='') then
      begin
        aViddilennyChangeExecute(sender);
        edtNazvaViddilenny_RV.SetFocus;
        exit;
      end;

      frmViddilenny.qViddilenny.SQL.Clear;
      frmViddilenny.qViddilenny.SQL.Text:='update VIDDILENNY set MINISTRY=:Ministry,TERITORY=:Teritory,RAJON=:Rajon,NAZVAVIDDILENNY=:Nazva,NAZVAVIDDILENNY_RV=:Nazva_RV,NAZVAVIDDILENNY_TV=:Nazva_TV where KODVIDDILENNY=:Kod';//KODVIDDILENNY,MINISTRY,TERITORY,RAJON,NAZVAVIDDILENNY,NAZVAVIDDILENNY_RV,NAZVAVIDDILENNY_TV';//where KODVIDDILENNY='+edtKodViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Clear;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[0].Name:='Ministry';
      frmViddilenny.qViddilenny.Params[0].Value:=Ministry;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[1].Name:='Teritory';
      frmViddilenny.qViddilenny.Params[1].Value:=Teritory;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[2].Name:='Rajon';
      frmViddilenny.qViddilenny.Params[2].Value:=District;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[3].Name:='Nazva';
      frmViddilenny.qViddilenny.Params[3].Value:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[4].Name:='Nazva_RV';
      frmViddilenny.qViddilenny.Params[4].Value:=frmViddilennyEdit.edtNazvaViddilenny_RV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[5].Name:='Nazva_TV';
      frmViddilenny.qViddilenny.Params[5].Value:=frmViddilennyEdit.edtNazvaViddilenny_TV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[6].Name:='Kod';
      frmViddilenny.qViddilenny.Params[6].Value:=frmViddilennyEdit.edtKodViddilenny.Text;
      frmViddilenny.qViddilenny.Open;
      frmMain.trAzz.CommitRetaining;
      frmViddilennyEdit.Close;
      frmViddilenny.aUpdateExecute(sender);
      exit;
    end;
  end;

  if frmViddilennyEdit.Caption='Додавання нового відділення' then
  begin
    with frmViddilennyEdit do
    begin
      if edtKodViddilenny.Text='' then
      begin
        aKodUpdateExecute(sender);
        edtNazvaViddilenny.SetFocus;
        exit;
      end;
      try
        StrToInt64(edtKodViddilenny.Text);
      except
        aKodUpdateExecute(sender);
        edtNazvaViddilenny.SetFocus;
        exit;
      end;
      if cbMinistry.Text='' then
      begin
        aMinistryUpdateExecute(sender);
        cbMinistry.SetFocus;
        exit;
      end;
      frmViddilenny.qTeritory.SQL.Clear;
      frmViddilenny.qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministr order by MINISTRY';
      frmViddilenny.qTeritory.Params.Clear;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[0].Name:='Ministry';
      frmViddilenny.qTeritory.Params[0].Value:=cbMinistry.Text;
      frmViddilenny.qTeritory.Open;
      if not frmViddilenny.qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then
      begin
        aMinistryUpdateExecute(sender);
        cbMinistry.SetFocus;
        exit;
      end
      else
        Ministry:=frmViddilenny.qTeritory.FieldByName('KOD').Value;
      if cbTeritory.Text='' then
      begin
        aTeritoryUpdateExecute(sender);
        cbTeritory.SetFocus;
        exit;
      end;
      frmViddilenny.qTeritory.SQL.Clear;
      frmViddilenny.qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      frmViddilenny.qTeritory.Params.Clear;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[0].Name:='Ministry';
      frmViddilenny.qTeritory.Params[0].Value:=Ministry;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[1].Name:='Teritory';
      frmViddilenny.qTeritory.Params[1].Value:=cbTeritory.Text;
      frmViddilenny.qTeritory.Open;
      if not frmViddilenny.qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then
      begin
        aTeritoryUpdateExecute(sender);
        cbTeritory.SetFocus;
        exit;
      end
      else
        Teritory:=frmViddilenny.qTeritory.FieldByName('Kod').Value;
      if cbRajon.Text='' then
      begin
        aDistrictUpdateExecute(sender);
        cbRajon.SetFocus;
        exit;
      end;
      frmViddilenny.qTeritory.SQL.Clear;
      frmViddilenny.qTeritory.SQL.Text:='select * from RAJONI where TERITORY=:Teritory and RAJON=:Rajon order by RAJONI.RAJON';
      frmViddilenny.qTeritory.Params.Clear;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[0].Name:='Teritory';
      frmViddilenny.qTeritory.Params[0].Value:=Teritory;
      frmViddilenny.qTeritory.Params.Add;
      frmViddilenny.qTeritory.Params[1].Name:='Rajon';
      frmViddilenny.qTeritory.Params[1].Value:=cbRajon.Text;
      frmViddilenny.qTeritory.Open;
      if not frmViddilenny.qTeritory.Locate('RAJON',cbRajon.Text,[]) then
      begin
        aTeritoryUpdateExecute(sender);
        cbTeritory.SetFocus;
        exit;
      end
      else
        District:=frmViddilenny.qTeritory.FieldByName('KOD').Value;
      if edtNazvaViddilenny.Text='' then
      begin
        edtNazvaViddilenny.SetFocus;
        exit;
      end;
      if (edtNazvaViddilenny_RV.Text='')or(edtNazvaViddilenny_TV.Text='') then
      begin
        aViddilennyChangeExecute(sender);
        edtNazvaViddilenny_RV.SetFocus;
        exit;
      end;

      frmViddilenny.qViddilenny.SQL.Clear;
      frmViddilenny.qViddilenny.SQL.Text:='update VIDDILENNY set MINISTRY=:Ministry,TERITORY=:Teritory,RAJON=:Rajon,NAZVAVIDDILENNY=:Nazva,NAZVAVIDDILENNY_RV=:Nazva_RV,NAZVAVIDDILENNY_TV=:Nazva_TV where KODVIDDILENNY=:Kod';//KODVIDDILENNY,MINISTRY,TERITORY,RAJON,NAZVAVIDDILENNY,NAZVAVIDDILENNY_RV,NAZVAVIDDILENNY_TV';//where KODVIDDILENNY='+edtKodViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Clear;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[0].Name:='Ministry';
      frmViddilenny.qViddilenny.Params[0].Value:=Ministry;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[1].Name:='Teritory';
      frmViddilenny.qViddilenny.Params[1].Value:=Teritory;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[2].Name:='Rajon';
      frmViddilenny.qViddilenny.Params[2].Value:=District;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[3].Name:='Nazva';
      frmViddilenny.qViddilenny.Params[3].Value:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[4].Name:='Nazva_RV';
      frmViddilenny.qViddilenny.Params[4].Value:=frmViddilennyEdit.edtNazvaViddilenny_RV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[5].Name:='Nazva_TV';
      frmViddilenny.qViddilenny.Params[5].Value:=frmViddilennyEdit.edtNazvaViddilenny_TV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[6].Name:='Kod';
      frmViddilenny.qViddilenny.Params[6].Value:=frmViddilennyEdit.edtKodViddilenny.Text;
      frmViddilenny.qViddilenny.Open;
      frmMain.trAzz.CommitRetaining;
      frmViddilennyEdit.Close;
      frmViddilenny.aUpdateExecute(sender);
      exit;
    end;
  end;
end;

procedure TfrmViddilennyEdit.aCancelExecute(Sender: TObject);
begin
  frmViddilennyEdit.Close;
end;

procedure TfrmViddilennyEdit.aMinistryChoiceExecute(Sender: TObject);
begin
  frmViddilennyEdit.Enabled:=false;
  frmMain.aMinistryExecute(sender);
  frmMinistry.aChoice.Enabled:=true;
  frmMinistry.Left:=frmMain.Left+70;
  frmMinistry.Top:=frmMain.Top+70;
  frmMinistry.Width:=frmMain.Width-70;
  frmMinistry.Height:=frmMain.Height-70;
  frmMinistry.Position:=poMainFormCenter;
  frmMinistry.FormStyle:=fsNormal;
  frmMinistry.BorderStyle:=bsDialog;
end;

procedure TfrmViddilennyEdit.aTeritoryChoiceExecute(Sender: TObject);
begin
  frmViddilennyEdit.Enabled:=false;
  frmMain.aTeritoryExecute(sender);
  frmTeritory.aChoice.Enabled:=true;
  frmTeritory.Left:=frmMain.Left+70;
  frmTeritory.Top:=frmMain.Top+70;
  frmTeritory.Width:=frmMain.Width-70;
  frmTeritory.Height:=frmMain.Height-70;
  frmTeritory.Position:=poMainFormCenter;
  frmTeritory.FormStyle:=fsNormal;
  frmTeritory.BorderStyle:=bsDialog;
end;

procedure TfrmViddilennyEdit.aDistrictChoiceExecute(Sender: TObject);
begin
  frmViddilennyEdit.Enabled:=false;
  frmMain.aDistrictExecute(sender);
  frmRajoni.aChoice.Enabled:=true;
  frmRajoni.Left:=frmMain.Left+70;
  frmRajoni.Top:=frmMain.Top+70;
  frmRajoni.Width:=frmMain.Width-70;
  frmRajoni.Height:=frmMain.Height-70;
  frmRajoni.Position:=poMainFormCenter;
  frmRajoni.FormStyle:=fsNormal;
  frmRajoni.BorderStyle:=bsDialog;
end;

end.
