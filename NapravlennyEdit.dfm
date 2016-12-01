object frmNapravlennyEdit: TfrmNapravlennyEdit
  Left = 835
  Top = 561
  Width = 445
  Height = 178
  Caption = 'frmNapravlennyEdit'
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
  object Label3: TLabel
    Left = 12
    Top = 44
    Width = 89
    Height = 13
    Caption = #1055'.'#1030'.'#1041'. '#1086#1090#1088#1080#1084#1091#1074#1072#1095#1072
  end
  object Label4: TLabel
    Left = 12
    Top = 76
    Width = 100
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072' '#1086#1090#1088#1080#1084#1091#1074#1072#1095#1072
  end
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object edtPIB_Otrimuvacha: TEdit
    Left = 116
    Top = 44
    Width = 309
    Height = 21
    TabOrder = 2
    Text = 'edtPIB_Otrimuvacha'
  end
  object btnVikonati: TButton
    Left = 141
    Top = 108
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnVidminiti: TButton
    Left = 221
    Top = 108
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object edtKod: TEdit
    Left = 116
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKod'
  end
  object btnKod: TButton
    Left = 240
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object cbPosadaOtrimuvacha: TComboBox
    Left = 120
    Top = 76
    Width = 257
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'cbPosadaOtrimuvacha'
  end
  object btnPosadaOtrimuvacha_Update: TButton
    Left = 380
    Top = 76
    Width = 21
    Height = 21
    Action = aPosadaOtrimuvacha_Update
    TabOrder = 4
  end
  object btnPosadaOtrimuvacha_Choice: TButton
    Left = 404
    Top = 76
    Width = 21
    Height = 21
    Action = aPosadaOtrimuvacha_Choice
    TabOrder = 5
  end
  object alNapravlennyEdit: TActionList
    Left = 340
    Top = 12
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aPosadaOtrimuvacha_Update: TAction
      Caption = '@'
      OnExecute = aPosadaOtrimuvacha_UpdateExecute
    end
    object aPosadaOtrimuvacha_Choice: TAction
      Caption = '...'
      OnExecute = aPosadaOtrimuvacha_ChoiceExecute
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
  object qUpdates: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 40
    Top = 100
  end
end
