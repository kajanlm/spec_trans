object Form5: TForm5
  Left = 328
  Top = 231
  Width = 475
  Height = 200
  Caption = 'Form5'
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
  object Label1: TLabel
    Left = 48
    Top = 19
    Width = 39
    Height = 13
    Caption = #1053#1054#1052#1045#1056
  end
  object Label2: TLabel
    Left = 5
    Top = 59
    Width = 92
    Height = 13
    Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
  end
  object Label3: TLabel
    Left = 17
    Top = 98
    Width = 71
    Height = 16
    Caption = #1059#1058#1042'. '#1055#1088#1086#1077#1082#1090#1072
  end
  object Edit1: TEdit
    Left = 96
    Top = 16
    Width = 281
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 96
    Top = 56
    Width = 361
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 128
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 96
    Top = 96
    Width = 337
    Height = 21
    EditButtons = <>
    KeyField = 'USER_ID'
    ListField = 'user_name'
    ListSource = DataSource1
    TabOrder = 3
    Visible = True
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 128
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 208
    Top = 128
  end
  object SimpleDataSet1: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'select USER_ID, user_name from Users'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 280
    Top = 136
  end
end
