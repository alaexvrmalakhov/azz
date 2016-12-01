unit FieldEdit;

interface

uses
  Forms, Controls, StdCtrls, Classes, DB, IBCustomDataSet, IBQuery,
  ActnList, SysUtils, Dialogs;
//  Windows, Messages, Variants, Classes, Graphics, Controls;

type
  TfrmFieldEdit = class(TForm)
    Label1: TLabel;
    edtRecordID: TEdit;
    Label2: TLabel;
    edtTableID: TEdit;
    Label3: TLabel;
    edtFieldName: TEdit;
    Label4: TLabel;
    edtDBFieldName: TEdit;
    Label5: TLabel;
    cbDataType: TComboBox;
    btnDataTypeUpdate: TButton;
    lblDlina: TLabel;
    edtDlina: TEdit;
    lblTochnost: TLabel;
    edtTochnost: TEdit;
    lblPodtip: TLabel;
    cbPodtip: TComboBox;
    btnOK: TButton;
    btnCancel: TButton;
    alFieldEdit: TActionList;
    qFieldEdit: TIBQuery;
    aRecordIDUpdate: TAction;
    aDataTypeUpdate: TAction;
    aDataTypeChange: TAction;
    aOK: TAction;
    aCancel: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aDataTypeUpdateExecute(Sender: TObject);
    procedure aDataTypeChangeExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFieldEdit: TfrmFieldEdit;

implementation

uses Main, DataTablesEdit;

{$R *.dfm}

procedure TfrmFieldEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=false;
  frmDataTablesEdit.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmFieldEdit.aRecordIDUpdateExecute(Sender: TObject);
