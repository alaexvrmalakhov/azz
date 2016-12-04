unit SumiShtrafuEdit;

interface

uses
  Forms, Classes, ActnList, StdCtrls, Controls, SysUtils, IniFiles, Dialogs;

const
  N1: array[0..9] of string = ('нуль',
    'одна',
    'дв≥',
    'три',
    'чотири',
    'п''€ть',
    'ш≥сть',
    'с≥м',
    'в≥с≥м',
    'дев''€ть');

const
  N1000: array[1..9] of string = ('одна',
    'дв≥',
    'три',
    'чотири',
    'п''€ть',
    'ш≥сть',
    'с≥м',
    'в≥с≥м',
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
    'ш≥стдес€т',
    'с≥мдес€т',
    'в≥с≥мдес€т',
    'дев''€носто'
    );

const
  N3: array[1..9] of string = ('сто',
    'дв≥ст≥',
    'триста',
    'чотириста',
    'п''€тсот',
    'ш≥стсот',
    'с≥мсот',
    'в≥с≥мсот',
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
  TfrmSumiShtrafuEdit = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCumaShtrafu: TEdit;
    edtSumaPropisom: TEdit;
    btnPerevesti: TButton;
    btnVikonati: TButton;
    btnVidminiti: TButton;
    alSumaShtrafuEdit: TActionList;
    aConvert: TAction;
    aOK: TAction;
    aCancel: TAction;
    Label3: TLabel;
    edtKod: TEdit;
    btnKod: TButton;
    aKodUpdate: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aConvertExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aKodUpdateExecute(Sender: TObject);
  public
    function IntToStroka(n: Integer): AnsiString;
  end;

var
  frmSumiShtrafuEdit: TfrmSumiShtrafuEdit;

implementation

uses
  Main, ShtrafiEdit, SumiShtrafu;

{$R *.dfm}

function TfrmSumiShtrafuEdit.IntToStroka(n: integer): AnsiString;
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

procedure TfrmSumiShtrafuEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  if frmMain.IsFormOpen('frmFinansoviSankciiEdit') then
//  begin
//    frmFinansoviSankciiEdit.Enabled:=true;
//    frmMain.Enabled:=false;
//    if frmViddilennyEdit.Caption<>'¬иб≥р суми штрафу' then
//    begin
//      frmViddilenny.Enabled:=true;
//      frmFinansoviSankciiEdit.Enabled:=false;
//    end
//    else
//      frmViddilenny.Close;
//    Action:=caFree;
//    exit;
//  end;

  if frmMain.IsFormOpen('frmShtrafiEdit') then
  begin
    frmShtrafiEdit.Enabled:=true;
    frmMain.Enabled:=false;
    if frmSumiShtrafu.BorderStyle=bsDialog then
    begin
      frmSumiShtrafu.Enabled:=true;
      frmShtrafiEdit.Enabled:=false;
    end;
//    if frmSumiShtrafuEdit.Caption<>'¬иб≥р суми штрафу' then
//    begin
//      frmSumiShtrafu.Enabled:=true;
//      frmShtrafiEdit.Enabled:=false;
//    end
//    else
//      frmSumiShtrafu.Close;
    Action:=caFree;
    exit;
  end;

  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmSumiShtrafuEdit.aConvertExecute(Sender: TObject);
var
  valuta: string;
begin
  if frmSumiShtrafuEdit.edtCumaShtrafu.Text='' then
  begin
    frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
    exit;
  end;
  try
    StrToInt(frmSumiShtrafuEdit.edtCumaShtrafu.Text);
  except
    frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
    frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
    exit;
  end;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  valuta:=INIAZZ.ReadString('System','Money',valuta);
  INIAZZ.Free;
  frmSumiShtrafuEdit.edtSumaPropisom.Text:=IntToStroka(StrToInt(frmSumiShtrafuEdit.edtCumaShtrafu.Text))+' '+valuta;
//  frmSumiShtrafuEdit.edtSumaPropisom.Text:=IntToStroka(StrToInt(frmSumiShtrafuEdit.edtCumaShtrafu.Text))+' '+valuta;
end;

procedure TfrmSumiShtrafuEdit.aCancelExecute(Sender: TObject);
begin
  frmSumiShtrafuEdit.Close;
end;

procedure TfrmSumiShtrafuEdit.aOKExecute(Sender: TObject);
begin
  if frmSumiShtrafuEdit.Caption='¬иб≥р суми штрафу' then
  begin
    if frmMain.IsFormOpen('frmShtrafiEdit') then
    begin
      frmShtrafiEdit.cbRozmirShtrafu.Text:=frmSumiShtrafuEdit.edtCumaShtrafu.Text;
      frmSumiShtrafuEdit.Close;
      frmSumiShtrafu.Close;
      exit;
    end;
  end;

  if frmSumiShtrafuEdit.Caption='¬идаленн€ суми штрафу' then
  begin
    if MessageDlg('¬идаленн€ цього запису може в≥добразитись на ≥нших даних!!!'+#13+'¬и д≥йсно бажаЇте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmSumiShtrafu.qTemp.SQL.Clear;
      frmSumiShtrafu.qTemp.SQL.Text:='delete from SHTRAFI where KOD=:Kod';
      frmSumiShtrafu.qTemp.Params.Clear;
      frmSumiShtrafu.qTemp.Params.Add;
      frmSumiShtrafu.qTemp.Params[0].Name:='Kod';
      frmSumiShtrafu.qTemp.Params[0].Value:=frmSumiShtrafuEdit.edtKod.Text;
      frmSumiShtrafu.qTemp.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmSumiShtrafuEdit.Close;
    frmSumiShtrafu.aUpdateExecute(sender);
    exit;
  end;

  if frmSumiShtrafuEdit.Caption='–едагуванн€ суми штрафу' then
  begin
    if frmSumiShtrafuEdit.edtKod.Text='' then
    begin
      frmSumiShtrafuEdit.aKodUpdateExecute(sender);
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmSumiShtrafuEdit.edtKod.Text);
    except
      frmSumiShtrafuEdit.aKodUpdateExecute(sender);
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    if frmSumiShtrafuEdit.edtCumaShtrafu.Text='' then
    begin
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    try
      StrToInt(frmSumiShtrafuEdit.edtCumaShtrafu.Text);
    except
      frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    if frmSumiShtrafuEdit.edtSumaPropisom.Text='' then
    begin
      frmSumiShtrafuEdit.aConvertExecute(sender);
      frmSumiShtrafuEdit.edtSumaPropisom.SetFocus;
      exit;
    end;
    frmSumiShtrafu.qTemp.SQL.Clear;
    frmSumiShtrafu.qTemp.SQL.Text:='update SHTRAFI set SUMASHTAFU=:SumaShtrafu,SUMAPROPISOM=:SumaPropisom where KOD=:Kod';
    frmSumiShtrafu.qTemp.Params.Clear;
    frmSumiShtrafu.qTemp.Params.Add;
    frmSumiShtrafu.qTemp.Params[0].Name:='SumaShtrafu';
    frmSumiShtrafu.qTemp.Params[0].Value:=frmSumiShtrafuEdit.edtCumaShtrafu.Text;
    frmSumiShtrafu.qTemp.Params.Add;
    frmSumiShtrafu.qTemp.Params[1].Name:='SumaPropisom';
    frmSumiShtrafu.qTemp.Params[1].Value:=frmSumiShtrafuEdit.edtSumaPropisom.Text;
    frmSumiShtrafu.qTemp.Params.Add;
    frmSumiShtrafu.qTemp.Params[2].Name:='Kod';
    frmSumiShtrafu.qTemp.Params[2].Value:=frmSumiShtrafuEdit.edtKod.Text;
    frmSumiShtrafu.qTemp.Open;
    frmMain.trAzz.CommitRetaining;
    frmSumiShtrafuEdit.Close;
    frmSumiShtrafu.aUpdateExecute(sender);
    exit;
  end;

  if frmSumiShtrafuEdit.Caption='ƒодаванн€ суми штрафу' then
  begin
    if frmSumiShtrafuEdit.edtKod.Text='' then
    begin
      frmSumiShtrafuEdit.aKodUpdateExecute(sender);
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    try
      StrToInt64(frmSumiShtrafuEdit.edtKod.Text);
    except
      frmSumiShtrafuEdit.aKodUpdateExecute(sender);
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    if frmSumiShtrafuEdit.edtCumaShtrafu.Text='' then
    begin
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    try
      StrToInt(frmSumiShtrafuEdit.edtCumaShtrafu.Text);
    except
      frmSumiShtrafuEdit.edtCumaShtrafu.Text:='';
      frmSumiShtrafuEdit.edtCumaShtrafu.SetFocus;
      exit;
    end;
    if frmSumiShtrafuEdit.edtSumaPropisom.Text='' then
    begin
      frmSumiShtrafuEdit.aConvertExecute(sender);
      frmSumiShtrafuEdit.edtSumaPropisom.SetFocus;
      exit;
    end;
    frmSumiShtrafu.qTemp.SQL.Clear;
    frmSumiShtrafu.qTemp.SQL.Text:='update SHTRAFI set SUMASHTAFU=:SumaShtrafu,SUMAPROPISOM=:SumaPropisom where KOD=:Kod';
    frmSumiShtrafu.qTemp.Params.Clear;
    frmSumiShtrafu.qTemp.Params.Add;
    frmSumiShtrafu.qTemp.Params[0].Name:='SumaShtrafu';
    frmSumiShtrafu.qTemp.Params[0].Value:=frmSumiShtrafuEdit.edtCumaShtrafu.Text;
    frmSumiShtrafu.qTemp.Params.Add;
    frmSumiShtrafu.qTemp.Params[1].Name:='SumaPropisom';
    frmSumiShtrafu.qTemp.Params[1].Value:=frmSumiShtrafuEdit.edtSumaPropisom.Text;
    frmSumiShtrafu.qTemp.Params.Add;
    frmSumiShtrafu.qTemp.Params[2].Name:='Kod';
    frmSumiShtrafu.qTemp.Params[2].Value:=frmSumiShtrafuEdit.edtKod.Text;
    frmSumiShtrafu.qTemp.Open;
    frmMain.trAzz.CommitRetaining;
    frmSumiShtrafuEdit.Close;
    frmSumiShtrafu.aUpdateExecute(sender);
    exit;
  end;
end;

procedure TfrmSumiShtrafuEdit.aKodUpdateExecute(Sender: TObject);
begin
  with frmSumiShtrafu do
  begin
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='insert into SHTRAFI (KOD) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    qTemp.Open;
    qTemp.SQL.Clear;
    qTemp.SQL.Text:='select * from SHTRAFI order by KOD';
    qTemp.Open;
    qTemp.Last;
    frmSumiShtrafuEdit.edtKod.Text:=IntToStr(qTemp.FieldByName('KOD').Value);
  end;
end;

end.
