unit Unit14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, FMTBcd, DB, SqlExpr, DBGridEh,
  DBLookupEh, DBClient, SimpleDS;

type
  TForm14 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    SQLQuery1: TSQLQuery;
    DataSource1: TDataSource;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    SimpleDataSet1: TSimpleDataSet;
    SQLDataSet1: TSQLDataSet;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

uses Unit13;

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
 if (Edit1.text<>'') and (Edit2.text<>'') then
 begin
  if Caption<>'Изменение пользователя' then
  begin
   try
     begin
     SQLQuery1.SQL.Text:='Insert into Users (user_name,login,boss,user_gr) values ('''+Edit1.text+''','''+Edit2.text+''',';
     if CheckBox1.Checked=true then
     SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+'''1'''
     else
      SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+'''0''';

      SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+','''+IntToStr(DBLookupComboBoxEH1.ListSource.DataSet.FieldByName(DBLookupComboBoxEH1.KeyField).Value)+''')';

             SQLQuery1.ExecSQL;
         end;
     Except
    on E : Exception do
      ShowMessage(E.ClassName+' ОШИБКА : '+E.Message);
    end;
   end
  ELSE  /// изменение пользователя
   begin
    try
       begin
         SQLQuery1.SQL.Text:='UPDATE Users SET user_name='+chr(39)+Edit1.text+chr(39);
         SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+',login='+chr(39)+Edit2.text+chr(39);

   //      (user_name,login,boss,user_gr) values ('''+Edit1.text+''','''+Edit2.text+''',';
     if CheckBox1.Checked=true then
     SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+',boss='+chr(39)+'1'+chr(39)+','
     else
      SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+',boss='+chr(39)+'0'+chr(39)+',';

      SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+'USER_GR='+chr(39)+IntToStr(DBLookupComboBoxEH1.ListSource.DataSet.FieldByName(DBLookupComboBoxEH1.KeyField).Value)+chr(39);
     SQLQuery1.SQL.Text:=SQLQuery1.SQL.Text+' where USER_ID='+SQLDATASET1.FieldbyName('USER_ID').asString;
//    ShowMessage(SQLQuery1.SQL.Text);
           SQLQuery1.ExecSQL;
        end;
     Except
    on E : Exception do
      ShowMessage(E.ClassName+' ОШИБКА : '+E.Message);
    end;


   end;

    Form13.SimpleDataSet1.DataSet.Active:=false;
    Form13.SimpleDataSet1.Active:=false;
        Form13.SimpleDataSet1.DataSet.Active:=true;
        Form13.SimpleDataSet1.Active:=true;
       Close();
   end;
   end;


procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SQLQuery1.Close;
  SQLDATASET1.Active:=false;
end;

procedure TForm14.FormShow(Sender: TObject);
begin

if CAPTION='Изменение пользователя' THEN
  begin
  SQLDATASET1.Commandtext:='Select * from Users where USER_ID='+Form13.DBGridEh1.DataSource.DataSet.FieldbyName('USER_ID').AsString;
  SQLDATASET1.Active:=true;
    SQLDATASET1.Open;
   Edit1.text:=SQLDATASET1.FieldbyName('user_name').AsString;
   Edit2.text:=SQLDATASET1.FieldbyName('login').AsString;
   DBLookupComboboxEh1.KeyValue:=SQLDATASET1.FieldbyName('user_gr').value;
   if SQLDATASET1.FieldbyName('boss').value=1 then
     CheckBox1.Checked:=true
   else
     CheckBox1.Checked:=false;
  end;
end;

end.
