object frmMinistryEdit: TfrmMinistryEdit
  Left = 573
  Top = 115
  Width = 537
  Height = 166
  Caption = 'frmMinistryEdit'
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
    Top = 16
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 16
    Top = 52
    Width = 65
    Height = 13
    Caption = #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
  end
  object edtKod: TEdit
    Left = 100
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 220
    Top = 16
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtMinistry: TEdit
    Left = 100
    Top = 52
    Width = 413
    Height = 21
    TabOrder = 2
    Text = 'edtMinistry'
  end
  object btnOK: TButton
    Left = 187
    Top = 92
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 267
    Top = 92
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object alMinistryEdit: TActionList
    Left = 364
    Top = 4
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
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
