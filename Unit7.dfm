object Form7: TForm7
  Left = -3
  Top = 104
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form7'
  ClientHeight = 829
  ClientWidth = 1276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 8
    Width = 37
    Height = 13
    Caption = #1055#1088#1086#1077#1082#1090
  end
  object Label2: TLabel
    Left = 11
    Top = 40
    Width = 75
    Height = 13
    Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103
  end
  object Label3: TLabel
    Left = 312
    Top = 40
    Width = 3
    Height = 13
  end
  object Label4: TLabel
    Left = 1072
    Top = 8
    Width = 3
    Height = 13
    Visible = False
  end
  object Label5: TLabel
    Left = 392
    Top = 800
    Width = 62
    Height = 13
    Caption = #1047#1040#1043#1056#1059#1046#1040#1070
    Visible = False
  end
  object Label6: TLabel
    Left = 1328
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label6'
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 72
    Width = 1425
    Height = 713
    DataSource = DataSource4
    DrawMemoText = True
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind]
    PopupMenu = PopupMenu1
    ReadOnly = True
    RowLines = 4
    SortLocal = True
    STFilter.Local = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 80
    TitleLines = 3
    UseMultiTitle = True
    OnDblClick = DBGridEh1DblClick
    OnKeyDown = DBGridEh1KeyDown
    OnKeyPress = DBGridEh1KeyPress
    Columns = <
      item
        Alignment = taCenter
        Color = clMenu
        EditButtons = <>
        FieldName = 'stroka'
        Footers = <>
        Title.Caption = #1057#1090#1088#1086#1082#1072
        Title.Orientation = tohVertical
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.ToolTips = True
        Width = 31
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'poz'
        Footers = <>
        Title.Caption = #1055#1086#1079#1080#1094#1080#1103
        Title.Orientation = tohVertical
        Width = 61
      end
      item
        EditButtons = <>
        FieldName = 'section'
        Footers = <>
        Title.Caption = #1055#1086#1076#1089#1077#1082#1094#1080#1103
        Title.Orientation = tohVertical
        Visible = False
        Width = 58
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kod'
        Footers = <>
        Title.Caption = #1054#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077'/ '#1082#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
        Width = 144
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 265
      end
      item
        Alignment = taCenter
        DropDownBox.Columns = <
          item
            FieldName = 'koded'
            Title.Caption = #1050#1086#1076
          end>
        EditButtons = <>
        FieldName = 'ed'
        Footers = <>
        Title.Caption = #1050#1086#1076'.'#1045#1076'.'#1048#1079#1084
        Title.Orientation = tohVertical
        Visible = False
        Width = 25
      end
      item
        Alignment = taCenter
        DropDownBox.Columns = <
          item
            FieldName = 'koded'
          end>
        DropDownSpecRow.Value = 0.000000000000000000
        EditButtons = <>
        FieldName = 'ed4'
        Footers = <>
        Title.Caption = #1050#1086#1076'.'#1045#1076'.'#1048#1079#1084
        Title.Orientation = tohVertical
        Width = 46
        OnEditButtonClick = DBGridEh1Columns5EditButtonClick
        OnUpdateData = DBGridEh1Columns5UpdateData
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Title.Orientation = tohVertical
        Width = 59
        OnUpdateData = DBGridEh1Columns6UpdateData
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'mass_ed'
        Footers = <>
        Title.Caption = #1052#1072#1089#1089#1072'|'#1077#1076#1077#1085#1080#1094#1099' '#1082#1075'.'
        Title.Orientation = tohVertical
        Width = 50
        OnUpdateData = DBGridEh1Columns7UpdateData
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'mass'
        Footers = <>
        Title.Caption = #1052#1072#1089#1089#1072'|'#1054#1073#1097#1072#1103' , '#1082#1075
        Title.Orientation = tohVertical
        Width = 65
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'mesto'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086#1087#1086#1083#1086#1078#1077#1085#1080#1077
        Title.Orientation = tohVertical
        Width = 30
      end
      item
        Checkboxes = True
        EditButtons = <>
        FieldName = 'mech_izl'
        Footers = <>
        Title.Caption = #1048#1079#1086#1083#1103#1094#1080#1103
        Title.Orientation = tohVertical
        Visible = False
        Width = 29
      end
      item
        EditButtons = <>
        FieldName = 'kod_ved1'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1074#1077#1076'. '#1079#1072#1082'.'
        Title.Orientation = tohVertical
        Width = 73
      end
      item
        Alignment = taCenter
        Checkboxes = False
        EditButtons = <>
        FieldName = 'pokr'
        Footers = <>
        Title.Caption = #1055#1086#1082#1088#1099#1090#1080#1103
        Title.Orientation = tohVertical
        Width = 32
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'sklad'
        Footers = <>
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090#1085#1072#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1103'|'#1057#1082#1083#1072#1076
        Title.Orientation = tohVertical
        Width = 39
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'zak'
        Footers = <>
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090#1085#1072#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1103'|'#1047#1072#1075#1086#1090#1086#1074#1082#1072
        Title.Orientation = tohVertical
        Width = 40
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'obr'
        Footers = <>
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090#1085#1072#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1103'|'#1054#1073#1088#1072#1073#1086#1090#1082#1072
        Width = 83
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'sbor'
        Footers = <>
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090#1085#1072#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1103'|'#1057#1073#1086#1088#1082#1072
        Title.Orientation = tohVertical
        Width = 45
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'sklad1'
        Footers = <>
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090#1085#1072#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1103'|'#1057#1082#1083#1072#1076
        Title.Orientation = tohVertical
        Width = 38
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'montazh'
        Footers = <>
        Title.Caption = #1052#1072#1088#1096#1088#1091#1090#1085#1072#1103' '#1090#1077#1093#1085#1086#1083#1086#1075#1080#1103'|'#1052#1086#1085#1090#1072#1078
        Title.Orientation = tohVertical
        Width = 44
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'text'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.Orientation = tohVertical
        Width = 247
      end
      item
        EditButtons = <>
        FieldName = 'number_string'
        Footers = <>
        Visible = False
        Width = 35
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kod_ved'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1074#1077#1076'. '#1079#1072#1082'.'
        Title.Orientation = tohVertical
        Visible = False
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'VED_MAT_UNIQ'
        Footers = <>
        Visible = False
      end>
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 90
    Top = 5
    Width = 209
    Height = 21
    EditButtons = <>
    KeyField = 'project_id'
    ListField = 'project'
    ListFieldIndex = 2
    ListSource = DataSource1
    TabOrder = 1
    Visible = True
    OnChange = DBLookupComboboxEh1Change
  end
  object DBLookupComboboxEh2: TDBLookupComboboxEh
    Left = 90
    Top = 35
    Width = 209
    Height = 21
    Enabled = False
    EditButtons = <>
    ListFieldIndex = 2
    ListSource = DataSource2
    TabOrder = 2
    Visible = True
    OnChange = DBLookupComboboxEh2Change
    OnEnter = DBLookupComboboxEh2Enter
  end
  object Button1: TButton
    Left = 8
    Top = 800
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 800
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 1128
    Top = 800
    Width = 155
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 300
    Top = 800
    Width = 75
    Height = 25
    Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 984
    Top = 800
    Width = 147
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
    Enabled = False
    TabOrder = 7
    OnClick = Button5Click
  end
  object ComboBox1: TComboBox
    Left = 312
    Top = 8
    Width = 177
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 8
    OnChange = ComboBox1Change
  end
  object ProgressBar1: TProgressBar
    Left = 472
    Top = 800
    Width = 497
    Height = 17
    Max = 500
    TabOrder = 9
    Visible = False
  end
  object SimpleDataSet1: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 
      'select project_id,SUBSTRING(project,1,100) as project  from proj' +
      'ect_list order by project'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 984
    Top = 8
  end
  object SimpleDataSet2: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 
      'select spec_id, nomer, project_id, name,SPEC_NAME_BLOCK,vid_dok ' +
      'from SPEC_NAME'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'spec_id'
        DataType = ftInteger
      end
      item
        Name = 'nomer'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'project_id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'SPEC_NAME_BLOCK'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'vid_dok'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 992
    Top = 40
  end
  object DataSource1: TDataSource
    DataSet = SimpleDataSet1
    Left = 992
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = SimpleDataSet2
    Left = 936
    Top = 40
  end
  object SimpleDataSet3: TSimpleDataSet
    Active = True
    Aggregates = <
      item
        Visible = False
      end>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'select * from VED_MAT'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    DataSet.SortFieldNames = ' stroka '
    FieldDefs = <
      item
        Name = 'stroka'
        DataType = ftFloat
      end
      item
        Name = 'poz'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'kod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ed'
        DataType = ftFloat
      end
      item
        Name = 'kol'
        DataType = ftFloat
      end
      item
        Name = 'mass_ed'
        DataType = ftFloat
      end
      item
        Name = 'mass'
        DataType = ftFloat
      end
      item
        Name = 'mesto'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'kod_ved'
        DataType = ftInteger
      end
      item
        Name = 'pokr'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'sklad'
        DataType = ftSmallint
      end
      item
        Name = 'zak'
        DataType = ftSmallint
      end
      item
        Name = 'sbor'
        DataType = ftSmallint
      end
      item
        Name = 'obr'
        DataType = ftSmallint
      end
      item
        Name = 'sbor1'
        DataType = ftSmallint
      end
      item
        Name = 'sklad1'
        DataType = ftSmallint
      end
      item
        Name = 'montazh'
        DataType = ftSmallint
      end
      item
        Name = 'text'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ved_mat'
        DataType = ftInteger
      end
      item
        Name = 'ved_id'
        DataType = ftInteger
      end
      item
        Name = 'sprav_sprav_id'
        DataType = ftFloat
      end
      item
        Name = 'mech_izl'
        DataType = ftSmallint
      end
      item
        Name = 'section'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'post'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'rasp'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'reg_nad'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'VED_MAT_UNIQ'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 848
    Top = 8
    object SimpleDataSet3poz: TStringField
      FieldName = 'poz'
      FixedChar = True
      Size = 10
    end
    object SimpleDataSet3NAME: TStringField
      FieldName = 'NAME'
      FixedChar = True
      Size = 255
    end
    object SimpleDataSet3mesto: TStringField
      FieldName = 'mesto'
      FixedChar = True
      Size = 10
    end
    object SimpleDataSet3pokr: TStringField
      FieldName = 'pokr'
      FixedChar = True
      Size = 10
    end
    object SimpleDataSet3text: TStringField
      FieldName = 'text'
      FixedChar = True
      Size = 255
    end
    object SimpleDataSet3ved_mat: TIntegerField
      FieldName = 'ved_mat'
    end
    object SimpleDataSet3ved_id: TIntegerField
      FieldName = 'ved_id'
    end
    object SimpleDataSet3number_string: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'number_string'
      Calculated = True
    end
    object SimpleDataSet3kol: TFloatField
      FieldName = 'kol'
    end
    object SimpleDataSet3mass_ed: TFloatField
      FieldName = 'mass_ed'
    end
    object SimpleDataSet3mass: TFloatField
      FieldName = 'mass'
    end
    object SimpleDataSet3Sklad: TSmallintField
      FieldName = 'Sklad'
    end
    object SimpleDataSet3zak: TSmallintField
      FieldName = 'zak'
    end
    object SimpleDataSet3obr: TSmallintField
      FieldName = 'obr'
    end
    object SimpleDataSet3sklad1: TSmallintField
      FieldName = 'sklad1'
    end
    object SimpleDataSet3montazh: TSmallintField
      FieldName = 'montazh'
    end
    object SimpleDataSet3sbor1: TSmallintField
      FieldName = 'sbor1'
    end
    object SimpleDataSet3sbor: TSmallintField
      FieldName = 'sbor'
    end
    object SimpleDataSet3ed3: TStringField
      FieldKind = fkLookup
      FieldName = 'ed3'
      LookupDataSet = SimpleDataSet4
      LookupKeyFields = 'koded_id'
      LookupResultField = 'koded'
      KeyFields = 'ed'
      Lookup = True
    end
    object SimpleDataSet3ed: TFloatField
      FieldName = 'ed'
    end
    object SimpleDataSet3ed4: TStringField
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'ed4'
      LookupDataSet = SimpleDataSet4
      LookupKeyFields = 'koded_id'
      LookupResultField = 'koded'
      KeyFields = 'ed'
      Lookup = True
    end
    object SimpleDataSet3sprav_sprav_id: TFloatField
      FieldName = 'sprav_sprav_id'
    end
    object SimpleDataSet3kod_ved1: TStringField
      FieldKind = fkLookup
      FieldName = 'kod_ved1'
      LookupDataSet = SimpleDataSet5
      LookupKeyFields = 'kod_ved_id'
      LookupResultField = 'kod_ved_zak'
      KeyFields = 'kod_ved'
      Lookup = True
    end
    object SimpleDataSet3kod_ved: TIntegerField
      FieldName = 'kod_ved'
    end
    object SimpleDataSet3kod: TStringField
      FieldName = 'kod'
      FixedChar = True
      Size = 30
    end
    object SimpleDataSet3VED_MAT_UNIQ: TIntegerField
      FieldName = 'VED_MAT_UNIQ'
    end
    object SimpleDataSet3stroka: TFloatField
      FieldName = 'stroka'
    end
  end
  object DataSource3: TDataSource
    DataSet = SimpleDataSet3
    Left = 856
    Top = 40
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = -1
    ParamCheck = False
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = Form2.SQLConnection1
    Left = 928
    Top = 8
  end
  object SimpleDataSet4: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'select * from koded order by koded'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'koded_id'
        DataType = ftFloat
      end
      item
        Name = 'koded'
        DataType = ftMemo
      end
      item
        Name = 'kof'
        DataType = ftFloat
      end
      item
        Name = 'name'
        DataType = ftMemo
      end
      item
        Name = 'namek'
        DataType = ftMemo
      end
      item
        Name = 'koded_koded_id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 472
    Top = 8
    object SimpleDataSet4koded_id: TFloatField
      FieldName = 'koded_id'
    end
    object SimpleDataSet4koded: TMemoField
      FieldName = 'koded'
      BlobType = ftMemo
    end
    object SimpleDataSet4kof: TFloatField
      FieldName = 'kof'
    end
    object SimpleDataSet4name: TMemoField
      FieldName = 'name'
      BlobType = ftMemo
    end
    object SimpleDataSet4namek: TMemoField
      FieldName = 'namek'
      BlobType = ftMemo
    end
    object SimpleDataSet4koded_koded_id: TIntegerField
      FieldName = 'koded_koded_id'
    end
  end
  object SimpleDataSet5: TSimpleDataSet
    Active = True
    Aggregates = <>
    Connection = Form2.SQLConnection1
    DataSet.CommandText = 'select * from Vedomost_zakaza  order by kod_ved_zak'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    FieldDefs = <
      item
        Name = 'kod_ved_id'
        DataType = ftInteger
      end
      item
        Name = 'kod_ved_zak'
        Attributes = [faFixed]
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    ReadOnly = True
    StoreDefs = True
    Left = 424
    Top = 8
    object SimpleDataSet5kod_ved_id: TIntegerField
      FieldName = 'kod_ved_id'
    end
    object SimpleDataSet5kod_ved_zak: TStringField
      FieldName = 'kod_ved_zak'
      FixedChar = True
    end
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 760
    Top = 16
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 720
    Top = 16
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 680
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Left = 200
    Top = 784
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLDataSet1
    Options = [poCascadeUpdates, poPropogateChanges]
    UpdateMode = upWhereKeyOnly
    Left = 1264
    Top = 64
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'stroka'
        DataType = ftFloat
      end
      item
        Name = 'poz'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'kod'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ed'
        DataType = ftFloat
      end
      item
        Name = 'kol'
        DataType = ftFloat
      end
      item
        Name = 'mass_ed'
        DataType = ftFloat
      end
      item
        Name = 'mass'
        DataType = ftFloat
      end
      item
        Name = 'mesto'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'kod_ved'
        DataType = ftInteger
      end
      item
        Name = 'pokr'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'sklad'
        DataType = ftSmallint
      end
      item
        Name = 'zak'
        DataType = ftSmallint
      end
      item
        Name = 'sbor'
        DataType = ftSmallint
      end
      item
        Name = 'obr'
        DataType = ftSmallint
      end
      item
        Name = 'sbor1'
        DataType = ftSmallint
      end
      item
        Name = 'sklad1'
        DataType = ftSmallint
      end
      item
        Name = 'montazh'
        DataType = ftSmallint
      end
      item
        Name = 'text'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ved_mat'
        DataType = ftInteger
      end
      item
        Name = 'ved_id'
        DataType = ftInteger
      end
      item
        Name = 'sprav_sprav_id'
        DataType = ftFloat
      end
      item
        Name = 'VED_MAT_UNIQ'
        DataType = ftFloat
      end
      item
        Name = 'mech_izl'
        DataType = ftSmallint
      end
      item
        Name = 'section'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    MasterFields = 'VED_MAT_UNIQ'
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    BeforeInsert = ClientDataSet1BeforeInsert
    AfterPost = ClientDataSet1AfterPost
    BeforeDelete = ClientDataSet1BeforeDelete
    AfterDelete = ClientDataSet1AfterDelete
    OnCalcFields = ClientDataSet1CalcFields
    OnNewRecord = ClientDataSet1NewRecord
    Left = 1264
    Top = 96
    object ClientDataSet1stroka: TFloatField
      FieldName = 'stroka'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1poz: TStringField
      FieldName = 'poz'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object ClientDataSet1kod: TStringField
      FieldName = 'kod'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object ClientDataSet1NAME: TStringField
      FieldName = 'NAME'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object ClientDataSet1ed: TFloatField
      FieldName = 'ed'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1kol: TFloatField
      FieldName = 'kol'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1mass_ed: TFloatField
      FieldName = 'mass_ed'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1mass: TFloatField
      FieldName = 'mass'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1mesto: TStringField
      FieldName = 'mesto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object ClientDataSet1kod_ved: TIntegerField
      FieldName = 'kod_ved'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1pokr: TStringField
      FieldName = 'pokr'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object ClientDataSet1sklad: TSmallintField
      FieldName = 'sklad'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1zak: TSmallintField
      FieldName = 'zak'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1sbor: TSmallintField
      FieldName = 'sbor'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1obr: TSmallintField
      FieldName = 'obr'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1sbor1: TSmallintField
      FieldName = 'sbor1'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1sklad1: TSmallintField
      FieldName = 'sklad1'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1montazh: TSmallintField
      FieldName = 'montazh'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1text: TStringField
      FieldName = 'text'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object ClientDataSet1ved_mat: TIntegerField
      FieldName = 'ved_mat'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1ved_id: TIntegerField
      FieldName = 'ved_id'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1sprav_sprav_id: TFloatField
      FieldName = 'sprav_sprav_id'
      ProviderFlags = [pfInUpdate]
    end
    object ClientDataSet1number_string: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'number_string'
      ProviderFlags = [pfInUpdate]
      Visible = False
      Calculated = True
    end
    object ClientDataSet1kod_ved1: TStringField
      FieldKind = fkLookup
      FieldName = 'kod_ved1'
      LookupDataSet = SimpleDataSet5
      LookupKeyFields = 'kod_ved_id'
      LookupResultField = 'kod_ved_zak'
      KeyFields = 'kod_ved'
      Lookup = True
    end
    object ClientDataSet1ed4: TStringField
      FieldKind = fkLookup
      FieldName = 'ed4'
      LookupDataSet = SimpleDataSet4
      LookupKeyFields = 'koded_id'
      LookupResultField = 'koded'
      KeyFields = 'ed'
      ProviderFlags = [pfInUpdate]
      Lookup = True
    end
    object ClientDataSet1VED_MAT_UNIQ: TAutoIncField
      FieldName = 'VED_MAT_UNIQ'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object ClientDataSet1mech_izl: TSmallintField
      FieldName = 'mech_izl'
    end
    object ClientDataSet1section: TStringField
      FieldName = 'section'
    end
  end
  object DataSource4: TDataSource
    DataSet = ClientDataSet1
    Left = 1264
    Top = 144
  end
  object SQLDataSet1: TSQLDataSet
    DataSource = DataSource4
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 1264
    Top = 24
    object SQLDataSet1stroka: TFloatField
      FieldName = 'stroka'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1poz: TStringField
      FieldName = 'poz'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SQLDataSet1kod: TStringField
      FieldName = 'kod'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object SQLDataSet1NAME: TStringField
      FieldName = 'NAME'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object SQLDataSet1ed: TFloatField
      FieldName = 'ed'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1kol: TFloatField
      FieldName = 'kol'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1mass_ed: TFloatField
      FieldName = 'mass_ed'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1mass: TFloatField
      FieldName = 'mass'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1mesto: TStringField
      FieldName = 'mesto'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object SQLDataSet1kod_ved: TIntegerField
      FieldName = 'kod_ved'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1pokr: TStringField
      FieldName = 'pokr'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object SQLDataSet1sklad: TSmallintField
      FieldName = 'sklad'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1zak: TSmallintField
      FieldName = 'zak'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1sbor: TSmallintField
      FieldName = 'sbor'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1obr: TSmallintField
      FieldName = 'obr'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1sbor1: TSmallintField
      FieldName = 'sbor1'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1sklad1: TSmallintField
      FieldName = 'sklad1'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1montazh: TSmallintField
      FieldName = 'montazh'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1text: TStringField
      FieldName = 'text'
      ProviderFlags = [pfInUpdate]
      Size = 255
    end
    object SQLDataSet1ved_mat: TIntegerField
      FieldName = 'ved_mat'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1ved_id: TIntegerField
      FieldName = 'ved_id'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1sprav_sprav_id: TFloatField
      FieldName = 'sprav_sprav_id'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1VED_MAT_UNIQ: TAutoIncField
      FieldName = 'VED_MAT_UNIQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object SQLDataSet1mech_izl: TSmallintField
      FieldName = 'mech_izl'
      ProviderFlags = [pfInUpdate]
    end
    object SQLDataSet1section: TStringField
      FieldName = 'section'
      ProviderFlags = [pfInUpdate]
    end
  end
  object SQLQuery2: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '    SUBSTRING_INDEX(USER(), '#39'@'#39', 1) as USER_NAME')
    SQLConnection = Form2.SQLConnection1
    Left = 592
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 360
    Top = 16
    object N1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100
      Enabled = False
      OnClick = N2Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'EXEL xls|*xls|EXEL xlsx|*xlsx|EXEL xlsm|*xlsm'
    Left = 264
    Top = 792
  end
  object SQLQuery3: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Form2.SQLConnection1
    Left = 1088
    Top = 24
  end
end
