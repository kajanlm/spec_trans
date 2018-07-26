object Form9: TForm9
  Left = 192
  Top = 124
  Width = 660
  Height = 304
  Caption = 'Form9'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 80
    Top = 24
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 3
    Top = 24
    Width = 76
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 69
    Height = 13
    Caption = #1045#1076'. '#1054#1089#1085#1086#1074#1085#1072#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 72
    Width = 25
    Height = 13
    Caption = #1045#1076'. 2'
  end
  object Label5: TLabel
    Left = 8
    Top = 88
    Width = 22
    Height = 13
    Caption = #1045#1076'.3'
  end
  object Label6: TLabel
    Left = 120
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object Label7: TLabel
    Left = 120
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object Label8: TLabel
    Left = 120
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object DBGridEh1: TDBGridEh
    Left = 200
    Top = 24
    Width = 409
    Height = 129
    DataSource = DataSource1
    DrawMemoText = True
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 32
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 600
    Top = 56
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 536
    Top = 8
  end
end
