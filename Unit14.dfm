object Form14: TForm14
  Left = 757
  Top = 309
  Width = 562
  Height = 191
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
    Left = 10
    Top = 15
    Width = 27
    Height = 13
    Caption = #1060#1048#1054
  end
  object Label2: TLabel
    Left = 12
    Top = 45
    Width = 26
    Height = 13
    Caption = 'Login'
  end
  object Label3: TLabel
    Left = 7
    Top = 72
    Width = 31
    Height = 13
    Caption = #1054#1090#1076#1077#1083
  end
  object Edit1: TEdit
    Left = 44
    Top = 9
    Width = 481
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 44
    Top = 41
    Width = 130
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 120
    Width = 75
    Height = 25
    Caption = #1047#1072#1087#1080#1089#1072#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 96
    Width = 97
    Height = 17
    Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082
    TabOrder = 3
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 43
    Top = 69
    Width = 286
    Height = 21
    EditButtons = <>
    KeyField = 'user_gr_id'
    ListField = 'name'
    ListSource = DataSource1
    TabOrder = 4
    Visible = True
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 416
    Top = 72
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = SimpleDataSet1
    Left = 496
    Top = 104
  end
  object SimpleDataSet1: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'Select * from  user_gr'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 488
    Top = 56
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 432
    Top = 104
  end
end
