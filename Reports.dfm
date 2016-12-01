object frmReports: TfrmReports
  Left = 196
  Top = 111
  Width = 362
  Height = 206
  Caption = 'frmReports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 153
    Height = 120
    DataSource = dsReports
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
        FieldName = 'REPORTNAME'
        Title.Caption = #1053#1072#1079#1074#1072' '#1079#1074#1110#1090#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEMPLATENAME'
        Title.Caption = #1060#1072#1081#1083' '#1096#1072#1073#1083#1086#1085#1091
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 277
    Top = 0
    Width = 77
    Height = 172
    Align = alRight
    AutoSize = True
    TabOrder = 1
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
  object PopupMenu: TPopupMenu
    Left = 184
    Top = 8
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
  object alReports: TActionList
    Left = 220
    Top = 8
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
  object dsReports: TDataSource
    DataSet = qReports
    Left = 184
    Top = 60
  end
  object qReports: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 220
    Top = 60
  end
end
