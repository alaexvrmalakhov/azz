object frmLogOn: TfrmLogOn
  Left = 253
  Top = 113
  Width = 411
  Height = 196
  Caption = 'frmLogOn'
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 52
    Width = 78
    Height = 13
    Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095' *'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 88
    Width = 54
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100' *'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 16
    Width = 53
    Height = 13
    Caption = #1057#1077#1088#1074#1077#1088' *'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtUser_Name: TEdit
    Left = 92
    Top = 52
    Width = 293
    Height = 21
    Hint = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
    ImeName = 'Russian'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = 'edtUser_Name'
  end
  object edtPassword: TEdit
    Left = 92
    Top = 88
    Width = 293
    Height = 21
    Hint = #1055#1072#1088#1086#1083#1100' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
    Color = clWhite
    ImeName = 'Russian'
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
    Text = 'edtPassword'
  end
  object btnConnect: TButton
    Left = 121
    Top = 124
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 2
  end
  object btnClose: TButton
    Left = 205
    Top = 124
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 3
  end
  object edtServer: TEdit
    Left = 92
    Top = 16
    Width = 293
    Height = 21
    Hint = #1064#1083#1103#1093' '#1076#1086' '#1089#1077#1088#1074#1077#1088#1072' '#1041#1044
    ImeName = 'Russian'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = 'edtServer'
  end
  object alLogOn: TActionList
    Left = 12
    Top = 112
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aOK: TAction
      Caption = #1055#1110#1076#1082#1083#1102#1095#1080#1090#1080#1089#1100
      OnExecute = aOKExecute
    end
  end
  object qUser: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 344
    Top = 108
  end
  object dsUser: TDataSource
    DataSet = qUser
    Left = 308
    Top = 112
  end
end
