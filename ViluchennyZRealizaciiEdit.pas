unit ViluchennyZRealizaciiEdit;

interface

uses
  Forms, DB, IBCustomDataSet, IBQuery, Classes, ActnList, StdCtrls, Grids,
  DBGrids, ComCtrls, Controls, ExtCtrls, SysUtils, IniFiles, Dialogs, DateUtils;

type
  TfrmViluchennyZRealizaciiEdit = class(TForm)
    btnVikonati: TButton;
    btnVidminiti: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edtNomerPostanovi: TEdit;
    btnNomerPostanovi: TButton;
    dtpDataPostanovi: TDateTimePicker;
    edtDodatkovaInformaciy: TEdit;
    Panel2: TPanel;
    rgAkt_Dovidka: TRadioGroup;
    lblData: TLabel;
    lblNomer: TLabel;
    dtpData: TDateTimePicker;
    edtNomer: TEdit;
    dtpDataDo: TDateTimePicker;
    cbMinistry: TComboBox;
    cbTeritory: TComboBox;
    cbDistrict: TComboBox;
    Label8: TLabel;
    edtRecordID: TEdit;
    alViluchennyZRealizaciiEdit: TActionList;
    aRecordIDUpdate: TAction;
    qRecordID: TIBQuery;
    aNomerPostanoviUpdate: TAction;
    aAkt_Dovidka_Update: TAction;
    pcViluchennyZRealizacii: TPageControl;
    tsVidomostiProObjekt: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtNajmenuvannyObjektu: TEdit;
    edtVidomchaPidporydkovanist: TEdit;
    btnVidomchaPidporydkovanist: TButton;
    edtAdresa: TEdit;
    edtPIBKerivnika: TEdit;
    edtPosada: TEdit;
    btnVidomostiProObjekt: TButton;
    aVidomchaPidporydkovanistChoice: TAction;
    aVidomostiProObjektChoice: TAction;
    tsVidomostiProPereviryjuchogo: TTabSheet;
    tsVidomostiProViluchenny: TTabSheet;
    tsLaboratornijKontrol: TTabSheet;
    tsZmistPostanovi: TTabSheet;
    GroupBox1: TGroupBox;
    memVstanoviv: TMemo;
    btnVstanoviv: TButton;
    aVstanovivUpdate: TAction;
    GroupBox2: TGroupBox;
    btnNeVidpovidajut: TButton;
    memNeVidpovidajut: TMemo;
    aNeVidpovidajutChoice: TAction;
    Label3: TLabel;
    edtViluchiti: TEdit;
    btnViluchiti: TButton;
    aViluchitiUpdate: TAction;
    Label4: TLabel;
    dtpDataViluchenny: TDateTimePicker;
    Label15: TLabel;
    edtChasViluchenny: TEdit;
    Label16: TLabel;
    cbOsobaSES: TComboBox;
    btnOsobaSES_Update: TButton;
    btnOsobaSES_Choice: TButton;
    Label17: TLabel;
    cbViddilSES: TComboBox;
    btnViddilSES_Update: TButton;
    btnViddilSES_Choice: TButton;
    Label18: TLabel;
    cbPosadaSES: TComboBox;
    btnPosadaSES_Update: TButton;
    btnPosadaSES_Choice: TButton;
    aOsobaSES_Update: TAction;
    aOsobaSES_Choice: TAction;
    aOsobaSES_Change: TAction;
    aViddilSES_Udpate: TAction;
    aViddilSES_Choice: TAction;
    aPosadaSES_Update: TAction;
    aPosadaSES_Choice: TAction;
    Label19: TLabel;
    cbTipProdukcii: TComboBox;
    btnTipProdukcii_Update: TButton;
    btnTipProdukcii_Choice: TButton;
    Label20: TLabel;
    cbRozdil_T23_F18: TComboBox;
    btnRozdil_T23_F18_Update: TButton;
    btnRozdil_T23_F18_Choice: TButton;
    Label21: TLabel;
    cbTipPostanovi: TComboBox;
    btnTipPostanovi_Update: TButton;
    btnTipPostanovi_Choice: TButton;
    Label22: TLabel;
    edtYear: TEdit;
    btnYear: TButton;
    aTipProdukcii_Update: TAction;
    aTipProdukcii_Choice: TAction;
    aRozdil_T23_F18_Update: TAction;
    aRozdil_T23_F18_Choice: TAction;
    aTipPostanovi_Update: TAction;
    aTipPostanovi_Choice: TAction;
    aYearUpdate: TAction;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    btnAddViluchenny: TButton;
    btnEditViluchenny: TButton;
    btnDeleteViluchenny: TButton;
    btnUpdateViluchenny: TButton;
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    Panel5: TPanel;
    btnAddLaboratory: TButton;
    btnEditLaboratory: TButton;
    btnDeleteLaboratory: TButton;
    btnUpdateLaboratory: TButton;
    DBGrid2: TDBGrid;
    aAddViluchenny: TAction;
    aEditViluchenny: TAction;
    aDeleteViluchenny: TAction;
    aUpdateViluchenny: TAction;
    rgVstanoviv: TRadioGroup;
    aVstanoviv_Update: TAction;
    aAddLaboratory: TAction;
    aEditLaboratory: TAction;
    aDeleteLaboratory: TAction;
    aUpdateLaboratory: TAction;
    dtpTerminRealizacii: TDateTimePicker;
    dsVidomostiProViluchenny: TDataSource;
    qVidomostiProViluchenny: TIBQuery;
    dsLaboratornijKontrol: TDataSource;
    qLaboratornijKontrol: TIBQuery;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    edtPosadaGDSL: TEdit;
    edtPIBGDSL: TEdit;
    btnGDSL: TButton;
    aPIB_Posada_GDSL: TAction;
    aCancel: TAction;
    aOK: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aRecordIDUpdateExecute(Sender: TObject);
    procedure aNomerPostanoviUpdateExecute(Sender: TObject);
    procedure aAkt_Dovidka_UpdateExecute(Sender: TObject);
    procedure aVidomchaPidporydkovanistChoiceExecute(Sender: TObject);
    procedure aVidomostiProObjektChoiceExecute(Sender: TObject);
    procedure aVstanovivUpdateExecute(Sender: TObject);
    procedure aNeVidpovidajutChoiceExecute(Sender: TObject);
    procedure aViluchitiUpdateExecute(Sender: TObject);
    procedure aOsobaSES_UpdateExecute(Sender: TObject);
    procedure aOsobaSES_ChoiceExecute(Sender: TObject);
    procedure aOsobaSES_ChangeExecute(Sender: TObject);
    procedure aViddilSES_UdpateExecute(Sender: TObject);
    procedure aViddilSES_ChoiceExecute(Sender: TObject);
    procedure aPosadaSES_UpdateExecute(Sender: TObject);
    procedure aPosadaSES_ChoiceExecute(Sender: TObject);
    procedure aTipProdukcii_ChoiceExecute(Sender: TObject);
    procedure aTipProdukcii_UpdateExecute(Sender: TObject);
    procedure aRozdil_T23_F18_UpdateExecute(Sender: TObject);
    procedure aRozdil_T23_F18_ChoiceExecute(Sender: TObject);
    procedure aTipPostanovi_UpdateExecute(Sender: TObject);
    procedure aTipPostanovi_ChoiceExecute(Sender: TObject);
    procedure aYearUpdateExecute(Sender: TObject);
    procedure aAddViluchennyExecute(Sender: TObject);
    procedure aEditViluchennyExecute(Sender: TObject);
    procedure aDeleteViluchennyExecute(Sender: TObject);
    procedure aUpdateViluchennyExecute(Sender: TObject);
    procedure aVstanoviv_UpdateExecute(Sender: TObject);
    procedure aAddLaboratoryExecute(Sender: TObject);
    procedure aEditLaboratoryExecute(Sender: TObject);
    procedure aDeleteLaboratoryExecute(Sender: TObject);
    procedure aUpdateLaboratoryExecute(Sender: TObject);
    procedure edtNomerPostanoviExit(Sender: TObject);
    procedure dtpDataPostanoviExit(Sender: TObject);
    procedure aPIB_Posada_GDSLExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
  end;

var
  frmViluchennyZRealizaciiEdit: TfrmViluchennyZRealizaciiEdit;

implementation

uses
  Main, VidomchaPidporydkovanist, Objekti, ViluchennyZRealizacii, Statti,
  Spivrobitniki, Viddilenny, Posadi, TipiProdukcii, Rozdil_T23_F18,
  TipiShtrafiv, VidomostiProViluchenny, LaboratornijKontrol;

{$R *.dfm}

procedure TfrmViluchennyZRealizaciiEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Enabled:=true;
  Action:=caFree;
end;

procedure TfrmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='insert into VILUCHENNY_Z_REALIZACII (RECORD_ID) values (gen_id(GET_VILUCHENNY_RECORD_ID,1))';
    qRecordID.Open;
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII order by RECORD_ID';
    qRecordID.Open;
    qRecordID.Last;
    edtRecordID.Text:=IntToStr(qRecordID.FieldByName('RECORD_ID').Value);
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from VILUCHENNY_Z_REALIZACII,RAJONI where RAJONI.RAJON=:Rajon and VILUCHENNY_Z_REALIZACII.DISTRICT=RAJONI.KOD and YEAR_=:Rik order by NOMER_POSTANOVI';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Params.Add;
    qRecordID.Params[1].Name:='Rik';
    qRecordID.Params[1].Value:=frmViluchennyZRealizacii.udYear.Position;
    qRecordID.Open;
    qRecordID.Last;
    edtNomerPostanovi.Text:=IntToStr(qRecordID.RecordCount+1);
    if qRecordID.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[]) then
      while qRecordID.Locate('NOMER_POSTANOVI',StrToInt(edtNomerPostanovi.Text),[]) do edtNomerPostanovi.Text:=IntToStr(StrToInt(edtNomerPostanovi.Text)+1);
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aAkt_Dovidka_UpdateExecute(
  Sender: TObject);