begin
  with frmFieldEdit.qFieldEdit do
  begin
    SQL.Clear;
    SQL.Text:='insert into DATAFIELDS (RECORD_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1))';
    Open;
    SQL.Clear;
    SQL.Text:='select * from DATAFIELDS order by RECORD_ID';
    Open;
    Last;
    frmFieldEdit.edtRecordID.Text:=IntToStr(FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmFieldEdit.aDataTypeUpdateExecute(Sender: TObject);
begin
  with frmFieldEdit.qFieldEdit do
  begin
    SQL.Clear;
    SQL.Text:='select * from DATATYPES order by DATATYPE';
    Open;
    frmFieldEdit.cbDataType.Text:='';
    frmFieldEdit.cbDataType.Items.Clear;
    First;
    while not Eof do
    begin
      frmFieldEdit.cbDataType.Items.Add(FieldByName('DATATYPE').Value);
      Next;
    end;
  end;
end;

procedure TfrmFieldEdit.aDataTypeChangeExecute(Sender: TObject);
begin
  with frmFieldEdit.qFieldEdit do
  begin
    SQL.Clear;
    SQL.Text:='select * from DATATYPES where DATATYPE=:DataType order by DATATYPE';
    Params.Clear;
    Params.Add;
    Params[0].Name:='DataType';
    Params[0].Value:=frmFieldEdit.cbDataType.Text;
    Open;
  end;
  if frmFieldEdit.qFieldEdit.Locate('DATATYPE',cbDataType.Text,[]) then
  begin
    if not frmFieldEdit.qFieldEdit.FieldByName('DLINA').IsNull then
    begin
      case frmFieldEdit.qFieldEdit.FieldByName('DLINA').Value of
        0:
          begin
            lblDlina.Visible:=false;
            edtDlina.Text:='';
            edtDlina.Visible:=false;
          end;
        1:
          begin
            lblDlina.Visible:=true;
            edtDlina.Text:='';
            edtDlina.Visible:=true;
          end;
      else
        lblDlina.Visible:=false;
        edtDlina.Text:='';
        edtDlina.Visible:=false;
      end;
    end
    else
    begin
      lblDlina.Visible:=false;
      edtDlina.Text:='';
      edtDlina.Visible:=false;
    end;

    if not frmFieldEdit.qFieldEdit.FieldByName('TOCHNOST').IsNull then
    begin
      case frmFieldEdit.qFieldEdit.FieldByName('TOCHNOST').Value of
        0:
          begin
            lblTochnost.Visible:=false;
            edtTochnost.Text:='';
            edtTochnost.Visible:=false;
          end;
        1:
          begin
            lblTochnost.Visible:=true;
            edtTochnost.Text:='';
            edtTochnost.Visible:=true;
          end;
      else
        lblTochnost.Visible:=false;
        edtTochnost.Text:='';
        edtTochnost.Visible:=false;
      end;
    end
    else
    begin
      lblTochnost.Visible:=false;
      edtTochnost.Text:='';
      edtTochnost.Visible:=false;
    end;

    if not frmFieldEdit.qFieldEdit.FieldByName('PODTIP').IsNull then
    begin
      case frmFieldEdit.qFieldEdit.FieldByName('PODTIP').Value of
        0:
          begin
            lblPodtip.Visible:=false;
            cbPodtip.Text:='';
            cbPodtip.Visible:=false;
          end;
        1:
          begin
            lblPodtip.Visible:=true;
            cbPodtip.Text:='';
            cbPodtip.Visible:=true;
          end;
      else
        lblPodtip.Visible:=false;
        cbPodtip.Text:='';
        cbPodtip.Visible:=false;
      end;
    end
    else
    begin
      lblPodtip.Visible:=false;
      cbPodtip.Text:='';
      cbPodtip.Visible:=false;
    end;


  end
  else
  begin
    aDataTypeUpdateExecute(sender);
    lblDlina.Visible:=false;
    edtDlina.Text:='';
    edtDlina.Visible:=false;
    lblTochnost.Visible:=false;
    edtTochnost.Text:='';
    edtTochnost.Visible:=false;
    lblPodtip.Visible:=false;
    cbPodtip.Text:='';
    cbPodtip.Visible:=false;
  end;
end;

procedure TfrmFieldEdit.aOKExecute(Sender: TObject);
var
  TableID,DataType,Dlina,Tochnost,Podtip: integer;
begin
  if frmFieldEdit.Caption='Видалити поле' then
  begin
    if MessageDlg('Увага!'+#13+'Видалення цього запису може призвести до помилок в роботі програми!'+#13+'Ви дійсно бажаєте видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      with frmFieldEdit.qFieldEdit do
      begin
        SQL.Clear;
        SQL.Text:='delete from DATAFIELDS where RECORD_ID=:RecordID';
        Params.Clear;
        Params.Add;
        Params[0].Name:='RecordID';
        Params[0].Value:=StrToInt(frmFieldEdit.edtRecordID.Text);
        Open;
      end;
      frmMain.trAzz.CommitRetaining;
    end;
    frmFieldEdit.Close;
    frmDataTablesEdit.aUpdateFieldsExecute(sender);
    exit;
  end;

  if frmFieldEdit.Caption='Змінити поле' then
  begin
    frmDataTablesEdit.lblDBFieldName.DataField:='';
    frmDataTablesEdit.lblDlina.DataField:='';
    frmDataTablesEdit.lblTochnost.DataField:='';
    if frmFieldEdit.edtRecordID.Text='' then
    begin
      frmFieldEdit.aRecordIDUpdateExecute(sender);
      frmFieldEdit.edtFieldName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFieldEdit.edtRecordID.Text);
    except
      frmFieldEdit.aRecordIDUpdateExecute(sender);
      frmFieldEdit.edtFieldName.SetFocus;
      exit;
    end;
    if frmFieldEdit.edtTableID.Text='' then
    begin
      frmFieldEdit.edtTableID.Text:=frmDataTablesEdit.edtDBTableName.Text;
      frmFieldEdit.edtFieldName.SetFocus;
      exit;
    end;
    if frmFieldEdit.edtDBFieldName.Text='' then
    begin
      frmFieldEdit.edtDBFieldName.SetFocus;
      exit;
    end;
    if frmFieldEdit.cbDataType.Text='' then
    begin
      frmFieldEdit.aDataTypeUpdateExecute(sender);
      frmFieldEdit.cbDataType.SetFocus;
      exit;
    end;
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATYPES where DATATYPE=:DataType order by DATATYPE';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DataType';
      Params[0].Value:=frmFieldEdit.cbDataType.Text;
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('DATATYPE',frmFieldEdit.cbDataType.Text,[]) then
    begin
      if not frmFieldEdit.qFieldEdit.FieldByName('DLINA').IsNull then
      begin
        case frmFieldEdit.qFieldEdit.FieldByName('DLINA').Value of
          0:
            begin
              frmFieldEdit.lblDlina.Visible:=false;
              frmFieldEdit.edtDlina.Text:='';
              frmFieldEdit.edtDlina.Visible:=false;
            end;
          1:
            begin
              frmFieldEdit.lblDlina.Visible:=true;
              frmFieldEdit.edtDlina.Visible:=true;
              if frmFieldEdit.edtDlina.Text='' then
              begin
                frmFieldEdit.edtDlina.SetFocus;
                exit;
              end;
              try
                StrToInt(frmFieldEdit.edtDlina.Text);
              except
                frmFieldEdit.edtDlina.SetFocus;
                exit;
              end;
            end;
        else
          begin
            frmFieldEdit.lblDlina.Visible:=false;
            frmFieldEdit.edtDlina.Text:='';
            frmFieldEdit.edtDlina.Visible:=false;
          end;
        end;
      end
      else
      begin
        frmFieldEdit.lblDlina.Visible:=false;
        frmFieldEdit.edtDlina.Text:='';
        frmFieldEdit.edtDlina.Visible:=false;
      end;

      if not frmFieldEdit.qFieldEdit.FieldByName('TOCHNOST').IsNull then
      begin
        case frmFieldEdit.qFieldEdit.FieldByName('TOCHNOST').Value of
          0:
            begin
              frmFieldEdit.lblTochnost.Visible:=false;
              frmFieldEdit.edtTochnost.Text:='';
              frmFieldEdit.edtTochnost.Visible:=false;
            end;
          1:
            begin
             frmFieldEdit.lblTochnost.Visible:=true;
             frmFieldEdit.edtTochnost.Visible:=true;
             if frmFieldEdit.edtTochnost.Text='' then
             begin
               frmFieldEdit.edtTochnost.SetFocus;
               exit;
             end;
             try
               StrToInt(frmFieldEdit.edtTochnost.Text);
             except
               frmFieldEdit.edtTochnost.SetFocus;
               exit;
             end;
           end;
        else
          begin
            frmFieldEdit.lblTochnost.Visible:=false;
            frmFieldEdit.edtTochnost.Text:='';
            frmFieldEdit.edtTochnost.Visible:=false;
          end;
        end;
      end
      else
      begin
        frmFieldEdit.lblTochnost.Visible:=false;
        frmFieldEdit.edtTochnost.Text:='';
        frmFieldEdit.edtTochnost.Visible:=false;
      end;

      if not frmFieldEdit.qFieldEdit.FieldByName('PODTIP').IsNull then
      begin
        case frmFieldEdit.qFieldEdit.FieldByName('PODTIP').Value of
          0:
            begin
              frmFieldEdit.lblPodtip.Visible:=false;
              frmFieldEdit.cbPodtip.Text:='';
              frmFieldEdit.cbPodtip.Visible:=false;
            end;
          1:
            begin
              frmFieldEdit.lblPodtip.Visible:=true;
              frmFieldEdit.cbPodtip.Visible:=true;
              if frmFieldEdit.cbPodtip.Text='' then
              begin
                frmFieldEdit.cbPodtip.SetFocus;
                exit;
              end;
              if (frmFieldEdit.cbPodtip.Text<>'Текст')and(frmFieldEdit.cbPodtip.Text<>'Двоїчний') then
              begin
                frmFieldEdit.cbPodtip.Text:='';
                frmFieldEdit.cbPodtip.SetFocus;
                exit;
              end;
            end;
        else
          begin
            frmFieldEdit.lblPodtip.Visible:=false;
            frmFieldEdit.cbPodtip.Text:='';
            frmFieldEdit.cbPodtip.Visible:=false;
          end;
        end;
      end
      else
      begin
        frmFieldEdit.lblPodtip.Visible:=false;
        frmFieldEdit.cbPodtip.Text:='';
        frmFieldEdit.cbPodtip.Visible:=false;
      end;
    end
    else
    begin
      frmFieldEdit.aDataTypeUpdateExecute(sender);
      frmFieldEdit.aDataTypeChangeExecute(sender);
    end;
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATABLES where DBTABLENAME=:DBTableName order by DBTABLENAME';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DBTableName';
      Params[0].Value:=frmFieldEdit.edtTableID.Text;
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('DBTABLENAME',frmFieldEdit.edtTableID.Text,[]) then TableID:=frmFieldEdit.qFieldEdit.FieldByName('RECORD_ID').Value else TableID:=0;
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATYPES where DATATYPE=:DataType order by DATATYPE';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DataType';
      Params[0].Value:=frmFieldEdit.cbDataType.Text;
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('DATATYPE',frmFieldEdit.cbDataType.Text,[]) then DataType:=frmFieldEdit.qFieldEdit.FieldByName('RECORD_ID').Value else DataType:=0;
    with frmDataTablesEdit.qDataFields do
    begin
      SQL.Clear;
      SQL.Text:='update DATAFIELDS set TABLE_ID=:TableID,FIELDNAME=:FieldName,DBFIELDNAME=:DBFieldName,DATATYPE=:DataType,DLINA=:Dlina,TOCHNOST=:Tochnost,PODTIP=:Podtip where RECORD_ID=:RecordID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='TableID';
      Params[0].Value:=TableID;
      Params.Add;
      Params[1].Name:='FieldName';
      Params[1].Value:=frmFieldEdit.edtFieldName.Text;
      Params.Add;
      Params[2].Name:='DBFieldName';
      Params[2].Value:=frmFieldEdit.edtDBFieldName.Text;
      Params.Add;
      Params[3].Name:='DataType';
      Params[3].Value:=DataType;
      Params.Add;
      Params[4].Name:='Dlina';
      if frmFieldEdit.edtDlina.Visible then Params[4].Value:=StrToInt(frmFieldEdit.edtDlina.Text) else Params[4].Value:='';
      Params.Add;
      Params[5].Name:='Tochnost';
      if frmFieldEdit.edtTochnost.Visible then Params[5].Value:=StrToInt(frmFieldEdit.edtTochnost.Text) else Params[5].Value:='';
      Params.Add;
      Params[6].Name:='Podtip';
      if frmFieldEdit.cbPodtip.Text='Текст' then Params[6].Value:=0;
      if frmFieldEdit.cbPodtip.Text='Двоїчний' then Params[6].Value:=1;
      Params.Add;
      Params[7].Name:='RecordID';
      Params[7].Value:=StrToInt(frmFieldEdit.edtRecordID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmFieldEdit.Close;
    frmDataTablesEdit.aUpdateFieldsExecute(sender);
    frmDataTablesEdit.lblDBFieldName.DataField:='DBFIELDNAME';
    frmDataTablesEdit.lblDlina.DataField:='DLINA';
    frmDataTablesEdit.lblTochnost.DataField:='TOCHNOST';
    exit;
  end;

  if frmFieldEdit.Caption='Додати поле' then
  begin
    frmDataTablesEdit.lblDBFieldName.DataField:='';
    frmDataTablesEdit.lblDlina.DataField:='';
    frmDataTablesEdit.lblTochnost.DataField:='';
    if frmFieldEdit.edtRecordID.Text='' then
    begin
      frmFieldEdit.aRecordIDUpdateExecute(sender);
      frmFieldEdit.edtFieldName.SetFocus;
      exit;
    end;
    try
      StrToInt(frmFieldEdit.edtRecordID.Text);
    except
      frmFieldEdit.aRecordIDUpdateExecute(sender);
      frmFieldEdit.edtFieldName.SetFocus;
      exit;
    end;
    if frmFieldEdit.edtTableID.Text='' then
    begin
      frmFieldEdit.edtTableID.Text:=frmDataTablesEdit.edtDBTableName.Text;
      frmFieldEdit.edtFieldName.SetFocus;
      exit;
    end;
    if frmFieldEdit.edtDBFieldName.Text='' then
    begin
      frmFieldEdit.edtDBFieldName.SetFocus;
      exit;
    end;
    if frmFieldEdit.cbDataType.Text='' then
    begin
      frmFieldEdit.aDataTypeUpdateExecute(sender);
      frmFieldEdit.cbDataType.SetFocus;
      exit;
    end;
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATYPES where DATATYPE=:DataType order by DATATYPE';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DataType';
      Params[0].Value:=frmFieldEdit.cbDataType.Text;
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('DATATYPE',frmFieldEdit.cbDataType.Text,[]) then
    begin
      if not frmFieldEdit.qFieldEdit.FieldByName('DLINA').IsNull then
      begin
        case frmFieldEdit.qFieldEdit.FieldByName('DLINA').Value of
          0:
            begin
              frmFieldEdit.lblDlina.Visible:=false;
              frmFieldEdit.edtDlina.Text:='';
              frmFieldEdit.edtDlina.Visible:=false;
            end;
          1:
            begin
              frmFieldEdit.lblDlina.Visible:=true;
              frmFieldEdit.edtDlina.Visible:=true;
              if frmFieldEdit.edtDlina.Text='' then
              begin
                frmFieldEdit.edtDlina.SetFocus;
                exit;
              end;
              try
                StrToInt(frmFieldEdit.edtDlina.Text);
              except
                frmFieldEdit.edtDlina.SetFocus;
                exit;
              end;
            end;
        else
          begin
            frmFieldEdit.lblDlina.Visible:=false;
            frmFieldEdit.edtDlina.Text:='';
            frmFieldEdit.edtDlina.Visible:=false;
          end;
        end;
      end
      else
      begin
        frmFieldEdit.lblDlina.Visible:=false;
        frmFieldEdit.edtDlina.Text:='';
        frmFieldEdit.edtDlina.Visible:=false;
      end;

      if not frmFieldEdit.qFieldEdit.FieldByName('TOCHNOST').IsNull then
      begin
        case frmFieldEdit.qFieldEdit.FieldByName('TOCHNOST').Value of
          0:
            begin
              frmFieldEdit.lblTochnost.Visible:=false;
              frmFieldEdit.edtTochnost.Text:='';
              frmFieldEdit.edtTochnost.Visible:=false;
            end;
          1:
            begin
             frmFieldEdit.lblTochnost.Visible:=true;
             frmFieldEdit.edtTochnost.Visible:=true;
             if frmFieldEdit.edtTochnost.Text='' then
             begin
               frmFieldEdit.edtTochnost.SetFocus;
               exit;
             end;
             try
               StrToInt(frmFieldEdit.edtTochnost.Text);
             except
               frmFieldEdit.edtTochnost.SetFocus;
               exit;
             end;
           end;
        else
          begin
            frmFieldEdit.lblTochnost.Visible:=false;
            frmFieldEdit.edtTochnost.Text:='';
            frmFieldEdit.edtTochnost.Visible:=false;
          end;
        end;
      end
      else
      begin
        frmFieldEdit.lblTochnost.Visible:=false;
        frmFieldEdit.edtTochnost.Text:='';
        frmFieldEdit.edtTochnost.Visible:=false;
      end;

      if not frmFieldEdit.qFieldEdit.FieldByName('PODTIP').IsNull then
      begin
        case frmFieldEdit.qFieldEdit.FieldByName('PODTIP').Value of
          0:
            begin
              frmFieldEdit.lblPodtip.Visible:=false;
              frmFieldEdit.cbPodtip.Text:='';
              frmFieldEdit.cbPodtip.Visible:=false;
            end;
          1:
            begin
              frmFieldEdit.lblPodtip.Visible:=true;
              frmFieldEdit.cbPodtip.Visible:=true;
              if frmFieldEdit.cbPodtip.Text='' then
              begin
                frmFieldEdit.cbPodtip.SetFocus;
                exit;
              end;
              if (frmFieldEdit.cbPodtip.Text<>'Текст')and(frmFieldEdit.cbPodtip.Text<>'Двоїчний') then
              begin
                frmFieldEdit.cbPodtip.Text:='';
                frmFieldEdit.cbPodtip.SetFocus;
                exit;
              end;
            end;
        else
          begin
            frmFieldEdit.lblPodtip.Visible:=false;
            frmFieldEdit.cbPodtip.Text:='';
            frmFieldEdit.cbPodtip.Visible:=false;
          end;
        end;
      end
      else
      begin
        frmFieldEdit.lblPodtip.Visible:=false;
        frmFieldEdit.cbPodtip.Text:='';
        frmFieldEdit.cbPodtip.Visible:=false;
      end;
    end
    else
    begin
      frmFieldEdit.aDataTypeUpdateExecute(sender);
      frmFieldEdit.aDataTypeChangeExecute(sender);
    end;
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATABLES where DBTABLENAME=:DBTableName order by DBTABLENAME';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DBTableName';
      Params[0].Value:=frmFieldEdit.edtTableID.Text;
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('DBTABLENAME',frmFieldEdit.edtTableID.Text,[]) then TableID:=frmFieldEdit.qFieldEdit.FieldByName('RECORD_ID').Value else TableID:=0;
    with frmFieldEdit.qFieldEdit do
    begin
      SQL.Clear;
      SQL.Text:='select * from DATATYPES where DATATYPE=:DataType order by DATATYPE';
      Params.Clear;
      Params.Add;
      Params[0].Name:='DataType';
      Params[0].Value:=frmFieldEdit.cbDataType.Text;
      Open;
    end;
    if frmFieldEdit.qFieldEdit.Locate('DATATYPE',frmFieldEdit.cbDataType.Text,[]) then DataType:=frmFieldEdit.qFieldEdit.FieldByName('RECORD_ID').Value else DataType:=0;
    with frmDataTablesEdit.qDataFields do
    begin
      SQL.Clear;
      SQL.Text:='update DATAFIELDS set TABLE_ID=:TableID,FIELDNAME=:FieldName,DBFIELDNAME=:DBFieldName,DATATYPE=:DataType,DLINA=:Dlina,TOCHNOST=:Tochnost,PODTIP=:Podtip where RECORD_ID=:RecordID';
      Params.Clear;
      Params.Add;
      Params[0].Name:='TableID';
      Params[0].Value:=TableID;
      Params.Add;
      Params[1].Name:='FieldName';
      Params[1].Value:=frmFieldEdit.edtFieldName.Text;
      Params.Add;
      Params[2].Name:='DBFieldName';
      Params[2].Value:=frmFieldEdit.edtDBFieldName.Text;
      Params.Add;
      Params[3].Name:='DataType';
      Params[3].Value:=DataType;
      Params.Add;
      Params[4].Name:='Dlina';
      if frmFieldEdit.edtDlina.Visible then Params[4].Value:=StrToInt(frmFieldEdit.edtDlina.Text) else Params[4].Value:='';
      Params.Add;
      Params[5].Name:='Tochnost';
      if frmFieldEdit.edtTochnost.Visible then Params[5].Value:=StrToInt(frmFieldEdit.edtTochnost.Text) else Params[5].Value:='';
      Params.Add;
      Params[6].Name:='Podtip';
      if frmFieldEdit.cbPodtip.Text='Текст' then Params[6].Value:=0;
      if frmFieldEdit.cbPodtip.Text='Двоїчний' then Params[6].Value:=1;
      Params.Add;
      Params[7].Name:='RecordID';
      Params[7].Value:=StrToInt(frmFieldEdit.edtRecordID.Text);
      Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmFieldEdit.Close;
    frmDataTablesEdit.aUpdateFieldsExecute(sender);
    frmDataTablesEdit.lblDBFieldName.DataField:='DBFIELDNAME';
    frmDataTablesEdit.lblDlina.DataField:='DLINA';
    frmDataTablesEdit.lblTochnost.DataField:='TOCHNOST';
    exit;
  end;
end;

procedure TfrmFieldEdit.aCancelExecute(Sender: TObject);
begin
  frmFieldEdit.Close;
end;

end.
