object frmKoristuvachiEdit: TfrmKoristuvachiEdit
  Left = 609
  Top = 37
  Width = 482
  Height = 251
  Caption = 'frmKoristuvachiEdit'
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
  object Bevel1: TBevel
    Left = 12
    Top = 36
    Width = 449
    Height = 137
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 85
    Height = 13
    Caption = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  end
  object Label3: TLabel
    Left = 16
    Top = 76
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label4: TLabel
    Left = 16
    Top = 108
    Width = 118
    Height = 13
    Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1085#1103' '#1087#1072#1088#1086#1083#1102
  end
  object Label8: TLabel
    Left = 16
    Top = 144
    Width = 64
    Height = 13
    Caption = #1057#1087#1110#1074#1088#1086#1073#1110#1090#1085#1080#1082
  end
  object edtMinistry: TEdit
    Left = 4
    Top = 4
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtMinistry'
  end
  object edtTeritory: TEdit
    Left = 132
    Top = 4
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'edtTeritory'
  end
  object edtDistrict: TEdit
    Left = 260
    Top = 4
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtDistrict'
  end
  object edtRecord_ID: TEdit
    Left = 388
    Top = 4
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 3
    Text = 'edtRecord_ID'
  end
  object edtLogin: TEdit
    Left = 116
    Top = 40
    Width = 341
    Height = 21
    TabOrder = 4
    Text = 'edtLogin'
  end
  object edtPassword: TEdit
    Left = 140
    Top = 76
    Width = 317
    Height = 21
    TabOrder = 5
    Text = 'edtPassword'
  end
  object edtPasswordConfirm: TEdit
    Left = 140
    Top = 108
    Width = 317
    Height = 21
    TabOrder = 6
    Text = 'edtPasswordConfirm'
  end
  object btnPIB_Choice: TButton
    Left = 436
    Top = 144
    Width = 21
    Height = 21
    Action = aPIB_Choice
    TabOrder = 9
  end
  object btnOK: TButton
    Left = 159
    Top = 184
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 10
  end
  object btnCancel: TButton
    Left = 239
    Top = 184
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 11
  end
  object cbPIB: TComboBox
    Left = 84
    Top = 144
    Width = 325
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbPIB'
  end
  object btnPIB_Update: TButton
    Left = 412
    Top = 144
    Width = 21
    Height = 21
    Action = aPIB_Update
    TabOrder = 8
  end
  object alKoristuvachiEdit: TActionList
    Left = 44
    Top = 176
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aPIB_Update: TAction
      Caption = '@'
      OnExecute = aPIB_UpdateExecute
    end
    object aPIB_Choice: TAction
      Caption = '...'
      OnExecute = aPIB_ChoiceExecute
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
  object qUpdate: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 8
    Top = 176
  end
end
