unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm15 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses Unit7;

{$R *.dfm}

procedure TForm15.ListBox1DblClick(Sender: TObject);
begin
Form7.index1:=listBox1.ItemIndex+1;
Close;
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ListBox1.Clear;
end;

procedure TForm15.FormShow(Sender: TObject);
var ee:integer;
begin
ee:=0;
with ListBox1 do
 begin
 while Items.Count>ee DO
  begin
    if (trim(Items[ee])='спецификация') or (trim(Items[ee])='Спецификация') or (Items[ee]='Завод') or (Items[ee]='завод') then
     begin
      ItemIndex:=ee;
      SetFocus;
      end;
    ee:=ee+1;
   end;
  end;
end;

procedure TForm15.Button1Click(Sender: TObject);
begin
  ListBox1DblClick(Nil);
end;

end.
