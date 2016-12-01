object frmZvitShtrafi: TfrmZvitShtrafi
  Left = 187
  Top = 17
  Width = 423
  Height = 310
  Caption = 'frmZvitShtrafi'
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
    Top = 176
    Width = 57
    Height = 13
    Caption = #1047#1072' '#1087#1077#1088#1110#1086#1076' '#1079
  end
  object Label2: TLabel
    Left = 240
    Top = 176
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object lblZagolovok: TLabel
    Left = 12
    Top = 208
    Width = 35
    Height = 13
    Caption = #1052#1110#1089#1103#1094#1100
  end
  object Bevel1: TBevel
    Left = 4
    Top = 4
    Width = 405
    Height = 85
    Shape = bsBottomLine
  end
  object edtZagolovok: TEdit
    Left = 76
    Top = 208
    Width = 325
    Height = 21
    MaxLength = 100
    TabOrder = 9
    Text = 'edtZagolovok'
  end
  object btnVikonati: TButton
    Left = 128
    Top = 240
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 10
  end
  object btnVidminiti: TButton
    Left = 208
    Top = 240
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 11
  end
  object dtpZaPeriodZ: TDateTimePicker
    Left = 76
    Top = 176
    Width = 149
    Height = 21
    CalAlignment = dtaLeft
    Date = 39281.0965603241
    Time = 39281.0965603241
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 7
  end
  object dtpZaPeriodPo: TDateTimePicker
    Left = 264
    Top = 176
    Width = 137
    Height = 21
    CalAlignment = dtaLeft
    Date = 39281.0970954398
    Time = 39281.0970954398
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 8
  end
  object rgTeritory: TRadioGroup
    Left = 12
    Top = 100
    Width = 389
    Height = 37
    Columns = 3
    Items.Strings = (
      #1052#1110#1085#1110#1089#1090#1077#1088#1089#1090#1074#1086
      #1058#1077#1088#1080#1090#1086#1088#1110#1103
      #1056#1072#1081#1086#1085)
    TabOrder = 3
    OnClick = rgTeritoryClick
  end
  object cbTeritory: TComboBox
    Left = 12
    Top = 148
    Width = 341
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbTeritory'
  end
  object btnTeritoryUpdate: TButton
    Left = 356
    Top = 148
    Width = 21
    Height = 21
    Action = aTeritoryUpdate
    TabOrder = 5
  end
  object btnTeritoryChoice: TButton
    Left = 380
    Top = 148
    Width = 21
    Height = 21
    Action = aTeritoryChoice
    TabOrder = 6
  end
  object edtMinistry: TEdit
    Left = 12
    Top = 12
    Width = 389
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtMinistry'
  end
  object edtTeritory: TEdit
    Left = 12
    Top = 36
    Width = 389
    Height = 21
    Enabled = False
    TabOrder = 1
    Text = 'edtTeritory'
  end
  object edtDistrict: TEdit
    Left = 12
    Top = 60
    Width = 389
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtDistrict'
  end
  object alZvitShtrafi: TActionList
    Left = 248
    Top = 20
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aTeritoryUpdate: TAction
      Caption = '@'
      OnExecute = aTeritoryUpdateExecute
    end
    object aTeritoryChoice: TAction
      Caption = '...'
    end
  end
  object qZvitSchomisychnij: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 328
    Top = 20
  end
end
