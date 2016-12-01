object frmFinansoviSankciiEdit: TfrmFinansoviSankciiEdit
  Left = 602
  Top = 0
  Width = 678
  Height = 595
  Caption = 'frmFinansoviSankciiEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 32
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label2: TLabel
    Left = 268
    Top = 32
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label24: TLabel
    Left = 484
    Top = 32
    Width = 81
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
  end
  object edtNomerPostanovi: TEdit
    Left = 92
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtNomerPostanovi'
    OnExit = edtNomerPostanoviExit
  end
  object btnNomerPostanovi: TButton
    Left = 216
    Top = 32
    Width = 21
    Height = 21
    Action = aNomerPostanoviUpdate
    TabOrder = 1
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 356
    Top = 32
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 39525.5857660532
    Time = 39525.5857660532
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    OnExit = dtpDataPostanoviExit
  end
  object Panel2: TPanel
    Left = 8
    Top = 60
    Width = 653
    Height = 65
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 4
    object lblData: TLabel
      Left = 8
      Top = 40
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
      Visible = False
    end
    object lblNomer: TLabel
      Left = 240
      Top = 40
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
      Visible = False
    end
    object rgAkt_Dovidka: TRadioGroup
      Left = 0
      Top = 0
      Width = 653
      Height = 37
      Columns = 3
      Items.Strings = (
        #1030#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1072' '#1076#1086#1074#1110#1076#1082#1072
        #1040#1082#1090' '#1074#1110#1076#1073#1086#1088#1091
        #1040#1082#1090' '#1089#1072#1085'.-'#1077#1087#1110#1076'. '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103)
      TabOrder = 0
      OnClick = aAktDovidkaUpdateExecute
    end
    object dtpData: TDateTimePicker
      Left = 40
      Top = 40
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 39546.886470081
      Time = 39546.886470081
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      Visible = False
    end
    object edtNomer: TEdit
      Left = 280
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtNomer'
      Visible = False
    end
    object dtpDataDo: TDateTimePicker
      Left = 136
      Top = 40
      Width = 85
      Height = 21
      CalAlignment = dtaLeft
      Date = 39546.886470081
      Time = 39546.886470081
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
      Visible = False
    end
  end
  object btnVikonati: TButton
    Left = 258
    Top = 528
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 5
  end
  object btnVidminiti: TButton
    Left = 338
    Top = 528
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 6
  end
  object dtpDataProtokolu: TDateTimePicker
    Left = 572
    Top = 32
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 40143.5889697222
    Time = 40143.5889697222
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object cbMinistry: TComboBox
    Left = 4
    Top = 4
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 184
    Top = 4
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 364
    Top = 4
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = 'cbDistrict'
  end
  object edtRecord_ID: TEdit
    Left = 544
    Top = 4
    Width = 121
    Height = 21
    TabOrder = 10
    Text = 'edtRecord_ID'
  end
  object GroupBox3: TGroupBox
    Left = 12
    Top = 456
    Width = 649
    Height = 65
    Caption = #1054#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1085#1077#1089#1083#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
    TabOrder = 11
    object Label25: TLabel
      Left = 4
      Top = 16
      Width = 38
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
    end
    object Label27: TLabel
      Left = 4
      Top = 40
      Width = 49
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077
    end
    object edtPosada_GDSL: TEdit
      Left = 60
      Top = 16
      Width = 561
      Height = 21
      TabOrder = 0
      Text = 'edtPosada_GDSL'
    end
    object edtPIB_GDSL: TEdit
      Left = 60
      Top = 40
      Width = 561
      Height = 21
      TabOrder = 1
      Text = 'edtPIB_GDSL'
    end
    object btnGDSL: TButton
      Left = 624
      Top = 16
      Width = 21
      Height = 45
      Action = aGDSL_Update
      TabOrder = 2
    end
  end
  object pcFinansoviSankcii: TPageControl
    Left = 8
    Top = 132
    Width = 653
    Height = 317
    ActivePage = tsZmistPostanovi
    TabIndex = 3
    TabOrder = 12
    OnChange = pcFinansoviSankciiChange
    object tsVidomostiProObjekt: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      object Label30: TLabel
        Left = 4
        Top = 4
        Width = 114
        Height = 13
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1086#1073#39#1108#1082#1090#1091
      end
      object Label31: TLabel
        Left = 4
        Top = 28
        Width = 136
        Height = 13
        Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
      end
      object Label33: TLabel
        Left = 4
        Top = 52
        Width = 76
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1091
      end
      object Label34: TLabel
        Left = 4
        Top = 76
        Width = 80
        Height = 13
        Caption = #1055'.'#1030'.'#1041'. '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object Label35: TLabel
        Left = 4
        Top = 100
        Width = 91
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object Label36: TLabel
        Left = 4
        Top = 124
        Width = 120
        Height = 13
        Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      end
      object Label37: TLabel
        Left = 360
        Top = 124
        Width = 54
        Height = 13
        Caption = #1050#1086#1076' '#1044#1050#1055#1055
      end
      object Label38: TLabel
        Left = 4
        Top = 148
        Width = 85
        Height = 13
        Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091
      end
      object Label39: TLabel
        Left = 468
        Top = 148
        Width = 28
        Height = 13
        Caption = #1052#1060#1054
      end
      object Label40: TLabel
        Left = 4
        Top = 176
        Width = 82
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      end
      object Label41: TLabel
        Left = 4
        Top = 204
        Width = 75
        Height = 13
        Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      end
      object Label42: TLabel
        Left = 4
        Top = 232
        Width = 68
        Height = 13
        Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      end
      object Label3: TLabel
        Left = 4
        Top = 260
        Width = 15
        Height = 13
        Caption = #1056#1110#1082
      end
      object edtNajmenuvannyObjektu: TEdit
        Left = 128
        Top = 4
        Width = 493
        Height = 21
        TabOrder = 0
        Text = 'edtNajmenuvannyObjektu'
      end
      object edtVidomchaPidporydkovanist: TEdit
        Left = 148
        Top = 28
        Width = 449
        Height = 21
        TabOrder = 1
        Text = 'edtVidomchaPidporydkovanist'
      end
      object btnVidomchaPidporydkovanist: TButton
        Left = 600
        Top = 28
        Width = 21
        Height = 21
        Action = aVidomchaPidporydkovanistChoice
        TabOrder = 2
      end
      object edtAdresa: TEdit
        Left = 88
        Top = 52
        Width = 533
        Height = 21
        TabOrder = 3
        Text = 'edtAdresa'
      end
      object edtPIBKerivnika: TEdit
        Left = 96
        Top = 76
        Width = 525
        Height = 21
        TabOrder = 4
        Text = 'edtPIBKerivnika'
      end
      object edtPosadaKerivnika: TEdit
        Left = 100
        Top = 100
        Width = 521
        Height = 21
        TabOrder = 5
        Text = 'edtPosadaKerivnika'
      end
      object edtRozrahunkovijRahunok: TEdit
        Left = 128
        Top = 124
        Width = 201
        Height = 21
        TabOrder = 6
        Text = 'edtRozrahunkovijRahunok'
      end
      object edtKodDKPP: TEdit
        Left = 420
        Top = 124
        Width = 201
        Height = 21
        TabOrder = 7
        Text = 'edtKodDKPP'
      end
      object edtViddilennyBanku: TEdit
        Left = 96
        Top = 148
        Width = 361
        Height = 21
        TabOrder = 8
        Text = 'edtViddilennyBanku'
      end
      object edtMFO: TEdit
        Left = 500
        Top = 148
        Width = 121
        Height = 21
        TabOrder = 9
        Text = 'edtMFO'
      end
      object btnVidomostiProObjekt: TButton
        Left = 624
        Top = 4
        Width = 21
        Height = 165
        Action = aObjektChoice
        TabOrder = 10
      end
      object cbRozdil_F18: TComboBox
        Left = 92
        Top = 176
        Width = 505
        Height = 21
        ItemHeight = 13
        TabOrder = 11
        Text = 'cbRozdil_F18'
      end
      object btnRozdil_F18_Update: TButton
        Left = 600
        Top = 176
        Width = 21
        Height = 21
        Action = aRozdil_F18Update
        TabOrder = 12
      end
      object btnRozdil_F18_Choice: TButton
        Left = 624
        Top = 176
        Width = 21
        Height = 21
        Action = aRozdil_F18Choice
        TabOrder = 13
      end
      object cbTipShtrafiv: TComboBox
        Left = 84
        Top = 204
        Width = 513
        Height = 21
        ItemHeight = 13
        TabOrder = 14
        Text = 'cbTipShtrafiv'
      end
      object btnTipShtrafivUpdate: TButton
        Left = 600
        Top = 204
        Width = 21
        Height = 21
        Action = aTipShtrafiv_Update
        TabOrder = 15
      end
      object btnTipShtrafivChoice: TButton
        Left = 624
        Top = 204
        Width = 21
        Height = 21
        Action = aTipShtrafiv_Choice
        TabOrder = 16
      end
      object cbTipProdukcii: TComboBox
        Left = 80
        Top = 232
        Width = 517
        Height = 21
        ItemHeight = 13
        TabOrder = 17
        Text = 'cbTipProdukcii'
      end
      object btnTipProdukcii_Update: TButton
        Left = 600
        Top = 232
        Width = 21
        Height = 21
        Action = aTipProdukcii_Update
        TabOrder = 18
      end
      object btnTipProdukcii_Choice: TButton
        Left = 624
        Top = 232
        Width = 21
        Height = 21
        Action = aTipProdukcii_Choice
        TabOrder = 19
      end
      object edtYear: TEdit
        Left = 24
        Top = 260
        Width = 121
        Height = 21
        TabOrder = 20
        Text = 'edtYear'
      end
      object btnYearUpdate: TButton
        Left = 148
        Top = 260
        Width = 21
        Height = 21
        Action = aYearUpdate
        TabOrder = 21
      end
    end
    object tsVidomostiProPereviryjuchogo: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1087#1077#1088#1077#1074#1110#1088#1103#1102#1095#1086#1075#1086
      ImageIndex = 1
      object Label7: TLabel
        Left = 4
        Top = 264
        Width = 64
        Height = 13
        Caption = #1057#1091#1084#1072' '#1089#1072#1085#1082#1094#1110#1111
      end
      object Label8: TLabel
        Left = 200
        Top = 264
        Width = 50
        Height = 13
        Caption = #1087#1088#1086#1087#1080#1089#1086#1084
      end
      object gbVidomostiProFinansovu: TGroupBox
        Left = 4
        Top = 96
        Width = 641
        Height = 161
        Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1092#1110#1085#1072#1085#1089#1086#1074#1091' '#1089#1072#1085#1082#1094#1110#1102
        TabOrder = 1
        object Panel4: TPanel
          Left = 564
          Top = 15
          Width = 75
          Height = 144
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          Caption = 'Panel4'
          TabOrder = 1
          object btnAddVidomosti: TButton
            Left = 0
            Top = 4
            Width = 75
            Height = 25
            Action = aAddVidomosti
            TabOrder = 0
          end
          object btnEditVidomosti: TButton
            Left = 0
            Top = 32
            Width = 75
            Height = 25
            Action = aEditVidomosti
            TabOrder = 1
          end
          object btnDeleteVidomosti: TButton
            Left = 0
            Top = 60
            Width = 75
            Height = 25
            Action = aDeleteVidomosti
            TabOrder = 2
          end
          object btnUpdateVidomosti: TButton
            Left = 0
            Top = 88
            Width = 75
            Height = 25
            Action = aUpdateVidomosti
            TabOrder = 3
          end
          object btnPererahuvatiVidomosti: TButton
            Left = 0
            Top = 116
            Width = 75
            Height = 25
            Action = aPererahuvatiVidomosti
            TabOrder = 4
          end
        end
        object dgVidomostiProFinansovu: TDBGrid
          Left = 16
          Top = 20
          Width = 241
          Height = 77
          DataSource = dsVidomostiProFinansovu
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
              FieldName = 'NAJMENUVANNY_TOVARU'
              Title.Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1091
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KILKIST_TOVARU'
              Title.Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1074#1072#1088#1091
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CINA_ODINICI'
              Title.Caption = #1062#1110#1085#1072' '#1086#1076#1080#1085#1080#1094#1110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CINA_ODINICI_PROPISOM'
              Title.Caption = #1062#1110#1085#1072' '#1086#1076#1080#1085#1080#1094#1110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAGALNA_CINA'
              Title.Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1094#1110#1085#1072
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAGALNA_CINA_PROPISOM'
              Title.Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1094#1110#1085#1072
              Visible = True
            end>
        end
      end
      object gbPredstavnikSES: TGroupBox
        Left = 4
        Top = 4
        Width = 641
        Height = 93
        Caption = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082' '#1057#1045#1057
        TabOrder = 0
        object Label4: TLabel
          Left = 4
          Top = 16
          Width = 49
          Height = 13
          Caption = #1055#1088#1110#1079#1074#1080#1097#1077
        end
        object Label5: TLabel
          Left = 4
          Top = 40
          Width = 29
          Height = 13
          Caption = #1042#1110#1076#1076#1110#1083
        end
        object Label6: TLabel
          Left = 4
          Top = 64
          Width = 38
          Height = 13
          Caption = #1055#1086#1089#1072#1076#1072
        end
        object cbPIB_SES: TComboBox
          Left = 60
          Top = 16
          Width = 529
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'cbPIB_SES'
          OnChange = aPIB_SES_ChangeExecute
        end
        object btnPIB_SES_Update: TButton
          Left = 592
          Top = 16
          Width = 21
          Height = 21
          Action = aPIB_SES_Update
          TabOrder = 1
        end
        object btnPIB_SES_Choice: TButton
          Left = 616
          Top = 16
          Width = 21
          Height = 21
          Action = aPIB_SES_Choice
          TabOrder = 2
        end
        object cbViddilSES: TComboBox
          Left = 40
          Top = 40
          Width = 549
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Text = 'cbViddilSES'
        end
        object btnViddilSES_Update: TButton
          Left = 592
          Top = 40
          Width = 21
          Height = 21
          Action = aViddil_Update
          TabOrder = 4
        end
        object btnViddilSES_Choice: TButton
          Left = 616
          Top = 40
          Width = 21
          Height = 21
          Action = aViddil_Choice
          TabOrder = 5
        end
        object cbPosadaSES: TComboBox
          Left = 48
          Top = 64
          Width = 541
          Height = 21
          ItemHeight = 13
          TabOrder = 6
          Text = 'cbPosadaSES'
        end
        object btnPosadaSES_Update: TButton
          Left = 592
          Top = 64
          Width = 21
          Height = 21
          Action = aPosadaSES_Update
          TabOrder = 7
        end
        object btnPosadaSES_Choice: TButton
          Left = 616
          Top = 64
          Width = 21
          Height = 21
          Action = aPosadaSES_Choice
          TabOrder = 8
        end
      end
      object edtSumaSankcii: TEdit
        Left = 72
        Top = 264
        Width = 121
        Height = 21
        TabOrder = 2
        Text = 'edtSumaSankcii'
        OnExit = edtSumaSankciiExit
      end
      object edtSumaSankciiPropisom: TEdit
        Left = 256
        Top = 264
        Width = 365
        Height = 21
        TabOrder = 3
        Text = 'edtSumaSankciiPropisom'
      end
      object btnSumaSankcii: TButton
        Left = 624
        Top = 264
        Width = 21
        Height = 21
        Action = aSumaSankcii
        TabOrder = 4
      end
    end
    object tsDodatkovo: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      ImageIndex = 2
      object Label14: TLabel
        Left = 4
        Top = 4
        Width = 86
        Height = 13
        Caption = #1065#1086#1076#1086' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      end
      object edtSchodoPorushenny: TEdit
        Left = 96
        Top = 4
        Width = 525
        Height = 21
        TabOrder = 0
        Text = 'edtSchodoPorushenny'
      end
      object btnSchodoPorushenny: TButton
        Left = 624
        Top = 4
        Width = 21
        Height = 21
        Action = aSchodoPorushennyUpdate
        TabOrder = 1
      end
      object GroupBox4: TGroupBox
        Left = 4
        Top = 28
        Width = 641
        Height = 133
        Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
        TabOrder = 2
        object Panel1: TPanel
          Left = 564
          Top = 15
          Width = 75
          Height = 116
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object btnAddLaboratory: TButton
            Left = 0
            Top = 4
            Width = 75
            Height = 25
            Action = aAddLaboratory
            TabOrder = 0
          end
          object btnEditLaboratory: TButton
            Left = 0
            Top = 32
            Width = 75
            Height = 25
            Action = aEditLaboratory
            TabOrder = 1
          end
          object btnDeleteLaboratory: TButton
            Left = 0
            Top = 60
            Width = 75
            Height = 25
            Action = aDeleteLaboratory
            TabOrder = 2
          end
          object btnUpdateLaboratory: TButton
            Left = 0
            Top = 88
            Width = 75
            Height = 25
            Action = aUpdateLaboratory
            TabOrder = 3
          end
        end
        object dgLaboratory: TDBGrid
          Left = 4
          Top = 16
          Width = 281
          Height = 73
          DataSource = dsLaboratory
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMERIPROB'
              Title.Caption = #8470#8470' '#1087#1088#1086#1073
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAKONTROLU'
              Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085#1090#1088#1086#1083#1102
              Visible = True
            end>
        end
      end
      object rgVisnovki: TRadioGroup
        Left = 4
        Top = 164
        Width = 641
        Height = 121
        Items.Strings = (
          #1043#1110#1075#1110#1108#1085#1110#1095#1085#1110' '#1074#1080#1089#1085#1086#1074#1082#1080
          #1058#1077#1088#1084#1110#1085' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
          #1041#1072#1082#1090#1077#1088#1110#1086#1083#1086#1075#1110#1095#1085#1110' '#1079#1072#1073#1088#1091#1076#1085#1077#1085#1085#1103)
        TabOrder = 3
        OnClick = aVisnovkiChoiceExecute
      end
      object dtpTerminTealizacii: TDateTimePicker
        Left = 124
        Top = 220
        Width = 186
        Height = 21
        CalAlignment = dtaLeft
        Date = 40470.7363018982
        Time = 40470.7363018982
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 4
      end
    end
    object tsZmistPostanovi: TTabSheet
      Caption = #1047#1084#1110#1089#1090' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ImageIndex = 3
      object Label9: TLabel
        Left = 4
        Top = 4
        Width = 189
        Height = 13
        Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100' '#1090#1072' '#1072#1076#1088#1077#1089#1072
      end
      object Label10: TLabel
        Left = 4
        Top = 28
        Width = 54
        Height = 13
        Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1074
      end
      object Label11: TLabel
        Left = 4
        Top = 116
        Width = 91
        Height = 13
        Caption = #1065#1086' '#1108' '#1087#1086#1088#1091#1096#1077#1085#1085#1103#1084
      end
      object edtVidomchaPidporydkovanist_Adresa: TEdit
        Left = 204
        Top = 4
        Width = 417
        Height = 21
        TabOrder = 0
        Text = 'edtVidomchaPidporydkovanist_Adresa'
      end
      object btnVidomchaPidporydkovanist_Adresa: TButton
        Left = 624
        Top = 4
        Width = 21
        Height = 21
        Action = aVidomchaPidporydkovanist_AdresaUpdate
        TabOrder = 1
      end
      object memVstanoviv: TMemo
        Left = 4
        Top = 44
        Width = 617
        Height = 65
        Lines.Strings = (
          'memVstanoviv')
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object btnVstanoviv: TButton
        Left = 624
        Top = 44
        Width = 21
        Height = 65
        Action = aVstanoviv
        TabOrder = 3
      end
      object memSchoEPorushennym: TMemo
        Left = 4
        Top = 132
        Width = 617
        Height = 65
        Lines.Strings = (
          'memSchoEPorushennym')
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object btnSchoEPorushennym: TButton
        Left = 624
        Top = 132
        Width = 21
        Height = 65
        Action = aSchoEPorushennymUpdate
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 204
        Width = 641
        Height = 73
        Caption = #1058#1072' '#1079#1072#1089#1083#1091#1093#1072#1074#1096#1080' '#1086#1089#1110#1073
        TabOrder = 6
        object Label12: TLabel
          Left = 4
          Top = 16
          Width = 49
          Height = 13
          Caption = #1087#1086#1088#1091#1096#1085#1080#1082
        end
        object Label13: TLabel
          Left = 4
          Top = 44
          Width = 89
          Height = 13
          Caption = #1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082' '#1057#1045#1057
        end
        object edtPIB_Posada_NazvaObjectu: TEdit
          Left = 60
          Top = 16
          Width = 553
          Height = 21
          TabOrder = 0
          Text = 'edtPIB_Posada_NazvaObjectu'
        end
        object edtPIB_Posada_OsobiSES: TEdit
          Left = 96
          Top = 44
          Width = 517
          Height = 21
          TabOrder = 1
          Text = 'edtPIB_Posada_OsobiSES'
        end
        object btnTaZasluhavshiOsib: TButton
          Left = 616
          Top = 16
          Width = 21
          Height = 49
          Action = aTaZasluhavshiOsibUpdate
          TabOrder = 2
        end
      end
    end
  end
  object alFinansoviSankciiEdit: TActionList
    Left = 460
    Top = 96
    object aTeritoryUpdate: TAction
      Caption = 'aTeritoryUpdate'
      OnExecute = aTeritoryUpdateExecute
    end
    object aRecord_ID_Update: TAction
      Caption = 'aRecord_ID_Update'
      OnExecute = aRecord_ID_UpdateExecute
    end
    object aNomerPostanoviUpdate: TAction
      Caption = '...'
      OnExecute = aNomerPostanoviUpdateExecute
    end
    object aAktDovidkaUpdate: TAction
      Caption = 'aAktDovidkaUpdate'
      OnExecute = aAktDovidkaUpdateExecute
    end
    object aVidomchaPidporydkovanistChoice: TAction
      Caption = '...'
      OnExecute = aVidomchaPidporydkovanistChoiceExecute
    end
    object aObjektChoice: TAction
      Caption = '...'
      OnExecute = aObjektChoiceExecute
    end
    object aRozdil_F18Update: TAction
      Caption = '@'
      OnExecute = aRozdil_F18UpdateExecute
    end
    object aRozdil_F18Choice: TAction
      Caption = '...'
      OnExecute = aRozdil_F18ChoiceExecute
    end
    object aTipShtrafiv_Update: TAction
      Caption = '@'
      OnExecute = aTipShtrafiv_UpdateExecute
    end
    object aTipShtrafiv_Choice: TAction
      Caption = '...'
      OnExecute = aTipShtrafiv_ChoiceExecute
    end
    object aTipProdukcii_Update: TAction
      Caption = '@'
      OnExecute = aTipProdukcii_UpdateExecute
    end
    object aTipProdukcii_Choice: TAction
      Caption = '...'
      OnExecute = aTipProdukcii_ChoiceExecute
    end
    object aYearUpdate: TAction
      Caption = '...'
      OnExecute = aYearUpdateExecute
    end
    object aPIB_SES_Update: TAction
      Caption = '@'
      OnExecute = aPIB_SES_UpdateExecute
    end
    object aPIB_SES_Choice: TAction
      Caption = '...'
      OnExecute = aPIB_SES_ChoiceExecute
    end
    object aPIB_SES_Change: TAction
      Caption = 'aPIB_SES_Change'
      OnExecute = aPIB_SES_ChangeExecute
    end
    object aViddil_Update: TAction
      Caption = '@'
      OnExecute = aViddil_UpdateExecute
    end
    object aViddil_Choice: TAction
      Caption = '...'
      OnExecute = aViddil_ChoiceExecute
    end
    object aPosadaSES_Update: TAction
      Caption = '@'
      OnExecute = aPosadaSES_UpdateExecute
    end
    object aPosadaSES_Choice: TAction
      Caption = '...'
      OnExecute = aPosadaSES_ChoiceExecute
    end
    object aAddVidomosti: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddVidomostiExecute
    end
    object aEditVidomosti: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditVidomostiExecute
    end
    object aDeleteVidomosti: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteVidomostiExecute
    end
    object aUpdateVidomosti: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateVidomostiExecute
    end
    object aPererahuvatiVidomosti: TAction
      Caption = #1055#1077#1088#1077#1088#1072#1093#1091#1074#1072#1090#1080
      OnExecute = aPererahuvatiVidomostiExecute
    end
    object aSumaSankcii: TAction
      Caption = '...'
      OnExecute = aSumaSankciiExecute
    end
    object aVidomchaPidporydkovanist_AdresaUpdate: TAction
      Caption = '...'
      OnExecute = aVidomchaPidporydkovanist_AdresaUpdateExecute
    end
    object aVstanoviv: TAction
      Caption = '...'
      OnExecute = aVstanovivExecute
    end
    object aSchoEPorushennymUpdate: TAction
      Caption = '...'
      OnExecute = aSchoEPorushennymUpdateExecute
    end
    object aTaZasluhavshiOsibUpdate: TAction
      Caption = '...'
      OnExecute = aTaZasluhavshiOsibUpdateExecute
    end
    object aSchodoPorushennyUpdate: TAction
      Caption = '...'
      OnExecute = aSchodoPorushennyUpdateExecute
    end
    object aAddLaboratory: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddLaboratoryExecute
    end
    object aEditLaboratory: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditLaboratoryExecute
    end
    object aDeleteLaboratory: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteLaboratoryExecute
    end
    object aUpdateLaboratory: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateLaboratoryExecute
    end
    object aVisnovkiChoice: TAction
      Caption = 'aVisnovkiChoice'
      OnExecute = aVisnovkiChoiceExecute
    end
    object aGDSL_Update: TAction
      Caption = '...'
      OnExecute = aGDSL_UpdateExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 428
    Top = 96
  end
  object dsVidomostiProFinansovu: TDataSource
    DataSet = qVidomostiProFinansovu
    Left = 520
    Top = 96
  end
  object qVidomostiProFinansovu: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 548
    Top = 96
  end
  object dsLaboratory: TDataSource
    DataSet = qLaboratory
    Left = 592
    Top = 96
  end
  object qLaboratory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 620
    Top = 96
  end
end
