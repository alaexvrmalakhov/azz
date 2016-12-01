object frmAdminZapobizhZahodiEdit: TfrmAdminZapobizhZahodiEdit
  Left = 452
  Top = 13
  Width = 609
  Height = 565
  Caption = 'frmAdminZapobizhZahodiEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object Label2: TLabel
    Left = 12
    Top = 40
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label3: TLabel
    Left = 252
    Top = 40
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object edtRecordID: TEdit
    Left = 60
    Top = 8
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtRecordID'
  end
  object cbMinistry: TComboBox
    Left = 148
    Top = 8
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 1
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 296
    Top = 8
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 444
    Top = 8
    Width = 145
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 3
    Text = 'cbDistrict'
  end
  object edtNomerPostanovi: TEdit
    Left = 88
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'edtNomerPostanovi'
    OnExit = aUpdateLabKontrolExecute
  end
  object btnNomerPostanoviUpdate: TButton
    Left = 212
    Top = 40
    Width = 21
    Height = 21
    Action = aNomerPostanoviUpdate
    TabOrder = 5
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 340
    Top = 40
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 40421.4352893519
    Time = 40421.4352893519
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
    OnExit = dtpDataPostanoviExit
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 72
    Width = 577
    Height = 69
    TabOrder = 7
    object lblData_Z: TLabel
      Left = 8
      Top = 40
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object lblData_Do: TLabel
      Left = 140
      Top = 40
      Width = 12
      Height = 13
      Caption = #1076#1086
    end
    object lblNomer: TLabel
      Left = 268
      Top = 40
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object rgAkt_Raspiska: TRadioGroup
      Left = 0
      Top = 0
      Width = 577
      Height = 33
      Columns = 3
      Items.Strings = (
        #1030#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1072' '#1076#1086#1074#1110#1076#1082#1072
        #1040#1082#1090' '#1074#1110#1076#1073#1086#1088#1091
        #1040#1082#1090' '#1089#1072#1085'.-'#1077#1087#1110#1076'. '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103)
      TabOrder = 0
      OnClick = aAkt_Raspiska_ChangeExecute
    end
    object dtpData_Z: TDateTimePicker
      Left = 40
      Top = 40
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 40421.4570733796
      Time = 40421.4570733796
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object dtpData_Do: TDateTimePicker
      Left = 160
      Top = 40
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 40421.4571440972
      Time = 40421.4571440972
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object edtNomer: TEdit
      Left = 312
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'edtNomer'
    end
  end
  object pcAdminZapobizhZahodi: TPageControl
    Left = 12
    Top = 148
    Width = 577
    Height = 269
    ActivePage = tsDodatkovo
    TabIndex = 4
    TabOrder = 8
    object tsVidomostiProObjekt: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      object Label4: TLabel
        Left = 4
        Top = 4
        Width = 71
        Height = 13
        Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
      end
      object Label5: TLabel
        Left = 4
        Top = 32
        Width = 76
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
      end
      object Label6: TLabel
        Left = 4
        Top = 60
        Width = 136
        Height = 13
        Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
      end
      object Label7: TLabel
        Left = 4
        Top = 88
        Width = 80
        Height = 13
        Caption = #1055'.'#1030'.'#1041'. '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object Label8: TLabel
        Left = 4
        Top = 116
        Width = 91
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object Label25: TLabel
        Left = 4
        Top = 144
        Width = 82
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      end
      object Label26: TLabel
        Left = 4
        Top = 172
        Width = 75
        Height = 13
        Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      end
      object Label27: TLabel
        Left = 4
        Top = 204
        Width = 15
        Height = 13
        Caption = #1056#1110#1082
      end
      object edtNazvaObjektu: TEdit
        Left = 144
        Top = 4
        Width = 397
        Height = 21
        TabOrder = 0
        Text = 'edtNazvaObjektu'
      end
      object edtAdresaObjektu: TEdit
        Left = 144
        Top = 32
        Width = 397
        Height = 21
        TabOrder = 1
        Text = 'edtAdresaObjektu'
      end
      object edtVidomchaPidporydkovanist: TEdit
        Left = 144
        Top = 60
        Width = 373
        Height = 21
        TabOrder = 2
        Text = 'edtVidomchaPidporydkovanist'
      end
      object btnVidomchaPidporydkovanist: TButton
        Left = 520
        Top = 60
        Width = 21
        Height = 21
        Action = aVidomchaPidporydkovanistChoice
        TabOrder = 3
      end
      object edtPIBKerivnika: TEdit
        Left = 144
        Top = 88
        Width = 397
        Height = 21
        TabOrder = 4
        Text = 'edtPIBKerivnika'
      end
      object edtPosadaKerivnika: TEdit
        Left = 144
        Top = 116
        Width = 397
        Height = 21
        TabOrder = 5
        Text = 'edtPosadaKerivnika'
      end
      object btnObjekt: TButton
        Left = 544
        Top = 4
        Width = 21
        Height = 133
        Action = aObjektiChoice
        TabOrder = 6
      end
      object cbRozdilT23F18: TComboBox
        Left = 96
        Top = 144
        Width = 421
        Height = 21
        ItemHeight = 0
        TabOrder = 7
        Text = 'cbRozdilT23F18'
      end
      object btnRozdilT23F18_Update: TButton
        Left = 520
        Top = 144
        Width = 21
        Height = 21
        Action = aRozdilT23F18_Update
        TabOrder = 8
      end
      object btnRozdilT23F18_Choice: TButton
        Left = 544
        Top = 144
        Width = 21
        Height = 21
        Action = aRozdilT23F18_Choice
        TabOrder = 9
      end
      object cbTipPostanovi: TComboBox
        Left = 96
        Top = 172
        Width = 421
        Height = 21
        ItemHeight = 0
        TabOrder = 10
        Text = 'cbTipPostanovi'
      end
      object btnTipPostanovi_Update: TButton
        Left = 520
        Top = 172
        Width = 21
        Height = 21
        Action = aTipPostanovi_Update
        TabOrder = 11
      end
      object btnTipPostanovi_Choice: TButton
        Left = 544
        Top = 172
        Width = 21
        Height = 21
        Action = aTipPostanovi_Choice
        TabOrder = 12
      end
      object edtYear: TEdit
        Left = 28
        Top = 204
        Width = 121
        Height = 21
        TabOrder = 13
        Text = '2000'
      end
      object udYear: TUpDown
        Left = 149
        Top = 204
        Width = 16
        Height = 21
        Associate = edtYear
        Min = 2000
        Max = 2500
        Position = 2000
        TabOrder = 14
        Thousands = False
        Wrap = False
      end
      object btnYear_Update: TButton
        Left = 168
        Top = 204
        Width = 21
        Height = 21
        Action = aYearUpdate
        TabOrder = 15
      end
    end
    object tsLaboratornijKontrol: TTabSheet
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      ImageIndex = 1
      object Panel1: TPanel
        Left = 492
        Top = 0
        Width = 77
        Height = 241
        Align = alRight
        AutoSize = True
        TabOrder = 0
        object btnAddLabKontrol: TButton
          Left = 1
          Top = 4
          Width = 75
          Height = 25
          Action = aAddLabKontrol
          TabOrder = 0
        end
        object btnEditLabKontrol: TButton
          Left = 1
          Top = 32
          Width = 75
          Height = 25
          Action = aEditLabKontrol
          TabOrder = 1
        end
        object btnDeleteLabKontrol: TButton
          Left = 1
          Top = 60
          Width = 75
          Height = 25
          Action = aDeleteLabKontrol
          TabOrder = 2
        end
        object btnUpdateLabKontrol: TButton
          Left = 1
          Top = 88
          Width = 75
          Height = 25
          Action = aUpdateLabKontrol
          TabOrder = 3
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 492
        Height = 241
        Align = alClient
        DataSource = dsLaboratornijKontrol
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
            FieldName = 'VIDKONTROLU'
            Title.Caption = #1042#1080#1076' '#1082#1086#1085#1090#1088#1086#1083#1102
            Width = 255
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMERIPROB'
            Title.Caption = #1053#1086#1084#1077#1088#1080' '#1087#1088#1086#1073
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAKONTROLU'
            Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085#1090#1088#1086#1083#1102
            Width = 87
            Visible = True
          end>
      end
    end
    object tsPostanoviv: TTabSheet
      Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1080#1074
      ImageIndex = 2
      object Label9: TLabel
        Left = 4
        Top = 4
        Width = 75
        Height = 13
        Caption = #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      end
      object Label10: TLabel
        Left = 4
        Top = 32
        Width = 112
        Height = 13
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1091
      end
      object Label11: TLabel
        Left = 4
        Top = 60
        Width = 83
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1074#1072#1088#1091
      end
      object Label12: TLabel
        Left = 4
        Top = 84
        Width = 65
        Height = 13
        Caption = #1042#1072#1075#1072' '#1086#1076#1080#1085#1080#1094#1110
      end
      object Label13: TLabel
        Left = 4
        Top = 116
        Width = 74
        Height = 13
        Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1075#1072
      end
      object Label14: TLabel
        Left = 4
        Top = 144
        Width = 62
        Height = 13
        Caption = #1054#1090#1088#1080#1084#1072#1085#1086#1075#1086
      end
      object cbVidPostanovi: TComboBox
        Left = 88
        Top = 4
        Width = 425
        Height = 21
        ItemHeight = 0
        TabOrder = 0
        Text = 'cbVidPostanovi'
        OnChange = aVidPostanovi_ChangeExecute
      end
      object btnVidPostanovi_Update: TButton
        Left = 516
        Top = 4
        Width = 25
        Height = 21
        Action = aVidPostanovi_Update
        TabOrder = 1
      end
      object btnVidPostanovi_Choice: TButton
        Left = 544
        Top = 4
        Width = 21
        Height = 21
        Action = aVidPostanovi_Choice
        TabOrder = 2
      end
      object edtNaimenovanieTovara: TEdit
        Left = 120
        Top = 32
        Width = 445
        Height = 21
        TabOrder = 3
        Text = 'edtNaimenovanieTovara'
      end
      object edtKilkistTovaru: TEdit
        Left = 120
        Top = 60
        Width = 445
        Height = 21
        TabOrder = 4
        Text = 'edtKilkistTovaru'
      end
      object edtVagaOdinici: TEdit
        Left = 120
        Top = 88
        Width = 445
        Height = 21
        TabOrder = 5
        Text = 'edtVagaOdinici'
      end
      object edtZagalnaVaga: TEdit
        Left = 120
        Top = 116
        Width = 445
        Height = 21
        TabOrder = 6
        Text = 'edtZagalnaVaga'
      end
      object edtOtrimanogo: TEdit
        Left = 120
        Top = 144
        Width = 445
        Height = 21
        TabOrder = 7
        Text = 'edtOtrimanogo'
      end
    end
    object tsSutPorushenny: TTabSheet
      Caption = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      ImageIndex = 3
      object Label15: TLabel
        Left = 8
        Top = 148
        Width = 61
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1085#1086#1074#1080#1074
      end
      object Label16: TLabel
        Left = 8
        Top = 172
        Width = 33
        Height = 13
        Caption = #1047' '#1076#1072#1090#1072
      end
      object Label17: TLabel
        Left = 136
        Top = 172
        Width = 17
        Height = 13
        Caption = #1095#1072#1089
      end
      object Label18: TLabel
        Left = 284
        Top = 172
        Width = 41
        Height = 13
        Caption = #1044#1086' '#1076#1072#1090#1072
      end
      object Label19: TLabel
        Left = 424
        Top = 172
        Width = 17
        Height = 13
        Caption = #1095#1072#1089
      end
      object Label20: TLabel
        Left = 4
        Top = 216
        Width = 99
        Height = 13
        Caption = #1059#1084#1086#1074#1080' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 569
        Height = 73
        Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1074
        TabOrder = 0
        object memVstanoviv: TMemo
          Left = 4
          Top = 12
          Width = 537
          Height = 57
          Lines.Strings = (
            'memVstanoviv')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btnVstanoviv: TButton
          Left = 544
          Top = 12
          Width = 21
          Height = 57
          Action = aVstanoviv_Update
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 72
        Width = 569
        Height = 73
        Caption = #1065#1086' '#1108' '#1087#1086#1088#1091#1096#1077#1085#1085#1103#1084
        TabOrder = 1
        object memSchoEPorushennym: TMemo
          Left = 4
          Top = 12
          Width = 537
          Height = 57
          Lines.Strings = (
            'memSchoEPorushennym')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btnSchoEPorushennym: TButton
          Left = 544
          Top = 12
          Width = 21
          Height = 57
          Action = aSchoEPorushennym_Choice
          TabOrder = 1
        end
      end
      object cbPostanoviv: TComboBox
        Left = 80
        Top = 148
        Width = 437
        Height = 21
        ItemHeight = 0
        TabOrder = 2
        Text = 'cbPostanoviv'
      end
      object btnPostanoviv_Update: TButton
        Left = 520
        Top = 148
        Width = 21
        Height = 21
        Action = aPostanoviv_Update
        TabOrder = 3
      end
      object btnPostanoviv_Choice: TButton
        Left = 544
        Top = 148
        Width = 21
        Height = 21
        Action = aPostanoviv_Choice
        TabOrder = 4
      end
      object dtpZ_Data: TDateTimePicker
        Left = 44
        Top = 172
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 40422.5096180556
        Time = 40422.5096180556
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 5
      end
      object edtZ_Chas: TEdit
        Left = 156
        Top = 172
        Width = 121
        Height = 21
        TabOrder = 6
        Text = 'edtZ_Chas'
      end
      object dtpDo_Data: TDateTimePicker
        Left = 328
        Top = 172
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 40422.5097166088
        Time = 40422.5097166088
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 7
      end
      object edtDo_Chas: TEdit
        Left = 444
        Top = 172
        Width = 121
        Height = 21
        TabOrder = 8
        Text = 'edtDo_Chas'
      end
      object cbxPostijno: TCheckBox
        Left = 8
        Top = 196
        Width = 97
        Height = 17
        Caption = #1055#1086#1089#1090#1110#1081#1085#1086
        TabOrder = 9
        OnClick = aPostijnoChangeExecute
      end
      object cbxObmezhennyAsortimentu: TCheckBox
        Left = 252
        Top = 196
        Width = 165
        Height = 17
        Caption = #1054#1073#1084#1077#1078#1077#1085#1085#1103' '#1072#1089#1086#1088#1090#1080#1084#1077#1085#1090#1091
        TabOrder = 10
        OnClick = aObmezhennyAsortimentuChangeExecute
      end
      object cbUmoviVidnovlenny: TComboBox
        Left = 108
        Top = 216
        Width = 409
        Height = 21
        ItemHeight = 0
        TabOrder = 11
        Text = 'cbUmoviVidnovlenny'
      end
      object btnUmoviVidnovlenny_Update: TButton
        Left = 520
        Top = 216
        Width = 21
        Height = 21
        Action = aUmoviVidnovlenny_Update
        TabOrder = 12
      end
      object btnUmoviVidnovlenny_Choice: TButton
        Left = 544
        Top = 216
        Width = 21
        Height = 21
        Action = aUmoviVidnovlenny_Choice
        TabOrder = 13
      end
    end
    object tsDodatkovo: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      ImageIndex = 4
      object Label21: TLabel
        Left = 4
        Top = 4
        Width = 84
        Height = 13
        Caption = #1055'.'#1030'.'#1041'. '#1086#1089#1086#1073#1080' '#1057#1045#1057
      end
      object Label22: TLabel
        Left = 4
        Top = 32
        Width = 95
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072' '#1086#1089#1086#1073#1080' '#1057#1045#1057
      end
      object Label23: TLabel
        Left = 4
        Top = 192
        Width = 47
        Height = 13
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
      end
      object Label24: TLabel
        Left = 4
        Top = 216
        Width = 150
        Height = 13
        Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103' '#1087#1088#1086' '#1074#1080#1082#1086#1085#1072#1085#1085#1103' '#1076#1086
      end
      object cbPIBOsobiSES: TComboBox
        Left = 96
        Top = 4
        Width = 421
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cbPIBOsobiSES'
      end
      object btnPIBOsobiSES_Update: TButton
        Left = 520
        Top = 4
        Width = 21
        Height = 21
        Action = aPIBOsobiSES_Update
        TabOrder = 1
      end
      object btnPIBOsobiSES_Choice: TButton
        Left = 544
        Top = 4
        Width = 21
        Height = 21
        Action = aPIBOsobiSES_Choice
        TabOrder = 2
      end
      object cbPosadaOsobiSES: TComboBox
        Left = 104
        Top = 32
        Width = 413
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'cbPosadaOsobiSES'
      end
      object btnPosadaOsobiSES_Update: TButton
        Left = 520
        Top = 32
        Width = 21
        Height = 21
        Action = aPosadaOsobiSES_Update
        TabOrder = 4
      end
      object btnPosadaOsobiSES_Choice: TButton
        Left = 544
        Top = 32
        Width = 21
        Height = 21
        Action = aPosadaOsobiSES_Choice
        TabOrder = 5
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 56
        Width = 565
        Height = 133
        Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1086' '#1076#1086' '#1074#1110#1076#1086#1084#1072
        TabOrder = 6
        object DBGrid2: TDBGrid
          Left = 2
          Top = 15
          Width = 484
          Height = 116
          Align = alClient
          DataSource = dsNapravlenoDoVidoma
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
              FieldName = 'PIB'
              Title.Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POSADA'
              Title.Caption = #1055#1086#1089#1072#1076#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NAPRAVLENNY'
              Title.Caption = #1044#1072#1090#1072
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 486
          Top = 15
          Width = 77
          Height = 116
          Align = alRight
          AutoSize = True
          TabOrder = 1
          object btnAddNapravlenoDoVidoma: TButton
            Left = 1
            Top = 4
            Width = 75
            Height = 25
            Action = aAddNapravlenoDoVidoma
            TabOrder = 0
          end
          object btnEditNapravlenoDoVidoma: TButton
            Left = 1
            Top = 32
            Width = 75
            Height = 25
            Action = aEditNapravlenoDoVidoma
            TabOrder = 1
          end
          object btnDeleteNapravlenoDoVidoma: TButton
            Left = 1
            Top = 60
            Width = 75
            Height = 25
            Action = aDeleteNapravlenoDoVidoma
            TabOrder = 2
          end
          object btnUpdateNapravlenoDoVidoma: TButton
            Left = 1
            Top = 88
            Width = 75
            Height = 25
            Action = aUpdateNapravlenoDoVidoma
            TabOrder = 3
          end
        end
      end
      object edtPrimitka: TEdit
        Left = 60
        Top = 192
        Width = 505
        Height = 21
        TabOrder = 7
        Text = 'edtPrimitka'
      end
      object dtpInformaciyProVikonannyDo: TDateTimePicker
        Left = 160
        Top = 216
        Width = 142
        Height = 21
        CalAlignment = dtaLeft
        Date = 40423.7340494792
        Time = 40423.7340494792
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 8
      end
    end
  end
  object btnOK: TButton
    Left = 221
    Top = 504
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 10
  end
  object btnCancel: TButton
    Left = 301
    Top = 504
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 11
  end
  object GroupBox5: TGroupBox
    Left = 12
    Top = 420
    Width = 577
    Height = 73
    Caption = #1054#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1085#1077#1089#1083#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
    TabOrder = 9
    object Label28: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
    end
    object Label29: TLabel
      Left = 8
      Top = 44
      Width = 71
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1030'.'#1041'.'
    end
    object edtPosada_GDSL: TEdit
      Left = 84
      Top = 16
      Width = 461
      Height = 21
      TabOrder = 0
      Text = 'edtPosada_GDSL'
    end
    object edtPIB_GDSL: TEdit
      Left = 84
      Top = 44
      Width = 461
      Height = 21
      TabOrder = 1
      Text = 'edtPIB_GDSL'
    end
    object btnGDSL: TButton
      Left = 548
      Top = 16
      Width = 21
      Height = 49
      Action = aGDSL_Update
      TabOrder = 2
    end
  end
  object alAdminZahodiEdit: TActionList
    Left = 472
    Top = 36
    object aNomerPostanoviUpdate: TAction
      Category = 'General'
      Caption = '...'
      OnExecute = aNomerPostanoviUpdateExecute
    end
    object aAkt_Raspiska_Change: TAction
      Category = 'General'
      Caption = 'aAkt_Raspiska_Change'
      OnExecute = aAkt_Raspiska_ChangeExecute
    end
    object aVidomchaPidporydkovanistChoice: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '...'
      OnExecute = aVidomchaPidporydkovanistChoiceExecute
    end
    object aObjektiChoice: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '...'
      OnExecute = aObjektiChoiceExecute
    end
    object aAddLabKontrol: TAction
      Category = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddLabKontrolExecute
    end
    object aEditLabKontrol: TAction
      Category = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditLabKontrolExecute
    end
    object aDeleteLabKontrol: TAction
      Category = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteLabKontrolExecute
    end
    object aUpdateLabKontrol: TAction
      Category = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateLabKontrolExecute
    end
    object aVidPostanovi_Update: TAction
      Category = #1055#1086#1089#1090#1072#1085#1086#1074#1080#1074
      Caption = '@'
      OnExecute = aVidPostanovi_UpdateExecute
    end
    object aVidPostanovi_Choice: TAction
      Category = #1055#1086#1089#1090#1072#1085#1086#1074#1080#1074
      Caption = '...'
      OnExecute = aVidPostanovi_ChoiceExecute
    end
    object aVidPostanovi_Change: TAction
      Category = #1055#1086#1089#1090#1072#1085#1086#1074#1080#1074
      Caption = 'aVidPostanovi_Change'
      OnExecute = aVidPostanovi_ChangeExecute
    end
    object aVstanoviv_Update: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = '...'
      OnExecute = aVstanoviv_UpdateExecute
    end
    object aSchoEPorushennym_Choice: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = '...'
      OnExecute = aSchoEPorushennym_ChoiceExecute
    end
    object aPostanoviv_Update: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = '@'
      OnExecute = aPostanoviv_UpdateExecute
    end
    object aPostanoviv_Choice: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = '...'
      OnExecute = aPostanoviv_ChoiceExecute
    end
    object aPostijnoChange: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = 'aPostijnoChange'
      OnExecute = aPostijnoChangeExecute
    end
    object aObmezhennyAsortimentuChange: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = 'aObmezhennyAsortimentuChange'
      OnExecute = aObmezhennyAsortimentuChangeExecute
    end
    object aUmoviVidnovlenny_Update: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = '@'
      OnExecute = aUmoviVidnovlenny_UpdateExecute
    end
    object aUmoviVidnovlenny_Choice: TAction
      Category = #1057#1091#1090#1100' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      Caption = '...'
      OnExecute = aUmoviVidnovlenny_ChoiceExecute
    end
    object aPIBOsobiSES_Update: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = '@'
      OnExecute = aPIBOsobiSES_UpdateExecute
    end
    object aPIBOsobiSES_Choice: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = '...'
      OnExecute = aPIBOsobiSES_ChoiceExecute
    end
    object aPosadaOsobiSES_Update: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = '@'
      OnExecute = aPosadaOsobiSES_UpdateExecute
    end
    object aPosadaOsobiSES_Choice: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = '...'
      OnExecute = aPosadaOsobiSES_ChoiceExecute
    end
    object aAddNapravlenoDoVidoma: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddNapravlenoDoVidomaExecute
    end
    object aEditNapravlenoDoVidoma: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditNapravlenoDoVidomaExecute
    end
    object aDeleteNapravlenoDoVidoma: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteNapravlenoDoVidomaExecute
    end
    object aUpdateNapravlenoDoVidoma: TAction
      Category = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateNapravlenoDoVidomaExecute
    end
    object aRozdilT23F18_Update: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '@'
      OnExecute = aRozdilT23F18_UpdateExecute
    end
    object aRozdilT23F18_Choice: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '...'
      OnExecute = aRozdilT23F18_ChoiceExecute
    end
    object aTipPostanovi_Update: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '@'
      OnExecute = aTipPostanovi_UpdateExecute
    end
    object aTipPostanovi_Choice: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '...'
      OnExecute = aTipPostanovi_ChoiceExecute
    end
    object aYearUpdate: TAction
      Category = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      Caption = '...'
      OnExecute = aYearUpdateExecute
    end
    object aOK: TAction
      Category = 'General'
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Category = 'General'
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aGDSL_Update: TAction
      Category = 'General'
      Caption = '...'
      OnExecute = aGDSL_UpdateExecute
    end
  end
  object dsLaboratornijKontrol: TDataSource
    DataSet = qLaboratornijKontrol
    Left = 8
    Top = 492
  end
  object qLaboratornijKontrol: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 36
    Top = 492
  end
  object qComboBoxes: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 556
    Top = 492
  end
  object dsNapravlenoDoVidoma: TDataSource
    DataSet = qNapravlenoDoVidoma
    Left = 436
    Top = 492
  end
  object qNapravlenoDoVidoma: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 472
    Top = 492
  end
end
