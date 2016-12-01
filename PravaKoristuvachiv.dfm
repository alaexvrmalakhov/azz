object frmPravaKoristuvachiv: TfrmPravaKoristuvachiv
  Left = 188
  Top = 36
  Width = 527
  Height = 272
  Caption = 'frmPravaKoristuvachiv'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 121
    Top = 23
    Width = 8
    Height = 196
    Cursor = crHSplit
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 519
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object cbGroup: TComboBox
      Left = 4
      Top = 1
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbGroup'
      OnChange = aPravaKoristuvachivUpdateExecute
    end
    object btnGroupUpdate: TButton
      Left = 152
      Top = 1
      Width = 21
      Height = 21
      Action = aGroupUpdate
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 219
    Width = 519
    Height = 19
    Align = alBottom
    AutoSize = True
    TabOrder = 1
    object cbxVisible: TCheckBox
      Left = 116
      Top = 1
      Width = 97
      Height = 17
      Caption = 'cbxVisible'
      TabOrder = 0
      OnClick = aVisibleChangeExecute
    end
    object cbxEnable: TCheckBox
      Left = 220
      Top = 1
      Width = 97
      Height = 17
      Caption = 'cbxEnable'
      TabOrder = 1
      OnClick = aEnableChangeExecute
    end
    object pbUpdateData: TProgressBar
      Left = 316
      Top = 1
      Width = 150
      Height = 17
      Min = 0
      Max = 100
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 140
    Top = 124
    Width = 153
    Height = 85
    DataSource = dsPravaKoristuvachiv
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAZVAELEMENTA'
        Title.Caption = #1045#1083#1077#1084#1077#1085#1090' '#1074#1110#1082#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VISBL'
        Title.Caption = #1042#1110#1076#1086#1073#1088#1072#1079#1080#1090#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENABL'
        Title.Caption = #1047#1072#1073#1083#1086#1082#1091#1074#1072#1090#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUPNAME'
        Title.Caption = #1043#1088#1091#1087#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAVIKNA'
        Title.Caption = #1042#1110#1082#1085#1086
        Visible = True
      end>
  end
  object tvUserWrites: TTreeView
    Left = 0
    Top = 23
    Width = 121
    Height = 196
    Align = alLeft
    HideSelection = False
    HotTrack = True
    Indent = 19
    ReadOnly = True
    RightClickSelect = True
    RowSelect = True
    ShowRoot = False
    TabOrder = 3
    OnClick = aFormSelectExecute
    Items.Data = {
      050000001A0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      01311A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000132
      1A0000000000000000000000FFFFFFFFFFFFFFFF000000000000000001341A00
      00000000000000000000FFFFFFFFFFFFFFFF000000000000000001671A000000
      0000000000000000FFFFFFFFFFFFFFFF00000000000000000178}
  end
  object dsPravaKoristuvachiv: TDataSource
    DataSet = qPravaKoristuvachiv
    Left = 136
    Top = 76
  end
  object qPravaKoristuvachiv: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 172
    Top = 76
  end
  object alPravaKoristuvachiv: TActionList
    Left = 140
    Top = 28
    object aGroupUpdate: TAction
      Caption = '...'
      OnExecute = aGroupUpdateExecute
    end
    object aFormsUpdate: TAction
      Caption = 'aFormsUpdate'
      OnExecute = aFormsUpdateExecute
    end
    object aVisibleChange: TAction
      Caption = 'aVisibleChange'
      OnExecute = aVisibleChangeExecute
    end
    object aEnableChange: TAction
      Caption = 'aEnableChange'
      OnExecute = aEnableChangeExecute
    end
    object aPravaKoristuvachivUpdate: TAction
      Caption = 'aPravaKoristuvachivUpdate'
      OnExecute = aPravaKoristuvachivUpdateExecute
    end
    object aFormSelect: TAction
      Caption = 'aFormSelect'
      OnExecute = aFormSelectExecute
    end
    object aUpdateUserWrites: TAction
      Caption = 'aUpdateUserWrites'
      OnExecute = aUpdateUserWritesExecute
    end
  end
  object qUserWrites: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 24
  end
  object qGroups: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 68
  end
  object qVikna: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 320
    Top = 112
  end
  object qElementiVikon: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 324
    Top = 156
  end
end
