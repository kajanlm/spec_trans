unit Unit18;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm18 = class(TForm)
    Label3: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Label12: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button1: TButton;
    cb_ed: TComboBox;
    invi_cb_ed: TComboBox;
    Label21: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure EditsChanged(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12Change(Sender: TObject);
  private
    function Validate : boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

uses Unit2,Unit17;

{$R *.dfm}

function TForm18.Validate : boolean;

var

temp,
error
: Integer;

begin
if trim(edit1.Text) = '' then
begin
  sn_mat.Alert('Нехватка данных', 'Заполните поле "Позиция"!');
  edit1.Color := clRed;

  Validate := false;
  exit;
end;

if trim(edit2.Text) = '' then
begin
  sn_mat.Alert('Нехватка данных', 'Заполните поле "Наименование"!');
  edit2.Color := clRed;

  Validate := false;
  exit;
end;

if ((trim(edit3.Text) = '') or (trim(edit12.Text) = '')) then
begin
  sn_mat.Alert('Нехватка данных', 'Заполните поля "Документ" и "КОД"!');
  edit3.Color := clRed;
  edit12.Color := clRed;

  Validate := false;
  exit;
end;

if not form2.strOnlyDigits(trim(edit12.text)) then
begin
  sn_mat.Alert('Некорретные данные', 'В поле "КОД" разрешены только целочисленные значения!');
  edit12.Color := clRed;

  validate := false;
  exit;
end;

if ((cb_ed.Items.Count = 0) or (cb_ed.ItemIndex = -1) or (invi_cb_ed.Items.Count = 0)) then
begin
  sn_mat.Alert('Нехватка данных', 'Выберите единицу измерения (для загрузки единиц измерения материала: '
  +'Введите данные в поле "КОД" -> Нажмите "Enter")');
  cb_ed.Color := clRed;

  Validate := false;
  exit;
end;

if trim(edit5.Text) = '' then
begin
  sn_mat.Alert('Нехватка данных', 'Заполните поле "Количество"!');
  edit5.Color := clRed;

  Validate := false;
  exit;
end;

if trim(edit6.Text) = '' then
begin
  sn_mat.Alert('Нехватка данных', 'Заполните поле "Масса ед. кг"!');
  edit6.Color := clRed;

  Validate := false;
  exit;
end;

if trim(edit7.Text) = '' then
begin
  sn_mat.Alert('Нехватка данных', 'Заполните поле "Общая масса, кг"!');
  edit7.Color := clRed;

  Validate := false;
  exit;
end;

Validate := true;

end;

procedure TForm18.Button1Click(Sender: TObject);
begin
  (* 1,2, 3-12, combobox1, 5, 6, 7, 8, 9, 10, 11 *)

if Validate = false then
  exit;

sn_mat.DataChanged := true;

sn_mat.Button4.Enabled := true;
sn_mat.Button5.Enabled := true;
sn_mat.Button6.Enabled := true;

sn_mat.DBGridEh1.DataSource.DataSet.Append;

sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('pos').Value := trim(edit1.Text);
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('name').Value := edit2.Text + ' ' + edit3.Text;
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('doc').Value := Trim(edit12.Text);
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('ed.izm').Value := cb_ed.Items[cb_ed.ItemIndex];
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('col').Value := Trim(Edit5.Text);
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('mass.ek').Value := Trim(edit6.Text);
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('mass.full').Value := Trim(edit7.Text);
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('from').Value := edit8.Text;
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('location').Value := edit9.Text;
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('n.reg').Value := edit10.Text;
sn_mat.DbgridEh1.DataSource.DataSet.FieldByName('comment').Value := edit11.Text;

sn_mat.dbgrideh1.Enabled := true;

Form18.Close;

end;

procedure TForm18.Edit12KeyPress(Sender: TObject; var Key: Char);

var

fkod,
skod,
tkod
: String;

begin
(* получение единиц измерения *)
if ((key = #13) and (trim(Edit12.Text) <> '')) then
begin
  cb_ed.Clear;
  invi_cb_ed.Clear;

  sn_mat.Query1.Close;
  sn_mat.Query1.SQL.Text := 'SELECT koded_id, koded_koded_id2, koded_koded_id_koded2 FROM SPRAV where kod = "' + trim(edit12.Text) + '"';
  sn_mat.Query1.Open;

  if sn_mat.Query1.RecordCount <> 0 then
  begin
    fkod := sn_mat.Query1.FieldByName('koded_id').asString;
    skod := sn_mat.Query1.FieldByName('koded_koded_id2').asString;
    tkod := sn_mat.Query1.FieldByName('koded_koded_id_koded2').asString;
  end
  else
  begin
    fkod := '0';
    skod := '0';
    tkod := '0';
  end;

  sn_mat.Query1.Close;
  sn_mat.Query1.SQL.Text := 'SELECT namek, koded FROM koded WHERE koded_id in(' + fkod +',' + skod + ',' + tkod + ')';
  sn_mat.Query1.Open;

  if sn_mat.Query1.RecordCount <> 0 then
  begin
    while sn_mat.Query1.Eof = false do
    begin
      cb_ed.Items.Add(sn_mat.Query1.FieldByName('namek').asString);
      invi_cb_ed.Items.Add(sn_mat.Query1.FieldByName('koded').asString);

      sn_mat.Query1.Next;
    end;
  end
  else
  begin
    sn_mat.Alert('Не найдены единицы измерения', 'Для указанного кода не найдены единицы измерения');
    cb_ed.Items.Add('шт');
    invi_cb_ed.Items.Add('796'); //единица измерения "ШТУКИ" - по умолчанию (если не нашли в справочнике)
  end;

  cb_ed.ItemIndex := 0;

  sn_mat.Query1.Close;
  sn_mat.Query1.SQL.Text := 'SELECT mass FROM SPRAV WHERE kod = "' + trim(edit12.text) + '"';
  sn_mat.Query1.Open;

  if sn_mat.Query1.FieldByName('mass').asString <> '0' then
    edit6.Text := sn_mat.Query1.FieldByName('mass').asString;
  
end;

end;

procedure TForm18.EditsChanged(Sender: TObject);
begin

edit1.Color := clWhite;
edit2.Color := clWhite;
edit3.Color := clWhite;
edit12.Color := clWhite;
edit5.Color := clWhite;
edit6.Color := clWhite;
edit7.Color := clWhite;
cb_ed.Color := clWhite;

end;

procedure TForm18.Edit5KeyPress(Sender: TObject; var Key: Char);

var
count,
mass
: real;

begin
if ((key = #13) and (trim(edit5.text) <> ''))then
begin
  try
    count := strtofloat(StringReplace(trim(edit5.Text), '.', ',', [rfReplaceAll]));
  except
    sn_mat.Alert('Ошибка конвертации', 'Количество может быть выражено только целым или вещественным числом!');
    exit;
  end;

  edit5.Text := floattostr(count);

  if trim(edit6.Text) <> '' then
  begin
    try
      mass := strtofloat(StringReplace(trim(edit6.Text), '.', ',', [rfReplaceAll]));
    except
      sn_mat.Alert('Ошибка конвертации', 'Масса ед. кг может быть выражено только целым или вещественным числом');
      exit;
    end;

    edit6.Text := floattostr(mass);
    edit7.Text := ( floattostr(count * mass) );
  end;

end;

end;

procedure TForm18.Edit12Change(Sender: TObject);

var
dummy  //пустышка для вызова функции события "onChanged" всех edit'ов для покраски в стандартный цвет
: TObject;

begin
if cb_ed.ItemIndex <> -1 then
  cb_ed.Clear;

dummy := nil;
EditsChanged(dummy);
end;

end.
