object frmVidPostanoviEdit: TfrmVidPostanoviEdit
  Left = 772
  Top = 563
  Width = 510
  Height = 178
  Caption = 'frmVidPostanoviEdit'
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
    Top = 44
    Width = 101
    Height = 13
    Caption = #1050#1086#1076' '#1074#1080#1076#1091' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 75
    Height = 13
    Caption = #1042#1080#1076' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
  end
  object Label3: TLabel
    Left = 12
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object edtKodViduPostanovi: TEdit
    Left = 124
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtKodViduPostanovi'
  end
  object btnKodViduPostanovi: TButton
    Left = 248
    Top = 44
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 2
  end
  object edtVidPostanovi: TEdit
    Left = 124
    Top = 76
    Width = 365
    Height = 21
    TabOrder = 3
    Text = 'edtVidPostanovi'
  end
  object btnVikonati: TButton
    Left = 175
    Top = 108
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnVidminiti: TButton
    Left = 251
    Top = 108
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object edtRecord_ID: TEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object alVidPostanoviEdit: TActionList
    Left = 316
    Top = 16
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
    object aRecord_ID_Update: TAction
      Caption = 'aRecord_ID_Update'
      OnExecute = aRecord_ID_UpdateExecute
    end
  end
  object qVidPostanoviEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 396
    Top = 12
  end
end
