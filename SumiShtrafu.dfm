object frmSumiShtrafu: TfrmSumiShtrafu
  Left = 876
  Top = 323
  Width = 404
  Height = 232
  Caption = 'frmSumiShtrafu'
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
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 4
    Top = 4
    Width = 245
    Height = 101
    DataSource = dsSumaShtrafu
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
        FieldName = 'SUMASHTAFU'
        Title.Caption = #1057#1091#1084#1072' '#1096#1090#1088#1072#1092#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMAPROPISOM'
        Title.Caption = #1057#1091#1084#1072' '#1096#1090#1088#1072#1092#1091' '#1087#1088#1086#1087#1080#1089#1086#1084
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 321
    Top = 0
    Width = 75
    Height = 198
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
  object alSumiShtrafu: TActionList
    Left = 264
    Top = 20
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
    object aSortBySuma: TAction
      Caption = #1047#1072' '#1089#1091#1084#1086#1102
      ShortCut = 16433
      OnExecute = aSortBySumaExecute
    end
    object aSortByPropis: TAction
      Caption = #1047#1072' '#1089#1091#1084#1086#1102' '#1087#1088#1086#1087#1080#1089#1086#1084
      ShortCut = 16434
      OnExecute = aSortByPropisExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 140
    Top = 120
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
    object N10: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object mnSortBySuma: TMenuItem
        Action = aSortBySuma
      end
      object mnSortByPropis: TMenuItem
        Action = aSortByPropis
      end
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object dsSumaShtrafu: TDataSource
    DataSet = qSumaShtrafu
    Left = 232
    Top = 112
  end
  object qSumaShtrafu: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 272
    Top = 112
  end
end
