object frmInitializeEdit: TfrmInitializeEdit
  Left = 360
  Top = 123
  Width = 586
  Height = 200
  Caption = 'frmInitializeEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Record ID'
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 93
    Height = 13
    Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1088#1110#1074#1077#1085#1100
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 32
    Height = 13
    Caption = #1053#1072#1079#1074#1072
  end
  object lblParentID: TLabel
    Left = 492
    Top = 48
    Width = 73
    Height = 13
    AutoSize = False
    Caption = 'lblParentID'
  end
  object Label4: TLabel
    Left = 12
    Top = 108
    Width = 33
    Height = 13
    Caption = #1056#1110#1074#1077#1085#1100
  end
  object edtRecord_ID: TEdit
    Left = 72
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object cbParent_ID: TComboBox
    Left = 112
    Top = 44
    Width = 329
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'cbParent_ID'
  end
  object btnParentIDUpdate: TButton
    Left = 444
    Top = 44
    Width = 21
    Height = 21
    Caption = 'btnParentIDUpdate'
    TabOrder = 2
  end
  object btnParentIDChoice: TButton
    Left = 468
    Top = 44
    Width = 21
    Height = 21
    Caption = 'btnParentIDChoice'
    TabOrder = 3
  end
  object edtName: TEdit
    Left = 60
    Top = 76
    Width = 509
    Height = 21
    TabOrder = 4
    Text = 'edtName'
  end
  object btnOK: TButton
    Left = 211
    Top = 140
    Width = 75
    Height = 25
    Caption = 'btnOK'
    Default = True
    TabOrder = 6
  end
  object btnCancel: TButton
    Left = 291
    Top = 140
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'btnCancel'
    TabOrder = 7
  end
  object edtLevel: TEdit
    Left = 60
    Top = 108
    Width = 509
    Height = 21
    Hint = #1057#1072#1084#1080#1081' '#1074#1080#1089#1086#1082#1080#1081' '#1088#1110#1074#1077#1085#1100' - 0.'
    TabOrder = 5
    Text = 'edtLevel'
  end
  object alInitializeEdit: TActionList
    Left = 372
  end
  object qInitializeEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 340
  end
end
