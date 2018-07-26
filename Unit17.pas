unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr, GridsEh, DBGridEh, ComCtrls, ExcelXP,
  ComObj, DBClient;

type
  Tsn_mat = class(TForm)
    cb_project: TComboBox;
    cb_specs: TComboBox;
    Query1: TSQLQuery;
    Query2: TSQLQuery;
    invi_cb_project: TComboBox;
    invi_cb_specs: TComboBox;
    DBGridEh1: TDBGridEh;
    ProgressBar1: TProgressBar;
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure cb_projectChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_specsChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cb_specsClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    procedure CheckLockSpec(WarnNeed : boolean);
    procedure UnlockCurrentSpec;
    procedure ClearDataSet;
    { Private declarations }
  public
    Index1 : integer;
    DataChanged : boolean;
    procedure Alert(t,s : string);
    { Public declarations }
  end;

var
  sn_mat: Tsn_mat;
  SELECTED_PROJECT, SELECTED_SPEC, LoginLock : string;
  OnlyReadWE : boolean;

implementation

uses Unit2,Unit15;

{$R *.dfm}

procedure Tsn_mat.Alert(t,s : string);
begin
MessageBox(0, pChar(s), pChar(t), mb_Ok+MB_ICONINFORMATION);
end;

procedure Tsn_mat.ClearDataSet;
begin
while(not dbgrideh1.DataSource.Dataset.IsEmpty) do
  dbgrideh1.DataSource.Dataset.Delete;
end;

procedure Tsn_mat.CheckLockSpec(WarnNeed : boolean);
begin
if SELECTED_SPEC = '' then
  exit;
  
Query2.Close;
Query2.SQL.Text:='SELECT SPEC_ID, SPEC_NAME_BLOCK FROM SPEC_NAME WHERE spec_id = ' + SELECTED_SPEC;
Query2.Open;

Label3.Visible := true;
Label4.Visible := true;
button3.Visible := true;

LoginLock := Query2.FieldByName('SPEC_NAME_BLOCK').AsString;

if ((LoginLock <> Form2.GLOBAL_LOGIN) and
(LoginLock <> '')) then
begin
  OnlyReadWE := true;
  Label4.Caption := 'ТОЛЬКО ЧТЕНИЕ';

  if WarnNeed then
    Alert('ТОЛЬКО ЧТЕНИЕ', 'В данный момент спецификация заблокирована пользователем: ' +
    Query2.FieldByName('SPEC_NAME_BLOCK').AsString);
end
else
begin
  OnlyReadWE := false;
  Label4.Caption := 'ЧТЕНИЕ, ИЗМЕНЕНИЕ';

  Query2.Close;
  Query2.SQL.Text := 'UPDATE SPEC_NAME SET SPEC_NAME_BLOCK = ' + char(39) + Form2.GLOBAL_LOGIN + char(39) + ' WHERE spec_id = '
  +SELECTED_SPEC;
  Query2.ExecSQL;

  if WarnNeed then
    Alert('ЧТЕНИЕ, ИЗМНЕНИЕ', 'Спецификация открыта для редактирования, будьте внимательны!');
end;

end;

procedure Tsn_mat.UnlockCurrentSpec;
begin
if ((cb_specs.enabled) and (cb_specs.ItemIndex <> -1)) then
  CheckLockSpec(false);

if LoginLock = Form2.GLOBAL_LOGIN then
begin
  Query2.Close;
  Query2.SQL.Text := 'UPDATE SPEC_NAME SET SPEC_NAME_BLOCK = NULL WHERE spec_id = '
  +SELECTED_SPEC;
  Query2.ExecSQL;

  OnlyReadWE := false;
  LoginLock := '';
end;

end;

procedure Tsn_mat.FormShow(Sender: TObject);
begin
(*
очистка полей и форм
*)
cb_project.Clear;
invi_cb_project.Clear;
cb_specs.Clear;
invi_cb_specs.Clear;

DataChanged := false;

(*
интерфейс с бд
*)
Query1.Close;
Query2.Close;

if Query1.SQLConnection = nil then
  Query1.SQLConnection := Form2.SQLConnection1;

if Query2.SQLConnection = nil then
  Query2.SQLConnection := Form2.SQLConnection1;

(*
загрузка проектов
*)
Query1.SQL.Text := 'SELECT * FROM project_list';
Query1.Open;

Query1.First;
while not(Query1.EOF) do
begin
  cb_project.Items.Add(Query1.FieldByName('project').asString);
  invi_cb_project.Items.Add(Query1.FieldByName('project_id').asString);

  Query1.Next;
end;
cb_project.ItemIndex := -1;

(*
Create dataset struct
*)
if ClientDataSet1.Active=false then
  ClientDataSet1.CreateDataSet;

