object frmViddilennyEdit: TfrmViddilennyEdit
  Left = 843
  Top = 435
  Width = 437
  Height = 305
  Caption = 'frmViddilennyEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 74
    Height = 13
    Caption = #1050#1086#1076' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
  end
  object Label2: TLabel
    Left = 12
    Top = 140
    Width = 87
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
  end
  object Label3: TLabel
    Left = 32
    Top = 172
    Width = 58
    Height = 13
    Caption = #1074' '#1088#1086#1076#1086#1074#1086#1084#1091
  end
  object Label4: TLabel
    Left = 32
    Top = 204
    Width = 57
    Height = 13
    Caption = #1074' '#1086#1088#1091#1076#1085#1086#1084#1091
  end
  object Label5: TLabel
    Left = 12
    Top = 108
    Width = 31
    Height = 13
    Caption = #1056#1072#1081#1086#1085
  end
  object Label6: TLabel
    Left = 12
    Top = 44
    Width = 65
    Height = 13
    Caption = #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
  end
  object Label7: TLabel
    Left = 12
    Top = 76
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object edtKodViddilenny: TEdit
    Left = 116
    Top = 12
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodViddilenny'
  end
  object edtNazvaViddilenny: TEdit
    Left = 116
    Top = 140
    Width = 301
    Height = 21
    MaxLength = 75
    TabOrder = 11
    Text = 'edtNazvaViddilenny'
  end
  object btnVikonati: TButton
    Left = 137
    Top = 236
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 15
  end
  object btnVidmina: TButton
    Left = 217
    Top = 236
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 16
  end
  object edtNazvaViddilenny_RV: TEdit
    Left = 116
    Top = 172
    Width = 281
    Height = 21
    TabOrder = 12
    Text = 'edtNazvaViddilenny_RV'
  end
  object edtNazvaViddilenny_TV: TEdit
    Left = 116
    Top = 204
    Width = 281
    Height = 21
    TabOrder = 13
    Text = 'edtNazvaViddilenny_TV'
  end
  object btnVidminok: TButton
    Left = 396
    Top = 172
    Width = 21
    Height = 53
    Action = aViddilennyChange
    TabOrder = 14
  end
  object btnKodViddilenny: TButton
    Left = 240
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object btnRajonUpdate: TButton
    Left = 372
    Top = 108
    Width = 21
    Height = 21
    Action = aDistrictUpdate
    TabOrder = 9
  end
  object btnMinistryUpdate: TButton
    Left = 372
    Top = 44
    Width = 21
    Height = 21
    Action = aMinistryUpdate
    BiDiMode = bdRightToLeft
    ParentBiDiMode = False
    TabOrder = 3
  end
  object btnTeritoryUpdate: TButton
    Left = 372
    Top = 76
    Width = 21
    Height = 21
    Action = aTeritoryUpdate
    TabOrder = 6
  end
  object cbMinistry: TComboBox
    Left = 116
    Top = 44
    Width = 253
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbMinistry'
    OnChange = aMinistryChangeExecute
  end
  object cbTeritory: TComboBox
    Left = 116
    Top = 76
    Width = 253
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbTeritory'
    OnChange = aTeritoryChangeExecute
  end
  object cbRajon: TComboBox
    Left = 116
    Top = 108
    Width = 253
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'cbRajon'
  end
  object btnMinistryChoice: TButton
    Left = 396
    Top = 44
    Width = 21
    Height = 21
    Action = aMinistryChoice
    TabOrder = 4
  end
  object btnTeritoryChoice: TButton
    Left = 396
    Top = 76
    Width = 21
    Height = 21
    Action = aTeritoryChoice
    TabOrder = 7
  end
  object btnRajonChoice: TButton
    Left = 396
    Top = 108
    Width = 21
    Height = 21
    Action = aDistrictChoice
    TabOrder = 10
  end
  object alViddilennyEdit: TActionList
    Left = 332
    Top = 4
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aMinistryUpdate: TAction
      Caption = '@'
      OnExecute = aMinistryUpdateExecute
    end
    object aMinistryChoice: TAction
      Caption = '...'
      OnExecute = aMinistryChoiceExecute
    end
    object aMinistryChange: TAction
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
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
    object aDistrictUpdate: TAction
      Caption = '@'
      OnExecute = aDistrictUpdateExecute
    end
    object aDistrictChoice: TAction
      Caption = '...'
      OnExecute = aDistrictChoiceExecute
    end
    object aViddilennyChange: TAction
      Caption = '...'
      OnExecute = aViddilennyChangeExecute
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
