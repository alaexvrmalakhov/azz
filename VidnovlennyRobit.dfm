object frmVidnovlennyRobit: TfrmVidnovlennyRobit
  Left = 548
  Top = 113
  Width = 555
  Height = 450
  Caption = 'frmVidnovlennyRobit'
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
  object Label7: TLabel
    Left = 8
    Top = 36
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label8: TLabel
    Left = 180
    Top = 36
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label9: TLabel
    Left = 372
    Top = 36
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object btnVikonati: TButton
    Left = 173
    Top = 384
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 253
    Top = 384
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object edtNomerPostanovi: TEdit
    Left = 80
    Top = 36
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 272
    Top = 36
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 40443.7086391319
    Time = 40443.7086391319
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtRecord_ID: TEdit
    Left = 428
    Top = 36
    Width = 85
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtRecord_ID'
  end
  object pcVidnovlennyRobit: TPageControl
    Left = 8
    Top = 64
    Width = 529
    Height = 313
    ActivePage = tsOne
    TabIndex = 0
    TabOrder = 5
    object tsOne: TTabSheet
      Caption = 'I'
      object Label31: TLabel
        Left = 8
        Top = 8
        Width = 113
        Height = 13
        Caption = #1082#1080#1084' '#1087#1088#1080#1081#1085#1103#1090#1077' '#1088#1110#1096#1077#1085#1085#1103
      end
      object Label1: TLabel
        Left = 8
        Top = 260
        Width = 53
        Height = 13
        Caption = #1044#1086#1079#1074#1086#1083#1103#1102
      end
      object Label10: TLabel
        Left = 12
        Top = 176
        Width = 75
        Height = 13
        Caption = #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
        Enabled = False
      end
      object Label11: TLabel
        Left = 12
        Top = 204
        Width = 71
        Height = 13
        Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091
        Enabled = False
      end
      object Label12: TLabel
        Left = 12
        Top = 232
        Width = 136
        Height = 13
        Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
        Enabled = False
      end
      object edtNazvaPostanovi: TEdit
        Left = 72
        Top = 260
        Width = 421
        Height = 21
        TabOrder = 0
        Text = 'edtNazvaPostanovi'
      end
      object btnNazvaPostanovi: TButton
        Left = 496
        Top = 260
        Width = 21
        Height = 21
        Action = aNazvaPostanoviUpdate
        TabOrder = 1
      end
      object gbKogoPovidomleno: TGroupBox
        Left = 8
        Top = 36
        Width = 509
        Height = 133
        Caption = #1050#1086#1075#1086' '#1087#1086#1074#1110#1076#1086#1084#1083#1077#1085#1086
        TabOrder = 2
        object Panel3: TPanel
          Left = 432
          Top = 15
          Width = 75
          Height = 116
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object btnKogoPovidomlenoAdd: TButton
            Left = 0
            Top = 4
            Width = 75
            Height = 25
            Action = aKogoPovidomlenoAdd
            TabOrder = 0
          end
          object btnKogoPovidomlenoEdit: TButton
            Left = 0
            Top = 32
            Width = 75
            Height = 25
            Action = aKogoPovidomlenoEdit
            TabOrder = 1
          end
          object btnKogoPovidomlenoDelete: TButton
            Left = 0
            Top = 60
            Width = 75
            Height = 25
            Action = aKogoPovidomlenoDelete
            TabOrder = 2
          end
          object btnKogoPovidomlenoUpdate: TButton
            Left = 0
            Top = 88
            Width = 75
            Height = 25
            Action = aKogoPovidomlenoUpdate
            TabOrder = 3
          end
        end
        object DBGrid1: TDBGrid
          Left = 8
          Top = 16
          Width = 320
          Height = 72
          DataSource = dsNapravlenoDoVidoma
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
              FieldName = 'PIB'
              Title.Caption = #1055'.'#1030'.'#1041'.'
              Width = 181
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POSADA'
              Title.Caption = #1055#1086#1089#1072#1076#1072
              Width = 212
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NAPRAVLENNY'
              Title.Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1103
              Width = 99
              Visible = True
            end>
        end
      end
      object cbKimPrijnyteRishenny: TComboBox
        Left = 128
        Top = 8
        Width = 341
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'cbKimPrijnyteRishenny'
      end
      object btnKimPrijnyteRishenny_Update: TButton
        Left = 472
        Top = 8
        Width = 21
        Height = 21
        Action = aKimPrijnyteRishenny_Update
        TabOrder = 4
      end
      object btnKimPrijnyteRishenny_Choice: TButton
        Left = 496
        Top = 8
        Width = 21
        Height = 21
        Action = aKimPrijnyteRishenny_Choice
        TabOrder = 5
      end
      object edtVidPostanovi: TEdit
        Left = 96
        Top = 176
        Width = 421
        Height = 21
        Enabled = False
        TabOrder = 6
        Text = 'edtVidPostanovi'
      end
      object edtNazvaObjektu: TEdit
        Left = 96
        Top = 204
        Width = 421
        Height = 21
        Enabled = False
        TabOrder = 7
        Text = 'edtNazvaObjektu'
      end
      object edtVidomchaPidporydkovanist: TEdit
        Left = 152
        Top = 232
        Width = 365
        Height = 21
        Enabled = False
        TabOrder = 8
        Text = 'edtVidomchaPidporydkovanist'
      end
    end
    object tsTwo: TTabSheet
      Caption = 'II'
      ImageIndex = 1
      object Label13: TLabel
        Left = 8
        Top = 8
        Width = 89
        Height = 13
        Caption = #8470' '#1072#1082#1090#1091' '#1087#1077#1088#1077#1074#1110#1088#1082#1080
      end
      object Label14: TLabel
        Left = 260
        Top = 8
        Width = 104
        Height = 13
        Caption = #1044#1072#1090#1072' '#1072#1082#1090#1091' '#1087#1077#1088#1077#1074#1110#1088#1082#1080
      end
      object Label5: TLabel
        Left = 8
        Top = 168
        Width = 208
        Height = 13
        Caption = #1055#1110#1076#1089#1090#1072#1074#1072' '#1097#1086#1076#1086' '#1087#1088#1080#1087#1080#1085#1077#1085#1085#1103' '#1076#1110#1111' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
      end
      object Label3: TLabel
        Left = 8
        Top = 236
        Width = 56
        Height = 13
        Caption = #1079' '#1103#1082#1086#1111' '#1076#1072#1090#1080
      end
      object Label6: TLabel
        Left = 8
        Top = 260
        Width = 58
        Height = 13
        Caption = #1044#1072#1090#1072' '#1083#1080#1089#1090#1072
      end
      object Label2: TLabel
        Left = 164
        Top = 260
        Width = 43
        Height = 13
        Caption = #8470' '#1083#1080#1089#1090#1072
      end
      object edtNomerAktuPerevirki: TEdit
        Left = 104
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'edtNomerAktuPerevirki'
      end
      object dtpDataAktuPerevirki: TDateTimePicker
        Left = 372
        Top = 8
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 40444.5264445833
        Time = 40444.5264445833
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object gbLaboratornijKontrol: TGroupBox
        Left = 8
        Top = 32
        Width = 509
        Height = 133
        Caption = #1055#1086#1074#1090#1086#1088#1085#1080#1081' '#1083#1072#1073#1086#1088#1072#1090#1086#1088#1085#1080#1081' '#1082#1086#1085#1090#1088#1086#1083#1100
        TabOrder = 2
        object DBGrid2: TDBGrid
          Left = 8
          Top = 20
          Width = 325
          Height = 69
          DataSource = dsLaboratornijKontrol
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
              FieldName = 'VIDKONTROLU'
              Title.Caption = #1042#1080#1076' '#1082#1086#1085#1090#1088#1086#1083#1102
              Width = 283
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMERIPROB'
              Title.Caption = #8470#8470' '#1087#1088#1086#1073
              Width = 294
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAKONTROLU'
              Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085#1090#1088#1086#1083#1102
              Width = 103
              Visible = True
            end>
        end
        object Panel2: TPanel
          Left = 432
          Top = 15
          Width = 75
          Height = 116
          Align = alRight
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object btnLaboratornijKontrolAdd: TButton
            Left = 0
            Top = 4
            Width = 75
            Height = 25
            Action = aLaboratornijKontrolAdd
            TabOrder = 0
          end
          object btnLaboratornijKontrolEdit: TButton
            Left = 0
            Top = 32
            Width = 75
            Height = 25
            Action = aLaboratornijKontrolEdit
            TabOrder = 1
          end
          object btnLaboratornijKontrolDelete: TButton
            Left = 0
            Top = 60
            Width = 75
            Height = 25
            Action = aLaboratornijKontrolDelete
            TabOrder = 2
          end
          object btnLaboratornijKontrolupdate: TButton
            Left = 0
            Top = 88
            Width = 75
            Height = 25
            Action = aLaboratornijKontrolUpdate
            TabOrder = 3
          end
        end
      end
      object memPidstava: TRichEdit
        Left = 8
        Top = 184
        Width = 489
        Height = 49
        Lines.Strings = (
          'memPidstava')
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object btnPidstava: TButton
        Left = 496
        Top = 184
        Width = 21
        Height = 49
        Action = aPidstavaUpdate
        TabOrder = 4
      end
      object dtpDataVidnovlennyRobit: TDateTimePicker
        Left = 68
        Top = 236
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 40445.4784355093
        Time = 40445.4784355093
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 5
      end
      object edtDataVidnovlennyPrimitka: TEdit
        Left = 156
        Top = 236
        Width = 361
        Height = 21
        TabOrder = 6
        Text = 'edtDataVidnovlennyPrimitka'
      end
      object dtpDataLista: TDateTimePicker
        Left = 72
        Top = 260
        Width = 85
        Height = 21
        CalAlignment = dtaLeft
        Date = 40445.489475
        Time = 40445.489475
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 7
      end
      object edtNomerLista: TEdit
        Left = 212
        Top = 260
        Width = 121
        Height = 21
        TabOrder = 8
        Text = 'edtNomerLista'
      end
    end
  end
  object cbMinistry: TComboBox
    Left = 8
    Top = 8
    Width = 173
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 184
    Top = 8
    Width = 173
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 360
    Top = 8
    Width = 177
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'cbDistrict'
  end
  object alVidnovlennyRobit: TActionList
    Left = 360
    Top = 368
    object aKimPrijnyteRishenny_Update: TAction
      Caption = '@'
      OnExecute = aKimPrijnyteRishenny_UpdateExecute
    end
    object aKimPrijnyteRishenny_Choice: TAction
      Caption = '...'
      OnExecute = aKimPrijnyteRishenny_ChoiceExecute
    end
    object aKogoPovidomlenoAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aKogoPovidomlenoAddExecute
    end
    object aKogoPovidomlenoEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aKogoPovidomlenoEditExecute
    end
    object aKogoPovidomlenoDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aKogoPovidomlenoDeleteExecute
    end
    object aKogoPovidomlenoUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aKogoPovidomlenoUpdateExecute
    end
    object aNazvaPostanoviUpdate: TAction
      Caption = '...'
      OnExecute = aNazvaPostanoviUpdateExecute
    end
    object aLaboratornijKontrolAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aLaboratornijKontrolAddExecute
    end
    object aLaboratornijKontrolEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aLaboratornijKontrolEditExecute
    end
    object aLaboratornijKontrolDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aLaboratornijKontrolDeleteExecute
    end
    object aLaboratornijKontrolUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aLaboratornijKontrolUpdateExecute
    end
    object aPidstavaUpdate: TAction
      Caption = '...'
      OnExecute = aPidstavaUpdateExecute
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
  object qComboBoxes: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 368
  end
  object dsNapravlenoDoVidoma: TDataSource
    DataSet = qNapravlenoDoVidoma
    Left = 84
    Top = 368
  end
  object qNapravlenoDoVidoma: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 112
    Top = 368
  end
  object dsLaboratornijKontrol: TDataSource
    DataSet = qLaboratornijKontrol
    Left = 448
    Top = 368
  end
  object qLaboratornijKontrol: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 476
    Top = 368
  end
end
