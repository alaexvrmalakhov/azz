object frmOrganizaciiEdit: TfrmOrganizaciiEdit
  Left = 747
  Top = 498
  Width = 533
  Height = 242
  Caption = 'frmOrganizaciiEdit'
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
    Width = 76
    Height = 13
    Caption = #1050#1086#1076' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
  end
  object Label2: TLabel
    Left = 12
    Top = 76
    Width = 89
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1086#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
  end
  object Label3: TLabel
    Left = 12
    Top = 108
    Width = 71
    Height = 13
    Caption = #1055#1086#1089#1072#1076#1072' '#1086#1089#1086#1073#1080
  end
  object Label4: TLabel
    Left = 12
    Top = 140
    Width = 82
    Height = 13
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1086#1089#1086#1073#1080
  end
  object Label5: TLabel
    Left = 12
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Record ID'
  end
  object edtKodOrganizacii: TEdit
    Left = 108
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtKodOrganizacii'
  end
  object btnKodOrganizacii: TButton
    Left = 236
    Top = 44
    Width = 21
    Height = 21
    Action = aKodOrganizaciiUpdate
    TabOrder = 2
  end
  object edtNazvaOrganizacii: TEdit
    Left = 108
    Top = 76
    Width = 405
    Height = 21
    TabOrder = 3
    Text = 'edtNazvaOrganizacii'
  end
  object edtPosadaOsobi: TEdit
    Left = 108
    Top = 108
    Width = 405
    Height = 21
    TabOrder = 4
    Text = 'edtPosadaOsobi'
  end
  object edtPIBOsobi: TEdit
    Left = 108
    Top = 140
    Width = 405
    Height = 21
    TabOrder = 5
    Text = 'edtPIBOsobi'
  end
  object btnVikonati: TButton
    Left = 185
    Top = 172
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 6
  end
  object btnVidminiti: TButton
    Left = 265
    Top = 172
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 7
  end
  object edtRecord_ID: TEdit
    Left = 68
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object alOrganizaciiEdit: TActionList
    Left = 340
    Top = 8
    object aRecord_ID_Update: TAction
      Caption = 'aRecord_ID_Update'
      OnExecute = aRecord_ID_UpdateExecute
    end
    object aKodOrganizaciiUpdate: TAction
      Caption = '...'
      OnExecute = aKodOrganizaciiUpdateExecute
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
  object qID: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 428
    Top = 16
  end
end
