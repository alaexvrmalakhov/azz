object frmObjektiEdit: TfrmObjektiEdit
  Left = 1306
  Top = 44
  Width = 529
  Height = 547
  Caption = 'frmObjektiEdit'
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
    Top = 12
    Width = 59
    Height = 13
    Caption = #1050#1086#1076' '#1086#1073#39#1108#1082#1090#1072
  end
  object Label2: TLabel
    Left = 12
    Top = 108
    Width = 72
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1072
  end
  object Label16: TLabel
    Left = 12
    Top = 172
    Width = 77
    Height = 13
    Caption = #1040#1076#1088#1077#1089#1072' '#1086#1073#39#1108#1082#1090#1072
  end
  object Label6: TLabel
    Left = 12
    Top = 140
    Width = 136
    Height = 13
    Caption = #1042#1110#1076#1086#1084#1095#1072' '#1087#1110#1076#1087#1086#1088#1103#1076#1082#1086#1074#1072#1085#1110#1089#1090#1100
  end
  object Label3: TLabel
    Left = 8
    Top = 268
    Width = 120
    Height = 13
    Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
  end
  object Label4: TLabel
    Left = 8
    Top = 236
    Width = 54
    Height = 13
    Caption = #1050#1086#1076' '#1044#1050#1055#1055
  end
  object Label5: TLabel
    Left = 8
    Top = 204
    Width = 85
    Height = 13
    Caption = #1042#1110#1076#1076#1110#1083#1077#1085#1085#1103' '#1073#1072#1085#1082#1091
  end
  object Label7: TLabel
    Left = 244
    Top = 236
    Width = 50
    Height = 13
    Caption = #1050#1086#1076' '#1052#1060#1054
  end
  object Label8: TLabel
    Left = 12
    Top = 44
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object Label9: TLabel
    Left = 12
    Top = 76
    Width = 31
    Height = 13
    Caption = #1056#1072#1081#1086#1085
  end
  object edtKodObjekta: TEdit
    Left = 100
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodObjekta'
    OnChange = aUpdateExecute
  end
  object edtNazvaObjekta: TEdit
    Left = 100
    Top = 108
    Width = 405
    Height = 21
    ImeName = 'Russian'
    MaxLength = 100
    TabOrder = 6
    Text = 'edtNazvaObjekta'
  end
  object btnVikonati: TButton
    Left = 180
    Top = 472
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 15
  end
  object btnVidmina: TButton
    Left = 260
    Top = 472
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 16
  end
  object edtAdresaObjekta: TEdit
    Left = 100
    Top = 172
    Width = 405
    Height = 21
    ImeName = 'Russian'
    TabOrder = 9
    Text = 'edtAdresaObjekta'
  end
  object edtVidomchaPidporydkovanist: TEdit
    Left = 160
    Top = 140
    Width = 321
    Height = 21
    ImeName = 'Russian'
    TabOrder = 7
    Text = 'edtVidomchaPidporydkovanist'
  end
  object btnVidomchaPidporydkovanist: TButton
    Left = 484
    Top = 140
    Width = 21
    Height = 21
    Action = aVidomchaPidporydkovanistChange
    TabOrder = 8
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 300
    Width = 497
    Height = 161
    Caption = #1057#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1080' '#1086#1073#39#1108#1082#1090#1110#1074
    PopupMenu = PopupMenu
    TabOrder = 14
    object Panel1: TPanel
      Left = 420
      Top = 15
      Width = 75
      Height = 144
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      ParentBackground = True
      TabOrder = 0
      object btnDodati: TButton
        Left = 0
        Top = 0
        Width = 75
        Height = 25
        Action = aAdd
        TabOrder = 0
      end
      object btnZminiti: TButton
        Left = 0
        Top = 28
        Width = 75
        Height = 25
        Action = aEdit
        TabOrder = 1
      end
      object btnVidaliti: TButton
        Left = 0
        Top = 56
        Width = 75
        Height = 25
        Action = aDelete
        TabOrder = 2
      end
      object btnPerepraviti: TButton
        Left = 0
        Top = 84
        Width = 75
        Height = 25
        Action = aMove
        Enabled = False
        TabOrder = 3
      end
      object btnUpdate: TButton
        Left = 0
        Top = 112
        Width = 75
        Height = 25
        Action = aUpdate
        TabOrder = 4
      end
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 16
      Width = 320
      Height = 77
      DataSource = dsSpivrobitniki
      ImeName = 'Russian'
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object edtViddilennyBanku: TEdit
    Left = 100
    Top = 204
    Width = 405
    Height = 21
    ImeName = 'Russian'
    TabOrder = 10
    Text = 'edtViddilennyBanku'
  end
  object edtKod_DKPP: TEdit
    Left = 100
    Top = 236
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 11
    Text = 'edtKod_DKPP'
  end
  object edtKod_MFO: TEdit
    Left = 304
    Top = 236
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 12
    Text = 'edtKod_MFO'
  end
  object edtRozrahunkovijRahunok: TEdit
    Left = 136
    Top = 268
    Width = 369
    Height = 21
    ImeName = 'Russian'
    TabOrder = 13
    Text = 'edtRozrahunkovijRahunok'
  end
  object btnKodObjekta: TButton
    Left = 224
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object cbTeritory: TComboBox
    Left = 84
    Top = 44
    Width = 397
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbTeritory'
    OnChange = aTeritoryChangeExecute
  end
  object btnTeritory: TButton
    Left = 484
    Top = 44
    Width = 21
    Height = 21
    Action = aTeritoryUpdate
    TabOrder = 3
  end
  object cbDistrict: TComboBox
    Left = 84
    Top = 76
    Width = 397
    Height = 21
    ImeName = 'Russian'
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbDistrict'
  end
  object btnDistrict: TButton
    Left = 484
    Top = 76
    Width = 21
    Height = 21
    Action = aDistrictUpdate
    TabOrder = 5
  end
  object alObjektiEdit: TActionList
    Left = 336
    Top = 4
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 13
      OnExecute = aOKExecute
    end
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aTeritoryUpdate: TAction
      Caption = '@'
      OnExecute = aTeritoryUpdateExecute
    end
    object aTeritoryChange: TAction
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aDistrictUpdate: TAction
      Caption = '@'
      OnExecute = aDistrictUpdateExecute
    end
    object aVidomchaPidporydkovanistChange: TAction
      Caption = '...'
      OnExecute = aVidomchaPidporydkovanistChangeExecute
    end
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteExecute
    end
    object aMove: TAction
      Caption = #1055#1077#1088#1077#1087#1088#1072#1074#1080#1090#1080
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 344
    Top = 344
    object mnAdd: TMenuItem
      Action = aAdd
    end
    object mnEdit: TMenuItem
      Action = aEdit
    end
    object mnDelete: TMenuItem
      Action = aDelete
    end
    object mnMove: TMenuItem
      Action = aMove
    end
    object mnUpdate: TMenuItem
      Action = aUpdate
    end
  end
  object dsSpivrobitniki: TDataSource
    DataSet = qSpivrobitniki
    Left = 112
    Top = 400
  end
  object qSpivrobitniki: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 144
    Top = 400
  end
  object qTemp: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 392
    Top = 12
  end
end
