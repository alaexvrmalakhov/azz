object frmVirobnikiEdit: TfrmVirobnikiEdit
  Left = 834
  Top = 593
  Width = 446
  Height = 147
  Caption = 'frmVirobnikiEdit'
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
    Width = 76
    Height = 13
    Caption = #1050#1086#1076' '#1074#1080#1088#1086#1073#1085#1080#1082#1072
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 49
    Height = 13
    Caption = #1042#1080#1088#1086#1073#1085#1080#1082
  end
  object edtKod: TEdit
    Left = 96
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 220
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtVirobnik: TEdit
    Left = 96
    Top = 44
    Width = 329
    Height = 21
    TabOrder = 2
    Text = 'edtVirobnik'
  end
  object btnVikonati: TButton
    Left = 141
    Top = 76
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 221
    Top = 76
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object alVirobnikiEdit: TActionList
    Left = 344
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
  object qRecordID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 268
    Top = 4
  end
end
