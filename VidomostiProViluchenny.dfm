object frmVidomostiProViluchenny: TfrmVidomostiProViluchenny
  Left = 628
  Top = 65
  Width = 653
  Height = 290
  Caption = 'frmVidomostiProViluchenny'
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
  object Label36: TLabel
    Left = 12
    Top = 188
    Width = 125
    Height = 13
    Caption = #1042#1080#1088#1086#1073#1085#1080#1082', '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
  end
  object lblT: TLabel
    Left = 625
    Top = 164
    Width = 5
    Height = 13
    Caption = #1090
  end
  object lblZagalnaVaga: TLabel
    Left = 12
    Top = 160
    Width = 74
    Height = 13
    Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1075#1072
  end
  object lblVagaOdinici: TLabel
    Left = 12
    Top = 132
    Width = 65
    Height = 13
    Caption = #1042#1072#1075#1072' '#1086#1076#1080#1085#1080#1094#1110
  end
  object Label33: TLabel
    Left = 12
    Top = 104
    Width = 83
    Height = 13
    Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1090#1086#1074#1072#1088#1091
  end
  object Label31: TLabel
    Left = 12
    Top = 76
    Width = 112
    Height = 13
    Caption = #1053#1072#1081#1084#1077#1085#1091#1074#1072#1085#1085#1103' '#1090#1086#1074#1072#1088#1091
  end
  object Label1: TLabel
    Left = 12
    Top = 44
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label2: TLabel
    Left = 216
    Top = 44
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object lblKG: TLabel
    Left = 324
    Top = 164
    Width = 11
    Height = 13
    Caption = #1082#1075
  end
  object Label3: TLabel
    Left = 444
    Top = 44
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object edtZagalnaVaga_T: TEdit
    Left = 360
    Top = 160
    Width = 261
    Height = 21
    TabOrder = 7
    Text = 'edtZagalnaVaga_T'
  end
  object edtZagalnaVaga_KG: TEdit
    Left = 92
    Top = 160
    Width = 229
    Height = 21
    TabOrder = 6
    Text = 'edtZagalnaVaga_KG'
  end
  object edtVagaOdinici: TEdit
    Left = 84
    Top = 132
    Width = 453
    Height = 21
    TabOrder = 4
    Text = 'edtVagaOdinici'
  end
  object cbOdinicyVimiru: TComboBox
    Left = 540
    Top = 132
    Width = 93
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbOdinicyVimiru'
    OnChange = aOdiniciVimiruChangeExecute
  end
  object edtKilkistTovaru: TEdit
    Left = 104
    Top = 104
    Width = 529
    Height = 21
    TabOrder = 3
    Text = 'edtKilkistTovaru'
  end
  object edtNajmenuvannyTovaru: TEdit
    Left = 132
    Top = 76
    Width = 501
    Height = 21
    TabOrder = 2
    Text = 'edtNajmenuvannyTovaru'
  end
  object btnVikonati: TButton
    Left = 243
    Top = 220
    Width = 75
    Height = 25
    Caption = #1042#1080#1082#1086#1085#1072#1090#1080
    Default = True
    TabOrder = 8
    OnClick = btnVikonatiClick
  end
  object btnVidminiti: TButton
    Left = 323
    Top = 220
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    TabOrder = 9
    OnClick = btnVidminitiClick
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object edtDataPostanovi: TEdit
    Left = 304
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 1
    Text = 'edtDataPostanovi'
  end
  object edtRecordID: TEdit
    Left = 496
    Top = 44
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 10
    Text = 'edtRecordID'
  end
  object cbVirobnik: TComboBox
    Left = 144
    Top = 188
    Width = 441
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = 'cbVirobnik'
  end
  object btnVirobnik_Update: TButton
    Left = 588
    Top = 188
    Width = 21
    Height = 21
    Action = aVirobnikUpdate
    TabOrder = 12
  end
  object btnVirobnik_Choice: TButton
    Left = 612
    Top = 188
    Width = 21
    Height = 21
    Action = aVirobnikChoice
    TabOrder = 13
  end
  object cbMinistry: TComboBox
    Left = 12
    Top = 12
    Width = 205
    Height = 21
    ItemHeight = 13
    TabOrder = 14
    Text = 'cbMinistry'
  end
  object cbTeritory: TComboBox
    Left = 220
    Top = 12
    Width = 205
    Height = 21
    ItemHeight = 13
    TabOrder = 15
    Text = 'cbTeritory'
  end
  object cbDistrict: TComboBox
    Left = 428
    Top = 12
    Width = 205
    Height = 21
    ItemHeight = 13
    TabOrder = 16
    Text = 'cbDistrict'
  end
  object alVidomostiProViluchenny: TActionList
    Left = 28
    Top = 208
    object aRecordID_Update: TAction
      Caption = 'aRecordID_Update'
      OnExecute = aRecordID_UpdateExecute
    end
    object aOdiniciVimiruUpdate: TAction
      Caption = 'aOdiniciVimiruUpdate'
      OnExecute = aOdiniciVimiruUpdateExecute
    end
    object aOdiniciVimiruChange: TAction
      Caption = 'aOdiniciVimiruChange'
      OnExecute = aOdiniciVimiruChangeExecute
    end
    object aVirobnikUpdate: TAction
      Caption = '@'
      OnExecute = aVirobnikUpdateExecute
    end
    object aVirobnikChoice: TAction
      Caption = '...'
      OnExecute = aVirobnikChoiceExecute
    end
  end
  object qRecord_ID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 112
    Top = 212
  end
end
