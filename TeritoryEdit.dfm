object frmTeritoryEdit: TfrmTeritoryEdit
  Left = 556
  Top = 130
  Width = 555
  Height = 196
  Caption = 'frmTeritoryEdit'
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
    Left = 16
    Top = 16
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 65
    Height = 13
    Caption = #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
  end
  object Label3: TLabel
    Left = 16
    Top = 88
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object edtKod: TEdit
    Left = 100
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 224
    Top = 16
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object cbMinistry: TComboBox
    Left = 100
    Top = 52
    Width = 389
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbMinistry'
  end
  object btnMinistryUpdate: TButton
    Left = 492
    Top = 52
    Width = 21
    Height = 21
    Action = aMinistryUpdate
    TabOrder = 3
  end
  object edtTeritory: TEdit
    Left = 100
    Top = 88
    Width = 437
    Height = 21
    TabOrder = 5
    Text = 'edtTeritory'
  end
  object btnVikonati: TButton
    Left = 197
    Top = 124
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnVidminiti: TButton
    Left = 277
    Top = 124
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object btnMinistryChoice: TButton
    Left = 516
    Top = 52
    Width = 21
    Height = 21
    Action = aMinistryChoice
    TabOrder = 4
  end
  object alTeritoryEdit: TActionList
    Left = 328
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
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 13
      OnExecute = aOKExecute
    end
  end
  object qTeritoryUpdates: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 112
  end
end
