object frmMinistry: TfrmMinistry
  Left = 189
  Top = 107
  Width = 383
  Height = 233
  Caption = 'frmMinistry'
  Color = clBtnFace
  Constraints.MinHeight = 233
  Constraints.MinWidth = 280
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
    Left = 0
    Top = 0
    Width = 157
    Height = 97
    DataSource = dsMinistry
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
        FieldName = 'KOD'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MINISTRY'
        Title.Caption = #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 300
    Top = 0
    Width = 75
    Height = 199
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
      TabOrder = 5
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
      TabOrder = 4
    end
  end
  object alMinistry: TActionList
    Left = 224
    Top = 8
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1076#1072#1090#1080' '#1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aChoice: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
      ShortCut = 16397
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      Hint = #1055#1086#1085#1086#1074#1080#1090#1080' '#1087#1077#1088#1077#1083#1110#1082' '#1084#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074
      ShortCut = 16466
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
    object aSortByNazva: TAction
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102
      ShortCut = 16434
      OnExecute = aSortByNazvaExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 172
    Top = 8
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
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object mnSortByKod: TMenuItem
        Action = aSortByKod
      end
      object mnSortByNazva: TMenuItem
        Action = aSortByNazva
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object dsMinistry: TDataSource
    DataSet = qMinistry
    Left = 176
    Top = 64
  end
  object qMinistry: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 204
    Top = 64
  end
end
