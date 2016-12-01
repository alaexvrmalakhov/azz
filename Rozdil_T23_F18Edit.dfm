object frmRozdil_T23_F18Edit: TfrmRozdil_T23_F18Edit
  Left = 712
  Top = 586
  Width = 568
  Height = 154
  Caption = 'frmRozdil_T23_F18Edit'
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
    Width = 57
    Height = 13
    Caption = #1050#1086#1076' '#1089#1090#1088#1086#1082#1080
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 114
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1073#39#1108#1082#1090#1091' '#1085#1072#1075#1083#1103#1076#1091
  end
  object edtKodStroki: TEdit
    Left = 140
    Top = 8
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodStroki'
  end
  object edtNazvaObjektu: TEdit
    Left = 140
    Top = 44
    Width = 405
    Height = 21
    MaxLength = 100
    TabOrder = 2
    Text = 'edtNazvaObjektu'
  end
  object btnVikonati: TButton
    Left = 202
    Top = 80
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidmina: TButton
    Left = 282
    Top = 80
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object btnKodStroki: TButton
    Left = 264
    Top = 8
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object alRozdilt23f18Edit: TActionList
    Left = 348
    Top = 4
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
