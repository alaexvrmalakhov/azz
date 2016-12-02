object frmTeritory: TfrmTeritory
  Left = 256
  Top = 116
  Width = 360
  Height = 254
  Caption = 'frmTeritory'
  Color = clBtnFace
  Constraints.MinHeight = 254
  Constraints.MinWidth = 343
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 4
    Top = 32
    Width = 245
    Height = 73
    DataSource = dsTeritory
    ImeName = 'Russian'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 269
    Top = 0
    Width = 75
    Height = 216
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = True
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
  object alTeritory: TActionList
    Left = 16
    Top = 116
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1076#1072#1090#1080' '#1085#1086#1074#1091' '#1090#1077#1088#1080#1090#1086#1088#1110#1102
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1090#1077#1088#1080#1090#1086#1088#1110#1102
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1090#1077#1088#1080#1090#1086#1088#1110#1102
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aChoice: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1090#1077#1088#1080#1090#1086#1088#1110#1102
      ShortCut = 16397
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      Hint = #1055#1086#1085#1086#1074#1080#1090#1080' '#1087#1077#1088#1077#1083#1110#1082' '#1090#1077#1088#1080#1090#1086#1088#1110#1081
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1074#1110#1082#1085#1086' '#1076#1086#1074#1110#1076#1085#1080#1082#1072
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByTeritory: TAction
      Caption = #1047#1072' '#1090#1077#1088#1080#1090#1086#1088#1110#1108#1102
      ShortCut = 16434
      OnExecute = aSortByTeritoryExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 48
    Top = 116
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
    object N8: TMenuItem
      Caption = '-'
    end
    object mnSort: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N2: TMenuItem
        Action = aSortByKod
      end
      object N3: TMenuItem
        Action = aSortByTeritory
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object dsTeritory: TDataSource
    DataSet = qTeritory
    Left = 108
    Top = 120
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 140
    Top = 120
  end
  object qMinistry: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 216
    Top = 116
  end
end
