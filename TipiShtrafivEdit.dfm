object frmTipiShtrafivEdit: TfrmTipiShtrafivEdit
  Left = 908
  Top = 114
  Width = 476
  Height = 154
  Caption = 'frmTipiShtrafivEdit'
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
    Width = 88
    Height = 13
    Caption = #1050#1086#1076' '#1090#1080#1087#1091' '#1096#1090#1088#1072#1092#1110#1074
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 63
    Height = 13
    Caption = #1058#1080#1087' '#1096#1090#1088#1072#1092#1110#1074
  end
  object edtKodTipuShtrafiv: TEdit
    Left = 112
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodTipuShtrafiv'
  end
  object edtTipShtrafu: TEdit
    Left = 112
    Top = 44
    Width = 345
    Height = 21
    ImeName = 'Russian'
    MaxLength = 75
    TabOrder = 1
    Text = 'edtTipShtrafu'
  end
  object btnVikonati: TButton
    Left = 156
    Top = 80
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 2
  end
  object btnVidmina: TButton
    Left = 236
    Top = 80
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 3
  end
  object btnKodTipuShtrafiv: TButton
    Left = 236
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 4
  end
  object alTipiShtrafivEdit: TActionList
    Left = 288
    Top = 12
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
