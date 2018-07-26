unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, DB, DBClient, SimpleDS, DBGridEh,
  DBLookupEh, FMTBcd, SqlExpr;

type
  TForm6 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    DataSource1: TDataSource;
    Label1: TLabel;
    SimpleDataSet1project_id: TIntegerField;
    SimpleDataSet1project: TMemoField;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    SQLQuery1: TSQLQuery;
    procedure SimpleDataSet1projectGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit8;

{$R *.dfm}




procedure TForm6.SimpleDataSet1projectGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
Text := Sender.AsString;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
//DBLookupComboboxEh1.KeyValue:=1;

DBLookupComboBoxEH1.KeyValue := DBLookupComboBoxEH1.ListSource.DataSet.FieldByName(DBLookupComboBoxEH1.KeyField).Value;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
Form6.Close;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SQLQuery1.SQL.Text:='';
   Edit1.Text:='';
      Edit2.Text:='';
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
      try
        SQLQuery1.SQL.Text:='Insert into SPEC_NAME (nomer,name,project_id) values ('''+Edit1.text+''','''+Edit2.text+''','+IntToStr(DBLookupComboBoxEH1.KeyValue)+')';
         SQLQuery1.ExecSQL;
     Except
    on E : Exception do
      ShowMessage(E.ClassName+' Œÿ»¡ ¿ : '+E.Message);
    end;
    Form8.SimpleDataSet1.DataSet.Active:=false;
    Form8.SimpleDataSet1.Active:=false;
        Form8.SimpleDataSet1.DataSet.Active:=true;
        Form8.SimpleDataSet1.Active:=true;
       Close();
end;

end.
