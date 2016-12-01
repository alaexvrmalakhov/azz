object frmFinansoviSankcii: TfrmFinansoviSankcii
  Left = 213
  Top = 115
  Width = 505
  Height = 263
  Caption = 'frmFinansoviSankcii'
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
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 28
    Width = 301
    Height = 117
    DataSource = dsFinansoviSankcii
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
        FieldName = 'NOMER_POSTANOVI'
        Title.Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_POSTANOVI'
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVA_OBJEKTU'
        Title.Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRESA_OBJEKTU'
        Title.Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIB_KERIVNIKA'
        Title.Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADA_KERIVNIKA'
        Title.Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA'
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUMA_SANKCII'
        Title.Caption = #1057#1091#1084#1072' '#1089#1072#1085#1082#1094#1110#1111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VRUCHENNY'
        Title.Caption = #1044#1072#1090#1072' '#1074#1088#1091#1095#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_SPLATI'
        Title.Caption = #1044#1072#1090#1072' '#1089#1087#1083#1072#1090#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMER_PLATIZHKI'
        Title.Caption = #8470' '#1087#1083#1072#1090#1110#1078#1082#1080
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_OSKARZHENNY'
        Title.Caption = #1044#1072#1090#1072' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KUDI_OSKARZHENO'
        Title.Caption = #1050#1091#1076#1080' '#1086#1089#1082#1072#1088#1078#1077#1085#1086
        Width = 187
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REZULTAT_OSKARZHENNY'
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Width = 210
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 150
    Width = 497
    Height = 79
    Align = alBottom
    AutoSize = True
    TabOrder = 1
    object Label3: TLabel
      Left = 4
      Top = 57
      Width = 15
      Height = 13
      Caption = #1056#1110#1082
    end
    object Label2: TLabel
      Left = 408
      Top = 13
      Width = 78
      Height = 13
      Caption = '___'#1044#1056#1059#1050'___'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAdd: TButton
      Left = 4
      Top = 1
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 80
      Top = 1
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnDelete: TButton
      Left = 156
      Top = 1
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnUpdate: TButton
      Left = 232
      Top = 1
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 3
    end
    object btnClose: TButton
      Left = 308
      Top = 1
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 4
    end
    object btnVruchenny: TButton
      Left = 4
      Top = 29
      Width = 75
      Height = 25
      Action = aVruchenny
      TabOrder = 5
    end
    object edtYear: TEdit
      Left = 24
      Top = 57
      Width = 121
      Height = 21
      TabOrder = 6
      Text = '2000'
    end
    object udYear: TUpDown
      Left = 145
      Top = 57
      Width = 16
      Height = 21
      Associate = edtYear
      Min = 2000
      Max = 2500
      Position = 2000
      TabOrder = 7
      Thousands = False
      Wrap = False
    end
    object btnYear: TButton
      Left = 164
      Top = 57
      Width = 75
      Height = 21
      Action = aYearChoice
      TabOrder = 8
    end
    object btnSplata: TButton
      Left = 80
      Top = 29
      Width = 75
      Height = 25
      Action = aSplata
      TabOrder = 9
    end
    object btnOskazhenny: TButton
      Left = 156
      Top = 29
      Width = 75
      Height = 25
      Action = aOskarzhenny
      TabOrder = 10
    end
    object btnCopy: TButton
      Left = 232
      Top = 29
      Width = 75
      Height = 25
      Cursor = crHourGlass
      Action = aCopy
      TabOrder = 11
    end
    object btnPrintPostanovaFinansova: TButton
      Left = 408
      Top = 29
      Width = 75
      Height = 25
      Action = aPrintPostanovaFinansova
      TabOrder = 12
    end
    object btnPidpis: TButton
      Left = 308
      Top = 56
      Width = 75
      Height = 21
      Action = aPidpis
      TabOrder = 13
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 23
    Align = alTop
    AutoSize = True
    TabOrder = 2
    object cbMinistry: TComboBox
      Left = 4
      Top = 1
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 152
      Top = 1
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbDistrict: TComboBox
      Left = 300
      Top = 1
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbDistrict'
      OnChange = aDistrictChangeExecute
    end
    object btnTeritoryUpdate: TButton
      Left = 448
      Top = 1
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object alFinansoviSankcii: TActionList
    Left = 328
    Top = 32
    object aTeritoryUpdate: TAction
      Category = #1058#1077#1088#1080#1090#1086#1088#1080#1103
      Caption = '...'
      OnExecute = aTeritoryUpdateExecute
    end
    object aMinistryChange: TAction
      Category = #1058#1077#1088#1080#1090#1086#1088#1080#1103
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
    end
    object aTeritoryChange: TAction
      Category = #1058#1077#1088#1080#1090#1086#1088#1080#1103
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aDistrictChange: TAction
      Category = #1058#1077#1088#1080#1090#1086#1088#1080#1103
      Caption = 'aDistrictChange'
      OnExecute = aDistrictChangeExecute
    end
    object aAdd: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aUpdate: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aClose: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aYearChoice: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1056#1110#1082
      OnExecute = aYearChoiceExecute
    end
    object aVruchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1042#1088#1091#1095#1077#1085#1085#1103
      OnExecute = aVruchennyExecute
    end
    object aSplata: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1057#1087#1083#1072#1090#1072
      OnExecute = aSplataExecute
    end
    object aOskarzhenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1085#1103
      OnExecute = aOskarzhennyExecute
    end
    object aCopy: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1050#1086#1087#1110#1103
      OnExecute = aCopyExecute
    end
    object aPrintPostanovaFinansova: TAction
      Category = #1055#1077#1095#1072#1090#1100
      Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1072
      OnExecute = aPrintPostanovaFinansovaExecute
    end
    object aNeVrucheni: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1053#1077' '#1074#1088#1091#1095#1077#1085#1110
      OnExecute = aNeVrucheniExecute
    end
    object aNeSplacheni: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1053#1077' '#1089#1087#1083#1072#1095#1077#1085#1110
      OnExecute = aNeSplacheniExecute
    end
    object aByNomerPostanovi: TAction
      Category = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16433
      OnExecute = aByNomerPostanoviExecute
    end
    object aByDataPostanovi: TAction
      Category = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16434
      OnExecute = aByDataPostanoviExecute
    end
    object aByNazvaObjektu: TAction
      Category = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102' '#1086#1073#39#1108#1082#1090#1091
      ShortCut = 16435
      OnExecute = aByNazvaObjektuExecute
    end
    object aByAdresaObjektu: TAction
      Category = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Caption = #1047#1072' '#1072#1076#1088#1077#1089#1086#1102' '#1086#1073#39#1108#1082#1090#1091
      ShortCut = 16436
      OnExecute = aByAdresaObjektuExecute
    end
    object aByPIBPredstavnikaSES: TAction
      Category = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Caption = #1047#1072' '#1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16437
      OnExecute = aByPIBPredstavnikaSESExecute
    end
    object aByPosadaPredstavnikaSES: TAction
      Category = #1057#1086#1088#1090#1080#1088#1086#1074#1082#1072
      Caption = #1047#1072' '#1087#1086#1089#1072#1076#1086#1102' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16438
      OnExecute = aByPosadaPredstavnikaSESExecute
    end
    object aOskarzheni: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1110
      OnExecute = aOskarzheniExecute
    end
    object aNazvaObjektu: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
      OnExecute = aNazvaObjektuExecute
    end
    object aAdresaObjektu: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
      OnExecute = aAdresaObjektuExecute
    end
    object aPIB_SES: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072
      OnExecute = aPIB_SESExecute
    end
    object aPosada_SES: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1055#1086#1089#1072#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072
      OnExecute = aPosada_SESExecute
    end
    object aTipProdukcii: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      OnExecute = aTipProdukciiExecute
    end
    object aRozdilT23F18: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      OnExecute = aRozdilT23F18Execute
    end
    object aPidpis: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      OnExecute = aPidpisExecute
    end
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 456
    Top = 88
  end
  object dsFinansoviSankcii: TDataSource
    DataSet = qFinansoviSankcii
    Left = 332
    Top = 80
  end
  object qFinansoviSankcii: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    AfterScroll = qFinansoviSankciiAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    Left = 364
    Top = 80
  end
  object PopupMenu: TPopupMenu
    Left = 364
    Top = 32
    object aAdd1: TMenuItem
      Action = aAdd
    end
    object aEdit1: TMenuItem
      Action = aEdit
    end
    object aDelete1: TMenuItem
      Action = aDelete
    end
    object N5: TMenuItem
      Action = aUpdate
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object aVruchenny1: TMenuItem
      Action = aVruchenny
    end
    object aSplata1: TMenuItem
      Action = aSplata
    end
    object aOskarzhenny1: TMenuItem
      Action = aOskarzhenny
    end
    object aCopy1: TMenuItem
      Action = aCopy
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object aByNomerPostanovi1: TMenuItem
        Action = aByNomerPostanovi
      end
      object aByDataPostanovi1: TMenuItem
        Action = aByDataPostanovi
      end
      object aByNazvaObjektu1: TMenuItem
        Action = aByNazvaObjektu
      end
      object aByAdresaObjektu1: TMenuItem
        Action = aByAdresaObjektu
      end
      object aByPIBPredstavnikaSES1: TMenuItem
        Action = aByPIBPredstavnikaSES
      end
      object aByPosadaPredstavnikaSES1: TMenuItem
        Action = aByPosadaPredstavnikaSES
      end
    end
    object N8: TMenuItem
      Caption = #1042#1080#1073#1110#1088
      object aNeVrucheni1: TMenuItem
        Action = aNeVrucheni
      end
      object N12: TMenuItem
        Action = aNeSplacheni
      end
      object N13: TMenuItem
        Action = aOskarzheni
      end
      object N2: TMenuItem
        Caption = #1054#1073#39#1108#1082#1090
        object aNazvaObjektu1: TMenuItem
          Action = aNazvaObjektu
        end
        object aAdresaObjektu1: TMenuItem
          Action = aAdresaObjektu
        end
      end
      object N3: TMenuItem
        Caption = #1057#1045#1057
        object aPIBPredstavnikaSES1: TMenuItem
          Action = aPIB_SES
        end
        object aPosadaPredstavnikaSES1: TMenuItem
          Action = aPosada_SES
        end
      end
      object N14: TMenuItem
        Action = aTipProdukcii
      end
      object N23181: TMenuItem
        Action = aRozdilT23F18
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object aRobochaBaza1: TMenuItem
        Caption = #1056#1086#1073#1086#1095#1072' '#1073#1072#1079#1072
        OnClick = aRobochaBazaExecute
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object aPrintPostanovaFinansova1: TMenuItem
      Action = aPrintPostanovaFinansova
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = aClose
    end
  end
end
