object frmViluchennyZRealizacii: TfrmViluchennyZRealizacii
  Left = 209
  Top = 109
  Width = 488
  Height = 323
  Caption = 'frmViluchennyZRealizacii'
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
    Top = 80
    Width = 265
    Height = 101
    DataSource = dsViluchennyZRealizacii
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
        Title.Caption = #1053#1072#1079#1074#1072' '#1086#1073'"'#1108#1082#1090#1091
        Width = 338
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIB_KERIVNIKA'
        Title.Caption = #1055'.'#1030'.'#1041'. '#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Width = 273
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADA_KERIVNIKA'
        Title.Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Width = 291
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRESA'
        Title.Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073'"'#1108#1082#1090#1091
        Width = 270
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OSOBA_SES'
        Title.Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082' '#1057#1045#1057
        Width = 308
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDDIL_SES'
        Title.Caption = #1042#1110#1076#1076#1110#1083' '#1057#1045#1057
        Width = 251
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_VILUCHENNY'
        Title.Caption = #1044#1072#1090#1072' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
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
        FieldName = 'DATA_OSKARZHENNY'
        Title.Caption = #1044#1072#1090#1072' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KUDI_OSKARZHENO'
        Title.Caption = #1050#1091#1076#1080' '#1086#1089#1082#1072#1088#1078#1077#1085#1086
        Width = 343
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REZULTAT_OSKARZHENNY'
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Width = 312
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_SPLATI'
        Title.Caption = #1044#1072#1090#1072' '#1083#1080#1089#1090#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMER_PLATIZHKI'
        Title.Caption = #8470' '#1083#1080#1089#1090#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Width = 107
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 211
    Width = 480
    Height = 78
    Align = alBottom
    AutoSize = True
    TabOrder = 1
    object Label3: TLabel
      Left = 4
      Top = 58
      Width = 15
      Height = 13
      Caption = #1056#1110#1082
    end
    object Label2: TLabel
      Left = 400
      Top = 10
      Width = 78
      Height = 13
      Alignment = taCenter
      Caption = '___'#1044#1056#1059#1050'___'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnAddViluchenny: TButton
      Left = 0
      Top = 1
      Width = 75
      Height = 25
      Action = aAddViluchenny
      TabOrder = 0
    end
    object btnEditViluchenny: TButton
      Left = 76
      Top = 1
      Width = 75
      Height = 25
      Action = aEditViluchenny
      TabOrder = 1
    end
    object btnDeleteViluchenny: TButton
      Left = 152
      Top = 1
      Width = 75
      Height = 25
      Action = aDeleteViluchenny
      TabOrder = 2
    end
    object btnUpdateViluchenny: TButton
      Left = 228
      Top = 1
      Width = 75
      Height = 25
      Action = aUpdateViluchenny
      TabOrder = 3
    end
    object btnCloseViluchenny: TButton
      Left = 304
      Top = 1
      Width = 75
      Height = 25
      Action = aCloseViluchenny
      TabOrder = 4
    end
    object btnVruchenny: TButton
      Left = 0
      Top = 27
      Width = 75
      Height = 25
      Action = aVruchenny
      TabOrder = 5
    end
    object btnVikonanny: TButton
      Left = 76
      Top = 27
      Width = 75
      Height = 25
      Action = aVikonanny
      TabOrder = 6
    end
    object btnOskazhenny: TButton
      Left = 152
      Top = 27
      Width = 75
      Height = 25
      Action = aOskarzhenny
      TabOrder = 7
    end
    object btnKopiy: TButton
      Left = 228
      Top = 27
      Width = 75
      Height = 25
      Cursor = crHourGlass
      Action = aCopy
      Enabled = False
      TabOrder = 8
    end
    object edtYear: TEdit
      Left = 24
      Top = 55
      Width = 121
      Height = 21
      TabOrder = 9
      Text = '2000'
    end
    object udYear: TUpDown
      Left = 145
      Top = 55
      Width = 17
      Height = 21
      Associate = edtYear
      Min = 2000
      Max = 2500
      Position = 2000
      TabOrder = 10
      Thousands = False
      Wrap = False
    end
    object btnYearChoice: TButton
      Left = 164
      Top = 55
      Width = 75
      Height = 21
      Action = aYearChoice
      TabOrder = 11
    end
    object btnPostanovaDruk: TButton
      Left = 400
      Top = 27
      Width = 75
      Height = 25
      Action = aPrintPostanovaViluchenny
      TabOrder = 12
    end
    object btnPidpis: TButton
      Left = 304
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
    Width = 480
    Height = 21
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    object cbMinistry: TComboBox
      Left = 4
      Top = 0
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 152
      Top = 0
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbDistrict: TComboBox
      Left = 300
      Top = 0
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbDistrict'
      OnChange = aDistrictChangeExecute
    end
    object btnTeritoryUpdate: TButton
      Left = 444
      Top = 0
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object alViluchennyZRealizacii: TActionList
    Left = 12
    Top = 24
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
    object aAddViluchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddViluchennyExecute
    end
    object aEditViluchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 13
      OnExecute = aEditViluchennyExecute
    end
    object aDeleteViluchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 16430
      OnExecute = aDeleteViluchennyExecute
    end
    object aUpdateViluchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      ShortCut = 16469
      OnExecute = aUpdateViluchennyExecute
    end
    object aCloseViluchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 16499
      OnExecute = aCloseViluchennyExecute
    end
    object aYearChoice: TAction
      Caption = #1056#1110#1082
      OnExecute = aYearChoiceExecute
    end
    object aSortByNomerPostanovi: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16433
      OnExecute = aSortByNomerPostanoviExecute
    end
    object aSortByDataPostanovi: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16434
      OnExecute = aSortByDataPostanoviExecute
    end
    object aSortByNazvaObjektu: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102' '#1086#1073#39#1108#1082#1090#1091
      ShortCut = 16435
      OnExecute = aSortByNazvaObjektuExecute
    end
    object aSortByTipPostanovi: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1090#1080#1087#1086#1084' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16436
      OnExecute = aSortByTipPostanoviExecute
    end
    object aSortByPIB_SES: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16437
      OnExecute = aSortByPIB_SESExecute
    end
    object aSortByPosadaSES: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1087#1086#1089#1072#1076#1086#1102' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16438
      OnExecute = aSortByPosadaSESExecute
    end
    object aSortByTipProdukcii: TAction
      Category = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Caption = #1047#1072' '#1090#1080#1087#1086#1084' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      ShortCut = 16439
      OnExecute = aSortByTipProdukciiExecute
    end
    object aViluchennyNeVrucheni: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1053#1077' '#1074#1088#1091#1095#1077#1085#1110
      OnExecute = aViluchennyNeVrucheniExecute
    end
    object aViluchennyOskarzheni: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1110
      OnExecute = aViluchennyOskarzheniExecute
    end
    object aViluchennyNazvaObjektu: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
      OnExecute = aViluchennyNazvaObjektuExecute
    end
    object aViluchennyAdresaObjektu: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
      OnExecute = aViluchennyAdresaObjektuExecute
    end
    object aViluchennyTipPostanovi: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      OnExecute = aViluchennyTipPostanoviExecute
    end
    object aViluchennyPIB_SES: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      OnExecute = aViluchennyPIB_SESExecute
    end
    object aViluchennyPosadaSES: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1055#1086#1089#1072#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      OnExecute = aViluchennyPosadaSESExecute
    end
    object aViluchennyTipProdukcii: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      OnExecute = aViluchennyTipProdukciiExecute
    end
    object aViluchennyT23F18: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1056#1086#1079#1076#1110#1083' '#1090'.18 '#1092'.23'
      Hint = #1042#1080#1073#1110#1088' '#1079#1072' '#1088#1086#1079#1076#1110#1083#1086#1084' '#1090'.23 '#1092'.18'
      OnExecute = aViluchennyT23F18Execute
    end
    object aViluchennyRobochaBaza: TAction
      Category = #1042#1099#1073#1086#1088
      Caption = #1056#1086#1073#1086#1095#1072' '#1073#1072#1079#1072
      OnExecute = aViluchennyRobochaBazaExecute
    end
    object aVruchenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1042#1088#1091#1095#1077#1085#1085#1103
      OnExecute = aVruchennyExecute
    end
    object aOskarzhenny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1085#1103
      OnExecute = aOskarzhennyExecute
    end
    object aVikonanny: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1042#1080#1082#1086#1085#1072#1085#1085#1103
      OnExecute = aVikonannyExecute
    end
    object aCopy: TAction
      Category = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Caption = #1050#1086#1087#1110#1103
      OnExecute = aCopyExecute
    end
    object aPrintPostanovaViluchenny: TAction
      Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1072
      OnExecute = aPrintPostanovaViluchennyExecute
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
    Left = 80
    Top = 24
  end
  object dsViluchennyZRealizacii: TDataSource
    DataSet = qViluchennyZRealizacii
    Left = 148
    Top = 28
  end
  object qViluchennyZRealizacii: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    AfterScroll = qViluchennyZRealizaciiAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    Left = 180
    Top = 28
  end
  object PopupMenu: TPopupMenu
    Left = 292
    Top = 36
    object N20: TMenuItem
      Action = aAddViluchenny
    end
    object N21: TMenuItem
      Action = aEditViluchenny
    end
    object N22: TMenuItem
      Action = aDeleteViluchenny
    end
    object N23: TMenuItem
      Action = aUpdateViluchenny
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object N27: TMenuItem
      Action = aVruchenny
    end
    object N28: TMenuItem
      Action = aVikonanny
    end
    object N29: TMenuItem
      Action = aOskarzhenny
    end
    object N30: TMenuItem
      Action = aCopy
    end
    object N26: TMenuItem
      Caption = '-'
    end
    object N32: TMenuItem
      Action = aPrintPostanovaViluchenny
    end
    object N31: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N2: TMenuItem
        Action = aSortByNomerPostanovi
      end
      object N3: TMenuItem
        Action = aSortByDataPostanovi
      end
      object N4: TMenuItem
        Action = aSortByNazvaObjektu
      end
      object N5: TMenuItem
        Action = aSortByTipPostanovi
      end
      object N6: TMenuItem
        Action = aSortByPIB_SES
      end
      object N7: TMenuItem
        Action = aSortByPosadaSES
      end
      object N8: TMenuItem
        Action = aSortByTipProdukcii
      end
    end
    object N9: TMenuItem
      Caption = #1042#1080#1073#1110#1088
      object N10: TMenuItem
        Action = aViluchennyNeVrucheni
      end
      object N11: TMenuItem
        Action = aViluchennyOskarzheni
      end
      object N12: TMenuItem
        Action = aViluchennyNazvaObjektu
      end
      object N13: TMenuItem
        Action = aViluchennyAdresaObjektu
      end
      object N14: TMenuItem
        Action = aViluchennyTipPostanovi
      end
      object N15: TMenuItem
        Action = aViluchennyPIB_SES
      end
      object N16: TMenuItem
        Action = aViluchennyPosadaSES
      end
      object N17: TMenuItem
        Action = aViluchennyTipProdukcii
      end
      object N18231: TMenuItem
        Action = aViluchennyT23F18
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object N19: TMenuItem
        Action = aViluchennyRobochaBaza
      end
    end
    object N24: TMenuItem
      Action = aCloseViluchenny
    end
  end
end
