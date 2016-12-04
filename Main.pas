{
Відмінок 	Питання для істот 	Питання для неістот
Називний 	Хто? 	                Що?
Родовий 	Кого? 	                Чого?
Давальний 	Кому? 	                Чому?
Знахідний 	Кого? 	                Що?
Орудний 	Ким? 	                Чим?
Місцевий 	(На) кому? 	        (На) чому?
Кличний
}
unit Main;

interface

uses
  Forms, OleServer, WordXP, ExtCtrls, ImgList, Controls, IBDatabase, DB,
  StdActns, Classes, ActnList, IBServices, Menus, DBCtrls, ToolWin,
  ComCtrls, Windows, INIFiles, Messages, SysUtils, Dialogs;
//  , Word2000;

//, StdCtrls;
//  , IBCustomDataSet, IBQuery, Graphics, DateUtils, Variants, IBSQL,
//  , Gauges, DBTables, DBCtrls, ShellApi, ToolWin,

//type
  {Для индикации процесса копирования}
//  TCallBack = procedure (Position, Size: Longint);

type
  TfrmMain = class(TForm)
    StatusBar: TStatusBar;
    MainMenu1: TMainMenu;
    mnZahodi: TMenuItem;
    mnZahodiShtrafiShtrafi: TMenuItem;
    mnZvit: TMenuItem;
    mnNalashtuvanny: TMenuItem;
    mnDovidniki: TMenuItem;
    mnDovidnikiOrganizaciyViddilenny: TMenuItem;
    mnDovidnikiOrganizaciySpivrobitniki: TMenuItem;
    mnDovidnikiPidkontrolniObjektiObjekti: TMenuItem;
    mnDovidnikiNormativnaBazaStatti: TMenuItem;
    mnNalashtuvannyOrganizaciy: TMenuItem;
    mnVihod: TMenuItem;
    mnDovidnikiOrganizaciyPosadi: TMenuItem;
    mnDovidnikiSumiShtrafu: TMenuItem;
    mnDovidnikiRezultatOskargenny: TMenuItem;
    mnNalashtuvannyNalashtuvannySistemi: TMenuItem;
    mnDovidnikiNormativnaBazaNormativniAkti: TMenuItem;
    mnDovidnikiRozdil_T23_F18: TMenuItem;
    mnDovidnikiKudiOskarzheno: TMenuItem;
    mnHelp: TMenuItem;
    mnHelpAbout: TMenuItem;
    mnDovidnikiViznatiVinnim: TMenuItem;
    mnDovidnikiLaboratorniDoslidzhenny: TMenuItem;
    mnZvitSchomisychnij: TMenuItem;
    mnZvitT23F18: TMenuItem;
    mnZvitZvyzkiZSchomisychnim: TMenuItem;
    mnZvitZvyzkiZSchokvartalnim: TMenuItem;
    mnZvitZvyzkiZRezultatamiOskarzhenny: TMenuItem;
    mnDovidnikiTipShtrafu: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiAdminZapobizhZahodi: TMenuItem;
    mnDovidnikiVidPostanovi: TMenuItem;
    mnNalashtuvannyVidPostanovi: TMenuItem;
    mnDovidnikiPidkontrolniObjektiVidomchaPidporydkovanist: TMenuItem;
    mnDovidnikiSutPostanovi: TMenuItem;
    mnZahodiFinansovi_SankciiFinansoviSankcii: TMenuItem;
    mnVidstoronennyVidRoboti: TMenuItem;
    mnPeredachaDoProkuraturi: TMenuItem;
    mnDovidnikiOrganizacii: TMenuItem;
    mnDovidnikiNapravlenny: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiViluchennyZRealizacii: TMenuItem;
    mnDovidnikiVirobniki: TMenuItem;
    mnDovidnikiUmoviVidnovlenny: TMenuItem;
    mnDovidnikiOdiniciVimiru: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiNeVrucheni: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiOskarzheni: TMenuItem;
    mnZahodiFinansovi_SankciiNeVrucheni: TMenuItem;
    mnZahodiFinansovi_SankciiNeSplacheni: TMenuItem;
    N7: TMenuItem;
    mnDovidnikiTipiProdukcii: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiNazvaObjektu: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiAdresaObjektu: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiTipPostanovi: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciiTipProdukcii: TMenuItem;
    mnZahodiFinansovi_SankciiObjekt: TMenuItem;
    mnZahodiFinansovi_SankciiSES: TMenuItem;
    mnZahodiFinansovi_SankciiSESPIBPredstavnika: TMenuItem;
    mnZahodiFinansovi_SankciiSESPosadaPredstavnika: TMenuItem;
    mnZahodiFinansovi_SankciiObjektNazvaObjektu: TMenuItem;
    mnZahodiFinansovi_SankciiObjektAdresaObjektu: TMenuItem;
    mnRishennyRVK: TMenuItem;
    mnPropozicii: TMenuItem;
    mnNalashtuvannyKoristuvachi: TMenuItem;
    mnNalashtuvannyKoristuvachiKoristuvachi: TMenuItem;
    mnNalashtuvannyKoristuvachiFunkciiDostupu: TMenuItem;
    mnNalashtuvannyKoristuvachiGrupi: TMenuItem;
    mnVikna: TMenuItem;
    mnViknaArrange: TMenuItem;
    mnViknaCascade: TMenuItem;
    mnViknaClose: TMenuItem;
    mnViknaTileHorizontal: TMenuItem;
    mnViknaTileVertical: TMenuItem;
    ssUsers: TIBSecurityService;
    mnNalashtuvannyKoristuvachiFunkciiDostupuElementiVikon: TMenuItem;
    mnNalashtuvannyKoristuvachiFunkciiDostupuVikna: TMenuItem;
    mnDovidnikiTeritoryRajoni: TMenuItem;
    mnDovidnikiTeritoryTeritory: TMenuItem;
    mnDovidnikiTeritoryMinistry: TMenuItem;
    mnDovidnikiTeritory: TMenuItem;
    mnDovidnikiNormativnaBaza: TMenuItem;
    mnDovidnikiOrganizaciy: TMenuItem;
    N18: TMenuItem;
    mnDovidnikiPidkontrolniObjekti: TMenuItem;
    alMain: TActionList;
    aProProgramu: TAction;
    aWindowClose: TWindowClose;
    aWindowCascade: TWindowCascade;
    aWindowTileHorizontal: TWindowTileHorizontal;
    aWindowTileVertical: TWindowTileVertical;
    aWindowMinimizeAll: TWindowMinimizeAll;
    aWindowArrange: TWindowArrange;
    mnViknaMinimizeAll: TMenuItem;
    aShtrafi: TAction;
    dbAzz: TIBDatabase;
    trAzz: TIBTransaction;
    aNalashtuvannySistemy: TAction;
    aVihod: TAction;
    aOrganizaciya: TAction;
    aMinistry: TAction;
    aTeritory: TAction;
    aDistrict: TAction;
    aVidomchaPidporydkovanist: TAction;
    aObjekti: TAction;
    aViddilenny: TAction;
    aPosadi: TAction;
    aSpivrobitniki: TAction;
    aViznatiVinnim: TAction;
    aNormativniAkti: TAction;
    aStatti: TAction;
    aRozdil_t23_f18: TAction;
    aTipShtrafu: TAction;
    aSumiShtrafu: TAction;
    aLaboratorniDoslidzhenny: TAction;
    aKudiOskarzheno: TAction;
    aOskarzhenny: TAction;
    aNapravlenny: TAction;
    mnZahodiShtrafiNeSplacheni: TMenuItem;
    mnZahodiShtrafiNeVrucheni: TMenuItem;
    mnZahodiShtrafiPeredaniDoVDVS: TMenuItem;
    mnZahodiShtrafiPeredaniDoVDVSPeredani: TMenuItem;
    mnZahodiShtrafiPeredaniDoVDVSSplacheni: TMenuItem;
    mnZahodiShtrafiNePeredaniDoVDVS: TMenuItem;
    mnZahodiShtrafiPrimusovoStygneni: TMenuItem;
    mnZahodiShtrafiSkasovani: TMenuItem;
    mnZahodiShtrafiSpivrobitnik: TMenuItem;
    mnZahodiShtrafiTipShtrafu: TMenuItem;
    mnZahodiShtrafiObjekt: TMenuItem;
    mnZahodiShtrafiObjektAdresa: TMenuItem;
    mnZahodiShtrafiObjektNazva: TMenuItem;
    aAdminZahodi: TAction;
    mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiOskarzheni: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiPovidomleni: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiOpechatani: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi: TMenuItem;
    aVidPostanovi: TAction;
    aNalashtuvannyViduPostanovi: TAction;
    aVidObmezhen: TAction;
    aUmoviVidnovlenny: TAction;
    aOrganizacii: TAction;
    mnZahodiShtrafi: TMenuItem;
    mnZahodiAdmin_Zapobizh_Zahodi: TMenuItem;
    mnShtrafiChoices: TMenuItem;
    mnAdminChoices: TMenuItem;
    mnZahodiViluchenny_Z_Realizacii: TMenuItem;
    mnVibir_Viluchenny_Choices: TMenuItem;
    mnZahodiFinansovi_Sankcii: TMenuItem;
    N13: TMenuItem;
    aViluchennyZRealizacii: TAction;
    aTipProdukcii: TAction;
    aVirobniki: TAction;
    aFinansoviSankcii: TAction;
    mnZahodiFinansovi_SankciiOskarzheni: TMenuItem;
    aNalashtuvannyKoristuvachi: TAction;
    aNalashtuvannyGroups: TAction;
    aZvitSchomisychnij: TAction;
    aNalashtuvanny_ZvyazokZSchomicyachnim: TAction;
    aNalashtuvanny_ZvyazokZRezultatamiOskarzhenny: TAction;
    aZvitT23F18: TAction;
    aZvitSchokvartalnij: TAction;
    mnNalashtuvannyKoristuvachiGlobalUsers: TMenuItem;
    aNalashtuvannyGlobalUsers: TAction;
    mnFunkciiDostupu: TMenuItem;
    aNalashtuvanny_FunkciiDostupu: TAction;
    N17: TMenuItem;
    aNalashtuvanny_Vikna: TAction;
    aNalashtuvanny_ElementiVikon: TAction;
    aNalashtuvanny_PravaKoristuvachiv: TAction;
    mnNalashtuvannyKoristuvachiPravaKoristuvachiv: TMenuItem;
    mnZahodiViluchenny_Z_RealizaciilRozdilT23F18: TMenuItem;
    mnZahodiShtrafiRozdilT23F18: TMenuItem;
    mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18: TMenuItem;
    mnZahodiFinansovi_SankciiTipProdukcii: TMenuItem;
    mnZahodiFinansovi_SankciiRozdilT23F18: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    cbMain: TCoolBar;
    ilMain: TImageList;
    DBNavigator1: TDBNavigator;
    Timer: TTimer;
    N5: TMenuItem;
    mnZvitZvyzki: TMenuItem;
    mnAdministruvanny: TMenuItem;
    aArchiving: TAction;
    aRestore: TAction;
    aUsers: TAction;
    aImport: TAction;
    aExport: TAction;
    mnAdministruvannyArchiving: TMenuItem;
    mnAdministruvannyRestore: TMenuItem;
    mnAdministruvannyUsers: TMenuItem;
    mnAdministruvannyImport: TMenuItem;
    mnAdministruvannyExport: TMenuItem;
    aProtokol: TAction;
    mnAdministruvannyProtokol: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    aRivniSES: TAction;
    mnDovidnikiRivniSES: TMenuItem;
    aDataTypes: TAction;
    mnDovidnikiDatasDataTypes: TMenuItem;
    mnDovidnikiDatas: TMenuItem;
    aCleaning: TAction;
    mnAdministruvannyCleaning: TMenuItem;
    mnDovidnikiDatasDataTables: TMenuItem;
    aDataTables: TAction;
    aReports: TAction;
    mnZvitReports: TMenuItem;
    aRozdiliInicializacii: TAction;
    mnDovidnikiRozdiliInicializacii: TMenuItem;
    sWordApp: TWordApplication;
    N9: TMenuItem;
    N2: TMenuItem;
    N10: TMenuItem;
    old1: TMenuItem;
    old2: TMenuItem;
    old3: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    old4: TMenuItem;
    N14: TMenuItem;
    old5: TMenuItem;
    N8: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    procedure ReadInit;
    procedure SaveInit;
    function IsFormOpen(const FormName : string): Boolean;
    procedure ShowHint(Sender: Tobject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnDovidnikiOdiniciVimiruClick(Sender: TObject);
    procedure aProProgramuExecute(Sender: TObject);
    procedure aShtrafiExecute(Sender: TObject);
    procedure aNalashtuvannySistemyExecute(Sender: TObject);
    procedure aVihodExecute(Sender: TObject);
    procedure aOrganizaciyaExecute(Sender: TObject);
    procedure aMinistryExecute(Sender: TObject);
    procedure aTeritoryExecute(Sender: TObject);
    procedure aDistrictExecute(Sender: TObject);
    procedure aVidomchaPidporydkovanistExecute(Sender: TObject);
    procedure aObjektiExecute(Sender: TObject);
    procedure aViddilennyExecute(Sender: TObject);
    procedure aPosadiExecute(Sender: TObject);
    procedure aSpivrobitnikiExecute(Sender: TObject);
    procedure aViznatiVinnimExecute(Sender: TObject);
    procedure aNormativniAktiExecute(Sender: TObject);
    procedure aStattiExecute(Sender: TObject);
    procedure aRozdil_t23_f18Execute(Sender: TObject);
    procedure aTipShtrafuExecute(Sender: TObject);
    procedure aSumiShtrafuExecute(Sender: TObject);
    procedure aLaboratorniDoslidzhennyExecute(Sender: TObject);
    procedure aKudiOskarzhenoExecute(Sender: TObject);
    procedure aOskarzhennyExecute(Sender: TObject);
    procedure aNapravlennyExecute(Sender: TObject);
    procedure aAdminZahodiExecute(Sender: TObject);
    procedure aVidPostanoviExecute(Sender: TObject);
    procedure aNalashtuvannyViduPostanoviExecute(Sender: TObject);
    procedure aVidObmezhenExecute(Sender: TObject);
    procedure aUmoviVidnovlennyExecute(Sender: TObject);
    procedure aOrganizaciiExecute(Sender: TObject);
    procedure aViluchennyZRealizaciiExecute(Sender: TObject);
    procedure aTipProdukciiExecute(Sender: TObject);
    procedure aVirobnikiExecute(Sender: TObject);
    procedure aFinansoviSankciiExecute(Sender: TObject);
    procedure aNalashtuvannyKoristuvachiExecute(Sender: TObject);
    procedure aNalashtuvannyGroupsExecute(Sender: TObject);
    procedure aZvitSchomisychnijExecute(Sender: TObject);
    procedure aNalashtuvanny_ZvyazokZSchomicyachnimExecute(
      Sender: TObject);
    procedure aNalashtuvanny_ZvyazokZRezultatamiOskarzhennyExecute(
      Sender: TObject);
    procedure aZvitT23F18Execute(Sender: TObject);
    procedure aZvitSchokvartalnijExecute(Sender: TObject);
    procedure aNalashtuvannyGlobalUsersExecute(Sender: TObject);
    procedure aNalashtuvanny_FunkciiDostupuExecute(Sender: TObject);
    procedure aNalashtuvanny_ViknaExecute(Sender: TObject);
    procedure aNalashtuvanny_ElementiVikonExecute(Sender: TObject);
    procedure aNalashtuvanny_PravaKoristuvachivExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aRivniSESExecute(Sender: TObject);
    procedure aDataTypesExecute(Sender: TObject);
    procedure aDataTablesExecute(Sender: TObject);
    procedure aReportsExecute(Sender: TObject);
    procedure aRozdiliInicializaciiExecute(Sender: TObject);
  private
    FIBSecurityService: TIBSecurityService;
  public
    Shlyh: string;
    function GetPathToNode(Node: TTreeNode; Separator: Char): string;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    function PosN(Substring, Mainstring: string; n: Integer): Integer;
    property SecurityService : TIBSecurityService read FIBSecurityService write FIBSecurityService;
  end;

const
  clWindow=$FFFFFF;
  clError=$008080FF;
  clCorrect=$0080FF80;

var
  frmMain: TfrmMain;
  INIAZZ: TIniFile;

function GetMyVersion:string;

implementation

uses
  LogOn, OdiniciVimiru, ProProgramu, Shtrafi, Ministry, Teritory, Rajoni,
  VidomchaPidporydkovanist, Objekti, Viddilenny, Posadi, Spivrobitniki,
  VizmatiVinnim, Statti, Rozdil_T23_F18, TipiShtrafiv, SumiShtrafu,
  LaboratorniDoslidzhenny, KudiOskarzheno, Oskargenny, Napravlenny,
  AdminZapobizhZahodi, VidPostanovi, VidObmezhen, UmoviVidnovlenny,
  Organizacii, ViluchennyZRealizacii, TipiProdukcii, Virobniki,
  FinansoviSankcii, VidomostiProOrganizaciju, NalashnuvannySistemi, Zvyzok,
  ZvitShtrafi, GlobalUsers, Groups, Koristuvachi, Vikna, ElementiVikon,
  PravaKoristuvachiv, RivniSES, DataTypes, DataTables, Reports, Initialize;

{$R *.dfm}

function GetMyVersion: string;
type
  TVerInfo=packed record
    Nevazhno: array[0..47] of byte; // не нужные нам первые 48 байт
    Minor,Major,Build,Release: word; // а тут версия
  end;
var
  s:TResourceStream;
  v:TVerInfo;
begin
  result:='';
  try
    s:=TResourceStream.Create(HInstance,'#1',RT_VERSION); // достаем ресурс
    if s.Size>0 then
    begin
      s.Read(v,SizeOf(v)); // читаем нужные нам байты
      result:=Format('%d.%d.%d.%d', [v.Major, v.Minor, v.Release, v.Build]);
    end;
    s.Free;
  except;
  end;
end;


function TfrmMain.GetPathToNode(Node: TTreeNode;Separator: Char): string;
begin
  Result:='';
  if Node=nil then exit;
  while Node<>nil do
  begin
    Result:=Node.Text+Separator+Result;
    Node:=Node.Parent;
  end;
  Delete(Result,length(Result),1);
end;

procedure TfrmMain.ReadInit;
begin
//
end;

procedure TfrmMain.SaveInit;
begin
//
end;

function TfrmMain.PosN(Substring, Mainstring: string; n: Integer): Integer;
begin
   if Pos(substring,mainstring)=0 then
    begin
      posn:=0;
      Exit;
    end
   else
   begin
     if n=1 then posn:=Pos(substring,mainstring)
      else
     begin
       posn:=Pos(substring,mainstring)+posn(substring,Copy(mainstring,(Pos(substring,mainstring)+1),Length(mainstring)),n-1);
     end;
   end;
end;

procedure TfrmMain.AppMessage(var Msg: TMsg; var Handled: Boolean);
var
  i: SmallInt;
begin
  //Mouse wheel behaves strangely with dgbgrids - this proc sorts this out
  if Msg.message=WM_MOUSEWHEEL then
  begin
    Msg.message:=WM_KEYDOWN;
    Msg.lParam:=0;
    i:=HiWord(Msg.wParam);
    if i>0 then Msg.wParam:=VK_UP else Msg.wParam:=VK_DOWN;
    Handled:=False;
  end;
end;

function tfrmMain.IsFormOpen(const FormName : string): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Screen.FormCount - 1 DownTo 0 do
    if (Screen.Forms[i].Name = FormName) then
    begin
      Result := True;
      Break;
    end;
end;

procedure TfrmMain.ShowHint(Sender: TObject);
begin
  //оформление подсказок в строке состояния
//  frmMain.StatusBar.SimpleText:=Application.Hint;
  frmMain.StatusBar.Panels[0].Text:=Application.Hint;
  frmMain.StatusBar.Panels[2].Text:=DateToStr(date);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  ws: integer;
  Path, srvname: string;
  UserName, Password: string;
begin
  ws:=0;
  //начальные параметры окна
  try
    Application.OnMessage:=frmMain.AppMessage;
    Application.OnHint:=ShowHint;

    frmMain.Caption:='Адміністративно-запобіжні заходи';
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
    frmMain.Width:=INIAZZ.ReadInteger('Main','Width',Width);
    frmMain.Height:=INIAZZ.ReadInteger('Main','Height',Height);
    frmMain.Left:=INIAZZ.ReadInteger('Main','Left',Left);
    frmMain.Top:=INIAZZ.ReadInteger('Main','Top',Top);
    ws:=INIAZZ.ReadInteger('Main','WindowState',ws);
    case ws of
      0: frmMain.WindowState:=wsNormal;
      1: frmMain.WindowState:=wsNormal;
      2: frmMain.WindowState:=wsMaximized;
    end;
    Path:=INIAZZ.ReadString('DataBase','AliasName',Path);
    srvname:=INIAZZ.ReadString('DataBase','ServerName',srvname);

    if frmMain.dbAzz.Connected then frmMain.dbAzz.Connected:=false;
    if frmMain.trAzz.Active then frmMain.trAzz.Active:=false;
    frmMain.dbAzz.DatabaseName:=srvname+':'+path;
    trAzz.Params.Clear;
    trAzz.Params.Add('read_committed');
    trAzz.Params.Add('rec_version');
    trAzz.Params.Add('nowait');
    UserName:=INIAZZ.ReadString('DataBase','UserName',UserName);
    Password:=INIAZZ.ReadString('DataBase','Password',Password);
    dbAzz.Params.Clear;
    dbAzz.Params.Add('user_name='+UserName);
    dbAzz.Params.Add('password='+Password);
    INIAZZ.Free;
  finally
    if not frmMain.IsFormOpen('frmLogOn') then frmLogOn:=TfrmLogOn.Create(Self);
    frmLogOn.Show;
    frmLogOn.FormStyle:=fsStayOnTop;
    frmLogOn.BorderStyle:=bsDialog;
    frmLogOn.Caption:='Підключення до ДБ';
    frmLogOn.Position:=poMainFormCenter;
    frmLogOn.edtServer.Text:=frmMain.dbAzz.DatabaseName;
    frmLogOn.edtUser_Name.Text:='';
    frmLogOn.edtPassword.Text:='';
    frmMain.Enabled:=false;
    frmLogOn.edtUser_Name.SetFocus;
  end;
  frmMain.cbMain.AutoSize:=true;
//  ShowMessage('доделать проверку пользователя и пароля');

  if frmMain.IsFormOpen('frmFinansoviSankcii') then
  begin
    with frmMain do
    begin
      N13.Visible:=true;
      mnZahodiFinansovi_SankciiNeVrucheni.Visible:=true;
      mnZahodiFinansovi_SankciiNeSplacheni.Visible:=true;
      mnZahodiFinansovi_SankciiOskarzheni.Visible:=true;
      mnZahodiFinansovi_SankciiObjekt.Visible:=true;
      mnZahodiFinansovi_SankciiObjektNazvaObjektu.Visible:=true;
      mnZahodiFinansovi_SankciiObjektAdresaObjektu.Visible:=true;
      mnZahodiFinansovi_SankciiSES.Visible:=true;
      mnZahodiFinansovi_SankciiSESPIBPredstavnika.Visible:=true;
      mnZahodiFinansovi_SankciiSESPosadaPredstavnika.Visible:=true;
      mnZahodiFinansovi_SankciiTipProdukcii.Visible:=true;
      mnZahodiFinansovi_SankciiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      N13.Visible:=true;
      mnZahodiFinansovi_SankciiNeVrucheni.Visible:=false;
      mnZahodiFinansovi_SankciiNeSplacheni.Visible:=false;
      mnZahodiFinansovi_SankciiOskarzheni.Visible:=false;
      mnZahodiFinansovi_SankciiObjekt.Visible:=false;
      mnZahodiFinansovi_SankciiObjektNazvaObjektu.Visible:=false;
      mnZahodiFinansovi_SankciiObjektAdresaObjektu.Visible:=false;
      mnZahodiFinansovi_SankciiSES.Visible:=false;
      mnZahodiFinansovi_SankciiSESPIBPredstavnika.Visible:=false;
      mnZahodiFinansovi_SankciiSESPosadaPredstavnika.Visible:=false;
      mnZahodiFinansovi_SankciiTipProdukcii.Visible:=false;
      mnZahodiFinansovi_SankciiRozdilT23F18.Visible:=false;
    end;
  end;

  if frmMain.IsFormOpen('frmViluchennyZRealizacii') then
  begin
    with frmMain do
    begin
      mnVibir_Viluchenny_Choices.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiNeVrucheni.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiOskarzheni.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiNazvaObjektu.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiAdresaObjektu.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiTipPostanovi.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciiTipProdukcii.Visible:=true;
      mnZahodiViluchenny_Z_RealizaciilRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnVibir_Viluchenny_Choices.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiNeVrucheni.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiOskarzheni.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiNazvaObjektu.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiAdresaObjektu.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiTipPostanovi.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiPIBOsobiSES.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiPosadaOsobiSES.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciiTipProdukcii.Visible:=false;
      mnZahodiViluchenny_Z_RealizaciilRozdilT23F18.Visible:=false;
    end;
  end;

  if frmMain.IsFormOpen('frmAdminZapobizhZahodi') then
  begin
    with frmMain do
    begin
      mnAdminChoices.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=true;
      mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnAdminChoices.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeVrucheni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeZnytiZKontrolu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiOskarzheni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNePovidomleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiPovidomleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiOpechatani.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNeVidnovleni.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiObmezhennyAsortimentu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiNazvaObjektu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiAdresaObjektu.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiPIBPredstavnikaSES.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiTipPostanovi.Visible:=false;
      mnZahodiAdmin_Zapobizh_ZahodiRozdilT23F18.Visible:=false;
    end;
  end;

  if frmMain.IsFormOpen('frmShtrafi') then
  begin
    with frmMain do
    begin
      mnShtrafiChoices.Visible:=true;
      mnZahodiShtrafiNeSplacheni.Visible:=true;
      mnZahodiShtrafiNeVrucheni.Visible:=true;
      mnZahodiShtrafiPeredaniDoVDVS.Visible:=true;
      mnZahodiShtrafiPeredaniDoVDVSPeredani.Visible:=true;
      mnZahodiShtrafiPeredaniDoVDVSSplacheni.Visible:=true;
      mnZahodiShtrafiNePeredaniDoVDVS.Visible:=true;
      mnZahodiShtrafiPrimusovoStygneni.Visible:=true;
      mnZahodiShtrafiSkasovani.Visible:=true;
      mnZahodiShtrafiSpivrobitnik.Visible:=true;
      mnZahodiShtrafiTipShtrafu.Visible:=true;
      mnZahodiShtrafiObjekt.Visible:=true;
      mnZahodiShtrafiObjektAdresa.Visible:=true;
      mnZahodiShtrafiObjektNazva.Visible:=true;
      mnZahodiShtrafiRozdilT23F18.Visible:=true;
    end;
  end
  else
  begin
    with frmMain do
    begin
      mnShtrafiChoices.Visible:=false;
      mnZahodiShtrafiNeSplacheni.Visible:=false;
      mnZahodiShtrafiNeVrucheni.Visible:=false;
      mnZahodiShtrafiPeredaniDoVDVS.Visible:=false;
      mnZahodiShtrafiPeredaniDoVDVSPeredani.Visible:=false;
      mnZahodiShtrafiPeredaniDoVDVSSplacheni.Visible:=false;
      mnZahodiShtrafiNePeredaniDoVDVS.Visible:=false;
      mnZahodiShtrafiPrimusovoStygneni.Visible:=false;
      mnZahodiShtrafiSkasovani.Visible:=false;
      mnZahodiShtrafiSpivrobitnik.Visible:=false;
      mnZahodiShtrafiTipShtrafu.Visible:=false;
      mnZahodiShtrafiObjekt.Visible:=false;
      mnZahodiShtrafiObjektAdresa.Visible:=false;
      mnZahodiShtrafiObjektNazva.Visible:=false;
      mnZahodiShtrafiRozdilT23F18.Visible:=false;
    end;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ws: integer;
begin
  ws:=0;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  with frmMain do
  begin
    INIAZZ.WriteInteger('Main','Width',frmMain.Width);
    INIAZZ.WriteInteger('Main','Height',frmMain.Height);
    INIAZZ.WriteInteger('Main','Left',frmMain.Left);
    INIAZZ.WriteInteger('Main','Top',frmMain.Top);
  end;
  case frmMain.WindowState of
    wsNormal: ws:=0;
    wsMinimized: ws:=0;
    wsMaximized: ws:=2;
  end;
  INIAZZ.WriteInteger('Main','WindowState',ws);
  INIAZZ.Free;
  SaveInit;
  frmMain.trAzz.Active:=False;
  frmMain.dbAzz.Connected:=false;
  Action:=caFree;
end;

procedure TfrmMain.mnDovidnikiOdiniciVimiruClick(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOdiniciVimiru') then frmOdiniciVimiru:=TfrmOdiniciVimiru.Create(self);
  frmOdiniciVimiru.Show;
  frmOdiniciVimiru.Caption:='Одиниці виміру';
  frmOdiniciVimiru.FormStyle:=fsMDIChild;
  frmOdiniciVimiru.aSortByPovnaNazvaExecute(sender);
  frmOdiniciVimiru.aUpdateExecute(sender);
  frmOdiniciVimiru.aChoice.Enabled:=false;
  frmOdiniciVimiru.DBGrid1.Align:=alClient;
end;

procedure TfrmMain.aProProgramuExecute(Sender: TObject);
begin
  if not IsFormOpen('frmProProgramu') then
  begin
    try
      frmProProgramu:=TfrmProProgramu.Create(self);
    except
      exit;
    end;
  end
  else
  begin
    frmProProgramu.Free;
    frmProProgramu:=TfrmProProgramu.Create(self);
  end;
  frmMain.Enabled:=false;
  frmProProgramu.Show;
  frmProProgramu.Caption:='Про програму';
  frmProProgramu.Position:=poMainFormCenter;
  frmProProgramu.BorderStyle:=bsDialog;
end;

procedure TfrmMain.aShtrafiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmShtrafi') then frmShtrafi:=TfrmShtrafi.Create(self);
  frmShtrafi.FormStyle:=fsMDIChild;
  frmShtrafi.Caption:='Журнал постанов про накладення штрафу';
  frmShtrafi.DBGrid1.Align:=alClient;
  frmShtrafi.Show;

  frmShtrafi.aTeritoryUpdateExecute(Sender);
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  frmShtrafi.udRik.Position:=INIAZZ.ReadInteger('System','Year',frmShtrafi.udRik.Position);
  INIAZZ.Free;

  with frmShtrafi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from POSTANOVASHTRAF,RAJONI where RAJONI.RAJON=:Rajon and POSTANOVASHTRAF.RAJON=RAJONI.KOD and POSTANOVASHTRAF.YEAR_=:Rik and (DATAVRUCHENNYPOSTANOVI is null) order by POSTANOVASHTRAF.NOMERPOSTANOVI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Rajon';
    qTeritory.Params[0].Value:=cbRajon.Text;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Rik';
    qTeritory.Params[1].Value:=edtRik.Text;
    qTeritory.Open;
    if qTeritory.RecordCount>0 then
      if MessageDlg('В базі є не вручені постанови!!!'+#13+'Відобразити не вручені постанови?',mtWarning,[mbYes,mbNo],0)=mrYes then aNeVrucheniExecute(sender) else aUpdateExecute(sender)
    else
      aUpdateExecute(sender);
  end;
  frmShtrafi.qShtrafi.Last;
end;

procedure TfrmMain.aNalashtuvannySistemyExecute(Sender: TObject);
var
  UpdateUserWrites: integer;
  PrintToWord: integer;
begin
  frmMain.Enabled:=false;
  if not IsFormOpen('frmNalashnuvannySistemi') then frmNalashnuvannySistemi:=TfrmNalashnuvannySistemi.Create(self);
  frmNalashnuvannySistemi.Show;
  frmNalashnuvannySistemi.Caption:='Налаштування системи';
  frmNalashnuvannySistemi.Position:=poMainFormCenter;
  frmNalashnuvannySistemi.BorderStyle:=bsDialog;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  with frmNalashnuvannySistemi do
  begin
    edtUserName.Text:=INIAZZ.ReadString('DataBase','UserName',edtUserName.Text);
    edtPassword.Text:=INIAZZ.ReadString('DataBase','Password',edtPassword.Text);
    edtServerName.Text:=INIAZZ.ReadString('DataBase','ServerName',edtServerName.Text);
    edtAliasName.Text:=INIAZZ.ReadString('DataBase','AliasName',edtAliasName.Text);
    edtTemporary.Text:=INIAZZ.ReadString('System','Temp',edtTemporary.Text);
    udRik.Position:=INIAZZ.ReadInteger('System','Year',udRik.Position);
    edtGroshovaOdinicy.Text:=INIAZZ.ReadString('System','Money',edtGroshovaOdinicy.Text);
    UpdateUserWrites:=0;
    UpdateUserWrites:=INIAZZ.ReadInteger('System','UpdateUserWrites',UpdateUserWrites);
    case UpdateUserWrites of
      0: cbxUpdateUserWrites.Checked:=false;
      1: cbxUpdateUserWrites.Checked:=true;
    else
      cbxUpdateUserWrites.Checked:=false;
    end;
    edtTemplatePath.Text:='';
    edtTemplatePath.Text:=INIAZZ.ReadString('System','TemplatePath',edtTemplatePath.Text);
    PrintToWord:=1;
    PrintToWord:=INIAZZ.ReadInteger('System','PrintToWord',PrintToWord);
    case PrintToWord of
      0: rgPrintToWord.ItemIndex:=0;
      1: rgPrintToWord.ItemIndex:=1;
    else
      rgPrintToWord.ItemIndex:=-1;
    end;
{
    case PrintToWord of
      0: cbxPrintToWord.Checked:=false;
      1: cbxPrintToWord.Checked:=true;
    else
      cbxPrintToWord.Checked:=false;
    end;
}
  end;
  INIAZZ.Free;
end;

procedure TfrmMain.aVihodExecute(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.aOrganizaciyaExecute(Sender: TObject);
var
  posit: integer;
begin
  posit:=0;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  if not IsFormOpen('frmVidomostiProOrganizaciju') then frmVidomostiProOrganizaciju:=TfrmVidomostiProOrganizaciju.Create(self);
  frmMain.Enabled:=false;
  with frmVidomostiProOrganizaciju do
  begin
    Show;
    Caption:='Відомості про організацію';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;

    aSESLevel_UpdateExecute(sender);
    cbSESLevel.Text:='-1';
    cbSESLevel.Text:=INIAZZ.ReadString('Teritory','Level',cbSESLevel.Text);
    if qTeritory.Locate('KOD',StrToInt(cbSESLevel.Text),[]) then cbSESLevel.Text:=qTeritory.FieldByName('RIVEN').Value else cbSESLevel.Text:='';
    cbSESLevel.Enabled:=true;
    btnSESLevel_Update.Enabled:=true;
    btnSESLevel_Choice.Enabled:=true;
    aMinistryUpdateExecute(sender);
    cbMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',cbMinistry.Text);
    if qTeritory.Locate('KOD',StrToInt(cbMinistry.Text),[]) then cbMinistry.Text:=qTeritory.FieldByName('MINISTRY').Value else cbMinistry.Text:='';

    aTeritoryUpdateExecute(sender);
    cbTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',cbTeritory.Text);
    if qTeritory.Locate('KOD',StrToInt(cbTeritory.Text),[]) then cbTeritory.Text:=qTeritory.FieldByName('TERITORY').Value else cbTeritory.Text:='';

    aDistrictUpdateExecute(sender);
    cbRajon.Text:=INIAZZ.ReadString('Teritory','District',cbRajon.Text);
    if qTeritory.Locate('KOD',StrToInt(cbRajon.Text),[]) then cbRajon.Text:=qTeritory.FieldByName('RAJON').Value else cbRajon.Text:='';

    pcVidomostiProOrganizaciju.ActivePage:=tsDirector;
    posit:=INIAZZ.ReadInteger('System','Position',posit);
    case posit of
      0:
        begin
          pcPadezh.ActivePage:=tsNazivnij;
          edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director','LNP_NV',edtPIBKerivnika_NV.Text);
          edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director','Position_NV',edtPosadaKerivnika_NV.Text);
          edtPidpis1_NV.Text:=INIAZZ.ReadString('Director','Signature1_NV',edtPidpis1_NV.Text);
          edtPidpis2_NV.Text:=INIAZZ.ReadString('Director','Signature2_NV',edtPidpis2_NV.Text);
          pcPadezh.ActivePage:=tsRodovij;
          edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director','LNP_RV',edtPIBKerivnika_RV.Text);
          edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director','Position_RV',edtPosadaKerivnika_RV.Text);
          edtPidpis1_RV.Text:=INIAZZ.ReadString('Director','Signature1_RV',edtPidpis1_RV.Text);
          edtPidpis2_RV.Text:=INIAZZ.ReadString('Director','Signature2_RV',edtPidpis2_RV.Text);
          pcPadezh.ActivePage:=tsDavalnij;
          edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director','LNP_DV',edtPIBKerivnika_DV.Text);
          edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director','Position_DV',edtPosadaKerivnika_DV.Text);
          edtPidpis1_DV.Text:=INIAZZ.ReadString('Director','Signature1_DV',edtPidpis1_DV.Text);
          edtPidpis2_DV.Text:=INIAZZ.ReadString('Director','Signature2_DV',edtPidpis2_DV.Text);
          pcPadezh.ActivePage:=tsZnahidnij;
          edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director','LNP_ZV',edtPIBKerivnika_ZV.Text);
          edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director','Position_ZV',edtPosadaKerivnika_ZV.Text);
          edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director','Signature1_ZV',edtPidpis1_ZV.Text);
          edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director','Signature2_ZV',edtPidpis2_ZV.Text);
          pcPadezh.ActivePage:=tsOrudnij;
          edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director','LNP_OV',edtPIBKerivnika_OV.Text);
          edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director','Position_OV',edtPosadaKerivnika_OV.Text);
          edtPidpis1_OV.Text:=INIAZZ.ReadString('Director','Signature1_OV',edtPidpis1_OV.Text);
          edtPidpis2_OV.Text:=INIAZZ.ReadString('Director','Signature2_OV',edtPidpis2_OV.Text);
          pcPadezh.ActivePage:=tsMiscevij;
          edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director','LNP_MV',edtPIBKerivnika_MV.Text);
          edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director','Position_MV',edtPosadaKerivnika_MV.Text);
          edtPidpis1_MV.Text:=INIAZZ.ReadString('Director','Signature1_MV',edtPidpis1_MV.Text);
          edtPidpis2_MV.Text:=INIAZZ.ReadString('Director','Signature2_MV',edtPidpis2_MV.Text);
          edtKodKerivnika.Text:=INIAZZ.ReadString('Director','Kod',edtKodKerivnika.Text);
        end;
      1:
        begin
          pcPadezh.ActivePage:=tsNazivnij;
          edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director1','LNP_NV',edtPIBKerivnika_NV.Text);
          edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director1','Position_NV',edtPosadaKerivnika_NV.Text);
          edtPidpis1_NV.Text:=INIAZZ.ReadString('Director1','Signature1_NV',edtPidpis1_NV.Text);
          edtPidpis2_NV.Text:=INIAZZ.ReadString('Director1','Signature2_NV',edtPidpis2_NV.Text);
          pcPadezh.ActivePage:=tsRodovij;
          edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director1','LNP_RV',edtPIBKerivnika_RV.Text);
          edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director1','Position_RV',edtPosadaKerivnika_RV.Text);
          edtPidpis1_RV.Text:=INIAZZ.ReadString('Director1','Signature1_RV',edtPidpis1_RV.Text);
          edtPidpis2_RV.Text:=INIAZZ.ReadString('Director1','Signature2_RV',edtPidpis2_RV.Text);
          pcPadezh.ActivePage:=tsDavalnij;
          edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director1','LNP_DV',edtPIBKerivnika_DV.Text);
          edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director1','Position_DV',edtPosadaKerivnika_DV.Text);
          edtPidpis1_DV.Text:=INIAZZ.ReadString('Director1','Signature1_DV',edtPidpis1_DV.Text);
          edtPidpis2_DV.Text:=INIAZZ.ReadString('Director1','Signature2_DV',edtPidpis2_DV.Text);
          pcPadezh.ActivePage:=tsZnahidnij;
          edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','LNP_ZV',edtPIBKerivnika_ZV.Text);
          edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director1','Position_ZV',edtPosadaKerivnika_ZV.Text);
          edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director1','Signature1_ZV',edtPidpis1_ZV.Text);
          edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director1','Signature2_ZV',edtPidpis2_ZV.Text);
          pcPadezh.ActivePage:=tsOrudnij;
          edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director1','LNP_OV',edtPIBKerivnika_OV.Text);
          edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director1','Position_OV',edtPosadaKerivnika_OV.Text);
          edtPidpis1_OV.Text:=INIAZZ.ReadString('Director1','Signature1_OV',edtPidpis1_OV.Text);
          edtPidpis2_OV.Text:=INIAZZ.ReadString('Director1','Signature2_OV',edtPidpis2_OV.Text);
          pcPadezh.ActivePage:=tsMiscevij;
          edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director1','LNP_MV',edtPIBKerivnika_MV.Text);
          edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director1','Position_MV',edtPosadaKerivnika_MV.Text);
          edtPidpis1_MV.Text:=INIAZZ.ReadString('Director1','Signature1_MV',edtPidpis1_MV.Text);
          edtPidpis2_MV.Text:=INIAZZ.ReadString('Director1','Signature2_MV',edtPidpis2_MV.Text);
          edtKodKerivnika.Text:=INIAZZ.ReadString('Director1','Kod',edtKodKerivnika.Text);
        end;
      2:
        begin
          pcPadezh.ActivePage:=tsNazivnij;
          edtPIBKerivnika_NV.Text:=INIAZZ.ReadString('Director2','LNP_NV',edtPIBKerivnika_NV.Text);
          edtPosadaKerivnika_NV.Text:=INIAZZ.ReadString('Director2','Position_NV',edtPosadaKerivnika_NV.Text);
          edtPidpis1_NV.Text:=INIAZZ.ReadString('Director2','Signature1_NV',edtPidpis1_NV.Text);
          edtPidpis2_NV.Text:=INIAZZ.ReadString('Director2','Signature2_NV',edtPidpis2_NV.Text);
          pcPadezh.ActivePage:=tsRodovij;
          edtPIBKerivnika_RV.Text:=INIAZZ.ReadString('Director2','LNP_RV',edtPIBKerivnika_RV.Text);
          edtPosadaKerivnika_RV.Text:=INIAZZ.ReadString('Director2','Position_RV',edtPosadaKerivnika_RV.Text);
          edtPidpis1_RV.Text:=INIAZZ.ReadString('Director2','Signature1_RV',edtPidpis1_RV.Text);
          edtPidpis2_RV.Text:=INIAZZ.ReadString('Director2','Signature2_RV',edtPidpis2_RV.Text);
          pcPadezh.ActivePage:=tsDavalnij;
          edtPIBKerivnika_DV.Text:=INIAZZ.ReadString('Director2','LNP_DV',edtPIBKerivnika_DV.Text);
          edtPosadaKerivnika_DV.Text:=INIAZZ.ReadString('Director2','Position_DV',edtPosadaKerivnika_DV.Text);
          edtPidpis1_DV.Text:=INIAZZ.ReadString('Director2','Signature1_DV',edtPidpis1_DV.Text);
          edtPidpis2_DV.Text:=INIAZZ.ReadString('Director2','Signature2_DV',edtPidpis2_DV.Text);
          pcPadezh.ActivePage:=tsZnahidnij;
          edtPIBKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','LNP_ZV',edtPIBKerivnika_ZV.Text);
          edtPosadaKerivnika_ZV.Text:=INIAZZ.ReadString('Director2','Position_ZV',edtPosadaKerivnika_ZV.Text);
          edtPidpis1_ZV.Text:=INIAZZ.ReadString('Director2','Signature1_ZV',edtPidpis1_ZV.Text);
          edtPidpis2_ZV.Text:=INIAZZ.ReadString('Director2','Signature2_ZV',edtPidpis2_ZV.Text);
          pcPadezh.ActivePage:=tsOrudnij;
          edtPIBKerivnika_OV.Text:=INIAZZ.ReadString('Director2','LNP_OV',edtPIBKerivnika_OV.Text);
          edtPosadaKerivnika_OV.Text:=INIAZZ.ReadString('Director2','Position_OV',edtPosadaKerivnika_OV.Text);
          edtPidpis1_OV.Text:=INIAZZ.ReadString('Director2','Signature1_OV',edtPidpis1_OV.Text);
          edtPidpis2_OV.Text:=INIAZZ.ReadString('Director2','Signature2_OV',edtPidpis2_OV.Text);
          pcPadezh.ActivePage:=tsMiscevij;
          edtPIBKerivnika_MV.Text:=INIAZZ.ReadString('Director2','LNP_MV',edtPIBKerivnika_MV.Text);
          edtPosadaKerivnika_MV.Text:=INIAZZ.ReadString('Director2','Position_MV',edtPosadaKerivnika_MV.Text);
          edtPidpis1_MV.Text:=INIAZZ.ReadString('Director2','Signature1_MV',edtPidpis1_MV.Text);
          edtPidpis2_MV.Text:=INIAZZ.ReadString('Director2','Signature2_MV',edtPidpis2_MV.Text);
          edtKodKerivnika.Text:=INIAZZ.ReadString('Director2','Kod',edtKodKerivnika.Text);
        end;
    end;
    rgKerivnik.ItemIndex:=posit;
//    INIAZZ.Free;

    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    pcVidomostiProOrganizaciju.ActivePage:=tsFirm;
    edtAdresa.Text:=INIAZZ.ReadString('Firm','Adres',edtAdresa.Text);
    edtPhone.Text:=INIAZZ.ReadString('Firm','Phone',edtPhone.Text);
    edtFax.Text:=INIAZZ.ReadString('Firm','Fax',edtFax.Text);
    edtE_Mail.Text:=INIAZZ.ReadString('Firm','E-Mail',edtE_Mail.Text);
    edtWWW.Text:=INIAZZ.ReadString('Firm','WWW',edtWWW.Text);
    edtFullName.Text:=INIAZZ.ReadString('Firm','FullName',edtFullName.Text);
    edtName.Text:=INIAZZ.ReadString('Firm','Name',edtName.Text);
    edtName_RV.Text:=INIAZZ.ReadString('Firm','Name_RV',edtName_RV.Text);

    pcVidomostiProOrganizaciju.ActivePage:=tsBank;
    edtRozrahunkovijRahunok.Text:=INIAZZ.ReadString('Bank','RR',edtRozrahunkovijRahunok.Text);
    edtKod.Text:=INIAZZ.ReadString('Bank','Kod',edtKod.Text);
    edtBank.Text:=INIAZZ.ReadString('Bank','Bank',edtBank.Text);
    edtMFO.Text:=INIAZZ.ReadString('Bank','MFO',edtMFO.Text);
    edtOKPO.Text:=INIAZZ.ReadString('Bank','OKPO',edtOKPO.Text);
    edtOderzhuvach.Text:=INIAZZ.ReadString('Bank','Orderzhuvach',edtOderzhuvach.Text);

    pcVidomostiProOrganizaciju.ActivePage:=tsDirector;
    pcPadezh.ActivePage:=tsNazivnij;
  end;
  INIAZZ.Free;
end;

procedure TfrmMain.aMinistryExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmMinistry') then frmMinistry:=TfrmMinistry.Create(self);
  frmMinistry.Show;
  frmMinistry.FormStyle:=fsMDIChild;
  frmMinistry.Caption:='Міністерства';
  frmMinistry.DBGrid1.Align:=alClient;
  frmMinistry.aChoice.Enabled:=false;
  frmMinistry.aUpdateExecute(sender);
  frmMinistry.qMinistry.Last;
  frmMinistry.qMinistry.First;
end;

procedure TfrmMain.aTeritoryExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTeritory') then frmTeritory:=TfrmTeritory.Create(self);
  frmTeritory.Show;
  frmTeritory.FormStyle:=fsMDIChild;
  frmTeritory.Caption:='Довідник територій';
  frmTeritory.aChoice.Enabled:=false;
  frmTeritory.DBGrid1.Align:=alClient;
  frmTeritory.aUpdateExecute(sender);
  frmTeritory.qTeritory.Last;
  frmTeritory.qTeritory.First;
end;

procedure TfrmMain.aDistrictExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRajoni') then frmRajoni:=TfrmRajoni.Create(self);
  frmRajoni.Show;
  frmRajoni.FormStyle:=fsMDIChild;
  frmRajoni.Caption:='Довідник районів';
  frmRajoni.DBGrid1.Align:=alClient;
  frmRajoni.aChoice.Enabled:=false;
  frmRajoni.aTeritoryUpdateExecute(sender);
  frmRajoni.aUpdateExecute(sender);
  frmRajoni.qDistrict.Last;
  frmRajoni.qDistrict.First;
end;

procedure TfrmMain.aVidomchaPidporydkovanistExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidomchaPidporydkovanist') then frmVidomchaPidporydkovanist:=TfrmVidomchaPidporydkovanist.Create(self);
  frmVidomchaPidporydkovanist.Show;
  frmVidomchaPidporydkovanist.Caption:='Відомча підпорядкованість';

  frmVidomchaPidporydkovanist.DBGrid1.Align:=alClient;
  frmVidomchaPidporydkovanist.FormStyle:=fsMDIChild;
  frmVidomchaPidporydkovanist.aUpdateExecute(sender);
{
  frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.Last;
  frmVidomchaPidporydkovanist.qVidomchaPidporydkovanist.First;
}
  frmVidomchaPidporydkovanist.aChoice.Enabled:=false;
  frmVidomchaPidporydkovanist.edtFind.Text:='';
end;

procedure TfrmMain.aObjektiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmObjekti') then frmObjekti:=TfrmObjekti.Create(self);
  frmObjekti.Show;
  frmObjekti.Caption:='Довідник об''єктів';
  frmObjekti.FormStyle:=fsMDIChild;
  frmObjekti.DBGrid1.Align:=alClient;
  frmObjekti.aTeritoryUpdateExecute(sender);
  frmObjekti.aUpdateExecute(sender);
  frmObjekti.aChoice.Enabled:=false;
  frmObjekti.edtFind_NazvaObjekta.Text:='';
  frmObjekti.edtFind_NazvaObjekta.Enabled:=true;
{
  frmObjekti.qObjekti.Last;
  frmObjekti.qObjekti.First;
}
end;

procedure TfrmMain.aViddilennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmViddilenny') then frmViddilenny:=TfrmViddilenny.Create(self);
  frmViddilenny.Show;
  frmViddilenny.FormStyle:=fsMDIChild;
  frmViddilenny.Caption:='Довідник відділень';
  frmViddilenny.DBGrid1.Align:=alClient;
  frmViddilenny.aChoice.Enabled:=false;
//  frmViddilenny.aTeritoryUpdateExecute(sender);
  frmViddilenny.aUpdateExecute(sender);
  frmViddilenny.qViddilenny.Last;
  frmViddilenny.qViddilenny.First;
end;

procedure TfrmMain.aPosadiExecute(Sender: TObject);
begin
  if not IsFormOpen('frmPosadi') then frmPosadi:=TfrmPosadi.Create(self);
  frmPosadi.Show;
  frmPosadi.Caption:='Довідник посад';
  frmPosadi.FormStyle:=fsMDIChild;
  frmPosadi.DBGrid1.Align:=alClient;
  frmPosadi.aChoice.Enabled:=false;
  frmPosadi.aUpdateExecute(sender);
end;

procedure TfrmMain.aSpivrobitnikiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmSpivrobitniki') then frmSpivrobitniki:=TfrmSpivrobitniki.Create(self);
  frmSpivrobitniki.Show;
  frmSpivrobitniki.Caption:='Довідник співробітників';
  frmSpivrobitniki.FormStyle:=fsMDIChild;
  frmSpivrobitniki.DBGrid1.Align:=alClient;
  frmSpivrobitniki.aChoice.Enabled:=false;
  frmSpivrobitniki.aTeritoryUpdateExecute(sender);
  frmSpivrobitniki.qSpivrobitniki.Last;
  frmSpivrobitniki.qSpivrobitniki.First;
end;

procedure TfrmMain.aViznatiVinnimExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVizmatiVinnim') then frmVizmatiVinnim:=TfrmVizmatiVinnim.Create(self);
  frmVizmatiVinnim.Show;
  frmVizmatiVinnim.Caption:='Довідник обвинувачень';
  frmVizmatiVinnim.FormStyle:=fsMDIChild;
  frmVizmatiVinnim.DBGrid1.Align:=alClient;
  frmVizmatiVinnim.aChoice.Enabled:=false;
  frmVizmatiVinnim.edtFind.Text:='';
  frmVizmatiVinnim.aUpdateExecute(sender);
end;

procedure TfrmMain.aNormativniAktiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmStatti') then frmStatti:=TfrmStatti.Create(self);
  with frmStatti do
  begin
    Show;
    Caption:='Довідник нормативних актів';
    FormStyle:=fsMDIChild;
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmMain.aStattiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmStatti') then frmStatti:=TfrmStatti.Create(self);
  with frmStatti do
  begin
    Show;
    Caption:='Довідник статей законодавства';
    FormStyle:=fsMDIChild;
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmMain.aRozdil_t23_f18Execute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRozdil_T23_F18') then frmRozdil_T23_F18:=TfrmRozdil_T23_F18.Create(self);
  frmRozdil_T23_F18.Show;
  frmRozdil_T23_F18.Caption:='Довідник розділів т.23 ф.18';
  frmRozdil_T23_F18.FormStyle:=fsMDIChild;
  frmRozdil_T23_F18.DBGrid1.Align:=alClient;
  frmRozdil_T23_F18.aChoice.Enabled:=false;
  frmRozdil_T23_F18.aUpdateExecute(sender);
end;

procedure TfrmMain.aTipShtrafuExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTipiShtrafiv') then frmTipiShtrafiv:=TfrmTipiShtrafiv.Create(self);
  frmTipiShtrafiv.Show;
  frmTipiShtrafiv.Caption:='Типи штрафів';
  frmTipiShtrafiv.FormStyle:=fsMDIChild;
  frmTipiShtrafiv.DBGrid1.Align:=alClient;
  frmTipiShtrafiv.aChoice.Enabled:=false;
  frmTipiShtrafiv.aUpdateExecute(sender);
  frmTipiShtrafiv.edtFind.Text:='';
end;

procedure TfrmMain.aSumiShtrafuExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmSumiShtrafu') then frmSumiShtrafu:=TfrmSumiShtrafu.Create(self);
  frmSumiShtrafu.Show;
  frmSumiShtrafu.Caption:='Суми штрафів';
  frmSumiShtrafu.FormStyle:=fsMDIChild;
  frmSumiShtrafu.DBGrid1.Align:=alClient;
  frmSumiShtrafu.aChoice.Enabled:=false;
  frmSumiShtrafu.aUpdateExecute(sender);
end;

procedure TfrmMain.aLaboratorniDoslidzhennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratorniDoslidzhenny') then frmLaboratorniDoslidzhenny:=TfrmLaboratorniDoslidzhenny.Create(self);
  frmLaboratorniDoslidzhenny.Show;
  frmLaboratorniDoslidzhenny.Caption:='Типи лабораторних досліджень';
  frmLaboratorniDoslidzhenny.FormStyle:=fsMDIChild;
  frmLaboratorniDoslidzhenny.DBGrid1.Align:=alClient;
  frmLaboratorniDoslidzhenny.aChoice.Enabled:=false;
  frmLaboratorniDoslidzhenny.edtFind.Text:='';
  frmLaboratorniDoslidzhenny.aUpdateExecute(sender);
end;

procedure TfrmMain.aKudiOskarzhenoExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmKudiOskarzheno') then frmKudiOskarzheno:=TfrmKudiOskarzheno.Create(self);
  frmKudiOskarzheno.Show;
  frmKudiOskarzheno.Caption:='Довідник організацій, що стоять вище';
  frmKudiOskarzheno.FormStyle:=fsMDIChild;
  frmKudiOskarzheno.DBGrid1.Align:=alClient;
  frmKudiOskarzheno.aChoice.Enabled:=false;
  frmKudiOskarzheno.aUpdateExecute(sender);
end;

procedure TfrmMain.aOskarzhennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOskargenny') then frmOskargenny:=TfrmOskargenny.Create(self);
  frmOskargenny.Show;
  frmOskargenny.Caption:='Оскарження';
  frmOskargenny.FormStyle:=fsMDIChild;
  frmOskargenny.DBGrid1.Align:=alClient;
  frmOskargenny.aChoice.Enabled:=false;
  frmOskargenny.aUpdateExecute(sender);
end;

procedure TfrmMain.aNapravlennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmNapravlenny') then frmNapravlenny:=TfrmNapravlenny.Create(self);
  frmNapravlenny.Caption:='Перелік направлень';
  frmNapravlenny.FormStyle:=fsMDIChild;
  frmNapravlenny.DBGrid1.Align:=alClient;
  frmNapravlenny.aChoice.Enabled:=false;
  frmNapravlenny.Show;
  frmNapravlenny.aUpdateExecute(sender);
end;

procedure TfrmMain.aAdminZahodiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmAdminZapobizhZahodi') then frmAdminZapobizhZahodi:=TfrmAdminZapobizhZahodi.Create(self);
  frmAdminZapobizhZahodi.Show;
  frmAdminZapobizhZahodi.FormStyle:=fsMDIChild;
  frmAdminZapobizhZahodi.Caption:='Адміністративно-запобіжні заходи';
  frmAdminZapobizhZahodi.Constraints.MinHeight:=300;
  frmAdminZapobizhZahodi.Constraints.MinWidth:=640;
  frmAdminZapobizhZahodi.Enabled:=true;
  frmAdminZapobizhZahodi.DBGrid1.Align:=alClient;
  frmAdminZapobizhZahodi.aTeritoryUpdateExecute(sender);
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmAdminZapobizhZahodi.udYear.Position:=INIAZZ.ReadInteger('System','Year',frmAdminZapobizhZahodi.udYear.Position);
  INIAZZ.Free;

  with frmAdminZapobizhZahodi do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from POSTANOVA_ADMIN,RAJONI where RAJONI.RAJON=:District and POSTANOVA_ADMIN.DISTRICT=RAJONI.KOD and POSTANOVA_ADMIN.Year_=:Rik and (DATA_VRUCHENNY is null) order by POSTANOVA_ADMIN.NOMER_POSTANOVI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='District';
    qTeritory.Params[0].Value:=cbDistrict.Text;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Rik';
    qTeritory.Params[1].Value:=edtYear.Text;
    qTeritory.Open;
    if qTeritory.RecordCount>0 then
    begin
      if MessageDlg('В базі є не вручені постанови!!!'+#13+'Відобразити не вручені постанови?',mtWarning,[mbYes,mbNo],0)=mrYes then aNeVrucheniExecute(sender) else aUpdateExecute(sender);
    end
    else
      aUpdateExecute(sender);
  end;
  frmAdminZapobizhZahodi.qAdminZapobizhZahidi.Last;
end;

procedure TfrmMain.aVidPostanoviExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidPostanovi') then frmVidPostanovi:=TfrmVidPostanovi.Create(self);
  frmVidPostanovi.Show;
  frmVidPostanovi.Caption:='Довідник видів постанов';
  frmVidPostanovi.FormStyle:=fsMDIChild;
  frmVidPostanovi.DBGrid1.Align:=alClient;
  frmVidPostanovi.aUpdateExecute(sender);

  frmVidPostanovi.aAdd.Enabled:=true;
  frmVidPostanovi.aEdit.Enabled:=true;
  frmVidPostanovi.aDelete.Enabled:=true;
  frmVidPostanovi.aChoice.Enabled:=false;
  frmVidPostanovi.aUpdate.Enabled:=true;
  frmVidPostanovi.aSortByKod.Enabled:=true;
  frmVidPostanovi.aSortByNazva.Enabled:=true;
  frmVidPostanovi.aClose.Enabled:=true;
end;

procedure TfrmMain.aNalashtuvannyViduPostanoviExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidPostanovi') then frmVidPostanovi:=TfrmVidPostanovi.Create(self);
  frmVidPostanovi.Show;
  frmVidPostanovi.Caption:='Налаштування видів постанов';
  frmVidPostanovi.FormStyle:=fsMDIChild;
  frmVidPostanovi.aChoice.Enabled:=false;
  frmVidPostanovi.DBGrid1.Align:=alClient;
  frmVidPostanovi.aUpdateExecute(sender);

  frmVidPostanovi.aAdd.Enabled:=false;
  frmVidPostanovi.aEdit.Enabled:=true;
  frmVidPostanovi.aDelete.Enabled:=false;
  frmVidPostanovi.aChoice.Enabled:=false;
  frmVidPostanovi.aUpdate.Enabled:=true;
  frmVidPostanovi.aSortByKod.Enabled:=true;
  frmVidPostanovi.aSortByNazva.Enabled:=true;
  frmVidPostanovi.aClose.Enabled:=true;
end;

procedure TfrmMain.aVidObmezhenExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidObmezhen') then frmVidObmezhen:=TfrmVidObmezhen.Create(self);
  frmVidObmezhen.Show;
  frmVidObmezhen.Caption:='Суть постанови';
  frmVidObmezhen.FormStyle:=fsMDIChild;
  frmVidObmezhen.DBGrid1.Align:=alClient;
  frmVidObmezhen.aChoice.Enabled:=false;
  frmVidObmezhen.aUpdateExecute(Sender);
  frmVidObmezhen.edtFind.Text:='';
end;

procedure TfrmMain.aUmoviVidnovlennyExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmUmoviVidnovlenny') then frmUmoviVidnovlenny:=TfrmUmoviVidnovlenny.Create(self);
  frmUmoviVidnovlenny.Show;
  frmUmoviVidnovlenny.Caption:='Умови відновлення';
  frmUmoviVidnovlenny.FormStyle:=fsMDIChild;
  frmUmoviVidnovlenny.DBGrid1.Align:=alClient;
  frmUmoviVidnovlenny.aChoice.Enabled:=false;
  frmUmoviVidnovlenny.aUpdateExecute(Sender);
end;

procedure TfrmMain.aOrganizaciiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmOrganizacii') then frmOrganizacii:=TfrmOrganizacii.Create(self);
  frmOrganizacii.Show;
  frmOrganizacii.Caption:='Перелік організацій';
  frmOrganizacii.FormStyle:=fsMDIChild;
  frmOrganizacii.DBGrid1.Align:=alClient;
  frmOrganizacii.aChoice.Enabled:=false;
  frmOrganizacii.aUpdateExecute(sender);
end;

procedure TfrmMain.aViluchennyZRealizaciiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmViluchennyZRealizacii') then frmViluchennyZRealizacii:=TfrmViluchennyZRealizacii.Create(self);
  frmViluchennyZRealizacii.Caption:='Вилучення з реалізації';
  frmViluchennyZRealizacii.Constraints.MinHeight:=300;
  frmViluchennyZRealizacii.Constraints.MinWidth:=640;
  frmViluchennyZRealizacii.FormStyle:=fsMDIChild;
  frmViluchennyZRealizacii.Show;
  frmViluchennyZRealizacii.cbMinistry.Enabled:=true;
  frmViluchennyZRealizacii.cbTeritory.Enabled:=true;
  frmViluchennyZRealizacii.cbDistrict.Enabled:=true;
  frmViluchennyZRealizacii.btnTeritoryUpdate.Enabled:=true;
  frmViluchennyZRealizacii.aTeritoryUpdateExecute(sender);
  frmViluchennyZRealizacii.DBGrid1.Align:=alClient;
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmViluchennyZRealizacii.udYear.Position:=INIAZZ.ReadInteger('System','Year',frmViluchennyZRealizacii.udYear.Position);
  frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
  INIAZZ.Free;

  with frmViluchennyZRealizacii do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI,VILUCHENNY_Z_REALIZACII where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik and (DATA_VRUCHENNY is null) order by NOMER_POSTANOVI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Rajon';
    qTeritory.Params[0].Value:=cbDistrict.Text;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Rik';
    qTeritory.Params[1].Value:=udYear.Position;
    qTeritory.Open;
    if qTeritory.RecordCount>0 then
      if MessageDlg('В базі є не вручені постанови!!!'+#13+'Відобразити не вручені постанови?',mtWarning,[mbYes,mbNo],0)=mrYes then aViluchennyNeVrucheniExecute(sender) else aUpdateViluchennyExecute(sender);
  end;
  frmViluchennyZRealizacii.qViluchennyZRealizacii.Last;
end;

procedure TfrmMain.aTipProdukciiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmTipiProdukcii') then frmTipiProdukcii:=TfrmTipiProdukcii.Create(self);
  frmTipiProdukcii.Show;
  frmTipiProdukcii.Caption:='Типи продукції';
  frmTipiProdukcii.FormStyle:=fsMDIChild;
  frmTipiProdukcii.DBGrid1.Align:=alClient;
  frmTipiProdukcii.rgTipProdukcii.ItemIndex:=0;
  frmTipiProdukcii.aUpdateExecute(sender);
  frmTipiProdukcii.edtFind.Text:='';
  frmTipiProdukcii.aChoice.Enabled:=false;
end;

procedure TfrmMain.aVirobnikiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVirobniki') then frmVirobniki:=TfrmVirobniki.Create(self);
  frmVirobniki.Show;
  frmVirobniki.Caption:='Довідник виробників';
  frmVirobniki.FormStyle:=fsMDIChild;
  frmVirobniki.DBGrid1.Align:=alClient;
  frmVirobniki.aChoice.Enabled:=false;
  frmVirobniki.aUpdateExecute(sender);
  frmVirobniki.edtFind.Text:='';
end;

procedure TfrmMain.aFinansoviSankciiExecute(Sender: TObject);
var
  Ministry,Teritory,District: integer;
begin
  if not frmMain.IsFormOpen('frmFinansoviSankcii') then frmFinansoviSankcii:=TfrmFinansoviSankcii.Create(self);
  frmFinansoviSankcii.Show;
  frmFinansoviSankcii.FormStyle:=fsMDIChild;
  frmFinansoviSankcii.Caption:='Фінансові санкції';
  frmFinansoviSankcii.DBGrid1.Align:=alClient;
  frmFinansoviSankcii.cbMinistry.Text:='';
  frmFinansoviSankcii.cbMinistry.Items.Clear;
  frmFinansoviSankcii.cbTeritory.Text:='';
  frmFinansoviSankcii.cbTeritory.Items.Clear;
  frmFinansoviSankcii.cbDistrict.Text:='';
  frmFinansoviSankcii.cbDistrict.Items.Clear;
  frmFinansoviSankcii.aTeritoryUpdateExecute(sender);
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  frmFinansoviSankcii.udYear.Position:=INIAZZ.ReadInteger('System','Year',frmFinansoviSankcii.udYear.Position);
  frmFinansoviSankcii.aUpdateExecute(sender);
  INIAZZ.Free;
  with frmFinansoviSankcii do
  begin
    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=cbMinistry.Text;
    qTeritory.Open;
    if qTeritory.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qTeritory.FieldByName('KOD').Value else Ministry:=0;

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=cbTeritory.Text;
    qTeritory.Open;
    if qTeritory.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qTeritory.FieldByName('KOD').Value else Teritory:=0;

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=cbDistrict.Text;
    qTeritory.Open;
    if qTeritory.Locate('RAJON',cbDistrict.Text,[]) then District:=qTeritory.FieldByName('KOD').Value else District:=0;

    qTeritory.SQL.Clear;
    qTeritory.SQL.Text:='select * from FINANSOVI_SANKCII where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and YEAR_=:Rik and (DATA_VRUCHENNY is null) order by NOMER_POSTANOVI';
    qTeritory.Params.Clear;
    qTeritory.Params.Add;
    qTeritory.Params[0].Name:='Ministry';
    qTeritory.Params[0].Value:=Ministry;
    qTeritory.Params.Add;
    qTeritory.Params[1].Name:='Teritory';
    qTeritory.Params[1].Value:=Teritory;
    qTeritory.Params.Add;
    qTeritory.Params[2].Name:='Rajon';
    qTeritory.Params[2].Value:=District;
    qTeritory.Params.Add;
    qTeritory.Params[3].Name:='Rik';
    qTeritory.Params[3].Value:=edtYear.Text;
    qTeritory.Open;
    if qTeritory.RecordCount>0 then
      if MessageDlg('В базі є не вручені постанови!!!'+#13+'Відобразити не вручені постанови?',mtWarning,[mbYes,mbNo],0)=mrYes then aNeVrucheniExecute(sender) else aUpdateExecute(sender);
  end;
  frmFinansoviSankcii.qFinansoviSankcii.Last;
end;

procedure TfrmMain.aNalashtuvannyKoristuvachiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmKoristuvachi') then frmKoristuvachi:=TfrmKoristuvachi.Create(self);
  frmKoristuvachi.Caption:='Перелік користувачів системи';
  frmKoristuvachi.FormStyle:=fsMDIChild;
  frmKoristuvachi.DBGrid1.Align:=alClient;
  frmKoristuvachi.Show;
  frmKoristuvachi.aChoice.Enabled:=false;
  frmKoristuvachi.aUpdateExecute(sender);
end;

procedure TfrmMain.aNalashtuvannyGroupsExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGroups') then frmGroups:=TfrmGroups.Create(self);
  with frmGroups do
  begin
    Caption:='Групи користувачів';
    FormStyle:=fsMDIChild;
    Show;
    lvGroups.Align:=alClient;
    aUpdateExecute(sender);
    aChoice.Enabled:=false;
////    pcGroups.Align:=alClient;
////    DBGrid1.Align:=alClient;
////    aUpdateGroupExecute(sender);
////    aChoiceGroup.Enabled:=false;
////
////    FormResize(sender);
////    lvMembers.Align:=alClient;
////    cbGroups.Text:='';
////    cbGroups.Items.Clear;
////    aGroupsUpdateExecute(sender);
////    aGroupsChangeExecute(sender);
////    pcGroups.ActivePage:=tsGroups;
  end;
end;

procedure TfrmMain.aZvitSchomisychnijExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmZvitShtrafi') then frmZvitShtrafi:=TfrmZvitShtrafi.Create(self);
  frmMain.Enabled:=false;
  with frmZvitShtrafi do
  begin
    Show;
    Caption:='Звіт про заходи адмінвпливу';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    edtMinistry.Text:='';
    edtMinistry.Enabled:=false;
    edtTeritory.Text:='';
    edtTeritory.Enabled:=false;
    edtDistrict.Text:='';
    edtDistrict.Enabled:=false;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');

    edtMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',edtMinistry.Text);
    qZvitSchomisychnij.SQL.Clear;
    qZvitSchomisychnij.SQL.Text:='select * from MINISTRY where KOD=:Ministry order by KOD';
    qZvitSchomisychnij.Params.Clear;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[0].Name:='Ministry';
    qZvitSchomisychnij.Params[0].Value:=edtMinistry.Text;
    qZvitSchomisychnij.Open;
    if qZvitSchomisychnij.Locate('KOD',StrToInt(edtMinistry.Text),[]) then edtMinistry.Text:=qZvitSchomisychnij.FieldByName('MINISTRY').Value else edtMinistry.Text:='';

    edtTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',edtTeritory.Text);
    qZvitSchomisychnij.SQL.Clear;
    qZvitSchomisychnij.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.KOD=:Teritory order by TERITORY.KOD';
    qZvitSchomisychnij.Params.Clear;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[0].Name:='Ministry';
    qZvitSchomisychnij.Params[0].Value:=edtMinistry.Text;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[1].Name:='Teritory';
    qZvitSchomisychnij.Params[1].Value:=edtTeritory.Text;
    qZvitSchomisychnij.Open;
    if qZvitSchomisychnij.Locate('KOD',StrToInt(edtTeritory.Text),[]) then edtTeritory.Text:=qZvitSchomisychnij.FieldByName('TERITORY').Value else edtTeritory.Text:='';

    edtDistrict.Text:=INIAZZ.ReadString('Teritory','District',edtDistrict.Text);
    qZvitSchomisychnij.SQL.Clear;
    qZvitSchomisychnij.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.KOD=:Rajon order by RAJONI.KOD';
    qZvitSchomisychnij.Params.Clear;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[0].Name:='Teritory';
    qZvitSchomisychnij.Params[0].Value:=edtTeritory.Text;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[1].Name:='Rajon';
    qZvitSchomisychnij.Params[1].Value:=edtDistrict.Text;
    qZvitSchomisychnij.Open;
    if qZvitSchomisychnij.Locate('KOD',StrToInt(edtDistrict.Text),[]) then edtDistrict.Text:=qZvitSchomisychnij.FieldByName('RAJON').Value else edtDistrict.Text:='';

    rgTeritory.ItemIndex:=-1;
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    aTeritoryUpdateExecute(sender);

    dtpZaPeriodZ.Date:=int(date);
    dtpZaPeriodPo.Date:=int(date);
    edtZagolovok.Text:='';
    edtZagolovok.Visible:=true;
    lblZagolovok.Visible:=true;
    INIAZZ.Free;
  end;
end;

procedure TfrmMain.aNalashtuvanny_ZvyazokZSchomicyachnimExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmZvyzok') then frmZvyzok:=TfrmZvyzok.Create(self);
  frmMain.Enabled:=false;
  with frmZvyzok do
  begin
    Show;
    Caption:='Звязок зі звітною формою';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    tsZvyzokZSchomisychnimZvitom.TabVisible:=true;
    tsZvyzokZF18.TabVisible:=false;
    tsRezultatOskarzhenny.TabVisible:=false;
    Width:=580;
    Height:=424;
    pcZvyzok.Width:=545;
    pcZvyzok.Height:=241;
    btnVikonati.Left:=trunc(int((Width-btnVikonati.Width-btnVidminiti.Width-4)/2));
    btnVikonati.Top:=356;
    btnVidminiti.Left:=trunc(int((Width-btnVikonati.Width-btnVidminiti.Width-4)/2))+btnVikonati.Width+4;
    btnVidminiti.Top:=356;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');

    edtMinistry.Text:='0';
    edtMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',edtMinistry.Text);
    edtMinistry.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from MINISTRY where KOD=:Ministry order by KOD';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Ministry';
    qZvyazok.Params[0].Value:=edtMinistry.Text;
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtMinistry.Text),[]) then edtMinistry.Text:=qZvyazok.FieldByName('MINISTRY').Value else edtMinistry.Text:='';

   edtTeritory.Text:='0';
    edtTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',edtTeritory.Text);
    edtTeritory.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.KOD=:Teritory order by TERITORY.KOD';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Ministry';
    qZvyazok.Params[0].Value:=edtMinistry.Text;
    qZvyazok.Params.Add;
    qZvyazok.Params[1].Name:='Teritory';
    qZvyazok.Params[1].Value:=edtTeritory.Text;
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtTeritory.Text),[]) then edtTeritory.Text:=qZvyazok.FieldByName('TERITORY').Value else edtTeritory.Text:='';

    edtDistrict.Text:='0';
    edtDistrict.Text:=INIAZZ.ReadString('Teritory','District',edtDistrict.Text);
    edtDistrict.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.KOD=:Rajon order by RAJONI.KOD';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Teritory';
    qZvyazok.Params[0].Value:=edtTeritory.Text;
    qZvyazok.Params.Add;
    qZvyazok.Params[1].Name:='Rajon';
    qZvyazok.Params[1].Value:=edtDistrict.Text;
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtDistrict.Text),[]) then edtDistrict.Text:=qZvyazok.FieldByName('RAJON').Value else edtDistrict.Text:='';

    cbKG.Text:='';
    cbKG.Items.Clear;
    cbKG.Enabled:=true;
    btnKG_Update.Enabled:=true;
    btnKG_Choice.Enabled:=true;
    cbGH.Text:='';
    cbGH.Items.Clear;
    cbGH.Enabled:=true;
    btnGH_Update.Enabled:=true;
    btnGH_Choice.Enabled:=true;
    cbGDP.Text:='';
    cbGDP.Items.Clear;
    cbGDP.Enabled:=true;
    btnGDP_Update.Enabled:=true;
    btnGDP_Choice.Enabled:=true;
    cbGPr.Text:='';
    cbGPr.Items.Clear;
    cbGPr.Enabled:=true;
    btnGPr_Update.Enabled:=true;
    btnGPr_Choice.Enabled:=true;
    cbRV.Text:='';
    cbRV.Items.Clear;
    cbRV.Enabled:=true;
    btnRV_Update.Enabled:=true;
    btnRV_Choice.Enabled:=true;
    cbEV.Text:='';
    cbEV.Items.Clear;
    cbEV.Enabled:=true;
    btnEV_Update.Enabled:=true;
    btnEV_Choice.Enabled:=true;
    cbVMP.Text:='';
    cbVMP.Items.Clear;
    cbVMP.Enabled:=true;
    btnVMP_Update.Enabled:=true;
    btnVMP_Choice.Enabled:=true;
    aUpdate_Schomisychnij_AllExecute(sender);

    cbKG.Text:=INIAZZ.ReadString('Order','KG',cbKG.Text);
    cbGH.Text:=INIAZZ.ReadString('Order','GH',cbGH.Text);
    cbGDP.Text:=INIAZZ.ReadString('Order','GDP',cbGDP.Text);
    cbGPr.Text:=INIAZZ.ReadString('Order','GPr',cbGPr.Text);
    cbRV.Text:=INIAZZ.ReadString('Order','RV',cbRV.Text);
    cbEV.Text:=INIAZZ.ReadString('Order','EV',cbEV.Text);
    cbVMP.Text:=INIAZZ.ReadString('Order','VMP',cbVMP.Text);

    INIAZZ.Free;
  end;
end;

procedure TfrmMain.aNalashtuvanny_ZvyazokZRezultatamiOskarzhennyExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmZvyzok') then frmZvyzok:=TfrmZvyzok.Create(self);
  frmMain.Enabled:=false;
  with frmZvyzok do
  begin
    Show;
    Caption:='Звязок зі звітною формою';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    tsZvyzokZSchomisychnimZvitom.TabVisible:=false;
    tsZvyzokZF18.TabVisible:=false;
    tsRezultatOskarzhenny.TabVisible:=true;
    Width:=580;
    Height:=314;
    pcZvyzok.Width:=545;
    pcZvyzok.Height:=129;
    btnVikonati.Left:=trunc(int((Width-btnVikonati.Width-btnVidminiti.Width-4)/2));
    btnVikonati.Top:=244;
    btnVidminiti.Left:=trunc(int((Width-btnVikonati.Width-btnVidminiti.Width-4)/2))+btnVikonati.Width+4;
    btnVidminiti.Top:=244;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');

    edtMinistry.Text:='0';
    edtMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',edtMinistry.Text);
    edtMinistry.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from MINISTRY where KOD='+edtMinistry.Text+' order by KOD';
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtMinistry.Text),[]) then edtMinistry.Text:=qZvyazok.FieldByName('MINISTRY').Value else edtMinistry.Text:='';

    edtTeritory.Text:='0';
    edtTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',edtTeritory.Text);
    edtTeritory.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY='''+edtMinistry.Text+''' and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.KOD='+edtTeritory.Text+' order by TERITORY.KOD';
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtTeritory.Text),[]) then edtTeritory.Text:=qZvyazok.FieldByName('TERITORY').Value else edtTeritory.Text:='';

    edtDistrict.Text:='0';
    edtDistrict.Text:=INIAZZ.ReadString('Teritory','District',edtDistrict.Text);
    edtDistrict.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY='''+edtTeritory.Text+''' and RAJONI.TERITORY=TERITORY.KOD and RAJONI.KOD='+edtDistrict.Text+' order by RAJONI.KOD';
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtDistrict.Text),[]) then edtDistrict.Text:=qZvyazok.FieldByName('RAJON').Value else edtDistrict.Text:='';

    cbVidmineno.Text:='';
    cbVidmineno.Items.Clear;
    cbVidmineno.Enabled:=true;
    btnVidmineno_Update.Enabled:=true;
    btnVidmineno_Choice.Enabled:=true;
    cbNaNovijRozglyd.Text:='';
    cbNaNovijRozglyd.Items.Clear;
    cbNaNovijRozglyd.Enabled:=true;
    btnNaNovijRozglyd_Update.Enabled:=true;
    btnNaNovijRozglyd_Choice.Enabled:=true;
    cbZalishenoVSili.Text:='';
    cbZalishenoVSili.Items.Clear;
    cbZalishenoVSili.Enabled:=true;
    btnZalishenoVSili_Update.Enabled:=true;
    btnZalishenoVSili_Choice.Enabled:=true;
    aUpdate_RezultatiOskarzhennyExecute(sender);

    cbVidmineno.Text:=INIAZZ.ReadString('Results','Vidmineno',cbVidmineno.Text);
    cbNaNovijRozglyd.Text:=INIAZZ.ReadString('Results','NovijRozglyad',cbNaNovijRozglyd.Text);
    cbZalishenoVSili.Text:=INIAZZ.ReadString('Results','ZalishenoVSili',cbZalishenoVSili.Text);

    INIAZZ.Free;
  end;
