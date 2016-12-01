object frmPath: TfrmPath
  Left = 739
  Top = 26
  Width = 442
  Height = 438
  Caption = 'frmPath'
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
  object lblPath: TLabel
    Left = 12
    Top = 344
    Width = 200
    Height = 13
    Caption = 'D:\'#1052#1086#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099'\AZZ\Azz2031'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DriveComboBox: TDriveComboBox
    Left = 12
    Top = 12
    Width = 409
    Height = 19
    DirList = DirectoryListBox
    TabOrder = 0
  end
  object DirectoryListBox: TDirectoryListBox
    Left = 12
    Top = 40
    Width = 409
    Height = 297
    DirLabel = lblPath
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
  end
  object btnVikonati: TButton
    Left = 139
    Top = 372
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 2
  end
  object btnVidminiti: TButton
    Left = 219
    Top = 372
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 3
  end
  object alPath: TActionList
    Left = 332
    Top = 352
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
