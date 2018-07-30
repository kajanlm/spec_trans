unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DBXpress, DB, SqlExpr, MidasLib, FMTBcd;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    SQLConnection1: TSQLConnection;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    SQLDataSet1: TSQLDataSet;
    N10: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SQLConnection1Login(Database: TSQLConnection;
      LoginParams: TStrings);
  private
    { Private declarations }
  public
    GLOBAL_LOGIN : string;
    function strOnlyDigits(str : string) : boolean;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses spec, Unit3,  Unit7,Unit8, Unit10,Unit11,Unit13,Unit16, Unit17;

{$R *.dfm}

function TForm2.strOnlyDigits(str : string) : boolean;
var
i : integer;
begin

for i:=1 to length(str) do
  if not (str[i] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) then
  begin
    strOnlyDigits := false;
    exit;
  end;

strOnlyDigits := true;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 Application.CreateForm(TForm1, Form1);
Form1.ShowModal();
end;

procedure TForm2.N4Click(Sender: TObject);
begin
 Application.CreateForm(TForm3, Form3);
 //Form3.DBGRidEh1.Columns[0].FieldName:='project';
 // Form3.DBGRidEh1.Columns[0].Title.caption:='ѕроект';
 //Form3.DBGRidEh1.Columns[0].Width:=148;
 Form3.ShowModal();
end;

procedure TForm2.N2Click(Sender: TObject);
begin
  //  Application.CreateForm(TForm3, Form3);
//Form3.ShowModal();
end;

procedure TForm2.N5Click(Sender: TObject);
begin
  Application.CreateForm(TForm10, Form10);
    Form10.ShowModal();

end;

procedure TForm2.N6Click(Sender: TObject);
begin
   Application.CreateForm(TForm7, Form7);
    Form7.ShowModal();
 //   Application.CreateForm(TForm16, Form16);
//Form16.ShowModal();
end;

procedure TForm2.N7Click(Sender: TObject);
begin
        Application.CreateForm(TForm8, Form8);
     Form8.ShowModal();
end;

procedure TForm2.N8Click(Sender: TObject);
begin
     Application.CreateForm(TForm11, Form11);
     Form11.ShowModal();
end;

procedure TForm2.N9Click(Sender: TObject);
begin
     Application.CreateForm(TForm13, Form13);
     Form13.ShowModal();
end;

procedure TForm2.FormShow(Sender: TObject);
begin

  SQLDATASet1.CommandText := '(SELECT SUBSTRING_INDEX(USER(), ''@'', 1))';
  SQLDATASet1.Active:=true;

  GLOBAL_LOGIN := SQLDATASet1.Fields[0].AsString;

  SQLDATASet1.Close;
  SQLDATASet1.CommandText:='Select DISTINCT USER_GR from `Users` where login = ''' + GLOBAL_LOGIN+'''';
  SQLDATASet1.Active:=true;

 if SQLDATASet1.FieldByName('USER_GR').AsString='1' then
   begin
   MainMenu1.Items[0].Items[4].Visible:=true;
   MainMenu1.Items[0].Items[3].Visible:=true;

   end;

 Application.HintColor := clGray;

end;

procedure TForm2.N10Click(Sender: TObject);
begin
     Application.CreateForm(Tsn_mat, sn_mat);
     sn_mat.ShowModal();
     sn_mat.Free; //при множественных открыти€х чистим пам€ть
end;

procedure TForm2.SQLConnection1Login(Database: TSQLConnection;
  LoginParams: TStrings);
begin
//showmessage(LoginParams.getText);
end;

end.
