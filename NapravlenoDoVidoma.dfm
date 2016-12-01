object frmNapravlenoDoVidoma: TfrmNapravlenoDoVidoma
  Left = 756
  Top = 155
  Width = 503
  Height = 242
  Caption = 'frmNapravlenoDoVidoma'
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
    Top = 44
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label2: TLabel
    Left = 200
    Top = 44
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 89
    Height = 13
    Caption = #1055'.'#1030'.'#1041'. '#1086#1090#1088#1080#1084#1091#1074#1072#1095#1072
  end
  object Label4: TLabel
    Left = 12
    Top = 108
    Width = 100
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072' '#1086#1090#1088#1080#1084#1091#1074#1072#1095#1072
  end
  object Label5: TLabel
    Left = 12
    Top = 140
    Width = 95
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1085#1103
  end
  object Label6: TLabel
    Left = 380
    Top = 44
    Width = 11
    Height = 13
    Caption = 'ID'
    Enabled = False
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 44
    Width = 105
    Height = 21
    Color = clBtnHighlight
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 288
    Top = 44
    Width = 81
    Height = 21
    CalAlignment = dtaLeft
    Date = 39458.9769894676
    Time = 39458.9769894676
    Color = clBtnHighlight
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object dtpDataNapravlenny: TDateTimePicker
    Left = 116
    Top = 140
    Width = 101
    Height = 21
    CalAlignment = dtaLeft
    Date = 39458.9773039583
    Time = 39458.9773039583
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 9
  end
  object btnVikonati: TButton
    Left = 170
    Top = 172
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 10
  end
  object btnVidminiti: TButton
    Left = 250
    Top = 172
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 11
  end
  object edtKod: TEdit
    Left = 400
    Top = 44
    Width = 81
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtKod'
  end
  object cbPIB_Otrimuvacha: TComboBox
    Left = 116
    Top = 76
    Width = 317
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'cbPIB_Otrimuvacha'
    OnChange = aPIBOtrimuvacha_ChangeExecute
  end
  object btnPIB_Otrimuvacha_Update: TButton
    Left = 436
    Top = 76
    Width = 21
    Height = 21
    Action = aPIBOtrimuvacha_Update
    TabOrder = 4
  end
  object btnPIB_Otrimuvacha_Choice: TButton
    Left = 460
    Top = 76
    Width = 21
    Height = 21
    Action = aPIBOtrimuvacha_Choice
    TabOrder = 5
  end
  object cbPosadaOtrimuvacha: TComboBox
    Left = 116
    Top = 108
    Width = 317
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = 'cbPosadaOtrimuvacha'
  end
  object btnPosadaOtrimuvacha_Update: TButton
    Left = 436
    Top = 108
    Width = 21
    Height = 21
    Action = aPosadaOtrimuvacha_Update
    TabOrder = 7
  end
  object btnPosadaOtrimuvacha_Choice: TButton
    Left = 460
    Top = 108
    Width = 21
    Height = 21
    Action = aPosadaOtrimuvacha_Choice
    TabOrder = 8
  end
  object cbMinistry: TComboBox
    Left = 12
    Top = 12
    Width = 153
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 168
    Top = 12
    Width = 157
    Height = 21
    ItemHeight = 13
    TabOrder = 13
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 328
    Top = 12
    Width = 157
    Height = 21
    ItemHeight = 13
    TabOrder = 14
    Text = 'cbDistrict'
  end
  object qID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 372
    Top = 156
  end
  object alNapravlenoDoVidoma: TActionList
    Left = 48
    Top = 164
    object aPIBOtrimuvacha_Change: TAction
      Caption = 'aPIBOtrimuvacha_Change'
      OnExecute = aPIBOtrimuvacha_ChangeExecute
    end
    object aPIBOtrimuvacha_Update: TAction
      Caption = '@'
      OnExecute = aPIBOtrimuvacha_UpdateExecute
    end
    object aPIBOtrimuvacha_Choice: TAction
      Caption = '...'
      OnExecute = aPIBOtrimuvacha_ChoiceExecute
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
    object aKodUpdate: TAction
      Caption = 'aKodUpdate'
      OnExecute = aKodUpdateExecute
    end
  end
end
