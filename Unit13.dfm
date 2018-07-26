object Form13: TForm13
  Left = 397
  Top = 380
  Width = 690
  Height = 346
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1057#1048#1057#1058#1045#1052#1067
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 16
    Width = 649
    Height = 249
    DataSource = DataSource1
    DrawMemoText = True
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'user_name'
        Footers = <>
        Title.Caption = #1048#1084#1103
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'otdel'
        Footers = <>
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'Login'
        Footers = <>
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'boss'
        Footers = <>
        Title.Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 272
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 272
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
  end
  object Button3: TButton
    Left = 176
    Top = 272
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 3
    OnClick = Button3Click
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 520
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 512
    Top = 64
  end
end
