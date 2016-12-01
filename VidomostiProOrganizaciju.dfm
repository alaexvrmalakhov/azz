object frmVidomostiProOrganizaciju: TfrmVidomostiProOrganizaciju
  Left = 211
  Top = 112
  Width = 551
  Height = 461
  Caption = 'frmVidomostiProOrganizaciju'
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
  object Label2: TLabel
    Left = 12
    Top = 108
    Width = 31
    Height = 13
    Caption = #1056#1072#1081#1086#1085
  end
  object Label16: TLabel
    Left = 12
    Top = 44
    Width = 65
    Height = 13
    Caption = #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
  end
  object Label17: TLabel
    Left = 12
    Top = 76
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object Label8: TLabel
    Left = 8
    Top = 12
    Width = 57
    Height = 13
    Caption = #1056#1110#1074#1077#1085#1100' '#1057#1045#1057
  end
  object btnVikonati: TButton
    Left = 187
    Top = 392
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 9
  end
  object btnVidminiti: TButton
    Left = 271
    Top = 392
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 10
  end
  object btnRajonUpdate: TButton
    Left = 488
    Top = 108
    Width = 21
    Height = 21
    Action = aDistrictUpdate
    TabOrder = 8
  end
  object btnMinistryUpdate: TButton
    Left = 488
    Top = 44
    Width = 21
    Height = 21
    Action = aMinistryUpdate
    TabOrder = 4
  end
  object btnTeritoryUpdate: TButton
    Left = 488
    Top = 76
    Width = 21
    Height = 21
    Action = aTeritoryUpdate
    TabOrder = 6
  end
  object cbMinistry: TComboBox
    Left = 84
    Top = 44
    Width = 401
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'cbMinistry'
    OnChange = aMinistryChangeExecute
  end
  object cbTeritory: TComboBox
    Left = 84
    Top = 76
    Width = 401
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbTeritory'
    OnChange = aTeritoryChangeExecute
  end
  object cbRajon: TComboBox
    Left = 84
    Top = 108
    Width = 401
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbRajon'
  end
  object pcVidomostiProOrganizaciju: TPageControl
    Left = 8
    Top = 140
    Width = 525
    Height = 241
    ActivePage = tsDirector
    TabIndex = 0
    TabOrder = 11
    object tsDirector: TTabSheet
      Caption = #1050#1077#1088#1110#1074#1085#1080#1082
      object Label7: TLabel
        Left = 4
        Top = 192
        Width = 72
        Height = 13
        Caption = #1050#1086#1076' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
      end
      object rgKerivnik: TRadioGroup
        Left = 4
        Top = 4
        Width = 509
        Height = 33
        Columns = 3
        Items.Strings = (
          #1043#1086#1083#1086#1074#1085#1080#1081' '#1083#1110#1082#1072#1088
          #1047#1072#1089#1090#1091#1087#1085#1080#1082
          #1042#1080#1082#1086#1085#1091#1102#1095#1080#1081' '#1086#1073#1086#1074#39#1103#1079#1082#1080)
        TabOrder = 0
        OnClick = rgKerivnikClick
      end
      object pcPadezh: TPageControl
        Left = 4
        Top = 44
        Width = 485
        Height = 145
        ActivePage = tsNazivnij
        TabIndex = 0
        TabOrder = 1
        object tsNazivnij: TTabSheet
          Caption = #1053#1072#1079#1080#1074#1085#1080#1081
          object Label18: TLabel
            Left = 4
            Top = 4
            Width = 77
            Height = 13
            Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label19: TLabel
            Left = 4
            Top = 28
            Width = 91
            Height = 13
            Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label20: TLabel
            Left = 4
            Top = 52
            Width = 75
            Height = 13
            Caption = #1055#1110#1076#1087#1080#1089' '#1091' '#1079#1074#1110#1090#1072#1093
          end
          object edtPIBKerivnika_NV: TEdit
            Tag = 1
            Left = 100
            Top = 4
            Width = 373
            Height = 21
            TabOrder = 0
            Text = 'edtPIBKerivnika_NV'
          end
          object edtPosadaKerivnika_NV: TEdit
            Tag = 2
            Left = 100
            Top = 28
            Width = 373
            Height = 21
            TabOrder = 1
            Text = 'edtPosadaKerivnika_NV'
          end
          object edtPidpis1_NV: TEdit
            Tag = 3
            Left = 4
            Top = 68
            Width = 469
            Height = 21
            TabOrder = 2
            Text = 'edtPidpis1_NV'
          end
          object edtPidpis2_NV: TEdit
            Tag = 4
            Left = 4
            Top = 92
            Width = 469
            Height = 21
            TabOrder = 3
            Text = 'edtPidpis2_NV'
          end
        end
        object tsRodovij: TTabSheet
          Caption = #1056#1086#1076#1086#1074#1080#1081
          ImageIndex = 1
          object Label21: TLabel
            Left = 4
            Top = 4
            Width = 77
            Height = 13
            Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label22: TLabel
            Left = 4
            Top = 28
            Width = 91
            Height = 13
            Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label23: TLabel
            Left = 4
            Top = 52
            Width = 75
            Height = 13
            Caption = #1055#1110#1076#1087#1080#1089' '#1091' '#1079#1074#1110#1090#1072#1093
          end
          object edtPIBKerivnika_RV: TEdit
            Tag = 5
            Left = 100
            Top = 4
            Width = 373
            Height = 21
            TabOrder = 0
            Text = 'edtPIBKerivnika_NV'
          end
          object edtPosadaKerivnika_RV: TEdit
            Tag = 6
            Left = 100
            Top = 28
            Width = 373
            Height = 21
            TabOrder = 1
            Text = 'edtPosadaKerivnika_NV'
          end
          object edtPidpis1_RV: TEdit
            Tag = 7
            Left = 4
            Top = 68
            Width = 469
            Height = 21
            TabOrder = 2
            Text = 'edtPidpis1_NV'
          end
          object edtPidpis2_RV: TEdit
            Tag = 8
            Left = 4
            Top = 92
            Width = 469
            Height = 21
            TabOrder = 3
            Text = 'edtPidpis2_NV'
          end
        end
        object tsDavalnij: TTabSheet
          Caption = #1044#1072#1074#1072#1083#1100#1085#1080#1081
          ImageIndex = 2
          object Label24: TLabel
            Left = 4
            Top = 4
            Width = 77
            Height = 13
            Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label25: TLabel
            Left = 4
            Top = 28
            Width = 91
            Height = 13
            Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label26: TLabel
            Left = 4
            Top = 52
            Width = 75
            Height = 13
            Caption = #1055#1110#1076#1087#1080#1089' '#1091' '#1079#1074#1110#1090#1072#1093
          end
          object edtPIBKerivnika_DV: TEdit
            Tag = 9
            Left = 100
            Top = 4
            Width = 373
            Height = 21
            TabOrder = 0
            Text = 'edtPIBKerivnika_NV'
          end
          object edtPosadaKerivnika_DV: TEdit
            Tag = 10
            Left = 100
            Top = 28
            Width = 373
            Height = 21
            TabOrder = 1
            Text = 'edtPosadaKerivnika_NV'
          end
          object edtPidpis1_DV: TEdit
            Tag = 11
            Left = 4
            Top = 68
            Width = 469
            Height = 21
            TabOrder = 2
            Text = 'edtPidpis1_NV'
          end
          object edtPidpis2_DV: TEdit
            Tag = 12
            Left = 4
            Top = 92
            Width = 469
            Height = 21
            TabOrder = 3
            Text = 'edtPidpis2_NV'
          end
        end
        object tsZnahidnij: TTabSheet
          Caption = #1047#1085#1072#1093#1110#1076#1085#1080#1081
          ImageIndex = 3
          object Label27: TLabel
            Left = 4
            Top = 4
            Width = 77
            Height = 13
            Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label28: TLabel
            Left = 4
            Top = 28
            Width = 91
            Height = 13
            Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label29: TLabel
            Left = 4
            Top = 52
            Width = 75
            Height = 13
            Caption = #1055#1110#1076#1087#1080#1089' '#1091' '#1079#1074#1110#1090#1072#1093
          end
          object edtPIBKerivnika_ZV: TEdit
            Tag = 13
            Left = 100
            Top = 4
            Width = 373
            Height = 21
            TabOrder = 0
            Text = 'edtPIBKerivnika_NV'
          end
          object edtPosadaKerivnika_ZV: TEdit
            Tag = 14
            Left = 100
            Top = 28
            Width = 373
            Height = 21
            TabOrder = 1
            Text = 'edtPosadaKerivnika_NV'
          end
          object edtPidpis1_ZV: TEdit
            Tag = 15
            Left = 4
            Top = 68
            Width = 469
            Height = 21
            TabOrder = 2
            Text = 'edtPidpis1_NV'
          end
          object edtPidpis2_ZV: TEdit
            Tag = 16
            Left = 4
            Top = 92
            Width = 469
            Height = 21
            TabOrder = 3
            Text = 'edtPidpis2_NV'
          end
        end
        object tsOrudnij: TTabSheet
          Caption = #1054#1088#1091#1076#1085#1080#1081
          ImageIndex = 4
          object Label30: TLabel
            Left = 4
            Top = 4
            Width = 77
            Height = 13
            Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label31: TLabel
            Left = 4
            Top = 28
            Width = 91
            Height = 13
            Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label32: TLabel
            Left = 4
            Top = 52
            Width = 75
            Height = 13
            Caption = #1055#1110#1076#1087#1080#1089' '#1091' '#1079#1074#1110#1090#1072#1093
          end
          object edtPIBKerivnika_OV: TEdit
            Tag = 17
            Left = 100
            Top = 4
            Width = 373
            Height = 21
            TabOrder = 0
            Text = 'edtPIBKerivnika_NV'
          end
          object edtPosadaKerivnika_OV: TEdit
            Tag = 18
            Left = 100
            Top = 28
            Width = 373
            Height = 21
            TabOrder = 1
            Text = 'edtPosadaKerivnika_NV'
          end
          object edtPidpis1_OV: TEdit
            Tag = 19
            Left = 4
            Top = 68
            Width = 469
            Height = 21
            TabOrder = 2
            Text = 'edtPidpis1_NV'
          end
          object edtPidpis2_OV: TEdit
            Tag = 20
            Left = 4
            Top = 92
            Width = 469
            Height = 21
            TabOrder = 3
            Text = 'edtPidpis2_NV'
          end
        end
        object tsMiscevij: TTabSheet
          Caption = #1052#1110#1089#1094#1077#1074#1080#1081
          ImageIndex = 5
          object Label33: TLabel
            Left = 4
            Top = 4
            Width = 77
            Height = 13
            Caption = #1055'.'#1030'.'#1041'.'#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label34: TLabel
            Left = 4
            Top = 28
            Width = 91
            Height = 13
            Caption = #1055#1086#1089#1072#1076#1072' '#1082#1077#1088#1110#1074#1085#1080#1082#1072
          end
          object Label35: TLabel
            Left = 4
            Top = 52
            Width = 75
            Height = 13
            Caption = #1055#1110#1076#1087#1080#1089' '#1091' '#1079#1074#1110#1090#1072#1093
          end
          object edtPIBKerivnika_MV: TEdit
            Tag = 21
            Left = 100
            Top = 4
            Width = 373
            Height = 21
            TabOrder = 0
            Text = 'edtPIBKerivnika_NV'
          end
          object edtPosadaKerivnika_MV: TEdit
            Tag = 22
            Left = 100
            Top = 28
            Width = 373
            Height = 21
            TabOrder = 1
            Text = 'edtPosadaKerivnika_NV'
          end
          object edtPidpis1_MV: TEdit
            Tag = 23
            Left = 4
            Top = 68
            Width = 469
            Height = 21
            TabOrder = 2
            Text = 'edtPidpis1_NV'
          end
          object edtPidpis2_MV: TEdit
            Tag = 24
            Left = 4
            Top = 92
            Width = 469
            Height = 21
            TabOrder = 3
            Text = 'edtPidpis2_NV'
          end
        end
      end
      object btnVidminok: TButton
        Left = 492
        Top = 44
        Width = 21
        Height = 145
        Action = aVidminokChange
        TabOrder = 2
      end
      object edtKodKerivnika: TEdit
        Left = 84
        Top = 192
        Width = 429
        Height = 21
        TabOrder = 3
        Text = 'edtKodKerivnika'
      end
    end
    object tsFirm: TTabSheet
      Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
      ImageIndex = 1
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 37
        Height = 13
        Caption = #1040#1076#1088#1077#1089#1072
      end
      object Label36: TLabel
        Left = 4
        Top = 34
        Width = 45
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object Label37: TLabel
        Left = 288
        Top = 34
        Width = 29
        Height = 13
        Caption = #1060#1072#1082#1089
      end
      object Label38: TLabel
        Left = 4
        Top = 64
        Width = 29
        Height = 13
        Caption = 'E-Mail'
      end
      object Label39: TLabel
        Left = 4
        Top = 94
        Width = 33
        Height = 13
        Caption = 'WWW'
      end
      object Label40: TLabel
        Left = 4
        Top = 124
        Width = 65
        Height = 13
        Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
      end
      object Label41: TLabel
        Left = 4
        Top = 154
        Width = 32
        Height = 13
        Caption = #1053#1072#1079#1074#1072
      end
      object Label3: TLabel
        Left = 4
        Top = 184
        Width = 57
        Height = 13
        Caption = #1091' '#1088#1086#1076#1086#1074#1086#1084#1091
      end
      object edtAdresa: TEdit
        Tag = 25
        Left = 72
        Top = 4
        Width = 441
        Height = 21
        TabOrder = 0
        Text = 'edtAdresa'
      end
      object edtPhone: TEdit
        Tag = 26
        Left = 72
        Top = 34
        Width = 189
        Height = 21
        TabOrder = 1
        Text = 'edtPhone'
      end
      object edtFax: TEdit
        Tag = 27
        Left = 324
        Top = 34
        Width = 189
        Height = 21
        TabOrder = 2
        Text = 'edtFax'
      end
      object edtE_Mail: TEdit
        Tag = 28
        Left = 72
        Top = 64
        Width = 441
        Height = 21
        TabOrder = 3
        Text = 'edtE_Mail'
      end
      object edtWWW: TEdit
        Tag = 29
        Left = 72
        Top = 94
        Width = 441
        Height = 21
        TabOrder = 4
        Text = 'edtWWW'
      end
      object edtFullName: TEdit
        Tag = 30
        Left = 72
        Top = 124
        Width = 441
        Height = 21
        TabOrder = 5
        Text = 'edtFullName'
      end
      object edtName: TEdit
        Tag = 31
        Left = 72
        Top = 154
        Width = 441
        Height = 21
        TabOrder = 6
        Text = 'edtName'
      end
      object edtName_RV: TEdit
        Tag = 32
        Left = 72
        Top = 184
        Width = 441
        Height = 21
        TabOrder = 7
        Text = 'edtName_RV'
      end
    end
    object tsBank: TTabSheet
      Caption = #1041#1072#1085#1082
      ImageIndex = 2
      object Label4: TLabel
        Left = 4
        Top = 8
        Width = 120
        Height = 13
        Caption = #1056#1086#1079#1088#1072#1093#1091#1085#1082#1086#1074#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
      end
      object Label5: TLabel
        Left = 4
        Top = 44
        Width = 19
        Height = 13
        Caption = #1050#1086#1076
      end
      object Label6: TLabel
        Left = 4
        Top = 80
        Width = 25
        Height = 13
        Caption = #1041#1072#1085#1082
      end
      object Label13: TLabel
        Left = 4
        Top = 116
        Width = 28
        Height = 13
        Caption = #1052#1060#1054
      end
      object Label14: TLabel
        Left = 4
        Top = 152
        Width = 31
        Height = 13
        Caption = #1054#1050#1055#1054
      end
      object Label15: TLabel
        Left = 4
        Top = 188
        Width = 56
        Height = 13
        Caption = #1054#1076#1077#1088#1078#1091#1074#1072#1095
      end
      object edtRozrahunkovijRahunok: TEdit
        Tag = 33
        Left = 132
        Top = 8
        Width = 381
        Height = 21
        TabOrder = 0
        Text = 'edtRozrahunkovijRahunok'
      end
      object edtKod: TEdit
        Tag = 34
        Left = 64
        Top = 44
        Width = 449
        Height = 21
        TabOrder = 1
        Text = 'edtKod'
      end
      object edtBank: TEdit
        Tag = 35
        Left = 64
        Top = 80
        Width = 449
        Height = 21
        TabOrder = 2
        Text = 'edtBank'
      end
      object edtMFO: TEdit
        Tag = 36
        Left = 64
        Top = 116
        Width = 449
        Height = 21
        TabOrder = 3
        Text = 'edtMFO'
      end
      object edtOKPO: TEdit
        Tag = 37
        Left = 64
        Top = 152
        Width = 449
        Height = 21
        TabOrder = 4
        Text = 'edtOKPO'
      end
      object edtOderzhuvach: TEdit
        Tag = 38
        Left = 64
        Top = 188
        Width = 449
        Height = 21
        TabOrder = 5
        Text = 'edtOderzhuvach'
      end
    end
  end
  object btnMinistryChoice: TButton
    Left = 512
    Top = 44
    Width = 21
    Height = 21
    Action = aMinistryChoice
    TabOrder = 12
  end
  object btnTeritoryChoice: TButton
    Left = 512
    Top = 76
    Width = 21
    Height = 21
    Action = aTeritoryChoice
    TabOrder = 13
  end
  object btnRajonChoice: TButton
    Left = 512
    Top = 108
    Width = 21
    Height = 21
    Action = aDistrictChoice
    TabOrder = 14
  end
  object cbSESLevel: TComboBox
    Left = 84
    Top = 12
    Width = 401
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'cbSESLevel'
  end
  object btnSESLevel_Update: TButton
    Left = 488
    Top = 12
    Width = 21
    Height = 21
    Action = aSESLevel_Update
    TabOrder = 1
  end
  object btnSESLevel_Choice: TButton
    Left = 512
    Top = 12
    Width = 21
    Height = 21
    Action = aSESLevel_Choice
    TabOrder = 2
  end
  object dsTertory: TDataSource
    DataSet = qTeritory
    Left = 248
    Top = 136
  end
  object qTeritory: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 276
    Top = 136
  end
  object alVidomostriProOrganizaciju: TActionList
    Left = 372
    Top = 128
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
    object aMinistryUpdate: TAction
      Caption = '@'
      OnExecute = aMinistryUpdateExecute
    end
    object aMinistryChoice: TAction
      Caption = '...'
    end
    object aMinistryChange: TAction
      Caption = 'aMinistryChange'
      OnExecute = aMinistryChangeExecute
    end
    object aTeritoryUpdate: TAction
      Caption = '@'
      OnExecute = aTeritoryUpdateExecute
    end
    object aTeritoryChoice: TAction
      Caption = '...'
    end
    object aTeritoryChange: TAction
      Caption = 'aTeritoryChange'
      OnExecute = aTeritoryChangeExecute
    end
    object aDistrictUpdate: TAction
      Caption = '@'
      OnExecute = aDistrictUpdateExecute
    end
    object aDistrictChoice: TAction
      Caption = '...'
    end
    object aVidminokChange: TAction
      Caption = '...'
      OnExecute = aVidminokChangeExecute
    end
    object aSESLevel_Update: TAction
      Caption = '@'
      OnExecute = aSESLevel_UpdateExecute
    end
    object aSESLevel_Choice: TAction
      Caption = '...'
    end
  end
end
