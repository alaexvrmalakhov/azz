unit VidomostiProFinansovu;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, ComCtrls,
  Controls, StdCtrls, IniFiles, SysUtils, Dialogs;

const
  N1: array[0..9] of string = ('нуль',
    'одна',
    'дв≥',
    'три',
    'чотири',
    'п''€ть',
    'ш≥сть',
    'с≥мь',
    'в≥с≥мь',
    'дев''€ть');

const
  N1000: array[1..9] of string = ('одна',
    'дв≥',
    'три',
    'чотири',
    'п''€ть',
    'ш≥сть',
    'с≥мь',
    'в≥с≥мь',
    'дев''€ть');

const
  N11: array[0..9] of string = ('дес€ть',
    'одинадц€ть',
    'дванадц€ть',
    'тринадц€ть',
    'чотирнадц€ть',
    'п''€тнадц€ть',
    'ш≥стнадц€ть',
    'с≥мнадц€ть',
    'в≥с≥мнадц€ть',
    'дев''€тнадц€ть');

const
  N2: array[1..9] of string = ('дес€ть',
    'двадц€ть',
    'тридц€ть',
    'сорок',
    'п''€тдес€т',
    'ш≥стьдес€т',
    'с≥мьдес€т',
    'в≥с≥мьдес€т',
    'дев''€носто'
    );

const
  N3: array[1..9] of string = ('сто',
    'дв≥ст≥',
    'триста',
    'чотириста',
    'п''€тьсот',
    'ш≥стьсот',
    'с≥мьсот',
    'в≥с≥мьсот',
    'дев''€тьсот'
    );

const
  NThousand: array[1..3] of string = ('тис€ча ',
    'тис€чи ',
    'тис€ч ');

const
  NMillion: array[1..3] of string = ('м≥льйон ',
    'м≥льйона ',
    'м≥льйон≥в ');

