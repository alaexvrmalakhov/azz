object frmGroups: TfrmGroups
  Left = 176
  Top = 110
  Width = 361
  Height = 250
  Caption = 'frmGroups'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 276
    Top = 0
    Width = 77
    Height = 223
    Align = alRight
    AutoSize = True
    TabOrder = 0
    object btnAdd: TButton
      Left = 1
      Top = 4
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 1
      Top = 32
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnDelete: TButton
      Left = 1
      Top = 60
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnChoice: TButton
      Left = 1
      Top = 88
      Width = 75
      Height = 25
      Action = aChoice
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 1
      Top = 116
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 4
    end
    object btnClose: TButton
      Left = 1
      Top = 144
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 5
    end
  end
  object lvGroups: TListView
    Left = 8
    Top = 4
    Width = 250
    Height = 150
    Columns = <
      item
        AutoSize = True
        Caption = #1043#1088#1091#1087#1080
      end>
    TabOrder = 1
    ViewStyle = vsReport
  end
  object alGroups: TActionList
    Left = 224
    Top = 44
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1047#1084#1110#1085#1080#1090#1080
      ShortCut = 13
      OnExecute = aEditExecute
    end
    object aDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aChoice: TAction
      Caption = #1042#1080#1073#1088#1072#1090#1080
      ShortCut = 16397
      OnExecute = aChoiceExecute
    end
    object aUpdate: TAction
      Caption = #1055#1086#1085#1086#1074#1080#1090#1080
      ShortCut = 16469
      OnExecute = aUpdateExecute
    end
    object aClose: TAction
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ShortCut = 16499
      OnExecute = aCloseExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 176
    Top = 44
    object N1: TMenuItem
      Action = aAdd
    end
    object N2: TMenuItem
      Action = aEdit
    end
    object N3: TMenuItem
      Action = aDelete
    end
    object N4: TMenuItem
      Action = aChoice
    end
    object N5: TMenuItem
      Action = aUpdate
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Action = aClose
    end
  end
  object qGroups: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    BufferChunks = 1000
    CachedUpdates = False
    Left = 180
    Top = 108
  end
end
