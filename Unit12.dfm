object Form12: TForm12
  Left = 308
  Top = 288
  Width = 584
  Height = 87
  Caption = #1044#1086#1073#1072#1074#1083#1103#1077#1084' '#1086#1090#1076#1077#1083
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 441
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 456
    Top = 8
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 512
    Top = 32
  end
end
