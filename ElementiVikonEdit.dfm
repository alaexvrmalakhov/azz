object frmElementiVikonEdit: TfrmElementiVikonEdit
  Left = 548
  Top = 108
  Width = 510
  Height = 242
  Caption = 'frmElementiVikonEdit'
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
    Top = 76
    Width = 83
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1077#1083#1077#1084#1077#1085#1090#1091
  end
  object Label3: TLabel
    Left = 12
    Top = 108
    Width = 70
    Height = 13
    Caption = #1030#1084#39#1103' '#1077#1083#1077#1084#1077#1085#1090#1091
  end
  object Label4: TLabel
    Left = 12
    Top = 140
    Width = 47
    Height = 13
    Caption = #1055#1088#1080#1084#1110#1090#1082#1072
  end
  object Label5: TLabel
    Left = 16
    Top = 48
    Width = 27
    Height = 13
    Caption = #1042#1110#1082#1085#1086
  end
  object edtRecordID: TEdit
    Left = 100
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecordID'
  end
  object edtNazvaElementa: TEdit
    Left = 100
    Top = 76
    Width = 393
    Height = 21
    TabOrder = 4
    Text = 'edtNazvaElementa'
  end
  object edtImjyElementa: TEdit
    Left = 100
    Top = 108
    Width = 393
    Height = 21
    TabOrder = 5
    Text = 'edtImjyElementa'
  end
  object edtPrimitka: TEdit
    Left = 100
    Top = 140
    Width = 393
    Height = 21
    TabOrder = 6
    Text = 'edtPrimitka'
  end
  object btnOK: TButton
    Left = 173
    Top = 172
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 7
  end
  object btnCancel: TButton
    Left = 253
    Top = 172
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 8
  end
  object cbVikno: TComboBox
    Left = 100
    Top = 44
    Width = 345
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'cbVikno'
  end
  object btnVikno_Update: TButton
    Left = 448
    Top = 44
    Width = 21
    Height = 21
    Action = aVikno_Update
    TabOrder = 2
  end
  object btnVikno_Choice: TButton
    Left = 472
    Top = 44
    Width = 21
    Height = 21
    Action = aVikno_Choice
    TabOrder = 3
  end
  object alElementiVikonEdit: TActionList
    Left = 296
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
    object aVikno_Update: TAction
      Caption = '@'
      OnExecute = aVikno_UpdateExecute
    end
    object aVikno_Choice: TAction
      Caption = '...'
      OnExecute = aVikno_ChoiceExecute
    end
  end
  object qElementiVikonEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 364
    Top = 8
  end
end
