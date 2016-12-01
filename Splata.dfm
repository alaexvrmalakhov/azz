object frmSplata: TfrmSplata
  Left = 933
  Top = 115
  Width = 333
  Height = 215
  Caption = 'frmSplata'
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
    Width = 149
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1110#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
  end
  object Label2: TLabel
    Left = 16
    Top = 108
    Width = 64
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1087#1083#1072#1090#1080
  end
  object Label3: TLabel
    Left = 12
    Top = 12
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label4: TLabel
    Left = 12
    Top = 44
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label5: TLabel
    Left = 196
    Top = 44
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object edtNomerPlatizhki: TEdit
    Left = 168
    Top = 76
    Width = 145
    Height = 21
    MaxLength = 15
    TabOrder = 3
    Text = 'edtNomerPlatizhki'
  end
  object btnVikonati: TButton
    Left = 85
    Top = 144
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 5
  end
  object btnVidminiti: TButton
    Left = 165
    Top = 144
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 6
  end
  object dtpDataSplati: TDateTimePicker
    Left = 168
    Top = 108
    Width = 145
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.8451265857
    Time = 39280.8451265857
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 4
  end
  object edtNomerPostanovi: TEdit
    Left = 104
    Top = 12
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 104
    Top = 44
    Width = 81
    Height = 21
    CalAlignment = dtaLeft
    Date = 40394.4794429977
    Time = 40394.4794429977
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtKod: TEdit
    Left = 220
    Top = 44
    Width = 93
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtKod'
  end
  object alSplata: TActionList
    Left = 124
    Top = 100
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
