object frmUmoviVidnovlennyEdit: TfrmUmoviVidnovlennyEdit
  Left = 796
  Top = 544
  Width = 496
  Height = 196
  Caption = 'frmUmoviVidnovlennyEdit'
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
    Left = 16
    Top = 52
    Width = 118
    Height = 13
    Caption = #1050#1086#1076' '#1091#1084#1086#1074#1080' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103
  end
  object Label2: TLabel
    Left = 12
    Top = 96
    Width = 99
    Height = 13
    Caption = #1059#1084#1086#1074#1080' '#1074#1110#1076#1085#1086#1074#1083#1077#1085#1085#1103
  end
  object Label3: TLabel
    Left = 20
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object edtKod: TEdit
    Left = 144
    Top = 52
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 264
    Top = 52
    Width = 21
    Height = 21
    Action = aKod_Update
    TabOrder = 1
  end
  object edtUmovaVidnovlenny: TEdit
    Left = 144
    Top = 88
    Width = 329
    Height = 21
    TabOrder = 2
    Text = 'edtUmovaVidnovlenny'
  end
  object btnVikonati: TButton
    Left = 166
    Top = 124
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 246
    Top = 124
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object edtRecord_ID: TEdit
    Left = 84
    Top = 16
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'edtRecord_ID'
  end
  object alUmoviVidnovlennyEdit: TActionList
    Left = 304
    Top = 12
    object aRecord_ID_Update: TAction
      Caption = 'aRecord_ID_Update'
      OnExecute = aRecord_ID_UpdateExecute
    end
    object aKod_Update: TAction
      Caption = '...'
      OnExecute = aKod_UpdateExecute
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
