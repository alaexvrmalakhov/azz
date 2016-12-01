unit VidomostiProViluchenny;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls,
  Controls, Dialogs, SysUtils;

type
  TfrmVidomostiProViluchenny = class(TForm)
    Label36: TLabel;
    lblT: TLabel;
    edtZagalnaVaga_T: TEdit;
    edtZagalnaVaga_KG: TEdit;
    lblZagalnaVaga: TLabel;
    lblVagaOdinici: TLabel;
    edtVagaOdinici: TEdit;
    cbOdinicyVimiru: TComboBox;
    edtKilkistTovaru: TEdit;
    Label33: TLabel;
    Label31: TLabel;
    edtNajmenuvannyTovaru: TEdit;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label1: TLabel;
    edtNomerPostanovi: TEdit;
    Label2: TLabel;
    edtDataPostanovi: TEdit;
    lblKG: TLabel;
    Label3: TLabel;
    edtRecordID: TEdit;
    alVidomostiProViluchenny: TActionList;
    aRecordID_Update: TAction;
    qRecord_ID: TIBQuery;
    aOdiniciVimiruUpdate: TAction;
    aOdiniciVimiruChange: TAction;
    aVirobnikUpdate: TAction;
    aVirobnikChoice: TAction;
    cbVirobnik: TComboBox;
    btnVirobnik_Update: TButton;
    btnVirobnik_Choice: TButton;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnVikonatiClick(Sender: TObject);
    procedure btnVidminitiClick(Sender: TObject);
    procedure aRecordID_UpdateExecute(Sender: TObject);
    procedure aOdiniciVimiruUpdateExecute(Sender: TObject);
    procedure aOdiniciVimiruChangeExecute(Sender: TObject);
    procedure aVirobnikUpdateExecute(Sender: TObject);
    procedure aVirobnikChoiceExecute(Sender: TObject);
  end;

var
  frmVidomostiProViluchenny: TfrmVidomostiProViluchenny;

implementation

uses
  Main, ViluchennyZRealizaciiEdit, Virobniki;

{$R *.dfm}

procedure TfrmVidomostiProViluchenny.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frmMain.IsFormOpen('frmViluchennyZRealizaciiEdit') then
  begin
    frmViluchennyZRealizaciiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmVidomostiProViluchenny.btnVikonatiClick(Sender: TObject);
var
  Ministry, Teritory, District: integer;
  Vimir: integer;