begin
  case frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex of
   -1:
     begin
       frmViluchennyZRealizaciiEdit.lblData.Visible:=false;
       frmViluchennyZRealizaciiEdit.dtpData.Visible:=false;
       frmViluchennyZRealizaciiEdit.dtpDataDo.Visible:=false;
       frmViluchennyZRealizaciiEdit.lblNomer.Visible:=false;
       frmViluchennyZRealizaciiEdit.edtNomer.Visible:=false;
     end;
    0:  //інформ. довідка
     begin
       frmViluchennyZRealizaciiEdit.lblData.Visible:=true;
       frmViluchennyZRealizaciiEdit.dtpData.Visible:=true;
       frmViluchennyZRealizaciiEdit.dtpDataDo.Visible:=false;
       frmViluchennyZRealizaciiEdit.lblNomer.Visible:=false;
       frmViluchennyZRealizaciiEdit.edtNomer.Visible:=false;
       if frmViluchennyZRealizaciiEdit.Caption='Додавання запису' then
       begin
         frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=true;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=true;
         frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=true;
       end;
       if frmViluchennyZRealizaciiEdit.Caption='Редагування запису' then
       begin
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpData.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) else frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtNomer.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value else frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=true;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=true;
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=true;
       end;
       if frmViluchennyZRealizaciiEdit.Caption='Видалення запису' then
       begin
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpData.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) else frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtNomer.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value else frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=false;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=false;
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=false;
       end;
     end;
    1:
     begin
       frmViluchennyZRealizaciiEdit.lblData.Visible:=true;
       frmViluchennyZRealizaciiEdit.dtpData.Visible:=true;
       frmViluchennyZRealizaciiEdit.dtpDataDo.Visible:=false;
       frmViluchennyZRealizaciiEdit.lblNomer.Visible:=true;
       frmViluchennyZRealizaciiEdit.edtNomer.Visible:=true;
       if frmViluchennyZRealizaciiEdit.Caption='Додавання запису' then
       begin
         frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=true;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=true;
         frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=true;
       end;
       if frmViluchennyZRealizaciiEdit.Caption='Редагування запису' then
       begin
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpData.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) else frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtNomer.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value else frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=true;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=true;
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=true;
       end;
       if frmViluchennyZRealizaciiEdit.Caption='Видалення запису' then
       begin
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpData.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) else frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtNomer.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value else frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=false;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=false;
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=false;
       end;
     end;
    2:
     begin
       frmViluchennyZRealizaciiEdit.lblData.Visible:=true;
       frmViluchennyZRealizaciiEdit.dtpData.Visible:=true;
       frmViluchennyZRealizaciiEdit.dtpDataDo.Visible:=true;
       frmViluchennyZRealizaciiEdit.lblNomer.Visible:=true;
       frmViluchennyZRealizaciiEdit.edtNomer.Visible:=true;
       if frmViluchennyZRealizaciiEdit.Caption='Додавання запису' then
       begin
         frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=true;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=true;
         frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=true;
       end;
       if frmViluchennyZRealizaciiEdit.Caption='Редагування запису' then
       begin
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpData.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) else frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtNomer.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value else frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=true;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=true;
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=true;
       end;
       if frmViluchennyZRealizaciiEdit.Caption='Видалення запису' then
       begin
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.dtpData.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY').Value) else frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').IsNull then frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('DATA_AKTU_OBSTEZHENNY_DO').Value) else frmViluchennyZRealizaciiEdit.dtpDataDo.Date:=int(date);
         if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').IsNull then frmViluchennyZRealizaciiEdit.edtNomer.Text:=frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('NOMER_AKTU_OBSTEZHENNY').Value else frmViluchennyZRealizaciiEdit.edtNomer.Text:='';
         frmViluchennyZRealizaciiEdit.dtpData.Enabled:=false;
         frmViluchennyZRealizaciiEdit.dtpDataDo.Enabled:=false;
         frmViluchennyZRealizaciiEdit.edtNomer.Enabled:=false;
       end;
     end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aVidomchaPidporydkovanistChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aVidomchaPidporydkovanistExecute(sender);
  frmVidomchaPidporydkovanist.aChoice.Enabled:=true;
  frmVidomchaPidporydkovanist.Left:=frmMain.Left+70;
  frmVidomchaPidporydkovanist.Top:=frmMain.Top+70;
  frmVidomchaPidporydkovanist.Width:=frmMain.Width-70;
  frmVidomchaPidporydkovanist.Height:=frmMain.Height-70;
  frmVidomchaPidporydkovanist.Position:=poMainFormCenter;
  frmVidomchaPidporydkovanist.FormStyle:=fsNormal;
  frmVidomchaPidporydkovanist.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aVidomostiProObjektChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aObjektiExecute(sender);
  frmObjekti.aChoice.Enabled:=true;
  frmObjekti.Left:=frmMain.Left+70;
  frmObjekti.Top:=frmMain.Top+70;
  frmObjekti.Width:=frmMain.Width-70;
  frmObjekti.Height:=frmMain.Height-70;
  frmObjekti.Position:=poMainFormCenter;
  frmObjekti.FormStyle:=fsNormal;
  frmObjekti.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aVstanovivUpdateExecute(
  Sender: TObject);
begin
  case frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex of
    -1:
      begin
        frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
        frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=0;
        frmViluchennyZRealizaciiEdit.rgVstanoviv.SetFocus;
      end;
    0:  //без гігієнічних висновків
      begin
        frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
        frmViluchennyZRealizaciiEdit.memVstanoviv.Text:='що '+DateToStr(frmViluchennyZRealizaciiEdit.dtpData.Date)+' в '+frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text+' '+frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text+' за адресою '+frmViluchennyZRealizaciiEdit.edtAdresa.Text+' реалізується ';
        frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
        frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.First;
        while not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Eof do
        begin
          frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
          frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from ODINICI_VIMIRU where KOD=:Kod order by VID';
          frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
          frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
          frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Kod';
          frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').Value;
          frmViluchennyZRealizaciiEdit.qRecordID.Open;
          frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').Value+' в кількості '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value)+' '+frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value;
          if frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('VID').Value<>3 then frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+'по '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').Value)+' загальною вагою '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').Value)+' кг ('+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').Value)+' т) виробництва '+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').Value;
          frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Next;
        end;
        frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
        if frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.RecordCount>0 then
        begin
          frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.First;
          while not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.Eof do
          begin
            frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+' результати лабораторного контролю '+frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value+' від '+DateToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value)+' № '+frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value;
            frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.Next;
          end;
        end;
        frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+' без наявності гігієнічного висновку МОЗ України щодо безпечності для життя та здоров''я населення. Продукція є небезпечною для здоров''я та життя населення.';
      end;
    1:  //прострочений термін реалізації
      begin
        frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
        frmViluchennyZRealizaciiEdit.memVstanoviv.Text:='що '+DateToStr(frmViluchennyZRealizaciiEdit.dtpData.Date)+' в '+frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text+' '+frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text+' за адресою '+frmViluchennyZRealizaciiEdit.edtAdresa.Text+' реалізується ';
        frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
        frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.First;
        while not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Eof do
        begin
          frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
          frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from ODINICI_VIMIRU where KOD=:Kod order by VID';
          frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
          frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
          frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Kod';
          frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').Value;
          frmViluchennyZRealizaciiEdit.qRecordID.Open;
          frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').Value+' в кількості '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value)+' '+frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value;
          if frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('VID').Value<>3 then frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+'по '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').Value)+' загальною вагою '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').Value)+' кг ('+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').Value)+' т) виробництва '+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').Value;
          frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Next;
        end;
        frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
        if frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.RecordCount>0 then
        begin
          frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.First;
          while not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.Eof do
          begin
            frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+' результати лабораторного контролю '+frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value+' від '+DateToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value)+' № '+frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value;
            frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.Next;
          end;
        end;
        frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+' з терміном реалізації до '+DateToStr(frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Date)+', термін реалізації вичерпано, продукція є небезпечною для здоров''я та життя населення.'
      end;
    2:  //
      begin
        frmViluchennyZRealizaciiEdit.memVstanoviv.Lines.Clear;
        frmViluchennyZRealizaciiEdit.memVstanoviv.Text:='що '+DateToStr(frmViluchennyZRealizaciiEdit.dtpData.Date)+' в '+frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text+' '+frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text+' за адресою '+frmViluchennyZRealizaciiEdit.edtAdresa.Text+' реалізується ';
        frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
        frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.First;
        while not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Eof do
        begin
          frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
          frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from ODINICI_VIMIRU where KOD=:Kod order by VID';
          frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
          frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
          frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Kod';
          frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').Value;
          frmViluchennyZRealizaciiEdit.qRecordID.Open;
          frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').Value+' в кількості '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value)+' '+frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value;
          if frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('VID').Value<>3 then frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+'по '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').Value)+' загальною вагою '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').Value)+' кг ('+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').Value)+' т) виробництва '+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').Value;
          frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Next;
        end;
        frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
        if frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.RecordCount>0 then
        begin
          frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.First;
          while not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.Eof do
          begin
            frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+' результати лабораторного контролю '+frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value+' від '+DateToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value)+' № '+frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value;
            frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.Next;
          end;
        end;
        frmViluchennyZRealizaciiEdit.memVstanoviv.Text:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text+'продукція є небезпечною для здоров''я та життя населення.';
      end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aNeVidpovidajutChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aNormativniAktiExecute(sender);
  frmStatti.aChoice.Enabled:=true;
  frmStatti.Left:=frmMain.Left+70;
  frmStatti.Top:=frmMain.Top+70;
  frmStatti.Width:=frmMain.Width-70;
  frmStatti.Height:=frmMain.Height-70;
  frmStatti.Position:=poMainFormCenter;
  frmStatti.FormStyle:=fsNormal;
  frmStatti.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aViluchitiUpdateExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.First;
  frmViluchennyZRealizaciiEdit.edtViluchiti.Text:='';
  while not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Eof do
  begin
    if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text+' '+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').Value;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from ODINICI_VIMIRU where KOD=:Kod order by VID';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Kod';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').Value;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('VID').Value<>3 then
    begin
      if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text+'в кількості '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value)+' '+frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value+'. ';
      if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text+'Вага одиниці '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').Value);
      if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text+' загальною вагою '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').Value)+' кг ';
      if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text+'('+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').Value)+'т) ';
    end
    else
      if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text+' загальною кількістю '+FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value)+' шт. ';
    if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').IsNull then frmViluchennyZRealizaciiEdit.edtViluchiti.Text:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text+'виробництва '+frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').Value;
    frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.Next;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aOsobaSES_UpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from SPIVROBITNIKI, RAJONI where RAJONI.RAJON=:Rajon and SPIVROBITNIKI.RAJON=RAJONI.KOD order by PRIZVISXHE';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Open;
    cbOsobaSES.Text:='';
    cbOsobaSES.Items.Clear;
    qRecordID.First;
    while not qRecordID.Eof do
    begin
      cbOsobaSES.Items.Add(qRecordID.FieldByName('PRIZVISXHE').Value);
      qRecordID.Next;
    end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aOsobaSES_ChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aSpivrobitnikiExecute(sender);
  frmSpivrobitniki.aChoice.Enabled:=true;
  frmSpivrobitniki.Left:=frmMain.Left+70;
  frmSpivrobitniki.Top:=frmMain.Top+70;
  frmSpivrobitniki.Width:=frmMain.Width-70;
  frmSpivrobitniki.Height:=frmMain.Height-70;
  frmSpivrobitniki.Position:=poMainFormCenter;
  frmSpivrobitniki.FormStyle:=fsNormal;
  frmSpivrobitniki.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aOsobaSES_ChangeExecute(
  Sender: TObject);
