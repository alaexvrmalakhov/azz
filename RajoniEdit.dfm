object frmRajoniEdit: TfrmRajoniEdit
  Left = 638
  Top = 113
  Width = 459
  Height = 200
  Caption = 'frmRajoniEdit'
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
    Left = 8
    Top = 16
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 8
    Top = 88
    Width = 31
    Height = 13
    Caption = #1056#1072#1081#1086#1085
  end
  object Label3: TLabel
    Left = 8
    Top = 52
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object edtKod: TEdit
    Left = 80
    Top = 16
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 204
    Top = 16
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtRajon: TEdit
    Left = 80
    Top = 88
    Width = 357
    Height = 21
    ImeName = 'Russian'
    TabOrder = 5
    Text = 'edtRajon'
  end
  object btnVikonati: TButton
    Left = 139
    Top = 124
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnVidminiti: TButton
    Left = 219
    Top = 124
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object cbTeritory: TComboBox
    Left = 80
    Top = 52
    Width = 309
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbTeritory'
  end
  object btnTeritoryUpdate: TButton
    Left = 392
    Top = 52
    Width = 21
    Height = 21
    Action = aTeritoryUpdate
    TabOrder = 3
  end
  object btnTeritoryChoice: TButton
    Left = 416
    Top = 52
    Width = 21
    Height = 21
    Action = aTeritoryChoice
    TabOrder = 4
  end
  object alDistrictEdit: TActionList
    Left = 324
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
