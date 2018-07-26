object Form10: TForm10
  Left = 524
  Top = 218
  Width = 670
  Height = 488
  Caption = #1046#1091#1088#1085#1072#1083' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1081
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 32
    Width = 633
    Height = 385
    DataSource = DataSource2
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
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'project'
        Footer.FieldName = 'project'
        Footers = <>
        Title.Caption = #1055#1088#1086#1077#1082#1090
      end
      item
        EditButtons = <>
        FieldName = 'nomer'
        Footer.FieldName = 'nomer'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footer.FieldName = 'name'
        Footers = <>
      end>
  end
  object SimpleDataSet1: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 
      'select spec_id, nomer, project_id, name, (Select project from pr' +
      'oject_list PL where PL.project_id=sp.project_id) as project '#13#10'fr' +
      'om SPEC_NAME sp order by project_id, nomer'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 8
    Top = 8
    object SimpleDataSet1spec_id: TIntegerField
      FieldName = 'spec_id'
    end
    object SimpleDataSet1name: TStringField
      FieldName = 'name'
      Size = 250
    end
    object SimpleDataSet1nomer: TStringField
      FieldName = 'nomer'
      Size = 100
    end
    object SimpleDataSet1project_id: TIntegerField
      FieldName = 'project_id'
    end
    object SimpleDataSet1project: TMemoField
      FieldName = 'project'
      BlobType = ftMemo
    end
  end
  object DataSource2: TDataSource
    DataSet = SimpleDataSet1
    Left = 936
    Top = 40
  end
end
