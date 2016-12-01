object frmOskargennyEdit: TfrmOskargennyEdit
  Left = 716
  Top = 562
  Width = 564
  Height = 178
  Caption = 'frmOskargennyEdit'
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
    Top = 48
    Width = 117
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 156
    Height = 13
    Caption = #1063#1080' '#1084#1086#1078#1085#1072' '#1074#1080#1076#1072#1083#1103#1090#1080' '#1087#1086#1089#1090#1072#1085#1086#1074#1091
  end
  object Label2: TLabel
    Left = 12
    Top = 12
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object edtOskargenny: TEdit
    Left = 140
    Top = 44
    Width = 405
    Height = 21
    MaxLength = 100
    TabOrder = 2
    Text = 'edtOskargenny'
  end
  object btnVikonati: TButton
    Left = 200
    Top = 108
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnVidminiti: TButton
    Left = 280
    Top = 108
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object cbVidalenny: TCheckBox
    Left = 188
    Top = 76
    Width = 97
    Height = 17
    Caption = 'cbVidalenny'
    TabOrder = 3
    OnClick = cbVidalennyClick
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
  object alRezultatOskarzhennyEdit: TActionList
    Left = 300
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
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
end