type
  TfrmVidomostiProFinansovu = class(TForm)
    Label15: TLabel;
    edtNajmenuvannyTovaru: TEdit;
    Label16: TLabel;
    edtKilkistTovaru: TEdit;
    Label17: TLabel;
    edtCinaOdinici: TEdit;
    Label24: TLabel;
    edtCinaOdiniciPropisom: TEdit;
    btnCinaOdinici: TButton;
    Label18: TLabel;
    edtZagalnaCina: TEdit;
    Label25: TLabel;
    edtZagalnaCinaPropisom: TEdit;
    btnZagalnaCina: TButton;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    cbOdiniciVimiru: TComboBox;
    Label4: TLabel;
    edtNomerPostanovi: TEdit;
    Label5: TLabel;
    dtpDataPostanovi: TDateTimePicker;
    Label6: TLabel;
    edtRecordID: TEdit;
    alVidomostiProFinansovu: TActionList;
    aUpdateNomerDataPostanovi: TAction;
    aRecordIDUpdate: TAction;
    qVidomostiProFinansovu: TIBQuery;
    Label1: TLabel;
    cbVirobnik: TComboBox;
    btnVirobnikUpdate: TButton;
    btnVirobnikChoice: TButton;
    aVirobnikUpdate: TAction;
    aVirobnikChoice: TAction;
    aOdiniciVimiruUpdate: TAction;
    aCinaOdiniciPropisomUpdate: TAction;
    aZagalnaCinaUpdate: TAction;
    aOK: TAction;
    aCancel: TAction;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    function CinaPropisom(suma: Real): string;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aUpdateNomerDataPostanoviExecute(Sender: TObject);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aVirobnikUpdateExecute(Sender: TObject);
    procedure aVirobnikChoiceExecute(Sender: TObject);
    procedure aOdiniciVimiruUpdateExecute(Sender: TObject);
    procedure aCinaOdiniciPropisomUpdateExecute(Sender: TObject);
    procedure edtCinaOdiniciExit(Sender: TObject);
    procedure aZagalnaCinaUpdateExecute(Sender: TObject);
    procedure edtZagalnaCinaExit(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure edtZagalnaCinaClick(Sender: TObject);
  private
    function IntToStroka(n: Integer): String;
  end;

var
  frmVidomostiProFinansovu: TfrmVidomostiProFinansovu;

implementation

uses
  FinansoviSankciiEdit, Main, Virobniki;

{$R *.dfm}

function TfrmVidomostiProFinansovu.CinaPropisom(suma:Real):string;
var
  valuta, str: string;
  IntPart, DecPartToInt: integer;
  DecPart: Real;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  valuta:=INIAZZ.ReadString('System','Money',valuta);
  IntPart:=trunc(int(suma));
  DecPart:=suma-IntPart;
  str:='';
  DecPartToInt:=trunc(int(DecPart*100));
  str:=str+FloatToStr(suma)+' (';
  if IntPart=0 then str:=str+'нуль '+valuta else str:=str+IntToStroka(IntPart)+' '+valuta;
  if DecPartToInt=0 then str:=str+' 00 коп.)' else str:=str+' '+IntToStr(DecPartToInt)+' коп.)';
//  str:=str+FloatToStr(suma)+' ('+IntToStroka(IntPart)+' '+valuta+' '+IntToStr(DecPartToInt)+' коп.)';
  INIAZZ.Free;
  CinaPropisom:=str;
end;

function TfrmVidomostiProFinansovu.IntToStroka(n: Integer): String;
var
  i, dec, j, j0: integer;
  s: string;
  degt, degm: boolean;
  buf: string;
begin
  degt:=false;
  degm:=false;
  s:=IntToStr(n);
  Result:='';
  for i:=length(s) downto 1 do
  begin
    dec:=(length(s)-i+1); // получим разр€д
    j:=StrToInt(s[i]); // получим цифру

    if j=0 then j0:=0;
    if (not (j in [1..9])) and (dec<>1) then Continue;

    if Dec in [1,4,7,10] then
    try
      if StrToInt(s[i-1])=1 then
      begin
        j0:=j;
        Continue;
      end; // подготовка к 10..19 тыс€ч/миллионов
    except
    end;

    if Dec in [2,5,8,11] then
      if j=1 then
      begin
        case dec of
          2: Result:=N11[j0]+' '; // если 10..19 тыс€ч/миллионов
          5:
            begin
              Result:=N11[j0]+' '+ NThousand[3]+Result;
              degt:=true;
            end;
          8:
            begin
              Result:=N11[j0]+' '+NMillion[3]+Result;
              degm:=true;
            end;
        end;
        Continue;
      end;

    if DEC in [4..6] then
    begin
      if (j<>0) and (not degt) then
      begin
        if dec=4 then
          case j of
            1: buf:=NThousand[1];
            2..4: buf:=NThousand[2];
              // прибавим слово тыс€ча если ещЄ не добавл€ли
            5..9: buf:=NThousand[3];
          end
        else
          buf:=NThousand[3];
        degt:=true;
      end;
    end;

    if DEC in [7..9] then
    begin
      if (j<>0) and (not degm) then
      begin
        if dec=7 then
          case j of
            1: buf:=NMillion[1];
            2..4: buf:=NMillion[2];
              // прибавим слово миллион если ещЄ не добавл€ли
            5..9: buf:=NMillion[3];
          end
        else
          buf:=NMillion[3];
        degm:=true;
      end;
    end;

    Result:=buf+Result;

    while dec>3 do
      dec:=dec-3;

    case Dec of
      1: if j<>0 then
          if degt and (not degm) then
            Result:=N1000[j]+' '+Result
          else
            Result:=N1[j]+' '+Result; // 3 три
      2: Result:=N2[j]+' '+Result; // 23 двадцать три
      3: Result:=N3[j]+' '+Result; // 123 сто двадцать три
    end;
    Buf:='';
    j0:=j;
  end;
end;

procedure TfrmVidomostiProFinansovu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmFinansoviSankciiEdit.Enabled:=true;
  frmMain.Enabled:=false;
  Action:=caFree;
end;

procedure TfrmVidomostiProFinansovu.aUpdateNomerDataPostanoviExecute(
  Sender: TObject);
begin
  frmVidomostiProFinansovu.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
  frmVidomostiProFinansovu.dtpDataPostanovi.Date:=int(frmFinansoviSankciiEdit.dtpDataPostanovi.Date);
end;

procedure TfrmVidomostiProFinansovu.aRecordIDUpdateExecute(
  Sender: TObject);
begin

  with frmVidomostiProFinansovu do
  begin
    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='insert into VIDOMOSTI_PRO_FINANSOVU (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qVidomostiProFinansovu.Open;
    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from VIDOMOSTI_PRO_FINANSOVU order by RECORD_ID';
    qVidomostiProFinansovu.Open;
    qVidomostiProFinansovu.Last;
    edtRecordID.Text:=IntToStr(qVidomostiProFinansovu.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmVidomostiProFinansovu.aVirobnikUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProFinansovu do
  begin
    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from VIROBNIKI order by NAZVA_VIROBNIKA';
    qVidomostiProFinansovu.Open;
    cbVirobnik.Text:='';
    cbVirobnik.Items.Clear;
    qVidomostiProFinansovu.First;
    while not qVidomostiProFinansovu.Eof do
    begin
      if not qVidomostiProFinansovu.FieldByName('NAZVA_VIROBNIKA').IsNull then cbVirobnik.Items.Add(qVidomostiProFinansovu.FieldByName('NAZVA_VIROBNIKA').Value);
      qVidomostiProFinansovu.Next;
    end;
  end;
end;

procedure TfrmVidomostiProFinansovu.aVirobnikChoiceExecute(
  Sender: TObject);
begin
  frmVidomostiProFinansovu.Enabled:=false;
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

procedure TfrmVidomostiProFinansovu.aOdiniciVimiruUpdateExecute(
  Sender: TObject);
begin
  with frmVidomostiProFinansovu do
  begin
    qVidomostiProFinansovu.SQL.Clear;
    qVidomostiProFinansovu.SQL.Text:='select * from ODINICI_VIMIRU order by SOKRASCHENNOE_NAZVANIE';
    qVidomostiProFinansovu.Open;
    cbOdiniciVimiru.Text:='';
    cbOdiniciVimiru.Items.Clear;
    qVidomostiProFinansovu.First;
    while not qVidomostiProFinansovu.Eof do
    begin
      cbOdiniciVimiru.Items.Add(qVidomostiProFinansovu.FieldByName('SOKRASCHENNOE_NAZVANIE').Value);
      qVidomostiProFinansovu.Next;
    end;
  end;
end;

procedure TfrmVidomostiProFinansovu.aCinaOdiniciPropisomUpdateExecute(
  Sender: TObject);
begin
  if frmVidomostiProFinansovu.edtCinaOdinici.Text='' then
  begin
    frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
    frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
    exit;
  end;
  try
    StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text);
  except
    frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
    frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
    exit;
  end;
  frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:=CinaPropisom(StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text));
