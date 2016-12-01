object frmFilter: TfrmFilter
  Left = 689
  Top = 140
  Width = 473
  Height = 145
  Caption = 'frmFilter'
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
  object lblFilter: TLabel
    Left = 12
    Top = 12
    Width = 32
    Height = 13
    Caption = 'lblFilter'
  end
  object btnFilter_Choice: TButton
    Left = 432
    Top = 36
    Width = 21
    Height = 21
    Action = aChoice
    TabOrder = 0
  end
  object btnVikonati: TButton
    Left = 153
    Top = 72
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 1
  end
  object btnVidminiti: TButton
    Left = 233
    Top = 72
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 2
  end
  object btnFilter_Update: TButton
    Left = 408
    Top = 36
    Width = 21
    Height = 21
    Action = aUpdate
    TabOrder = 3
  end
  object cbFilter: TComboBox
    Left = 12
    Top = 36
    Width = 393
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbFilter'
  end
  object alFirlter: TActionList
    Left = 148
    Top = 8
    object aChoice: TAction
      Caption = '...'
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = '@'
      OnExecute = aUpdateExecute
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
  object qFilter: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 328
    Top = 8
  end
end