OnlyReadWE := false;
LoginLock := '';
SELECTED_SPEC := '';

end;

procedure Tsn_mat.cb_projectChange(Sender: TObject);
begin
if cb_project.ItemIndex = -1 then
  exit;

UnlockCurrentSpec;

(*
загрузка спецификаций
*)
cb_specs.Clear;
invi_cb_specs.Clear;
SELECTED_PROJECT := invi_cb_project.Items[cb_project.ItemIndex];

Label3.Visible := false;
Label4.Visible := false;
button1.Enabled := false;
button2.Enabled := false;
button3.Visible := false;

Query1.Close;
Query1.SQL.Text := 'Select ddd.nomer, ddd.spec_id, ddd.name,ddd.SPEC_NAME_BLOCK,ddd.vid_dok from '
+'((Select SUBSTRING(nomer,1,100) as nomer, spec_id, name,SPEC_NAME_BLOCK,vid_dok from SPEC_NAME where project_id=1 AND (vid_dok = 3))'
+'union all (select SUBSTRING(nomer,1,100) as nomer, spec_id, name,SPEC_NAME_BLOCK,vid_dok from '
+'SPEC_NAME where project_id=' + SELECTED_PROJECT + ' AND (vid_dok = 3)))ddd order by nomer';
Query1.Open;

Query1.First;
while not(Query1.EOF) do
begin
  cb_specs.Items.Add(Query1.FieldByName('nomer').asString);
  invi_cb_specs.Items.Add(Query1.FieldByName('spec_id').asString);

  Query1.Next;
end;

cb_specs.Enabled := true;
cb_specs.ItemIndex := -1;

Button4.Enabled := false;
DataChanged := false;
ClearDataSet;
end;

procedure Tsn_mat.cb_specsChange(Sender: TObject);

var

tname,
doc,
ed
: String;

begin
if cb_specs.ItemIndex = -1 then
  exit;

UnlockCurrentSpec;
(*
if invi_cb_specs2.Items[cb_specs.ItemIndex] = '' then
begin
  Button4.Enabled := true;
  alert('Неопределенный тип спецификации', 'Тип данной спецификации не определен, вы можете преобразовать его в '
  +'"Спефикация снабжения", нажав кнопку "Преобразовать"');

  dbgrideh1.ReadOnly := true;
end;
*)

ClearDataSet;

Query1.Close;
Query1.SQL.Text := 'SELECT * FROM VED_MAT WHERE ved_id = '+invi_cb_specs.Items[cb_specs.ItemIndex];
Query1.Open;

SELECTED_SPEC := invi_cb_specs.Items[cb_specs.ItemIndex];
CheckLockSpec(true);

if Query1.RecordCount = 0 then
begin
  alert('Пустая спецификация','Выбранная спецификация не содержит записей');
  Button4.Enabled := false;
  DataChanged := false;
  exit;
end;

dbgrideh1.DataSource.Dataset.First;
while Query1.Eof = false do
begin
  dbgrideh1.DataSource.DataSet.Append;

  tname := copy(query1.FieldByName('name').asString, 1, (pos('[#]', query1.FieldByName('name').asString) - 1));
  doc := copy(query1.FieldByName('name').asString, (pos('[#]', query1.FieldByName('name').asString) + 3), 50); //extreme value 50
  doc := doc + ' (' + query1.FieldByName('kod').asString + ')';

  Query2.Close;
  Query2.SQL.Text := 'SELECT namek FROM koded WHERE koded = ' + query1.FieldByName('ed').asString;
  Query2.Open;

  if Query2.RecordCount = 0 then
    ed := 'Неизвестно'
  else   
    ed := AnsiLowerCase(query2.FieldByName('namek').AsString);

  DbgridEh1.DataSource.DataSet.FieldByName('pos').Value := query1.FieldByName('poz').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('name').Value := tname;
  DbgridEh1.DataSource.DataSet.FieldByName('doc').Value := doc;
  DbgridEh1.DataSource.DataSet.FieldByName('ed.izm').Value := ed;
  DbgridEh1.DataSource.DataSet.FieldByName('col').Value := query1.FieldByName('kol').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('mass.ek').Value := query1.FieldByName('mass_ed').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('mass.full').Value := query1.FieldByName('mass').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('from').Value := query1.FieldByName('post').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('location').Value := query1.FieldByName('rasp').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('n.reg').Value := query1.FieldByName('reg_nad').asString;
  DbgridEh1.DataSource.DataSet.FieldByName('comment').Value := query1.FieldByName('text').asString;

  dbgrideh1.DataSource.Dataset.Next;
  Query1.Next;
end;

dbgrideh1.Enabled := true;
button1.Enabled := true;
button2.Enabled := true;
Button4.Enabled := false;
DataChanged := false;

end;

