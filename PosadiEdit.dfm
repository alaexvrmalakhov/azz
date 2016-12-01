object frmPosadiEdit: TfrmPosadiEdit
  Left = 735
  Top = 110
  Width = 505
  Height = 214
  Caption = 'frmPosadiEdit'
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
    Top = 12
    Width = 58
    Height = 13
    Caption = #1050#1086#1076' '#1087#1086#1089#1072#1076#1080
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 71
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1087#1086#1089#1072#1076#1080
  end
  object Label3: TLabel
    Left = 32
    Top = 76
    Width = 58
    Height = 13
    Caption = #1074' '#1088#1086#1076#1086#1074#1086#1084#1091
  end
  object Label4: TLabel
    Left = 32
    Top = 108
    Width = 57
    Height = 13
    Caption = #1074' '#1086#1088#1091#1076#1085#1086#1084#1091
  end
  object edtKodPosadi: TEdit
    Left = 96
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodPosadi'
  end
  object edtNazvaposadi: TEdit
    Left = 96
    Top = 44
    Width = 381
    Height = 21
    ImeName = 'Russian'
    MaxLength = 100
    TabOrder = 2
    Text = 'edtNazvaposadi'
  end
  object btnVikonati: TButton
    Left = 161
    Top = 140
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnVidminiti: TButton
    Left = 241
    Top = 140
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object edtNazvaposadi_RV: TEdit
    Left = 96
    Top = 76
    Width = 357
    Height = 21
    ImeName = 'Russian'
    TabOrder = 3
    Text = 'edtNazvaposadi_RV'
  end
  object edtNazvaposadi_TV: TEdit
    Left = 96
    Top = 108
    Width = 357
    Height = 21
    ImeName = 'Russian'
    TabOrder = 4
    Text = 'edtNazvaposadi_TV'
  end
  object btnVidminok: TButton
    Left = 456
    Top = 76
    Width = 21
    Height = 53
    Action = aVidminokChange
    TabOrder = 5
  end
  object btnKodPosadi: TButton
    Left = 220
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object alPosadiEdit: TActionList
    Left = 292
    Top = 16
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aVidminokChange: TAction
      Caption = '...'
      OnExecute = aVidminokChangeExecute
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
