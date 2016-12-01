object frmZayvaDoVDVS: TfrmZayvaDoVDVS
  Left = 756
  Top = 43
  Width = 526
  Height = 355
  Caption = 'frmZayvaDoVDVS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 44
    Width = 120
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1076#1072#1095#1110' '#1076#1086' '#1042#1044#1042#1057
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 114
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111' '#1079#1072#1103#1074#1080
  end
  object Label3: TLabel
    Left = 300
    Top = 76
    Width = 79
    Height = 13
    Caption = #1042#1080#1093#1110#1076#1085#1080#1081' '#1085#1086#1084#1077#1088
  end
  object Label4: TLabel
    Left = 12
    Top = 108
    Width = 199
    Height = 13
    Caption = #1055'.'#1030'.'#1041'. '#1087#1086#1088#1091#1096#1085#1080#1082#1072', '#1087#1086#1089#1072#1076#1072', '#1084#1110#1089#1094#1077' '#1088#1086#1073#1086#1090#1080
  end
  object Label5: TLabel
    Left = 12
    Top = 12
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label6: TLabel
    Left = 196
    Top = 12
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label7: TLabel
    Left = 380
    Top = 12
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object edtVihidnijNomer: TEdit
    Left = 384
    Top = 76
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 5
    Text = 'edtVihidnijNomer'
  end
  object btnVikonati: TButton
    Left = 146
    Top = 284
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 8
  end
  object btnVidminiti: TButton
    Left = 222
    Top = 284
    Width = 75
    Height = 25
    Action = aCancel
    TabOrder = 9
  end
  object edtPIBPorushnikaTV_Posada_MisceRoboti: TEdit
    Left = 12
    Top = 124
    Width = 469
    Height = 21
    TabOrder = 6
    Text = 'edtPIBPorushnikaTV_Posada_MisceRoboti'
  end
  object btnPIBPorushnikaTV_Posada_MisceRoboti: TButton
    Left = 484
    Top = 124
    Width = 21
    Height = 21
    Action = aPIBPorushnikaTV_Posada_MisceRoboti
    TabOrder = 7
  end
  object dtpDataPeredachiDoVDVS: TDateTimePicker
    Left = 140
    Top = 44
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.8559890394
    Time = 39280.8559890394
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object dtpDataReestraciiZayvi: TDateTimePicker
    Left = 140
    Top = 76
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.8563831019
    Time = 39280.8563831019
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
  end
  object btnZakriti: TButton
    Left = 298
    Top = 284
    Width = 75
    Height = 25
    Action = aClose
    Cancel = True
    TabOrder = 10
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 12
    Width = 93
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 284
    Top = 12
    Width = 81
    Height = 21
    CalAlignment = dtaLeft
    Date = 40394.5435888657
    Time = 40394.5435888657
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtKod: TEdit
    Left = 404
    Top = 12
    Width = 101
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtKod'
  end
  object btnAdd: TButton
    Left = 432
    Top = 160
    Width = 75
    Height = 25
    Action = aAddNapravlenny
    TabOrder = 11
  end
  object btnEdit: TButton
    Left = 432
    Top = 188
    Width = 75
    Height = 25
    Action = aEditNapravlenny
    TabOrder = 12
  end
  object btnDelete: TButton
    Left = 432
    Top = 216
    Width = 75
    Height = 25
    Action = aDeleteNapravlenny
    TabOrder = 13
  end
  object btnUpdate: TButton
    Left = 432
    Top = 244
    Width = 75
    Height = 25
    Action = aUpdateNapravlenny
    TabOrder = 14
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 160
    Width = 417
    Height = 109
    DataSource = dsNapravlenny
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PIB'
        Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1030'.'#1041'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADA'
        Title.Caption = #1055#1086#1089#1072#1076#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_NAPRAVLENNY'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end>
  end
  object alZayavaDoVDVS: TActionList
    Left = 436
    Top = 40
    object aPIBPorushnikaTV_Posada_MisceRoboti: TAction
      Caption = '...'
      OnExecute = aPIBPorushnikaTV_Posada_MisceRobotiExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnExecute = aCloseExecute
    end
    object aAddNapravlenny: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddNapravlennyExecute
    end
    object aEditNapravlenny: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditNapravlennyExecute
    end
    object aDeleteNapravlenny: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteNapravlennyExecute
    end
    object aUpdateNapravlenny: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateNapravlennyExecute
    end
  end
  object dsNapravlenny: TDataSource
    DataSet = qNapravlenny
    Left = 180
    Top = 204
  end
  object qNapravlenny: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 208
    Top = 204
  end
end