end;

procedure TfrmMain.aZvitT23F18Execute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmZvitShtrafi') then frmZvitShtrafi:=TfrmZvitShtrafi.Create(self);
  frmMain.Enabled:=false;
  with frmZvitShtrafi do
  begin
    Show;
    Caption:='Звіт про заходи адмінвпливу т.23 ф.18';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    edtMinistry.Text:='';
    edtMinistry.Enabled:=false;
    edtTeritory.Text:='';
    edtTeritory.Enabled:=false;
    edtDistrict.Text:='';
    edtDistrict.Enabled:=false;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');

    edtMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',edtMinistry.Text);
    qZvitSchomisychnij.SQL.Clear;
    qZvitSchomisychnij.SQL.Text:='select * from MINISTRY where KOD=:Ministry order by KOD';
    qZvitSchomisychnij.Params.Clear;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[0].Name:='Ministry';
    qZvitSchomisychnij.Params[0].Value:=edtMinistry.Text;
    qZvitSchomisychnij.Open;
    if qZvitSchomisychnij.Locate('KOD',StrToInt(edtMinistry.Text),[]) then edtMinistry.Text:=qZvitSchomisychnij.FieldByName('MINISTRY').Value else edtMinistry.Text:='';

    edtTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',edtTeritory.Text);
    qZvitSchomisychnij.SQL.Clear;
    qZvitSchomisychnij.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.KOD=:Teritory order by TERITORY.KOD';
    qZvitSchomisychnij.Params.Clear;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[0].Name:='Ministry';
    qZvitSchomisychnij.Params[0].Value:=edtMinistry.Text;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[1].Name:='Teritory';
    qZvitSchomisychnij.Params[1].Value:=edtTeritory.Text;
    qZvitSchomisychnij.Open;
    if qZvitSchomisychnij.Locate('KOD',StrToInt(edtTeritory.Text),[]) then edtTeritory.Text:=qZvitSchomisychnij.FieldByName('TERITORY').Value else edtTeritory.Text:='';

    edtDistrict.Text:=INIAZZ.ReadString('Teritory','District',edtDistrict.Text);
    qZvitSchomisychnij.SQL.Clear;
    qZvitSchomisychnij.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.KOD=:Rajon order by RAJONI.KOD';
    qZvitSchomisychnij.Params.Clear;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[0].Name:='Teritory';
    qZvitSchomisychnij.Params[0].Value:=edtTeritory.Text;
    qZvitSchomisychnij.Params.Add;
    qZvitSchomisychnij.Params[1].Name:='Rajon';
    qZvitSchomisychnij.Params[1].Value:=edtDistrict.Text;
    qZvitSchomisychnij.Open;
    if qZvitSchomisychnij.Locate('KOD',StrToInt(edtDistrict.Text),[]) then edtDistrict.Text:=qZvitSchomisychnij.FieldByName('RAJON').Value else edtDistrict.Text:='';

    rgTeritory.ItemIndex:=-1;
    cbTeritory.Text:='';
    cbTeritory.Items.Clear;
    aTeritoryUpdateExecute(sender);

    dtpZaPeriodZ.Date:=int(date);
    dtpZaPeriodPo.Date:=int(date);
    edtZagolovok.Text:='';
    edtZagolovok.Visible:=false;
    lblZagolovok.Visible:=false;
    INIAZZ.Free;
  end;
