object frmVizmatiVinnim: TfrmVizmatiVinnim
  Left = 1164
  Top = 79
  Width = 458
  Height = 379
  Caption = 'frmVizmatiVinnim'
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 4
    Top = 4
    Width = 213
    Height = 85
    DataSource = dsViznatiVinnim
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
    Left = 367
    Top = 0
    Width = 75
    Height = 232
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
      Top = 144
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
    object btnDokladno: TButton
      Left = 0
      Top = 200
      Width = 75
      Height = 25
      Action = aDokladno
      TabOrder = 6
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
  object Panel2: TPanel
    Left = 0
    Top = 253
    Width = 442
    Height = 88
    Align = alBottom
    ParentBackground = True
    TabOrder = 2
    Visible = False
    object DBRichEdit1: TDBRichEdit
      Left = 1
      Top = 1
      Width = 440
      Height = 86
      Align = alClient
      DataField = #1057#1091#1090#1100
      DataSource = dsViznatiVinnim
      ImeName = 'Russian'
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 232
    Width = 442
    Height = 21
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = True
    TabOrder = 3
    object edtFind: TEdit
      Left = 0
      Top = 0
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 0
      Text = 'edtFind'
      OnChange = edtFindChange
    end
  end
  object alViznatiVinnim: TActionList
    Left = 8
    Top = 92
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
    object aDokladno: TAction
      Caption = #1044#1086#1082#1083#1072#1076#1085#1086
      OnExecute = aDokladnoExecute
    end
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByZmist: TAction
      Caption = #1047#1072' '#1079#1084#1110#1089#1090#1086#1084
      ShortCut = 16434
      OnExecute = aSortByZmistExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 72
    Top = 100
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
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object mnSortByKod: TMenuItem
        Action = aSortByKod
      end
      object mnSortByZmist: TMenuItem
        Action = aSortByZmist
      end
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object qViznatiVinnim: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    OnFilterRecord = qViznatiVinnimFilterRecord
    Left = 232
    Top = 104
  end
  object dsViznatiVinnim: TDataSource
    DataSet = qViznatiVinnim
    Left = 192
    Top = 108
  end
  object qTemp: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 284
    Top = 40
  end
end
