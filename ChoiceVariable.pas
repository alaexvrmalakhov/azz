unit ChoiceVariable;

interface

uses
  Forms, ComCtrls, Classes, Controls, StdCtrls, Grids, DBGrids, ActnList,
  DB, IBCustomDataSet, IBQuery, IniFiles, SysUtils, Dialogs;
//  Windows, Messages, Variants, Graphics;

type
  TfrmChoiceVariable = class(TForm)
    pcChoiceVariable: TPageControl;
    tsField: TTabSheet;
    tsInit: TTabSheet;
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    cbTablesList: TComboBox;
    btnUpdateTablesList: TButton;
    dbgFields: TDBGrid;
    btnUpdate: TButton;
    alChoiceVariable: TActionList;
    aOK: TAction;
    aCancel: TAction;
    aUpdate: TAction;
    dsFields: TDataSource;
    qFields: TIBQuery;
    qChoiceVariable: TIBQuery;
    tvInit: TTreeView;
    aUpdateTablesList: TAction;
    aUpdateFieldsList: TAction;
    aUpdateInitList: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aUpdateInitListExecute(Sender: TObject);
    procedure aUpdateTablesListExecute(Sender: TObject);
    procedure aUpdateFieldsListExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChoiceVariable: TfrmChoiceVariable;

implementation

uses RerpotParamEdit, Main;

{$R *.dfm}

procedure TfrmChoiceVariable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmRerpotParamEdit.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmChoiceVariable.aOKExecute(Sender: TObject);
var
  TableName: string;
  i: integer;
