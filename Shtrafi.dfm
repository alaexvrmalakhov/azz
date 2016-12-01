object frmShtrafi: TfrmShtrafi
  Left = 181
  Top = 111
  Width = 563
  Height = 225
  Caption = 'frmShtrafi'
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
    Top = 114
    Width = 555
    Height = 77
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 56
      Width = 15
      Height = 13
      Caption = #1056#1110#1082
    end
    object Label2: TLabel
      Left = 400
      Top = 8
      Width = 149
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #1044#1056#1059#1050
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInactiveCaption
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnDodati: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnZminiti: TButton
      Left = 76
      Top = 0
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnVidaliti: TButton
      Left = 152
      Top = 0
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnVruchenny: TButton
      Left = 0
      Top = 28
      Width = 75
      Height = 25
      Action = aHanding
      TabOrder = 3
    end
    object btnSplata: TButton
      Left = 76
      Top = 28
      Width = 75
      Height = 25
      Action = aPayment
      TabOrder = 4
    end
    object btnStygnenny: TButton
      Left = 152
      Top = 28
      Width = 75
      Height = 25
      Action = aPenalty
      TabOrder = 5
    end
    object btnZayavaDo_VDVS: TButton
      Left = 228
      Top = 28
      Width = 85
      Height = 25
      Action = aZayavaVDVS
      TabOrder = 6
    end
    object btnOskarzgenny: TButton
      Left = 316
      Top = 28
      Width = 75
      Height = 25
      Action = aAppeal
      TabOrder = 7
    end
    object btnZakriti: TButton
      Left = 316
      Top = 0
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 8
    end
    object btnDrukPostanovi: TButton
      Left = 400
      Top = 28
      Width = 75
      Height = 25
      Action = aPrintPostanova
      TabOrder = 9
    end
    object btnZayavaDoVDVS: TButton
      Left = 476
      Top = 28
      Width = 75
      Height = 25
      Action = aZayavaDoVDVS
      TabOrder = 10
    end
    object edtRik: TEdit
      Left = 24
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 11
      Text = '2000'
    end
    object udRik: TUpDown
      Left = 145
      Top = 56
      Width = 17
      Height = 21
      Associate = edtRik
      Min = 2000
      Max = 2999
      Position = 2000
      TabOrder = 12
      Thousands = False
      Wrap = False
    end
    object btnRik: TButton
      Left = 164
      Top = 56
      Width = 75
      Height = 21
      Action = aYear
      TabOrder = 13
    end
    object btnUpdate: TButton
      Left = 228
      Top = 0
      Width = 85
      Height = 25
      Action = aUpdate
      TabOrder = 14
    end
    object btnPidpis: TButton
      Left = 316
      Top = 56
      Width = 75
      Height = 21
      Action = aPidpisati
      TabOrder = 15
    end
    object btnPrintForm: TButton
      Left = 436
      Top = 52
      Width = 75
      Height = 25
      Action = aPrint
      TabOrder = 16
      Visible = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 28
    Width = 257
    Height = 77
    DataSource = dsShtrafi
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMERPOSTANOVI'
        Title.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPOSTANOVI'
        Title.Caption = #1044#1072#1090#1072' '#1074#1080#1085#1077#1089#1077#1085#1085#1103' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIBPORUSHNIKA'
        Title.Caption = #1055'.'#1030'.'#1041'. '#1087#1086#1088#1091#1096#1085#1080#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADAPORUSHNIKA'
        Title.Caption = #1055#1086#1089#1072#1076#1072' '#1087#1086#1088#1091#1096#1085#1080#1082#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZVAOBJEKTU'
        Title.Caption = #1053#1072#1079#1074#1072' '#1086#1073'"'#1108#1082#1090#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRESAOBJEKTU'
        Title.Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073'"'#1108#1082#1090#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VIDDILSES'
        Title.Caption = #1042#1110#1076#1076#1110#1083' '#1057#1045#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADAOSOBISES'
        Title.Caption = #1055#1086#1089#1072#1076#1072' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIBOSOBISES'
        Title.Caption = #1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPROTOKOLU'
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ROZMIRSHTRAFU'
        Title.Caption = #1056#1086#1079#1084#1110#1088' '#1096#1090#1088#1072#1092#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAOSKARZHENNYPOSTANOVI'
        Title.Caption = #1044#1072#1090#1072' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAVRUCHENNYPOSTANOVI'
        Title.Caption = #1044#1072#1090#1072' '#1074#1088#1091#1095#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPLATIZHNOGODOKUMENTU'
        Title.Caption = #1044#1072#1090#1072' '#1089#1087#1083#1072#1090#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAPEREDACHIDOVDVS'
        Title.Caption = #1044#1072#1090#1072' '#1087#1077#1088#1077#1076#1072#1095#1110' '#1076#1086' '#1042#1044#1042#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATASTYGNENNY'
        Title.Caption = #1044#1072#1090#1072' '#1089#1090#1103#1075#1085#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIJNYTERISHENNYPOOSKARZH'
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMERAKTUOBSTEZHENNY'
        Title.Caption = #8470' '#1072#1082#1090#1091' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMERPLATIZHNOGODOKUMENTU'
        Title.Caption = #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1110#1078#1082#1080
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PIB_GDSL'
        Title.Caption = #1055'.'#1030'.'#1041'. '#1086#1089#1086#1073#1086#1080', '#1097#1086' '#1074#1080#1085#1077#1089#1083#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSADA_GDSL'
        Title.Caption = #1055#1086#1089#1072#1076#1072' '#1086#1089#1086#1073#1080', '#1097#1086' '#1074#1080#1085#1077#1089#1083#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 555
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
      OnChange = aShtrafiMinistryChangeExecute
    end
    object cbTeritory: TComboBox
      Left = 152
      Top = 0
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cbTeritory'
      OnChange = aShtrafiTeritoryChangeExecute
    end
    object cbRajon: TComboBox
      Left = 300
      Top = 0
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = 'cbRajon'
      OnChange = cbRajonChange
    end
    object btnTeritory: TButton
      Left = 444
      Top = 0
      Width = 21
      Height = 21
      Action = aTeritoryUpdate
      TabOrder = 3
    end
  end
  object memKomuNapravleno: TMemo
    Left = 276
    Top = 72
    Width = 45
    Height = 21
    Lines.Strings = (
      'memKo'
      'muNapr'
      'avleno')
    TabOrder = 3
    Visible = False
  end
  object dsTeritory: TDataSource
    DataSet = qTeritory
    Left = 424
    Top = 28
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 456
    Top = 28
  end
  object qShtrafi: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    AfterScroll = qShtrafiAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    Left = 372
    Top = 28
  end
  object dsShtrafi: TDataSource
    DataSet = qShtrafi
    Left = 344
    Top = 28
  end
  object alShtrafi: TActionList
    Left = 268
    Top = 28
    object aTeritoryUpdate: TAction
      Category = 'General'
      Caption = '...'
      OnExecute = aTeritoryUpdateExecute
    end
    object aShtrafiMinistryChange: TAction
      Category = 'General'
      Caption = 'aShtrafiMinistryChange'
      OnExecute = aShtrafiMinistryChangeExecute
    end
    object aShtrafiTeritoryChange: TAction
      Category = 'General'
      Caption = 'aShtrafiTeritoryChange'
      OnExecute = aShtrafiTeritoryChangeExecute
    end
    object aShtrafiDistrictChange: TAction
      Category = 'General'
      Caption = 'aShtrafiDistrictChange'
    end
    object aAdd: TAction
      Category = 'Edit'
      Caption = #1044#1086#1076#1072#1090#1080
      Hint = #1044#1086#1076#1072#1090#1080' '#1085#1086#1074#1091' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
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
    object aHanding: TAction
      Category = 'Edit'
      Caption = #1042#1088#1091#1095#1077#1085#1085#1103
      OnExecute = aHandingExecute
    end
    object aPayment: TAction
      Category = 'Edit'
      Caption = #1057#1087#1083#1072#1090#1072
      OnExecute = aPaymentExecute
    end
    object aPenalty: TAction
      Category = 'Edit'
      Caption = #1057#1090#1103#1075#1085#1077#1085#1085#1103
      OnExecute = aPenaltyExecute
    end
    object aZayavaVDVS: TAction
      Category = 'Edit'
      Caption = #1047#1072#1103#1074#1072' '#1076#1086' '#1042#1044#1042#1057
      OnExecute = aZayavaVDVSExecute
    end
    object aClose: TAction
      Category = 'General'
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
    object aYear: TAction
      Category = 'General'
      Caption = #1056#1110#1082
      OnExecute = aYearExecute
    end
    object aAppeal: TAction
      Category = 'General'
      Caption = #1054#1089#1082#1072#1088#1078#1077#1085#1085#1103
      OnExecute = aAppealExecute
    end
    object aPrintPostanova: TAction
      Category = 'Print'
      Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1072
      OnExecute = aPrintPostanovaExecute
    end
    object aZayavaDoVDVS: TAction
      Category = 'Print'
      Caption = #1047#1072#1103#1074#1072' '#1076#1086' '#1042#1044#1042#1057
      OnExecute = aZayavaDoVDVSExecute
    end
    object aNeSplacheni: TAction
      Category = 'Select'
      Caption = #1053#1077' '#1089#1087#1083#1072#1095#1077#1085#1110
      Hint = 
        #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1089#1090#1072#1085#1086#1074', '#1103#1082#1110' '#1085#1077' '#1073#1091#1083#1080' '#1089#1087#1083#1072#1095#1077#1085#1110', '#1086#1089#1082#1072#1088#1078#1077#1085#1110' '#1090#1072' '#1087#1077#1088#1077#1076#1072#1085#1110' '#1076#1086 +
        ' '#1074#1080#1082#1086#1085#1072#1074#1095#1086#1111' '#1089#1083#1091#1078#1073#1080
      OnExecute = aNeSplacheniExecute
    end
    object aNeVrucheni: TAction
      Category = 'Select'
      Caption = #1053#1077' '#1074#1088#1091#1095#1077#1085#1110
      OnExecute = aNeVrucheniExecute
    end
    object aPeredaniDoVDVSPeredani: TAction
      Category = 'Select'
      Caption = #1055#1077#1088#1077#1076#1072#1085#1110
      Hint = 
        #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1089#1090#1072#1085#1086#1074' '#1087#1077#1088#1077#1076#1072#1085#1080#1093' '#1076#1086' '#1074#1080#1082#1086#1085#1072#1074#1095#1086#1111' '#1089#1083#1091#1078#1073#1080', '#1072#1083#1077' '#1097#1077' '#1085#1077' '#1089#1087#1083#1072#1095 +
        #1077#1085#1080#1093
      OnExecute = aPeredaniDoVDVSPeredaniExecute
    end
    object aPeredaniDoVDVSSplacheni: TAction
      Category = 'Select'
      Caption = #1057#1087#1083#1072#1095#1077#1085#1110
      Hint = 
        #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1089#1090#1072#1085#1086#1074' '#1087#1077#1088#1077#1076#1072#1085#1080#1093' '#1076#1086' '#1074#1080#1082#1086#1085#1072#1074#1095#1086#1111' '#1089#1083#1091#1078#1073#1080' '#1090#1072' '#1087#1110#1089#1083#1103' '#1089#1087#1083#1072#1095#1077#1085 +
        #1080#1093
      OnExecute = aPeredaniDoVDVSSplacheniExecute
    end
    object aNePeredaniDoVDVS: TAction
      Category = 'Select'
      Caption = #1053#1077' '#1087#1077#1088#1077#1076#1072#1085#1110' '#1076#1086' '#1042#1044#1042#1057
      OnExecute = aNePeredaniDoVDVSExecute
    end
    object aPrimusovoStygneni: TAction
      Category = 'Select'
      Caption = #1055#1088#1080#1084#1091#1089#1086#1074#1086' '#1089#1090#1103#1075#1085#1077#1085#1110
      OnExecute = aPrimusovoStygneniExecute
    end
    object aSkasovani: TAction
      Category = 'Select'
      Caption = #1057#1082#1072#1089#1086#1074#1072#1085#1110
      OnExecute = aSkasovaniExecute
    end
    object aSpivrobitnik: TAction
      Category = 'Select'
      Caption = #1057#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082
      OnExecute = aSpivrobitnikExecute
    end
    object aTipShtrafu: TAction
      Category = 'Select'
      Caption = #1058#1080#1087' '#1096#1090#1088#1072#1092#1091
      OnExecute = aTipShtrafuExecute
    end
    object aObjekt_Adresa: TAction
      Category = 'Select'
      Caption = #1040#1076#1088#1077#1089#1072
      OnExecute = aObjekt_AdresaExecute
    end
    object aObjekt_Nazva: TAction
      Category = 'Select'
      Caption = #1053#1072#1079#1074#1072
      OnExecute = aObjekt_NazvaExecute
    end
    object aRobochaBaza: TAction
      Category = 'Select'
      Caption = #1056#1086#1073#1086#1095#1072' '#1073#1072#1079#1072
      OnExecute = aRobochaBazaExecute
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
    object aZaPIBPorushnika: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1055'.'#1030'.'#1041'. '#1087#1086#1088#1091#1096#1085#1080#1082#1072
      ShortCut = 16435
      OnExecute = aZaPIBPorushnikaExecute
    end
    object aZaPosadojuPorushnika: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1087#1086#1089#1072#1076#1086#1102' '#1087#1086#1088#1091#1096#1085#1080#1082#1072
      ShortCut = 16436
      OnExecute = aZaPosadojuPorushnikaExecute
    end
    object aZaNazvojuObjektu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1085#1072#1079#1074#1086#1102' '#1086#1073#39#1108#1082#1090#1072
      ShortCut = 16437
      OnExecute = aZaNazvojuObjektuExecute
    end
    object aZaAdresojuObjektu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1072#1076#1088#1077#1089#1086#1102' '#1086#1073#39#1108#1082#1090#1072
      ShortCut = 16438
      OnExecute = aZaAdresojuObjektuExecute
    end
    object aZaViddilonSES: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1074#1110#1076#1076#1110#1083#1086#1084' '#1057#1045#1057
      ShortCut = 16439
      OnExecute = aZaViddilonSESExecute
    end
    object aZaPosadojuPredstavnikaSES: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1087#1086#1089#1072#1076#1086#1102' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16440
      OnExecute = aZaPosadojuPredstavnikaSESExecute
    end
    object aZaPIBPredstavnikaSES: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1055'.'#1030'.'#1041'. '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1072' '#1057#1045#1057
      ShortCut = 16441
      OnExecute = aZaPIBPredstavnikaSESExecute
    end
    object aZaDatojuProtokolu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
      ShortCut = 16432
      OnExecute = aZaDatojuProtokoluExecute
    end
    object aZaRozmiromShtrafu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1088#1086#1079#1084#1110#1088#1086#1084' '#1096#1090#1088#1072#1092#1091
      ShortCut = 49201
      OnExecute = aZaRozmiromShtrafuExecute
    end
    object aZaDatojuOskarzhenny: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
      ShortCut = 49202
      OnExecute = aZaDatojuOskarzhennyExecute
    end
    object aZaDatojuVruchenny: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1074#1088#1091#1095#1077#1085#1085#1103
      ShortCut = 49203
      OnExecute = aZaDatojuVruchennyExecute
    end
    object aZaDatojuSplati: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1089#1087#1083#1072#1090#1080
      ShortCut = 49204
      OnExecute = aZaDatojuSplatiExecute
    end
    object aZaDatojuPeredachiDoVDVS: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1087#1077#1088#1077#1076#1072#1095#1110' '#1076#1086' '#1042#1044#1042#1057
      ShortCut = 49205
      OnExecute = aZaDatojuPeredachiDoVDVSExecute
    end
    object aZaDatojuStygnenny: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1076#1072#1090#1086#1102' '#1089#1090#1103#1075#1085#1077#1085#1085#1103
      ShortCut = 49206
      OnExecute = aZaDatojuStygnennyExecute
    end
    object aZaRezultatomOskarzhenny: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1084' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
      ShortCut = 49207
      OnExecute = aZaRezultatomOskarzhennyExecute
    end
    object aZaNomeromAktuObstezhenny: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1072#1082#1090#1091' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103
      ShortCut = 49208
      OnExecute = aZaNomeromAktuObstezhennyExecute
    end
    object aZaNomeromPlatizhnogoDokumentu: TAction
      Category = 'Sort'
      Caption = #1047#1072' '#1085#1086#1084#1077#1088#1086#1084' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      ShortCut = 49209
      OnExecute = aZaNomeromPlatizhnogoDokumentuExecute
    end
    object aRozdilT23F18: TAction
      Category = 'Select'
      Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      OnExecute = aRozdilT23F18Execute
    end
    object aPidpisati: TAction
      Category = 'Edit'
      Caption = #1055#1110#1076#1087#1080#1089#1072#1090#1080
      OnExecute = aPidpisatiExecute
    end
    object aPrint: TAction
      Category = 'Print'
      Caption = #1044#1088#1091#1082
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 308
    Top = 32
    object N4: TMenuItem
      Action = aAdd
    end
    object N1: TMenuItem
      Action = aEdit
    end
    object N2: TMenuItem
      Action = aDelete
    end
    object N5: TMenuItem
      Action = aUpdate
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = aHanding
    end
    object N9: TMenuItem
      Action = aPayment
    end
    object N10: TMenuItem
      Action = aPenalty
    end
    object N11: TMenuItem
      Action = aZayavaVDVS
    end
    object N12: TMenuItem
      Action = aAppeal
    end
    object N21: TMenuItem
      Caption = '-'
    end
    object N30: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object N31: TMenuItem
        Action = aZaNomeromPostanovi
      end
      object N32: TMenuItem
        Action = aZaDatojuPostanovi
      end
      object N33: TMenuItem
        Action = aZaPIBPorushnika
      end
      object N34: TMenuItem
        Action = aZaPosadojuPorushnika
      end
      object N35: TMenuItem
        Action = aZaNazvojuObjektu
      end
      object N36: TMenuItem
        Action = aZaAdresojuObjektu
      end
      object N37: TMenuItem
        Action = aZaViddilonSES
      end
      object N38: TMenuItem
        Action = aZaPosadojuPredstavnikaSES
      end
      object N39: TMenuItem
        Action = aZaPIBPredstavnikaSES
      end
      object N40: TMenuItem
        Action = aZaDatojuProtokolu
      end
      object N41: TMenuItem
        Action = aZaRozmiromShtrafu
      end
      object N42: TMenuItem
        Action = aZaDatojuOskarzhenny
      end
      object N43: TMenuItem
        Action = aZaDatojuVruchenny
      end
      object N44: TMenuItem
        Action = aZaDatojuSplati
      end
      object N45: TMenuItem
        Action = aZaDatojuPeredachiDoVDVS
      end
      object N46: TMenuItem
        Action = aZaDatojuStygnenny
      end
      object N47: TMenuItem
        Action = aZaRezultatomOskarzhenny
      end
      object N48: TMenuItem
        Action = aZaNomeromAktuObstezhenny
      end
      object N49: TMenuItem
        Action = aZaNomeromPlatizhnogoDokumentu
      end
    end
    object mnVibir: TMenuItem
      Caption = #1042#1080#1073#1110#1088
      object N15: TMenuItem
        Action = aNeSplacheni
      end
      object N16: TMenuItem
        Action = aNeVrucheni
      end
      object N17: TMenuItem
        Caption = #1055#1077#1088#1077#1076#1072#1085#1110' '#1076#1086' '#1042#1044#1042#1057
        object N18: TMenuItem
          Action = aPeredaniDoVDVSPeredani
        end
        object N19: TMenuItem
          Action = aPeredaniDoVDVSSplacheni
        end
      end
      object N20: TMenuItem
        Action = aNePeredaniDoVDVS
      end
      object N22: TMenuItem
        Action = aPrimusovoStygneni
      end
      object N23: TMenuItem
        Action = aSkasovani
      end
      object N24: TMenuItem
        Action = aSpivrobitnik
      end
      object N25: TMenuItem
        Action = aTipShtrafu
      end
      object N26: TMenuItem
        Caption = #1054#1073#39#1108#1082#1090
        object N28: TMenuItem
          Action = aObjekt_Adresa
        end
        object N29: TMenuItem
          Action = aObjekt_Nazva
        end
      end
      object N23181: TMenuItem
        Action = aRozdilT23F18
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Action = aRobochaBaza
      end
    end
    object N13: TMenuItem
      Caption = #1044#1088#1091#1082
      object N14: TMenuItem
        Action = aPrintPostanova
      end
      object mnPrint_ZayavaDoVDVS: TMenuItem
        Action = aZayavaDoVDVS
      end
      object mnPrint: TMenuItem
        Action = aPrint
      end
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
end
