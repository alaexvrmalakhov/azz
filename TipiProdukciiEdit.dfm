object frmTipiProdukciiEdit: TfrmTipiProdukciiEdit
  Left = 768
  Top = 524
  Width = 512
  Height = 216
  Caption = 'frmTipiProdukciiEdit'
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
    Width = 68
    Height = 13
    Caption = #1058#1080#1087' '#1087#1088#1086#1076#1091#1082#1094#1110#1111
  end
  object edtKod: TEdit
    Left = 92
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 216
    Top = 16
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtTipProdukcii: TEdit
    Left = 92
    Top = 52
    Width = 389
    Height = 21
    TabOrder = 2
    Text = 'edtTipProdukcii'
  end
  object btnVikonati: TButton
    Left = 170
    Top = 140
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 250
    Top = 140
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object rgGrupaTovariv: TRadioGroup
    Left = 16
    Top = 88
    Width = 465
    Height = 37
    Caption = #1043#1088#1091#1087#1072' '#1090#1086#1074#1072#1088#1110#1074
    Columns = 2
    Items.Strings = (
      #1055#1088#1086#1076#1086#1074#1086#1083#1100#1095#1110
      #1053#1077' '#1087#1088#1086#1076#1086#1074#1086#1083#1100#1095#1110)
    TabOrder = 5
  end
  object alTipiProdukciiEdit: TActionList
    Left = 304
    Top = 8
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
  object qRecordID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 400
    Top = 8
  end
end
