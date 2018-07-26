unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SimpleDS, StdCtrls, GridsEh, DBGridEh, FMTBcd,
  SqlExpr;

type
  TForm8 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    DBGridEh1: TDBGridEh;
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
  Form8: TForm8;

implementation

uses Unit6;

{$R *.dfm}

procedure TForm8.FormShow(Sender: TObject);
begin
//
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
Application.CreateForm(TForm6, Form6);
Form6.ShowModal();
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
    try
        SQLQuery1.SQL.Text:='DELETE from SPEC_NAME where spec_id='+DBGridEh1.DataSource.DataSet.FieldByName('spec_id').asString;
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
