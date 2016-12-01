object frmRivniSESEdit: TfrmRivniSESEdit
  Left = 399
  Top = 113
  Width = 497
  Height = 217
  Caption = 'frmRivniSESEdit'
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
    Width = 49
    Height = 13
    Caption = 'Record ID'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 33
    Height = 13
    Caption = #1056#1110#1074#1077#1085#1100
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 51
    Height = 13
    Caption = #1044#1086#1082#1083#1072#1076#1085#1086
  end
  object edtRecord_ID: TEdit
    Left = 76
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object edtKod: TEdit
    Left = 76
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtKod'
  end
  object edtRiven: TEdit
    Left = 76
    Top = 80
    Width = 397
    Height = 21
    TabOrder = 2
    Text = 'edtRiven'
  end
  object edtDescription: TEdit
    Left = 76
    Top = 112
    Width = 401
    Height = 21
    TabOrder = 3
    Text = 'edtDescription'
  end
  object btnOK: TButton
    Left = 167
    Top = 148
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 247
    Top = 148
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object alRivenSESEdit: TActionList
    Left = 228
    Top = 16
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
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
  object qRivniSESEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 304
    Top = 20
  end
end
