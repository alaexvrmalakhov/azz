object frmViddilenny: TfrmViddilenny
  Left = 876
  Top = 223
  Width = 404
  Height = 269
  Caption = 'frmViddilenny'
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
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 321
    Top = 21
    Width = 75
    Height = 221
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 88
    Width = 289
    Height = 97
    DataSource = dsViddilenny
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KODVIDDILENNY'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAVIDDILENNY'
        Title.Caption = #1053#1072#1079#1074#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAVIDDILENNY_RV'
        Title.Caption = #1053#1072#1079#1074#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1091' '#1056'.'#1042'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAVIDDILENNY_TV'
        Title.Caption = #1053#1072#1079#1074#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1091' '#1054'.'#1042'.'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 396
    Height = 21
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 2
    object cbTeritory: TComboBox
      Left = 152
      Top = 0
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbRajon: TComboBox
      Left = 232
      Top = 0
      Width = 65
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbRajon'
      OnChange = cbRajonChange
    end
    object btnMin_Ter_Raj: TButton
      Left = 300
      Top = 0
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
    object cbMinistry: TComboBox
      Left = 4
      Top = 0
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
  end
  object alViddilenny: TActionList
    Left = 28
    Top = 36
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1076#1072#1090#1080' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1074#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aChoice: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103
      ShortCut = 16397
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      Hint = #1055#1086#1085#1086#1074#1080#1090#1080' '#1087#1077#1088#1077#1083#1110#1082' '#1074#1110#1076#1076#1110#1083#1077#1085#1100
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1074#1110#1082#1085#1086' '#1076#1086#1074#1110#1076#1085#1080#1082#1072
      ShortCut = 16499
      OnExecute = aCloseExecute
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
  end
  object PopupMenu: TPopupMenu
    Left = 100
    Top = 44
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
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object mnSortByKod: TMenuItem
        Action = aSortByKod
      end
      object mnSortByViddilenny: TMenuItem
        Action = aSortByViddilenny
      end
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object dsViddilenny: TDataSource
    DataSet = qViddilenny
    Left = 152
    Top = 36
  end
  object qViddilenny: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 184
    Top = 36
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
