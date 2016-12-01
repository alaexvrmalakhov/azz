object frmOdiniciVimiruEdit: TfrmOdiniciVimiruEdit
  Left = 545
  Top = 99
  Width = 601
  Height = 244
  Caption = 'frmOdiniciVimiruEdit'
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
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 65
    Height = 13
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 101
    Height = 26
    Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072#13#10#1091' '#1088#1086#1076#1086#1074#1086#1084#1091' '#1074#1110#1076#1084#1110#1085#1082#1091
  end
  object Label4: TLabel
    Left = 12
    Top = 112
    Width = 87
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
  end
  object Label5: TLabel
    Left = 12
    Top = 144
    Width = 47
    Height = 13
    Caption = #1052#1085#1086#1078#1085#1080#1082
  end
  object edtKod: TEdit
    Left = 44
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 168
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtPovnaNazva: TEdit
    Left = 84
    Top = 44
    Width = 473
    Height = 21
    TabOrder = 2
    Text = 'edtPovnaNazva'
    OnExit = aPovnaNazva_RVExecute
  end
  object edtPovanaNazvaRV: TEdit
    Left = 120
    Top = 76
    Width = 437
    Height = 21
    TabOrder = 3
    Text = 'edtPovanaNazvaRV'
  end
  object btnPovnaNazvaRV: TButton
    Left = 560
    Top = 44
    Width = 21
    Height = 53
    Action = aPovnaNazva_RV
    TabOrder = 4
  end
  object edtSkorochenaNazva: TEdit
    Left = 112
    Top = 112
    Width = 321
    Height = 21
    TabOrder = 5
    Text = 'edtSkorochenaNazva'
  end
  object edtMnozhnik: TEdit
    Left = 68
    Top = 144
    Width = 369
    Height = 21
    TabOrder = 6
    Text = 'edtMnozhnik'
  end
  object btnVikonati: TButton
    Left = 219
    Top = 176
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 7
  end
  object btnVidminiti: TButton
    Left = 299
    Top = 176
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 8
  end
  object rgVid: TRadioGroup
    Left = 440
    Top = 103
    Width = 141
    Height = 62
    Items.Strings = (
      #1042#1072#1075#1072
      #1054#1073#39#1108#1084
      #1050#1110#1083#1100#1082#1110#1089#1090#1100)
    TabOrder = 9
  end
  object alOdiniciVimiruEdit: TActionList
    Left = 388
    Top = 12
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aPovnaNazva_RV: TAction
      Caption = '...'
      OnExecute = aPovnaNazva_RVExecute
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
    Left = 448
    Top = 8
  end
end
