object frmPrintForm: TfrmPrintForm
  Left = 554
  Top = 106
  Width = 367
  Height = 117
  Caption = 'frmPrintForm'
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
  object cbReportList: TComboBox
    Left = 16
    Top = 16
    Width = 281
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'cbReportList'
  end
  object btnUpdateReportList: TButton
    Left = 300
    Top = 16
    Width = 21
    Height = 21
    Action = aUpdateReportList
    TabOrder = 1
  end
  object btnChoiceReportList: TButton
    Left = 324
    Top = 16
    Width = 21
    Height = 21
    Action = aChoiceReportList
    TabOrder = 2
  end
  object btnPrint: TButton
    Left = 102
    Top = 52
    Width = 75
    Height = 25
    Action = aPrint
    Default = True
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 182
    Top = 52
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object alPrint: TActionList
    Left = 12
    Top = 40
    object aUpdateReportList: TAction
      Caption = '@'
      OnExecute = aUpdateReportListExecute
    end
    object aChoiceReportList: TAction
      Caption = '...'
      OnExecute = aChoiceReportListExecute
    end
    object aPrint: TAction
      Caption = #1044#1088#1091#1082
      OnExecute = aPrintExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
  end
  object qPrint: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 44
    Top = 44
  end
end