end;

procedure TfrmVidomostiProFinansovu.edtCinaOdiniciExit(Sender: TObject);
begin
  if frmVidomostiProFinansovu.Caption<>'ƒодаванн€' then frmVidomostiProFinansovu.aCinaOdiniciPropisomUpdateExecute(sender);
end;

procedure TfrmVidomostiProFinansovu.aZagalnaCinaUpdateExecute(
  Sender: TObject);
begin
  if frmVidomostiProFinansovu.edtKilkistTovaru.Text='' then
  begin
    frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
    frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
    exit;
  end;
  try
    StrToFloat(frmVidomostiProFinansovu.edtKilkistTovaru.Text);
  except
    frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
    frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
    exit;
  end;
  if frmVidomostiProFinansovu.edtCinaOdinici.Text='' then
  begin
    frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
    frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
    exit;
  end;
  try
    StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text);
  except
    frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
    frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
    exit;
  end;
  frmVidomostiProFinansovu.edtZagalnaCina.Text:=FloatToStr(StrToFloat(frmVidomostiProFinansovu.edtKilkistTovaru.Text)*StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text));
  frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:=CinaPropisom(StrToFloat(frmVidomostiProFinansovu.edtZagalnaCina.Text));
//  frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:=CinaPropisom(StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text));
end;

