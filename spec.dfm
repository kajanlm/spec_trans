object Form1: TForm1
  Left = 432
  Top = 154
  Width = 839
  Height = 600
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
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
    Left = 24
    Top = 480
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 16
    Top = 22
    Width = 181
    Height = 13
    Caption = #1042#1042#1086#1076#1080#1084' '#1090#1091#1090' '#1082#1086#1076' '#1080' '#1085#1072#1078#1080#1084#1072#1077#1084'  '#1087#1086#1080#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 301
    Top = 24
    Width = 199
    Height = 13
    Caption = #1042#1042#1086#1076#1080#1084' '#1090#1091#1090' '#1095#1077#1088#1090#1077#1078' '#1080' '#1085#1072#1078#1080#1084#1072#1077#1084'  '#1087#1086#1080#1089#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 32
    Top = 480
    Width = 71
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1072#1085#1072#1103' '#1077#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 123
    Top = 480
    Width = 3
    Height = 13
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 496
    Width = 101
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1077#1076
  end
  object Label7: TLabel
    Left = 112
    Top = 496
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 7
    Top = 516
    Width = 101
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1077#1076
  end
  object Label9: TLabel
    Left = 118
    Top = 520
    Width = 42
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 8
    Top = 464
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 8
    Top = 536
    Width = 105
    Height = 13
    Caption = #1058#1080#1087
  end
  object Label12: TLabel
    Left = 118
    Top = 536
    Width = 35
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 72
    Width = 785
    Height = 153
    DataSource = DataSource1
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
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 764
      end>
  end
  object Button1: TButton
    Left = 680
    Top = 472
    Width = 129
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'_'#1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
    Enabled = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGridEh2: TDBGridEh
    Left = 16
    Top = 232
    Width = 785
    Height = 225
    DataSource = DataSource2
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridEh2CellClick
    OnDblClick = DBGridEh2DblClick
    OnGetCellParams = DBGridEh2GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'kod'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'fullname'
        Footers = <>
        Title.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 644
        WordWrap = True
      end
      item
        EditButtons = <>
        FieldName = 'L_OGRAN'
        Footers = <>
        Visible = False
      end>
  end
  object Edit1: TEdit
    Left = 16
    Top = 41
    Width = 185
    Height = 21
    TabOrder = 3
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1090#1091#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1082#1086#1076#1091
    OnClick = Edit1Click
    OnKeyPress = Edit1KeyPress
  end
  object Button2: TButton
    Left = 207
    Top = 40
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit2: TEdit
    Left = 296
    Top = 42
    Width = 281
    Height = 21
    TabOrder = 5
    Text = #1055#1086#1080#1089#1082' '#1087#1086' '#1095#1077#1088#1090#1077#1078#1091
    OnClick = Edit2Click
    OnKeyPress = Edit2KeyPress
  end
  object Button3: TButton
    Left = 584
    Top = 40
    Width = 75
    Height = 25
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 6
    OnClick = Button3Click
  end
  object Edit3: TEdit
    Left = 16
    Top = 2
    Width = 649
    Height = 21
    TabOrder = 7
    Text = #1042#1042#1077#1076#1080#1090#1077' '#1095#1072#1089#1090#1100' '#1085#1072#1079#1074#1072#1085#1080#1103
    OnClick = Edit3Click
    OnKeyPress = Edit3KeyPress
  end
  object Button4: TButton
    Left = 672
    Top = 0
    Width = 137
    Height = 25
    Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102
    TabOrder = 8
    OnClick = Button4Click
  end
  object CheckBox1: TCheckBox
    Left = 672
    Top = 40
    Width = 137
    Height = 17
    Caption = #1055#1086#1080#1089#1082' '#1090#1086#1083#1100#1082#1086' '#1089#1086' *'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object SimpleDataSet1: TSimpleDataSet
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 
      'select SUBSTRING(name,1,100) name, tree_id, tree_tr_id from SPRA' +
      'V_TREE_TR'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    DataSet.SortFieldNames = ' name '
    Params = <>
    Left = 616
    Top = 144
  end
  object DataSource1: TDataSource
    DataSet = MemTableEh1
    Left = 616
    Top = 168
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'Select * from SPRAV_TREE_TR')
    SQLConnection = Form2.SQLConnection1
    Left = 616
    Top = 392
  end
  object MemTableEh1: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataSetDriverEh1
    TreeList.Active = True
    TreeList.KeyFieldName = 'tree_id'
    TreeList.RefParentFieldName = 'tree_tr_id'
    Left = 616
    Top = 192
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = SimpleDataSet1
    Left = 584
    Top = 192
  end
  object SimpleDataSet2: TSimpleDataSet
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'select *  from SPRAV'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    DataSet.SortFieldNames = ' name '
    FieldDefs = <
      item
        Name = 'spr_id'
        DataType = ftInteger
      end
      item
        Name = 'tree_id'
        DataType = ftInteger
      end
      item
        Name = 'kod'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'name'
        DataType = ftMemo
      end
      item
        Name = 'fullname'
        DataType = ftMemo
      end
      item
        Name = 'mass'
        DataType = ftMemo
      end
      item
        Name = 'koded_id'
        DataType = ftInteger
      end
      item
        Name = 'koded_koded_id2'
        DataType = ftInteger
      end
      item
        Name = 'koded_koded_id_koded2'
        DataType = ftInteger
      end
      item
        Name = 'chertezh'
        DataType = ftMemo
      end
      item
        Name = 'L_OGRAN'
        DataType = ftSmallint
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 536
    Top = 288
  end
  object DataSource2: TDataSource
    DataSet = SimpleDataSet2
    Left = 592
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 616
    object N1: TMenuItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1045#1076' '#1080#1079#1084' '#1080' '#1087#1077#1088#1077#1074#1086#1076#1072
    end
  end
  object SQLQuery2: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 600
    Top = 480
  end
end
