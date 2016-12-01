object frmReportsEdit: TfrmReportsEdit
  Left = 315
  Top = 24
  Width = 489
  Height = 524
  Caption = 'frmReportsEdit'
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
    Width = 59
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1079#1074#1110#1090#1091
  end
  object Label3: TLabel
    Left = 12
    Top = 76
    Width = 46
    Height = 13
    Caption = #1058#1080#1087' '#1079#1074#1110#1090#1091
  end
  object Label4: TLabel
    Left = 12
    Top = 108
    Width = 39
    Height = 13
    Caption = #1064#1072#1073#1083#1086#1085
  end
  object Label5: TLabel
    Left = 12
    Top = 140
    Width = 97
    Height = 13
    Caption = #1042#1110#1082#1085#1086', '#1079' '#1103#1082#1086#1075#1086' '#1076#1088#1091#1082
  end
  object edtRecordID: TEdit
    Left = 76
    Top = 12
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'edtRecordID'
  end
  object edtReportName: TEdit
    Left = 76
    Top = 44
    Width = 389
    Height = 21
    TabOrder = 1
    Text = 'edtReportName'
  end
  object cbReportType: TComboBox
    Left = 76
    Top = 76
    Width = 389
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbReportType'
    Items.Strings = (
      #1076#1086#1082#1091#1084#1077#1085#1090
      #1090#1072#1073#1083#1080#1094#1103)
  end
  object edtTemplateName: TEdit
    Left = 76
    Top = 108
    Width = 365
    Height = 21
    TabOrder = 3
    Text = 'edtTemplateName'
  end
  object btnTemplateName: TButton
    Left = 444
    Top = 108
    Width = 21
    Height = 21
    Action = aTemplateName
    TabOrder = 4
  end
  object cbParentForm: TComboBox
    Left = 76
    Top = 140
    Width = 365
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'cbParentForm'
  end
  object btnUpdateParentForm: TButton
    Left = 444
    Top = 140
    Width = 21
    Height = 21
    Action = aUpdateParentForm
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 172
    Width = 457
    Height = 277
    TabOrder = 7
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 183
      Height = 110
      DataSource = dsParams
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PARAMNAME'
          Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088
          Width = 212
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BOOKMARKNAME'
          Title.Caption = #1047#1072#1082#1083#1072#1076#1082#1072
          Width = 223
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 248
      Width = 453
      Height = 27
      Align = alBottom
      AutoSize = True
      TabOrder = 1
      object btnAddParam: TButton
        Left = 69
        Top = 1
        Width = 75
        Height = 25
        Action = aAddParam
        TabOrder = 0
      end
      object btnEditParam: TButton
        Left = 149
        Top = 1
        Width = 75
        Height = 25
        Action = aEditParam
        TabOrder = 1
      end
      object btnDeleteParam: TButton
        Left = 229
        Top = 1
        Width = 75
        Height = 25
        Action = aDeleteParam
        TabOrder = 2
      end
      object btnUpdateParams: TButton
        Left = 309
        Top = 1
        Width = 75
        Height = 25
        Action = aUpdateParam
        TabOrder = 3
      end
    end
  end
  object btnOK: TButton
    Left = 163
    Top = 460
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 8
  end
  object btnCancel: TButton
    Left = 243
    Top = 460
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 9
  end
  object OpenDialog: TOpenDialog
    Filter = 
      #1060#1072#1081#1083#1080' '#1096#1072#1073#1083#1086#1085#1110#1074' '#1076#1086#1082#1091#1077#1085#1090#1110#1074' (*.dot)|*.dot|'#1060#1072#1081#1083#1080' '#1096#1072#1073#1083#1086#1085#1110#1074' '#1090#1072#1073#1083#1080#1094#1100' (*' +
      '.xlt)|*.xlt|'#1060#1072#1081#1083#1080' '#1096#1072#1073#1083#1086#1085#1110#1074' (*.dot; *.xlt)|*.dot;*.xlt|'#1042#1089#1110' '#1092#1072#1081#1083#1080' ' +
      '(*.*)|*.*'
    FilterIndex = 3
    Left = 364
    Top = 100
  end
  object alReportEdit: TActionList
    Left = 344
    Top = 4
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aTemplateName: TAction
      Caption = '...'
      OnExecute = aTemplateNameExecute
    end
    object aUpdateParentForm: TAction
      Caption = '@'
      OnExecute = aUpdateParentFormExecute
    end
    object aAddParam: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = aAddParamExecute
    end
    object aEditParam: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      OnExecute = aEditParamExecute
    end
    object aDeleteParam: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteParamExecute
    end
    object aUpdateParam: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateParamExecute
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
  object qReportEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 292
    Top = 8
  end
  object dsParams: TDataSource
    DataSet = qParams
    Left = 212
    Top = 252
  end
  object qParams: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 240
    Top = 252
  end
end