var
  Viddil, Posada: integer;
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from SPIVROBITNIKI,RAJONI where RAJONI.RAJON=:Rajon and SPIVROBITNIKI.RAJON=RAJONI.KOD and PRIZVISXHE=:Prizv order by PRIZVISXHE';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Params.Add;
    qRecordID.Params[1].Name:='Prizv';
    qRecordID.Params[1].Value:=cbOsobaSES.Text;
    qRecordID.Open;
    if qRecordID.Locate('PRIZVISXHE',cbOsobaSES.Text,[]) then
    begin
      Viddil:=qRecordID.FieldByName('KODVIDDILENNY').Value;
      Posada:=qRecordID.FieldByName('KODPOSADI').Value;
    end
    else
    begin
      Viddil:=0;
      Posada:=0;
    end;
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from VIDDILENNY,RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD and VIDDILENNY.KODVIDDILENNY=:Viddil order by KODVIDDILENNY';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Params.Add;
    qRecordID.Params[1].Name:='Viddil';
    qRecordID.Params[1].Value:=Viddil;
    qRecordID.Open;
    if qRecordID.Locate('KODVIDDILENNY',Viddil,[]) then cbViddilSES.Text:=qRecordID.FieldByName('NAZVAVIDDILENNY').Value;
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from POSADI, RAJONI where RAJONI.RAJON=:Rajon and POSADI.RAJON=RAJONI.KOD and POSADI.KODPOSADI=:Posada order by KODPOSADI';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Params.Add;
    qRecordID.Params[1].Name:='Posada';
    qRecordID.Params[1].Value:=Posada;
    qRecordID.Open;
    if qRecordID.Locate('KODPOSADI',Posada,[]) then cbPosadaSES.Text:=qRecordID.FieldByName('NAZVAPOSADI').Value;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aViddilSES_UdpateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from VIDDILENNY,RAJONI where RAJONI.RAJON=:Rajon and VIDDILENNY.RAJON=RAJONI.KOD order by NAZVAVIDDILENNY';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Open;
    cbViddilSES.Text:='';
    cbViddilSES.Items.Clear;
    qRecordID.First;
    while not qRecordID.Eof do
    begin
      cbViddilSES.Items.Add(qRecordID.FieldByName('NAZVAVIDDILENNY').Value);
      qRecordID.Next;
    end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aViddilSES_ChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aViddilennyExecute(sender);
  frmViddilenny.aChoice.Enabled:=true;
  frmViddilenny.Left:=frmMain.Left+70;
  frmViddilenny.Top:=frmMain.Top+70;
  frmViddilenny.Width:=frmMain.Width-70;
  frmViddilenny.Height:=frmMain.Height-70;
  frmViddilenny.Position:=poMainFormCenter;
  frmViddilenny.FormStyle:=fsNormal;
  frmViddilenny.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aPosadaSES_UpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from POSADI,RAJONI where RAJONI.RAJON=:Rajon and POSADI.RAJON=RAJONI.KOD order by NAZVAPOSADI';
    qRecordID.Params.Clear;
    qRecordID.Params.Add;
    qRecordID.Params[0].Name:='Rajon';
    qRecordID.Params[0].Value:=cbDistrict.Text;
    qRecordID.Open;
    cbPosadaSES.Text:='';
    cbPosadaSES.Items.Clear;
    qRecordID.First;
    while not qRecordID.Eof do
    begin
      cbPosadaSES.Items.Add(qRecordID.FieldByName('NAZVAPOSADI').Value);
      qRecordID.Next;
    end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aPosadaSES_ChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aPosadiExecute(sender);
  frmPosadi.aChoice.Enabled:=true;
  frmPosadi.Left:=frmMain.Left+70;
  frmPosadi.Top:=frmMain.Top+70;
  frmPosadi.Width:=frmMain.Width-70;
  frmPosadi.Height:=frmMain.Height-70;
  frmPosadi.Position:=poMainFormCenter;
  frmPosadi.FormStyle:=fsNormal;
  frmPosadi.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aTipProdukcii_ChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aTipProdukciiExecute(sender);
  frmTipiProdukcii.aChoice.Enabled:=true;
  frmTipiProdukcii.Left:=frmMain.Left+70;
  frmTipiProdukcii.Top:=frmMain.Top+70;
  frmTipiProdukcii.Width:=frmMain.Width-70;
  frmTipiProdukcii.Height:=frmMain.Height-70;
  frmTipiProdukcii.Position:=poMainFormCenter;
  frmTipiProdukcii.FormStyle:=fsNormal;
  frmTipiProdukcii.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aTipProdukcii_UpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
    qRecordID.Open;
    cbTipProdukcii.Text:='';
    cbTipProdukcii.Items.Clear;
    qRecordID.First;
    while not qRecordID.Eof do
    begin
      cbTipProdukcii.Items.Add(qRecordID.FieldByName('TIPPRODUKCII').Value);
      qRecordID.Next;
    end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aRozdil_T23_F18_UpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from ROZDILT23F18 order by OBJEKTNAGLYDU';
    qRecordID.Open;
    cbRozdil_T23_F18.Text:='';
    cbRozdil_T23_F18.Items.Clear;
    qRecordID.First;
    while not qRecordID.Eof do
    begin
      cbRozdil_T23_F18.Items.Add(qRecordID.FieldByName('OBJEKTNAGLYDU').Value);
      qRecordID.Next;
    end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aRozdil_T23_F18_ChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aRozdil_t23_f18Execute(sender);
  frmRozdil_T23_F18.aChoice.Enabled:=true;
  frmRozdil_T23_F18.Left:=frmMain.Left+70;
  frmRozdil_T23_F18.Top:=frmMain.Top+70;
  frmRozdil_T23_F18.Width:=frmMain.Width-70;
  frmRozdil_T23_F18.Height:=frmMain.Height-70;
  frmRozdil_T23_F18.Position:=poMainFormCenter;
  frmRozdil_T23_F18.FormStyle:=fsNormal;
  frmRozdil_T23_F18.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aTipPostanovi_UpdateExecute(
  Sender: TObject);
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qRecordID.SQL.Clear;
    qRecordID.SQL.Text:='select * from TIPISHTRAFIV order by TIPSHTRAFU';
    qRecordID.Open;
    cbTipPostanovi.Text:='';
    cbTipPostanovi.Items.Clear;
    qRecordID.First;
    while not qRecordID.Eof do
    begin
      cbTipPostanovi.Items.Add(qRecordID.FieldByName('TIPSHTRAFU').Value);
      qRecordID.Next;
    end;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aTipPostanovi_ChoiceExecute(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmMain.aTipShtrafuExecute(sender);
  frmTipiShtrafiv.aChoice.Enabled:=true;
  frmTipiShtrafiv.Left:=frmMain.Left+70;
  frmTipiShtrafiv.Top:=frmMain.Top+70;
  frmTipiShtrafiv.Width:=frmMain.Width-70;
  frmTipiShtrafiv.Height:=frmMain.Height-70;
  frmTipiShtrafiv.Position:=poMainFormCenter;
  frmTipiShtrafiv.FormStyle:=fsNormal;
  frmTipiShtrafiv.BorderStyle:=bsDialog;
end;

procedure TfrmViluchennyZRealizaciiEdit.aYearUpdateExecute(
  Sender: TObject);
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'AZZ.INI');
  frmViluchennyZRealizaciiEdit.edtYear.Text:=INIAZZ.ReadString('System','Year',frmViluchennyZRealizaciiEdit.edtYear.Text);
  INIAZZ.Free;
end;

procedure TfrmViluchennyZRealizaciiEdit.aAddViluchennyExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVidomostiProViluchenny:=TfrmVidomostiProViluchenny.Create(self);
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmVidomostiProViluchenny.Show;
  frmVidomostiProViluchenny.BorderStyle:=bsDialog;
  frmVidomostiProViluchenny.Position:=poMainFormCenter;
  frmVidomostiProViluchenny.Caption:='Додавання запису';

  if MessageDlg('Постанова № '+frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text+' від '+DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date))+#13+'УВАГА!!!'+#13+'Перевірте правильність номера та дати винесення постанови постанови!'+#13+'Чи правильно внесені ці відомості?',mtWarning,[mbYes,mbNo],0)=mrNo then
  begin
    frmVidomostiProViluchenny.Close;
    exit;
  end;

  frmVidomostiProViluchenny.cbMinistry.Text:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
  frmVidomostiProViluchenny.cbMinistry.Enabled:=false;
  frmVidomostiProViluchenny.cbTeritory.Text:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
  frmVidomostiProViluchenny.cbTeritory.Enabled:=false;
  frmVidomostiProViluchenny.cbDistrict.Text:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
  frmVidomostiProViluchenny.cbDistrict.Enabled:=false;

  frmVidomostiProViluchenny.aRecordID_UpdateExecute(sender);
  frmVidomostiProViluchenny.edtRecordID.Enabled:=false;
  frmVidomostiProViluchenny.edtNomerPostanovi.Text:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
  frmVidomostiProViluchenny.edtNomerPostanovi.Enabled:=false;
  frmVidomostiProViluchenny.edtDataPostanovi.Text:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date));
  frmVidomostiProViluchenny.edtDataPostanovi.Enabled:=false;
  frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text:='';
  frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Enabled:=true;
  frmVidomostiProViluchenny.edtKilkistTovaru.Text:='';
  frmVidomostiProViluchenny.edtKilkistTovaru.Enabled:=true;
  frmVidomostiProViluchenny.edtVagaOdinici.Text:='';
  frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=true;
  frmVidomostiProViluchenny.cbOdinicyVimiru.Text:='';
  frmVidomostiProViluchenny.cbOdinicyVimiru.Items.Clear;
  frmVidomostiProViluchenny.cbOdinicyVimiru.Enabled:=true;
  frmVidomostiProViluchenny.aOdiniciVimiruUpdateExecute(sender);
  frmVidomostiProViluchenny.aOdiniciVimiruChangeExecute(sender);
  frmVidomostiProViluchenny.cbOdinicyVimiru.Enabled:=true;
  frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text:='';
  frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=true;
  frmVidomostiProViluchenny.edtZagalnaVaga_T.Text:='';
  frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=true;
  frmVidomostiProViluchenny.cbVirobnik.Text:='';
  frmVidomostiProViluchenny.cbVirobnik.Items.Clear;
  frmVidomostiProViluchenny.aVirobnikUpdateExecute(sender);
  frmVidomostiProViluchenny.cbVirobnik.Enabled:=true;
  frmVidomostiProViluchenny.btnVirobnik_Update.Enabled:=true;
  frmVidomostiProViluchenny.btnVirobnik_Choice.Enabled:=true;
  frmVidomostiProViluchenny.edtNajmenuvannyTovaru.SetFocus;
