object frmNalashnuvannySistemi: TfrmNalashnuvannySistemi
  Left = 593
  Top = -12
  Width = 549
  Height = 463
  Caption = 'frmNalashnuvannySistemi'
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
    Top = 248
    Width = 89
    Height = 13
    Caption = #1043#1088#1086#1096#1086#1074#1072' '#1086#1076#1080#1085#1080#1094#1103
  end
  object Label2: TLabel
    Left = 12
    Top = 184
    Width = 89
    Height = 13
    Caption = #1058#1080#1084#1095#1072#1089#1086#1074#1072' '#1087#1072#1087#1082#1072
  end
  object Label3: TLabel
    Left = 12
    Top = 216
    Width = 65
    Height = 13
    Caption = #1055#1086#1090#1086#1095#1085#1080#1081' '#1088#1110#1082
  end
  object edtGroshovaOdinicy: TEdit
    Left = 120
    Top = 248
    Width = 409
    Height = 21
    MaxLength = 250
    TabOrder = 6
    Text = 'edtGroshovaOdinicy'
  end
  object btnVikonati: TButton
    Left = 193
    Top = 396
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 9
  end
  object btnVidminiti: TButton
    Left = 273
    Top = 396
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 10
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 12
    Width = 517
    Height = 77
    Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 20
      Width = 58
      Height = 13
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 38
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object edtUserName: TEdit
      Left = 76
      Top = 20
      Width = 433
      Height = 21
      TabOrder = 0
      Text = 'edtUserName'
    end
    object edtPassword: TEdit
      Left = 76
      Top = 48
      Width = 433
      Height = 21
      TabOrder = 1
      Text = 'edtPassword'
    end
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 96
    Width = 517
    Height = 77
    Caption = #1041#1072#1079#1072' '#1076#1072#1085#1080#1093
    TabOrder = 1
    object Label8: TLabel
      Left = 8
      Top = 20
      Width = 37
      Height = 13
      Caption = #1057#1077#1088#1074#1077#1088
    end
    object Label9: TLabel
      Left = 8
      Top = 48
      Width = 57
      Height = 13
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1080#1093
    end
    object edtServerName: TEdit
      Left = 76
      Top = 20
      Width = 433
      Height = 21
      TabOrder = 0
      Text = 'edtServerName'
    end
    object edtAliasName: TEdit
      Left = 76
      Top = 48
      Width = 433
      Height = 21
      TabOrder = 1
      Text = 'edtAliasName'
    end
  end
  object edtTemporary: TEdit
    Left = 120
    Top = 184
    Width = 385
    Height = 21
    TabOrder = 2
    Text = 'edtTemporary'
  end
  object btnTemporary: TButton
    Left = 508
    Top = 184
    Width = 21
    Height = 21
    Action = aTemporary
    TabOrder = 3
  end
  object edtRik: TEdit
    Left = 120
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '2000'
  end
  object udRik: TUpDown
    Left = 241
    Top = 216
    Width = 16
    Height = 21
    Associate = edtRik
    Min = 2000
    Max = 2999
    Position = 2000
    TabOrder = 5
    Thousands = False
    Wrap = False
  end
  object cbxUpdateUserWrites: TCheckBox
    Left = 12
    Top = 280
    Width = 517
    Height = 17
    Caption = #1055#1086#1085#1086#1074#1080#1090#1080' '#1087#1077#1088#1077#1083#1110#1082' '#1087#1088#1072#1074' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
    TabOrder = 7
  end
  object GroupBox3: TGroupBox
    Left = 12
    Top = 308
    Width = 517
    Height = 77
    Caption = #1044#1088#1091#1082
    TabOrder = 8
    object Label4: TLabel
      Left = 8
      Top = 20
      Width = 90
      Height = 13
      Caption = #1064#1083#1103#1093' '#1076#1086' '#1096#1072#1073#1083#1086#1085#1110#1074
    end
    object edtTemplatePath: TEdit
      Left = 104
      Top = 20
      Width = 381
      Height = 21
      TabOrder = 0
      Text = 'edtTemplatePath'
    end
    object btnTemplatePath: TButton
      Left = 488
      Top = 20
      Width = 21
      Height = 21
      Action = aTemplatePath
      TabOrder = 1
    end
    object rgPrintToWord: TRadioGroup
      Left = 0
      Top = 44
      Width = 517
      Height = 33
      Columns = 2
      Items.Strings = (
        'MS Office'
        'OpenOffice')
      TabOrder = 2
    end
  end
  object alNalashtuvannySystemi: TActionList
    Left = 464
    Top = 204
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aTemporary: TAction
      Caption = '...'
      OnExecute = aTemporaryExecute
    end
    object aTemplatePath: TAction
      Caption = '...'
      OnExecute = aTemplatePathExecute
    end
  end
end
