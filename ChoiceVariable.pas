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
                MessageDlg('�����!'+#13+'�� ������� ������� �����������!'+#13+'������� �������.',mtError,[mbOK],0);
                exit;
              end;
            1:
              begin
//                if frmChoiceVariable.tvInit.Items.Item[StrToInt(frmRerpotParamEdit.edtFormula.Text)].HasChildren then
                ShowMessage(frmRerpotParamEdit.edtFormula.Text);
//                if frmChoiceVariable.tvInit.Items.Item[StrToInt(frmRerpotParamEdit.edtFormula.Text)].HasChildren then
                if frmChoiceVariable.tvInit.Items.Item[i].HasChildren then
                begin
                  MessageDlg('�����!'+#13+'�� ������� ������� �����������!'+#13+'������� �������.',mtError,[mbOK],0);
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
      tiSystem:=Add(nil,'�������');
        AddChild(tiSystem,'������� �������');
        AddChild(tiSystem,'г�');
        AddChild(tiSystem,'��������� �����');
        AddChild(tiSystem,'������ ��������');
        AddChild(tiSystem,'�������� ����� ������������');
        AddChild(tiSystem,'����');
        AddChild(tiSystem,'���� �� �������');
      tiTeritory:=Add(tiSystem,'��������');
        AddChild(tiTeritory,'̳���������');
        AddChild(tiTeritory,'��������');
        AddChild(tiTeritory,'�����');
        AddChild(tiTeritory,'г���� ���');
      tiDirector:=Add(tiTeritory,'�������� ����');
        tiNazivnij:=AddChild(tiDirector,'��������');
          AddChild(tiNazivnij,'�������');
          AddChild(tiNazivnij,'������');
          tiPidpis:=AddChild(tiNazivnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiRodovij:=AddChild(tiDirector,'�������');
          AddChild(tiRodovij,'�������');
          AddChild(tiRodovij,'������');
          tiPidpis:=AddChild(tiRodovij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiDavalnij:=AddChild(tiDirector,'���������');
          AddChild(tiDavalnij,'�������');
          AddChild(tiDavalnij,'������');
          tiPidpis:=AddChild(tiDavalnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiZnahidnij:=AddChild(tiDirector,'���������');
          AddChild(tiZnahidnij,'�������');
          AddChild(tiZnahidnij,'������');
          tiPidpis:=AddChild(tiZnahidnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiOrudnij:=AddChild(tiDirector,'�������');
          AddChild(tiOrudnij,'�������');
          AddChild(tiOrudnij,'������');
          tiPidpis:=AddChild(tiOrudnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiMiscevij:=AddChild(tiDirector,'̳������');
          AddChild(tiMiscevij,'�������');
          AddChild(tiMiscevij,'������');
          tiPidpis:=AddChild(tiMiscevij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
      tiDirector1:=Add(tiDirector,'���������');
        tiNazivnij:=AddChild(tiDirector1,'��������');
          AddChild(tiNazivnij,'�������');
          AddChild(tiNazivnij,'������');
          tiPidpis:=AddChild(tiNazivnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiRodovij:=AddChild(tiDirector1,'�������');
          AddChild(tiRodovij,'�������');
          AddChild(tiRodovij,'������');
          tiPidpis:=AddChild(tiRodovij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiDavalnij:=AddChild(tiDirector1,'���������');
          AddChild(tiDavalnij,'�������');
          AddChild(tiDavalnij,'������');
          tiPidpis:=AddChild(tiDavalnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiZnahidnij:=AddChild(tiDirector1,'���������');
          AddChild(tiZnahidnij,'�������');
          AddChild(tiZnahidnij,'������');
          tiPidpis:=AddChild(tiZnahidnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiOrudnij:=AddChild(tiDirector1,'�������');
          AddChild(tiOrudnij,'�������');
          AddChild(tiOrudnij,'������');
          tiPidpis:=AddChild(tiOrudnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiMiscevij:=AddChild(tiDirector1,'̳������');
          AddChild(tiMiscevij,'�������');
          AddChild(tiMiscevij,'������');
          tiPidpis:=AddChild(tiMiscevij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
      tiDirector2:=Add(tiDirector1,'���������� ���''����');
        tiNazivnij:=AddChild(tiDirector2,'��������');
          AddChild(tiNazivnij,'�������');
          AddChild(tiNazivnij,'������');
          tiPidpis:=AddChild(tiNazivnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiRodovij:=AddChild(tiDirector2,'�������');
          AddChild(tiRodovij,'�������');
          AddChild(tiRodovij,'������');
          tiPidpis:=AddChild(tiRodovij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiDavalnij:=AddChild(tiDirector2,'���������');
          AddChild(tiDavalnij,'�������');
          AddChild(tiDavalnij,'������');
          tiPidpis:=AddChild(tiDavalnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiZnahidnij:=AddChild(tiDirector2,'���������');
          AddChild(tiZnahidnij,'�������');
          AddChild(tiZnahidnij,'������');
          tiPidpis:=AddChild(tiZnahidnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiOrudnij:=AddChild(tiDirector2,'�������');
          AddChild(tiOrudnij,'�������');
          AddChild(tiOrudnij,'������');
          tiPidpis:=AddChild(tiOrudnij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
        tiMiscevij:=AddChild(tiDirector2,'̳������');
          AddChild(tiMiscevij,'�������');
          AddChild(tiMiscevij,'������');
          tiPidpis:=AddChild(tiMiscevij,'ϳ����');
            AddChild(tiPidpis,'1-� ������');
            AddChild(tiPidpis,'2-� ������');
      tiFirm:=Add(tiDirector2,'����������');
        AddChild(tiFirm,'������');
        AddChild(tiFirm,'�������');
        AddChild(tiFirm,'����');
        AddChild(tiFirm,'E-Mail');
        AddChild(tiFirm,'WWW');
        AddChild(tiFirm,'����� �����');
        AddChild(tiFirm,'��������� �����');
        AddChild(tiFirm,'��������� ����� � �.�.');
      tiBank:=Add(tiFirm,'����');
        AddChild(tiBank,'������������� �������');
        AddChild(tiBank,'���');
        AddChild(tiBank,'����');
        AddChild(tiBank,'���');
        AddChild(tiBank,'����');
        AddChild(tiBank,'���������');
      tiOrder:=Add(tiBank,'³�������');
        AddChild(tiOrder,'³������� ���������� �㳺��');
        AddChild(tiOrder,'³������� �㳺�� ����������');
        AddChild(tiOrder,'³������� �㳺�� ���� �� ������');
        AddChild(tiOrder,'³������� �㳺�� �����');
        AddChild(tiOrder,'���������� ��������');
        AddChild(tiOrder,'������������ ��������');
        AddChild(tiOrder,'³������� ������� ������㳿');
      tiResult:=Add(tiOrder,'����������');
        AddChild(tiResult,'��������� ��������� � ������� ������');
        AddChild(tiResult,'��������� ��������� � ��������� ������ �� ����� �������');
        AddChild(tiResult,'�������� ��������� ��� ���, � ������ ���� �����������');
      tiSchokvartalnij:=Add(tiResult,'���');
        AddChild(tiSchokvartalnij,'�� ���������������');
        AddChild(tiSchokvartalnij,'�� �������� ������');
        AddChild(tiSchokvartalnij,'�� �������� ������������ ������');
        AddChild(tiSchokvartalnij,'�� �������� ������');
        AddChild(tiSchokvartalnij,'��������� �������');
        AddChild(tiSchokvartalnij,'�� ������������ ��"������');
        AddChild(tiSchokvartalnij,'�� ���������-��������������� ���������');
        AddChild(tiSchokvartalnij,'�� ������������ ������������');
        AddChild(tiSchokvartalnij,'�� �������� �� ���������� ���������');
        AddChild(tiSchokvartalnij,'�� ��������� ��"������');
        AddChild(tiSchokvartalnij,'�� ������������ ������� ������������');
        AddChild(tiSchokvartalnij,'������������ ����������');
        AddChild(tiSchokvartalnij,'������');
        AddChild(tiSchokvartalnij,'�� �������');
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
