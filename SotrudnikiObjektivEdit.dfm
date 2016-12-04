object frmSotrudnikiObjektivEdit: TfrmSotrudnikiObjektivEdit
  Left = 1076
  Top = 77
  Width = 535
  Height = 307
  Caption = 'frmSotrudnikiObjektivEdit'
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
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 85
    Height = 13
    Caption = #1055'.'#1030'.'#1041'. '#1087#1086#1088#1091#1096#1085#1080#1082#1072
  end
  object Label4: TLabel
    Left = 12
    Top = 108
    Width = 96
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072' '#1087#1086#1088#1091#1096#1085#1080#1082#1072
  end
  object Label9: TLabel
    Left = 12
    Top = 140
    Width = 91
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
  end
  object Label10: TLabel
    Left = 12
    Top = 172
    Width = 94
    Height = 13
    Caption = #1052#1110#1089#1094#1077' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
  end
  object Label11: TLabel
    Left = 280
    Top = 140
    Width = 107
    Height = 13
    Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076
  end
  object Label5: TLabel
    Left = 12
    Top = 204
    Width = 94
    Height = 13
    Caption = #1052#1110#1089#1094#1077' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103
  end
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 59
    Height = 13
    Caption = #1050#1086#1076' '#1086#1073#39#1108#1082#1090#1072
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 91
    Height = 13
    Caption = #1050#1086#1076' '#1089#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082#1072
  end
  object edtPIBPorushnika: TEdit
    Left = 116
    Top = 76
    Width = 393
    Height = 21
    ImeName = 'Russian'
    MaxLength = 100
    TabOrder = 3
    Text = 'edtPIBPorushnika'
  end
  object edtPosadaPorushnika: TEdit
    Left = 116
    Top = 108
    Width = 393
    Height = 21
    ImeName = 'Russian'
    MaxLength = 100
    TabOrder = 4
    Text = 'edtPosadaPorushnika'
  end
  object edtMisceNarodzhennyPorushnika: TEdit
    Left = 116
    Top = 172
    Width = 393
    Height = 21
    ImeName = 'Russian'
    MaxLength = 100
    TabOrder = 7
    Text = 'edtMisceNarodzhennyPorushnika'
  end
  object edtIdentifikacijnijNomerPorushnika: TEdit
    Left = 392
    Top = 140
    Width = 117
    Height = 21
    ImeName = 'Russian'
    MaxLength = 10
    TabOrder = 6
    Text = 'edtIdentifikacijnijNomerPorushnika'
  end
  object dtpDataNarodzhennyPorushnika: TDateTimePicker
    Left = 116
    Top = 140
    Width = 149
    Height = 21
    Date = 39272.484412974500000000
    Time = 39272.484412974500000000
    ImeName = 'Russian'
    TabOrder = 5
  end
  object edtMisceProzhivanny: TEdit
    Left = 116
    Top = 204
    Width = 393
    Height = 21
    ImeName = 'Russian'
    TabOrder = 8
    Text = 'edtMisceProzhivanny'
  end
  object edtKodObjekta: TEdit
    Left = 116
    Top = 12
    Width = 185
    Height = 21
    Color = clInactiveBorder
    ImeName = 'Russian'
    ReadOnly = True
    TabOrder = 0
    Text = 'edtKodObjekta'
  end
  object btnVikonati: TButton
    Left = 183
    Top = 236
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 9
  end
  object btnVidminiti: TButton
    Left = 263
    Top = 236
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 10
  end
  object edtKod: TEdit
    Left = 116
    Top = 44
    Width = 185
    Height = 21
    ImeName = 'Russian'
    TabOrder = 1
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 304
    Top = 44
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 2
  end
  object alSotrudnikiObjektovEdit: TActionList
    Left = 364
    Top = 4
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
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
  end
end
