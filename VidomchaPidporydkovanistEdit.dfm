object frmVidomchaPidporydkovanistEdit: TfrmVidomchaPidporydkovanistEdit
  Left = 1317
  Top = 201
  Width = 485
  Height = 151
  Caption = 'frmVidomchaPidporydkovanistEdit'
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
    Width = 73
    Height = 13
    Caption = #1050#1086#1076' '#1074#1110#1076#1086#1084#1089#1090#1074#1072
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 52
    Height = 13
    Caption = #1042#1110#1076#1086#1084#1089#1090#1074#1086
  end
  object edtKodVidomstva: TEdit
    Left = 100
    Top = 12
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 0
    Text = 'edtKodVidomstva'
  end
  object edtVidomstvo: TEdit
    Left = 100
    Top = 44
    Width = 365
    Height = 21
    ImeName = 'Russian'
    TabOrder = 2
    Text = 'edtVidomstvo'
  end
  object btnVikonati: TButton
    Left = 161
    Top = 80
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 241
    Top = 80
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object btnKodVidomstva: TButton
    Left = 224
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object alVidomchaPidporydkovanistEdit: TActionList
    Left = 288
    Top = 12
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aCancel: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 13
      OnExecute = aOKExecute
    end
  end
end
