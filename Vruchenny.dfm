object frmVruchenny: TfrmVruchenny
  Left = 813
  Top = 95
  Width = 372
  Height = 209
  Caption = 'frmVruchenny'
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
    Top = 76
    Width = 188
    Height = 13
    Caption = #1044#1072#1090#1072' '#1074#1088#1091#1095#1077#1085#1085#1103' '#1087#1086#1089#1090#1072#1085#1086#1074#1080' '#1087#1088#1086' '#1096#1090#1088#1072#1092
  end
  object Label2: TLabel
    Left = 12
    Top = 12
    Width = 90
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label3: TLabel
    Left = 16
    Top = 44
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label4: TLabel
    Left = 208
    Top = 44
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object btnVikonati: TButton
    Left = 105
    Top = 140
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 2
  end
  object btnVidminiti: TButton
    Left = 185
    Top = 140
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 3
  end
  object dtpDataVruchenny: TDateTimePicker
    Left = 208
    Top = 76
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.8376119329
    Time = 39280.8376119329
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 0
  end
  object cbSamolikvidaciy: TCheckBox
    Left = 12
    Top = 108
    Width = 109
    Height = 17
    Caption = #1057#1072#1084#1086#1083#1110#1082#1074#1110#1076#1110#1094#1110#1103
    TabOrder = 1
  end
  object edtNomerPostanovi: TEdit
    Left = 112
    Top = 12
    Width = 241
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 112
    Top = 44
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 40393.6212686227
    Time = 40393.6212686227
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 5
  end
  object edtKod: TEdit
    Left = 236
    Top = 44
    Width = 117
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'edtKod'
  end
  object alVruchenny: TActionList
    Left = 288
    Top = 108
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
