unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr, GridsEh, DBGridEh, ComCtrls, ExcelXP,
  ComObj, DBClient, ExtCtrls;

type
  Tsn_mat = class(TForm)
    cb_project: TComboBox;
    cb_specs: TComboBox;
    Query1: TSQLQuery;
    Query2: TSQLQuery;
    invi_cb_project: TComboBox;
    invi_cb_specs: TComboBox;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button5: TButton;
    Button6: TButton;
    DBGridEh1: TDBGridEh;
    SaveDialog1: TSaveDialog;
    procedure FormShow(Sender: TObject);
    procedure cb_projectChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cb_specsChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cb_specsClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientDataSet1AfterEdit(DataSet: TDataSet);
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

uses Unit2,Unit15, Unit18;

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

  dbgrideh1.DataSource.DataSet.DisableControls;
  dbgrideh1.Enabled := true;
  dbgrideh1.ReadOnly := true;

  if WarnNeed then
    Alert('ТОЛЬКО ЧТЕНИЕ', 'В данный момент спецификация заблокирована пользователем: ' +
    Query2.FieldByName('SPEC_NAME_BLOCK').AsString);
end
else
begin
  OnlyReadWE := false;
  Label4.Caption := 'ЧТЕНИЕ, ИЗМЕНЕНИЕ';

  dbgrideh1.DataSource.DataSet.EnableControls;
  dbgrideh1.Enabled := true;
  dbgrideh1.ReadOnly := false;

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
if ((cb_specs.enabled) and (SELECTED_SPEC <> '')) then
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

if DataChanged then
  alert('Предупреждение', 'Измененная вами спецификация была закрыта без сохранения!');

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
button5.enabled := false;
button6.enabled := false;

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
SELECTED_SPEC := '';

ClearDataSet;
end;

procedure Tsn_mat.cb_specsChange(Sender: TObject);

var

tname,
doc,
ed
: String;

TIndex
: Integer;

begin
if cb_specs.ItemIndex = -1 then
  exit;

if DataChanged then
  alert('Предупреждение', 'Измененная вами спецификация была закрыта без сохранения!');

UnlockCurrentSpec;

ClearDataSet;

Query1.Close;
Query1.SQL.Text := 'SELECT * FROM VED_MAT WHERE ved_id = '+invi_cb_specs.Items[cb_specs.ItemIndex];
Query1.Open;

SELECTED_SPEC := invi_cb_specs.Items[cb_specs.ItemIndex];
CheckLockSpec(true);

button5.Enabled := true;
button6.enabled := false;

if Query1.RecordCount = 0 then
begin
  alert('Пустая спецификация','Выбранная спецификация не содержит записей');
  button1.Enabled := true;
  Button4.Enabled := false;
  button5.Enabled := true;
  button6.Enabled := false;
  DataChanged := false;
  exit;
end;

button1.Enabled := false;
button2.enabled := false;
button3.Enabled := false;
button5.Enabled := false;
button6.Enabled := false;

TIndex := 0;
ProgressBar1.Max := Query1.RecordCount;
ProgressBar1.Position := 0;
ProgressBar1.Visible := true;

dbgrideh1.DataSource.DataSet.DisableControls;
dbgrideh1.Enabled := false;
dbgrideh1.ReadOnly := true;
dbgrideh1.DataSource.Dataset.First;
while Query1.Eof = false do
begin
  dbgrideh1.DataSource.DataSet.Append;

  if pos('Ч', query1.FieldByName('poz').asString) = 0 then
  begin
    tname := query1.FieldByName('name').asString;
    doc := query1.FieldByName('kod').asString;

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

  end
  else
  begin
    DbgridEh1.DataSource.DataSet.FieldByName('pos').Value := query1.FieldByName('poz').asString;
    DbgridEh1.DataSource.DataSet.FieldByName('name').Value := query1.FieldByName('name').asString;
  end;

  progressbar1.Position := TIndex;
  inc(TIndex);

  dbgrideh1.DataSource.Dataset.Next;
  Query1.Next;

  Application.ProcessMessages;
end;

ProgressBar1.Visible := false;
dbgrideh1.DataSource.DataSet.EnableControls;
dbgrideh1.Enabled := true;

if OnlyReadWE then
  dbgrideh1.ReadOnly := true
else
  dbgrideh1.ReadOnly := false;

button1.Enabled := true;
button2.Enabled := true;
button3.enabled := true;
button5.Enabled := true;
button6.Enabled := true;
DataChanged := false;

end;

