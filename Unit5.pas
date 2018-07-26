unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FMTBcd, DB, SqlExpr, StdCtrls, DBGridEh, Mask, DBCtrlsEh,
  DBLookupEh, DBClient, SimpleDS;

type
  TForm5 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    SQLQuery1: TSQLQuery;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label3: TLabel;
    DataSource1: TDataSource;
    SimpleDataSet1: TSimpleDataSet;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit3;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
      try
        SQLQuery1.SQL.Text:='Insert into project_list (project,name,boss) values ('''+Edit1.text+''','''+Edit2.text+''','''+
       IntToStr(DBLookupComboBoxEH1.ListSource.DataSet.FieldByName(DBLookupComboBoxEH1.KeyField).Value)+''')';
         SQLQuery1.ExecSQL;
     Except
    on E : Exception do
      ShowMessage(E.ClassName+' Œÿ»¡ ¿ : '+E.Message);
    end;
    Form3.SimpleDataSet1.DataSet.Active:=false;
    Form3.SimpleDataSet1.Active:=false;
        Form3.SimpleDataSet1.DataSet.Active:=true;
        Form3.SimpleDataSet1.Active:=true;
       Close(); 
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SQLQuery1.SQL.Text:='';
   Edit1.Text:='';
      Edit2.Text:='';
end;

end.
