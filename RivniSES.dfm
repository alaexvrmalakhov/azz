object frmRivniSES: TfrmRivniSES
  Left = 185
  Top = 110
  Width = 377
  Height = 212
  Caption = 'frmRivniSES'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = mnRivniSES
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 292
    Top = 0
    Width = 77
    Height = 185
    Align = alRight
    AutoSize = True
    TabOrder = 0
    object btnAdd: TButton
      Left = 1
      Top = 4
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 1
      Top = 32
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnDelete: TButton
      Left = 1
      Top = 60
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnChoice: TButton
      Left = 1
      Top = 88
      Width = 75
      Height = 25
      Action = aChoice
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 1
      Top = 116
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 4
    end
    object btnClose: TButton
      Left = 1
      Top = 144
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 8
    Width = 133
    Height = 120
    DataSource = dsRivniSES
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
        FieldName = 'KOD'
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RIVEN'
        Title.Caption = #1056#1110#1074#1077#1085#1100' '#1057#1045#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Caption = #1044#1086#1082#1083#1072#1076#1085#1086
        Visible = True
      end>
  end
  object alRivniSES: TActionList
    Left = 160
    Top = 12
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
  end
  object mnRivniSES: TPopupMenu
    Left = 200
    Top = 16
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
    object N7: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = aClose
    end
  end
  object dsRivniSES: TDataSource
    DataSet = qRivniSES
    Left = 152
    Top = 72
  end
  object qRivniSES: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 180
    Top = 72
  end
end
