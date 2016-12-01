object frmOskarzhenny: TfrmOskarzhenny
  Left = 669
  Top = 105
  Width = 536
  Height = 211
  Caption = 'frmOskarzhenny'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 44
    Width = 91
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 83
    Height = 13
    Caption = #1050#1091#1076#1080' '#1086#1089#1082#1072#1088#1078#1077#1085#1086
  end
  object Label3: TLabel
    Left = 12
    Top = 108
    Width = 117
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1089#1082#1072#1088#1078#1077#1085#1085#1103
  end
  object Label4: TLabel
    Left = 12
    Top = 12
    Width = 67
    Height = 13
    Caption = #8470' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label5: TLabel
    Left = 200
    Top = 12
    Width = 82
    Height = 13
    Caption = #1044#1072#1090#1072' '#1087#1086#1089#1090#1072#1085#1086#1074#1080
    Enabled = False
  end
  object Label6: TLabel
    Left = 388
    Top = 12
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
    Enabled = False
  end
  object btnKudiOskarzheno_Update: TButton
    Left = 472
    Top = 76
    Width = 21
    Height = 21
    Action = aKudiOskarzheno_Update
    TabOrder = 5
  end
  object btnRezultatOskarzhenny_Update: TButton
    Left = 472
    Top = 108
    Width = 21
    Height = 21
    Action = aRezultatOskarzhenny_Update
    TabOrder = 8
  end
  object vrbVikonati: TButton
    Left = 187
    Top = 144
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 10
  end
  object btnVidminiti: TButton
    Left = 267
    Top = 144
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 11
  end
  object dtpDataOskarzhenny: TDateTimePicker
    Left = 140
    Top = 44
    Width = 186
    Height = 21
    CalAlignment = dtaLeft
    Date = 39280.9389480208
    Time = 39280.9389480208
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object cbKudiOskarzheno: TComboBox
    Left = 140
    Top = 76
    Width = 329
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Text = 'cbKudiOskarzheno'
  end
  object cbRezultatOskarzhenny: TComboBox
    Left = 140
    Top = 108
    Width = 329
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbRezultatOskarzhenny'
  end
  object edtNomerPostanovi: TEdit
    Left = 84
    Top = 12
    Width = 101
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'edtNomerPostanovi'
  end
  object dtpDataPostanovi: TDateTimePicker
    Left = 288
    Top = 12
    Width = 81
    Height = 21
    CalAlignment = dtaLeft
    Date = 40394.5695930903
    Time = 40394.5695930903
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtKod: TEdit
    Left = 412
    Top = 12
    Width = 101
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = 'edtKod'
  end
  object btnKudiOskarzheno_Choice: TButton
    Left = 496
    Top = 76
    Width = 21
    Height = 21
    Action = aKudiOskarzheno_Choice
    TabOrder = 6
  end
  object btnRezultatOskarzhenny_Choice: TButton
    Left = 496
    Top = 108
    Width = 21
    Height = 21
    Action = aRezultatOskarzhenny_Choice
    TabOrder = 9
  end
  object alOskarzhenny: TActionList
    Left = 48
    Top = 132
    object aKudiOskarzheno_Update: TAction
      Caption = '@'
      OnExecute = aKudiOskarzheno_UpdateExecute
    end
    object aKudiOskarzheno_Choice: TAction
      Caption = '...'
      OnExecute = aKudiOskarzheno_ChoiceExecute
    end
    object aRezultatOskarzhenny_Update: TAction
      Caption = '@'
      OnExecute = aRezultatOskarzhenny_UpdateExecute
    end
    object aRezultatOskarzhenny_Choice: TAction
      Caption = '...'
      OnExecute = aRezultatOskarzhenny_ChoiceExecute
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
  object qOskarzhenny: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 400
    Top = 44
  end
end