end;

procedure TfrmMain.aZvitSchokvartalnijExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmZvyzok') then frmZvyzok:=TfrmZvyzok.Create(self);
  frmMain.Enabled:=false;
  with frmZvyzok do
  begin
    Show;
    Caption:='Звязок зі звітною формою';
    Position:=poMainFormCenter;
    BorderStyle:=bsDialog;
    tsZvyzokZSchomisychnimZvitom.TabVisible:=false;
    tsZvyzokZF18.TabVisible:=true;
    tsRezultatOskarzhenny.TabVisible:=false;
    Width:=580;
    Height:=558;
    pcZvyzok.Width:=545;
    pcZvyzok.Height:=373;
    btnVikonati.Left:=trunc(int((Width-btnVikonati.Width-btnVidminiti.Width-4)/2));
    btnVikonati.Top:=488;
    btnVidminiti.Left:=trunc(int((Width-btnVikonati.Width-btnVidminiti.Width-4)/2))+btnVikonati.Width+4;
    btnVidminiti.Top:=488;
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');

    edtMinistry.Text:='0';
    edtMinistry.Text:=INIAZZ.ReadString('Teritory','Ministry',edtMinistry.Text);
    edtMinistry.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from MINISTRY where KOD=:Ministry order by KOD';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Ministry';
    qZvyazok.Params[0].Value:=edtMinistry.Text;
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtMinistry.Text),[]) then edtMinistry.Text:=qZvyazok.FieldByName('MINISTRY').Value else edtMinistry.Text:='';

    edtTeritory.Text:='0';
    edtTeritory.Text:=INIAZZ.ReadString('Teritory','Teritory',edtTeritory.Text);
    edtTeritory.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from TERITORY,MINISTRY where MINISTRY.MINISTRY=:Ministry and TERITORY.MINISTRY=MINISTRY.KOD and TERITORY.KOD=:Teritory order by TERITORY.KOD';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Ministry';
    qZvyazok.Params[0].Value:=edtMinistry.Text;
    qZvyazok.Params.Add;
    qZvyazok.Params[1].Name:='Teritory';
    qZvyazok.Params[1].Value:=edtTeritory.Text;
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtTeritory.Text),[]) then edtTeritory.Text:=qZvyazok.FieldByName('TERITORY').Value else edtTeritory.Text:='';

    edtDistrict.Text:='0';
    edtDistrict.Text:=INIAZZ.ReadString('Teritory','District',edtDistrict.Text);
    edtDistrict.Enabled:=false;
    qZvyazok.SQL.Clear;
    qZvyazok.SQL.Text:='select * from RAJONI,TERITORY where TERITORY.TERITORY=:Teritory and RAJONI.TERITORY=TERITORY.KOD and RAJONI.KOD=:Rajon order by RAJONI.KOD';
    qZvyazok.Params.Clear;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Teritory';
    qZvyazok.Params[0].Value:=edtTeritory.Text;
    qZvyazok.Params.Add;
    qZvyazok.Params[0].Name:='Rajon';
    qZvyazok.Params[0].Value:=edtDistrict.Text;
    qZvyazok.Open;
    if qZvyazok.Locate('KOD',StrToInt(edtDistrict.Text),[]) then edtDistrict.Text:=qZvyazok.FieldByName('RAJON').Value else edtDistrict.Text:='';

    cbZaVodopostachannym.Text:='';
    cbZaVodopostachannym.Items.Clear;
    cbZaVodopostachannym.Enabled:=true;
    btnZaVodopostachannym_Update.Enabled:=true;
    btnZaVodopostachannym_Choice.Enabled:=true;
    cbZaOhoronojuVodojm.Text:='';
    cbZaOhoronojuVodojm.Items.Clear;
    cbZaOhoronojuVodojm.Enabled:=true;
    btnZaOhoronojuVodojm_Update.Enabled:=true;
    btnZaOhoronojuVodojm_Choice.Enabled:=true;
    cbZaOhoronojuAtmosfernogoPovitrya.Text:='';
    cbZaOhoronojuAtmosfernogoPovitrya.Items.Clear;
    cbZaOhoronojuAtmosfernogoPovitrya.Enabled:=true;
    btnZaOhoronojuAtmosfernogoPovitrya_Update.Enabled:=true;
    btnZaOhoronojuAtmosfernogoPovitrya_Choice.Enabled:=true;
    cbZaOhoronojuGruntu.Text:='';
    cbZaOhoronojuGruntu.Items.Clear;
    cbZaOhoronojuGruntu.Enabled:=true;
    btnZaOhoronojuGruntu_Update.Enabled:=true;
    btnZaOhoronojuGruntu_Choice.Enabled:=true;
    cbRadiacijnoiBezpeki.Text:='';
    cbRadiacijnoiBezpeki.Items.Clear;
    cbRadiacijnoiBezpeki.Enabled:=true;
    btnRadiacijnoiBezpeki_Update.Enabled:=true;
    btnRadiacijnoiBezpeki_Choice.Enabled:=true;
    cbZaKomunalnimiObjektami.Text:='';
    cbZaKomunalnimiObjektami.Items.Clear;
    cbZaKomunalnimiObjektami.Enabled:=true;
    btnZaKomunalnimiObjektami_Update.Enabled:=true;
    btnZaKomunalnimiObjektami_Choice.Enabled:=true;
    cbZaLPZ.Text:='';
    cbZaLPZ.Items.Clear;
    cbZaLPZ.Enabled:=true;
    btnZaLPZ_Update.Enabled:=true;
    btnZaLPZ_Choice.Enabled:=true;
    cbZaPromislovimiPidpriemstvami.Text:='';
    cbZaPromislovimiPidpriemstvami.Items.Clear;
    cbZaPromislovimiPidpriemstvami.Enabled:=true;
    btnZaPromislovimiPidpriemstvami_Update.Enabled:=true;
    btnZaPromislovimiPidpriemstvami_Choice.Enabled:=true;
    cbZaDitychimiTaPidlitkovimiZakladami.Text:='';
    cbZaDitychimiTaPidlitkovimiZakladami.Items.Clear;
    cbZaDitychimiTaPidlitkovimiZakladami.Enabled:=true;
    btnZaDitychimiTaPidlitkovimiZakladami_Update.Enabled:=true;
    btnZaDitychimiTaPidlitkovimiZakladami_Choice.Enabled:=true;
    cbZaPidpriemstvamiHarchovoiPromislovosti.Text:='';
    cbZaPidpriemstvamiHarchovoiPromislovosti.Items.Clear;
    cbZaPidpriemstvamiHarchovoiPromislovosti.Enabled:=true;
    btnZaPidpriemstvamiHarchovoiPromislovosti_Update.Enabled:=true;
    btnZaPidpriemstvamiHarchovoiPromislovosti_Choice.Enabled:=true;
    cbGromadskogoHarchuvanny.Text:='';
    cbGromadskogoHarchuvanny.Items.Clear;
    cbGromadskogoHarchuvanny.Enabled:=true;
    btnGromadskogoHarchuvanny_Update.Enabled:=true;
    btnGromadskogoHarchuvanny_Choice.Enabled:=true;
    cbTorgivli.Text:='';
    cbTorgivli.Items.Clear;
    cbTorgivli.Enabled:=true;
    btnTorgivli_Update.Enabled:=true;
    btnTorgivli_Choice.Enabled:=true;
    cbZaSudnami.Text:='';
    cbZaSudnami.Items.Clear;
    cbZaSudnami.Enabled:=true;
    btnZaSudnami_Update.Enabled:=true;
    btnZaSudnami_Choice.Enabled:=true;
    aUpdateSchokvartalnijExecute(sender);

    cbZaVodopostachannym.Text:=INIAZZ.ReadString('Schokvartalnij','ZaVodopostachannym',cbZaVodopostachannym.Text);
    cbZaOhoronojuVodojm.Text:=INIAZZ.ReadString('Schokvartalnij','ZaOhoronojuVodojm',cbZaOhoronojuVodojm.Text);
    cbZaOhoronojuAtmosfernogoPovitrya.Text:=INIAZZ.ReadString('Schokvartalnij','ZaOhoronojuAtmosfernogoPovitry',cbZaOhoronojuAtmosfernogoPovitrya.Text);
    cbZaOhoronojuGruntu.Text:=INIAZZ.ReadString('Schokvartalnij','ZaOhoronojuGrunta',cbZaOhoronojuGruntu.Text);
    cbRadiacijnoiBezpeki.Text:=INIAZZ.ReadString('Schokvartalnij','RadiacijnoiBezpeki',cbRadiacijnoiBezpeki.Text);
    cbZaKomunalnimiObjektami.Text:=INIAZZ.ReadString('Schokvartalnij','ZaKomunalnimiObjektami',cbZaKomunalnimiObjektami.Text);
    cbZaLPZ.Text:=INIAZZ.ReadString('Schokvartalnij','ZaLPZ',cbZaLPZ.Text);
    cbZaPromislovimiPidpriemstvami.Text:=INIAZZ.ReadString('Schokvartalnij','ZaPromislovimiPidpriemstvami',cbZaPromislovimiPidpriemstvami.Text);
    cbZaDitychimiTaPidlitkovimiZakladami.Text:=INIAZZ.ReadString('Schokvartalnij','ZaDDZ',cbZaDitychimiTaPidlitkovimiZakladami.Text);
    cbZaPidpriemstvamiHarchovoiPromislovosti.Text:=INIAZZ.ReadString('Schokvartalnij','ZaPid[riemstvamiHarchovoiPromislovosti',cbZaPidpriemstvamiHarchovoiPromislovosti.Text);
    cbGromadskogoHarchuvanny.Text:=INIAZZ.ReadString('Schokvartalnij','GromadskogoHarchuvanny',cbGromadskogoHarchuvanny.Text);
    cbTorgivli.Text:=INIAZZ.ReadString('Schokvartalnij','Torgivli',cbTorgivli.Text);
    cbZaSudnami.Text:=INIAZZ.ReadString('Schokvartalnij','ZaSudnami',cbZaSudnami.Text);

    INIAZZ.Free;
  end;
