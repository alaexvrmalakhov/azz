unit PrintForm;

interface

uses
  Forms, ActnList, StdCtrls, Classes, Controls, DB, IBCustomDataSet,
  IBQuery;
//  Windows, Messages, SysUtils, Variants, Graphics, Dialogs;

type
  TfrmPrintForm = class(TForm)
    cbReportList: TComboBox;
    btnUpdateReportList: TButton;
    btnChoiceReportList: TButton;
    alPrint: TActionList;
    btnPrint: TButton;
    btnCancel: TButton;
    qPrint: TIBQuery;
    aUpdateReportList: TAction;
    aChoiceReportList: TAction;
    aPrint: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aUpdateReportListExecute(Sender: TObject);
    procedure aChoiceReportListExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintForm: TfrmPrintForm;

implementation

uses Main;

{$R *.dfm}

procedure TfrmPrintForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmPrintForm.aUpdateReportListExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrintForm.aChoiceReportListExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrintForm.aPrintExecute(Sender: TObject);
begin
//
end;

procedure TfrmPrintForm.aCancelExecute(Sender: TObject);
begin
  frmPrintForm.Close;
end;

end.
