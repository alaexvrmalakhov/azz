object frmLaboratornijKontrol: TfrmLaboratornijKontrol
  Left = 781
  Top = 91
  Width = 499
  Height = 236
  Caption = 'frmLaboratornijKontrol'
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
    Top = 72
    Width = 71
    Height = 13
    Caption = #1042#1080#1076' '#1082#1086#1085#1090#1088#1086#1083#1102
  end
  object Label2: TLabel
    Left = 12
    Top = 104
    Width = 108
    Height = 13
    Caption = #1053#1086#1084#1077#1088' ('#1085#1086#1084#1077#1088#1080') '#1087#1088#1086#1073
  end
  object Label3: TLabel
    Left = 12
    Top = 136
    Width = 78
    Height = 13
    Caption = #1044#1072#1090#1072' '#1082#1086#1085#1090#1088#1086#1083#1102
  end
  object Label4: TLabel
    Left = 120
    Top = 8
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label5: TLabel
    Left = 308
    Top = 8
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label6: TLabel
    Left = 12
    Top = 8
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object btnVidKontrolu_Choice: TButton
    Left = 460
    Top = 72
    Width = 21
    Height = 21
    Action = aVidKontrolu_Choice
    TabOrder = 8
  end
  object edtNomeriProb: TEdit
    Left = 132
    Top = 104
    Width = 349
    Height = 21
    MaxLength = 50
    TabOrder = 9
    Text = 'edtNomeriProb'
  end
  object btnVikonati: TButton
    Left = 168
    Top = 168
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 11
  end
  object btnVidminiti: TButton
    Left = 248
    Top = 168
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 12
  end
  object edtNomerPostanovi: TEdit
    Left = 192
    Top = 8
    Width = 109
    Height = 21
    Color = cl3DLight
    Enabled = False
    MaxLength = 10
    TabOrder = 1
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 396
    Top = 8
    Width = 85
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.5542625116
    Time = 39280.5542625116
    Color = cl3DLight
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
  end
  object dtpDataKontrolu: TDateTimePicker
    Left = 132
    Top = 136
    Width = 349
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.5548054051
    Time = 39280.5548054051
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 10
  end
  object cbVidKontrolu: TComboBox
    Left = 132
    Top = 72
    Width = 301
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cbVidKontrolu'
  end
  object btnVidKontrolu_Update: TButton
    Left = 436
    Top = 72
    Width = 21
    Height = 21
    Action = aVidKontrolu_Update
    TabOrder = 7
  end
  object edtKod: TEdit
    Left = 40
    Top = 8
    Width = 77
    Height = 21
    Color = cl3DLight
    Enabled = False
    TabOrder = 0
    Text = 'edtKod'
  end
  object cbMinistry: TComboBox
    Left = 12
    Top = 40
    Width = 153
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 3
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 168
    Top = 40
    Width = 153
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 324
    Top = 40
    Width = 153
    Height = 21
    Enabled = False
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbDistrict'
  end
  object alLaboratornijKontrol: TActionList
    Left = 44
    Top = 144
    object aKodUpdate: TAction
      Caption = 'aKodUpdate'
      OnExecute = aKodUpdateExecute
    end
    object aVidKontrolu_Update: TAction
      Caption = '@'
      OnExecute = aVidKontrolu_UpdateExecute
    end
    object aVidKontrolu_Choice: TAction
      Caption = '...'
      OnExecute = aVidKontrolu_ChoiceExecute
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
  object qID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 356
    Top = 148
  end
end
