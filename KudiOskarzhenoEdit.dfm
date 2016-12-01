object frmKudiOskarzhenoEdit: TfrmKudiOskarzhenoEdit
  Left = 741
  Top = 579
  Width = 549
  Height = 148
  Caption = 'frmKudiOskarzhenoEdit'
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
    Width = 76
    Height = 13
    Caption = #1050#1086#1076' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 89
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
  end
  object edtKodOrganizacii: TEdit
    Left = 108
    Top = 12
    Width = 121
    Height = 21
    MaxLength = 5
    TabOrder = 0
    Text = 'edtKodOrganizacii'
  end
  object edtNazvaOrganizacii: TEdit
    Left = 108
    Top = 44
    Width = 421
    Height = 21
    MaxLength = 150
    TabOrder = 1
    Text = 'edtNazvaOrganizacii'
  end
  object btnVikonati: TButton
    Left = 190
    Top = 76
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 2
  end
  object btnVidmina: TButton
    Left = 270
    Top = 76
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 3
  end
  object btnKodOrganizacii: TButton
    Left = 232
    Top = 12
    Width = 21
    Height = 21
    Action = aKodUpdate
    TabOrder = 4
  end
  object alKudiOskarzgenoEdit: TActionList
    Left = 276
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
      OnExecute = aCancelExecute
    end
  end
end