procedure Tsn_mat.Button3Click(Sender: TObject);
begin

if ProgressBar1.Visible = true then
  exit;

if cb_specs.ItemIndex = -1 then
  exit;
  
CheckLockSpec(true);
end;

procedure Tsn_mat.Button1Click(Sender: TObject);

var

Excel
: Variant;

NameOfFile,
FSymb
: string;

WorkBookCount,
qq,
Index,
Index_list
: integer;

OldCursor
: TCursor;

isOwnItem
: boolean;

begin

if OnlyReadWE then
begin
  Alert('ТОЛЬКО ЧТЕНИЕ', 'В данный момент спецификация заблокирована пользователем: ' + LoginLock);
  exit;
end;

if ProgressBar1.Visible = true then
  exit;

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

  Application.CreateForm(TForm15, Form15);
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
  Form15.Free;

  if index_list <> 0 then
  begin

    try
       Excel.Worksheets[index_list].Select;
    except
       Excel.Worksheets['Завод'].Select;
    end;

    ProgressBar1.Position := 0;
    ProgressBar1.Visible := true;
    ProgressBar1.Max := Excel.ActiveSheet.UsedRange.Rows.Count;
    Index := 1;

    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    self.Cursor := Screen.Cursor;

    DbGridEh1.DataSource.DataSet.First;
    DbGridEh1.DataSource.DataSet.DisableControls;

    Application.ProcessMessages;

    button1.Enabled := false;
    button2.enabled := false;
    button3.Enabled := false;
    button4.enabled := false;
    button5.enabled := false;
    button6.Enabled := false;

    while index <= Excel.ActiveSheet.UsedRange.Rows.Count do
    begin
          
      if (((trim(Excel.Cells[index, 3].text) <> '') or (trim(Excel.Cells[index, 4].text) <> '')) and
      (trim(Excel.Cells[index, 3].text) <> 'Поз.') and (trim(Excel.Cells[index, 4].text) <> '2')) then
      begin
        DataChanged := true;
        dbgrideh1.DataSource.DataSet.Append;

        FSymb := copy(Excel.Cells[index, 4].Text, 1, 1);

        if ((trim(Excel.Cells[index, 4].text) <> '') and (Form2.strOnlyDigits(FSymb))) then
          isOwnItem := true
        else
          isOwnItem := false;

        if ( (not isOwnItem) and ((trim(Excel.Cells[index, 3].text) = '') or (trim(Excel.Cells[index, 4].text) = '')) ) then
              (* ... *)
        else
        begin

        if not isOwnItem then
        begin
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
        end
        else
        begin
          DbgridEh1.DataSource.DataSet.FieldByName('pos').Value := 'Ч' + FSymb;
          DbgridEh1.DataSource.DataSet.FieldByName('name').Value := trim(copy(Excel.Cells[index, 4].Text, 3, length(Excel.Cells[index, 4].Text)));
        end;

        DbgridEh1.DataSource.DataSet.Next;
        
        end;
      end;


      ProgressBar1.Position := index;
      inc (index);
      Application.ProcessMessages;
    end;

    if DataChanged then
      Button4.Enabled := true;

    button1.Enabled := true;
    button2.enabled := true;
    button3.Enabled := true;
    button5.enabled := true;
    button6.enabled := true;

  end;

  ProgressBar1.Visible := false;
  DbGridEh1.DataSource.DataSet.EnableControls;
  Dbgrideh1.Enabled := true;
  dbgrideh1.ReadOnly := false;
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

OldCursor
: TCursor;

begin

if ProgressBar1.Visible = true then
  exit;

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

button1.Enabled := false;
button2.Enabled := false;
button3.Enabled := false;
button4.Enabled := false;
button5.Enabled := false;
button6.Enabled := false;

OldCursor := Screen.Cursor;
Screen.Cursor := crHourGlass;
self.Cursor := Screen.Cursor;

Query1.Close;
Query1.SQL.Text := 'DELETE FROM VED_MAT WHERE ved_id = ' + SELECTED_SPEC;
Query1.ExecSQL;

ProgressBar1.Max := dbgrideh1.DataSource.DataSet.RecordCount;
ProgressBar1.Position := 0;
ProgressBar1.Visible := true;

dbgrideh1.DataSource.DataSet.First;

