object frmChoiceVariable: TfrmChoiceVariable
  Left = 444
  Top = 158
  Width = 669
  Height = 374
  Caption = 'frmChoiceVariable'
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
  object pcChoiceVariable: TPageControl
    Left = 12
    Top = 12
    Width = 637
    Height = 293
    ActivePage = tsInit
    TabIndex = 1
    TabOrder = 0
    object tsField: TTabSheet
      Caption = 'tsField'
      object Label1: TLabel
        Left = 4
        Top = 4
        Width = 43
        Height = 13
        Caption = #1058#1072#1073#1083#1080#1094#1103
      end
      object cbTablesList: TComboBox
        Left = 52
        Top = 4
        Width = 549
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cbTablesList'
        OnChange = aUpdateFieldsListExecute
      end
      object btnUpdateTablesList: TButton
        Left = 604
        Top = 4
        Width = 21
        Height = 21
        Action = aUpdateTablesList
        TabOrder = 1
      end
      object dbgFields: TDBGrid
        Left = 4
        Top = 28
        Width = 621
        Height = 233
        DataSource = dsFields
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 2
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
          end
          item
            Expanded = False
            Visible = True
          end>
      end
    end
    object tsInit: TTabSheet
      Caption = 'tsInit'
      ImageIndex = 1
      object tvInit: TTreeView
        Left = 0
        Top = 0
        Width = 629
        Height = 265
        Align = alClient
        Indent = 19
        TabOrder = 0
      end
    end
  end
  object btnOK: TButton
    Left = 216
    Top = 312
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 292
    Top = 312
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 2
  end
  object btnUpdate: TButton
    Left = 371
    Top = 312
    Width = 75
    Height = 25
    Action = aUpdate
    TabOrder = 3
  end
  object alChoiceVariable: TActionList
    Left = 520
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateExecute
    end
    object aUpdateTablesList: TAction
      Caption = '@'
      OnExecute = aUpdateTablesListExecute
    end
    object aUpdateFieldsList: TAction
      Caption = 'aUpdateFieldsList'
      OnExecute = aUpdateFieldsListExecute
    end
    object aUpdateInitList: TAction
      Caption = 'aUpdateInitList'
      OnExecute = aUpdateInitListExecute
    end
  end
  object dsFields: TDataSource
    DataSet = qFields
    Left = 232
    Top = 12
  end
  object qFields: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 260
    Top = 12
  end
  object qChoiceVariable: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 176
    Top = 20
  end
end