end;

procedure TfrmMain.aNalashtuvannyGlobalUsersExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmGlobalUsers') then frmGlobalUsers:=TfrmGlobalUsers.Create(self);
  with frmGlobalUsers do
  begin
    Show;
    Caption:='Глобальні користувачі';
    FormStyle:=fsMDIChild;
    aChoice.Enabled:=false;
    lvUsers.Align:=alClient;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmMain.aNalashtuvanny_FunkciiDostupuExecute(Sender: TObject);
begin
{
  if not frmMain.IsFormOpen('frmFunkciiDostupu') then frmFunkciiDostupu:=TfrmFunkciiDostupu.Create(self);
  frmFunkciiDostupu.Caption:='Перелік функцій доступу';
  frmFunkciiDostupu.FormStyle:=fsMDIChild;
  frmFunkciiDostupu.Show;
  frmFunkciiDostupu.dgFunkciiDostupu.Align:=alClient;
  frmFunkciiDostupu.btnVibrati.Enabled:=false;
  frmFunkciiDostupu.mnVibrati.Enabled:=false;
  frmFunkciiDostupu.mnZaImjyamFunkciiClick(sender);
  frmFunkciiDostupu.tblFunkciiDostupu.Open;
  frmFunkciiDostupu.tblFunkciiDostupu.Last;
  frmFunkciiDostupu.tblFunkciiDostupu.First;
}