begin
  if frmVidomostiProViluchenny.Caption='Видалення запису' then
  begin
    if MessageDlg('УВАГА!!!'+#13+'Відновлення цього запису буде неможливе!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmViluchennyZRealizaciiEdit do
      begin
        qVidomostiProViluchenny.SQL.Clear;
        qVidomostiProViluchenny.SQL.Text:='delete from VIDOMOSTI_PRO_VILUCHENNY where RECORD_ID=:Kod';
        qVidomostiProViluchenny.Params.Clear;
        qVidomostiProViluchenny.Params.Add;
        qVidomostiProViluchenny.Params[0].Name:='Kod';
        qVidomostiProViluchenny.Params[0].Value:=frmVidomostiProViluchenny.edtRecordID.Text;
        qVidomostiProViluchenny.Open;
      end;
    end;
    frmVidomostiProViluchenny.Close;
    frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
    exit;
  end;

  if frmVidomostiProViluchenny.Caption='Редагування запису' then
  begin
    with frmVidomostiProViluchenny do
    begin
      if edtNajmenuvannyTovaru.Text='' then
      begin
        edtNajmenuvannyTovaru.SetFocus;
        exit;
      end;
      if edtKilkistTovaru.Text='' then
      begin
        edtKilkistTovaru.Text:='0';
        edtKilkistTovaru.SetFocus;
        exit;
      end;
      try
        StrToFloat(edtKilkistTovaru.Text);
      except
        edtKilkistTovaru.Text:='0';
        edtKilkistTovaru.SetFocus;
        exit;
      end;
      if edtVagaOdinici.Enabled then
      begin
        if edtVagaOdinici.Text='' then
        begin
          edtVagaOdinici.Text:='0';
          edtVagaOdinici.SetFocus;
          exit;
        end;
        try
          StrToFloat(edtVagaOdinici.Text);
        except
          edtVagaOdinici.Text:='0';
          edtVagaOdinici.SetFocus;
          exit;
        end;
      end;
      if cbOdinicyVimiru.Text='' then
      begin
        aOdiniciVimiruUpdateExecute(sender);
        cbOdinicyVimiru.SetFocus;
        exit;
      end;
      if edtZagalnaVaga_KG.Enabled then
      begin
        if edtZagalnaVaga_KG.Text='' then
        begin
          edtZagalnaVaga_KG.Text:='0';
          edtZagalnaVaga_KG.SetFocus;
          exit;
        end;
        try
          StrToFloat(edtZagalnaVaga_KG.Text);
        except
          edtZagalnaVaga_KG.Text:='0';
          edtZagalnaVaga_KG.SetFocus;
          exit;
        end;
      end;
      if edtZagalnaVaga_T.Enabled then
      begin
        if edtZagalnaVaga_T.Text='' then
        begin
          edtZagalnaVaga_T.Text:='0';
          edtZagalnaVaga_T.SetFocus;
          exit;
        end;
        try
          StrToFloat(edtZagalnaVaga_T.Text);
        except
          edtZagalnaVaga_T.Text:='0';
          edtZagalnaVaga_T.SetFocus;
          exit;
        end;
      end;
      if cbVirobnik.Text='' then
      begin
        aVirobnikUpdateExecute(sender);
        cbVirobnik.SetFocus;
        exit;
      end;
      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Ministry';
      qRecord_ID.Params[0].Value:=cbMinistry.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qRecord_ID.FieldByName('KOD').Value else Ministry:=0;

      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Ministry';
      qRecord_ID.Params[0].Value:=Ministry;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[1].Name:='Teritory';
      qRecord_ID.Params[1].Value:=cbTeritory.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qRecord_ID.FieldByName('KOD').Value else Teritory:=0;

      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Ministry';
      qRecord_ID.Params[0].Value:=Ministry;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[1].Name:='Teritory';
      qRecord_ID.Params[1].Value:=Teritory;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[2].Name:='Rajon';
      qRecord_ID.Params[2].Value:=cbDistrict.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('RAJON',cbDistrict.Text,[]) then District:=qRecord_ID.FieldByName('KOD').Value else District:=0;

      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU where SOKRASCHENNOE_NAZVANIE=:Vimir order by SOKRASCHENNOE_NAZVANIE';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Vimir';
      qRecord_ID.Params[0].Value:=cbOdinicyVimiru.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('SOKRASCHENNOE_NAZVANIE',cbOdinicyVimiru.Text,[]) then Vimir:=qRecord_ID.FieldByName('KOD').Value else Vimir:=0;
    end;
    with frmViluchennyZRealizaciiEdit do
    begin
      qVidomostiProViluchenny.SQL.Clear;
      qVidomostiProViluchenny.SQL.Text:='update VIDOMOSTI_PRO_VILUCHENNY set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'NAJMENUVANNY_TOVARU=:NazvaTovaru,KILKIST_TOVARU=:KilkistTovaru,VAGA_ODINICI=:VagaOdinici,';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'ODINICI_VIMIRU=:Vimir,ZAGALNA_VAGA_KG=:VagaKG,ZAGALNA_VAGA_T=:VagaT,VIROBNIK=:Virobnik';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'where RECORD_ID=:Kod';
      qVidomostiProViluchenny.Params.Clear;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[0].Name:='Ministry';
      qVidomostiProViluchenny.Params[0].Value:=Ministry;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[1].Name:='Teritory';
      qVidomostiProViluchenny.Params[1].Value:=Teritory;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[2].Name:='Rajon';
      qVidomostiProViluchenny.Params[2].Value:=District;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[3].Name:='NomerPostanovi';
      qVidomostiProViluchenny.Params[3].Value:=frmVidomostiProViluchenny.edtNomerPostanovi.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[4].Name:='DataPostanovi';
      qVidomostiProViluchenny.Params[4].Value:=frmVidomostiProViluchenny.edtDataPostanovi.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[5].Name:='NazvaTovaru';
      qVidomostiProViluchenny.Params[5].Value:=frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[6].Name:='KilkistTovaru';
      qVidomostiProViluchenny.Params[6].Value:=StrToFloat(frmVidomostiProViluchenny.edtKilkistTovaru.Text);
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[7].Name:='VagaOdinici';
      if frmVidomostiProViluchenny.edtVagaOdinici.Enabled then qVidomostiProViluchenny.Params[7].Value:=StrToFloat(frmVidomostiProViluchenny.edtVagaOdinici.Text) else qVidomostiProViluchenny.Params[7].Value:='';
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[8].Name:='Vimir';
      qVidomostiProViluchenny.Params[8].Value:=Vimir;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[9].Name:='VagaKG';
      if frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled then qVidomostiProViluchenny.Params[9].Value:=StrToFloat(frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text) else qVidomostiProViluchenny.Params[9].Value:='';
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[10].Name:='VagaT';
      if frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled then qVidomostiProViluchenny.Params[10].Value:=StrToFloat(frmVidomostiProViluchenny.edtZagalnaVaga_T.Text) else qVidomostiProViluchenny.Params[10].Value:='';
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[11].Name:='Virobnik';
      qVidomostiProViluchenny.Params[11].Value:=frmVidomostiProViluchenny.cbVirobnik.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[12].Name:='Kod';
      qVidomostiProViluchenny.Params[12].Value:=frmVidomostiProViluchenny.edtRecordID.Text;
      qVidomostiProViluchenny.Open;
    end;
    frmVidomostiProViluchenny.Close;
    frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
    exit;
  end;

  if frmVidomostiProViluchenny.Caption='Додавання запису' then
  begin
    with frmVidomostiProViluchenny do
    begin
      if edtNajmenuvannyTovaru.Text='' then
      begin
        edtNajmenuvannyTovaru.SetFocus;
        exit;
      end;
      if edtKilkistTovaru.Text='' then
      begin
        edtKilkistTovaru.Text:='0';
        edtKilkistTovaru.SetFocus;
        exit;
      end;
      try
        StrToFloat(edtKilkistTovaru.Text);
      except
        edtKilkistTovaru.Text:='0';
        edtKilkistTovaru.SetFocus;
        exit;
      end;
      if edtVagaOdinici.Enabled then
      begin
        if edtVagaOdinici.Text='' then
        begin
          edtVagaOdinici.Text:='0';
          edtVagaOdinici.SetFocus;
          exit;
        end;
        try
          StrToFloat(edtVagaOdinici.Text);
        except
          edtVagaOdinici.Text:='0';
          edtVagaOdinici.SetFocus;
          exit;
        end;
      end;
      if cbOdinicyVimiru.Text='' then
      begin
        aOdiniciVimiruUpdateExecute(sender);
        cbOdinicyVimiru.SetFocus;
        exit;
      end;
      if edtZagalnaVaga_KG.Enabled then
      begin
        if edtZagalnaVaga_KG.Text='' then
        begin
          edtZagalnaVaga_KG.Text:='0';
          edtZagalnaVaga_KG.SetFocus;
          exit;
        end;
        try
          StrToFloat(edtZagalnaVaga_KG.Text);
        except
          edtZagalnaVaga_KG.Text:='0';
          edtZagalnaVaga_KG.SetFocus;
          exit;
        end;
      end;
      if edtZagalnaVaga_T.Enabled then
      begin
        if edtZagalnaVaga_T.Text='' then
        begin
          edtZagalnaVaga_T.Text:='0';
          edtZagalnaVaga_T.SetFocus;
          exit;
        end;
        try
          StrToFloat(edtZagalnaVaga_T.Text);
        except
          edtZagalnaVaga_T.Text:='0';
          edtZagalnaVaga_T.SetFocus;
          exit;
        end;
      end;
      if cbVirobnik.Text='' then
      begin
        aVirobnikUpdateExecute(sender);
        cbVirobnik.SetFocus;
        exit;
      end;
      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Ministry';
      qRecord_ID.Params[0].Value:=cbMinistry.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qRecord_ID.FieldByName('KOD').Value else Ministry:=0;

      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Ministry';
      qRecord_ID.Params[0].Value:=Ministry;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[1].Name:='Teritory';
      qRecord_ID.Params[1].Value:=cbTeritory.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qRecord_ID.FieldByName('KOD').Value else Teritory:=0;

      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Ministry';
      qRecord_ID.Params[0].Value:=Ministry;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[1].Name:='Teritory';
      qRecord_ID.Params[1].Value:=Teritory;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[2].Name:='Rajon';
      qRecord_ID.Params[2].Value:=cbDistrict.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('RAJON',frmVidomostiProViluchenny.cbDistrict.Text,[]) then District:=qRecord_ID.FieldByName('KOD').Value else District:=0;

      qRecord_ID.SQL.Clear;
      qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU where SOKRASCHENNOE_NAZVANIE=:Vimir order by SOKRASCHENNOE_NAZVANIE';
      qRecord_ID.Params.Clear;
      qRecord_ID.Params.Add;
      qRecord_ID.Params[0].Name:='Vimir';
      qRecord_ID.Params[0].Value:=cbOdinicyVimiru.Text;
      qRecord_ID.Open;
      if qRecord_ID.Locate('SOKRASCHENNOE_NAZVANIE',cbOdinicyVimiru.Text,[]) then Vimir:=qRecord_ID.FieldByName('KOD').Value else Vimir:=0;
    end;
    with frmViluchennyZRealizaciiEdit do
    begin
      qVidomostiProViluchenny.SQL.Clear;
      qVidomostiProViluchenny.SQL.Text:='update VIDOMOSTI_PRO_VILUCHENNY set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'NAJMENUVANNY_TOVARU=:NazvaTovaru,KILKIST_TOVARU=:KilkistTovaru,VAGA_ODINICI=:VagaOdinici,';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'ODINICI_VIMIRU=:Vimir,ZAGALNA_VAGA_KG=:VagaKG,ZAGALNA_VAGA_T=:VagaT,VIROBNIK=:Virobnik';
      qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'where RECORD_ID=:Kod';
      qVidomostiProViluchenny.Params.Clear;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[0].Name:='Ministry';
      qVidomostiProViluchenny.Params[0].Value:=Ministry;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[1].Name:='Teritory';
      qVidomostiProViluchenny.Params[1].Value:=Teritory;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[2].Name:='Rajon';
      qVidomostiProViluchenny.Params[2].Value:=District;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[3].Name:='NomerPostanovi';
      qVidomostiProViluchenny.Params[3].Value:=frmVidomostiProViluchenny.edtNomerPostanovi.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[4].Name:='DataPostanovi';
      qVidomostiProViluchenny.Params[4].Value:=frmVidomostiProViluchenny.edtDataPostanovi.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[5].Name:='NazvaTovaru';
      qVidomostiProViluchenny.Params[5].Value:=frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[6].Name:='KilkistTovaru';
      qVidomostiProViluchenny.Params[6].Value:=StrToFloat(frmVidomostiProViluchenny.edtKilkistTovaru.Text);
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[7].Name:='VagaOdinici';
      if frmVidomostiProViluchenny.edtVagaOdinici.Enabled then qVidomostiProViluchenny.Params[7].Value:=StrToFloat(frmVidomostiProViluchenny.edtVagaOdinici.Text) else qVidomostiProViluchenny.Params[7].Value:='';
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[8].Name:='Vimir';
      qVidomostiProViluchenny.Params[8].Value:=Vimir;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[9].Name:='VagaKG';
      if frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled then qVidomostiProViluchenny.Params[9].Value:=StrToFloat(frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text) else qVidomostiProViluchenny.Params[9].Value:='';
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[10].Name:='VagaT';
      if frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled then qVidomostiProViluchenny.Params[10].Value:=StrToFloat(frmVidomostiProViluchenny.edtZagalnaVaga_T.Text) else qVidomostiProViluchenny.Params[10].Value:='';
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[11].Name:='Virobnik';
      qVidomostiProViluchenny.Params[11].Value:=frmVidomostiProViluchenny.cbVirobnik.Text;
      qVidomostiProViluchenny.Params.Add;
      qVidomostiProViluchenny.Params[12].Name:='Kod';
      qVidomostiProViluchenny.Params[12].Value:=frmVidomostiProViluchenny.edtRecordID.Text;
      qVidomostiProViluchenny.Open;
    end;
    frmVidomostiProViluchenny.Close;
    frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
    exit;
  end;
end;

procedure TfrmVidomostiProViluchenny.btnVidminitiClick(Sender: TObject);
begin
  frmVidomostiProViluchenny.Close;
end;

procedure TfrmVidomostiProViluchenny.aRecordID_UpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProViluchenny do
  begin
    edtNomerPostanovi.Text:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
    edtDataPostanovi.Text:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date));
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='insert into VIDOMOSTI_PRO_VILUCHENNY (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qRecord_ID.Open;
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='select * from VIDOMOSTI_PRO_VILUCHENNY order by RECORD_ID';
    qRecord_ID.Open;
    qRecord_ID.Last;
    edtRecordID.Text:=IntToStr(qRecord_ID.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmVidomostiProViluchenny.aOdiniciVimiruUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProViluchenny do
  begin
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU order by SOKRASCHENNOE_NAZVANIE';
    qRecord_ID.Open;
    cbOdinicyVimiru.Text:='';
    cbOdinicyVimiru.Items.Clear;
    qRecord_ID.First;
    while not qRecord_ID.Eof do
    begin
      cbOdinicyVimiru.Items.Add(qRecord_ID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value);
      qRecord_ID.Next;
    end;
  end;
end;

procedure TfrmVidomostiProViluchenny.aOdiniciVimiruChangeExecute(
  Sender: TObject);
begin
  with frmVidomostiProViluchenny do
  begin
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU where SOKRASCHENNOE_NAZVANIE=:Nazva order by SOKRASCHENNOE_NAZVANIE';
    qRecord_ID.Params.Clear;
    qRecord_ID.Params.Add;
    qRecord_ID.Params[0].Name:='Nazva';
    qRecord_ID.Params[0].Value:=cbOdinicyVimiru.Text;
    qRecord_ID.Open;
    if qRecord_ID.Locate('SOKRASCHENNOE_NAZVANIE',cbOdinicyVimiru.Text,[]) then
    begin
      case qRecord_ID.FieldByName('VID').Value of
        0:
          begin
            frmVidomostiProViluchenny.lblVagaOdinici.Enabled:=true;
            frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=true;
            frmVidomostiProViluchenny.lblZagalnaVaga.Enabled:=true;
            frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=true;
            frmVidomostiProViluchenny.lblKG.Enabled:=true;
            frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=true;
            frmVidomostiProViluchenny.lblT.Enabled:=true;
          end;
        1:
          begin
            frmVidomostiProViluchenny.lblVagaOdinici.Enabled:=true;
            frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=true;
            frmVidomostiProViluchenny.lblZagalnaVaga.Enabled:=true;
            frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=true;
            frmVidomostiProViluchenny.lblKG.Enabled:=true;
            frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=true;
            frmVidomostiProViluchenny.lblT.Enabled:=true;
          end;
        2:
          begin
            frmVidomostiProViluchenny.lblVagaOdinici.Enabled:=false;
            frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=false;
            frmVidomostiProViluchenny.lblZagalnaVaga.Enabled:=false;
            frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=false;
            frmVidomostiProViluchenny.lblKG.Enabled:=false;
            frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=false;
            frmVidomostiProViluchenny.lblT.Enabled:=false;
          end;
      else
        begin
          frmVidomostiProViluchenny.lblVagaOdinici.Enabled:=true;
          frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=true;
          frmVidomostiProViluchenny.lblZagalnaVaga.Enabled:=true;
          frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=true;
          frmVidomostiProViluchenny.lblKG.Enabled:=true;
          frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=true;
          frmVidomostiProViluchenny.lblT.Enabled:=true;
       end;
      end;
    end
    else
    begin
      frmVidomostiProViluchenny.lblVagaOdinici.Enabled:=true;
      frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=true;
      frmVidomostiProViluchenny.lblZagalnaVaga.Enabled:=true;
      frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=true;
      frmVidomostiProViluchenny.lblKG.Enabled:=true;
      frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=true;
      frmVidomostiProViluchenny.lblT.Enabled:=true;
    end;
    if frmVidomostiProViluchenny.Caption='Видалення запису' then
    begin
      frmVidomostiProViluchenny.lblVagaOdinici.Enabled:=false;
      frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=false;
      frmVidomostiProViluchenny.lblZagalnaVaga.Enabled:=false;
      frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=false;
      frmVidomostiProViluchenny.lblKG.Enabled:=false;
      frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=false;
      frmVidomostiProViluchenny.lblT.Enabled:=false;
    end;
  end;
end;

procedure TfrmVidomostiProViluchenny.aVirobnikUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProViluchenny do
  begin
    qRecord_ID.SQL.Clear;
    qRecord_ID.SQL.Text:='select * from VIROBNIKI order by NAZVA_VIROBNIKA';
    qRecord_ID.Open;
    cbVirobnik.Text:='';
    cbVirobnik.Items.Clear;
    qRecord_ID.First;
    while not qRecord_ID.Eof do
    begin
      cbVirobnik.Items.Add(qRecord_ID.FieldByName('NAZVA_VIROBNIKA').Value);
      qRecord_ID.Next;
    end;
  end;
end;

procedure TfrmVidomostiProViluchenny.aVirobnikChoiceExecute(
  Sender: TObject);
begin
  frmVidomostiProViluchenny.Enabled:=false;
  frmMain.aVirobnikiExecute(sender);
  frmVirobniki.aChoice.Enabled:=true;
  frmVirobniki.Left:=frmMain.Left+70;
  frmVirobniki.Top:=frmMain.Top+70;
  frmVirobniki.Width:=frmMain.Width-70;
  frmVirobniki.Height:=frmMain.Height-70;
  frmVirobniki.Position:=poMainFormCenter;
  frmVirobniki.FormStyle:=fsNormal;
  frmVirobniki.BorderStyle:=bsDialog;
end;

end.
