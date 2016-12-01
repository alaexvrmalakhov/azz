object frmSpivrobitniki: TfrmSpivrobitniki
  Left = 862
  Top = 199
  Width = 404
  Height = 254
  Caption = 'frmSpivrobitniki'
  Color = clBtnFace
  Constraints.MinHeight = 232
  Constraints.MinWidth = 404
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
    Left = 12
    Top = 72
    Width = 225
    Height = 93
    DataSource = dsSpivrobitniki
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
        FieldName = 'KODSPIVROBITNIKA'
        Title.Caption = #1050#1086#1076' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIZVISXHE'
        Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIZVISXHE_RV'
        Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1091' '#1056'.'#1042'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIZVISXHE_TV'
        Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1091' '#1058'.'#1042'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAVIDDILENNY'
        Title.Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAPOSADI'
        Title.Caption = #1055#1086#1089#1072#1076#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 321
    Top = 21
    Width = 75
    Height = 206
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 1
    object btnDodati: TButton
      Left = 0
      Top = 4
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnZminiti: TButton
      Left = 0
      Top = 32
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnVidaliti: TButton
      Left = 0
      Top = 60
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnZaktiti: TButton
      Left = 0
      Top = 172
      Width = 75
      Height = 25
      Action = aClose
      Cancel = True
      TabOrder = 4
    end
    object btnVibrati: TButton
      Left = 0
      Top = 88
      Width = 75
      Height = 25
      Action = aChoice
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 0
      Top = 116
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 21
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    object cbMinistry: TComboBox
      Left = 4
      Top = 0
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 88
      Top = 0
      Width = 77
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbRajon: TComboBox
      Left = 168
      Top = 0
      Width = 69
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbRajon'
      OnChange = cbRajonChange
    end
    object btnMin_Ter_Raj: TButton
      Left = 240
      Top = 0
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object alSpivrobitniki: TActionList
    Left = 24
    Top = 32
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
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
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByViddilenny: TAction
      Caption = #1047#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103#1084
      ShortCut = 16434
      OnExecute = aSortByViddilennyExecute
    end
    object aSortByPosada: TAction
      Caption = #1047#1072' '#1087#1086#1089#1072#1076#1086#1102
      ShortCut = 16435
      OnExecute = aSortByPosadaExecute
    end
    object aSortByPrizvische: TAction
      Caption = #1047#1072' '#1087#1088#1110#1079#1074#1080#1097#1077#1084
      ShortCut = 16436
      OnExecute = aSortByPrizvischeExecute
    end
    object aTeritoryUpdate: TAction
      Caption = '...'
      OnExecute = aTeritoryUpdateExecute
    end
    object aMinistryChange: TAction
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
    end
    object aTeritoryChange: TAction
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aRajonChange: TAction
      Caption = 'aRajonChange'
    end
  end
  object PopupMenu: TPopupMenu
    Left = 204
    Top = 36
    object mnAdd: TMenuItem
      Action = aAdd
    end
    object mnEdit: TMenuItem
      Action = aEdit
    end
    object mnDelete: TMenuItem
      Action = aDelete
    end
    object mnChoice: TMenuItem
      Action = aChoice
    end
    object mnUpdate: TMenuItem
      Action = aUpdate
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object mnSort: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object mnSortByKod: TMenuItem
        Action = aSortByKod
      end
      object mnSortByViddilenny: TMenuItem
        Action = aSortByViddilenny
      end
      object mnSortByPosada: TMenuItem
        Action = aSortByPosada
      end
      object mnSortByPrizvisxhe: TMenuItem
        Action = aSortByPrizvische
      end
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object dsSpivrobitniki: TDataSource
    DataSet = qSpivrobitniki
    Left = 68
    Top = 32
  end
  object qSpivrobitniki: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 104
    Top = 32
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 268
    Top = 44
  end
end
