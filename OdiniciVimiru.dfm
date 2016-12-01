object frmOdiniciVimiru: TfrmOdiniciVimiru
  Left = 198
  Top = 109
  Width = 342
  Height = 224
  Caption = 'frmOdiniciVimiru'
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 259
    Top = 0
    Width = 75
    Height = 197
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 221
    Height = 97
    DataSource = dsOdiniciVimiru
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
        FieldName = 'POLNOE_NAZVANIE'
        Title.Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SOKRASCHENNOE_NAZVANIE'
        Title.Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MNOZHITEL'
        Title.Caption = #1052#1085#1086#1078#1085#1080#1082
        Visible = True
      end>
  end
  object qOdiniciVimiru: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 48
    Top = 108
  end
  object dsOdiniciVimiru: TDataSource
    DataSet = qOdiniciVimiru
    Left = 20
    Top = 108
  end
  object alOdiniciVimiru: TActionList
    Left = 232
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
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByPovnaNazva: TAction
      Caption = #1047#1072' '#1087#1086#1074#1085#1086#1102' '#1085#1072#1079#1074#1086#1102
      ShortCut = 16434
      OnExecute = aSortByPovnaNazvaExecute
    end
    object aSortBySkorochenNazva: TAction
      Caption = #1047#1072' '#1089#1082#1086#1088#1086#1095#1077#1085#1086#1102' '#1085#1072#1079#1074#1086#1102
      ShortCut = 16435
      OnExecute = aSortBySkorochenNazvaExecute
    end
    object aSortByMnozhnik: TAction
      Caption = #1047#1072' '#1084#1085#1086#1078#1085#1080#1082#1086#1084
      ShortCut = 16436
      OnExecute = aSortByMnozhnikExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 108
    Top = 108
    object N3: TMenuItem
      Action = aAdd
    end
    object N4: TMenuItem
      Action = aEdit
    end
    object N5: TMenuItem
      Action = aDelete
    end
    object N7: TMenuItem
      Action = aChoice
    end
    object N8: TMenuItem
      Action = aUpdate
    end
    object N9: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N10: TMenuItem
        Action = aSortByKod
      end
      object N11: TMenuItem
        Action = aSortByPovnaNazva
      end
      object N12: TMenuItem
        Action = aSortBySkorochenNazva
      end
      object N13: TMenuItem
        Action = aSortByMnozhnik
      end
    end
    object N14: TMenuItem
      Action = aClose
    end
  end
end