procedure TfrmVidomostiProFinansovu.edtZagalnaCinaExit(Sender: TObject);
begin
  if frmVidomostiProFinansovu.Caption<>'ƒодаванн€' then frmVidomostiProFinansovu.aZagalnaCinaUpdateExecute(sender);
end;

procedure TfrmVidomostiProFinansovu.aOKExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if frmVidomostiProFinansovu.Caption='¬идаленн€' then
  begin
    if MessageDlg('”вага!!!'+#13+'¬≥дновленн€ цього запису п≥сл€ видаленн€ буде неможливе!'+#13+'¬и д≥йсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmVidomostiProFinansovu.qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='delete from VIDOMOSTI_PRO_FINANSOVU where RECORD_ID=:Kod';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Kod';
      qVidomostiProFinansovu.Params[0].Value:=frmVidomostiProFinansovu.edtRecordID.Text;
      qVidomostiProFinansovu.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmVidomostiProFinansovu.Close;
    frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
    exit;
  end;

  if frmVidomostiProFinansovu.Caption='–едагуванн€' then
  begin
    if frmVidomostiProFinansovu.edtNomerPostanovi.Text='' then
    begin
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidomostiProFinansovu.edtNomerPostanovi.Text);
    except
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtRecordID.Text='' then
    begin
      frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
      exit
    end;
    try
      StrToInt(frmVidomostiProFinansovu.edtRecordID.Text);
    except
      frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
      exit
    end;
    if frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text='' then
    begin
      frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.cbVirobnik.Text='' then
    begin
      frmVidomostiProFinansovu.cbVirobnik.Text:='';
      frmVidomostiProFinansovu.cbVirobnik.Items.Clear;
      frmVidomostiProFinansovu.aVirobnikUpdateExecute(sender);
      frmVidomostiProFinansovu.cbVirobnik.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtKilkistTovaru.Text='' then
    begin
      frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
      frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmVidomostiProFinansovu.edtKilkistTovaru.Text);
    except
      frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
      frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.cbOdiniciVimiru.Text='' then
    begin
      frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
      frmVidomostiProFinansovu.cbOdiniciVimiru.Items.Clear;
      frmVidomostiProFinansovu.aOdiniciVimiruUpdateExecute(sender);
      frmVidomostiProFinansovu.cbOdiniciVimiru.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtCinaOdinici.Text='' then
    begin
      frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
      frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text);
    except
      frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
      frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text='' then
    begin
      frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:='';
      frmVidomostiProFinansovu.aCinaOdiniciPropisomUpdateExecute(sender);
      frmVidomostiProFinansovu.edtCinaOdiniciPropisom.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtZagalnaCina.Text='' then
    begin
      frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
      frmVidomostiProFinansovu.edtZagalnaCinaClick(sender);
      frmVidomostiProFinansovu.edtZagalnaCina.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmVidomostiProFinansovu.edtZagalnaCina.Text);
    except
      frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
      frmVidomostiProFinansovu.edtZagalnaCinaClick(sender);
      frmVidomostiProFinansovu.edtZagalnaCina.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text='' then
    begin
      frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:='';
      frmVidomostiProFinansovu.aZagalnaCinaUpdateExecute(sender);
      frmVidomostiProFinansovu.edtZagalnaCinaPropisom.SetFocus;
      exit;
    end;
    with frmVidomostiProFinansovu do
    begin
      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=cbMinistry.Text;
      qVidomostiProFinansovu.Open;
      if qVidomostiProFinansovu.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qVidomostiProFinansovu.FieldByName('KOD').Value else Ministry:=0;

      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=Ministry;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[1].Name:='Teritory';
      qVidomostiProFinansovu.Params[1].Value:=cbTeritory.Text;
      qVidomostiProFinansovu.Open;
      if qVidomostiProFinansovu.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qVidomostiProFinansovu.FieldByName('KOD').Value else Teritory:=0;

      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=Ministry;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[1].Name:='Teritory';
      qVidomostiProFinansovu.Params[1].Value:=Teritory;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[2].Name:='Rajon';
      qVidomostiProFinansovu.Params[2].Value:=cbDistrict.Text;
      qVidomostiProFinansovu.Open;
      if qVidomostiProFinansovu.Locate('RAJON',cbDistrict.Text,[]) then District:=qVidomostiProFinansovu.FieldByName('KOD').Value else District:=0;

      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='update VIDOMOSTI_PRO_FINANSOVU set';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'NAJMENUVANNY_TOVARU=:NazvaTovaru,CINA_ODINICI=:CinaOdinici,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'CINA_ODINICI_PROPISOM=:CinaOdiniciPropisom,ZAGALNA_CINA=:ZagalnaCina,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'ZAGALNA_CINA_PROPISOM=:ZagalnaCinaPropisom,KILKIST_TOVARU=:Kilkist,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'VIROBNIK=:Virobnik,ODINICI_VIMIRU=:Vimir';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'where RECORD_ID=:Kod';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=Ministry;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[1].Name:='Teritory';
      qVidomostiProFinansovu.Params[1].Value:=Teritory;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[2].Name:='Rajon';
      qVidomostiProFinansovu.Params[2].Value:=District;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[3].Name:='NomerPostanovi';
      qVidomostiProFinansovu.Params[3].Value:=edtNomerPostanovi.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[4].Name:='DataPostanovi';
      qVidomostiProFinansovu.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[5].Name:='NazvaTovaru';
      qVidomostiProFinansovu.Params[5].Value:=edtNajmenuvannyTovaru.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[6].Name:='CinaOdinici';
      qVidomostiProFinansovu.Params[6].Value:=StrToFloat(edtCinaOdinici.Text);
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[7].Name:='CinaOdiniciPropisom';
      qVidomostiProFinansovu.Params[7].Value:=edtCinaOdiniciPropisom.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[8].Name:='ZagalnaCina';
      qVidomostiProFinansovu.Params[8].Value:=StrToFloat(edtZagalnaCina.Text);
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[9].Name:='ZagalnaCinaPropisom';
      qVidomostiProFinansovu.Params[9].Value:=edtZagalnaCinaPropisom.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[10].Name:='Kilkist';
      qVidomostiProFinansovu.Params[10].Value:=StrToFloat(edtKilkistTovaru.Text);
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[11].Name:='Virobnik';
      qVidomostiProFinansovu.Params[11].Value:=cbVirobnik.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[12].Name:='Vimir';
      qVidomostiProFinansovu.Params[12].Value:=cbOdiniciVimiru.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[13].Name:='Kod';
      qVidomostiProFinansovu.Params[13].Value:=edtRecordID.Text;
      qVidomostiProFinansovu.Open;
    end;
    frmVidomostiProFinansovu.Close;
    frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
    exit;
  end;

  if frmVidomostiProFinansovu.Caption='ƒодаванн€' then
  begin
    if frmVidomostiProFinansovu.edtNomerPostanovi.Text='' then
    begin
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    try
      StrToInt(frmVidomostiProFinansovu.edtNomerPostanovi.Text);
    except
      frmFinansoviSankciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNomerPostanovi.Text:=frmFinansoviSankciiEdit.edtNomerPostanovi.Text;
      frmFinansoviSankciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtRecordID.Text='' then
    begin
      frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
      exit
    end;
    try
      StrToInt(frmVidomostiProFinansovu.edtRecordID.Text);
    except
      frmVidomostiProFinansovu.aRecordIDUpdateExecute(sender);
      frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
      exit
    end;
    if frmVidomostiProFinansovu.edtNajmenuvannyTovaru.Text='' then
    begin
      frmVidomostiProFinansovu.edtNajmenuvannyTovaru.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.cbVirobnik.Text='' then
    begin
      frmVidomostiProFinansovu.cbVirobnik.Text:='';
      frmVidomostiProFinansovu.cbVirobnik.Items.Clear;
      frmVidomostiProFinansovu.aVirobnikUpdateExecute(sender);
      frmVidomostiProFinansovu.cbVirobnik.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtKilkistTovaru.Text='' then
    begin
      frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
      frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmVidomostiProFinansovu.edtKilkistTovaru.Text);
    except
      frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
      frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.cbOdiniciVimiru.Text='' then
    begin
      frmVidomostiProFinansovu.cbOdiniciVimiru.Text:='';
      frmVidomostiProFinansovu.cbOdiniciVimiru.Items.Clear;
      frmVidomostiProFinansovu.aOdiniciVimiruUpdateExecute(sender);
      frmVidomostiProFinansovu.cbOdiniciVimiru.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtCinaOdinici.Text='' then
    begin
      frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
      frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text);
    except
      frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
      frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text='' then
    begin
      frmVidomostiProFinansovu.edtCinaOdiniciPropisom.Text:='';
      frmVidomostiProFinansovu.aCinaOdiniciPropisomUpdateExecute(sender);
      frmVidomostiProFinansovu.edtCinaOdiniciPropisom.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtZagalnaCina.Text='' then
    begin
      frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
      frmVidomostiProFinansovu.edtZagalnaCinaClick(sender);
      frmVidomostiProFinansovu.edtZagalnaCina.SetFocus;
      exit;
    end;
    try
      StrToFloat(frmVidomostiProFinansovu.edtZagalnaCina.Text);
    except
      frmVidomostiProFinansovu.edtZagalnaCina.Text:='';
      frmVidomostiProFinansovu.edtZagalnaCinaClick(sender);
      frmVidomostiProFinansovu.edtZagalnaCina.SetFocus;
      exit;
    end;
    if frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text='' then
    begin
      frmVidomostiProFinansovu.edtZagalnaCinaPropisom.Text:='';
      frmVidomostiProFinansovu.aZagalnaCinaUpdateExecute(sender);
      frmVidomostiProFinansovu.edtZagalnaCinaPropisom.SetFocus;
      exit;
    end;
    with frmVidomostiProFinansovu do
    begin
      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=cbMinistry.Text;
      qVidomostiProFinansovu.Open;
      if qVidomostiProFinansovu.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qVidomostiProFinansovu.FieldByName('KOD').Value else Ministry:=0;

      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=Ministry;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[1].Name:='Teritory';
      qVidomostiProFinansovu.Params[1].Value:=cbTeritory.Text;
      qVidomostiProFinansovu.Open;
      if qVidomostiProFinansovu.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qVidomostiProFinansovu.FieldByName('KOD').Value else Teritory:=0;

      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=Ministry;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[1].Name:='Teritory';
      qVidomostiProFinansovu.Params[1].Value:=Teritory;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[2].Name:='Rajon';
      qVidomostiProFinansovu.Params[2].Value:=cbDistrict.Text;
      qVidomostiProFinansovu.Open;
      if qVidomostiProFinansovu.Locate('RAJON',cbDistrict.Text,[]) then District:=qVidomostiProFinansovu.FieldByName('KOD').Value else District:=0;

      qVidomostiProFinansovu.SQL.Clear;
      qVidomostiProFinansovu.SQL.Text:='update VIDOMOSTI_PRO_FINANSOVU set';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'NAJMENUVANNY_TOVARU=:NazvaTovaru,CINA_ODINICI=:CinaOdinici,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'CINA_ODINICI_PROPISOM=:CinaOdiniciPropisom,ZAGALNA_CINA=:ZagalnaCina,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'ZAGALNA_CINA_PROPISOM=:ZagalnaCinaPropisom,KILKIST_TOVARU=:Kilkist,';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'VIROBNIK=:Virobnik,ODINICI_VIMIRU=:Vimir';
      qVidomostiProFinansovu.SQL.Text:=qVidomostiProFinansovu.SQL.Text+'where RECORD_ID=:Kod';
      qVidomostiProFinansovu.Params.Clear;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[0].Name:='Ministry';
      qVidomostiProFinansovu.Params[0].Value:=Ministry;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[1].Name:='Teritory';
      qVidomostiProFinansovu.Params[1].Value:=Teritory;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[2].Name:='Rajon';
      qVidomostiProFinansovu.Params[2].Value:=District;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[3].Name:='NomerPostanovi';
      qVidomostiProFinansovu.Params[3].Value:=edtNomerPostanovi.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[4].Name:='DataPostanovi';
      qVidomostiProFinansovu.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[5].Name:='NazvaTovaru';
      qVidomostiProFinansovu.Params[5].Value:=edtNajmenuvannyTovaru.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[6].Name:='CinaOdinici';
      qVidomostiProFinansovu.Params[6].Value:=StrToFloat(edtCinaOdinici.Text);
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[7].Name:='CinaOdiniciPropisom';
      qVidomostiProFinansovu.Params[7].Value:=edtCinaOdiniciPropisom.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[8].Name:='ZagalnaCina';
      qVidomostiProFinansovu.Params[8].Value:=StrToFloat(edtZagalnaCina.Text);
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[9].Name:='ZagalnaCinaPropisom';
      qVidomostiProFinansovu.Params[9].Value:=edtZagalnaCinaPropisom.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[10].Name:='Kilkist';
      qVidomostiProFinansovu.Params[10].Value:=StrToFloat(edtKilkistTovaru.Text);
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[11].Name:='Virobnik';
      qVidomostiProFinansovu.Params[11].Value:=cbVirobnik.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[12].Name:='Vimir';
      qVidomostiProFinansovu.Params[12].Value:=cbOdiniciVimiru.Text;
      qVidomostiProFinansovu.Params.Add;
      qVidomostiProFinansovu.Params[13].Name:='Kod';
      qVidomostiProFinansovu.Params[13].Value:=edtRecordID.Text;
      qVidomostiProFinansovu.Open;
    end;
    frmVidomostiProFinansovu.Close;
    frmFinansoviSankciiEdit.aUpdateVidomostiExecute(sender);
    exit;
  end;
