object frmStattiEdit: TfrmStattiEdit
  Left = 704
  Top = 357
  Width = 576
  Height = 383
  Caption = 'frmStattiEdit'
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
    Top = 12
    Width = 51
    Height = 13
    Caption = #1050#1086#1076' '#1089#1090#1072#1090#1090#1110
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 66
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1089#1090#1072#1090#1090#1110
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 166
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object Label4: TLabel
    Left = 12
    Top = 108
    Width = 164
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1085#1086#1088#1084#1072#1090#1080#1074#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 140
    Width = 545
    Height = 165
    Caption = #1058#1077#1082#1089#1090' '#1089#1090#1072#1090#1090#1110
    TabOrder = 4
    object reTekstStatti: TRichEdit
      Left = 2
      Top = 15
      Width = 541
      Height = 118
      Align = alTop
      Lines.Strings = (
        'reTekstStatti')
      MaxLength = -1
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object btnZavantazhiti: TButton
      Left = 193
      Top = 136
      Width = 158
      Height = 25
      Action = aLoad
      TabOrder = 1
    end
  end
  object edtKodStatti: TEdit
    Left = 192
    Top = 12
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodStatti'
  end
  object edtNomerStatti: TEdit
    Left = 192
    Top = 44
    Width = 121
    Height = 21
    MaxLength = 25
    TabOrder = 1
    Text = 'edtNomerStatti'
  end
  object edtNomNormativDokumenta: TEdit
    Left = 192
    Top = 76
    Width = 121
    Height = 21
    MaxLength = 25
    TabOrder = 2
    Text = 'edtNomNormativDokumenta'
  end
  object edtNazvaNormativDokumenta: TEdit
    Left = 192
    Top = 108
    Width = 365
    Height = 21
    MaxLength = 250
    TabOrder = 3
    Text = 'edtNazvaNormativDokumenta'
  end
  object btnVikonati: TButton
    Left = 206
    Top = 316
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 5
  end
  object btnVidmina: TButton
    Left = 286
    Top = 316
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 6
  end
  object btnKodStatti: TButton
    Left = 316
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 7
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.txt'
    Filter = #1042#1089#1110' '#1092#1072#1081#1083#1080' (*.*)|*.*|'#1058#1077#1082#1089#1090#1086#1074#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1080' (*.txt)|*.txt'
    FilterIndex = 0
    Left = 44
    Top = 276
  end
  object alStattiEdit: TActionList
    Left = 376
    Top = 24
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aLoad: TAction
      Caption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080
      OnExecute = aLoadExecute
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
end
