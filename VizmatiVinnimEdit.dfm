object frmVizmatiVinnimEdit: TfrmVizmatiVinnimEdit
  Left = 718
  Top = 428
  Width = 562
  Height = 312
  Caption = 'frmVizmatiVinnimEdit'
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
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 83
    Height = 13
    Caption = #1042#1080#1079#1085#1072#1090#1080' '#1074#1080#1085#1085#1080#1084
  end
  object Label3: TLabel
    Left = 12
    Top = 44
    Width = 28
    Height = 13
    Caption = #1047#1084#1110#1089#1090
  end
  object btnVikonati: TButton
    Left = 199
    Top = 240
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnVidminiti: TButton
    Left = 279
    Top = 240
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object edtKodPoly: TEdit
    Left = 56
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKodPoly'
  end
  object reViznatiVinnim: TMemo
    Left = 12
    Top = 92
    Width = 529
    Height = 133
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'reViznatiVinnim')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object edtZmist: TEdit
    Left = 56
    Top = 44
    Width = 485
    Height = 21
    TabOrder = 2
    Text = 'edtZmist'
  end
  object btnKodPoly: TButton
    Left = 180
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object alViznatiVinnimEdit: TActionList
    Left = 360
    Top = 12
    object aKodUpdate: TAction
      Caption = '...'
      OnExecute = aKodUpdateExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      ShortCut = 27
      OnExecute = aCancelExecute
    end
  end
end
