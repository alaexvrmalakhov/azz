object frmElementiVikon: TfrmElementiVikon
  Left = 182
  Top = 110
  Width = 365
  Height = 228
  Caption = 'frmElementiVikon'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 28
    Width = 153
    Height = 120
    DataSource = dsElementiVikon
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
        FieldName = 'NAZVAELEMENTA'
        Title.Caption = #1053#1072#1079#1074#1072' '#1077#1083#1077#1084#1077#1085#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMJYELEMENTA'
        Title.Caption = #1030#1084#39#1103' '#1077#1083#1077#1084#1077#1085#1090#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 280
    Top = 23
    Width = 77
    Height = 178
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 357
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 2
    object cbForms: TComboBox
      Left = 24
      Top = 1
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbForms'
      OnChange = aFormsChangeExecute
    end
    object btnFormsUpdate: TButton
      Left = 172
      Top = 1
      Width = 21
      Height = 21
      Action = aFormsUpdate
      TabOrder = 1
    end
  end
  object qElementiVikon: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 204
    Top = 28
  end
  object dsElementiVikon: TDataSource
    DataSet = qElementiVikon
    Left = 180
    Top = 28
  end
  object alElementiVikon: TActionList
    Left = 212
    Top = 72
    object aFormsUpdate: TAction
      Caption = '...'
      OnExecute = aFormsUpdateExecute
    end
    object aFormsChange: TAction
      Caption = 'aFormsChange'
      OnExecute = aFormsChangeExecute
    end
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
  object PopupMenu: TPopupMenu
    Left = 176
    Top = 72
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
  object qUpdates: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 192
    Top = 120
  end
end