end;

procedure TfrmMain.aNalashtuvanny_ViknaExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVikna') then frmVikna:=TfrmVikna.Create(self);
  with frmVikna do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Перелік вікон програми';
    Show;
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
  end;
end;

procedure TfrmMain.aNalashtuvanny_ElementiVikonExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmElementiVikon') then frmElementiVikon:=TfrmElementiVikon.Create(self);
  with frmElementiVikon do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Елементи вікон';
    DBGrid1.Align:=alClient;
    aFormsUpdateExecute(sender);
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
    Show;
  end;
end;

procedure TfrmMain.aNalashtuvanny_PravaKoristuvachivExecute(
  Sender: TObject);
var
  UpdateUserWrites: integer;
begin
  if not frmMain.IsFormOpen('frmPravaKoristuvachiv') then frmPravaKoristuvachiv:=TfrmPravaKoristuvachiv.Create(self);
  with frmPravaKoristuvachiv do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Права користувачів програми';
    Show;
    aGroupUpdateExecute(sender);
    tvUserWrites.Align:=alLeft;
    tvUserWrites.Width:=trunc(int(frmPravaKoristuvachiv.Width/3));
    DBGrid1.Align:=alClient;
    aFormsUpdateExecute(sender);
    cbxVisible.Checked:=false;
    aVisibleChangeExecute(sender);
    cbxEnable.Checked:=false;
    aEnableChangeExecute(sender);
    aPravaKoristuvachivUpdateExecute(sender);
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    UpdateUserWrites:=0;
    UpdateUserWrites:=INIAZZ.ReadInteger('System','UpdateUserWrites',UpdateUserWrites);
    if UpdateUserWrites=1 then aUpdateUserWritesExecute(sender);
    INIAZZ.WriteString('System','UpdateUserWrites','0');
    INIAZZ.Free;
    aGroupUpdateExecute(sender);
    tvUserWrites.Align:=alLeft;
    tvUserWrites.Width:=trunc(int(frmPravaKoristuvachiv.Width/3));
    DBGrid1.Align:=alClient;
    aFormsUpdateExecute(sender);
    cbxVisible.Checked:=false;
    aVisibleChangeExecute(sender);
    cbxEnable.Checked:=false;
    aEnableChangeExecute(sender);
    aPravaKoristuvachivUpdateExecute(sender);
    Panel3.Align:=alBottom;
    pbUpdateData.Visible:=false;
  end;
