object frmObjekti: TfrmObjekti
  Left = 175
  Top = 1
  Width = 314
  Height = 267
  Caption = 'frmObjekti'
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
    Left = 8
    Top = 80
    Width = 117
    Height = 65
    DataSource = dsObjekti
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
        FieldName = 'NAZVAOBJEKTA'
        Title.Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRESAOBJEKTA'
        Title.Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDOMCHAPIPORYDKOVANIST'
        Title.Caption = #1052#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDDILENNY_BANKU'
        Title.Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOD_DKPP'
        Title.Caption = #1050#1086#1076' '#1044#1050#1055#1055
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOD_MFO'
        Title.Caption = #1052#1060#1054
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROZRAHUNKOVIJ_RAHUNOK'
        Title.Caption = #1056#1086#1079#1088#1072#1093'.'#1088#1072#1093#1091#1085#1086#1082
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 306
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object cbMinistry: TComboBox
      Left = 4
      Top = 1
      Width = 77
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 84
      Top = 1
      Width = 77
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbDistrict: TComboBox
      Left = 164
      Top = 1
      Width = 81
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbDistrict'
      OnChange = aDistrictChangeExecute
    end
    object btnTeritoryUpdate: TButton
      Left = 248
      Top = 1
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 229
    Top = 23
    Width = 77
    Height = 187
    Align = alRight
    AutoSize = True
    TabOrder = 2
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
  object Panel3: TPanel
    Left = 0
    Top = 210
    Width = 306
    Height = 23
    Align = alBottom
    AutoSize = True
    TabOrder = 3
    object edtFind_NazvaObjekta: TEdit
      Left = 16
      Top = 1
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'edtFind_NazvaObjekta'
      OnChange = edtFind_NazvaObjektaChange
    end
  end
  object alObjekti: TActionList
    Left = 180
    Top = 72
    object aTeritoryUpdate: TAction
      Caption = '...'
      OnExecute = aTeritoryUpdateExecute
    end
    object aMinistryChange: TAction
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
    end
    object aTeritoryChange: TAction
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aDistrictChange: TAction
      Caption = 'aDistrictChange'
      OnExecute = aDistrictChangeExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 16429
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
    object aSortByAdresa: TAction
      Caption = #1047#1072' '#1072#1076#1088#1077#1089#1086#1102
      ShortCut = 16435
      OnExecute = aSortByAdresaExecute
    end
    object aSortByVidomchaPidporydkovanist: TAction
      Caption = #1047#1072' '#1074#1110#1076#1086#1084#1095#1086#1102' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1102
      ShortCut = 16436
      OnExecute = aSortByVidomchaPidporydkovanistExecute
    end
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 20
    Top = 36
  end
  object PopupMenu: TPopupMenu
    Left = 140
    Top = 72
    object N8: TMenuItem
      Action = aAdd
    end
    object N9: TMenuItem
      Action = aEdit
    end
    object N10: TMenuItem
      Action = aDelete
    end
    object N6: TMenuItem
      Action = aChoice
    end
    object mnUpdate: TMenuItem
      Action = aUpdate
    end
    object N1: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N2: TMenuItem
        Action = aSortByKod
      end
      object N4: TMenuItem
        Action = aSortByNazva
      end
      object N3: TMenuItem
        Action = aSortByAdresa
      end
      object N5: TMenuItem
        Action = aSortByVidomchaPidporydkovanist
      end
    end
    object N7: TMenuItem
      Action = aClose
    end
  end
  object dsObjekti: TDataSource
    DataSet = qObjekti
    Left = 20
    Top = 160
  end
  object qObjekti: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    OnFilterRecord = qObjektiFilterRecord
    Left = 52
    Top = 160
  end
end
