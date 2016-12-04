object frmViddilenny: TfrmViddilenny
  Left = 1261
  Top = 90
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 313
    Top = 0
    Width = 75
    Height = 231
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = True
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
    ImeName = 'Russian'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
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
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByViddilenny: TAction
      Caption = #1047#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103#1084
      ShortCut = 16433
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
    Left = 184
    Top = 36
  end
  object qEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 240
    Top = 20
  end
end
