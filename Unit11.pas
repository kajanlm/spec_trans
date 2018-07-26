unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBClient, SimpleDS, GridsEh, DBGridEh, FMTBcd,
  SqlExpr;

type
  TForm11 = class(TForm)
    DBGridEh1: TDBGridEh;
    SimpleDataSet1: TSimpleDataSet;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    SQLQuery1: TSQLQuery;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses Unit12;
{$R *.dfm}

procedure TForm11.FormShow(Sender: TObject);
begin
   if SimpleDAtaSet1.Active=true then  SimpleDAtaSet1.Active:=false;
   if SimpleDAtaSet1.DataSet.Active=true then  SimpleDAtaSet1.DataSet.Active:=false;
   SimpleDAtaSet1.DataSet.CommandText:='Select * from user_gr order by name';
   SimpleDAtaSet1.DataSet.Active:=true;
   SimpleDAtaSet1.Active:=true;
end;

procedure TForm11.Button1Click(Sender: TObject);
begin
     Application.CreateForm(TForm12, Form12);
     Form12.ShowModal();
end;

procedure TForm11.Button2Click(Sender: TObject);
begin
       try
        SQLQuery1.SQL.Text:='DELETE from  user_gr where user_gr_id='+DBGridEh1.DataSource.DataSet.FieldByName('user_gr_id').asString;
         SQLQuery1.ExecSQL;
     Except
    on E : Exception do
      ShowMessage(E.ClassName+' Œÿ»¡ ¿ : '+E.Message);
    end;
       SimpleDataSet1.DataSet.Active:=false;
       SimpleDataSet1.Active:=false;
       SimpleDataSet1.DataSet.Active:=true;
       SimpleDataSet1.Active:=true;
end;

end.
