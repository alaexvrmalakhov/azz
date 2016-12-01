object frmGlobalUsers: TfrmGlobalUsers
  Left = 182
  Top = 110
  Width = 439
  Height = 247
  Caption = 'frmGlobalUsers'
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
  object lvUsers: TListView
    Left = 4
    Top = 4
    Width = 253
    Height = 65
    Columns = <
      item
        Caption = #1030#1084#39#1103
        Width = 123
      end
      item
        Caption = #1055#1088#1110#1079#1074#1080#1097#1077', '#1110#1084#39#1103', '#1087#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
        Width = 123
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
  object Panel1: TPanel
    Left = 354
    Top = 0
    Width = 77
    Height = 213
    Align = alRight
    AutoSize = True
    TabOrder = 1
    object btnAdd: TButton
      Left = 1
      Top = 8
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnEdit: TButton
      Left = 1
      Top = 36
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnDelete: TButton
      Left = 1
      Top = 64
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnChoice: TButton
      Left = 1
      Top = 92
      Width = 75
      Height = 25
      Action = aChoice
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 1
      Top = 120
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 4
    end
    object btnClose: TButton
      Left = 1
      Top = 148
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 5
    end
  end
  object alGlobalUsers: TActionList
    Left = 268
    Top = 8
    object aAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      ShortCut = 45
      OnExecute = aAddExecute
    end
    object aEdit: TAction
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
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
    Left = 304
    Top = 12
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
    object N6: TMenuItem
      Caption = '-'
    end
    object N7: TMenuItem
      Action = aClose
    end
  end
end