while dbgrideh1.DataSource.DataSet.Eof = false do
begin
  if pos('Ч',  dbgrideh1.DataSource.DataSet.FieldByName('pos').asString) <> 0 then
  begin
    kod := '';
    tname := dbgrideh1.DataSource.DataSet.FieldByName('name').asString;
    col := '';
    massek := '';
    massfull := '';
    ed := '';
  end
  else
  begin
    tname := dbgrideh1.DataSource.DataSet.FieldByName('name').AsString;
    kod := Trim(dbgrideh1.DataSource.DataSet.FieldByName('doc').asString);

    col := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('col').asString, ',', '.', [rfReplaceAll]);
    massek := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('mass.ek').asString, ',', '.', [rfReplaceAll]);
    massfull := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('mass.full').asString, ',', '.', [rfReplaceAll]);

    Query1.SQL.Text := 'SELECT koded FROM koded WHERE replace(replace(lower(namek),' + char(39) + ' ' + char(39) + ',' + char(39) + char(39) + '), ' + char(39) + '.' + char(39) + ', ' + char(39) + char(39) + ') = '
    +char(39) + StringReplace(trim(StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('ed.izm').asString, '.', '', [rfReplaceAll])), ' ', '', [rfReplaceAll]) + char(39);
    Query1.Open;

    if Query1.RecordCount = 0 then //не нашли код ед. измерения, ставим по умолчанию "ШТУКИ"
      ed := '796' //код ед. измерения "ШТУКИ"
    else
      ed := Query1.FieldByName('koded').AsString;

  end;

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
  +SELECTED_SPEC+')';

  Query1.Close;
  Query1.SQL.Text := SQL;
  Query1.ExecSQL;

  DataChanged := false;
  button4.Enabled := false;

  dbgrideh1.DataSource.DataSet.Next;

  ProgressBar1.Position := dbgrideh1.DataSource.DataSet.Recno;
  Application.ProcessMessages;
end;

self.Cursor := crDefault;
Screen.Cursor := OldCursor;

button1.Enabled := true;
button2.Enabled := true;
button3.Enabled := true;
button5.Enabled := true;

if dbgrideh1.DataSource.DataSet.RecordCount <> 0 then
  button6.Enabled := true;

ProgressBar1.Visible := false;
ProgressBar1.Position := 0;

end;

procedure Tsn_mat.FormClose(Sender: TObject; var Action: TCloseAction);
begin

if ProgressBar1.Visible = true then
begin
  Action := caNone;
  exit;
end;

if ((DataChanged) and (MessageDlg(
'Были внесены изменения, вы действительно хотите выйти без сохранения?', mtConfirmation, [mbYes, mbNo], 0) = mrNo)) then
begin
  Action := caNone;
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

procedure Tsn_mat.Button5Click(Sender: TObject);
begin

if ProgressBar1.Visible = true then
  exit;

if OnlyReadWE then
begin
  alert('Только чтение', 'Редактиование спецификации не возможно!');
  exit;
end;

Application.CreateForm(TForm18, Form18);
form18.Caption := Form18.Caption + ': ' + cb_specs.Items[cb_specs.ItemIndex];
form18.Showmodal;

form18.Free; //память
end;

procedure Tsn_mat.Button6Click(Sender: TObject);
begin

if ProgressBar1.Visible = true then
  exit;

if OnlyReadWE then
begin
  alert('Только чтение', 'Редактиование спецификации не возможно!');
  exit;
end;

if dbgrideh1.DataSource.DataSet.RecNo > 0 then
begin
  Dbgrideh1.DataSource.DataSet.Edit;
  Dbgrideh1.DataSource.DataSet.Delete;
  DataChanged := true;
  button4.Enabled := true;
end
else
  alert('Нет записей', 'Нет записей для удаления');

end;

procedure Tsn_mat.Button2Click(Sender: TObject);

var

HFile
: Textfile;

NFile,
kod,
text,
ed,
col,
massek,
massfull
: String;

ReplaceFlags
: TReplaceFlags;

SType
: Integer;

OldCursor
: TCursor;

begin
if ProgressBar1.Visible = true then
  exit;

if dbgrideh1.DataSource.DataSet.RecordCount = 0 then
begin
  alert('Пустая спецификация', 'Спецификация не содержит записей');
  exit;
end;

SType := 1;
OldCursor := crDefault;

