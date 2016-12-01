object frmProProgramu: TfrmProProgramu
  Left = 245
  Top = 106
  Width = 397
  Height = 336
  Caption = 'frmProProgramu'
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
    Left = 86
    Top = 8
    Width = 216
    Height = 13
    Caption = #1055#1088#1086#1075#1088#1072#1084#1072' '#1072#1074#1090#1086#1084#1072#1090#1080#1079#1086#1074#1072#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 102
    Top = 48
    Width = 186
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1077#1088#1089#1110#1103' '#1087#1088#1086#1075#1088#1072#1084#1080' 2.0.3.2 '#1041#1077#1088#1077#1079#1077#1085#1100', 2011 '#1042#1077#1088#1089#1110#1103' '#1041#1044' 2.0.3.2'
    ShowAccelChar = False
    WordWrap = True
  end
  object Label3: TLabel
    Left = 162
    Top = 84
    Width = 64
    Height = 13
    Caption = #1056#1086#1079#1088#1086#1073#1085#1080#1082#1080':'
  end
  object Label4: TLabel
    Left = 84
    Top = 204
    Width = 220
    Height = 13
    Caption = #1040#1074#1090#1086#1088#1089#1100#1082#1077' '#1087#1088#1072#1074#1086' '#1088#1086#1079#1088#1086#1073#1085#1080#1082#1072' '#1079#1072#1093#1080#1097#1072#1108#1090#1100#1089#1103
  end
  object Label5: TLabel
    Left = 64
    Top = 220
    Width = 261
    Height = 13
    Caption = #1047#1072#1082#1086#1085#1086#1084' '#1059#1082#1088#1072#1111#1085#1080' "'#1055#1088#1086' '#1072#1074#1090#1086#1088#1089#1100#1082#1110' '#1090#1072' '#1089#1091#1084#1110#1078#1085#1110' '#1087#1088#1072#1074#1072'"'
  end
  object Label6: TLabel
    Left = 142
    Top = 244
    Width = 105
    Height = 13
    Caption = #1061#1072#1088#1082#1110#1074' - 2007-2011 '#1088'.'
  end
  object Label7: TLabel
    Left = 86
    Top = 24
    Width = 217
    Height = 13
    Caption = #1072#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1086'-'#1079#1072#1087#1086#1073#1110#1078#1085#1080#1093' '#1079#1072#1093#1086#1076#1110#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 80
    Top = 100
    Width = 229
    Height = 93
    Color = clBtnFace
    Lines.Strings = (
      #1030#1076#1077#1103' - '#1047#1091#1073#1082#1086#1074#1072' '#1030'.'#1040'., '
      '          '#1063#1077#1088#1074#1086#1085#1086#1079#1072#1074#1086#1076#1089#1100#1082#1072' '#1088#1072#1081'.'#1057#1045#1057'; '
      '          '#1061#1072#1088#1082#1110#1074#1089#1100#1082#1072' '#1084#1110#1089#1100#1082#1072' '#1057#1045#1057
      '          '#1090'. 8(057)732-63-31'
      #1055#1088#1086#1075#1088#1072#1084#1091#1074#1072#1085#1085#1103' - '#1052#1072#1083#1072#1093#1086#1074' '#1054'.'#1042'., '
      '          '#1063#1077#1088#1074#1086#1085#1086#1079#1072#1074#1086#1076#1089#1100#1082#1072' '#1057#1045#1057', '#1061#1043#1059' '#1053#1059#1040
      '          '#1090'.(067)359-64-06; (057)762-75-39')
    ReadOnly = True
    TabOrder = 0
  end
  object btnZakriti: TButton
    Left = 157
    Top = 268
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1080#1090#1080
    TabOrder = 1
    OnClick = btnZakritiClick
  end
end
