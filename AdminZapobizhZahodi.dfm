object frmAdminZapobizhZahodi: TfrmAdminZapobizhZahodi
  Left = 791
  Top = 254
  Width = 636
  Height = 306
  Caption = 'frmAdminZapobizhZahodi'
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
  object Panel1: TPanel
    Left = 0
    Top = 158
    Width = 620
    Height = 110
    Align = alBottom
    AutoSize = True
    ParentBackground = True
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 87
      Width = 15
      Height = 13
      Caption = #1056#1110#1082
    end
    object Label2: TLabel
      Left = 396
      Top = 7
      Width = 225
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = '__________'#1044#1056#1059#1050'__________'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtYear: TEdit
      Left = 24
      Top = 87
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 17
      Text = '2000'
    end
    object udYear: TUpDown
      Left = 145
      Top = 87
      Width = 17
      Height = 21
      Associate = edtYear
      Min = 2000
      Max = 2500
      Position = 2000
      TabOrder = 18
      Thousands = False
    end
    object btnYear: TButton
      Left = 164
      Top = 87
      Width = 75
      Height = 21
      Action = aYear_Choice
      TabOrder = 19
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
      TabOrder = 11
    end
    object btnAdd: TButton
      Left = 4
      Top = 1
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnVruchenny: TButton
      Left = 4
      Top = 28
      Width = 75
      Height = 25
      Action = aVruchenny
      TabOrder = 4
    end
    object btnOskarzhenny: TButton
      Left = 80
      Top = 28
      Width = 75
      Height = 25
      Action = aOskarzhenny
      TabOrder = 5
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
    object btnPovidomlenny: TButton
      Left = 156
      Top = 28
      Width = 75
      Height = 25
      Action = aPovidomlenny
      TabOrder = 6
    end
    object btnVidnovlennyRobit: TButton
      Left = 196
      Top = 56
      Width = 111
      Height = 25
      Action = aVidnovlennyRobit
      TabOrder = 10
    end
    object btnOpechatuvanny: TButton
      Left = 232
      Top = 28
      Width = 75
      Height = 25
      Action = aOpechatuvanny
      TabOrder = 7
    end
    object btnRaport: TButton
      Left = 4
      Top = 56
      Width = 75
      Height = 25
      Action = aRaport
      TabOrder = 8
    end
    object btnPrintPostanovaAdmin: TButton
      Left = 396
      Top = 25
      Width = 75
      Height = 25
      Action = aPrintPostanovaAdmin
      TabOrder = 12
    end
    object btnZnyttyZKontrolu: TButton
      Left = 80
      Top = 56
      Width = 113
      Height = 25
      Action = aZnyttyZKontrolu
      TabOrder = 9
    end
    object btnPrintBigunikAdmin: TButton
      Left = 472
      Top = 25
      Width = 75
      Height = 25
      Action = aPrintBigunikAdmin
      TabOrder = 13
    end
    object btnPrintPovidomlennyAdmin: TButton
      Left = 548
      Top = 25
      Width = 75
      Height = 25
      Action = aPrintPovidomlennyAdmin
      TabOrder = 14
    end
    object btnPrintAktAdmin: TButton
      Left = 396
      Top = 52
      Width = 75
      Height = 25
      Action = aPrintAktAdmin
      TabOrder = 15
    end
    object btnRishenny: TButton
      Left = 472
      Top = 52
      Width = 75
      Height = 25
      Action = aPrintRishennyAdmin
      TabOrder = 16
    end
    object btnPidpisati: TButton
      Left = 308
      Top = 88
      Width = 75
      Height = 21
      Action = aPidpisati
      TabOrder = 20
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 23
    Align = alTop
    AutoSize = True
    ParentBackground = True
    TabOrder = 1
    object cbMinistry: TComboBox
      Left = 4
      Top = 1
      Width = 73
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbMinistry'
      OnChange = aMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 80
      Top = 1
      Width = 77
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aTeritoryChangeExecute
    end
    object cbDistrict: TComboBox
      Left = 160
      Top = 1
      Width = 73
      Height = 21
      ImeName = 'Russian'
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbDistrict'
      OnChange = aDistrictChangeExecute
    end
    object btnTeritoryUpdate: TButton
      Left = 236
      Top = 1
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 28
    Width = 320
    Height = 120
    DataSource = dsAdminZapobizhZahidi
    ImeName = 'Russian'
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
        Title.Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#39#1108#1082#1090#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRESA_OBJEKTU'
        Title.Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDOMCHA_PIDPORYDKOVANIST'
        Title.Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIB_KERIVNIKA'
        Title.Caption = #1055'.'#1030'.'#1041'. '#1082#1077#1088#1110#1074#1085#1080#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADA_KERIVNIKA'
        Title.Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
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
        FieldName = 'OPECHATUVANNY_OPLOMBUVANNY'
        Title.Caption = #1054#1087#1077#1095#1072#1090#1091#1074#1072#1085#1085#1103'/'#1054#1087#1083#1086#1084#1073#1091#1074#1072#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REZULTAT_OSKARZHENNY'
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KIM_RISHENNY_VIDNOVLENNY'
        Title.Caption = #1050#1080#1084' '#1087#1088#1080#1081#1085#1103#1090#1086' '#1088#1110#1096#1077#1085#1085#1103' '#1097#1086#1076#1086' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMER_RISHENNY'
        Title.Caption = #8470' '#1088#1110#1096#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_LISTA_RISHENNY'
        Title.Caption = #1044#1072#1090#1072' '#1083#1080#1089#1090#1072' '#1088#1110#1096#1077#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Z_YKOI_DATI'
        Title.Caption = #1047' '#1103#1082#1086#1111' '#1076#1072#1090#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ZNYTTY'
        Title.Caption = #1044#1072#1090#1072' '#1079#1085#1103#1090#1090#1103' '#1079' '#1082#1086#1085#1090#1088#1086#1083#1102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SAMILIKVADACIY'
        Title.Caption = #1057#1072#1084#1086#1083#1110#1082#1074#1110#1076#1072#1094#1110#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIB_OSOBI_SES'
        Title.Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045
        Visible = True
      end>
  end
  object memKomuNapravleno: TMemo
    Left = 328
    Top = 72
    Width = 49
    Height = 25
    ImeName = 'Russian'
    Lines.Strings = (
      'memKom'
      'uNapravl'
      'eno')
    TabOrder = 3
    Visible = False
  end
  object alPostanova_Admin: TActionList
    Left = 356
    Top = 28
    object aNeVrucheni: TAction
      Category = 'Choice'
      Caption = #1053#1077' '#1074#1088#1091#1095#1077#1085#1110
      OnExecute = aNeVrucheniExecute
    end
    object aAdd: TAction
      Category = 'Edit'
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Category = 'Edit'
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Category = 'Edit'
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aUpdate: TAction
      Category = 'Edit'
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aVruchenny: TAction
      Category = 'Edit'
      Caption = #1042#1088#1091#1095#1077#1085#1085#1103
      OnExecute = aVruchennyExecute
    end
    object aOskarzhenny: TAction
      Category = 'Edit'
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1085#1103
      OnExecute = aOskarzhennyExecute
    end
    object aZnyttyZKontrolu: TAction
      Category = 'Edit'
      Caption = #1047#1085#1103#1090#1090#1103' '#1079' '#1082#1086#1085#1090#1088#1086#1083#1102
      OnExecute = aZnyttyZKontroluExecute
    end
    object aPovidomlenny: TAction
      Category = 'Edit'
      Caption = #1055#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103
      OnExecute = aPovidomlennyExecute
    end
    object aVidnovlennyRobit: TAction
      Category = 'Edit'
      Caption = #1042#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103' '#1088#1086#1073#1110#1090
      OnExecute = aVidnovlennyRobitExecute
    end
    object aOpechatuvanny: TAction
      Category = 'Edit'
      Caption = #1054#1087#1077#1095#1072#1090#1091#1074#1072#1085#1085#1103
      OnExecute = aOpechatuvannyExecute
    end
    object aRaport: TAction
      Category = 'Edit'
      Caption = #1056#1072#1087#1086#1088#1090
      OnExecute = aRaportExecute
    end
    object aYear_Choice: TAction
      Category = 'Edit'
      Caption = #1056#1110#1082
      OnExecute = aYear_ChoiceExecute
    end
    object aTeritoryUpdate: TAction
      Category = 'Teritory'
      Caption = '...'
      OnExecute = aTeritoryUpdateExecute
    end
    object aMinistryChange: TAction
      Category = 'Teritory'
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
    end
    object aTeritoryChange: TAction
      Category = 'Teritory'
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aDistrictChange: TAction
      Category = 'Teritory'
      Caption = 'aDistrictChange'
      OnExecute = aDistrictChangeExecute
    end
    object aZaNomeromPostanovi: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16433
      OnExecute = aZaNomeromPostanoviExecute
    end
    object aZaDatojuPostanovi: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16434
      OnExecute = aZaDatojuPostanoviExecute
    end
    object aZaNazvojuObjektu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102' '#1086#1073#39#1108#1082#1090#1091
      ShortCut = 16435
      OnExecute = aZaNazvojuObjektuExecute
    end
    object aZaAdresojuObjektu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1072#1076#1088#1077#1089#1086#1102' '#1086#1073#39#1108#1082#1090#1091
      ShortCut = 16436
      OnExecute = aZaAdresojuObjektuExecute
    end
    object aZaPIBPredstavnikaSES: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16437
      OnExecute = aZaPIBPredstavnikaSESExecute
    end
    object aZaTipomPostanovi: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1090#1080#1087#1086#1084' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ShortCut = 16438
      OnExecute = aZaTipomPostanoviExecute
    end
    object aClose: TAction
      Category = 'Edit'
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aNeZnytiZKontrolu: TAction
      Category = 'Choice'
      Caption = #1053#1077' '#1079#1085#1103#1090#1110' '#1079' '#1082#1086#1085#1090#1088#1086#1083#1102
      OnExecute = aNeZnytiZKontroluExecute
    end
    object aOskarzheni: TAction
      Category = 'Choice'
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1110
      OnExecute = aOskarzheniExecute
    end
    object aNePovidomleni: TAction
      Category = 'Choice'
      Caption = #1053#1077' '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1110
      OnExecute = aNePovidomleniExecute
    end
    object aPovidomleni: TAction
      Category = 'Choice'
      Caption = #1055#1086#1074#1110#1076#1086#1084#1083#1077#1085#1110
      OnExecute = aPovidomleniExecute
    end
    object aOpechatani: TAction
      Category = 'Choice'
      Caption = #1054#1087#1077#1095#1072#1090#1072#1085#1110
      OnExecute = aOpechataniExecute
    end
    object aNeVidnovleni: TAction
      Category = 'Choice'
      Caption = #1053#1077' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1110
      OnExecute = aNeVidnovleniExecute
    end
    object aObmezhennyAsortimentu: TAction
      Category = 'Choice'
      Caption = #1054#1073#1084#1077#1078#1077#1085#1085#1103' '#1072#1089#1086#1088#1090#1080#1084#1077#1085#1090#1091
      OnExecute = aObmezhennyAsortimentuExecute
    end
    object aNazvaObjektu: TAction
      Category = 'Choice'
      Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
      OnExecute = aNazvaObjektuExecute
    end
    object aAdresaObjektu: TAction
      Category = 'Choice'
      Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
      OnExecute = aAdresaObjektuExecute
    end
    object aPIBPredstavnikaSES: TAction
      Category = 'Choice'
      Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      OnExecute = aPIBPredstavnikaSESExecute
    end
    object aTipPostanovi: TAction
      Category = 'Choice'
      Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      OnExecute = aTipPostanoviExecute
    end
    object aRozdilT23F18: TAction
      Category = 'Choice'
      Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      OnExecute = aRozdilT23F18Execute
    end
    object aRobochaBaza: TAction
      Category = 'Choice'
      Caption = #1056#1086#1073#1086#1095#1072' '#1073#1072#1079#1072
      OnExecute = aRobochaBazaExecute
    end
    object aPrintPostanovaAdmin: TAction
      Category = 'Print'
      Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1072
      OnExecute = aPrintPostanovaAdminExecute
    end
    object aPrintAktAdmin: TAction
      Category = 'Print'
      Caption = #1040#1082#1090
      OnExecute = aPrintAktAdminExecute
    end
    object aPrintBigunikAdmin: TAction
      Category = 'Print'
      Caption = #1041#1110#1075#1091#1085#1086#1082
      OnExecute = aPrintBigunikAdminExecute
    end
    object aPrintRishennyAdmin: TAction
      Category = 'Print'
      Caption = #1056#1110#1096#1077#1085#1085#1103
      OnExecute = aPrintRishennyAdminExecute
    end
    object aPrintPovidomlennyAdmin: TAction
      Category = 'Print'
      Caption = #1055#1086#1074#1110#1076#1086#1084#1083#1077#1085#1085#1103
      OnExecute = aPrintPovidomlennyAdminExecute
    end
    object aPidpisati: TAction
      Category = 'Edit'
      Caption = #1055#1110#1076#1087#1110#1080#1089#1072#1090#1080
      OnExecute = aPidpisatiExecute
    end
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 560
    Top = 28
  end
  object PopupMenu: TPopupMenu
    Left = 396
    Top = 28
    object N21: TMenuItem
      Action = aAdd
    end
    object N26: TMenuItem
      Action = aEdit
    end
    object N27: TMenuItem
      Action = aDelete
    end
    object N1: TMenuItem
      Action = aUpdate
    end
    object N32: TMenuItem
      Caption = '-'
    end
    object N30: TMenuItem
      Action = aVruchenny
    end
    object N31: TMenuItem
      Action = aOskarzhenny
    end
    object N34: TMenuItem
      Action = aPovidomlenny
    end
    object N35: TMenuItem
      Action = aOpechatuvanny
    end
    object N36: TMenuItem
      Action = aRaport
    end
    object N33: TMenuItem
      Action = aZnyttyZKontrolu
    end
    object N37: TMenuItem
      Action = aVidnovlennyRobit
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N3: TMenuItem
        Action = aZaNomeromPostanovi
      end
      object N4: TMenuItem
        Action = aZaDatojuPostanovi
      end
      object N5: TMenuItem
        Action = aZaNazvojuObjektu
      end
      object N6: TMenuItem
        Action = aZaAdresojuObjektu
      end
      object N7: TMenuItem
        Action = aZaPIBPredstavnikaSES
      end
      object N8: TMenuItem
        Action = aZaTipomPostanovi
      end
    end
    object N12: TMenuItem
      Caption = #1042#1080#1073#1110#1088
      object N13: TMenuItem
        Action = aNeVrucheni
      end
      object N14: TMenuItem
        Action = aNeZnytiZKontrolu
      end
      object N15: TMenuItem
        Action = aOskarzheni
      end
      object N16: TMenuItem
        Action = aNePovidomleni
      end
      object N17: TMenuItem
        Action = aPovidomleni
      end
      object N18: TMenuItem
        Action = aOpechatani
      end
      object N19: TMenuItem
        Action = aNeVidnovleni
      end
      object N20: TMenuItem
        Action = aObmezhennyAsortimentu
      end
      object N22: TMenuItem
        Action = aNazvaObjektu
      end
      object N23: TMenuItem
        Action = aAdresaObjektu
      end
      object N24: TMenuItem
        Action = aPIBPredstavnikaSES
      end
      object N25: TMenuItem
        Action = aTipPostanovi
      end
      object N23181: TMenuItem
        Action = aRozdilT23F18
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object N29: TMenuItem
        Action = aRobochaBaza
      end
    end
    object N38: TMenuItem
      Caption = #1044#1088#1091#1082
      object N39: TMenuItem
        Action = aPrintPostanovaAdmin
      end
      object N40: TMenuItem
        Action = aPrintAktAdmin
      end
      object N41: TMenuItem
        Action = aPrintBigunikAdmin
      end
      object N42: TMenuItem
        Action = aPrintRishennyAdmin
      end
      object N43: TMenuItem
        Action = aPrintPovidomlennyAdmin
      end
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object N11: TMenuItem
      Action = aClose
    end
  end
  object dsAdminZapobizhZahidi: TDataSource
    DataSet = qAdminZapobizhZahidi
    Left = 456
    Top = 28
  end
  object qAdminZapobizhZahidi: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    AfterScroll = qAdminZapobizhZahidiAfterScroll
    Left = 484
    Top = 28
  end
end
