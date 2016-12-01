unit InitializeEdit;

interface

uses
  Forms, StdCtrls, Controls, DB, IBCustomDataSet, IBQuery, Classes,
  ActnList;
//  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Dialogs;

type
  TfrmInitializeEdit = class(TForm)
    alInitializeEdit: TActionList;
    qInitializeEdit: TIBQuery;
    Label1: TLabel;
    edtRecord_ID: TEdit;
    Label2: TLabel;
    cbParent_ID: TComboBox;
    btnParentIDUpdate: TButton;
    btnParentIDChoice: TButton;
    Label3: TLabel;
    edtName: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    lblParentID: TLabel;
    Label4: TLabel;
    edtLevel: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInitializeEdit: TfrmInitializeEdit;

implementation

uses Main;

{$R *.dfm}

procedure TfrmInitializeEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

end.
