object frmShtrafiEdit: TfrmShtrafiEdit
  Left = 817
  Top = 0
  Width = 654
  Height = 603
  Caption = 'frmShtrafiEdit'
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
    Left = 8
    Top = 40
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label2: TLabel
    Left = 320
    Top = 40
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label4: TLabel
    Left = 12
    Top = 72
    Width = 81
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1088#1086#1090#1086#1082#1086#1083#1091
  end
  object Label26: TLabel
    Left = 320
    Top = 72
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object edtNomerPostanovi: TEdit
    Left = 160
    Top = 40
    Width = 117
    Height = 21
    ImeName = 'Russian'
    MaxLength = 10
    TabOrder = 2
    Text = 'edtNomerPostanovi'
    OnExit = aLaboratoryUpdateExecute
  end
  object pcShtrafi: TPageControl
    Left = 8
    Top = 172
    Width = 621
    Height = 282
    ActivePage = tsDodatkovo
    TabOrder = 7
    object tsVidomostiProObjekt: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      object Label7: TLabel
        Left = 8
        Top = 8
        Width = 72
        Height = 13
        Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1072
      end
      object Label8: TLabel
        Left = 8
        Top = 64
        Width = 77
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1072
      end
      object Label9: TLabel
        Left = 8
        Top = 92
        Width = 85
        Height = 13
        Caption = #1055'.'#1030'.'#1041'. '#1087#1086#1088#1091#1096#1085#1080#1082#1072
      end
      object Label10: TLabel
        Left = 8
        Top = 120
        Width = 96
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072' '#1087#1086#1088#1091#1096#1085#1080#1082#1072
      end
      object Label11: TLabel
        Left = 8
        Top = 148
        Width = 91
        Height = 13
        Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      end
      object Label12: TLabel
        Left = 340
        Top = 148
        Width = 107
        Height = 13
        Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076
      end
      object Label14: TLabel
        Left = 8
        Top = 176
        Width = 94
        Height = 13
        Caption = #1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
      end
      object Label13: TLabel
        Left = 8
        Top = 204
        Width = 102
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103
      end
      object Label24: TLabel
        Left = 8
        Top = 40
        Width = 139
        Height = 13
        Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089' '#1090#1100
      end
      object edtNazvaObjectu: TEdit
        Left = 112
        Top = 8
        Width = 469
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 0
        Text = 'edtNazvaObjectu'
      end
      object edtAdresaObjectu: TEdit
        Left = 112
        Top = 64
        Width = 469
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 3
        Text = 'edtAdresaObjectu'
      end
      object edtPIBPorushnika: TEdit
        Left = 112
        Top = 92
        Width = 469
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 4
        Text = 'edtPIBPorushnika'
      end
      object edtPosadaPorushnika: TEdit
        Left = 112
        Top = 120
        Width = 469
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 5
        Text = 'edtPosadaPorushnika'
      end
      object edtIdentifikacijnijNomer: TEdit
        Left = 460
        Top = 148
        Width = 121
        Height = 21
        ImeName = 'Russian'
        MaxLength = 10
        TabOrder = 7
        Text = 'edtIdentifikacijnijNomer'
      end
      object edtMisceNarodgenny: TEdit
        Left = 112
        Top = 176
        Width = 469
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 8
        Text = 'edtMisceNarodgenny'
      end
      object btnVidomostiProObjekt: TButton
        Left = 588
        Top = 4
        Width = 21
        Height = 221
        Action = aVidomostriProObjectChange
        TabOrder = 10
      end
      object edtMisceProzhivanny: TEdit
        Left = 112
        Top = 204
        Width = 469
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 9
        Text = 'edtMisceProzhivanny'
      end
      object dtpDataNarodzhenny: TDateTimePicker
        Left = 112
        Top = 148
        Width = 186
        Height = 21
        Date = 39271.870646875000000000
        Time = 39271.870646875000000000
        ImeName = 'Russian'
        TabOrder = 6
      end
      object edtVidomchaPidporydkovanist: TEdit
        Left = 112
        Top = 36
        Width = 445
        Height = 21
        ImeName = 'Russian'
        TabOrder = 1
        Text = 'edtVidomchaPidporydkovanist'
      end
      object btnVidomchaPidporydkovanist: TButton
        Left = 560
        Top = 36
        Width = 21
        Height = 21
        Action = aVidomchaPidporadkovanistChange
        Enabled = False
        TabOrder = 2
      end
    end
    object tsVidomostiProPereviryjuchogo: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1087#1077#1088#1077#1074#1110#1088#1103#1102#1095#1086#1075#1086
      ImageIndex = 1
      object Label15: TLabel
        Left = 8
        Top = 8
        Width = 156
        Height = 13
        Caption = #1054#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1103#1074#1080#1083#1072' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      end
      object Label16: TLabel
        Left = 8
        Top = 36
        Width = 116
        Height = 13
        Caption = #1042#1110#1076#1076#1110#1083' '#1074' '#1103#1082#1086#1084#1091' '#1087#1088#1072#1094#1102#1108' '
      end
      object Label17: TLabel
        Left = 8
        Top = 96
        Width = 94
        Height = 13
        Caption = #1055#1086#1088#1091#1096#1077#1085#1085#1103' '#1089#1090#1072#1090#1077#1081
      end
      object Label18: TLabel
        Left = 8
        Top = 228
        Width = 76
        Height = 13
        Caption = #1056#1086#1079#1084#1110#1088' '#1096#1090#1088#1072#1092#1091
      end
      object Label19: TLabel
        Left = 8
        Top = 48
        Width = 154
        Height = 13
        Caption = #1086#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1103#1074#1080#1083#1072' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      end
      object Label34: TLabel
        Left = 8
        Top = 64
        Width = 95
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072' '#1086#1089#1086#1073#1080', '#1097#1086' '
      end
      object Label35: TLabel
        Left = 8
        Top = 76
        Width = 100
        Height = 13
        Caption = #1074#1080#1103#1074#1080#1083#1072' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      end
      object btnOsobaSchoViyvilaPorushnnyUpdate: TButton
        Left = 564
        Top = 8
        Width = 21
        Height = 21
        Action = aOsobaSchoViyvilaPorushennyUpdate
        TabOrder = 0
      end
      object btnViddilChoice: TButton
        Left = 588
        Top = 36
        Width = 21
        Height = 21
        Action = aViddilChoice
        TabOrder = 1
      end
      object btnRozmirShtrafuChoice: TButton
        Left = 588
        Top = 228
        Width = 21
        Height = 21
        Action = aRozmirShtrafuChoice
        TabOrder = 5
      end
      object btnPorushennyStatej: TButton
        Left = 588
        Top = 112
        Width = 21
        Height = 109
        Action = aStattiChange
        TabOrder = 4
      end
      object btnPosadaOsobiSESChoice: TButton
        Left = 588
        Top = 64
        Width = 21
        Height = 21
        Action = aPosadaOsobiSesChoice
        TabOrder = 2
      end
      object rePorushennyStatej: TMemo
        Left = 8
        Top = 112
        Width = 577
        Height = 109
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Russian'
        Lines.Strings = (
          'rePorushennyStatej')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object btnOsobaSchoViyvilaPorushnnyChoice: TButton
        Left = 588
        Top = 8
        Width = 21
        Height = 21
        Action = aOsobaSchoViyvilaPorushennyChoice
        TabOrder = 6
      end
      object cbOsobaSchoViyvilaPorushnny: TComboBox
        Left = 176
        Top = 8
        Width = 385
        Height = 21
        ImeName = 'Russian'
        ItemHeight = 13
        TabOrder = 7
        Text = 'cbOsobaSchoViyvilaPorushnny'
        OnChange = aOsobaSchoViyvilaPorushennyChangeExecute
      end
      object cbViddil: TComboBox
        Left = 176
        Top = 36
        Width = 385
        Height = 21
        ImeName = 'Russian'
        ItemHeight = 13
        TabOrder = 8
        Text = 'cbViddil'
      end
      object btnViddilUpdate: TButton
        Left = 564
        Top = 36
        Width = 21
        Height = 21
        Action = aViddilUpdate
        TabOrder = 9
      end
      object cbPosadaOsobiSES: TComboBox
        Left = 176
        Top = 64
        Width = 385
        Height = 21
        ImeName = 'Russian'
        ItemHeight = 13
        TabOrder = 10
        Text = 'cbPosadaOsobiSES'
      end
      object btnPosadaOsobiSESUpdate: TButton
        Left = 564
        Top = 64
        Width = 21
        Height = 21
        Action = aPosadaOsobiSesUpdate
        TabOrder = 11
      end
      object cbRozmirShtrafu: TComboBox
        Left = 88
        Top = 228
        Width = 473
        Height = 21
        ImeName = 'Russian'
        ItemHeight = 13
        TabOrder = 12
        Text = 'cbRozmirShtrafu'
      end
      object btnRozmirShtrafuUpdate: TButton
        Left = 565
        Top = 228
        Width = 21
        Height = 21
        Action = aRozmirShtrafuUpdate
        TabOrder = 13
      end
    end
    object tsZmistPostanovi: TTabSheet
      Caption = #1047#1084#1110#1089#1090' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ImageIndex = 2
      object Label20: TLabel
        Left = 8
        Top = 8
        Width = 136
        Height = 13
        Caption = #1042#1080#1079#1085#1072#1090#1080' ('#1055'.'#1030'.'#1041'. '#1087#1086#1088#1091#1096#1085#1080#1082#1072')'
      end
      object Label21: TLabel
        Left = 8
        Top = 36
        Width = 94
        Height = 13
        Caption = #1042#1080#1079#1085#1072#1090#1080' '#1074#1080#1085#1085#1080#1084' '#1091':'
      end
      object Label22: TLabel
        Left = 8
        Top = 132
        Width = 194
        Height = 13
        Caption = #1055#1077#1088#1077#1083#1110#1082' '#1087#1086#1088#1091#1096#1077#1085#1080#1093' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1080#1093' '#1072#1082#1090#1110#1074
      end
      object edtPIBPorushnikaRV: TEdit
        Left = 152
        Top = 8
        Width = 433
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 0
        Text = 'edtPIBPorushnikaRV'
      end
      object btnPIBPorushnikaRV: TButton
        Left = 588
        Top = 8
        Width = 21
        Height = 21
        Action = aPIBPorushnikaChange
        TabOrder = 1
      end
      object btnPerelikPorushnihAktiv: TButton
        Left = 588
        Top = 148
        Width = 21
        Height = 101
        Action = aNormativniAktiChange
        TabOrder = 5
      end
      object btnViznatiVinnim: TButton
        Left = 588
        Top = 52
        Width = 21
        Height = 77
        Action = aViznatiVinnimChange
        TabOrder = 3
      end
      object reViznatiVinnim: TMemo
        Left = 8
        Top = 52
        Width = 577
        Height = 77
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Russian'
        Lines.Strings = (
          'reViznatiVinnim')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object rePerelikPorushnihAktiv: TMemo
        Left = 8
        Top = 148
        Width = 577
        Height = 101
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        ImeName = 'Russian'
        Lines.Strings = (
          'rePerelikPorushnihAktiv')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 4
      end
    end
    object tsDodatkovo: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      ImageIndex = 4
      object Label30: TLabel
        Left = 4
        Top = 4
        Width = 86
        Height = 13
        Caption = #1065#1086#1076#1086' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      end
      object Label31: TLabel
        Left = 4
        Top = 68
        Width = 102
        Height = 13
        Caption = #1058#1072' '#1079#1072#1089#1083#1091#1093#1072#1074#1096#1080' '#1086#1089#1110#1073':'
      end
      object Label32: TLabel
        Left = 4
        Top = 176
        Width = 82
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      end
      object Label3: TLabel
        Left = 4
        Top = 84
        Width = 49
        Height = 13
        Caption = #1087#1086#1088#1091#1096#1085#1080#1082
      end
      object Label23: TLabel
        Left = 4
        Top = 104
        Width = 89
        Height = 13
        Caption = #1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082' '#1057#1045#1057
      end
      object Label27: TLabel
        Left = 4
        Top = 204
        Width = 63
        Height = 13
        Caption = #1058#1080#1087' '#1096#1090#1088#1072#1092#1110#1074
      end
      object Label5: TLabel
        Left = 4
        Top = 232
        Width = 15
        Height = 13
        Caption = #1056#1110#1082
      end
      object edtPIBPorushnikaTV: TEdit
        Left = 4
        Top = 20
        Width = 585
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 0
        Text = 'edtPIBPorushnikaTV'
      end
      object edtPIB_Posada_NazvaObjectu: TEdit
        Left = 104
        Top = 84
        Width = 481
        Height = 21
        ImeName = 'Russian'
        MaxLength = 250
        TabOrder = 3
        Text = 'edtPIB_Posada_NazvaObjectu'
      end
      object btnRozdil_F18_Select: TButton
        Left = 588
        Top = 176
        Width = 21
        Height = 21
        Action = aRozdilt23f18_Select
        TabOrder = 11
      end
      object edtPosadaPorushnika_AdresaObjektu: TEdit
        Left = 4
        Top = 40
        Width = 585
        Height = 21
        ImeName = 'Russian'
        MaxLength = 400
        TabOrder = 1
        Text = 'edtPosadaPorushnika_AdresaObjektu'
      end
      object btnPosadaPorushnika_AdresaObjektu: TButton
        Left = 588
        Top = 20
        Width = 21
        Height = 41
        Action = aSchodoPorushennyChange
        TabOrder = 2
      end
      object edtPIB_Posada_OsobiSES: TEdit
        Left = 104
        Top = 104
        Width = 481
        Height = 21
        ImeName = 'Russian'
        MaxLength = 100
        TabOrder = 4
        Text = 'edtPIB_Posada_OsobiSES'
      end
      object btnTaZasluhavshiOsib: TButton
        Left = 588
        Top = 84
        Width = 21
        Height = 41
        Action = aTaZasluhavshiOsibChange
        TabOrder = 5
      end
      object btnTipShtrafiv_Select: TButton
        Left = 588
        Top = 204
        Width = 21
        Height = 21
        Action = aTipShtrafiv_Select
        TabOrder = 14
      end
      object edtRik: TEdit
        Left = 32
        Top = 232
        Width = 121
        Height = 21
        ImeName = 'Russian'
        TabOrder = 15
        Text = 'edtRik'
      end
      object btnRik: TButton
        Left = 152
        Top = 232
        Width = 21
        Height = 21
        Action = aRikUpdate
        TabOrder = 16
      end
      object cbRozdil_F18: TComboBox
        Left = 104
        Top = 176
        Width = 457
        Height = 21
        ImeName = 'Russian'
        ItemHeight = 13
        TabOrder = 9
        Text = 'cbRozdil_F18'
      end
      object cbTipShtrafiv: TComboBox
        Left = 104
        Top = 204
        Width = 457
        Height = 21
        ImeName = 'Russian'
        ItemHeight = 13
        TabOrder = 12
        Text = 'cbTipShtrafiv'
      end
      object btnRozdil_T18_Update: TButton
        Left = 564
        Top = 176
        Width = 21
        Height = 21
        Action = aRozdilt23f18_Update
        TabOrder = 10
      end
      object btnTipShtrafivUpdate: TButton
        Left = 564
        Top = 204
        Width = 21
        Height = 21
        Action = aTipShtrafiv_Update
        TabOrder = 13
      end
      object cbxUchast: TCheckBox
        Left = 4
        Top = 128
        Width = 301
        Height = 17
        Caption = 'cbxUchast'
        TabOrder = 6
        OnClick = cbxUchastClick
      end
      object cbxKlopotannyProPerenos: TCheckBox
        Left = 4
        Top = 148
        Width = 509
        Height = 17
        Caption = 'cbxKlopotannyProPerenos'
        TabOrder = 7
        OnClick = cbxKlopotannyProPerenosClick
      end
      object dtpKlopotannyProPerenos: TDateTimePicker
        Left = 520
        Top = 148
        Width = 89
        Height = 21
        Date = 40659.426201527800000000
        Time = 40659.426201527800000000
        ImeName = 'Russian'
        TabOrder = 8
      end
    end
    object tsLaboratornijKontrol: TTabSheet
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      ImageIndex = 4
      PopupMenu = PopupMenu1
      object Panel1: TPanel
        Left = 554
        Top = 0
        Width = 59
        Height = 254
        Align = alRight
        AutoSize = True
        BevelOuter = bvNone
        ParentBackground = True
        TabOrder = 0
        object btnLabKontrolDodati: TButton
          Left = 0
          Top = 12
          Width = 59
          Height = 21
          Action = aLaboratoryAdd
          TabOrder = 0
        end
        object btnLabKontrolZminiti: TButton
          Left = 0
          Top = 36
          Width = 59
          Height = 21
          Action = aLaboratoryEdit
          TabOrder = 1
        end
        object btnLabKontrolVidaliti: TButton
          Left = 0
          Top = 60
          Width = 59
          Height = 21
          Action = aLaboratoryDelete
          TabOrder = 2
        end
        object btnUpdate: TButton
          Left = 0
          Top = 84
          Width = 59
          Height = 21
          Action = aLaboratoryUpdate
          TabOrder = 3
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 377
        Height = 105
        DataSource = dsLaboratornijKontrol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = 'Russian'
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopupMenu1
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
  end
  object btnVikonati: TButton
    Left = 241
    Top = 536
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 9
  end
  object btnVidminiti: TButton
    Left = 321
    Top = 536
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 10
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 480
    Top = 40
    Width = 146
    Height = 21
    Date = 39271.868811840300000000
    Time = 39271.868811840300000000
    ImeName = 'Russian'
    TabOrder = 4
    OnExit = aLaboratoryUpdateExecute
  end
  object dtpDataProtokolu: TDateTimePicker
    Left = 160
    Top = 72
    Width = 141
    Height = 21
    Date = 39271.869327974500000000
    Time = 39271.869327974500000000
    ImeName = 'Russian'
    TabOrder = 5
  end
  object Panel2: TPanel
    Left = 8
    Top = 100
    Width = 621
    Height = 65
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentBackground = True
    TabOrder = 6
    object lblData: TLabel
      Left = 8
      Top = 38
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object lblPosada_Nomer: TLabel
      Left = 244
      Top = 38
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object lblDataDo: TLabel
      Left = 132
      Top = 38
      Width = 12
      Height = 13
      Caption = #1076#1086
    end
    object rgAkt_Papiska: TRadioGroup
      Left = 0
      Top = 0
      Width = 621
      Height = 33
      Columns = 3
      Ctl3D = True
      Items.Strings = (
        #1030#1085#1092#1086#1088#1084#1072#1094#1110#1081#1085#1072' '#1076#1086#1074#1110#1076#1082#1072
        #1040#1082#1090' '#1074#1110#1076#1073#1086#1088#1091
        #1040#1082#1090' '#1089#1072#1085'.-'#1077#1087#1110#1076'. '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103)
      ParentCtl3D = False
      TabOrder = 0
      OnClick = aActRaspiskaChangeExecute
    end
    object dtpData: TDateTimePicker
      Left = 40
      Top = 38
      Width = 85
      Height = 21
      Date = 39540.037082245400000000
      Time = 39540.037082245400000000
      ImeName = 'Russian'
      TabOrder = 1
    end
    object edtNomer: TEdit
      Left = 292
      Top = 38
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 3
      Text = 'edtNomer'
    end
    object dtpDataDo: TDateTimePicker
      Left = 152
      Top = 38
      Width = 85
      Height = 21
      Date = 40328.949457094900000000
      Time = 40328.949457094900000000
      ImeName = 'Russian'
      TabOrder = 2
    end
  end
  object btnNomerPostanovi: TButton
    Left = 276
    Top = 40
    Width = 21
    Height = 21
    Action = aNomerPostanoviUpdate
    TabOrder = 3
  end
  object cbTeritory: TComboBox
    Left = 12
    Top = 8
    Width = 301
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 0
    Text = 'cbTeritory'
  end
  object cbRajon: TComboBox
    Left = 324
    Top = 8
    Width = 301
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 1
    Text = 'cbRajon'
  end
  object gbOsobaSchoVineslaPostanovu: TGroupBox
    Left = 8
    Top = 456
    Width = 621
    Height = 73
    Caption = #1054#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1085#1077#1089#1083#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
    TabOrder = 8
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
    end
    object Label25: TLabel
      Left = 8
      Top = 44
      Width = 137
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
    end
    object edtPosadaGDSL: TEdit
      Left = 60
      Top = 16
      Width = 537
      Height = 21
      ImeName = 'Russian'
      TabOrder = 0
      Text = 'edtPosadaGDSL'
    end
    object edtPrizvischeGDSL: TEdit
      Left = 152
      Top = 44
      Width = 445
      Height = 21
      ImeName = 'Russian'
      TabOrder = 1
      Text = 'edtPrizvischeGDSL'
    end
    object btnGDSL: TButton
      Left = 596
      Top = 16
      Width = 21
      Height = 49
      Action = aGDSL_Update
      TabOrder = 2
    end
  end
  object edtKod: TEdit
    Left = 348
    Top = 72
    Width = 277
    Height = 21
    Enabled = False
    ImeName = 'Russian'
    TabOrder = 11
    Text = 'edtKod'
  end
  object PopupMenu1: TPopupMenu
    OwnerDraw = True
    Left = 508
    Top = 528
    object mnLabKontrolDodati: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
    end
    object mnLabKontrolZminiti: TMenuItem
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 13
    end
    object mnLabKontrolVidaliti: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 46
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnSortuvanny: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1076#1072#1085#1080#1093
      object mnZaVidom: TMenuItem
        Caption = #1047#1072' '#1074#1080#1076#1086#1084
        Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1074#1080#1076#1086#1084' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1102
        ShortCut = 113
      end
      object mnZaDatoju: TMenuItem
        Caption = #1047#1072' '#1076#1072#1090#1086#1102
        Hint = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103' '#1079#1072' '#1076#1072#1090#1086#1102' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1102
        ShortCut = 114
      end
      object mnBezSortuvany: TMenuItem
        Caption = #1041#1077#1079' '#1089#1086#1088#1090#1091#1074#1072#1085#1085#1103
        Hint = #1041#1077#1079' '#1089#1086#1088#1090#1091#1074#1072#1085#1085#1103
        ShortCut = 115
      end
    end
  end
  object qComboBoxes: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 160
    Top = 524
  end
  object alShtrafiEdit: TActionList
    Left = 192
    Top = 524
    object aKodUpdate: TAction
      Caption = 'aKodUpdate'
      OnExecute = aKodUpdateExecute
    end
    object aNomerPostanoviUpdate: TAction
      Caption = '...'
      OnExecute = aNomerPostanoviUpdateExecute
    end
    object aActRaspiskaChange: TAction
      Caption = 'aActRaspiskaChange'
      OnExecute = aActRaspiskaChangeExecute
    end
    object aVidomchaPidporadkovanistChange: TAction
      Caption = '...'
      OnExecute = aVidomchaPidporadkovanistChangeExecute
    end
    object aVidomostriProObjectChange: TAction
      Caption = '...'
      OnExecute = aVidomostriProObjectChangeExecute
    end
    object aOsobaSchoViyvilaPorushennyUpdate: TAction
      Caption = '@'
      OnExecute = aOsobaSchoViyvilaPorushennyUpdateExecute
    end
    object aOsobaSchoViyvilaPorushennyChoice: TAction
      Caption = '...'
      OnExecute = aOsobaSchoViyvilaPorushennyChoiceExecute
    end
    object aOsobaSchoViyvilaPorushennyChange: TAction
      Caption = 'aOsobaSchoViyvilaPorushennyChange'
      OnExecute = aOsobaSchoViyvilaPorushennyChangeExecute
    end
    object aViddilChoice: TAction
      Caption = '...'
      OnExecute = aViddilChoiceExecute
    end
    object aViddilUpdate: TAction
      Caption = '@'
      OnExecute = aViddilUpdateExecute
    end
    object aPosadaOsobiSesChoice: TAction
      Caption = '...'
      OnExecute = aPosadaOsobiSesChoiceExecute
    end
    object aPosadaOsobiSesUpdate: TAction
      Caption = '@'
      OnExecute = aPosadaOsobiSesUpdateExecute
    end
    object aStattiChange: TAction
      Caption = '...'
      OnExecute = aStattiChangeExecute
    end
    object aRozmirShtrafuChoice: TAction
      Caption = '...'
      OnExecute = aRozmirShtrafuChoiceExecute
    end
    object aRozmirShtrafuUpdate: TAction
      Caption = '@'
      OnExecute = aRozmirShtrafuUpdateExecute
    end
    object aPIBPorushnikaChange: TAction
      Caption = '...'
      OnExecute = aPIBPorushnikaChangeExecute
    end
    object aViznatiVinnimChange: TAction
      Caption = '...'
      OnExecute = aViznatiVinnimChangeExecute
    end
    object aNormativniAktiChange: TAction
      Caption = '...'
      OnExecute = aNormativniAktiChangeExecute
    end
    object aSchodoPorushennyChange: TAction
      Caption = '...'
      OnExecute = aSchodoPorushennyChangeExecute
    end
    object aTaZasluhavshiOsibChange: TAction
      Caption = '...'
      OnExecute = aTaZasluhavshiOsibChangeExecute
    end
    object aRozdilt23f18_Update: TAction
      Caption = '@'
      OnExecute = aRozdilt23f18_UpdateExecute
    end
    object aRozdilt23f18_Select: TAction
      Caption = '...'
      OnExecute = aRozdilt23f18_SelectExecute
    end
    object aTipShtrafiv_Update: TAction
      Caption = '@'
      OnExecute = aTipShtrafiv_UpdateExecute
    end
    object aTipShtrafiv_Select: TAction
      Caption = '...'
      OnExecute = aTipShtrafiv_SelectExecute
    end
    object aRikUpdate: TAction
      Caption = '...'
      OnExecute = aRikUpdateExecute
    end
    object aLaboratoryAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aLaboratoryAddExecute
    end
    object aLaboratoryEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aLaboratoryEditExecute
    end
    object aLaboratoryDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aLaboratoryDeleteExecute
    end
    object aLaboratoryUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aLaboratoryUpdateExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aGDSL_Update: TAction
      Caption = '...'
      OnExecute = aGDSL_UpdateExecute
    end
  end
  object dsLaboratornijKontrol: TDataSource
    DataSet = qLaboratornijKontrol
    Left = 56
    Top = 524
  end
  object qLaboratornijKontrol: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 88
    Top = 524
  end
end
