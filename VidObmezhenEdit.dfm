object frmVidObmezhenEdit: TfrmVidObmezhenEdit
  Left = 835
  Top = 552
  Width = 445
  Height = 178
  Caption = 'frmVidObmezhenEdit'
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
    Width = 19
    Height = 13
    Caption = #1050#1086#1076
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 80
    Height = 13
    Caption = #1042#1080#1076' '#1086#1073#1084#1077#1078#1077#1085#1085#1103
  end
  object Label3: TLabel
    Left = 12
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Record ID'
    Enabled = False
  end
  object edtKodObmezhenny: TEdit
    Left = 100
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtKodObmezhenny'
  end
  object btnKodObmezhenny: TButton
    Left = 224
    Top = 44
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 1
  end
  object edtVidObmezhenny: TEdit
    Left = 100
    Top = 76
    Width = 325
    Height = 21
    TabOrder = 2
    Text = 'edtVidObmezhenny'
  end
  object btnVikonati: TButton
    Left = 141
    Top = 108
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 3
  end
  object btnVidminiti: TButton
    Left = 221
    Top = 108
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 4
  end
  object edtRecord_ID: TEdit
    Left = 72
    Top = 12
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'edtRecord_ID'
  end
  object alVidObmezhenEdit: TActionList
    Left = 312
    Top = 40
    object aRecord_ID_Update: TAction
      Caption = 'aRecord_ID_Update'
      OnExecute = aRecord_ID_UpdateExecute
    end
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
      OnExecute = aCancelExecute
    end
  end
end
