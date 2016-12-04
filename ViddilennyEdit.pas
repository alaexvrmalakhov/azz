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
    alViddilennyEdit: TActionList;
    aKodUpdate: TAction;
    aViddilennyChange: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aKodUpdateExecute(Sender: TObject);
    procedure aViddilennyChangeExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
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
{
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
}
  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmViddilenny.BorderStyle=bsDialog then
    begin
      frmViddilenny.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end;
//    if frmViddilennyEdit.Caption<>'Вибір відділення' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmShtrafiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
    Action:=caFree;
    exit;
  end;

  if frmMain.IsFormOpen('frmSpivrobitnikiEdit') then
  begin
    frmViddilenny.Enabled:=true;
    frmSpivrobitnikiEdit.Enabled:=true;
    if frmSpivrobitnikiEdit.BorderStyle=bsDialog then
    begin
      frmViddilenny.Enabled:=true;
      frmSpivrobitnikiEdit.Enabled:=false;
    end;
//    if frmViddilennyEdit.Caption<>'Вибір відділення' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmSpivrobitnikiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    frmMain.Enabled:=false;
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
    frmViddilenny.aUpdateExecute(sender);
  end;
end;

procedure TfrmViddilennyEdit.aViddilennyChangeExecute(Sender: TObject);
begin
  frmViddilennyEdit.edtNazvaViddilenny_RV.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
  frmViddilennyEdit.edtNazvaViddilenny_TV.Text:=frmViddilennyEdit.edtNazvaViddilenny.Text;
end;

procedure TfrmViddilennyEdit.aOKExecute(Sender: TObject);
begin
  if frmViddilennyEdit.Caption='Вибір відділення' then
  begin
{
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
}
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
        frmViddilenny.qEdit.SQL.Clear;
        frmViddilenny.qEdit.SQL.Text:='delete from VIDDILENNY where KODVIDDILENNY=:Kod';
        frmViddilenny.qEdit.Params.Clear;
        frmViddilenny.qEdit.Params.Add;
        frmViddilenny.qEdit.Params[0].Name:='Kod';
        frmViddilenny.qEdit.Params[0].Value:=edtKodViddilenny.Text;
        frmViddilenny.qEdit.Open;
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
      frmViddilenny.qViddilenny.SQL.Text:='update VIDDILENNY set NAZVAVIDDILENNY=:Nazva, NAZVAVIDDILENNY_RV=:Nazva_RV, NAZVAVIDDILENNY_TV=:Nazva_TV where KODVIDDILENNY=:Kod';//KODVIDDILENNY,MINISTRY,TERITORY,RAJON,NAZVAVIDDILENNY,NAZVAVIDDILENNY_RV,NAZVAVIDDILENNY_TV';//where KODVIDDILENNY='+edtKodViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Clear;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[0].Name:='Nazva';
      frmViddilenny.qViddilenny.Params[0].Value:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[1].Name:='Nazva_RV';
      frmViddilenny.qViddilenny.Params[1].Value:=frmViddilennyEdit.edtNazvaViddilenny_RV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[2].Name:='Nazva_TV';
      frmViddilenny.qViddilenny.Params[2].Value:=frmViddilennyEdit.edtNazvaViddilenny_TV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[3].Name:='Kod';
      frmViddilenny.qViddilenny.Params[3].Value:=frmViddilennyEdit.edtKodViddilenny.Text;
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
      frmViddilenny.qViddilenny.SQL.Text:='update VIDDILENNY set NAZVAVIDDILENNY=:Nazva, NAZVAVIDDILENNY_RV=:Nazva_RV,NAZVAVIDDILENNY_TV=:Nazva_TV where KODVIDDILENNY=:Kod';//KODVIDDILENNY,MINISTRY,TERITORY,RAJON,NAZVAVIDDILENNY,NAZVAVIDDILENNY_RV,NAZVAVIDDILENNY_TV';//where KODVIDDILENNY='+edtKodViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Clear;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[0].Name:='Nazva';
      frmViddilenny.qViddilenny.Params[0].Value:=frmViddilennyEdit.edtNazvaViddilenny.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[1].Name:='Nazva_RV';
      frmViddilenny.qViddilenny.Params[1].Value:=frmViddilennyEdit.edtNazvaViddilenny_RV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[2].Name:='Nazva_TV';
      frmViddilenny.qViddilenny.Params[2].Value:=frmViddilennyEdit.edtNazvaViddilenny_TV.Text;
      frmViddilenny.qViddilenny.Params.Add;
      frmViddilenny.qViddilenny.Params[3].Name:='Kod';
      frmViddilenny.qViddilenny.Params[3].Value:=frmViddilennyEdit.edtKodViddilenny.Text;
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

end.
