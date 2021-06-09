object fmMainApp: TfmMainApp
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1074#1077#1088#1090#1077#1088' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  ClientHeight = 115
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rgTypeUnit: TRadioGroup
    Left = 0
    Top = 0
    Width = 635
    Height = 65
    Align = alTop
    Caption = #1058#1080#1087' '#1077#1076#1080#1085#1080#1094' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
    TabOrder = 0
    OnClick = rgTypeUnitClick
  end
  object edFrom: TMaskEdit
    Left = 8
    Top = 71
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 1
    Text = '1'
    OnChange = editChange
    OnKeyPress = OnlyNumericKeyPress
  end
  object edTo: TMaskEdit
    Left = 240
    Top = 71
    Width = 121
    Height = 21
    MaxLength = 10
    TabOrder = 2
    Text = '1'
    OnChange = editChange
    OnKeyPress = OnlyNumericKeyPress
  end
  object cbbFrom: TComboBox
    Left = 128
    Top = 71
    Width = 97
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    OnChange = cbbChange
  end
  object cbbTo: TComboBox
    Left = 360
    Top = 71
    Width = 97
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    OnChange = cbbChange
  end
end
