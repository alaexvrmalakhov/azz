object frmGlobalUsersEdit: TfrmGlobalUsersEdit
  Left = 628
  Top = 139
  Width = 553
  Height = 313
  Caption = 'frmGlobalUsersEdit'
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
    Width = 529
    Height = 225
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 20
    Top = 20
    Width = 85
    Height = 13
    Caption = #1030#1084#39#1103' '#1082#1086#1088#1080#1089#1090#1091#1074#1072#1095#1072
  end
  object Label2: TLabel
    Left = 20
    Top = 56
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Label3: TLabel
    Left = 20
    Top = 92
    Width = 118
    Height = 13
    Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1085#1103' '#1087#1072#1088#1086#1083#1102
  end
  object Label4: TLabel
    Left = 20
    Top = 128
    Width = 49
    Height = 13
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077
  end
  object Label5: TLabel
    Left = 20
    Top = 164
    Width = 19
    Height = 13
    Caption = #1030#1084#39#1103
  end
  object Label6: TLabel
    Left = 20
    Top = 200
    Width = 60
    Height = 13
    Caption = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
  end
  object btnOK: TButton
    Left = 195
    Top = 244
    Width = 75
    Height = 25
    Action = aOK
    Default = True
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 275
    Top = 244
    Width = 75
    Height = 25
    Action = aCancel
    Cancel = True
    TabOrder = 1
  end
  object edtLogin: TEdit
    Left = 144
    Top = 20
    Width = 381
    Height = 21
    TabOrder = 2
    Text = 'edtLogin'
  end
  object edtPassword: TEdit
    Left = 144
    Top = 56
    Width = 381
    Height = 21
    TabOrder = 3
    Text = 'edtPassword'
  end
  object edtConfirmPassword: TEdit
    Left = 144
    Top = 92
    Width = 381
    Height = 21
    TabOrder = 4
    Text = 'edtConfirmPassword'
  end
  object edtPrizvische: TEdit
    Left = 144
    Top = 128
    Width = 381
    Height = 21
    TabOrder = 5
    Text = 'edtPrizvische'
  end
  object edtImjy: TEdit
    Left = 144
    Top = 164
    Width = 381
    Height = 21
    TabOrder = 6
    Text = 'edtImjy'
  end
  object edtPoBatkovi: TEdit
    Left = 144
    Top = 200
    Width = 381
    Height = 21
    TabOrder = 7
    Text = 'edtPoBatkovi'
  end
  object alGlobalUsersEdit: TActionList
    Left = 52
    Top = 236
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