procedure Tsn_mat.Button3Click(Sender: TObject);
begin
if cb_specs.ItemIndex = -1 then
  exit;
  
CheckLockSpec(true);
end;

procedure Tsn_mat.Button1Click(Sender: TObject);
var
Excel : Variant;
NameOfFile : string;
WorkBookCount, qq, Index,  Index_list : integer;
OldCursor : TCursor;
begin

OldCursor := crDefault;
Index1 := 0;

With OpenDialog1 Do

if Execute then
  NameOfFile:=FileName;
try
Excel := CreateOleObject('Excel.Application');
except
begin
  Application.MessageBox('Ошибка Excel', 'Не удается соединиться с Excel средой, приложение будет закрыто!', 0);
  UnLockCurrentSpec;
  Application.Terminate;
end;

end;

if  NameOfFile <> '' then
begin

  Excel.Workbooks.Add[NameOfFile];
  Excel.DisplayAlerts := False;
  Excel.Visible := false;
  index_list := 0;
  workbookCount := Excel.Worksheets.Count;
  qq := 0;

  with Form15 Do
  begin

    Caption:='Выберите несущую';

    While workbookCount > qq DO
    Begin
      qq := qq + 1;
      ListBox1.Items.Add(Excel.Sheets[qq].Name);
    end;

    form15.Return_type := false;
    ShowModal();

    if Index1 <> 0 then
      index_list := Index1;
  end;

  if index_list <> 0 then
  begin

    try
       Excel.Worksheets[index_list].Select;
    except
       Excel.Worksheets['Завод'].Select;
    end;

    ProgressBar1.Visible := true;
    ProgressBar1.Max := Excel.ActiveSheet.UsedRange.Rows.Count;
    Index := 10;

    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    self.Cursor := Screen.Cursor;

    DbGridEh1.DataSource.DataSet.First;
    DbGridEh1.DataSource.DataSet.DisableControls;

    Application.ProcessMessages;

    button1.Enabled := false;
    button2.enabled := false;

    while index <= Excel.ActiveSheet.UsedRange.Rows.Count do
    begin

      if (((trim(Excel.Cells[index, 3].text) <> '') and (trim(Excel.Cells[index, 4].text) <> ''))
      and ((trim(Excel.Cells[index, 3].text) <> 'Поз.') and (trim(Excel.Cells[index, 4].text) <> '2'))) then
      begin

        DataChanged := true;
        dbgrideh1.DataSource.DataSet.Append;

        DbgridEh1.DataSource.DataSet.FieldByName('pos').Value := Excel.Cells[index, 3].Text;
        DbgridEh1.DataSource.DataSet.FieldByName('name').Value := StringReplace(Excel.Cells[index, 4].Text, #10, ' ', [rfReplaceAll]);
        DbgridEh1.DataSource.DataSet.FieldByName('doc').Value := StringReplace(Excel.Cells[index, 6].Text, #10, ' ', [rfReplaceAll]);
        DbgridEh1.DataSource.DataSet.FieldByName('ed.izm').Value := Excel.Cells[index, 10].Text;
        DbgridEh1.DataSource.DataSet.FieldByName('col').Value := Excel.Cells[index, 12].Text;
        DbgridEh1.DataSource.DataSet.FieldByName('mass.ek').Value := Excel.Cells[index, 14].Text;
        DbgridEh1.DataSource.DataSet.FieldByName('mass.full').Value := Excel.Cells[index, 16].Text;
        DbgridEh1.DataSource.DataSet.FieldByName('from').Value := StringReplace(Excel.Cells[index, 17].Text, #10, ' ', [rfReplaceAll]);
        DbgridEh1.DataSource.DataSet.FieldByName('location').Value := StringReplace(Excel.Cells[index, 18].Text, #10, ' ', [rfReplaceAll]);
        DbgridEh1.DataSource.DataSet.FieldByName('n.reg').Value := StringReplace(Excel.Cells[index, 19].Text, #10, ' ', [rfReplaceAll]);
        DbgridEh1.DataSource.DataSet.FieldByName('comment').Value := StringReplace(Excel.Cells[index, 20].Text, #10, ' ', [rfReplaceAll]);

        DbgridEh1.DataSource.DataSet.Next;
      end;

      ProgressBar1.Position := index;
      inc (index);
      Application.ProcessMessages;
    end;

    if DataChanged then
      Button4.Enabled := true;

    button1.Enabled := true;
    button2.enabled := true;

  end;

  ProgressBar1.Visible := false;
  DbGridEh1.DataSource.DataSet.EnableControls;
  DbGridEh1.DataSource.DataSet.First;

  self.Cursor := crDefault;
  Screen.Cursor := OldCursor;

  Excel.Quit;
  Excel := Unassigned;
end;

end;

procedure Tsn_mat.Button4Click(Sender: TObject);

var

SQL,
kod,
tname,
ed,
col,
massek,
massfull
: string;

fL
: TStringList;

begin

if cb_specs.ItemIndex = -1 then
  exit;

CheckLockSpec(false);

if OnlyReadWE then
begin
  alert('ТОЛЬКО ЧТЕНИЕ', 'Спецификация заблокирована пользователем: ' + LoginLock+#10#13+'Чтобы обновлять статус спецификации нажмите кнопку "Обновить")');
  exit;
end;

if MessageDlg('Вы действительно хотите сохранить изменения?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
  exit;
       
Query1.Close;
Query1.SQL.Text := 'DELETE FROM VED_MAT WHERE ved_id = ' + SELECTED_SPEC;
Query1.ExecSQL;

dbgrideh1.DataSource.DataSet.First;

while dbgrideh1.DataSource.DataSet.Eof = false do
begin

  fL := TStringList.Create;
  try
    ExtractStrings(['('], [], PChar(dbgrideh1.DataSource.DataSet.FieldByName('doc').asString), fL);
  except
    freeandnil(fL);
    alert('Ошибка', 'Ошибка парсинга кода материала');
    exit;
  end;

  kod := trim(fL[1]);
  Delete(kod, length(fL[1]), 1);

  tname := fL[0];
  tname := TrimRight(tname);
  tname := dbgrideh1.DataSource.DataSet.FieldByName('name').AsString + '[#]' + tname;

  freeandnil(fL);

  col := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('col').asString, ',', '.', [rfReplaceAll]);
  massek := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('mass.ek').asString, ',', '.', [rfReplaceAll]);
  massfull := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('mass.full').asString, ',', '.', [rfReplaceAll]);

  Query1.Close;
  Query1.SQL.Text := 'SELECT koded FROM koded WHERE trim(lower(namek)) = '
  +char(39) + trim(StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('ed.izm').asString, '.', '', [rfReplaceAll])) + char(39);
  Query1.Open;

  if Query1.RecordCount = 0 then //не нашли код ед. измерения, ставим по умолчанию "ШТУКИ"
    ed := '796' //код ед. измерения "ШТУКИ"
  else
    ed := Query1.FieldByName('koded').AsString;

  SQL := 'INSERT INTO VED_MAT (stroka, poz, kod, NAME, ed, kol, mass_ed, mass, post, rasp, reg_nad, text, ved_id) '
  +'VALUES ('+chr(39)+'1'+chr(39)+', ' + chr(39) + dbgrideh1.DataSource.DataSet.FieldByName('pos').asString + chr(39) + ', '
  +chr(39) + kod + chr(39) + ', ' + chr(39) + tname + chr(39) + ', ' + chr(39) + ed + chr(39) + ', '
  +chr(39) + col + chr(39) + ', '
  +chr(39) + massek + chr(39) + ', '
  +chr(39) + massfull + chr(39) + ', '
  +chr(39) + dbgrideh1.DataSource.DataSet.FieldByName('from').asString + chr(39) + ', '
  +chr(39) + dbgrideh1.DataSource.DataSet.FieldByName('location').asString + chr(39) + ', '
  +chr(39) + dbgrideh1.DataSource.DataSet.FieldByName('n.reg').asString + chr(39) + ', '
  +chr(39) + dbgrideh1.DataSource.DataSet.FieldByName('comment').asString + chr(39) + ', '
  +invi_cb_specs.Items[cb_specs.ItemIndex]+')';

  Query1.Close;
  Query1.SQL.Text := SQL;
  Query1.ExecSQL;

  DataChanged := false;

  dbgrideh1.DataSource.DataSet.Next;
end;

end;

procedure Tsn_mat.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if ((DataChanged) and (MessageDlg(
'Были внесены изменения, вы действительно хотите выйти без сохранения?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)) then
begin
  Action:=caNone;
  exit;
end;

UnLockCurrentSpec;

Query1.Close;
Query1.Free;
Query2.Close;
Query2.Free;

OpenDialog1.Free;

ClearDataSet;

sn_mat.Close;
end;

procedure Tsn_mat.cb_specsClick(Sender: TObject);
begin
if cb_specs.Enabled = false then
  alert('Подсказка', 'Для загрузки списка спецификаций - выберите проект!');

end;

end.

(*
INSERT INTO VED_MAT (stroka, poz, kod, NAME, ed, kol, mass_ed, mass, post, rasp, reg_nad, text, ved_id)
VALUES ('1', '14', '90006100012', 'Анемометр крыльчатый ручной  АСО-3[#]ГОСТ 6376-74', '', '1', '0,2', '0,2',
'Закупка Завод «Гидромет-прибор» г. Сафоново Смоленской обл.', 'Рулевая  рубка', '', '', 352)

*)