end;

procedure TfrmViluchennyZRealizaciiEdit.aEditViluchennyExecute(
  Sender: TObject);
begin
  if frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVidomostiProViluchenny:=TfrmVidomostiProViluchenny.Create(self);
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmVidomostiProViluchenny.Show;
  frmVidomostiProViluchenny.BorderStyle:=bsDialog;
  frmVidomostiProViluchenny.Position:=poMainFormCenter;
  frmVidomostiProViluchenny.Caption:='Редагування запису';
  frmVidomostiProViluchenny.cbMinistry.Text:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
  frmVidomostiProViluchenny.cbMinistry.Enabled:=false;
  frmVidomostiProViluchenny.cbTeritory.Text:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
  frmVidomostiProViluchenny.cbTeritory.Enabled:=false;
  frmVidomostiProViluchenny.cbDistrict.Text:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
  frmVidomostiProViluchenny.cbDistrict.Enabled:=false;

  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('RECORD_ID').IsNull then frmVidomostiProViluchenny.edtRecordID.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('RECORD_ID').Value) else frmVidomostiProViluchenny.aRecordID_UpdateExecute(sender);
  frmVidomostiProViluchenny.edtRecordID.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NOMER_POSTANOVI').IsNull then frmVidomostiProViluchenny.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NOMER_POSTANOVI').Value) else frmVidomostiProViluchenny.edtNomerPostanovi.Text:='';
  frmVidomostiProViluchenny.edtNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('DATA_POSTANOVI').IsNull then frmVidomostiProViluchenny.edtDataPostanovi.Text:=DateToStr(int(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('DATA_POSTANOVI').Value)) else frmVidomostiProViluchenny.edtDataPostanovi.Text:='';
  frmVidomostiProViluchenny.edtDataPostanovi.Enabled:=false;

  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').IsNull then frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').Value else frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text:='';
  frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Enabled:=true;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').IsNull then frmVidomostiProViluchenny.edtKilkistTovaru.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value) else frmVidomostiProViluchenny.edtKilkistTovaru.Text:='';
  frmVidomostiProViluchenny.edtKilkistTovaru.Enabled:=true;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').IsNull then frmVidomostiProViluchenny.edtVagaOdinici.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').Value) else frmVidomostiProViluchenny.edtVagaOdinici.Text:='';
  frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=true;

  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').IsNull then frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').Value) else frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text:='';
  frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=true;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').IsNull then frmVidomostiProViluchenny.edtZagalnaVaga_T.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').Value) else frmVidomostiProViluchenny.edtZagalnaVaga_T.Text:='';
  frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=true;
  frmVidomostiProViluchenny.cbOdinicyVimiru.Text:='';
  frmVidomostiProViluchenny.cbOdinicyVimiru.Items.Clear;
  frmVidomostiProViluchenny.cbOdinicyVimiru.Enabled:=true;
  frmVidomostiProViluchenny.aOdiniciVimiruUpdateExecute(sender);
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').IsNull then frmVidomostiProViluchenny.cbOdinicyVimiru.Text:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').Value;
  frmVidomostiProViluchenny.qRecord_ID.SQL.Clear;
  frmVidomostiProViluchenny.qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU where KOD=:Vimir order by KOD';
  frmVidomostiProViluchenny.qRecord_ID.Params.Clear;
  frmVidomostiProViluchenny.qRecord_ID.Params.Add;
  frmVidomostiProViluchenny.qRecord_ID.Params[0].Name:='Vimir';
  frmVidomostiProViluchenny.qRecord_ID.Params[0].Value:=frmVidomostiProViluchenny.cbOdinicyVimiru.Text;
  frmVidomostiProViluchenny.qRecord_ID.Open;
  if frmVidomostiProViluchenny.qRecord_ID.Locate('KOD',StrToInt(frmVidomostiProViluchenny.cbOdinicyVimiru.Text),[]) then frmVidomostiProViluchenny.cbOdinicyVimiru.Text:=frmVidomostiProViluchenny.qRecord_ID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value else frmVidomostiProViluchenny.cbOdinicyVimiru.Text:='';
  frmVidomostiProViluchenny.aOdiniciVimiruChangeExecute(sender);
  frmVidomostiProViluchenny.cbOdinicyVimiru.Enabled:=true;
  frmVidomostiProViluchenny.cbVirobnik.Text:='';
  frmVidomostiProViluchenny.cbVirobnik.Items.Clear;
  frmVidomostiProViluchenny.aVirobnikUpdateExecute(sender);
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').IsNull then frmVidomostiProViluchenny.cbVirobnik.Text:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').Value else frmVidomostiProViluchenny.cbVirobnik.Text:='';
  frmVidomostiProViluchenny.cbVirobnik.Enabled:=true;
  frmVidomostiProViluchenny.btnVirobnik_Update.Enabled:=true;
  frmVidomostiProViluchenny.btnVirobnik_Choice.Enabled:=true;
  frmVidomostiProViluchenny.edtNajmenuvannyTovaru.SetFocus;
end;

procedure TfrmViluchennyZRealizaciiEdit.aDeleteViluchennyExecute(
  Sender: TObject);
begin
  if frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmVidomostiProViluchenny') then frmVidomostiProViluchenny:=TfrmVidomostiProViluchenny.Create(self);
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmVidomostiProViluchenny.Show;
  frmVidomostiProViluchenny.BorderStyle:=bsDialog;
  frmVidomostiProViluchenny.Position:=poMainFormCenter;
  frmVidomostiProViluchenny.Caption:='Видалення запису';

  frmVidomostiProViluchenny.cbMinistry.Text:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
  frmVidomostiProViluchenny.cbMinistry.Enabled:=false;
  frmVidomostiProViluchenny.cbTeritory.Text:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
  frmVidomostiProViluchenny.cbTeritory.Enabled:=false;
  frmVidomostiProViluchenny.cbDistrict.Text:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
  frmVidomostiProViluchenny.cbDistrict.Enabled:=false;

  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('RECORD_ID').IsNull then frmVidomostiProViluchenny.edtRecordID.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('RECORD_ID').Value) else frmVidomostiProViluchenny.aRecordID_UpdateExecute(sender);
  frmVidomostiProViluchenny.edtRecordID.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NOMER_POSTANOVI').IsNull then frmVidomostiProViluchenny.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NOMER_POSTANOVI').Value) else frmVidomostiProViluchenny.edtNomerPostanovi.Text:='';
  frmVidomostiProViluchenny.edtNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('DATA_POSTANOVI').IsNull then frmVidomostiProViluchenny.edtDataPostanovi.Text:=DateToStr(int(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('DATA_POSTANOVI').Value)) else frmVidomostiProViluchenny.edtDataPostanovi.Text:='';
  frmVidomostiProViluchenny.edtDataPostanovi.Enabled:=false;

  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').IsNull then frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('NAJMENUVANNY_TOVARU').Value else frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Text:='';
  frmVidomostiProViluchenny.edtNajmenuvannyTovaru.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').IsNull then frmVidomostiProViluchenny.edtKilkistTovaru.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('KILKIST_TOVARU').Value) else frmVidomostiProViluchenny.edtKilkistTovaru.Text:='';
  frmVidomostiProViluchenny.edtKilkistTovaru.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').IsNull then frmVidomostiProViluchenny.edtVagaOdinici.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VAGA_ODINICI').Value) else frmVidomostiProViluchenny.edtVagaOdinici.Text:='';
  frmVidomostiProViluchenny.edtVagaOdinici.Enabled:=false;

  frmVidomostiProViluchenny.cbOdinicyVimiru.Text:='';
  frmVidomostiProViluchenny.cbOdinicyVimiru.Items.Clear;
  frmVidomostiProViluchenny.cbOdinicyVimiru.Enabled:=false;
  frmVidomostiProViluchenny.aOdiniciVimiruUpdateExecute(sender);
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').IsNull then frmVidomostiProViluchenny.cbOdinicyVimiru.Text:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ODINICI_VIMIRU').Value;
  frmVidomostiProViluchenny.qRecord_ID.SQL.Clear;
  frmVidomostiProViluchenny.qRecord_ID.SQL.Text:='select * from ODINICI_VIMIRU where KOD=:Vimir order by KOD';
  frmVidomostiProViluchenny.qRecord_ID.Params.Clear;
  frmVidomostiProViluchenny.qRecord_ID.Params.Add;
  frmVidomostiProViluchenny.qRecord_ID.Params[0].Name:='Vimir';
  frmVidomostiProViluchenny.qRecord_ID.Params[0].Value:=frmVidomostiProViluchenny.cbOdinicyVimiru.Text;
  frmVidomostiProViluchenny.qRecord_ID.Open;
  if frmVidomostiProViluchenny.qRecord_ID.Locate('KOD',StrToInt(frmVidomostiProViluchenny.cbOdinicyVimiru.Text),[]) then frmVidomostiProViluchenny.cbOdinicyVimiru.Text:=frmVidomostiProViluchenny.qRecord_ID.FieldByName('SOKRASCHENNOE_NAZVANIE').Value else frmVidomostiProViluchenny.cbOdinicyVimiru.Text:='';
  frmVidomostiProViluchenny.aOdiniciVimiruChangeExecute(sender);
  frmVidomostiProViluchenny.cbOdinicyVimiru.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').IsNull then frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_KG').Value) else frmVidomostiProViluchenny.edtZagalnaVaga_KG.Text:='';
  frmVidomostiProViluchenny.edtZagalnaVaga_KG.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').IsNull then frmVidomostiProViluchenny.edtZagalnaVaga_T.Text:=FloatToStr(frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('ZAGALNA_VAGA_T').Value) else frmVidomostiProViluchenny.edtZagalnaVaga_T.Text:='';
  frmVidomostiProViluchenny.edtZagalnaVaga_T.Enabled:=false;
  frmVidomostiProViluchenny.cbVirobnik.Text:='';
  frmVidomostiProViluchenny.cbVirobnik.Items.Clear;
  frmVidomostiProViluchenny.aVirobnikUpdateExecute(sender);
  if not frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').IsNull then frmVidomostiProViluchenny.cbVirobnik.Text:=frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.FieldByName('VIROBNIK').Value else frmVidomostiProViluchenny.cbVirobnik.Text:='';
  frmVidomostiProViluchenny.cbVirobnik.Enabled:=false;
  frmVidomostiProViluchenny.btnVirobnik_Update.Enabled:=false;
  frmVidomostiProViluchenny.btnVirobnik_Choice.Enabled:=false;
  frmVidomostiProViluchenny.btnVidminiti.SetFocus;
