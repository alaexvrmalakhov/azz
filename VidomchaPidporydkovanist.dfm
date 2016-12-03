object frmVidomchaPidporydkovanist: TfrmVidomchaPidporydkovanist
  Left = 257
  Top = 113
  Width = 426
  Height = 270
  Caption = 'frmVidomchaPidporydkovanist'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  OnActivate = FormActivate
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 335
    Top = 0
    Width = 75
    Height = 211
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = True
    TabOrder = 0
    object btnDodati: TButton
      Left = 0
      Top = 4
      Width = 75
      Height = 25
      Action = aAdd
      TabOrder = 0
    end
    object btnZminiti: TButton
      Left = 0
      Top = 32
      Width = 75
      Height = 25
      Action = aEdit
      TabOrder = 1
    end
    object btnVidaliti: TButton
      Left = 0
      Top = 60
      Width = 75
      Height = 25
      Action = aDelete
      TabOrder = 2
    end
    object btnZaktiti: TButton
      Left = 0
      Top = 172
      Width = 75
      Height = 25
      Action = aClose
      TabOrder = 4
    end
    object btnVibrati: TButton
      Left = 0
      Top = 88
      Width = 75
      Height = 25
      Action = aChoice
      TabOrder = 3
    end
    object btnUpdate: TButton
      Left = 0
      Top = 116
      Width = 75
      Height = 25
      Action = aUpdate
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 197
    Height = 97
    DataSource = dsVidomchaPidporydkovanist
    ImeName = 'Russian'
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 211
    Width = 410
    Height = 21
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = True
    TabOrder = 2
    object edtFind: TEdit
      Left = 4
      Top = 0
      Width = 121
      Height = 21
      ImeName = 'Russian'
      TabOrder = 0
      Text = 'edtFind'
      OnChange = aFindChangeExecute
    end
  end
  object alVidomchaPidporydkovanist: TActionList
    Left = 208
    Top = 8
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
    object aFindChange: TAction
      Caption = 'aFindChange'
      OnExecute = aFindChangeExecute
    end
    object aSortByKod: TAction
      Caption = #1047#1072' '#1082#1086#1076#1086#1084
      ShortCut = 16433
      OnExecute = aSortByKodExecute
    end
    object aSortByVidomstrvo: TAction
      Caption = #1047#1072' '#1074#1110#1076#1086#1084#1089#1090#1074#1086#1084
      ShortCut = 16434
      OnExecute = aSortByVidomstrvoExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 244
    Top = 12
    object mnAdd: TMenuItem
      Action = aAdd
    end
    object mnEdit: TMenuItem
      Action = aEdit
    end
    object mnDelete: TMenuItem
      Action = aDelete
    end
    object mnChoice: TMenuItem
      Action = aChoice
    end
    object mnUpdate: TMenuItem
      Action = aUpdate
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
      object mnSortByKod: TMenuItem
        Action = aSortByKod
      end
      object mnSortByVidomstrvo: TMenuItem
        Action = aSortByVidomstrvo
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object mnClose: TMenuItem
      Action = aClose
    end
  end
  object dsVidomchaPidporydkovanist: TDataSource
    DataSet = qVidomchaPidporydkovanist
    Left = 212
    Top = 68
  end
  object qVidomchaPidporydkovanist: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    OnFilterRecord = qVidomchaPidporydkovanistFilterRecord
    Left = 248
    Top = 68
  end
  object qUpdate: TIBQuery
    Database = frmMain.dbAzz
    Transaction = frmMain.trAzz
    Left = 220
    Top = 132
  end
end
