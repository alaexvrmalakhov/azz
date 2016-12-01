object frmStatti: TfrmStatti
  Left = 876
  Top = 173
  Width = 404
  Height = 255
  Caption = 'frmStatti'
  Color = clBtnFace
  Constraints.MinHeight = 255
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
    Width = 193
    Height = 89
    DataSource = dsStatti
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
        FieldName = 'KODSTATTI'
        Title.Caption = #1050#1086#1076' '#1089#1090#1072#1090#1090#1110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMERSTATTI'
        Title.Caption = #8470' '#1089#1090#1072#1090#1090#1110
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMNORMATIVDOK'
        Title.Caption = #8470' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVANORMDOK'
        Title.Caption = #1053#1072#1079#1074#1072' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 321
    Top = 0
    Width = 75
    Height = 221
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
  object aStatti: TActionList
    Left = 252
    Top = 12
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1076#1072#1090#1080' '#1089#1090#1072#1090#1090#1102
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1089#1090#1072#1090#1090#1102
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1089#1090#1072#1090#1090#1102
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aChoice: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Hint = #1042#1080#1073#1088#1072#1090#1080' '#1089#1090#1072#1090#1090#1102
      ShortCut = 16397
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      Hint = #1055#1086#1085#1086#1074#1080#1090#1080' '#1087#1077#1088#1077#1083#1110#1082' '#1089#1090#1072#1090#1090#1077#1081
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      Hint = #1047#1072#1082#1088#1080#1090#1080' '#1074#1110#1082#1085#1086' '#1089#1083#1086#1074#1085#1080#1082#1072
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093' '#1079#1072' '#1082#1086#1076#1086#1084' '#1089#1090#1072#1090#1090#1110
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByNazva: TAction
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102' '#1089#1090#1072#1090#1090#1110
      Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093' '#1079#1072' '#1085#1072#1079#1074#1086#1102' '#1089#1090#1072#1090#1090#1110
      ShortCut = 16434
      OnExecute = aSortByNazvaExecute
    end
    object aSortByNomerStatti: TAction
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1089#1090#1072#1090#1090#1110
      Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1089#1090#1072#1090#1090#1110
      ShortCut = 16435
      OnExecute = aSortByNomerStattiExecute
    end
    object aSortByNomerDokumentu: TAction
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      ShortCut = 16436
      OnExecute = aSortByNomerDokumentuExecute
    end
  end
  object dsStatti: TDataSource
    DataSet = qStatti
    Left = 228
    Top = 88
  end
  object qStatti: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 260
    Top = 88
  end
  object PopupMenu: TPopupMenu
    Left = 208
    Top = 12
    object N2: TMenuItem
      Action = aAdd
    end
    object N3: TMenuItem
      Action = aEdit
    end
    object N4: TMenuItem
      Action = aDelete
    end
    object N5: TMenuItem
      Action = aChoice
    end
    object N7: TMenuItem
      Action = aUpdate
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object N9: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N11: TMenuItem
        Action = aSortByKod
      end
      object N12: TMenuItem
        Action = aSortByNazva
      end
      object N14: TMenuItem
        Action = aSortByNomerStatti
      end
      object N13: TMenuItem
        Action = aSortByNomerDokumentu
      end
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Action = aClose
    end
  end
end