end;

procedure TfrmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(
  Sender: TObject);
var
  Ministry, Teritory, District: integer;
begin
  try
    StrToInt(frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text);
  except
    exit;
  end;
  with frmViluchennyZRealizaciiEdit do
  begin
    qVidomostiProViluchenny.SQL.Clear;
    qVidomostiProViluchenny.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qVidomostiProViluchenny.Params.Clear;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[0].Name:='Ministry';
    qVidomostiProViluchenny.Params[0].Value:=cbMinistry.Text;
    qVidomostiProViluchenny.Open;
    if qVidomostiProViluchenny.Locate('MINISTRY',cbMinistry.Text,[]) then Ministry:=qVidomostiProViluchenny.FieldByName('KOD').Value else Ministry:=0;

    qVidomostiProViluchenny.SQL.Clear;
    qVidomostiProViluchenny.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qVidomostiProViluchenny.Params.Clear;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[0].Name:='Ministry';
    qVidomostiProViluchenny.Params[0].Value:=Ministry;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[1].Name:='Teritory';
    qVidomostiProViluchenny.Params[1].Value:=cbTeritory.Text;
    qVidomostiProViluchenny.Open;
    if qVidomostiProViluchenny.Locate('TERITORY',cbTeritory.Text,[]) then Teritory:=qVidomostiProViluchenny.FieldByName('KOD').Value else Teritory:=0;

    qVidomostiProViluchenny.SQL.Clear;
    qVidomostiProViluchenny.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qVidomostiProViluchenny.Params.Clear;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[0].Name:='Ministry';
    qVidomostiProViluchenny.Params[0].Value:=Ministry;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[1].Name:='Teritory';
    qVidomostiProViluchenny.Params[1].Value:=Teritory;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[2].Name:='Rajon';
    qVidomostiProViluchenny.Params[2].Value:=cbDistrict.Text;
    qVidomostiProViluchenny.Open;
    if qVidomostiProViluchenny.Locate('RAJON',cbDistrict.Text,[]) then District:=qVidomostiProViluchenny.FieldByName('KOD').Value else District:=0;

    qVidomostiProViluchenny.SQL.Clear;
    qVidomostiProViluchenny.SQL.Text:='select * from VIDOMOSTI_PRO_VILUCHENNY,ODINICI_VIMIRU where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMER_POSTANOVI=:NomerPostanovi and DATA_POSTANOVI=:DataPostanovi ';
    qVidomostiProViluchenny.SQL.Text:=qVidomostiProViluchenny.SQL.Text+'and ODINICI_VIMIRU.KOD=VIDOMOSTI_PRO_VILUCHENNY.ODINICI_VIMIRU order by NAJMENUVANNY_TOVARU';
    qVidomostiProViluchenny.Params.Clear;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[0].Name:='Ministry';
    qVidomostiProViluchenny.Params[0].Value:=Ministry;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[1].Name:='Teritory';
    qVidomostiProViluchenny.Params[1].Value:=Teritory;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[2].Name:='Rajon';
    qVidomostiProViluchenny.Params[2].Value:=District;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[3].Name:='NomerPostanovi';
    qVidomostiProViluchenny.Params[3].Value:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
    qVidomostiProViluchenny.Params.Add;
    qVidomostiProViluchenny.Params[4].Name:='DataPostanovi';
    qVidomostiProViluchenny.Params[4].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date));
//    qVidomostiProViluchenny.SQL.Text:='select * from VIDOMOSTI_PRO_VILUCHENNY,ODINICI_VIMIRU where VIDOMOSTI_PRO_VILUCHENNY.NOMER_POSTANOVI='+frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text+'and VIDOMOSTI_PRO_VILUCHENNY.DATA_POSTANOVI='''+DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date))+''' and ODINICI_VIMIRU.KOD=VIDOMOSTI_PRO_VILUCHENNY.ODINICI_VIMIRU order by VIDOMOSTI_PRO_VILUCHENNY.NAJMENUVANNY_TOVARU';
    qVidomostiProViluchenny.Open;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aVstanoviv_UpdateExecute(
  Sender: TObject);
begin
  case frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex of
   -1: frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Visible:=false;
    0: frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Visible:=false;
    1:
      begin
        frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Visible:=true;
        if not frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TERMIN_REALIZACII').IsNull then frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Date:=int(frmViluchennyZRealizacii.qViluchennyZRealizacii.FieldByName('TERMIN_REALIZACII').Value) else frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Date:=int(date);
        if frmViluchennyZRealizaciiEdit.Caption='Додавання запису' then frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Enabled:=true;
        if frmViluchennyZRealizaciiEdit.Caption='Редагування запису' then frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Enabled:=true;
        if frmViluchennyZRealizaciiEdit.Caption='Видалення запису' then frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Enabled:=false;
      end;
    2: frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Visible:=false;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.aAddLaboratoryExecute(
  Sender: TObject);
begin
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.Caption:='Додати відомості про лабораторний контроль';
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;

  frmLaboratornijKontrol.cbMinistry.Text:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;

  frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  frmLaboratornijKontrol.dtpDataPostanovi.Date:=frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date;
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;

  frmLaboratornijKontrol.cbVidKontrolu.Items.Clear;
  frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=true;
  frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=true;
  frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=true;
  frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
end;

procedure TfrmViluchennyZRealizaciiEdit.aEditLaboratoryExecute(
  Sender: TObject);
begin
  if frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.Caption:='Редагувати відомості про лабораторний контроль';
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;

  frmLaboratornijKontrol.cbMinistry.Text:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;

  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('KOD').IsNull then frmLaboratornijKontrol.edtKod.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('KOD').Value) else frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then frmLaboratornijKontrol.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value) else frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else frmLaboratornijKontrol.dtpDataPostanovi.Date:=frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date;
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;

  frmLaboratornijKontrol.cbVidKontrolu.Items.Clear;
  frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then frmLaboratornijKontrol.cbVidKontrolu.Text:=frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=true;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=true;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then frmLaboratornijKontrol.edtNomeriProb.Text:=frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=true;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=true;
  frmLaboratornijKontrol.cbVidKontrolu.SetFocus;
end;

procedure TfrmViluchennyZRealizaciiEdit.aDeleteLaboratoryExecute(
  Sender: TObject);
begin
  if frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.RecordCount<=0 then exit;
  if not frmMain.IsFormOpen('frmLaboratornijKontrol') then frmLaboratornijKontrol:=TfrmLaboratornijKontrol.Create(self);
  frmViluchennyZRealizaciiEdit.Enabled:=false;
  frmLaboratornijKontrol.Show;
  frmLaboratornijKontrol.Caption:='Видалити відомості про лабораторний контроль';
  frmLaboratornijKontrol.Position:=poMainFormCenter;
  frmLaboratornijKontrol.BorderStyle:=bsDialog;

  frmLaboratornijKontrol.cbMinistry.Text:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
  frmLaboratornijKontrol.cbMinistry.Enabled:=false;
  frmLaboratornijKontrol.cbTeritory.Text:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
  frmLaboratornijKontrol.cbTeritory.Enabled:=false;
  frmLaboratornijKontrol.cbDistrict.Text:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
  frmLaboratornijKontrol.cbDistrict.Enabled:=false;

  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('KOD').IsNull then frmLaboratornijKontrol.edtKod.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('KOD').Value) else frmLaboratornijKontrol.aKodUpdateExecute(sender);
  frmLaboratornijKontrol.edtKod.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').IsNull then frmLaboratornijKontrol.edtNomerPostanovi.Text:=IntToStr(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERPOSTANOVI').Value) else frmLaboratornijKontrol.edtNomerPostanovi.Text:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
  frmLaboratornijKontrol.edtNomerPostanovi.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').IsNull then frmLaboratornijKontrol.dtpDataPostanovi.Date:=int(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAPOSTANOVI').Value) else frmLaboratornijKontrol.dtpDataPostanovi.Date:=frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date;
  frmLaboratornijKontrol.dtpDataPostanovi.Enabled:=false;

  frmLaboratornijKontrol.cbVidKontrolu.Items.Clear;
  frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.aVidKontrolu_UpdateExecute(sender);
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').IsNull then frmLaboratornijKontrol.cbVidKontrolu.Text:=frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('VIDKONTROLU').Value else frmLaboratornijKontrol.cbVidKontrolu.Text:='';
  frmLaboratornijKontrol.cbVidKontrolu.Enabled:=false;
  frmLaboratornijKontrol.btnVidKontrolu_Update.Enabled:=false;
  frmLaboratornijKontrol.btnVidKontrolu_Choice.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').IsNull then frmLaboratornijKontrol.edtNomeriProb.Text:=frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('NOMERIPROB').Value else frmLaboratornijKontrol.edtNomeriProb.Text:='';
  frmLaboratornijKontrol.edtNomeriProb.Enabled:=false;
  if not frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').IsNull then frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(frmViluchennyZRealizaciiEdit.qLaboratornijKontrol.FieldByName('DATAKONTROLU').Value) else frmLaboratornijKontrol.dtpDataKontrolu.Date:=int(date);
  frmLaboratornijKontrol.dtpDataKontrolu.Enabled:=false;
  frmLaboratornijKontrol.btnVidminiti.SetFocus;
end;

procedure TfrmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(
  Sender: TObject);
var
  Ministry, Teritory, District: integer;
begin
  with frmViluchennyZRealizaciiEdit do
  begin
    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('MINISTRY',frmViluchennyZRealizaciiEdit.cbMinistry.Text,[]) then Ministry:=qLaboratornijKontrol.FieldByName('KOD').Value else Ministry:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=Ministry;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('TERITORY',frmViluchennyZRealizaciiEdit.cbTeritory.Text,[]) then Teritory:=qLaboratornijKontrol.FieldByName('KOD').Value else Teritory:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=Ministry;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=Teritory;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[2].Name:='Rajon';
    qLaboratornijKontrol.Params[2].Value:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
    qLaboratornijKontrol.Open;
    if qLaboratornijKontrol.Locate('RAJON',frmViluchennyZRealizaciiEdit.cbDistrict.Text,[]) then District:=qLaboratornijKontrol.FieldByName('KOD').Value else District:=0;

    qLaboratornijKontrol.SQL.Clear;
    qLaboratornijKontrol.SQL.Text:='select * from LABORATORNIJKONTROL where MINISTRY=:Ministry and TERITORY=:Teritory and DISTRICT=:Rajon and NOMERPOSTANOVI=:NomerPostanovi and DATAPOSTANOVI=:DataPostanovi and SHTRAFI_ADMIN=:Viluchenny';
    qLaboratornijKontrol.Params.Clear;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[0].Name:='Ministry';
    qLaboratornijKontrol.Params[0].Value:=Ministry;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[1].Name:='Teritory';
    qLaboratornijKontrol.Params[1].Value:=Teritory;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[2].Name:='Rajon';
    qLaboratornijKontrol.Params[2].Value:=District;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[3].Name:='NomerPostanovi';
    qLaboratornijKontrol.Params[3].Value:=edtNomerPostanovi.Text;
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[4].Name:='DataPostanovi';
    qLaboratornijKontrol.Params[4].Value:=DateToStr(int(dtpDataPostanovi.Date));
    qLaboratornijKontrol.Params.Add;
    qLaboratornijKontrol.Params[5].Name:='Viluchenny';
    qLaboratornijKontrol.Params[5].Value:='viluchenny';
    qLaboratornijKontrol.Open;
  end;
