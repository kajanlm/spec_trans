unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GridsEh, DBGridEh, DB, DBClient, SimpleDS;

type
  TForm13 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation
uses Unit14;
{$R *.dfm}

procedure TForm13.FormShow(Sender: TObject);
begin
   if SimpleDAtaSet1.Active=true then  SimpleDAtaSet1.Active:=false;
   if SimpleDAtaSet1.DataSet.Active=true then  SimpleDAtaSet1.DataSet.Active:=false;
   SimpleDAtaSet1.DataSet.CommandText:='Select USER_ID,user_name,login, boss,(Select name from user_gr where user_gr_id=USER_GR) otdel from Users order by user_gr,user_name';
   SimpleDAtaSet1.DataSet.Active:=true;
   SimpleDAtaSet1.Active:=true;
end;

procedure TForm13.Button1Click(Sender: TObject);
begin
     Application.CreateForm(TForm14, Form14);
     Form14.Caption:='Ввод пользователя системы';
     Form14.ShowModal();


end;

procedure TForm13.Button3Click(Sender: TObject);
begin
    Application.CreateForm(TForm14, Form14);
     Form14.Caption:='Изменение пользователя';
    Form14.ShowModal();

end;

procedure TForm13.DBGridEh1DblClick(Sender: TObject);
begin
   Form13.Button3Click(nil);
end;

end.
