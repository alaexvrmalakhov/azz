object frmSumiShtrafuEdit: TfrmSumiShtrafuEdit
  Left = 1276
  Top = 205
  Width = 645
  Height = 186
  Caption = 'frmSumiShtrafuEdit'
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
    Width = 67
    Height = 13
    Caption = #1057#1091#1084#1072' '#1096#1090#1088#1072#1092#1091
  end
  object Label2: TLabel
    Left = 12
    Top = 80
    Width = 79
    Height = 13
    Caption = #1057#1091#1084#1072' '#1087#1088#1086#1087#1080#1089#1086#1084
  end
  object Label3: TLabel
    Left = 12
    Top = 12
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object edtCumaShtrafu: TEdit
    Left = 100
    Top = 44
    Width = 121
    Height = 21
    ImeName = 'Russian'
    MaxLength = 8
    TabOrder = 0
    Text = 'edtCumaShtrafu'
  end
  object edtSumaPropisom: TEdit
    Left = 100
    Top = 76
    Width = 449
    Height = 21
    ImeName = 'Russian'
    MaxLength = 100
    TabOrder = 1
    Text = 'edtSumaPropisom'
  end
  object btnPerevesti: TButton
    Left = 552
    Top = 76
    Width = 75
    Height = 21
    Action = aConvert
    TabOrder = 2
  end
  object btnVikonati: TButton
    Left = 241
    Top = 112
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 321
    Top = 112
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object edtKod: TEdit
    Left = 100
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 5
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 224
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 6
  end
  object alSumaShtrafuEdit: TActionList
    Left = 332
    Top = 16
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aConvert: TAction
      Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
      OnExecute = aConvertExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 13
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
