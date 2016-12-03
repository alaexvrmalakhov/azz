object frmViddilennyEdit: TfrmViddilennyEdit
  Left = 1394
  Top = 97
  Width = 441
  Height = 213
  Caption = 'frmViddilennyEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 81
    Height = 13
    Caption = #1050#1086#1076' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103' *'
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 94
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1074#1110#1076#1076#1110#1083#1077#1085#1085#1103' *'
  end
  object Label3: TLabel
    Left = 28
    Top = 76
    Width = 58
    Height = 13
    Caption = #1074' '#1088#1086#1076#1086#1074#1086#1084#1091
  end
  object Label4: TLabel
    Left = 28
    Top = 108
    Width = 57
    Height = 13
    Caption = #1074' '#1086#1088#1091#1076#1085#1086#1084#1091
  end
  object edtKodViddilenny: TEdit
    Left = 116
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodViddilenny'
  end
  object edtNazvaViddilenny: TEdit
    Left = 112
    Top = 44
    Width = 301
    Height = 21
    ImeName = 'Russian'
    MaxLength = 75
    TabOrder = 2
    Text = 'edtNazvaViddilenny'
  end
  object btnVikonati: TButton
    Left = 133
    Top = 140
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnVidmina: TButton
    Left = 213
    Top = 140
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object edtNazvaViddilenny_RV: TEdit
    Left = 112
    Top = 76
    Width = 281
    Height = 21
    ImeName = 'Russian'
    TabOrder = 3
    Text = 'edtNazvaViddilenny_RV'
  end
  object edtNazvaViddilenny_TV: TEdit
    Left = 112
    Top = 108
    Width = 281
    Height = 21
    ImeName = 'Russian'
    TabOrder = 4
    Text = 'edtNazvaViddilenny_TV'
  end
  object btnVidminok: TButton
    Left = 392
    Top = 76
    Width = 21
    Height = 53
    Action = aViddilennyChange
    TabOrder = 5
  end
  object btnKodViddilenny: TButton
    Left = 240
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object alViddilennyEdit: TActionList
    Left = 332
    Top = 4
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aViddilennyChange: TAction
      Caption = '...'
      OnExecute = aViddilennyChangeExecute
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
