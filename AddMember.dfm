object frmAddMember: TfrmAddMember
  Left = 871
  Top = 41
  Width = 378
  Height = 479
  Caption = 'frmAddMember'
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
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 353
    Height = 369
    Shape = bsBottomLine
  end
  object btnOK: TButton
    Left = 107
    Top = 404
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 187
    Top = 404
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 337
    Height = 353
    DataSource = dsAddMember
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
        FieldName = 'GROUPNAME'
        Title.Caption = #1043#1088#1091#1087#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOGIN'
        Title.Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
        Visible = True
      end>
  end
  object cbAllUsers: TCheckBox
    Left = 8
    Top = 380
    Width = 353
    Height = 17
    Caption = #1042#1110#1076#1086#1073#1088#1072#1079#1080#1090#1080' '#1074#1089#1110#1093' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1110#1074
    TabOrder = 3
    Visible = False
    OnClick = cbAllUsersClick
  end
  object alAddMember: TActionList
    Left = 28
    Top = 400
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
  end
  object qAddMember: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 304
    Top = 396
  end
  object dsAddMember: TDataSource
    DataSet = qAddMember
    Left = 272
    Top = 396
  end
end
