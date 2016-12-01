object frmVidPostanoviSetting: TfrmVidPostanoviSetting
  Left = 968
  Top = 474
  Width = 346
  Height = 266
  Caption = 'frmVidPostanoviSetting'
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
    Top = 44
    Width = 101
    Height = 13
    Caption = #1050#1086#1076' '#1074#1080#1076#1091' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 75
    Height = 13
    Caption = #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label3: TLabel
    Left = 12
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object edtKodViduPostanovi: TEdit
    Left = 124
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKodViduPostanovi'
  end
  object edtVidPostanovi: TEdit
    Left = 124
    Top = 76
    Width = 201
    Height = 21
    TabOrder = 1
    Text = 'edtVidPostanovi'
  end
  object cbNajmenuvannyTovaru: TCheckBox
    Left = 12
    Top = 108
    Width = 145
    Height = 17
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1091
    TabOrder = 2
  end
  object cbKilkist: TCheckBox
    Left = 180
    Top = 108
    Width = 145
    Height = 17
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
    TabOrder = 3
  end
  object cbVagaOdinici: TCheckBox
    Left = 12
    Top = 136
    Width = 145
    Height = 17
    Caption = #1042#1072#1075#1072' '#1086#1076#1080#1085#1080#1094#1110
    TabOrder = 4
  end
  object cbZagalnaVaga: TCheckBox
    Left = 180
    Top = 136
    Width = 145
    Height = 17
    Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1075#1072
    TabOrder = 5
  end
  object cbOtrimanogo: TCheckBox
    Left = 12
    Top = 164
    Width = 149
    Height = 17
    Caption = #1054#1090#1088#1080#1084#1072#1085#1086#1075#1086
    TabOrder = 6
  end
  object btnVikonati: TButton
    Left = 91
    Top = 196
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 7
  end
  object btnVidminiti: TButton
    Left = 171
    Top = 196
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 8
  end
  object edtRecord_ID: TEdit
    Left = 72
    Top = 12
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
    Text = 'edtRecord_ID'
  end
  object alVidPostanovSettings: TActionList
    Left = 252
    Top = 12
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
  end
end
