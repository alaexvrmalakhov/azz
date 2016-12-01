unit PravaKoristuvachiv;

interface

uses
  Forms, Classes, ActnList, DB, IBCustomDataSet, IBQuery, ComCtrls, Grids,
  DBGrids, StdCtrls, Controls, ExtCtrls, Dialogs;
//, SysUtils;
//  , Windows, Messages, Variants, Classes, Graphics, Controls,

type
  TfrmPravaKoristuvachiv = class(TForm)
    Panel2: TPanel;
    cbGroup: TComboBox;
    btnGroupUpdate: TButton;
    Panel3: TPanel;
    cbxVisible: TCheckBox;
    cbxEnable: TCheckBox;
    DBGrid1: TDBGrid;
    dsPravaKoristuvachiv: TDataSource;
    qPravaKoristuvachiv: TIBQuery;
    alPravaKoristuvachiv: TActionList;
    aGroupUpdate: TAction;
    tvUserWrites: TTreeView;
    aFormsUpdate: TAction;
    Splitter1: TSplitter;
    aVisibleChange: TAction;
    aEnableChange: TAction;
    aPravaKoristuvachivUpdate: TAction;
    aFormSelect: TAction;
    aUpdateUserWrites: TAction;
    pbUpdateData: TProgressBar;
    qUserWrites: TIBQuery;
    qGroups: TIBQuery;
    qVikna: TIBQuery;
    qElementiVikon: TIBQuery;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aGroupUpdateExecute(Sender: TObject);
    procedure aFormsUpdateExecute(Sender: TObject);
    procedure aVisibleChangeExecute(Sender: TObject);
    procedure aEnableChangeExecute(Sender: TObject);
    procedure aPravaKoristuvachivUpdateExecute(Sender: TObject);
    procedure aFormSelectExecute(Sender: TObject);
    procedure aUpdateUserWritesExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPravaKoristuvachiv: TfrmPravaKoristuvachiv;

implementation

uses Main;

{$R *.dfm}

procedure TfrmPravaKoristuvachiv.FormResize(Sender: TObject);
begin
  with frmPravaKoristuvachiv do
  begin
    cbGroup.Left:=4;
    cbGroup.Width:=Width-btnGroupUpdate.Width-20;
    btnGroupUpdate.Left:=cbGroup.Left+cbGroup.Width+4;
{
    cbxVisible.Left:=4;
    cbxVisible.Width:=trunc(int(Width/2)-20);
    cbxEnable.Left:=cbxVisible.Left+cbxVisible.Width+4;
    cbxEnable.Width:=trunc(int(Width/2)-20);
    pbUpdateData.Left:=4;
    pbUpdateData.Width:=Width-16;
}
  end;
end;

procedure TfrmPravaKoristuvachiv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmPravaKoristuvachiv.aGroupUpdateExecute(Sender: TObject);
begin
  with frmPravaKoristuvachiv do
  begin
    qGroups.SQL.Clear;
    qGroups.SQL.Text:='select * from GROUPS order by GROUPNAME';
    qGroups.Open;
    cbGroup.Text:='';
    cbGroup.Items.Clear;
    qGroups.First;
    while not qGroups.Eof do
    begin
      cbGroup.Items.Add(qGroups.FieldByName('GROUPNAME').Value);
      qGroups.Next;
    end;
  end;
end;

procedure TfrmPravaKoristuvachiv.aFormsUpdateExecute(Sender: TObject);
begin
  with frmPravaKoristuvachiv do
  begin
    tvUserWrites.Items.Clear;
    qGroups.SQL.Clear;
    qGroups.SQL.Text:='select * from VIKNA order by NAZVAVIKNA';
    qGroups.Open;
    qGroups.First;
    while not qGroups.Eof do
    begin
      tvUserWrites.Items.Add(nil,qGroups.FieldByName('NAZVAVIKNA').Value);
      qGroups.Next;
    end;
  end;
end;

