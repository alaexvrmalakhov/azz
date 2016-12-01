object frmDataTablesEdit: TfrmDataTablesEdit
  Left = 212
  Top = 31
  Width = 462
  Height = 458
  Caption = 'frmDataTablesEdit'
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
    Width = 49
    Height = 13
    Caption = 'Record ID'
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 72
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1090#1072#1073#1083#1080#1094#1110
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 100
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1090#1072#1073#1083#1080#1094#1110' '#1074' '#1041#1044
  end
  object edtRecord_ID: TEdit
    Left = 68
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object edtTableName: TEdit
    Left = 92
    Top = 44
    Width = 349
    Height = 21
    TabOrder = 1
    Text = 'edtTableName'
  end
  object edtDBTableName: TEdit
    Left = 120
    Top = 76
    Width = 321
    Height = 21
    TabOrder = 2
    Text = 'edtDBTableName'
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 108
    Width = 429
    Height = 269
    TabOrder = 3
    object Panel1: TPanel
      Left = 2
      Top = 242
      Width = 425
      Height = 25
      Align = alBottom
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object btnAdd: TButton
        Left = 55
        Top = 0
        Width = 75
        Height = 25
        Action = aAddField
        TabOrder = 0
      end
      object btnEdit: TButton
        Left = 135
        Top = 0
        Width = 75
        Height = 25
        Action = aEditField
        TabOrder = 1
      end
      object btnDelete: TButton
        Left = 215
        Top = 0
        Width = 75
        Height = 25
        Action = aDeleteField
        TabOrder = 2
      end
      object btnUpdate: TButton
        Left = 295
        Top = 0
        Width = 75
        Height = 25
        Action = aUpdateFields
        TabOrder = 3
      end
    end
    object DBGrid1: TDBGrid
      Left = 12
      Top = 16
      Width = 389
      Height = 93
      DataSource = dsDataFields
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FIELDNAME'
          Title.Caption = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DBFIELDNAME'
          Title.Caption = #1053#1072#1079#1074#1072' '#1087#1086#1083#1103' '#1074' '#1041#1044
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 2
      Top = 213
      Width = 425
      Height = 29
      Align = alBottom
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 2
      object lblDBFieldName: TDBText
        Left = 4
        Top = 0
        Width = 417
        Height = 13
        DataField = 'DBFIELDNAME'
        DataSource = dsDataFields
      end
      object lblDlina: TDBText
        Left = 196
        Top = 16
        Width = 73
        Height = 13
        Color = clBtnFace
        DataField = 'DLINA'
        DataSource = dsDataFields
        ParentColor = False
      end
      object lblTochnost: TDBText
        Left = 272
        Top = 16
        Width = 73
        Height = 13
        Color = clBtnFace
        DataField = 'TOCHNOST'
        DataSource = dsDataFields
        ParentColor = False
      end
      object lblTip: TLabel
        Left = 4
        Top = 16
        Width = 189
        Height = 13
        AutoSize = False
        Caption = 'lblTip'
        Color = clBtnFace
        ParentColor = False
      end
      object lblPodtip: TLabel
        Left = 348
        Top = 16
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'lblPodtip'
        Color = clBtnFace
        ParentColor = False
      end
    end
  end
  object btnOK: TButton
    Left = 149
    Top = 388
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 229
    Top = 388
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 5
  end
  object alDataTablesEdit: TActionList
    Left = 308
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aAddField: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddFieldExecute
    end
    object aEditField: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditFieldExecute
    end
    object aDeleteField: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteFieldExecute
    end
    object aUpdateFields: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateFieldsExecute
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
  object dsDataFields: TDataSource
    DataSet = qDataFields
    Left = 208
    Top = 156
  end
  object qDataFields: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    AfterScroll = qDataFieldsAfterScroll
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select * from DATAFIELDS,DATATYPES where DATATYPES.RECORD_ID=DAT' +
        'AFIELDS.DATATYPE')
    Left = 236
    Top = 156
  end
  object qDataTablesEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 204
    Top = 12
  end
end
