object frmKoristuvachi: TfrmKoristuvachi
  Left = 191
  Top = 72
  Width = 420
  Height = 234
  Caption = 'frmKoristuvachi'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 4
    Top = 30
    Width = 165
    Height = 111
    DataSource = dsKoristuvachi
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Caption = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIZVISXHE'
        Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1030'.'#1041'. '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object cbMinistry: TComboBox
      Left = 4
      Top = 1
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 88
      Top = 1
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbDistrict: TComboBox
      Left = 172
      Top = 1
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbDistrict'
      OnChange = aDistrictChangeExecute
    end
    object btnTeritoryUpdate: TButton
      Left = 256
      Top = 1
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 335
    Top = 23
    Width = 77
    Height = 184
    Align = alRight
    AutoSize = True
    TabOrder = 2
    object btnAdd: TButton
      Left = 1
      Top = 5
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 1
      Top = 35
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnDelete: TButton
      Left = 1
      Top = 65
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object cbChoice: TButton
      Left = 1
      Top = 95
      Width = 75
      Height = 25
      Action = aChoice
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 1
      Top = 125
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 4
    end
    object btnClose: TButton
      Left = 1
      Top = 155
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 5
    end
  end
  object alKoristuvachi: TActionList
    Left = 212
    Top = 45
    object aMinistryChange: TAction
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
    end
    object aTeritoryChange: TAction
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aDistrictChange: TAction
      Caption = 'aDistrictChange'
      OnExecute = aDistrictChangeExecute
    end
    object aTeritoryUpdate: TAction
      Caption = '...'
      OnExecute = aTeritoryUpdateExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aChoice: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ShortCut = 16397
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aByKodExecute
    end
    object aByLogin: TAction
      Caption = #1047#1072' '#1110#1084#39#1103#1084' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
      ShortCut = 16434
      OnExecute = aByLoginExecute
    end
    object aByPrizvische: TAction
      Caption = #1047#1072' '#1087#1088#1110#1079#1074#1080#1097#1077#1084
      ShortCut = 16435
      OnExecute = aByPrizvischeExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 264
    Top = 50
    object N1: TMenuItem
      Action = aAdd
    end
    object N2: TMenuItem
      Action = aEdit
    end
    object N3: TMenuItem
      Action = aDelete
    end
    object N4: TMenuItem
      Action = aChoice
    end
    object N5: TMenuItem
      Action = aUpdate
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N10: TMenuItem
        Action = aByKod
      end
      object N11: TMenuItem
        Action = aByLogin
      end
      object N12: TMenuItem
        Action = aByPrizvische
      end
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Action = aClose
    end
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 162
  end
  object qKoristuvachi: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 115
  end
  object dsKoristuvachi: TDataSource
    DataSet = qKoristuvachi
    Left = 228
    Top = 115
  end
end
