object frmSpivrobitnikiEdit: TfrmSpivrobitnikiEdit
  Left = 654
  Top = 107
  Width = 463
  Height = 341
  Caption = 'frmSpivrobitnikiEdit'
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
    Width = 91
    Height = 13
    Caption = #1050#1086#1076' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072
  end
  object Label2: TLabel
    Left = 12
    Top = 108
    Width = 53
    Height = 13
    Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103
  end
  object Label3: TLabel
    Left = 12
    Top = 172
    Width = 121
    Height = 13
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072
  end
  object Label4: TLabel
    Left = 12
    Top = 140
    Width = 38
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072
  end
  object Label5: TLabel
    Left = 32
    Top = 204
    Width = 102
    Height = 13
    Caption = #1074' '#1088#1086#1076#1086#1074#1086#1084#1091' '#1074#1110#1076#1084#1110#1085#1082#1091
  end
  object Label6: TLabel
    Left = 32
    Top = 236
    Width = 101
    Height = 13
    Caption = #1074' '#1086#1088#1091#1076#1085#1086#1084#1091' '#1074#1110#1076#1084#1110#1085#1082#1091
  end
  object Label7: TLabel
    Left = 12
    Top = 76
    Width = 31
    Height = 13
    Caption = #1056#1072#1081#1086#1085
  end
  object Label9: TLabel
    Left = 12
    Top = 44
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object edtKodSpivrobitnika: TEdit
    Left = 144
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodSpivrobitnika'
  end
  object edtPrizvische: TEdit
    Left = 144
    Top = 172
    Width = 297
    Height = 21
    ImeName = 'Russian'
    MaxLength = 75
    TabOrder = 14
    Text = 'edtPrizvische'
  end
  object btnVikonati: TButton
    Left = 148
    Top = 268
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 18
  end
  object btnVidmina: TButton
    Left = 228
    Top = 268
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 19
  end
  object btnPosadaUpdate: TButton
    Left = 396
    Top = 140
    Width = 21
    Height = 21
    Action = aPosadaUpdate
    TabOrder = 9
  end
  object edtPrizvische_RV: TEdit
    Left = 144
    Top = 204
    Width = 273
    Height = 21
    ImeName = 'Russian'
    TabOrder = 15
    Text = 'edtPrizvische_RV'
  end
  object edtPrizvische_TV: TEdit
    Left = 144
    Top = 236
    Width = 273
    Height = 21
    ImeName = 'Russian'
    TabOrder = 16
    Text = 'edtPrizvische_TV'
  end
  object btnVidminok: TButton
    Left = 420
    Top = 204
    Width = 21
    Height = 53
    Action = aVidminokChange
    TabOrder = 17
  end
  object btnRajonUpdate: TButton
    Left = 396
    Top = 76
    Width = 21
    Height = 21
    Action = aRajonUpdate
    TabOrder = 6
  end
  object btnKodSpivrobitnika: TButton
    Left = 268
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object cbTeritory: TComboBox
    Left = 120
    Top = 44
    Width = 273
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbTeritory'
    OnChange = aTeritoryChangeExecute
  end
  object btnTeritoryUpdate: TButton
    Left = 396
    Top = 44
    Width = 21
    Height = 21
    Action = aTeritoryUpdate
    TabOrder = 3
  end
  object cbRajon: TComboBox
    Left = 120
    Top = 76
    Width = 273
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbRajon'
  end
  object cbViddilenny: TComboBox
    Left = 120
    Top = 108
    Width = 273
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 11
    Text = 'cbViddilenny'
  end
  object btnViddilennyUpdate: TButton
    Left = 396
    Top = 108
    Width = 21
    Height = 21
    Action = aViddilennyUpdate
    TabOrder = 12
  end
  object cbPosada: TComboBox
    Left = 120
    Top = 140
    Width = 273
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 8
    Text = 'cbPosada'
  end
  object btnTeritoryChoice: TButton
    Left = 420
    Top = 44
    Width = 21
    Height = 21
    Action = aTeritoryChoice
    TabOrder = 4
  end
  object btnRajonChoice: TButton
    Left = 420
    Top = 76
    Width = 21
    Height = 21
    Action = aRajonChoice
    TabOrder = 7
  end
  object btnViddilennyChoice: TButton
    Left = 420
    Top = 108
    Width = 21
    Height = 21
    Action = aViddilennyChoice
    TabOrder = 13
  end
  object btnPosadaChoice: TButton
    Left = 420
    Top = 140
    Width = 21
    Height = 21
    Action = aPosadaChoice
    TabOrder = 10
  end
  object alSpivrobitnikiEdit: TActionList
    Left = 344
    Top = 8
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aTeritoryUpdate: TAction
      Caption = '@'
      OnExecute = aTeritoryUpdateExecute
    end
    object aTeritoryChoice: TAction
      Caption = '...'
      OnExecute = aTeritoryChoiceExecute
    end
    object aTeritoryChange: TAction
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aRajonUpdate: TAction
      Caption = '@'
      OnExecute = aRajonUpdateExecute
    end
    object aRajonChoice: TAction
      Caption = '...'
      OnExecute = aRajonChoiceExecute
    end
    object aViddilennyUpdate: TAction
      Caption = '@'
      OnExecute = aViddilennyUpdateExecute
    end
    object aViddilennyChoice: TAction
      Caption = '...'
      OnExecute = aViddilennyChoiceExecute
    end
    object aPosadaUpdate: TAction
      Caption = '@'
      OnExecute = aPosadaUpdateExecute
    end
    object aPosadaChoice: TAction
      Caption = '...'
      OnExecute = aPosadaChoiceExecute
    end
    object aVidminokChange: TAction
      Caption = '...'
      OnExecute = aVidminokChangeExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 13
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
