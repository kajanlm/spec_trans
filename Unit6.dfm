object Form6: TForm6
  Left = 344
  Top = 244
  Width = 592
  Height = 195
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 2
    Top = 10
    Width = 37
    Height = 13
    Caption = #1055#1088#1086#1077#1082#1090
  end
  object Label2: TLabel
    Left = 2
    Top = 42
    Width = 34
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label3: TLabel
    Left = 2
    Top = 74
    Width = 40
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 48
    Top = 8
    Width = 313
    Height = 21
    EditButtons = <>
    KeyField = 'project_id'
    ListField = 'project'
    ListFieldIndex = 2
    ListSource = DataSource1
    TabOrder = 0
    Visible = True
  end
  object Edit1: TEdit
    Left = 48
    Top = 40
    Width = 465
    Height = 21
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 48
    Top = 72
    Width = 473
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 128
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 128
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 4
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 104
    Width = 225
    Height = 17
    Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object SimpleDataSet1: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'select project_id, project from project_list order by project'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'project_id'
        DataType = ftInteger
      end
      item
        Name = 'project'
        DataType = ftMemo
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 488
    Top = 8
    object SimpleDataSet1project_id: TIntegerField
      FieldName = 'project_id'
    end
    object SimpleDataSet1project: TMemoField
      FieldName = 'project'
      OnGetText = SimpleDataSet1projectGetText
      BlobType = ftMemo
    end
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 456
    Top = 8
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 392
  end
end
