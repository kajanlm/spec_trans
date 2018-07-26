unit Unit12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr;

type
  TForm12 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses Unit11;

{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
 if Edit1.text<>'' then
   begin
   try
     SQLQuery1.SQL.Text:='Insert into user_gr (name) values ('''+Edit1.text+''')';
         SQLQuery1.ExecSQL;
     Except
    on E : Exception do
      ShowMessage(E.ClassName+' Œÿ»¡ ¿ : '+E.Message);
    end;
    Form11.SimpleDataSet1.DataSet.Active:=false;
    Form11.SimpleDataSet1.Active:=false;
        Form11.SimpleDataSet1.DataSet.Active:=true;
        Form11.SimpleDataSet1.Active:=true;
       Close();
   end;
end;

end.
