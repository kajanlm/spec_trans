object Form3: TForm3
  Left = 278
  Top = 357
  Width = 760
  Height = 420
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1088#1086#1077#1082#1090#1086#1074
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
    Left = 16
    Top = 8
    Width = 705
    Height = 337
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'project'
        Footers = <>
        Title.Caption = #1055#1088#1086#1077#1082#1090'!'
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'!'
      end
      item
        EditButtons = <>
        FieldName = 'boss1'
        Footers = <>
        Title.Caption = #1059#1090#1074' '#1087#1088#1086#1077#1082#1090#1072
        Width = 180
      end>
  end
  object Button1: TButton
    Left = 32
    Top = 352
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 352
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = Button2Click
  end
  object SimpleDataSet1: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 
      'select project_id, SUBSTRING(name,1,50)  name,  SUBSTRING(projec' +
      't,1,30) project,(Select user_name from Users u where u.USER_ID=b' +
      'oss) boss1 from project_list order by name'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'project_id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'project'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'boss1'
        DataType = ftMemo
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 24
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 64
    Top = 8
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 360
    Top = 8
  end
end
