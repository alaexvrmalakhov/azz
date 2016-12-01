object frmTipiProdukcii: TfrmTipiProdukcii
  Left = 907
  Top = 235
  Width = 373
  Height = 287
  Caption = 'frmTipiProdukcii'
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 320
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
    Top = 44
    Width = 225
    Height = 125
    DataSource = dsTipiProdukcii
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
        FieldName = 'TIPPRODUKCII'
        Title.Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRUPATOVARIV'
        Title.Caption = #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1110#1074
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 290
    Top = 37
    Width = 75
    Height = 202
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
  object rgTipProdukcii: TRadioGroup
    Left = 0
    Top = 0
    Width = 365
    Height = 37
    Align = alTop
    Columns = 3
    Items.Strings = (
      #1042#1089#1110
      #1055#1088#1086#1076#1086#1074#1086#1083#1100#1095#1110
      #1053#1077#1087#1088#1086#1076#1086#1074#1086#1083#1100#1095#1110)
    TabOrder = 2
    OnClick = aTipProdukciiChoiceExecute
  end
  object Panel2: TPanel
    Left = 0
    Top = 239
    Width = 365
    Height = 21
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 3
    object edtFind: TEdit
      Left = 64
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtFind'
      OnChange = edtFindChange
    end
  end
  object dsTipiProdukcii: TDataSource
    DataSet = qTipiProdukcii
    Left = 220
    Top = 48
  end
  object qTipiProdukcii: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    OnFilterRecord = qTipiProdukciiFilterRecord
    Left = 248
    Top = 48
  end
  object alTipiProdukcii: TActionList
    Left = 248
    Top = 100
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
    object aSortByNazva: TAction
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102
      ShortCut = 16434
      OnExecute = aSortByNazvaExecute
    end
    object aTipProdukciiChoice: TAction
      Caption = 'aTipProdukciiChoice'
      OnExecute = aTipProdukciiChoiceExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 172
    Top = 180
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
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N6: TMenuItem
        Action = aSortByKod
      end
      object N7: TMenuItem
        Action = aSortByNazva
      end
    end
    object N8: TMenuItem
      Action = aClose
    end
  end
end
