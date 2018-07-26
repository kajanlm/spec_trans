unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, FMTBcd, DB, SqlExpr;

type
  TForm16 = class(TForm)
    StringGrid1: TStringGrid;
    SQLQuery1: TSQLQuery;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

procedure renew_table(Sender: TObject; order:boolean);
var stroka:Integer;
begin

With FORM16 DO
  Begin
 StringGrid1.RowCount:=2; 
 SQLQuery1.SQL.Text:='select * from VED_MAT  where ved_id=26 order by stroka';
 SQLQuery1.Active:=true;
 //SQLQuery1.ExecSQL();
 SQLQuery1.First;
 While Not SQLQuery1.Eof Do
    begin
       StringGrid1.Cells[0,StringGrid1.RowCount-1]:=IntToStr(StringGrid1.RowCount-1);
       StringGrid1.Cells[1,StringGrid1.RowCount-1]:=SQLQuery1.FieldbyName('poz').AsString;
       StringGrid1.Cells[2,StringGrid1.RowCount-1]:=SQLQuery1.FieldbyName('kod').AsString;
//       StringGrid1.Col:=StringGrid1.RowCount-1;
       StringGrid1.RowCount:=StringGrid1.RowCount+1;
       SQLQuery1.Next;
    end;


 end;
end ;

procedure TForm16.FormShow(Sender: TObject);
begin
  renew_table(nil,true);

// Cells[j, i];
end;

end.