procedure TfrmPravaKoristuvachiv.aVisibleChangeExecute(Sender: TObject);
begin
  if frmPravaKoristuvachiv.cbxVisible.Checked then frmPravaKoristuvachiv.cbxVisible.Caption:='Відображувати' else frmPravaKoristuvachiv.cbxVisible.Caption:='Скрити'
end;

procedure TfrmPravaKoristuvachiv.aEnableChangeExecute(Sender: TObject);
begin
  if frmPravaKoristuvachiv.cbxEnable.Checked then frmPravaKoristuvachiv.cbxEnable.Caption:='Заблокувати' else frmPravaKoristuvachiv.cbxEnable.Caption:='Розблокувати';
end;

procedure TfrmPravaKoristuvachiv.aPravaKoristuvachivUpdateExecute(
  Sender: TObject);
begin
  with frmPravaKoristuvachiv do
  begin
    if tvUserWrites.Items.Count<=0 then tvUserWrites.Items.Add(nil,'');
    if tvUserWrites.SelectionCount<=0 then tvUserWrites.Items.Item[0].Selected:=true;
    if cbGroup.Text='' then cbGroup.Text:=cbGroup.Items.Strings[0];
    qPravaKoristuvachiv.SQL.Clear;
    qPravaKoristuvachiv.SQL.Text:='select * from USERWRITES,GROUPS,VIKNA,ELEMENTIVIKON ';
    qPravaKoristuvachiv.SQL.Text:=qPravaKoristuvachiv.SQL.Text+'where GROUPS.GROUPNAME=:Group and USERWRITES.GROUPNAME=GROUPS.RECORD_ID ';
    qPravaKoristuvachiv.SQL.Text:=qPravaKoristuvachiv.SQL.Text+'and VIKNA.NAZVAVIKNA=:Form and USERWRITES.FORM_ID=VIKNA.RECORD_ID';
    qPravaKoristuvachiv.SQL.Text:=qPravaKoristuvachiv.SQL.Text+'order by USERWRITES.ELEMENT_ID';
    qPravaKoristuvachiv.Params.Clear;
    qPravaKoristuvachiv.Params.Add;
    qPravaKoristuvachiv.Params[0].Name:='Group';
    qPravaKoristuvachiv.Params[0].Value:=cbGroup.Text;
    qPravaKoristuvachiv.Params.Add;
    qPravaKoristuvachiv.Params[1].Name:='Form';
    qPravaKoristuvachiv.Params[1].Value:=tvUserWrites.Selected.Text;
    qPravaKoristuvachiv.Open;
  end;
end;

procedure TfrmPravaKoristuvachiv.aFormSelectExecute(Sender: TObject);
begin
  frmPravaKoristuvachiv.aPravaKoristuvachivUpdateExecute(sender);
end;

