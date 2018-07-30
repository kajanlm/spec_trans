object sn_mat: Tsn_mat
  Left = 341
  Top = 252
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
  ClientHeight = 608
  ClientWidth = 1098
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 16
    Width = 63
    Height = 20
    Caption = #1055#1088#1086#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 56
    Width = 128
    Height = 20
    Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 552
    Top = 32
    Width = 66
    Height = 20
    Caption = #1056#1077#1078#1080#1084': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 680
    Top = 32
    Width = 289
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #1056#1077#1078#1080#1084': '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    Visible = False
  end
  object Panel5: TPanel
    Left = 720
    Top = 568
    Width = 8
    Height = 33
    Color = clSkyBlue
    TabOrder = 14
  end
  object Panel4: TPanel
    Left = 57
    Top = 568
    Width = 8
    Height = 33
    Color = clSkyBlue
    TabOrder = 13
  end
  object Panel2: TPanel
    Left = 184
    Top = 568
    Width = 8
    Height = 33
    Color = clSkyBlue
    TabOrder = 11
  end
  object DBGridEh1: TDBGridEh
    Left = 17
    Top = 96
    Width = 1072
    Height = 457
    DataSource = DataSource1
    Enabled = False
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 75
    OnKeyDown = DBGridEh1KeyDown
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'pos'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1079#1080#1094#1080#1103
        Title.Orientation = tohVertical
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 179
      end
      item
        EditButtons = <>
        FieldName = 'doc'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1080#1083#1080' '#1082#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
        Width = 154
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ed.izm'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'. '#1080#1079#1084'.'
        Width = 61
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'col'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'.'
        Width = 51
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'mass.ek'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1052#1072#1089#1089#1072' '#1077#1076'., '#1082#1075
        Width = 59
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'mass.full'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1073#1097#1072#1103' '#1084#1072#1089#1089#1072', '#1082#1075
        Width = 76
      end
      item
        EditButtons = <>
        FieldName = 'from'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'location'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077
        Width = 113
      end
      item
        EditButtons = <>
        FieldName = 'n.reg'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1076#1079#1086#1088' '#1056#1077#1075#1080#1089#1090#1088#1072
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'comment'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 100
      end>
  end
  object cb_project: TComboBox
    Left = 200
    Top = 16
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = cb_projectChange
  end
  object cb_specs: TComboBox
    Left = 200
    Top = 56
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 16
    TabOrder = 1
    OnChange = cb_specsChange
    OnClick = cb_specsClick
  end
  object invi_cb_project: TComboBox
    Left = 256
    Top = 720
    Width = 41
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 2
    Visible = False
    OnChange = cb_projectChange
  end
  object invi_cb_specs: TComboBox
    Left = 256
    Top = 712
    Width = 41
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    Visible = False
    OnChange = cb_projectChange
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 552
    Width = 1073
    Height = 9
    TabOrder = 5
    Visible = False
  end
  object Button1: TButton
    Left = 752
    Top = 576
    Width = 177
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 960
    Top = 576
    Width = 113
    Height = 25
    Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 544
    Top = 56
    Width = 73
    Height = 17
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 72
    Top = 576
    Width = 105
    Height = 25
    Caption = #1057#1054#1061#1056#1040#1053#1048#1058#1068
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Button4Click
  end
  object Panel1: TPanel
    Left = -24
    Top = 568
    Width = 1225
    Height = 5
    Color = clSkyBlue
    TabOrder = 10
  end
  object Panel3: TPanel
    Left = -127
    Top = 600
    Width = 1225
    Height = 5
    Color = clSkyBlue
    TabOrder = 12
  end
  object Button5: TButton
    Left = 304
    Top = 576
    Width = 105
    Height = 25
    Caption = #1044#1054#1041#1040#1042#1048#1058#1068
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 496
    Top = 576
    Width = 105
    Height = 25
    Caption = #1059#1044#1040#1051#1048#1058#1068
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = Button6Click
  end
  object Query1: TSQLQuery
    Params = <>
    Left = 8
    Top = 704
  end
  object Query2: TSQLQuery
    Params = <>
    Left = 48
    Top = 704
  end
  object OpenDialog1: TOpenDialog
    Filter = 'EXEL xls|*xls|EXEL xlsx|*xlsx|EXEL xlsm|*xlsm'
    Left = 168
    Top = 704
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 88
    Top = 704
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'pos'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'doc'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ed.izm'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'col'
        DataType = ftFloat
      end
      item
        Name = 'mass.ek'
        DataType = ftFloat
      end
      item
        Name = 'mass.full'
        DataType = ftFloat
      end
      item
        Name = 'from'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'location'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'n.reg'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'comment'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = ClientDataSet1AfterEdit
    Left = 128
    Top = 704
  end
  object SaveDialog1: TSaveDialog
    Left = 208
    Top = 704
  end
end