end;

procedure TfrmVidomostiProFinansovu.aCancelExecute(Sender: TObject);
begin
  frmVidomostiProFinansovu.Close;
end;

procedure TfrmVidomostiProFinansovu.edtZagalnaCinaClick(Sender: TObject);
begin
  if frmVidomostiProFinansovu.edtKilkistTovaru.Text='' then
  begin
    frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
    frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
    exit;
  end;
  try
    StrToFloat(frmVidomostiProFinansovu.edtKilkistTovaru.Text);
  except
    frmVidomostiProFinansovu.edtKilkistTovaru.Text:='';
    frmVidomostiProFinansovu.edtKilkistTovaru.SetFocus;
    exit;
  end;
  if frmVidomostiProFinansovu.edtCinaOdinici.Text='' then
  begin
    frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
    frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
    exit;
  end;
  try
    StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text);
  except
    frmVidomostiProFinansovu.edtCinaOdinici.Text:='';
    frmVidomostiProFinansovu.edtCinaOdinici.SetFocus;
    exit;
  end;
  frmVidomostiProFinansovu.edtZagalnaCina.Text:=FloatToStr(StrToFloat(frmVidomostiProFinansovu.edtKilkistTovaru.Text)*StrToFloat(frmVidomostiProFinansovu.edtCinaOdinici.Text));
end;

end.