if SType <> 0 then
begin
  ReplaceFlags := [ rfReplaceAll, rfIgnoreCase ];
  SaveDialog1.FileName := StringReplace(cb_project.Items[cb_project.ItemIndex]+'_'+cb_specs.Items[cb_specs.ItemIndex]+'.txt', ' ', '', ReplaceFlags);

  if SaveDialog1.Execute then
  begin
    NFile := SaveDialog1.FileName;
    AssignFile(HFile, NFile);
    Rewrite(HFile);
    DbGridEh1.DataSource.DataSet.DisableControls;
    DBGridEh1.DataSource.DataSet.First;

    Query1.Close;
    Query1.SQL.Text := 'SELECT name FROM SPEC_NAME WHERE spec_id = ' + invi_cb_specs.Items[cb_specs.ItemIndex];
    Query1.Open;

    Writeln(HFile, '#' + Chr(9) + Chr(9) + Trim(cb_specs.Items[cb_specs.ItemIndex]) + Chr(9) + Trim(Query1.FieldByName('name').asString) + Chr(9) + Chr(9) + Chr(9) + Chr(9));

    ProgressBar1.Visible := true;
    ProgressBar1.Max := dbgrideh1.DataSource.DataSet.RecordCount;

    OldCursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    self.Cursor := Screen.Cursor;

    DbGridEh1.DataSource.DataSet.First;
    DbGridEh1.DataSource.DataSet.DisableControls;

    Application.ProcessMessages;

    button1.Enabled := false;
    button2.enabled := false;
    button3.Enabled := false;
    button4.enabled := false;
    button5.enabled := false;
    button6.Enabled := false;

    while dbgrideh1.DataSource.DataSet.Eof = false do
    begin
        if ((pos('Ч', trim(DbGrideh1.DataSource.DataSet.FieldByName('pos').asString)) <> 0) or
        (pos('-', trim(DbGrideh1.DataSource.DataSet.FieldByName('pos').asString)) <> 0)) then
          writeln(HFile, inttostr(SType) + Chr(9) + DbGrideh1.DataSource.DataSet.FieldByName('pos').asString + Chr(9)
          + Chr(9) + TrimRight(TrimLeft(DbGrideh1.DataSource.DataSet.FieldByName('name').asString)))
        else
        begin
          text := dbgrideh1.DataSource.DataSet.FieldByName('name').AsString;
          kod := Trim(dbgrideh1.DataSource.DataSet.FieldByName('doc').asString);

          col := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('col').asString, ',', '.', ReplaceFlags);
          massek := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('mass.ek').asString, ',', '.', ReplaceFlags);
          massfull := StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('mass.full').asString, ',', '.', ReplaceFlags);

          Query1.Close;
          Query1.SQL.Text := 'SELECT koded FROM koded WHERE replace(replace(lower(namek),' + char(39) + ' ' + char(39) + ',' + char(39) + char(39) + '), ' + char(39) + '.' + char(39) + ', ' + char(39) + char(39) + ') = '
          +char(39) + StringReplace(trim(StringReplace(dbgrideh1.DataSource.DataSet.FieldByName('ed.izm').asString, '.', '', ReplaceFlags)), ' ', '', ReplaceFlags) + char(39);
          Query1.Open;

          if Query1.RecordCount = 0 then //не нашли код ед. измерения, ставим по умолчанию "ШТУКИ"
            ed := '796' //код ед. измерения "ШТУКИ"
          else
            ed := Query1.FieldByName('koded').AsString;
          
          writeln(HFile, inttostr(SType) + Chr(9) + DbGrideh1.DataSource.DataSet.FieldByName('pos').asString + Chr(9)
          + kod + Chr(9) + text + Chr(9) + ed + Chr(9) + col
          + Chr(9) + massek + Chr(9) + massfull
          + Chr(9) + Chr(9) + Chr(9));
        end;

      dbgrideh1.DataSource.DataSet.Next;
      ProgressBar1.Position := SType;
      inc(SType);
      Application.ProcessMessages;
    end;

    Dbgrideh1.Enabled := true;

    if DataChanged then
      Button4.Enabled := true;

    if not OnlyReadWE then
      dbgrideh1.ReadOnly := false;

    button1.Enabled := true;
    button2.enabled := true;
    button3.Enabled := true;
    button5.enabled := true;
    button6.enabled := true;

    ProgressBar1.Visible := false;
    DbGridEh1.DataSource.DataSet.EnableControls;
    DbGridEh1.DataSource.DataSet.First;

    self.Cursor := crDefault;
    Screen.Cursor := OldCursor;

    CloseFile(HFile);
  end;

end;

end;

procedure Tsn_mat.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = VK_DELETE then
  Button6.Click;

end;

procedure Tsn_mat.ClientDataSet1AfterEdit(DataSet: TDataSet);
begin
DataChanged := true;
Button4.Enabled := true;
end;

end.
