object frmTeritoryEdit: TfrmTeritoryEdit
  Left = 1353
  Top = 189
  Width = 567
  Height = 164
  Caption = 'frmTeritoryEdit'
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
  object Label3: TLabel
    Left = 16
    Top = 52
    Width = 50
    Height = 13
    Caption = #1058#1077#1088#1080#1090#1086#1088#1110#1103
  end
  object edtKod: TEdit
    Left = 100
    Top = 16
    Width = 121
    Height = 21
    ImeName = 'Russian'
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 224
    Top = 16
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtTeritory: TEdit
    Left = 100
    Top = 52
    Width = 437
    Height = 21
    ImeName = 'Russian'
    TabOrder = 2
    Text = 'edtTeritory'
  end
  object btnVikonati: TButton
    Left = 197
    Top = 88
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 277
    Top = 88
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object alTeritoryEdit: TActionList
    Left = 328
    Top = 4
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      ShortCut = 13
      OnExecute = aOKExecute
    end
  end
  object qTeritoryUpdates: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 40
    Top = 76
  end
end
