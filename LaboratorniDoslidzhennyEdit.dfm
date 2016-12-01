object frmLaboratorniDoslidzhennyEdit: TfrmLaboratorniDoslidzhennyEdit
  Left = 756
  Top = 592
  Width = 524
  Height = 148
  Caption = 'frmLaboratorniDoslidzhennyEdit'
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
    Width = 111
    Height = 13
    Caption = #1050#1086#1076' '#1090#1080#1087#1091' '#1076#1086#1089#1083#1110#1076#1078#1077#1085#1085#1103
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 86
    Height = 13
    Caption = #1058#1080#1087' '#1076#1086#1089#1083#1110#1076#1078#1077#1085#1085#1103
  end
  object edtKodTipuDoslidzhenny: TEdit
    Left = 132
    Top = 12
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodTipuDoslidzhenny'
  end
  object edtTipDoslidzhenny: TEdit
    Left = 132
    Top = 44
    Width = 369
    Height = 21
    MaxLength = 100
    TabOrder = 2
    Text = 'edtTipDoslidzhenny'
  end
  object btnVikonati: TButton
    Left = 177
    Top = 76
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 257
    Top = 76
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object btnKodTipuDoslidzhenny: TButton
    Left = 256
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object alLaboratorniDoslidzhennyEdit: TActionList
    Left = 336
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
