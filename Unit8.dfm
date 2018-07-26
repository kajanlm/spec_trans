object Form8: TForm8
  Left = 746
  Top = 281
  Width = 887
  Height = 418
  Caption = #1057#1087#1080#1089#1086#1082' '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
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
    Top = 32
    Width = 857
    Height = 305
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
        FieldName = 'nomer'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 500
      end
      item
        EditButtons = <>
        FieldName = 'project_name'
        Footers = <>
        Title.Caption = #1055#1088#1086#1077#1082#1090
        Width = 100
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 344
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 344
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
      'select spec_id, nomer, name, project_id,'#13#10'(Select project from  ' +
      'project_list as PL where PL.project_id=SN.project_id) as'#13#10'projec' +
      't_name'#13#10'from SPEC_NAME as SN'#13#10'order by project_name,nomer'#13#10
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 664
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 608
    Top = 8
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 392
  end
end