begin
  with frmChoiceVariable do
  begin
    frmRerpotParamEdit.edtFormula.Text:=IntToStr(frmChoiceVariable.tvInit.Selected.Level);
    i:=StrToInt(frmRerpotParamEdit.edtFormula.Text);
    case pcChoiceVariable.ActivePageIndex of
      0:  //tsField
        begin
          if qFields.RecordCount<=0 then exit;
          frmRerpotParamEdit.edtFormula.Text:='';
          with qChoiceVariable do
          begin
            SQL.Clear;
            SQL.Text:='select * from DATATABLES where TABLENAME=:TableName order by DBTABLENAME';
            Params.Clear;
            Params.Add;
            Params[0].Name:='TableName';
            Params[0].Value:=frmChoiceVariable.cbTablesList.Text;
            Open;
          end;
          if qChoiceVariable.Locate('TABLENAME',cbTablesList.Text,[]) then TableName:=qChoiceVariable.FieldByName('DBTABLENAME').Value else TableName:='';
          frmRerpotParamEdit.edtFormula.Text:='0.'+TableName+'.'+qFields.FieldByName('DBFIELDNAME').Value;
        end;
      1:  //tsInit
        begin
          case i of
            0:
              begin
                MessageDlg('Увага!'+#13+'Не вибрано підрозділ ініціалізації!'+#13+'Виберіть підрозділ.',mtError,[mbOK],0);
                exit;
              end;
            1:
              begin
//                if frmChoiceVariable.tvInit.Items.Item[StrToInt(frmRerpotParamEdit.edtFormula.Text)].HasChildren then
                ShowMessage(frmRerpotParamEdit.edtFormula.Text);
//                if frmChoiceVariable.tvInit.Items.Item[StrToInt(frmRerpotParamEdit.edtFormula.Text)].HasChildren then
                if frmChoiceVariable.tvInit.Items.Item[i].HasChildren then
                begin
                  MessageDlg('Увага!'+#13+'Не вибрано підрозділ ініціалізації!'+#13+'Виберіть підрозділ.',mtError,[mbOK],0);
                  exit;
                end
                else
                begin
                  frmRerpotParamEdit.edtFormula.Text:='1.'+frmChoiceVariable.tvInit.Selected.Parent.Text+'.'+frmChoiceVariable.tvInit.Selected.Text;
                end;
              end;
            2:
              begin
              end;
            3:
              begin
//                frmRerpotParamEdit.edtFormula.Text:='1.'+frmChoiceVariable.tvInit.Selected.Parent.Text+'.'+frmChoiceVariable.tvInit.Selected.Parent.Text+'.'+frmChoiceVariable.tvInit.Selected.Parent.Text+'.'+frmChoiceVariable.tvInit.Selected.Text;
{
function GetPathToNode(Node: TTreeNode; Separator: Char): string;
begin
  Result := '';
  if Node = nil then
    exit;
  while Node <> nil do
  begin
    Result := Node.Text + Separator + Result;
    Node := Node.Parent;
  end;
  Delete(Result, length(Result), 1);
end;}
              end;
          end;
//          frmRerpotParamEdit.edtFormula.Text:='1.'+frmChoiceVariable.tvInit.Selected.Parent.Text+frmChoiceVariable.tvInit.Selected.Text;
        end;
    end;
    frmChoiceVariable.Close;
  end;
end;

procedure TfrmChoiceVariable.aCancelExecute(Sender: TObject);
begin
  frmChoiceVariable.Close;
end;

procedure TfrmChoiceVariable.aUpdateInitListExecute(Sender: TObject);
var
  tiSystem, tiTeritory, tiDirector, tiDirector1, tiDirector2: TTreeNode;
  tiFirm, tiBank, tiOrder, tiResult, tiSchokvartalnij: TTreeNode;
  tiNazivnij, tiRodovij, tiDavalnij, tiZnahidnij, tiOrudnij, tiMiscevij: TTreeNode;
  tiPidpis: TTreeNode;
begin
  with frmChoiceVariable do
  begin
    INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
    with tvInit.Items do
    begin
      Clear;
      tiSystem:=Add(nil,'Система');
        AddChild(tiSystem,'Грошова одиниця');
        AddChild(tiSystem,'Рік');
        AddChild(tiSystem,'Тимчасова папка');
        AddChild(tiSystem,'Посада керівника');
        AddChild(tiSystem,'Поновити права користувачів');
        AddChild(tiSystem,'Друк');
        AddChild(tiSystem,'Шлях до шаблонів');
      tiTeritory:=Add(tiSystem,'Територія');
        AddChild(tiTeritory,'Міністерство');
        AddChild(tiTeritory,'Територія');
        AddChild(tiTeritory,'Район');
        AddChild(tiTeritory,'Рівень СЕС');
      tiDirector:=Add(tiTeritory,'Головний лікар');
        tiNazivnij:=AddChild(tiDirector,'Називний');
          AddChild(tiNazivnij,'Прізвище');
          AddChild(tiNazivnij,'Посада');
          tiPidpis:=AddChild(tiNazivnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiRodovij:=AddChild(tiDirector,'Родовий');
          AddChild(tiRodovij,'Прізвище');
          AddChild(tiRodovij,'Посада');
          tiPidpis:=AddChild(tiRodovij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiDavalnij:=AddChild(tiDirector,'Давальний');
          AddChild(tiDavalnij,'Прізвище');
          AddChild(tiDavalnij,'Посада');
          tiPidpis:=AddChild(tiDavalnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiZnahidnij:=AddChild(tiDirector,'Знахідний');
          AddChild(tiZnahidnij,'Прізвище');
          AddChild(tiZnahidnij,'Посада');
          tiPidpis:=AddChild(tiZnahidnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiOrudnij:=AddChild(tiDirector,'Орудний');
          AddChild(tiOrudnij,'Прізвище');
          AddChild(tiOrudnij,'Посада');
          tiPidpis:=AddChild(tiOrudnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiMiscevij:=AddChild(tiDirector,'Місцевий');
          AddChild(tiMiscevij,'Прізвище');
          AddChild(tiMiscevij,'Посада');
          tiPidpis:=AddChild(tiMiscevij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
      tiDirector1:=Add(tiDirector,'Заступник');
        tiNazivnij:=AddChild(tiDirector1,'Називний');
          AddChild(tiNazivnij,'Прізвище');
          AddChild(tiNazivnij,'Посада');
          tiPidpis:=AddChild(tiNazivnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiRodovij:=AddChild(tiDirector1,'Родовий');
          AddChild(tiRodovij,'Прізвище');
          AddChild(tiRodovij,'Посада');
          tiPidpis:=AddChild(tiRodovij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiDavalnij:=AddChild(tiDirector1,'Давальний');
          AddChild(tiDavalnij,'Прізвище');
          AddChild(tiDavalnij,'Посада');
          tiPidpis:=AddChild(tiDavalnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiZnahidnij:=AddChild(tiDirector1,'Знахідний');
          AddChild(tiZnahidnij,'Прізвище');
          AddChild(tiZnahidnij,'Посада');
          tiPidpis:=AddChild(tiZnahidnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiOrudnij:=AddChild(tiDirector1,'Орудний');
          AddChild(tiOrudnij,'Прізвище');
          AddChild(tiOrudnij,'Посада');
          tiPidpis:=AddChild(tiOrudnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiMiscevij:=AddChild(tiDirector1,'Місцевий');
          AddChild(tiMiscevij,'Прізвище');
          AddChild(tiMiscevij,'Посада');
          tiPidpis:=AddChild(tiMiscevij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
      tiDirector2:=Add(tiDirector1,'Виконуючий обв''язки');
        tiNazivnij:=AddChild(tiDirector2,'Називний');
          AddChild(tiNazivnij,'Прізвище');
          AddChild(tiNazivnij,'Посада');
          tiPidpis:=AddChild(tiNazivnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiRodovij:=AddChild(tiDirector2,'Родовий');
          AddChild(tiRodovij,'Прізвище');
          AddChild(tiRodovij,'Посада');
          tiPidpis:=AddChild(tiRodovij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiDavalnij:=AddChild(tiDirector2,'Давальний');
          AddChild(tiDavalnij,'Прізвище');
          AddChild(tiDavalnij,'Посада');
          tiPidpis:=AddChild(tiDavalnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiZnahidnij:=AddChild(tiDirector2,'Знахідний');
          AddChild(tiZnahidnij,'Прізвище');
          AddChild(tiZnahidnij,'Посада');
          tiPidpis:=AddChild(tiZnahidnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiOrudnij:=AddChild(tiDirector2,'Орудний');
          AddChild(tiOrudnij,'Прізвище');
          AddChild(tiOrudnij,'Посада');
          tiPidpis:=AddChild(tiOrudnij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
        tiMiscevij:=AddChild(tiDirector2,'Місцевий');
          AddChild(tiMiscevij,'Прізвище');
          AddChild(tiMiscevij,'Посада');
          tiPidpis:=AddChild(tiMiscevij,'Підпис');
            AddChild(tiPidpis,'1-а строка');
            AddChild(tiPidpis,'2-а строка');
      tiFirm:=Add(tiDirector2,'Організація');
        AddChild(tiFirm,'Адреса');
        AddChild(tiFirm,'Телефон');
        AddChild(tiFirm,'Факс');
        AddChild(tiFirm,'E-Mail');
        AddChild(tiFirm,'WWW');
        AddChild(tiFirm,'Повна назва');
        AddChild(tiFirm,'Скорочена назва');
        AddChild(tiFirm,'Скорочена назва в Р.В.');
      tiBank:=Add(tiFirm,'Банк');
        AddChild(tiBank,'Розрахунковий рахунок');
        AddChild(tiBank,'Код');
        AddChild(tiBank,'Банк');
        AddChild(tiBank,'МФО');
        AddChild(tiBank,'ОКПО');
        AddChild(tiBank,'Одержувач');
      tiOrder:=Add(tiBank,'Відділення');
        AddChild(tiOrder,'Відділення комунальної гігієни');
        AddChild(tiOrder,'Відділення гігієни харчування');
        AddChild(tiOrder,'Відділення гігієни дітей та підлітків');
        AddChild(tiOrder,'Відділення гігієни праці');
        AddChild(tiOrder,'Радіологічне відділення');
        AddChild(tiOrder,'Епідеміологічне відділення');
        AddChild(tiOrder,'Відділення медичної радіології');
      tiResult:=Add(tiOrder,'Результати');
        AddChild(tiResult,'скасувати постанову і закрити справу');
        AddChild(tiResult,'скасувати постанову і відправити справу на новий розгляд');
        AddChild(tiResult,'залишити постанову без змін, а скаргу безх задоволення');
      tiSchokvartalnij:=Add(tiResult,'Звіт');
        AddChild(tiSchokvartalnij,'за водопостачанням');
        AddChild(tiSchokvartalnij,'за охороною водойм');
        AddChild(tiSchokvartalnij,'за охороною атмосферного повітря');
        AddChild(tiSchokvartalnij,'за охороною грунту');
        AddChild(tiSchokvartalnij,'радіаційної безпеки');
        AddChild(tiSchokvartalnij,'за комунальними об"єктами');
        AddChild(tiSchokvartalnij,'за лікувально-профілактичними закладами');
        AddChild(tiSchokvartalnij,'за промисловими підприємствами');
        AddChild(tiSchokvartalnij,'за дитячими та підлітковими закладами');
        AddChild(tiSchokvartalnij,'за харчовими об"єктами');
        AddChild(tiSchokvartalnij,'за підприємствами харчової промисловості');
        AddChild(tiSchokvartalnij,'громадського харчування');
        AddChild(tiSchokvartalnij,'торгівлі');
        AddChild(tiSchokvartalnij,'за суднами');
    end;
    INIAZZ.Free;
  end;
end;

procedure TfrmChoiceVariable.aUpdateTablesListExecute(Sender: TObject);
begin
  with frmChoiceVariable do
  begin
    with qChoiceVariable do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATABLES where not DBTABLENAME is null order by TABLENAME';
      Open;
    end;
    cbTablesList.Text:='';
    cbTablesList.Items.Clear;
    qChoiceVariable.First;
    while not qChoiceVariable.Eof do
    begin
      cbTablesList.Items.Add(qChoiceVariable.FieldByName('TABLENAME').Value);
      qChoiceVariable.Next;
    end;
  end;
end;

procedure TfrmChoiceVariable.aUpdateFieldsListExecute(Sender: TObject);
var
  TableName: integer;
begin
  with frmChoiceVariable do
  begin
    with qChoiceVariable do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATABLES where TABLENAME=:TableName order by TABLENAME';
      Params.Clear;
      Params.Add;
      Params[0].Name:='TableName';
      Params[0].Value:=cbTablesList.Text;
      Open;
    end;
    if qChoiceVariable.Locate('TABLENAME',cbTablesList.Text,[]) then TableName:=qChoiceVariable.FieldByName('RECORD_ID').Value else TableName:=0;
    with qFields do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATAFIELDS where (not DBFIELDNAME is null) and TABLE_ID=:TableID order by FIELDNAME';
      Params.Clear;
      Params.Add;
      Params[0].Name:='TableID';
      Params[0].Value:=TableName;
      Open;
    end;
  end;
end;

procedure TfrmChoiceVariable.aUpdateExecute(Sender: TObject);
begin
  frmChoiceVariable.aUpdateTablesListExecute(sender);
  frmChoiceVariable.aUpdateFieldsListExecute(sender);
  frmChoiceVariable.aUpdateInitListExecute(sender);
end;

end.
