object Form2: TForm2
  Left = 375
  Top = 410
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' v3.0'
  ClientHeight = 171
  ClientWidth = 1189
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 544
    Top = 32
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N3: TMenuItem
        Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1086#1088
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1055#1088#1086#1077#1082#1090#1099
        OnClick = N4Click
      end
      object N7: TMenuItem
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1081
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1054#1090#1076#1077#1083#1099
        Visible = False
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        Visible = False
        OnClick = N9Click
      end
    end
    object N2: TMenuItem
      Caption = #1046#1091#1088#1085#1072#1083' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1081
      OnClick = N2Click
      object N5: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1042#1042#1077#1089#1090#1080' '#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
        OnClick = N6Click
      end
      object N10: TMenuItem
        Caption = #1042#1074#1077#1089#1090#1080' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102' '#1089#1085#1072#1073#1078#1077#1085#1080#1103
        OnClick = N10Click
      end
    end
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'Devart MySQL'
    DriverName = 'DevartMySQL'
    GetDriverFunc = 'getSQLDriverMySQL'
    LibraryName = 'dbexpmda.dll'
    Params.Strings = (
      'BlobSize=-1'
      'HostName=192.168.1.125'
      'DataBase=ya'
      'DriverName=DevartMySQL'
      'User_Name='
      'Password='
      'FetchAll=True'
      'EnableBoolean=False'
      'ServerCharSet=cp1251')
    VendorLib = 'libmysql.dll'
    Connected = True
    Left = 608
    Top = 32
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 800
  end
end