procedure TfrmPravaKoristuvachiv.aUpdateUserWritesExecute(Sender: TObject);
//var
//  GroupsCount, FormCount, ComponentCount: integer;
//  UserWritesRecID: integer;
begin
  ShowMessage('Доопрацювати');
  if MessageDlg('Увага!'+#13+'Ця операція може зайняти певний час!'+#13+'Виконувати операцію бажано безпосередньо на сервері!'+#13+'Якщо Ваш компьютер не є сервером даних програми'+#13+'рекомендовано відмовитись від виконання цієї операції!'+#13+'Ви дійсно бажаєте продовжи виконання?',mtWarning,[mbYes,mbNo],0)=mrNo then exit;
  with frmPravaKoristuvachiv do
  begin
    cbxVisible.Visible:=false;
    cbxEnable.Visible:=false;
    pbUpdateData.Visible:=true;
    pbUpdateData.Position:=0;
    pbUpdateData.Min:=0;
    pbUpdateData.Max:=0;
    qGroups.SQL.Clear;
    qGroups.SQL.Text:='select * from GROUPS order by RECORD_ID';
    qGroups.Open;
    qGroups.Last;
    qVikna.SQL.Clear;
    qVikna.SQL.Text:='select * from VIKNA order by RECORD_ID';
    qVikna.Open;
    qVikna.Last;
    qElementiVikon.SQL.Clear;
    qElementiVikon.SQL.Text:='select * from ELEMENTIVIKON order by RECORD_ID';
    qElementiVikon.Open;
    qElementiVikon.Last;
    qUserWrites.SQL.Clear;
    qUserWrites.SQL.Text:='select * from USERWRITES order by RECORD_ID';
    qUserWrites.Open;
    qUserWrites.Last;
    if qUserWrites.RecordCount<=0 then
    begin  //пустая таблица USERWRITES
      qVikna.Last;
      pbUpdateData.Visible:=true;
      pbUpdateData.Position:=0;
      pbUpdateData.Max:=qVikna.RecordCount;
      qGroups.First;
      qVikna.First;
      qElementiVikon.First;
      while not qVikna.Eof do
      begin
        while not qGroups.Eof do
        begin
          qElementiVikon.SQL.Clear;
          qElementiVikon.SQL.Text:='select * from ELEMENTIVIKON where PARENTFORM=:FormID order by RECORD_ID';
          qElementiVikon.Params.Clear;
          qElementiVikon.Params.Add;
          qElementiVikon.Params[0].Name:='FormID';
          qElementiVikon.Params[0].Value:=qVikna.FieldByName('RECORD_ID').Value;
          qElementiVikon.Open;
          while not qElementiVikon.Eof do
          begin
            qUserWrites.SQL.Clear;
            qUserWrites.SQL.Text:='insert into USERWRITES (RECORD_ID,GROUPNAME,FORM_ID,ELEMENT_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1),:GroupID,:FormID,:ElementID)';
            qUserWrites.Params.Clear;
            qUserWrites.Params.Add;
            qUserWrites.Params[0].Name:='GroupID';
            qUserWrites.Params[0].Value:=qGroups.FieldByName('RECORD_ID').Value;
            qUserWrites.Params.Add;
            qUserWrites.Params[1].Name:='FormID';
            qUserWrites.Params[1].Value:=qVikna.FieldByName('RECORD_ID').Value;
            qUserWrites.Params.Add;
            qUserWrites.Params[2].Name:='ElementID';
            qUserWrites.Params[2].Value:=qElementiVikon.FieldByName('RECORD_ID').Value;
            qUserWrites.Open;
            qElementiVikon.Next;
          end;
          qGroups.Next;
        end;
        qVikna.Next;
        pbUpdateData.Position:=pbUpdateData.Position+1;
      end;
      pbUpdateData.Visible:=false;
    end
    else
    begin  //в таблице есть данные
      qVikna.Last;
      pbUpdateData.Visible:=true;
      pbUpdateData.Position:=0;
      pbUpdateData.Max:=qVikna.RecordCount;
      qGroups.First;
      qVikna.First;
      qElementiVikon.First;
      while not qVikna.Eof do
      begin
        while not qGroups.Eof do
        begin
          qElementiVikon.SQL.Clear;
          qElementiVikon.SQL.Text:='select * from ELEMENTIVIKON where PARENTFORM=:FormID order by RECORD_ID';
          qElementiVikon.Params.Clear;
          qElementiVikon.Params.Add;
          qElementiVikon.Params[0].Name:='FormID';
          qElementiVikon.Params[0].Value:=qVikna.FieldByName('RECORD_ID').Value;
          qElementiVikon.Open;
          while not qElementiVikon.Eof do
          begin
            qUserWrites.SQL.Clear;
            qUserWrites.SQL.Text:='select * from USERWRITES where GROUPNAME=:GroupID and FORM_ID=:FormID and ELEMENT_ID=:ElementID';
            qUserWrites.Params.Clear;
            qUserWrites.Params.Add;
            qUserWrites.Params[0].Name:='GroupID';
            qUserWrites.Params[0].Value:=qGroups.FieldByName('RECORD_ID').Value;
            qUserWrites.Params.Add;
            qUserWrites.Params[1].Name:='FormID';
            qUserWrites.Params[1].Value:=qVikna.FieldByName('RECORD_ID').Value;
            qUserWrites.Params.Add;
            qUserWrites.Params[2].Name:='ElementID';
            qUserWrites.Params[2].Value:=qElementiVikon.FieldByName('RECORD_ID').Value;
            qUserWrites.Open;
            if qUserWrites.RecordCount>0 then
            begin
              qUserWrites.Next;
              Break;
            end;
            qUserWrites.SQL.Clear;
            qUserWrites.SQL.Text:='insert into USERWRITES (RECORD_ID,GROUPNAME,FORM_ID,ELEMENT_ID) values (gen_id(GET_DICTIONARIES_RECORD_ID,1),:GroupID,:FormID,:ElementID)';
            qUserWrites.Params.Clear;
            qUserWrites.Params.Add;
            qUserWrites.Params[0].Name:='GroupID';
            qUserWrites.Params[0].Value:=qGroups.FieldByName('RECORD_ID').Value;
            qUserWrites.Params.Add;
            qUserWrites.Params[1].Name:='FormID';
            qUserWrites.Params[1].Value:=qVikna.FieldByName('RECORD_ID').Value;
            qUserWrites.Params.Add;
            qUserWrites.Params[2].Name:='ElementID';
            qUserWrites.Params[2].Value:=qElementiVikon.FieldByName('RECORD_ID').Value;
            qUserWrites.Open;
            qElementiVikon.Next;
          end;
          qGroups.Next;
        end;
        qVikna.Next;
        pbUpdateData.Position:=pbUpdateData.Position+1;
      end;
      pbUpdateData.Visible:=false;
      Panel3.Align:=alBottom;
    end;
{
    qForms.SQL.Clear;
    qForms.SQL.Text:='select * from VIKNA order by RECORD_ID';
    qForms.Open;
    qForms.Last;
    pbUpdateData.Max:=qForms.RecordCount;
    qForms.First;
    while not qForms.Eof do
    begin
      qUserWrites.SQL.Clear;
      qUserWrites.SQL.Text:='select * from USERWRITES where VIKNO_ID='+IntToStr(qForms.FieldByName('RECORD_ID').Value)+' order by RECORD_ID';
      qUserWrites.Open;
      if qUserWrites.Locate('VIKNO_ID',qForms.FieldByName('RECORD_ID').Value,[]) then
      begin
        //проверка по группе пользователей
        qGroups.SQL.Clear;
        qGroups.SQL.Text:='select * from GROUPS order by RECORD_ID';
        qGroups.Open;
        qGroups.First;
      end
      else
      begin
        //если окно не найдено - однозначно добавить записи с окнами
      end;  //конец if qUserWrites.Locate('VIKNO_ID',qForms.FieldByName('RECORD_ID').Value,[])

//      qElementiVikon.SQL.Clear;
//      qElementiVikon.SQL.Text:='select * from ELEMENTIVIKON where PARENTFORM='+IntToStr(qForms.FieldByName('RECORD_ID').Value)+' order by RECORD_ID';
//      qElementiVikon.Open;
//      qElementiVikon.First;
//      while not qElementiVikon.Eof do
//      begin
//        qUserWrites.SQL.Clear;
//        qUserWrites.SQL.Text:='select * from USERWRITES where VIKNO_ID='+IntToStr(qForms.FieldByName('RECORD_ID').Value)+' and ELEMENTIVIKON_ID='+IntToStr(qElementiVikon.FieldByName('RECORD_ID').Value)+' order by RECORD_ID';
//        qUserWrites.Open;
//        qUserWrites.First;
//        if not qUserWrites.Locate('VIKNO_ID',qForms.FieldByName('RECORD_ID').Value,[]) then
//        qElementiVikon.Next;
//      end;
      qForms.Next;
      pbUpdateData.Position:=pbUpdateData.Position+1;
    end;

//    qElementiVikon.SQL.Clear;
//    qElementiVikon.SQL.Text:='select * from ELEMENTIVIKON order by RECORD_ID';
//    qElementiVikon.Open;
//    qElementiVikon.Last;
//    pbUpdateData.Max:=qElementiVikon.RecordCount;
//    qElementiVikon.First;
//
//    qGroups.SQL.Clear;
//    qGroups.SQL.Text:='select * from GROUPS order by RECORD_ID';
//    qGroups.Open;
//    qGroups.First;
//
//    qUserWrites.SQL.Clear;
//    qUserWrites.SQL.Text:='select * from USERWRITES order by RECORD_ID';
//    qUserWrites.Open;
//    qUserWrites.First;
//
//    while not qElementiVikon.Eof do
//    begin
//      qGroups.First;
//      while not qGroups.Eof do
//      begin
//        if
//          (not qUserWrites.Locate('VIKNO_ID',qElementiVikon.FieldByName('PARENTFORM').Value,[]))or
//          (not qUserWrites.Locate('ELEMENTIVIKON_ID',qElementiVikon.FieldByName('RECORD_ID').Value,[]))or
//          (not qUserWrites.Locate('GROUP_ID',qGroups.FIeldByName('RECORD_ID').Value,[]))
//        then
//        begin
//          UserWritesRecID:=0;
//          qPravaKoristuvachiv.SQL.Clear;
//          qPravaKoristuvachiv.SQL.Text:='select * from USERWRITES order by RECORD_ID';
//          qPravaKoristuvachiv.Open;
//          qPravaKoristuvachiv.Last;
//          UserWritesRecID:=qPravaKoristuvachiv.RecordCount+1;
//          if qPravaKoristuvachiv.Locate('RECORD_ID',UserWritesRecID,[]) then
//            while qPravaKoristuvachiv.Locate('RECORD_ID',UserWritesRecID,[]) do UserWritesRecID:=UserWritesRecID+1;
//          qPravaKoristuvachiv.SQL.Clear;
//          qPravaKoristuvachiv.SQL.Text:='insert into USERWRITES (RECORD_ID,GROUP_ID,VIKNO_ID,ELEMENTIVIKON_ID,VISIBL,ENABL) values (:RECORD_ID,:GROUP_ID,:VIKNO_ID,:ELEMENTIVIKON_ID,:VISIBL,:ENABL)';
//          qPravaKoristuvachiv.Params.Clear;
//          qPravaKoristuvachiv.Params.Add;
//          qPravaKoristuvachiv.Params[0].Name:='RECORD_ID';
//          qPravaKoristuvachiv.Params[0].Value:=UserWritesRecID;
//          qPravaKoristuvachiv.Params.Add;
//          qPravaKoristuvachiv.Params[1].Name:='GROUP_ID';
//          qPravaKoristuvachiv.Params[1].Value:=qGroups.FieldByName('RECORD_ID').Value;
//          qPravaKoristuvachiv.Params.Add;
//          qPravaKoristuvachiv.Params[2].Name:='VIKNO_ID';
//          qPravaKoristuvachiv.Params[2].Value:=qElementiVikon.FieldByName('PARENTFORM').Value;
//          qPravaKoristuvachiv.Params.Add;
//          qPravaKoristuvachiv.Params[3].Name:='ELEMENTIVIKON_ID';
//          qPravaKoristuvachiv.Params[3].Value:=qElementiVikon.FieldByName('RECORD_ID').Value;
//          qPravaKoristuvachiv.Params.Add;
//          qPravaKoristuvachiv.Params[4].Name:='VISIBL';
//          qPravaKoristuvachiv.Params[4].Value:=0;
//          qPravaKoristuvachiv.Params.Add;
//          qPravaKoristuvachiv.Params[5].Name:='ENABL';
//          qPravaKoristuvachiv.Params[5].Value:=0;
//          qPravaKoristuvachiv.Open;
//          frmMain.trAzz.CommitRetaining;
//       end;
//        qGroups.Next;
//      end;
//
//      qElementiVikon.Next;
//      pbUpdateData.Position:=pbUpdateData.Position+1;
//    end;

    cbxVisible.Visible:=true;
    cbxEnable.Visible:=true;
    pbUpdateData.Visible:=false;
}
  end;
end;

end.
