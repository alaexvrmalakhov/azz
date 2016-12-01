unit Initialize;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, ActnList, Menus,
  StdCtrls, Classes, Controls, ExtCtrls, ComCtrls, Dialogs, SysUtils;
//  , Graphics, Variants, Windows, Messages;

type
  TfrmInitialize = class(TForm)
    Panel1: TPanel;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnChoice: TButton;
    btnUpdate: TButton;
    btnClose: TButton;
    PopupMenu: TPopupMenu;
    alInitialize: TActionList;
    dsInitialize: TDataSource;
    DBGrid1: TDBGrid;
    qInitialize: TIBQuery;
    aAdd: TAction;
    aEdit: TAction;
    aDelete: TAction;
    aChoice: TAction;
    aUpdate: TAction;
    aClose: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    cbxTreeView: TCheckBox;
    TreeView1: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aAddExecute(Sender: TObject);
    procedure aEditExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aChoiceExecute(Sender: TObject);
    procedure aUpdateExecute(Sender: TObject);
    procedure aCloseExecute(Sender: TObject);
    procedure cbxTreeViewClick(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInitialize: TfrmInitialize;

implementation

uses Main, InitializeEdit;

{$R *.dfm}

procedure TfrmInitialize.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmInitialize.aAddExecute(Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmInitializeEdit') then frmInitializeEdit:=TfrmInitializeEdit.Create(self);
  with frmInitializeEdit do
  begin
    BorderStyle:=bsDialog;
    Caption:='Додати розділ';
    Position:=poMainFormCenter;
    Show;
    cbParent_ID.SetFocus;
  end;
end;

procedure TfrmInitialize.aEditExecute(Sender: TObject);
begin
//
end;

procedure TfrmInitialize.aDeleteExecute(Sender: TObject);
begin
//
end;

procedure TfrmInitialize.aChoiceExecute(Sender: TObject);
begin
//
end;

procedure TfrmInitialize.aUpdateExecute(Sender: TObject);
var
  Node: TTreeNode;
begin
  if frmInitialize.cbxTreeView.Checked then
  begin
    with frmInitialize.qInitialize do
    begin
      SQL.Clear;
      SQL.Text:='select * from INITIALIZE where not NAME is null and PARENT_ID=0';
      Open;
      First;
    end;
    frmInitialize.TreeView1.Items.BeginUpdate;
    frmInitialize.TreeView1.Items.Clear;
    Node:=frmInitialize.TreeView1.Items.Add(nil,frmInitialize.qInitialize.FieldByName('NAME').Value);
    frmInitialize.TreeView1.Items.AddChildObject(Node,'',nil);
    frmInitialize.qInitialize.Next;
    while not frmInitialize.qInitialize.Eof do
    begin
      Node:=frmInitialize.TreeView1.Items.Add(nil,frmInitialize.qInitialize.FieldByName('NAME').Value);
      frmInitialize.TreeView1.Items.AddChildObject(Node,'',nil);
      frmInitialize.qInitialize.Next;
    end;
    frmInitialize.TreeView1.Items.EndUpdate;
  end
  else
  begin
    with frmInitialize.qInitialize do
    begin
      SQL.Clear;
      SQL.Text:='select * from INITIALIZE where not NAME is null';
      Open;
    end;
  end;
end;

procedure TfrmInitialize.aCloseExecute(Sender: TObject);
begin
  frmInitialize.Close;
end;

procedure TfrmInitialize.cbxTreeViewClick(Sender: TObject);
begin
  if frmInitialize.cbxTreeView.Checked then
  begin
    frmInitialize.cbxTreeView.Caption:='Дерево';
    frmInitialize.TreeView1.Visible:=true;
    frmInitialize.DBGrid1.Visible:=false;
  end
  else
  begin
    frmInitialize.cbxTreeView.Caption:='Таблиця';
    frmInitialize.TreeView1.Visible:=false;
    frmInitialize.DBGrid1.Visible:=true;
  end;
  frmInitialize.aUpdateExecute(sender);
end;

procedure TfrmInitialize.TreeView1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
var
  FullPathToNode, NodeName: string;
  NodeLevel, NodeLevelsCount: integer;
  i: integer;
  ParentID: integer;
begin
  FullPathToNode:='';
  NodeName:='';
  NodeLevel:=0;
  NodeLevelsCount:=0;
  i:=0;
  if Node.getFirstChild.Data=nil then
  begin
    Node.DeleteChildren;
    FullPathToNode:=frmMain.GetPathToNode(Node,'\');
    NodeLevel:=0;
    NodeName:='';
    i:=0;
    for i:=Length(FullPathToNode) downto 1 do
      if FullPathToNode[i]='\' then Inc(NodeLevelsCount);
    for i:=1 to Length(FullPathToNode) do
      if FullPathToNode[i]<>'\' then NodeName:=NodeName+FullPathToNode[i] else halt;
  end;
end;

end.
