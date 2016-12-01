object frmOpechanuvanny: TfrmOpechanuvanny
  Left = 642
  Top = 0
  Width = 558
  Height = 409
  Caption = 'frmOpechanuvanny'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 44
    Width = 59
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1072#1082#1090#1091
  end
  object Label2: TLabel
    Left = 216
    Top = 44
    Width = 51
    Height = 13
    Caption = #1044#1072#1090#1072' '#1072#1082#1090#1091
  end
  object Label9: TLabel
    Left = 12
    Top = 12
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label10: TLabel
    Left = 189
    Top = 12
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label11: TLabel
    Left = 400
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Recotd ID'
    Enabled = False
  end
  object Label5: TLabel
    Left = 12
    Top = 308
    Width = 79
    Height = 13
    Caption = #1057#1091#1090#1100' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object edtNomerAktuOplombuvanny: TEdit
    Left = 80
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'edtNomerAktuOplombuvanny'
  end
  object dtpDataOplombuvanny: TDateTimePicker
    Left = 276
    Top = 44
    Width = 97
    Height = 21
    CalAlignment = dtaLeft
    Date = 39360.8870422801
    Time = 39360.8870422801
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
  end
  object rgOpechatuvanny: TRadioGroup
    Left = 12
    Top = 264
    Width = 529
    Height = 33
    Columns = 2
    Items.Strings = (
      #1054#1087#1077#1095#1072#1090#1091#1074#1072#1085#1085#1103
      #1054#1087#1083#1086#1084#1073#1091#1074#1072#1085#1085#1103)
    TabOrder = 8
    TabStop = True
  end
  object btnVikonati: TButton
    Left = 197
    Top = 340
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 9
  end
  object btnVidminiti: TButton
    Left = 277
    Top = 340
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 10
  end
  object btnNomerAktu: TButton
    Left = 376
    Top = 44
    Width = 21
    Height = 21
    Action = aNomerAktuUpdate
    TabOrder = 5
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 12
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 277
    Top = 12
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 40445.613332963
    Time = 40445.613332963
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtRecord_ID: TEdit
    Left = 456
    Top = 12
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtRecord_ID'
  end
  object gbPredstavnikSES: TGroupBox
    Left = 12
    Top = 76
    Width = 529
    Height = 73
    Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082' '#1057#1045#1057
    TabOrder = 6
    object Label12: TLabel
      Left = 8
      Top = 16
      Width = 27
      Height = 13
      Caption = #1055'.'#1030'.'#1041'.'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 38
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
    end
    object cbPIBPredstavnikaSES: TComboBox
      Left = 40
      Top = 16
      Width = 433
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbPIBPredstavnikaSES'
      OnChange = aPIBPredstavnikaSES_ChangeExecute
    end
    object btnPIBPredstavnikaSES_Update: TButton
      Left = 476
      Top = 16
      Width = 21
      Height = 21
      Action = aPIBPredstavnikaSES_Update
      TabOrder = 1
    end
    object btnPIBPredstavnikaSES_Choice: TButton
      Left = 500
      Top = 16
      Width = 21
      Height = 21
      Action = aPIBPredstavnikaSES_Choice
      TabOrder = 2
    end
    object cbPosadaPredstavnikaSES: TComboBox
      Left = 52
      Top = 44
      Width = 421
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      Text = 'cbPosadaPredstavnikaSES'
    end
    object btnPosadaPredstavnikaSES_Update: TButton
      Left = 476
      Top = 44
      Width = 21
      Height = 21
      Action = aPosadaPredstavnikaSES_Update
      TabOrder = 4
    end
    object btnPosadaPredstavnikaSES_Choice: TButton
      Left = 500
      Top = 44
      Width = 21
      Height = 21
      Action = aPosadaPredstavnikaSES_Choice
      TabOrder = 5
    end
  end
  object gbObjekt: TGroupBox
    Left = 12
    Top = 156
    Width = 529
    Height = 101
    Caption = #1054#1073#39#1108#1082#1090
    TabOrder = 7
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 32
      Height = 13
      Caption = #1053#1072#1079#1074#1072
    end
    object Label13: TLabel
      Left = 8
      Top = 44
      Width = 101
      Height = 13
      Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072
    end
    object Label14: TLabel
      Left = 8
      Top = 72
      Width = 112
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072
    end
    object edtPIBPredstavnikaObjektu: TEdit
      Left = 116
      Top = 44
      Width = 381
      Height = 21
      TabOrder = 1
      Text = 'edtPIBPredstavnikaObjektu'
    end
    object edtPosadaPredstavnikaObjektu: TEdit
      Left = 128
      Top = 72
      Width = 369
      Height = 21
      TabOrder = 2
      Text = 'edtPosadaPredstavnikaObjektu'
    end
    object btnNazvaObjektu_Choice: TButton
      Left = 500
      Top = 16
      Width = 21
      Height = 77
      Action = aNazvaObjektu_Choice
      TabOrder = 3
    end
    object edtNazvaObjektu: TEdit
      Left = 48
      Top = 16
      Width = 449
      Height = 21
      TabOrder = 0
      Text = 'edtNazvaObjektu'
    end
  end
  object cbNazvaUstatkuvanny: TComboBox
    Left = 100
    Top = 308
    Width = 393
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = 'cbNazvaUstatkuvanny'
  end
  object btnNazvaUstatkuvanny_Update: TButton
    Left = 496
    Top = 308
    Width = 21
    Height = 21
    Action = aNazvaUstatkuvanny_Update
    TabOrder = 12
  end
  object btnNazvaUstatkuvanny_Choice: TButton
    Left = 520
    Top = 308
    Width = 21
    Height = 21
    Action = aNazvaUstatkuvanny_Choice
    TabOrder = 13
  end
  object alOpechatuvanny: TActionList
    Left = 416
    Top = 32
    object aRecordID_Update: TAction
      Caption = 'aRecordID_Update'
      OnExecute = aRecordID_UpdateExecute
    end
    object aNomerAktuUpdate: TAction
      Caption = '...'
      OnExecute = aNomerAktuUpdateExecute
    end
    object aPIBPredstavnikaSES_Update: TAction
      Caption = '@'
      OnExecute = aPIBPredstavnikaSES_UpdateExecute
    end
    object aPIBPredstavnikaSES_Choice: TAction
      Caption = '...'
      OnExecute = aPIBPredstavnikaSES_ChoiceExecute
    end
    object aPIBPredstavnikaSES_Change: TAction
      Caption = 'aPIBPredstavnikaSES_Change'
      OnExecute = aPIBPredstavnikaSES_ChangeExecute
    end
    object aPosadaPredstavnikaSES_Update: TAction
      Caption = '@'
      OnExecute = aPosadaPredstavnikaSES_UpdateExecute
    end
    object aPosadaPredstavnikaSES_Choice: TAction
      Caption = '...'
      OnExecute = aPosadaPredstavnikaSES_ChoiceExecute
    end
    object aNazvaObjektu_Choice: TAction
      Caption = '...'
      OnExecute = aNazvaObjektu_ChoiceExecute
    end
    object aNazvaUstatkuvanny_Update: TAction
      Caption = '@'
      OnExecute = aNazvaUstatkuvanny_UpdateExecute
    end
    object aNazvaUstatkuvanny_Choice: TAction
      Caption = '...'
      OnExecute = aNazvaUstatkuvanny_ChoiceExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
  end
  object qID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 244
    Top = 48
  end
end
