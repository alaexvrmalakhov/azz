object frmViknaEdit: TfrmViknaEdit
  Left = 794
  Top = 523
  Width = 495
  Height = 218
  Caption = 'frmViknaEdit'
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
    Width = 61
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1074#1110#1082#1085#1072
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 48
    Height = 13
    Caption = #1030#1084#39#1103' '#1074#1110#1082#1085#1072
  end
  object Label4: TLabel
    Left = 16
    Top = 112
    Width = 47
    Height = 13
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object edtRecord_ID: TEdit
    Left = 88
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object edtNazvaVikna: TEdit
    Left = 88
    Top = 48
    Width = 385
    Height = 21
    TabOrder = 1
    Text = 'edtNazvaVikna'
  end
  object edtFormName: TEdit
    Left = 88
    Top = 80
    Width = 385
    Height = 21
    TabOrder = 2
    Text = 'edtFormName'
  end
  object edtPrimitka: TEdit
    Left = 88
    Top = 112
    Width = 385
    Height = 21
    TabOrder = 3
    Text = 'edtPrimitka'
  end
  object btnOK: TButton
    Left = 166
    Top = 148
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 246
    Top = 148
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object alViknaEdit: TActionList
    Left = 264
    Top = 8
    object aRecordID_Update: TAction
      Caption = 'aRecordID_Update'
      OnExecute = aRecordID_UpdateExecute
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
  object qViknaEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 312
    Top = 12
  end
end
