object frmLaboratorniDoslidzhenny: TfrmLaboratorniDoslidzhenny
  Left = 876
  Top = 335
  Width = 404
  Height = 252
  Caption = 'frmLaboratorniDoslidzhenny'
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
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 193
    Height = 93
    DataSource = dsLaboratorniDoslidzhenny
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'KODTIPUDOSLIDZHENNY'
        Title.Caption = #1050#1086#1076' '#1083#1072#1073'.'#1076#1086#1089#1083#1110#1076#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPDOSLIDZHENNY'
        Title.Caption = #1053#1072#1079#1074#1072' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1086#1075#1086' '#1076#1086#1089#1083#1110#1076#1078#1077#1085#1085#1103
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 321
    Top = 0
    Width = 75
    Height = 204
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
  object Panel2: TPanel
    Left = 0
    Top = 204
    Width = 396
    Height = 21
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    object edtFind: TEdit
      Left = 24
      Top = 0
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtFind'
      OnChange = aFindChangeExecute
    end
  end
  object alLaboratorniDoslidzhenny: TActionList
    Left = 264
    Top = 4
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
    object aSortByTip: TAction
      Caption = #1047#1072' '#1090#1080#1087#1086#1084
      ShortCut = 16434
      OnExecute = aSortByTipExecute
    end
    object aFindChange: TAction
      Caption = 'aFindChange'
      OnExecute = aFindChangeExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 204
    Top = 4
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
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N7: TMenuItem
        Action = aSortByKod
      end
      object N8: TMenuItem
        Action = aSortByTip
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = aClose
    end
  end
  object dsLaboratorniDoslidzhenny: TDataSource
    DataSet = qLaboratorniDoslidzhenny
    Left = 208
    Top = 64
  end
  object qLaboratorniDoslidzhenny: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    OnFilterRecord = qLaboratorniDoslidzhennyFilterRecord
    Left = 244
    Top = 64
  end
end
