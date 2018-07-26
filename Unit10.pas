unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, GridsEh, DBGridEh, DBClient, SimpleDS;

type
  TForm10 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    DBGridEh1: TDBGridEh;
    DataSource2: TDataSource;
    SimpleDataSet1spec_id: TIntegerField;
    SimpleDataSet1nomer: TStringField;
    SimpleDataSet1project_id: TIntegerField;
    SimpleDataSet1name: TStringField;
    SimpleDataSet1project: TMemoField;
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit7;

{$R *.dfm}

procedure TForm10.DBGridEh1DblClick(Sender: TObject);
begin
Application.CreateForm(TForm7, Form7);
Form7.DBLookupComboBoxEH1.keyvalue:=DbgridEH1.DataSource.DataSet.fieldbyname('project_id').asinteger;
Form7.DBLookupComboBoxEH2.keyvalue:=DbgridEH1.DataSource.DataSet.fieldbyname('spec_id').asinteger;
Form7.Caption:= DbgridEH1.DataSource.DataSet.fieldbyname('project').asString+' '+DbgridEH1.DataSource.DataSet.fieldbyname('name').asString;
Form7.LABEL4.Caption:=Form7.DBLookupComboBoxEH2.keyvalue;
Form7.ShowModal;
end;

end.
