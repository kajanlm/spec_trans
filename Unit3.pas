unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GridsEh, DBGridEh, DB, DBClient, SimpleDS, FMTBcd,
  SqlExpr;

type
  TForm3 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
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
  Form3: TForm3;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
DBGRidEh1.Columns[0].Width:=148;
DBGRidEh1.Columns[1].Width:=340;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
Application.CreateForm(TForm5, Form5);
Form5.ShowModal();
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
       try
        SQLQuery1.SQL.Text:='DELETE from  project_list where project_id='+DBGridEh1.DataSource.DataSet.FieldByName('project_id').asString;
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
