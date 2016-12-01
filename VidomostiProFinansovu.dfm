object frmVidomostiProFinansovu: TfrmVidomostiProFinansovu
  Left = 621
  Top = 23
  Width = 664
  Height = 308
  Caption = 'frmVidomostiProFinansovu'
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
  object Label15: TLabel
    Left = 12
    Top = 76
    Width = 112
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1091
  end
  object Label16: TLabel
    Left = 12
    Top = 140
    Width = 83
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1074#1072#1088#1091
  end
  object Label17: TLabel
    Left = 12
    Top = 172
    Width = 63
    Height = 13
    Caption = #1062#1110#1085#1072' '#1086#1076#1080#1085#1080#1094#1110
  end
  object Label24: TLabel
    Left = 216
    Top = 172
    Width = 50
    Height = 13
    Caption = #1087#1088#1086#1087#1080#1089#1086#1084
  end
  object Label18: TLabel
    Left = 12
    Top = 204
    Width = 71
    Height = 13
    Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1094#1110#1085#1072
  end
  object Label25: TLabel
    Left = 216
    Top = 204
    Width = 50
    Height = 13
    Caption = #1087#1088#1086#1087#1080#1089#1086#1084
  end
  object Label4: TLabel
    Left = 12
    Top = 44
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label5: TLabel
    Left = 236
    Top = 44
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label6: TLabel
    Left = 436
    Top = 44
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object Label1: TLabel
    Left = 12
    Top = 108
    Width = 49
    Height = 13
    Caption = #1042#1080#1088#1086#1073#1085#1080#1082
  end
  object edtNajmenuvannyTovaru: TEdit
    Left = 132
    Top = 76
    Width = 513
    Height = 21
    TabOrder = 3
    Text = 'edtNajmenuvannyTovaru'
  end
  object edtKilkistTovaru: TEdit
    Left = 104
    Top = 140
    Width = 437
    Height = 21
    TabOrder = 7
    Text = 'edtKilkistTovaru'
  end
  object edtCinaOdinici: TEdit
    Left = 88
    Top = 172
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'edtCinaOdinici'
    OnExit = edtCinaOdiniciExit
  end
  object edtCinaOdiniciPropisom: TEdit
    Left = 272
    Top = 172
    Width = 349
    Height = 21
    TabOrder = 10
    Text = 'edtCinaOdiniciPropisom'
  end
  object btnCinaOdinici: TButton
    Left = 624
    Top = 172
    Width = 21
    Height = 21
    Action = aCinaOdiniciPropisomUpdate
    TabOrder = 11
  end
  object edtZagalnaCina: TEdit
    Left = 88
    Top = 204
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'edtZagalnaCina'
    OnClick = edtZagalnaCinaClick
    OnExit = edtZagalnaCinaExit
  end
  object edtZagalnaCinaPropisom: TEdit
    Left = 272
    Top = 204
    Width = 349
    Height = 21
    TabOrder = 13
    Text = 'edtZagalnaCinaPropisom'
  end
  object btnZagalnaCina: TButton
    Left = 624
    Top = 204
    Width = 21
    Height = 21
    Action = aZagalnaCinaUpdate
    TabOrder = 14
  end
  object btnVikonati: TButton
    Left = 251
    Top = 240
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 15
  end
  object btnVidminiti: TButton
    Left = 331
    Top = 240
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 16
  end
  object cbOdiniciVimiru: TComboBox
    Left = 548
    Top = 140
    Width = 97
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    Text = 'cbOdiniciVimiru'
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 324
    Top = 44
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 40469.6353265972
    Time = 40469.6353265972
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtRecordID: TEdit
    Left = 492
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtRecordID'
  end
  object cbVirobnik: TComboBox
    Left = 68
    Top = 108
    Width = 529
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbVirobnik'
  end
  object btnVirobnikUpdate: TButton
    Left = 600
    Top = 108
    Width = 21
    Height = 21
    Action = aVirobnikUpdate
    TabOrder = 5
  end
  object btnVirobnikChoice: TButton
    Left = 624
    Top = 108
    Width = 21
    Height = 21
    Action = aVirobnikChoice
    TabOrder = 6
  end
  object cbMinistry: TComboBox
    Left = 12
    Top = 12
    Width = 209
    Height = 21
    ItemHeight = 13
    TabOrder = 17
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 224
    Top = 12
    Width = 209
    Height = 21
    ItemHeight = 13
    TabOrder = 18
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 436
    Top = 12
    Width = 209
    Height = 21
    ItemHeight = 13
    TabOrder = 19
    Text = 'cbDistrict'
  end
  object alVidomostiProFinansovu: TActionList
    Left = 52
    Top = 220
    object aUpdateNomerDataPostanovi: TAction
      Caption = 'aUpdateNomerDataPostanovi'
      OnExecute = aUpdateNomerDataPostanoviExecute
    end
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aVirobnikUpdate: TAction
      Caption = '@'
      OnExecute = aVirobnikUpdateExecute
    end
    object aVirobnikChoice: TAction
      Caption = '...'
      OnExecute = aVirobnikChoiceExecute
    end
    object aOdiniciVimiruUpdate: TAction
      Caption = 'aOdiniciVimiruUpdate'
      OnExecute = aOdiniciVimiruUpdateExecute
    end
    object aCinaOdiniciPropisomUpdate: TAction
      Caption = '...'
      OnExecute = aCinaOdiniciPropisomUpdateExecute
    end
    object aZagalnaCinaUpdate: TAction
      Caption = '...'
      OnExecute = aZagalnaCinaUpdateExecute
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
  object qVidomostiProFinansovu: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 16
    Top = 220
  end
end
