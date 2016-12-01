object frmDataTypesEdit: TfrmDataTypesEdit
  Left = 568
  Top = 101
  Width = 334
  Height = 206
  Caption = 'frmDataTypesEdit'
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
    Width = 49
    Height = 13
    Caption = 'Record ID'
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 51
    Height = 13
    Caption = #1058#1080#1087' '#1076#1072#1085#1080#1093
  end
  object Label3: TLabel
    Left = 12
    Top = 104
    Width = 45
    Height = 13
    Caption = #1044#1086#1083#1072#1076#1085#1086
  end
  object edtRecord_ID: TEdit
    Left = 68
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object edtDataType: TEdit
    Left = 68
    Top = 44
    Width = 245
    Height = 21
    TabOrder = 1
    Text = 'edtDataType'
  end
  object cbxDovzhina: TCheckBox
    Left = 12
    Top = 76
    Width = 97
    Height = 17
    Caption = #1044#1086#1074#1078#1080#1085#1072
    TabOrder = 2
  end
  object cbxTochnist: TCheckBox
    Left = 112
    Top = 76
    Width = 97
    Height = 17
    Caption = #1058#1086#1095#1085#1110#1089#1090#1100
    TabOrder = 3
  end
  object cbxPidpit: TCheckBox
    Left = 212
    Top = 76
    Width = 97
    Height = 17
    Caption = #1055#1110#1076#1090#1080#1087
    TabOrder = 4
  end
  object edtDescription: TEdit
    Left = 68
    Top = 104
    Width = 245
    Height = 21
    TabOrder = 5
    Text = 'edtDescription'
  end
  object btnOK: TButton
    Left = 85
    Top = 136
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnCancel: TButton
    Left = 165
    Top = 136
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object qDataTypesEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 200
    Top = 12
  end
  object alDataTypesEdit: TActionList
    Left = 232
    Top = 8
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
end
