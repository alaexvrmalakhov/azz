object frmGroupsEdit: TfrmGroupsEdit
  Left = 529
  Top = 36
  Width = 453
  Height = 391
  Caption = 'frmGroupsEdit'
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
    Left = 20
    Top = 16
    Width = 49
    Height = 13
    Caption = 'Record ID'
  end
  object Label2: TLabel
    Left = 20
    Top = 48
    Width = 63
    Height = 13
    Caption = #1053#1072#1079#1074#1072' '#1075#1088#1091#1087#1080
  end
  object Label3: TLabel
    Left = 20
    Top = 80
    Width = 102
    Height = 13
    Caption = #1044#1086#1082#1083#1072#1076#1085#1086' '#1087#1088#1086' '#1075#1088#1091#1087#1091
  end
  object Bevel2: TBevel
    Left = 8
    Top = 108
    Width = 429
    Height = 209
    Shape = bsBottomLine
  end
  object edtRecord_ID: TEdit
    Left = 76
    Top = 16
    Width = 349
    Height = 21
    TabOrder = 0
    Text = 'edtRecord_ID'
  end
  object edtGroupName: TEdit
    Left = 96
    Top = 48
    Width = 329
    Height = 21
    TabOrder = 1
    Text = 'edtGroupName'
    OnChange = edtGroupNameChange
  end
  object edtGroupDescription: TEdit
    Left = 132
    Top = 80
    Width = 293
    Height = 21
    TabOrder = 2
    Text = 'edtGroupDescription'
    OnChange = edtGroupDescriptionChange
  end
  object lvGroupMembers: TListView
    Left = 16
    Top = 116
    Width = 413
    Height = 157
    Columns = <
      item
        AutoSize = True
        Caption = #1063#1083#1077#1085#1080' '#1075#1088#1091#1087#1080
      end>
    TabOrder = 3
    ViewStyle = vsReport
  end
  object btnAddGroup: TButton
    Left = 12
    Top = 284
    Width = 105
    Height = 25
    Action = aAddGroup
    TabOrder = 4
  end
  object btnAddUser: TButton
    Left = 117
    Top = 284
    Width = 105
    Height = 25
    Action = aAddUser
    TabOrder = 5
  end
  object btnDelete: TButton
    Left = 224
    Top = 284
    Width = 105
    Height = 25
    Action = aDeleteMember
    TabOrder = 6
  end
  object btnUpdate: TButton
    Left = 329
    Top = 284
    Width = 105
    Height = 25
    Action = aUpdateMember
    TabOrder = 7
  end
  object btnOK: TButton
    Left = 104
    Top = 324
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 8
  end
  object btnCancel: TButton
    Left = 184
    Top = 324
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 9
  end
  object btnApply: TButton
    Left = 267
    Top = 324
    Width = 75
    Height = 25
    Action = aApply
    TabOrder = 10
  end
  object qGroupEdit: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 20
  end
  object alGroupsEdit: TActionList
    Left = 288
    Top = 20
    object aCancel: TAction
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnExecute = aCancelExecute
    end
    object aRecordIDUpdate: TAction
      Caption = 'aRecordIDUpdate'
      OnExecute = aRecordIDUpdateExecute
    end
    object aAddGroup: TAction
      Caption = #1044#1086#1076#1072#1090#1080'  '#1075#1088#1091#1087#1091
      OnExecute = aAddGroupExecute
    end
    object aAddUser: TAction
      Caption = #1044#1086#1076#1072#1090#1080' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
      OnExecute = aAddUserExecute
    end
    object aDeleteMember: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = aDeleteMemberExecute
    end
    object aUpdateMember: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      OnExecute = aUpdateMemberExecute
    end
    object aOK: TAction
      Caption = #1042#1080#1082#1086#1085#1072#1090#1080
      OnExecute = aOKExecute
    end
    object aApply: TAction
      Caption = #1047#1072#1089#1090#1086#1089#1091#1074#1072#1090#1080
      OnExecute = aApplyExecute
    end
  end
end