end;

procedure TfrmMain.TimerTimer(Sender: TObject);
begin
  frmMain.StatusBar.Panels[1].Text:=TimeToStr(Time);
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  frmMain.StatusBar.Panels[0].Width:=frmMain.Width-300;
end;

procedure TfrmMain.aRivniSESExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmRivniSES') then frmRivniSES:=TfrmRivniSES.Create(self);
  with frmRivniSES do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Рівні СЕС';
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
    Show;
  end;
end;

procedure TfrmMain.aDataTypesExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmDataTypes') then frmDataTypes:=TfrmDataTypes.Create(self);
  with frmDataTypes do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Типи даних';
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
    Show;
  end;
end;

procedure TfrmMain.aDataTablesExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmDataTables') then frmDataTables:=TfrmDataTables.Create(self);
  with frmDataTables do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Таблиці даних';
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
    Show;
  end;
end;

procedure TfrmMain.aReportsExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmReports') then frmReports:=TfrmReports.Create(self);
  with frmReports do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Перелік звітних форм';
    DBGrid1.Align:=alClient;
    aChoice.Enabled:=false;
    aUpdateExecute(sender);
    Show;
  end;
end;

procedure TfrmMain.aRozdiliInicializaciiExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmInitialize') then frmInitialize:=TfrmInitialize.Create(self);
  with frmInitialize do
  begin
    FormStyle:=fsMDIChild;
    Caption:='Довідник розділів ініціалізації';
    aChoice.Enabled:=false;
//    aUpdateExecute(sender);
    DBGrid1.Align:=alClient;
    DBGrid1.Visible:=false;
    TreeView1.Align:=alClient;
    TreeView1.Visible:=false;
    cbxTreeView.Checked:=true;
//    cbxTreeViewClick(sender);
    Show;
  end;
end;

end.
