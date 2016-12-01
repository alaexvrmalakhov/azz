object frmPovidomlenny: TfrmPovidomlenny
  Left = 371
  Top = 25
  Width = 640
  Height = 384
  Caption = 'frmPovidomlenny'
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
    Top = 108
    Width = 66
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1083#1080#1089#1090#1072
  end
  object Label2: TLabel
    Left = 308
    Top = 108
    Width = 58
    Height = 13
    Caption = #1044#1072#1090#1072' '#1083#1080#1089#1090#1072
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 100
    Height = 13
    Caption = #8470' '#1072#1082#1090#1091' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103
    Enabled = False
  end
  object Label4: TLabel
    Left = 252
    Top = 76
    Width = 115
    Height = 13
    Caption = #1044#1072#1090#1072' '#1072#1082#1090#1091' '#1086#1073#1089#1090#1077#1078#1077#1085#1085#1103
    Enabled = False
  end
  object Label9: TLabel
    Left = 12
    Top = 44
    Width = 90
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label10: TLabel
    Left = 284
    Top = 44
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label5: TLabel
    Left = 12
    Top = 140
    Width = 88
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label6: TLabel
    Left = 472
    Top = 44
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 172
    Width = 609
    Height = 133
    Caption = #1050#1086#1084#1091' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1086
    TabOrder = 9
    object Panel2: TPanel
      Left = 532
      Top = 15
      Width = 75
      Height = 116
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object btnDoVidomaAdd: TButton
        Left = 0
        Top = 4
        Width = 75
        Height = 25
        Action = aKomuNapravlenoAdd
        TabOrder = 0
      end
      object btnDoVidomaEdit: TButton
        Left = 0
        Top = 32
        Width = 75
        Height = 25
        Action = aKomuNapravlenoEdit
        TabOrder = 1
      end
      object btnDoVidomaDelete: TButton
        Left = 0
        Top = 60
        Width = 75
        Height = 25
        Action = aKomuNapravlenoDelete
        TabOrder = 2
      end
      object btnDoVidomaUpdate: TButton
        Left = 0
        Top = 88
        Width = 75
        Height = 25
        Action = aKomuNapravlenoUpdate
        TabOrder = 3
      end
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 15
      Width = 530
      Height = 116
      Align = alClient
      DataSource = dsPovidomlenny
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'PIB'
          Title.Caption = #1055'.'#1030'.'#1041'. '#1086#1090#1088#1080#1084#1091#1074#1072#1095#1072
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POSADA'
          Title.Caption = #1055#1086#1089#1072#1076#1072' '#1086#1090#1088#1080#1084#1091#1074#1072#1095#1072
          Width = 264
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_NAPRAVLENNY'
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1103
          Width = 101
          Visible = True
        end>
    end
  end
  object edtNomerLista: TEdit
    Left = 92
    Top = 108
    Width = 125
    Height = 21
    TabOrder = 5
    Text = 'edtNomerLista'
  end
  object dtpDataLista: TDateTimePicker
    Left = 372
    Top = 108
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 39499.0426540741
    Time = 39499.0426540741
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 6
  end
  object edtNomerAktu: TEdit
    Left = 116
    Top = 76
    Width = 101
    Height = 21
    Enabled = False
    TabOrder = 3
    Text = 'edtNomerAktu'
  end
  object dtpDataAktu: TDateTimePicker
    Left = 372
    Top = 76
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 39499.0446940046
    Time = 39499.0446940046
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
  end
  object edtNomerPostanovi: TEdit
    Left = 108
    Top = 44
    Width = 109
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 372
    Top = 44
    Width = 89
    Height = 21
    CalAlignment = dtaLeft
    Date = 39499.0480732755
    Time = 39499.0480732755
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object btnVikonati: TButton
    Left = 238
    Top = 316
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 10
  end
  object btnVidmina: TButton
    Left = 318
    Top = 316
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 11
  end
  object edtNazvaPostanovi: TEdit
    Left = 104
    Top = 140
    Width = 493
    Height = 21
    TabOrder = 7
    Text = 'edtNazvaPostanovi'
  end
  object btnNazvaPostanovi: TButton
    Left = 600
    Top = 140
    Width = 21
    Height = 21
    Action = aNazvaPostanoviUpdate
    TabOrder = 8
  end
  object edtKod: TEdit
    Left = 500
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtKod'
  end
  object cbMinistry: TComboBox
    Left = 12
    Top = 12
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 216
    Top = 12
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 13
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 420
    Top = 12
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 14
    Text = 'cbDistrict'
  end
  object dsPovidomlenny: TDataSource
    DataSet = qPovidomlenny
    Left = 480
    Top = 76
  end
  object qPovidomlenny: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 516
    Top = 76
  end
  object alPovidomlenny: TActionList
    Left = 232
    Top = 48
    object aNazvaPostanoviUpdate: TAction
      Caption = '...'
      OnExecute = aNazvaPostanoviUpdateExecute
    end
    object aKomuNapravlenoAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aKomuNapravlenoAddExecute
    end
    object aKomuNapravlenoEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aKomuNapravlenoEditExecute
    end
    object aKomuNapravlenoDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aKomuNapravlenoDeleteExecute
    end
    object aKomuNapravlenoUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aKomuNapravlenoUpdateExecute
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
  object qRecord_ID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 232
    Top = 100
  end
end
