object frmViluchennyZRealizaciiEdit: TfrmViluchennyZRealizaciiEdit
  Left = 313
  Top = 0
  Width = 677
  Height = 571
  Caption = 'frmViluchennyZRealizaciiEdit'
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
    Top = 36
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label2: TLabel
    Left = 248
    Top = 36
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label5: TLabel
    Left = 8
    Top = 148
    Width = 115
    Height = 13
    Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
  end
  object Label8: TLabel
    Left = 544
    Top = 4
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object btnVikonati: TButton
    Left = 259
    Top = 504
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 0
  end
  object btnVidminiti: TButton
    Left = 335
    Top = 504
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 1
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 36
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtNomerPostanovi'
    OnExit = edtNomerPostanoviExit
  end
  object btnNomerPostanovi: TButton
    Left = 208
    Top = 36
    Width = 21
    Height = 21
    Action = aNomerPostanoviUpdate
    TabOrder = 3
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 336
    Top = 36
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 39525.5857660532
    Time = 39525.5857660532
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
    OnExit = dtpDataPostanoviExit
  end
  object edtDodatkovaInformaciy: TEdit
    Left = 132
    Top = 148
    Width = 529
    Height = 21
    TabOrder = 5
    Text = 'edtDodatkovaInformaciy'
  end
  object Panel2: TPanel
    Left = 8
    Top = 68
    Width = 653
    Height = 69
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 6
    object lblData: TLabel
      Left = 8
      Top = 40
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
      Visible = False
    end
    object lblNomer: TLabel
      Left = 236
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
      OnClick = aAkt_Dovidka_UpdateExecute
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
      Left = 276
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edtNomer'
      Visible = False
    end
    object dtpDataDo: TDateTimePicker
      Left = 132
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
  object cbMinistry: TComboBox
    Left = 4
    Top = 4
    Width = 176
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 184
    Top = 4
    Width = 176
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 8
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 364
    Top = 4
    Width = 176
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 9
    Text = 'cbDistrict'
  end
  object edtRecordID: TEdit
    Left = 596
    Top = 4
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 10
    Text = 'edtRecordID'
  end
  object pcViluchennyZRealizacii: TPageControl
    Left = 8
    Top = 180
    Width = 653
    Height = 241
    ActivePage = tsVidomostiProViluchenny
    TabIndex = 2
    TabOrder = 11
    object tsVidomostiProObjekt: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1086#1073#39#1108#1082#1090
      object Label10: TLabel
        Left = 4
        Top = 4
        Width = 114
        Height = 13
        Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1086#1073#39#1108#1082#1090#1091
      end
      object Label11: TLabel
        Left = 4
        Top = 32
        Width = 136
        Height = 13
        Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
      end
      object Label12: TLabel
        Left = 4
        Top = 60
        Width = 37
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072
      end
      object Label13: TLabel
        Left = 4
        Top = 88
        Width = 80
        Height = 13
        Caption = #1055'.'#1030'.'#1041'. '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object Label14: TLabel
        Left = 4
        Top = 116
        Width = 91
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object edtNajmenuvannyObjektu: TEdit
        Left = 124
        Top = 4
        Width = 493
        Height = 21
        TabOrder = 0
        Text = 'edtNajmenuvannyObjektu'
      end
      object edtVidomchaPidporydkovanist: TEdit
        Left = 144
        Top = 32
        Width = 449
        Height = 21
        TabOrder = 1
        Text = 'edtVidomchaPidporydkovanist'
      end
      object btnVidomchaPidporydkovanist: TButton
        Left = 596
        Top = 32
        Width = 21
        Height = 21
        Action = aVidomchaPidporydkovanistChoice
        TabOrder = 2
      end
      object edtAdresa: TEdit
        Left = 48
        Top = 60
        Width = 569
        Height = 21
        TabOrder = 3
        Text = 'edtAdresa'
      end
      object edtPIBKerivnika: TEdit
        Left = 92
        Top = 88
        Width = 525
        Height = 21
        TabOrder = 4
        Text = 'edtPIBKerivnika'
      end
      object edtPosada: TEdit
        Left = 100
        Top = 116
        Width = 517
        Height = 21
        TabOrder = 5
        Text = 'edtPosada'
      end
      object btnVidomostiProObjekt: TButton
        Left = 620
        Top = 4
        Width = 21
        Height = 133
        Action = aVidomostiProObjektChoice
        TabOrder = 6
      end
    end
    object tsVidomostiProPereviryjuchogo: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1087#1077#1088#1077#1074#1110#1088#1103#1102#1095#1086#1075#1086
      ImageIndex = 1
      object Label16: TLabel
        Left = 4
        Top = 4
        Width = 156
        Height = 13
        Caption = #1054#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1103#1074#1080#1083#1072' '#1087#1086#1088#1091#1096#1077#1085#1085#1103
      end
      object Label17: TLabel
        Left = 4
        Top = 32
        Width = 29
        Height = 13
        Caption = #1042#1110#1076#1076#1110#1083
      end
      object Label18: TLabel
        Left = 4
        Top = 60
        Width = 38
        Height = 13
        Caption = #1055#1086#1089#1072#1076#1072
      end
      object Label19: TLabel
        Left = 4
        Top = 88
        Width = 68
        Height = 13
        Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
      end
      object Label20: TLabel
        Left = 4
        Top = 116
        Width = 82
        Height = 13
        Caption = #1056#1086#1079#1076#1110#1083' '#1090'.23 '#1092'.18'
      end
      object Label21: TLabel
        Left = 4
        Top = 144
        Width = 75
        Height = 13
        Caption = #1058#1080#1087' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      end
      object Label22: TLabel
        Left = 4
        Top = 172
        Width = 15
        Height = 13
        Caption = #1056#1110#1082
      end
      object cbOsobaSES: TComboBox
        Left = 168
        Top = 4
        Width = 425
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cbOsobaSES'
        OnChange = aOsobaSES_ChangeExecute
      end
      object btnOsobaSES_Update: TButton
        Left = 596
        Top = 4
        Width = 21
        Height = 21
        Action = aOsobaSES_Update
        TabOrder = 1
      end
      object btnOsobaSES_Choice: TButton
        Left = 620
        Top = 4
        Width = 21
        Height = 21
        Action = aOsobaSES_Choice
        TabOrder = 2
      end
      object cbViddilSES: TComboBox
        Left = 40
        Top = 32
        Width = 553
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'cbViddilSES'
      end
      object btnViddilSES_Update: TButton
        Left = 596
        Top = 32
        Width = 21
        Height = 21
        Action = aViddilSES_Udpate
        TabOrder = 4
      end
      object btnViddilSES_Choice: TButton
        Left = 620
        Top = 32
        Width = 21
        Height = 21
        Action = aViddilSES_Choice
        TabOrder = 5
      end
      object cbPosadaSES: TComboBox
        Left = 48
        Top = 60
        Width = 545
        Height = 21
        ItemHeight = 13
        TabOrder = 6
        Text = 'cbPosadaSES'
      end
      object btnPosadaSES_Update: TButton
        Left = 596
        Top = 60
        Width = 21
        Height = 21
        Action = aPosadaSES_Update
        TabOrder = 7
      end
      object btnPosadaSES_Choice: TButton
        Left = 620
        Top = 60
        Width = 21
        Height = 21
        Action = aPosadaSES_Choice
        TabOrder = 8
      end
      object cbTipProdukcii: TComboBox
        Left = 76
        Top = 88
        Width = 517
        Height = 21
        ItemHeight = 13
        TabOrder = 9
        Text = 'cbTipProdukcii'
      end
      object btnTipProdukcii_Update: TButton
        Left = 596
        Top = 88
        Width = 21
        Height = 21
        Action = aTipProdukcii_Update
        TabOrder = 10
      end
      object btnTipProdukcii_Choice: TButton
        Left = 620
        Top = 88
        Width = 21
        Height = 21
        Action = aTipProdukcii_Choice
        TabOrder = 11
      end
      object cbRozdil_T23_F18: TComboBox
        Left = 92
        Top = 116
        Width = 501
        Height = 21
        ItemHeight = 13
        TabOrder = 12
        Text = 'cbRozdil_T23_F18'
      end
      object btnRozdil_T23_F18_Update: TButton
        Left = 596
        Top = 116
        Width = 21
        Height = 21
        Action = aRozdil_T23_F18_Update
        TabOrder = 13
      end
      object btnRozdil_T23_F18_Choice: TButton
        Left = 620
        Top = 116
        Width = 21
        Height = 21
        Action = aRozdil_T23_F18_Choice
        TabOrder = 14
      end
      object cbTipPostanovi: TComboBox
        Left = 84
        Top = 144
        Width = 509
        Height = 21
        ItemHeight = 13
        TabOrder = 15
        Text = 'cbTipPostanovi'
      end
      object btnTipPostanovi_Update: TButton
        Left = 596
        Top = 144
        Width = 21
        Height = 21
        Action = aTipPostanovi_Update
        TabOrder = 16
      end
      object btnTipPostanovi_Choice: TButton
        Left = 620
        Top = 144
        Width = 21
        Height = 21
        Action = aTipPostanovi_Choice
        TabOrder = 17
      end
      object edtYear: TEdit
        Left = 24
        Top = 172
        Width = 121
        Height = 21
        TabOrder = 18
        Text = 'edtYear'
      end
      object btnYear: TButton
        Left = 148
        Top = 172
        Width = 21
        Height = 21
        Action = aYearUpdate
        TabOrder = 19
      end
    end
    object tsVidomostiProViluchenny: TTabSheet
      Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 4
        Top = 4
        Width = 641
        Height = 129
        Caption = #1042#1110#1076#1086#1084#1086#1089#1090#1110' '#1087#1088#1086' '#1074#1080#1083#1091#1095#1077#1085#1085#1103
        TabOrder = 0
        object Panel4: TPanel
          Left = 564
          Top = 15
          Width = 75
          Height = 112
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object btnAddViluchenny: TButton
            Left = 0
            Top = 0
            Width = 75
            Height = 25
            Action = aAddViluchenny
            TabOrder = 0
          end
          object btnEditViluchenny: TButton
            Left = 0
            Top = 28
            Width = 75
            Height = 25
            Action = aEditViluchenny
            TabOrder = 1
          end
          object btnDeleteViluchenny: TButton
            Left = 0
            Top = 56
            Width = 75
            Height = 25
            Action = aDeleteViluchenny
            TabOrder = 2
          end
          object btnUpdateViluchenny: TButton
            Left = 0
            Top = 84
            Width = 75
            Height = 25
            Action = aUpdateViluchenny
            TabOrder = 3
          end
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 16
          Width = 517
          Height = 97
          DataSource = dsVidomostiProViluchenny
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
              FieldName = 'NAJMENUVANNY_TOVARU'
              Title.Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1091
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'KILKIST_TOVARU'
              Title.Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SOKRASCHENNOE_NAZVANIE'
              Title.Caption = #1054#1076#1080#1085#1080#1094#1110' '#1074#1080#1084#1110#1088#1091
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VAGA_ODINICI'
              Title.Caption = #1042#1072#1075#1072' '#1086#1076#1080#1085#1080#1094#1110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAGALNA_VAGA_KG'
              Title.Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1075#1072', '#1082#1075
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ZAGALNA_VAGA_T'
              Title.Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1075#1072', '#1090
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VIROBNIK'
              Title.Caption = #1042#1080#1088#1086#1073#1085#1080#1082
              Visible = True
            end>
        end
      end
      object rgVstanoviv: TRadioGroup
        Left = 4
        Top = 132
        Width = 641
        Height = 77
        Items.Strings = (
          #1041#1077#1079' '#1075#1110#1075#1110#1108#1085#1110#1095#1085#1080#1093' '#1074#1080#1089#1085#1086#1074#1082#1110#1074
          #1055#1088#1086#1089#1090#1088#1086#1095#1077#1085#1080#1081' '#1090#1077#1088#1084#1110#1085' '#1088#1077#1072#1083#1110#1079#1072#1094#1110#1111
          #1041#1072#1082#1090#1077#1088#1110#1086#1083#1086#1075#1110#1095#1085#1110' '#1079#1072#1073#1088#1091#1076#1085#1077#1085#1085#1103)
        TabOrder = 1
        OnClick = aVstanoviv_UpdateExecute
      end
      object dtpTerminRealizacii: TDateTimePicker
        Left = 200
        Top = 166
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 40454.6735753009
        Time = 40454.6735753009
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
      end
    end
    object tsLaboratornijKontrol: TTabSheet
      Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 4
        Top = 4
        Width = 641
        Height = 129
        Caption = #1051#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
        TabOrder = 0
        object Panel5: TPanel
          Left = 564
          Top = 15
          Width = 75
          Height = 112
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object btnAddLaboratory: TButton
            Left = 0
            Top = 0
            Width = 75
            Height = 25
            Action = aAddLaboratory
            TabOrder = 0
          end
          object btnEditLaboratory: TButton
            Left = 0
            Top = 28
            Width = 75
            Height = 25
            Action = aEditLaboratory
            TabOrder = 1
          end
          object btnDeleteLaboratory: TButton
            Left = 0
            Top = 56
            Width = 75
            Height = 25
            Action = aDeleteLaboratory
            TabOrder = 2
          end
          object btnUpdateLaboratory: TButton
            Left = 0
            Top = 84
            Width = 75
            Height = 25
            Action = aUpdateLaboratory
            TabOrder = 3
          end
        end
        object DBGrid2: TDBGrid
          Left = 8
          Top = 16
          Width = 425
          Height = 77
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
    object tsZmistPostanovi: TTabSheet
      Caption = #1047#1084#1110#1089#1090' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      ImageIndex = 5
      object Label3: TLabel
        Left = 4
        Top = 168
        Width = 46
        Height = 13
        Caption = #1042#1080#1083#1091#1095#1080#1090#1080
      end
      object Label4: TLabel
        Left = 8
        Top = 192
        Width = 39
        Height = 13
        Caption = #1047' ('#1076#1072#1090#1072')'
      end
      object Label15: TLabel
        Left = 160
        Top = 192
        Width = 23
        Height = 13
        Caption = '('#1095#1072#1089')'
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 4
        Width = 617
        Height = 77
        Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1074
        TabOrder = 0
        object memVstanoviv: TMemo
          Left = 4
          Top = 16
          Width = 185
          Height = 21
          Lines.Strings = (
            'memVstanoviv')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object btnVstanoviv: TButton
        Left = 624
        Top = 8
        Width = 21
        Height = 73
        Action = aVstanovivUpdate
        TabOrder = 1
      end
      object GroupBox2: TGroupBox
        Left = 4
        Top = 84
        Width = 617
        Height = 77
        Caption = #1053#1077' '#1074#1110#1076#1087#1086#1074#1110#1076#1072#1102#1090#1100
        TabOrder = 2
        object memNeVidpovidajut: TMemo
          Left = 8
          Top = 12
          Width = 377
          Height = 17
          Lines.Strings = (
            'memNeVidpovidajut')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object btnNeVidpovidajut: TButton
        Left = 624
        Top = 88
        Width = 21
        Height = 73
        Action = aNeVidpovidajutChoice
        TabOrder = 3
      end
      object edtViluchiti: TEdit
        Left = 56
        Top = 168
        Width = 565
        Height = 21
        TabOrder = 4
        Text = 'edtViluchiti'
      end
      object btnViluchiti: TButton
        Left = 624
        Top = 168
        Width = 21
        Height = 21
        Action = aViluchitiUpdate
        TabOrder = 5
      end
      object dtpDataViluchenny: TDateTimePicker
        Left = 56
        Top = 192
        Width = 101
        Height = 21
        CalAlignment = dtaLeft
        Date = 40454.6007268056
        Time = 40454.6007268056
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 6
      end
      object edtChasViluchenny: TEdit
        Left = 188
        Top = 192
        Width = 121
        Height = 21
        TabOrder = 7
        Text = 'edtChasViluchenny'
      end
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 424
    Width = 653
    Height = 73
    Caption = #1054#1089#1086#1073#1072', '#1097#1086' '#1074#1080#1085#1077#1089#1083#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
    TabOrder = 12
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 13
      Caption = #1055#1086#1089#1072#1076#1072
    end
    object Label7: TLabel
      Left = 8
      Top = 44
      Width = 49
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077
    end
    object edtPosadaGDSL: TEdit
      Left = 56
      Top = 16
      Width = 569
      Height = 21
      TabOrder = 0
      Text = 'edtPosadaGDSL'
    end
    object edtPIBGDSL: TEdit
      Left = 64
      Top = 44
      Width = 561
      Height = 21
      TabOrder = 1
      Text = 'edtPIBGDSL'
    end
    object btnGDSL: TButton
      Left = 628
      Top = 16
      Width = 21
      Height = 49
      Action = aPIB_Posada_GDSL
      TabOrder = 2
    end
  end
  object alViluchennyZRealizaciiEdit: TActionList
    Left = 428
    Top = 28
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aNomerPostanoviUpdate: TAction
      Caption = '...'
      OnExecute = aNomerPostanoviUpdateExecute
    end
    object aAkt_Dovidka_Update: TAction
      Caption = 'aAkt_Dovidka_Update'
      OnExecute = aAkt_Dovidka_UpdateExecute
    end
    object aVidomchaPidporydkovanistChoice: TAction
      Caption = '...'
      OnExecute = aVidomchaPidporydkovanistChoiceExecute
    end
    object aVidomostiProObjektChoice: TAction
      Caption = '...'
      OnExecute = aVidomostiProObjektChoiceExecute
    end
    object aVstanovivUpdate: TAction
      Caption = '...'
      OnExecute = aVstanovivUpdateExecute
    end
    object aNeVidpovidajutChoice: TAction
      Caption = '...'
      OnExecute = aNeVidpovidajutChoiceExecute
    end
    object aViluchitiUpdate: TAction
      Caption = '...'
      OnExecute = aViluchitiUpdateExecute
    end
    object aOsobaSES_Update: TAction
      Caption = '@'
      OnExecute = aOsobaSES_UpdateExecute
    end
    object aOsobaSES_Choice: TAction
      Caption = '...'
      OnExecute = aOsobaSES_ChoiceExecute
    end
    object aOsobaSES_Change: TAction
      Caption = 'aOsobaSES_Change'
      OnExecute = aOsobaSES_ChangeExecute
    end
    object aViddilSES_Udpate: TAction
      Caption = '@'
      OnExecute = aViddilSES_UdpateExecute
    end
    object aViddilSES_Choice: TAction
      Caption = '...'
      OnExecute = aViddilSES_ChoiceExecute
    end
    object aPosadaSES_Update: TAction
      Caption = '@'
      OnExecute = aPosadaSES_UpdateExecute
    end
    object aPosadaSES_Choice: TAction
      Caption = '...'
      OnExecute = aPosadaSES_ChoiceExecute
    end
    object aTipProdukcii_Update: TAction
      Caption = '@'
      OnExecute = aTipProdukcii_UpdateExecute
    end
    object aTipProdukcii_Choice: TAction
      Caption = '...'
      OnExecute = aTipProdukcii_ChoiceExecute
    end
    object aRozdil_T23_F18_Update: TAction
      Caption = '@'
      OnExecute = aRozdil_T23_F18_UpdateExecute
    end
    object aRozdil_T23_F18_Choice: TAction
      Caption = '...'
      OnExecute = aRozdil_T23_F18_ChoiceExecute
    end
    object aTipPostanovi_Update: TAction
      Caption = '@'
      OnExecute = aTipPostanovi_UpdateExecute
    end
    object aTipPostanovi_Choice: TAction
      Caption = '...'
      OnExecute = aTipPostanovi_ChoiceExecute
    end
    object aYearUpdate: TAction
      Caption = '...'
      OnExecute = aYearUpdateExecute
    end
    object aAddViluchenny: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddViluchennyExecute
    end
    object aEditViluchenny: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditViluchennyExecute
    end
    object aDeleteViluchenny: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteViluchennyExecute
    end
    object aUpdateViluchenny: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateViluchennyExecute
    end
    object aVstanoviv_Update: TAction
      Caption = 'aVstanoviv_Update'
      OnExecute = aVstanoviv_UpdateExecute
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
    object aPIB_Posada_GDSL: TAction
      Caption = '...'
      OnExecute = aPIB_Posada_GDSLExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
  end
  object qRecordID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 480
    Top = 28
  end
  object dsVidomostiProViluchenny: TDataSource
    DataSet = qVidomostiProViluchenny
    Left = 592
    Top = 104
  end
  object qVidomostiProViluchenny: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 620
    Top = 104
  end
  object dsLaboratornijKontrol: TDataSource
    DataSet = qLaboratornijKontrol
    Left = 516
    Top = 104
  end
  object qLaboratornijKontrol: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 544
    Top = 104
  end
end
