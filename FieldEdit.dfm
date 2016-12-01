object frmFieldEdit: TfrmFieldEdit
  Left = 660
  Top = 55
  Width = 570
  Height = 241
  Caption = 'frmFieldEdit'
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
    Left = 212
    Top = 12
    Width = 43
    Height = 13
    Caption = #1058#1072#1073#1083#1080#1094#1103
  end
  object Label3: TLabel
    Left = 12
    Top = 44
    Width = 46
    Height = 13
    Caption = #1030#1084#39#1103' '#1087#1086#1083#1103
  end
  object Label4: TLabel
    Left = 12
    Top = 76
    Width = 95
    Height = 13
    Caption = #1030#1084#39#1103' '#1087#1086#1083#1103' '#1074' '#1090#1072#1073#1083#1080#1094#1110
  end
  object Label5: TLabel
    Left = 12
    Top = 108
    Width = 19
    Height = 13
    Caption = #1058#1080#1087
  end
  object lblDlina: TLabel
    Left = 12
    Top = 140
    Width = 35
    Height = 13
    Caption = #1056#1086#1079#1084#1110#1088
  end
  object lblTochnost: TLabel
    Left = 184
    Top = 140
    Width = 43
    Height = 13
    Caption = #1058#1086#1095#1085#1110#1089#1090#1100
  end
  object lblPodtip: TLabel
    Left = 364
    Top = 140
    Width = 33
    Height = 13
    Caption = #1055#1110#1076#1090#1080#1087
  end
  object edtRecordID: TEdit
    Left = 68
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecordID'
  end
  object edtTableID: TEdit
    Left = 260
    Top = 12
    Width = 289
    Height = 21
    TabOrder = 1
    Text = 'edtTableID'
  end
  object edtFieldName: TEdit
    Left = 64
    Top = 44
    Width = 485
    Height = 21
    TabOrder = 2
    Text = 'edtFieldName'
  end
  object edtDBFieldName: TEdit
    Left = 112
    Top = 76
    Width = 437
    Height = 21
    TabOrder = 3
    Text = 'edtDBFieldName'
  end
  object cbDataType: TComboBox
    Left = 36
    Top = 108
    Width = 489
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbDataType'
    OnChange = aDataTypeChangeExecute
  end
  object btnDataTypeUpdate: TButton
    Left = 528
    Top = 108
    Width = 21
    Height = 21
    Action = aDataTypeUpdate
    TabOrder = 5
  end
  object edtDlina: TEdit
    Left = 52
    Top = 140
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'edtDlina'
  end
  object edtTochnost: TEdit
    Left = 232
    Top = 140
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'edtTochnost'
  end
  object cbPodtip: TComboBox
    Left = 404
    Top = 140
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Items.Strings = (
      #1058#1077#1082#1089#1090
      #1044#1074#1086#1111#1095#1085#1080#1081)
  end
  object btnOK: TButton
    Left = 203
    Top = 172
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 9
  end
  object btnCancel: TButton
    Left = 283
    Top = 172
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 10
  end
  object alFieldEdit: TActionList
    Left = 68
    Top = 160
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aDataTypeUpdate: TAction
      Caption = '@'
      OnExecute = aDataTypeUpdateExecute
    end
    object aDataTypeChange: TAction
      Caption = 'aDataTypeChange'
      OnExecute = aDataTypeChangeExecute
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
  object qFieldEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 124
    Top = 164
  end
end