end;

procedure TfrmViluchennyZRealizaciiEdit.edtNomerPostanoviExit(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
end;

procedure TfrmViluchennyZRealizaciiEdit.dtpDataPostanoviExit(
  Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
  frmViluchennyZRealizaciiEdit.aUpdateLaboratoryExecute(sender);
end;

procedure TfrmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(
  Sender: TObject);
var
  Position: integer;
begin
  INIAZZ:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'azz.ini');
  Position:=INIAZZ.ReadInteger('System','Position',Position);
  case Position of
    0:
      begin
        frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:=INIAZZ.ReadString('Director','Position_NV',frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text);
        frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:=INIAZZ.ReadString('Director','LNP_NV',frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text);
      end;
    1:
      begin
        frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:=INIAZZ.ReadString('Director1','Position_NV',frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text);
        frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:=INIAZZ.ReadString('Director1','LNP_NV',frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text);
      end;
    2:
      begin
        frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text:=INIAZZ.ReadString('Director2','Position_NV',frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text);
        frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text:=INIAZZ.ReadString('Director2','LNP_NV',frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text);
      end;
  end;
  INIAZZ.Free;
end;

procedure TfrmViluchennyZRealizaciiEdit.aCancelExecute(Sender: TObject);
begin
  frmViluchennyZRealizaciiEdit.Close;
end;

procedure TfrmViluchennyZRealizaciiEdit.aOKExecute(Sender: TObject);
var
  Ministry, Teritory, District: integer;
begin
  if frmViluchennyZRealizaciiEdit.Caption='Видалення запису' then
  begin
    if MessageDlg('УВАГА!!!'+#13+'Відновлення цього запису після видалення буде неможливе!!!'+#13+'Ви дійсно хочете видалити цей запис?',mtWarning,[mbYes,mbNo],0)=mrYes then
    begin
      frmViluchennyZRealizacii.qViluchennyZRealizacii.SQL.Clear;
      frmViluchennyZRealizacii.qViluchennyZRealizacii.SQL.Text:='delete from VILUCHENNY_Z_REALIZACII where RECORD_ID=:Kod';
      frmViluchennyZRealizacii.qViluchennyZRealizacii.Params.Clear;
      frmViluchennyZRealizacii.qViluchennyZRealizacii.Params.Add;
      frmViluchennyZRealizacii.qViluchennyZRealizacii.Params[0].Name:='Kod';
      frmViluchennyZRealizacii.qViluchennyZRealizacii.Params[0].Value:=frmViluchennyZRealizaciiEdit.edtRecordID.Text;
      frmViluchennyZRealizacii.qViluchennyZRealizacii.Open;
      frmMain.trAzz.CommitRetaining;
    end;
    frmViluchennyZRealizaciiEdit.Close;
    frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
    exit;
  end;

  if frmViluchennyZRealizaciiEdit.Caption='Редагування запису' then
  begin
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Ministry';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.Locate('MINISTRY',frmViluchennyZRealizaciiEdit.cbMinistry.Text,[]) then Ministry:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else Ministry:=0;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Ministry';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=Ministry;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Name:='Teritory';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Value:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.Locate('TERITORY',frmViluchennyZRealizaciiEdit.cbTeritory.Text,[]) then Teritory:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else Teritory:=0;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Ministry';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=Ministry;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Name:='Teritory';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Value:=Teritory;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[2].Name:='Rajon';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[2].Value:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.Locate('RAJON',frmViluchennyZRealizaciiEdit.cbDistrict.Text,[]) then District:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else District:=0;
    if frmViluchennyZRealizaciiEdit.edtRecordID.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmViluchennyZRealizaciiEdit.edtRecordID.Text);
    except
      frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text);
    except
      frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    case frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex of
     -1:
        begin
          frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=0;
          frmViluchennyZRealizaciiEdit.aAkt_Dovidka_UpdateExecute(sender);
          frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
          frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
          exit;
        end;
      0:
        begin
          if int(frmViluchennyZRealizaciiEdit.dtpData.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
        end;
      1:
        begin
          if int(frmViluchennyZRealizaciiEdit.dtpData.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmViluchennyZRealizaciiEdit.edtNomer.Text='' then
          begin
            frmViluchennyZRealizaciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
      2:
        begin
          if int(frmViluchennyZRealizaciiEdit.dtpDataDo.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
          if int(frmViluchennyZRealizaciiEdit.dtpData.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataDo.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmViluchennyZRealizaciiEdit.edtNomer.Text='' then
          begin
            frmViluchennyZRealizaciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
    if frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtAdresa.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtAdresa.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtPIBKerivnika.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPosada.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtPosada.SetFocus;
      exit;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProPereviryjuchogo;
    if frmViluchennyZRealizaciiEdit.cbOsobaSES.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
      frmViluchennyZRealizaciiEdit.cbOsobaSES.Items.Clear;
      frmViluchennyZRealizaciiEdit.aOsobaSES_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbOsobaSES.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbViddilSES.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
      frmViluchennyZRealizaciiEdit.cbViddilSES.Items.Clear;
      frmViluchennyZRealizaciiEdit.aViddilSES_UdpateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbViddilSES.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbPosadaSES.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Items.Clear;
      frmViluchennyZRealizaciiEdit.aPosadaSES_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbPosadaSES.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.Items.Clear;
      frmViluchennyZRealizaciiEdit.aTipProdukcii_ChoiceExecute(sender);
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Items.Clear;
      frmViluchennyZRealizaciiEdit.aRozdil_T23_F18_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.Items.Clear;
      frmViluchennyZRealizaciiEdit.aTipPostanovi_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.SetFocus;
      exit;
    end;
    if int(StrToInt(frmViluchennyZRealizaciiEdit.edtYear.Text))<>YearOf(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date)) then
    begin
      if MessageDlg('Увага!'+#13+'Рік постанови та звітний рік не співпадають!'+#13+'Збережені відомості будуть віднесені до іншого періоду, що може відобразитись на звітах!'+#13+'Продовжити збереження відомостей постанови?''',mtWarning,[mbYes,mbNo],0)=mrNo then
      begin
        frmViluchennyZRealizaciiEdit.edtYear.Text:='';
        frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
        frmViluchennyZRealizaciiEdit.edtYear.SetFocus;
        exit;
      end;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
    frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
    if frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.RecordCount<=0 then
    begin
      MessageDlg('Увага!'+#13+'Не введено відомостей про вилучення!'+#13+'Введіть відомості про вилучену продукцію!',mtError,[mbOK],0);
      frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
      frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
      exit;
    end;
    case frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex of
     -1:
        begin
          frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=0;
          frmViluchennyZRealizaciiEdit.rgVstanoviv.SetFocus;
          exit;
        end;
      0:
        begin
          frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
          if frmViluchennyZRealizaciiEdit.qRecordID.RecordCount<=0 then
          begin
            frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
            frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
            exit;
          end;
        end;
      1:
        begin
          frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
          if frmViluchennyZRealizaciiEdit.qRecordID.RecordCount<=0 then
          begin
            frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
            frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
            exit;
          end;
        end;
      2:
        begin
          frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
          if frmViluchennyZRealizaciiEdit.qRecordID.RecordCount<=0 then
          begin
            frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
            frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
            exit;
          end;
        end;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsZmistPostanovi;
    if frmViluchennyZRealizaciiEdit.memVstanoviv.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aVstanovivUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.memVstanoviv.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.memNeVidpovidajut.SetFocus;
      frmViluchennyZRealizaciiEdit.aNeVidpovidajutChoiceExecute(sender);
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtViluchiti.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aViluchitiUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtViluchiti.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
      frmViluchennyZRealizaciiEdit.edtPosadaGDSL.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
      frmViluchennyZRealizaciiEdit.edtPIBGDSL.SetFocus;
      exit;
    end;
    with frmViluchennyZRealizacii do
    begin
      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='update VILUCHENNY_Z_REALIZACII set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'AKT_ZAPISKA=:Zapiska,DATA_AKTU_OBSTEZHENNY=:DataAktuZ,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'DATA_AKTU_OBSTEZHENNY_DO=:DataAktuDo,NOMER_AKTU_OBSTEZHENNY=:NomerAktu,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'DODATKOVA_INFORMACIY=:Dodatkovo,NAZVA_OBJEKTU=:NazvaObjektu,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'VIDOMCHA_PIDPORYDKOVANIST=:VidomchaPidporydkovanist,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'ADRESA=:Adresa,PIB_KERIVNIKA=:PIBKerivnika,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'POSADA_KERIVNIKA=:PosadaKerivnika,OSOBA_SES=:PIBSES,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'VIDDIL_SES=:ViddilSES,POSADA_SES=:PosadaSES,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'TIPPRODUKCII=:TipProdukcii,ROZDIL_F18=:Rozdil18,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'TIP_SHTRAFU=:TipShtrafu,YEAR_=:Rik,VIDOMOSTI_PRO_VILUCHENNY=:VidomostiVstanoviv,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'TERMIN_REALIZACII=:TerminRealizacii,VSTANOVIV=:Vstanoviv,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'NE_VIDPOVIDAJUT=:NeVidpovidajut,VILUCHITI=:Viluchiti,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'DATA_VILUCHENNY=:DataViluchenny,CHAS_VILUCHENNY=:ChasViluchenny,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'POSADA_GDSL=:PosadaGDSL,PIB_GDSL=:PIBGDSL';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'where RECORD_ID=:Kod';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='MIMISTRY';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='TERITORY';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='NomerPostanovi';
      qViluchennyZRealizacii.Params[3].Value:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='DataPostanovi';
      qViluchennyZRealizacii.Params[4].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date));
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[5].Name:='Zapiska';
      qViluchennyZRealizacii.Params[5].Value:=frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex;
      case frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex of
        0:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[6].Name:='DataAktuZ';
            qViluchennyZRealizacii.Params[6].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpData.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[7].Name:='DataAktuDo';
            qViluchennyZRealizacii.Params[7].Value:='';
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[8].Name:='NomerAktu';
            qViluchennyZRealizacii.Params[8].Value:='';
          end;
        1:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[6].Name:='DataAktuZ';
            qViluchennyZRealizacii.Params[6].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpData.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[7].Name:='DataAktuDo';
            qViluchennyZRealizacii.Params[7].Value:='';
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[8].Name:='NomerAktu';
            qViluchennyZRealizacii.Params[8].Value:=frmViluchennyZRealizaciiEdit.edtNomer.Text;
          end;
        2:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[6].Name:='DataAktuZ';
            qViluchennyZRealizacii.Params[6].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpData.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[7].Name:='DataAktuDo';
            qViluchennyZRealizacii.Params[7].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataDo.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[8].Name:='NomerAktu';
            qViluchennyZRealizacii.Params[8].Value:=frmViluchennyZRealizaciiEdit.edtNomer.Text;
          end;
      end;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[9].Name:='Dodatkovo';
      qViluchennyZRealizacii.Params[9].Value:=frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[10].Name:='NazvaObjektu';
      qViluchennyZRealizacii.Params[10].Value:=frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[11].Name:='VidomchaPidporydkovanist';
      qViluchennyZRealizacii.Params[11].Value:=frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[12].Name:='Adresa';
      qViluchennyZRealizacii.Params[12].Value:=frmViluchennyZRealizaciiEdit.edtAdresa.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[13].Name:='PIBKerivnika';
      qViluchennyZRealizacii.Params[13].Value:=frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[14].Name:='PosadaKerivnika';
      qViluchennyZRealizacii.Params[14].Value:=frmViluchennyZRealizaciiEdit.edtPosada.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[15].Name:='PIBSES';
      qViluchennyZRealizacii.Params[15].Value:=frmViluchennyZRealizaciiEdit.cbOsobaSES.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[16].Name:='ViddilSES';
      qViluchennyZRealizacii.Params[16].Value:=frmViluchennyZRealizaciiEdit.cbViddilSES.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[17].Name:='PosadaSES';
      qViluchennyZRealizacii.Params[17].Value:=frmViluchennyZRealizaciiEdit.cbPosadaSES.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[18].Name:='TipProdukcii';
      frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
      frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
      frmViluchennyZRealizaciiEdit.qRecordID.Open;
      if frmViluchennyZRealizaciiEdit.qRecordID.Locate('TIPPRODUKCII',frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text,[]) then qViluchennyZRealizacii.Params[18].Value:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else qViluchennyZRealizacii.Params[18].Value:='';
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[19].Name:='Rozdil18';
      qViluchennyZRealizacii.Params[19].Value:=frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[20].Name:='TipShtrafu';
      qViluchennyZRealizacii.Params[20].Value:=frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[21].Name:='Rik';
      qViluchennyZRealizacii.Params[21].Value:=frmViluchennyZRealizaciiEdit.edtYear.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[22].Name:='VidomostiVstanoviv';
      qViluchennyZRealizacii.Params[22].Value:=frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex;
      case frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex of
        0:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[23].Name:='TerminRealizacii';
            qViluchennyZRealizacii.Params[23].Value:='';
          end;
        1:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[23].Name:='TerminRealizacii';
            qViluchennyZRealizacii.Params[23].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Date));
          end;
        2:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[23].Name:='TerminRealizacii';
            qViluchennyZRealizacii.Params[23].Value:='';
          end;
      end;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[24].Name:='Vstanoviv';
      qViluchennyZRealizacii.Params[24].Value:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[25].Name:='NeVidpovidajut';
      qViluchennyZRealizacii.Params[25].Value:=frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[26].Name:='Viluchiti';
      qViluchennyZRealizacii.Params[26].Value:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[27].Name:='DataViluchenny';
      qViluchennyZRealizacii.Params[27].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date));
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[28].Name:='ChasViluchenny';
      qViluchennyZRealizacii.Params[28].Value:=frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[29].Name:='PosadaGDSL';
      qViluchennyZRealizacii.Params[29].Value:=frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[30].Name:='PIBGDSL';
      qViluchennyZRealizacii.Params[30].Value:=frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[31].Name:='Kod';
      qViluchennyZRealizacii.Params[31].Value:=frmViluchennyZRealizaciiEdit.edtRecordID.Text;
      qViluchennyZRealizacii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmViluchennyZRealizaciiEdit.Close;
    frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
    exit;
  end;

  if frmViluchennyZRealizaciiEdit.Caption='Додавання запису' then
  begin
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from MINISTRY where MINISTRY=:Ministry order by MINISTRY';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Ministry';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=frmViluchennyZRealizaciiEdit.cbMinistry.Text;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.Locate('MINISTRY',frmViluchennyZRealizaciiEdit.cbMinistry.Text,[]) then Ministry:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else Ministry:=0;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from TERITORY where MINISTRY=:Ministry and TERITORY=:Teritory order by TERITORY';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Ministry';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=Ministry;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Name:='Teritory';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Value:=frmViluchennyZRealizaciiEdit.cbTeritory.Text;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.Locate('TERITORY',frmViluchennyZRealizaciiEdit.cbTeritory.Text,[]) then Teritory:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else Teritory:=0;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from RAJONI where MINISTRY=:Ministry and TERITORY=:Teritory and RAJON=:Rajon order by RAJON';
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Clear;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Name:='Ministry';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[0].Value:=Ministry;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Name:='Teritory';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[1].Value:=Teritory;
    frmViluchennyZRealizaciiEdit.qRecordID.Params.Add;
    frmViluchennyZRealizaciiEdit.qRecordID.Params[2].Name:='Rajon';
    frmViluchennyZRealizaciiEdit.qRecordID.Params[2].Value:=frmViluchennyZRealizaciiEdit.cbDistrict.Text;
    frmViluchennyZRealizaciiEdit.qRecordID.Open;
    if frmViluchennyZRealizaciiEdit.qRecordID.Locate('RAJON',frmViluchennyZRealizaciiEdit.cbDistrict.Text,[]) then District:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else District:=0;
    if frmViluchennyZRealizaciiEdit.edtRecordID.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmViluchennyZRealizaciiEdit.edtRecordID.Text);
    except
      frmViluchennyZRealizaciiEdit.aRecordIDUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    try
      StrToInt(frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text);
    except
      frmViluchennyZRealizaciiEdit.aNomerPostanoviUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtNomerPostanovi.SetFocus;
      exit;
    end;
    case frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex of
     -1:
        begin
          frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex:=0;
          frmViluchennyZRealizaciiEdit.aAkt_Dovidka_UpdateExecute(sender);
          frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
          frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
          exit;
        end;
      0:
        begin
          if int(frmViluchennyZRealizaciiEdit.dtpData.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
        end;
      1:
        begin
          if int(frmViluchennyZRealizaciiEdit.dtpData.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmViluchennyZRealizaciiEdit.edtNomer.Text='' then
          begin
            frmViluchennyZRealizaciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
      2:
        begin
          if int(frmViluchennyZRealizaciiEdit.dtpDataDo.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
          if int(frmViluchennyZRealizaciiEdit.dtpData.Date)>int(frmViluchennyZRealizaciiEdit.dtpDataDo.Date) then
          begin
            frmViluchennyZRealizaciiEdit.dtpData.Date:=int(date);
            frmViluchennyZRealizaciiEdit.dtpData.SetFocus;
            exit;
          end;
          if frmViluchennyZRealizaciiEdit.edtNomer.Text='' then
          begin
            frmViluchennyZRealizaciiEdit.edtNomer.SetFocus;
            exit;
          end;
        end;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProObjekt;
    if frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtAdresa.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtAdresa.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtPIBKerivnika.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPosada.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.edtPosada.SetFocus;
      exit;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProPereviryjuchogo;
    if frmViluchennyZRealizaciiEdit.cbOsobaSES.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbOsobaSES.Text:='';
      frmViluchennyZRealizaciiEdit.cbOsobaSES.Items.Clear;
      frmViluchennyZRealizaciiEdit.aOsobaSES_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbOsobaSES.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbViddilSES.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbViddilSES.Text:='';
      frmViluchennyZRealizaciiEdit.cbViddilSES.Items.Clear;
      frmViluchennyZRealizaciiEdit.aViddilSES_UdpateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbViddilSES.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbPosadaSES.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Text:='';
      frmViluchennyZRealizaciiEdit.cbPosadaSES.Items.Clear;
      frmViluchennyZRealizaciiEdit.aPosadaSES_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbPosadaSES.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text:='';
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.Items.Clear;
      frmViluchennyZRealizaciiEdit.aTipProdukcii_ChoiceExecute(sender);
      frmViluchennyZRealizaciiEdit.cbTipProdukcii.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text:='';
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Items.Clear;
      frmViluchennyZRealizaciiEdit.aRozdil_T23_F18_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text:='';
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.Items.Clear;
      frmViluchennyZRealizaciiEdit.aTipPostanovi_UpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.cbTipPostanovi.SetFocus;
      exit;
    end;
    if int(StrToInt(frmViluchennyZRealizaciiEdit.edtYear.Text))<>YearOf(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date)) then
    begin
      if MessageDlg('Увага!'+#13+'Рік постанови та звітний рік не співпадають!'+#13+'Збережені відомості будуть віднесені до іншого періоду, що може відобразитись на звітах!'+#13+'Продовжити збереження відомостей постанови?''',mtWarning,[mbYes,mbNo],0)=mrNo then
      begin
        frmViluchennyZRealizaciiEdit.edtYear.Text:='';
        frmViluchennyZRealizaciiEdit.aYearUpdateExecute(sender);
        frmViluchennyZRealizaciiEdit.edtYear.SetFocus;
        exit;
      end;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
    frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
    if frmViluchennyZRealizaciiEdit.qVidomostiProViluchenny.RecordCount<=0 then
    begin
      MessageDlg('Увага!'+#13+'Не введено відомостей про вилучення!'+#13+'Введіть відомості про вилучену продукцію!',mtError,[mbOK],0);
      frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
      frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
      exit;
    end;
    case frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex of
     -1:
        begin
          frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex:=0;
          frmViluchennyZRealizaciiEdit.rgVstanoviv.SetFocus;
          exit;
        end;
      0:
        begin
          frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
          if frmViluchennyZRealizaciiEdit.qRecordID.RecordCount<=0 then
          begin
            frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
            frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
            exit;
          end;
        end;
      1:
        begin
          frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
          if frmViluchennyZRealizaciiEdit.qRecordID.RecordCount<=0 then
          begin
            frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
            frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
            exit;
          end;
        end;
      2:
        begin
          frmViluchennyZRealizaciiEdit.aUpdateViluchennyExecute(sender);
          if frmViluchennyZRealizaciiEdit.qRecordID.RecordCount<=0 then
          begin
            frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsVidomostiProViluchenny;
            frmViluchennyZRealizaciiEdit.aAddViluchennyExecute(sender);
            exit;
          end;
        end;
    end;

    frmViluchennyZRealizaciiEdit.pcViluchennyZRealizacii.ActivePage:=frmViluchennyZRealizaciiEdit.tsZmistPostanovi;
    if frmViluchennyZRealizaciiEdit.memVstanoviv.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aVstanovivUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.memVstanoviv.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.memNeVidpovidajut.SetFocus;
      frmViluchennyZRealizaciiEdit.aNeVidpovidajutChoiceExecute(sender);
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtViluchiti.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aViluchitiUpdateExecute(sender);
      frmViluchennyZRealizaciiEdit.edtViluchiti.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
      frmViluchennyZRealizaciiEdit.edtPosadaGDSL.SetFocus;
      exit;
    end;
    if frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text='' then
    begin
      frmViluchennyZRealizaciiEdit.aPIB_Posada_GDSLExecute(sender);
      frmViluchennyZRealizaciiEdit.edtPIBGDSL.SetFocus;
      exit;
    end;
    with frmViluchennyZRealizacii do
    begin
      qViluchennyZRealizacii.SQL.Clear;
      qViluchennyZRealizacii.SQL.Text:='update VILUCHENNY_Z_REALIZACII set MINISTRY=:Ministry,TERITORY=:Teritory,DISTRICT=:Rajon,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'NOMER_POSTANOVI=:NomerPostanovi,DATA_POSTANOVI=:DataPostanovi,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'AKT_ZAPISKA=:Zapiska,DATA_AKTU_OBSTEZHENNY=:DataAktuZ,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'DATA_AKTU_OBSTEZHENNY_DO=:DataAktuDo,NOMER_AKTU_OBSTEZHENNY=:NomerAktu,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'DODATKOVA_INFORMACIY=:Dodatkovo,NAZVA_OBJEKTU=:NazvaObjektu,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'VIDOMCHA_PIDPORYDKOVANIST=:VidomchaPidporydkovanist,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'ADRESA=:Adresa,PIB_KERIVNIKA=:PIBKerivnika,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'POSADA_KERIVNIKA=:PosadaKerivnika,OSOBA_SES=:PIBSES,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'VIDDIL_SES=:ViddilSES,POSADA_SES=:PosadaSES,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'TIPPRODUKCII=:TipProdukcii,ROZDIL_F18=:Rozdil18,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'TIP_SHTRAFU=:TipShtrafu,YEAR_=:Rik,VIDOMOSTI_PRO_VILUCHENNY=:VidomostiVstanoviv,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'TERMIN_REALIZACII=:TerminRealizacii,VSTANOVIV=:Vstanoviv,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'NE_VIDPOVIDAJUT=:NeVidpovidajut,VILUCHITI=:Viluchiti,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'DATA_VILUCHENNY=:DataViluchenny,CHAS_VILUCHENNY=:ChasViluchenny,';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'POSADA_GDSL=:PosadaGDSL,PIB_GDSL=:PIBGDSL';
      qViluchennyZRealizacii.SQL.Text:=qViluchennyZRealizacii.SQL.Text+'where RECORD_ID=:Kod';
      qViluchennyZRealizacii.Params.Clear;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[0].Name:='MIMISTRY';
      qViluchennyZRealizacii.Params[0].Value:=Ministry;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[1].Name:='TERITORY';
      qViluchennyZRealizacii.Params[1].Value:=Teritory;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[2].Name:='Rajon';
      qViluchennyZRealizacii.Params[2].Value:=District;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[3].Name:='NomerPostanovi';
      qViluchennyZRealizacii.Params[3].Value:=frmViluchennyZRealizaciiEdit.edtNomerPostanovi.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[4].Name:='DataPostanovi';
      qViluchennyZRealizacii.Params[4].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataPostanovi.Date));
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[5].Name:='Zapiska';
      qViluchennyZRealizacii.Params[5].Value:=frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex;
      case frmViluchennyZRealizaciiEdit.rgAkt_Dovidka.ItemIndex of
        0:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[6].Name:='DataAktuZ';
            qViluchennyZRealizacii.Params[6].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpData.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[7].Name:='DataAktuDo';
            qViluchennyZRealizacii.Params[7].Value:='';
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[8].Name:='NomerAktu';
            qViluchennyZRealizacii.Params[8].Value:='';
          end;
        1:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[6].Name:='DataAktuZ';
            qViluchennyZRealizacii.Params[6].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpData.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[7].Name:='DataAktuDo';
            qViluchennyZRealizacii.Params[7].Value:='';
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[8].Name:='NomerAktu';
            qViluchennyZRealizacii.Params[8].Value:=frmViluchennyZRealizaciiEdit.edtNomer.Text;
          end;
        2:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[6].Name:='DataAktuZ';
            qViluchennyZRealizacii.Params[6].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpData.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[7].Name:='DataAktuDo';
            qViluchennyZRealizacii.Params[7].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataDo.Date));
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[8].Name:='NomerAktu';
            qViluchennyZRealizacii.Params[8].Value:=frmViluchennyZRealizaciiEdit.edtNomer.Text;
          end;
      end;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[9].Name:='Dodatkovo';
      qViluchennyZRealizacii.Params[9].Value:=frmViluchennyZRealizaciiEdit.edtDodatkovaInformaciy.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[10].Name:='NazvaObjektu';
      qViluchennyZRealizacii.Params[10].Value:=frmViluchennyZRealizaciiEdit.edtNajmenuvannyObjektu.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[11].Name:='VidomchaPidporydkovanist';
      qViluchennyZRealizacii.Params[11].Value:=frmViluchennyZRealizaciiEdit.edtVidomchaPidporydkovanist.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[12].Name:='Adresa';
      qViluchennyZRealizacii.Params[12].Value:=frmViluchennyZRealizaciiEdit.edtAdresa.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[13].Name:='PIBKerivnika';
      qViluchennyZRealizacii.Params[13].Value:=frmViluchennyZRealizaciiEdit.edtPIBKerivnika.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[14].Name:='PosadaKerivnika';
      qViluchennyZRealizacii.Params[14].Value:=frmViluchennyZRealizaciiEdit.edtPosada.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[15].Name:='PIBSES';
      qViluchennyZRealizacii.Params[15].Value:=frmViluchennyZRealizaciiEdit.cbOsobaSES.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[16].Name:='ViddilSES';
      qViluchennyZRealizacii.Params[16].Value:=frmViluchennyZRealizaciiEdit.cbViddilSES.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[17].Name:='PosadaSES';
      qViluchennyZRealizacii.Params[17].Value:=frmViluchennyZRealizaciiEdit.cbPosadaSES.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[18].Name:='TipProdukcii';
      frmViluchennyZRealizaciiEdit.qRecordID.SQL.Clear;
      frmViluchennyZRealizaciiEdit.qRecordID.SQL.Text:='select * from TIPIPRODUKCII order by TIPPRODUKCII';
      frmViluchennyZRealizaciiEdit.qRecordID.Open;
      if frmViluchennyZRealizaciiEdit.qRecordID.Locate('TIPPRODUKCII',frmViluchennyZRealizaciiEdit.cbTipProdukcii.Text,[]) then qViluchennyZRealizacii.Params[18].Value:=frmViluchennyZRealizaciiEdit.qRecordID.FieldByName('KOD').Value else qViluchennyZRealizacii.Params[18].Value:='';
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[19].Name:='Rozdil18';
      qViluchennyZRealizacii.Params[19].Value:=frmViluchennyZRealizaciiEdit.cbRozdil_T23_F18.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[20].Name:='TipShtrafu';
      qViluchennyZRealizacii.Params[20].Value:=frmViluchennyZRealizaciiEdit.cbTipPostanovi.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[21].Name:='Rik';
      qViluchennyZRealizacii.Params[21].Value:=frmViluchennyZRealizaciiEdit.edtYear.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[22].Name:='VidomostiVstanoviv';
      qViluchennyZRealizacii.Params[22].Value:=frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex;
      case frmViluchennyZRealizaciiEdit.rgVstanoviv.ItemIndex of
        0:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[23].Name:='TerminRealizacii';
            qViluchennyZRealizacii.Params[23].Value:='';
          end;
        1:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[23].Name:='TerminRealizacii';
            qViluchennyZRealizacii.Params[23].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpTerminRealizacii.Date));
          end;
        2:
          begin
            qViluchennyZRealizacii.Params.Add;
            qViluchennyZRealizacii.Params[23].Name:='TerminRealizacii';
            qViluchennyZRealizacii.Params[23].Value:='';
          end;
      end;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[24].Name:='Vstanoviv';
      qViluchennyZRealizacii.Params[24].Value:=frmViluchennyZRealizaciiEdit.memVstanoviv.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[25].Name:='NeVidpovidajut';
      qViluchennyZRealizacii.Params[25].Value:=frmViluchennyZRealizaciiEdit.memNeVidpovidajut.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[26].Name:='Viluchiti';
      qViluchennyZRealizacii.Params[26].Value:=frmViluchennyZRealizaciiEdit.edtViluchiti.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[27].Name:='DataViluchenny';
      qViluchennyZRealizacii.Params[27].Value:=DateToStr(int(frmViluchennyZRealizaciiEdit.dtpDataViluchenny.Date));
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[28].Name:='ChasViluchenny';
      qViluchennyZRealizacii.Params[28].Value:=frmViluchennyZRealizaciiEdit.edtChasViluchenny.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[29].Name:='PosadaGDSL';
      qViluchennyZRealizacii.Params[29].Value:=frmViluchennyZRealizaciiEdit.edtPosadaGDSL.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[30].Name:='PIBGDSL';
      qViluchennyZRealizacii.Params[30].Value:=frmViluchennyZRealizaciiEdit.edtPIBGDSL.Text;
      qViluchennyZRealizacii.Params.Add;
      qViluchennyZRealizacii.Params[31].Name:='Kod';
      qViluchennyZRealizacii.Params[31].Value:=frmViluchennyZRealizaciiEdit.edtRecordID.Text;
      qViluchennyZRealizacii.Open;
    end;
    frmMain.trAzz.CommitRetaining;
    frmViluchennyZRealizaciiEdit.Close;
    frmViluchennyZRealizacii.aUpdateViluchennyExecute(sender);
    exit;
  end;  //Додавання запису
end;

end.
