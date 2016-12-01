object frmRaport: TfrmRaport
  Left = 721
  Top = 121
  Width = 525
  Height = 221
  Caption = 'frmRaport'
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
    Top = 12
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label2: TLabel
    Left = 180
    Top = 12
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label3: TLabel
    Left = 12
    Top = 48
    Width = 43
    Height = 13
    Caption = #8470' '#1083#1080#1089#1090#1072
  end
  object Label4: TLabel
    Left = 244
    Top = 48
    Width = 58
    Height = 13
    Caption = #1044#1072#1090#1072' '#1083#1080#1089#1090#1072
  end
  object Label7: TLabel
    Left = 364
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object Label9: TLabel
    Left = 12
    Top = 80
    Width = 125
    Height = 13
    Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
  end
  object Label10: TLabel
    Left = 12
    Top = 116
    Width = 136
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
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
    Left = 268
    Top = 12
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 39461.9591970486
    Time = 39461.9591970486
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtNomerLista: TEdit
    Left = 84
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtNomerLista'
  end
  object dtpDataLista: TDateTimePicker
    Left = 308
    Top = 48
    Width = 101
    Height = 21
    CalAlignment = dtaLeft
    Date = 39461.9594645139
    Time = 39461.9594645139
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object btnVikonati: TButton
    Left = 181
    Top = 152
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnVidminiti: TButton
    Left = 261
    Top = 152
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object edtRecord_ID: TEdit
    Left = 420
    Top = 12
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'edtRecord_ID'
  end
  object cbPIBPredstavnika: TComboBox
    Left = 144
    Top = 80
    Width = 313
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbPIBPredstavnika'
    OnChange = aPIBPredstavnika_ChangeExecute
  end
  object btnPIBPredstavnika_Update: TButton
    Left = 460
    Top = 80
    Width = 21
    Height = 21
    Action = aPIBPredstavnika_Update
    TabOrder = 8
  end
  object btnPIBPredstavnika_Choice: TButton
    Left = 484
    Top = 80
    Width = 21
    Height = 21
    Action = aPIBPredstavnika_Choice
    TabOrder = 9
  end
  object cbPosadaPredstavnika: TComboBox
    Left = 156
    Top = 116
    Width = 301
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = 'cbPosadaPredstavnika'
  end
  object btnPosadaPredstavnika_Update: TButton
    Left = 460
    Top = 116
    Width = 21
    Height = 21
    Action = aPosadaPredstavnika_Update
    TabOrder = 11
  end
  object btnPosadaPredstavnika_Choice: TButton
    Left = 484
    Top = 116
    Width = 21
    Height = 21
    Action = aPosadaPredstavnika_Choice
    TabOrder = 12
  end
  object alRaport: TActionList
    Left = 372
    Top = 132
    object aRecordID_Update: TAction
      Caption = 'aRecordID_Update'
      OnExecute = aRecordID_UpdateExecute
    end
    object aPIBPredstavnika_Update: TAction
      Caption = '@'
      OnExecute = aPIBPredstavnika_UpdateExecute
    end
    object aPIBPredstavnika_Choice: TAction
      Caption = '...'
      OnExecute = aPIBPredstavnika_ChoiceExecute
    end
    object aPIBPredstavnika_Change: TAction
      Caption = 'aPIBPredstavnika_Change'
      OnExecute = aPIBPredstavnika_ChangeExecute
    end
    object aPosadaPredstavnika_Update: TAction
      Caption = '@'
      OnExecute = aPosadaPredstavnika_UpdateExecute
    end
    object aPosadaPredstavnika_Choice: TAction
      Caption = '...'
      OnExecute = aPosadaPredstavnika_ChoiceExecute
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
    Left = 20
    Top = 136
  end
end
