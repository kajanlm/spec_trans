unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, StdCtrls, DBCtrls, DBClient, SimpleDS,
  Mask, DBCtrlsEh, DBLookupEh, FMTBcd, SqlExpr, EhLibBDE, ExcelXP,
  OleServer,ComObj, Provider, Menus, ComCtrls, DBXpress;

type
  TForm7 = class(TForm)
    SimpleDataSet1: TSimpleDataSet;
    SimpleDataSet2: TSimpleDataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    Label1: TLabel;
    Label2: TLabel;
    DBLookupComboboxEh2: TDBLookupComboboxEh;
    DataSource2: TDataSource;
    Label3: TLabel;
    SimpleDataSet3: TSimpleDataSet;
    DataSource3: TDataSource;
    SQLQuery1: TSQLQuery;
    Button1: TButton;
    Button2: TButton;
    SimpleDataSet3poz: TStringField;
    SimpleDataSet3NAME: TStringField;
    SimpleDataSet3mesto: TStringField;
    SimpleDataSet3pokr: TStringField;
    SimpleDataSet3text: TStringField;
    SimpleDataSet3ved_mat: TIntegerField;
    SimpleDataSet3ved_id: TIntegerField;
    SimpleDataSet3number_string: TIntegerField;
    SimpleDataSet3kol: TFloatField;
    SimpleDataSet3mass_ed: TFloatField;
    SimpleDataSet3mass: TFloatField;
    SimpleDataSet3Sklad: TSmallintField;
    SimpleDataSet3zak: TSmallintField;
    SimpleDataSet3obr: TSmallintField;
    SimpleDataSet3sklad1: TSmallintField;
    SimpleDataSet3montazh: TSmallintField;
    SimpleDataSet3sbor1: TSmallintField;
    SimpleDataSet3sbor: TSmallintField;
    SimpleDataSet4: TSimpleDataSet;
    SimpleDataSet3ed3: TStringField;
    SimpleDataSet3ed: TFloatField;
    SimpleDataSet4koded_id: TFloatField;
    SimpleDataSet4koded: TMemoField;
    SimpleDataSet4kof: TFloatField;
    SimpleDataSet4name: TMemoField;
    SimpleDataSet4namek: TMemoField;
    SimpleDataSet4koded_koded_id: TIntegerField;
    SimpleDataSet3ed4: TStringField;
    SimpleDataSet3sprav_sprav_id: TFloatField;
    SimpleDataSet5: TSimpleDataSet;
    SimpleDataSet5kod_ved_id: TIntegerField;
    SimpleDataSet5kod_ved_zak: TStringField;
    SimpleDataSet3kod_ved1: TStringField;
    SimpleDataSet3kod_ved: TIntegerField;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    Button3: TButton;
    Button4: TButton;
    SaveDialog1: TSaveDialog;
    SimpleDataSet3kod: TStringField;
    SimpleDataSet3VED_MAT_UNIQ: TIntegerField;
    SimpleDataSet3stroka: TFloatField;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    DataSource4: TDataSource;
    ClientDataSet1stroka: TFloatField;
    ClientDataSet1poz: TStringField;
    ClientDataSet1kod: TStringField;
    ClientDataSet1NAME: TStringField;
    ClientDataSet1ed: TFloatField;
    ClientDataSet1kol: TFloatField;
    ClientDataSet1mass_ed: TFloatField;
    ClientDataSet1mass: TFloatField;
    ClientDataSet1mesto: TStringField;
    ClientDataSet1kod_ved: TIntegerField;
    ClientDataSet1pokr: TStringField;
    ClientDataSet1sklad: TSmallintField;
    ClientDataSet1zak: TSmallintField;
    ClientDataSet1sbor: TSmallintField;
    ClientDataSet1obr: TSmallintField;
    ClientDataSet1sbor1: TSmallintField;
    ClientDataSet1sklad1: TSmallintField;
    ClientDataSet1montazh: TSmallintField;
    ClientDataSet1text: TStringField;
    ClientDataSet1ved_mat: TIntegerField;
    ClientDataSet1ved_id: TIntegerField;
    ClientDataSet1sprav_sprav_id: TFloatField;
    ClientDataSet1number_string: TIntegerField;
    SQLDataSet1: TSQLDataSet;
    SQLDataSet1stroka: TFloatField;
    SQLDataSet1poz: TStringField;
    SQLDataSet1kod: TStringField;
    SQLDataSet1NAME: TStringField;
    SQLDataSet1ed: TFloatField;
    SQLDataSet1kol: TFloatField;
    SQLDataSet1mass_ed: TFloatField;
    SQLDataSet1mass: TFloatField;
    SQLDataSet1mesto: TStringField;
    SQLDataSet1kod_ved: TIntegerField;
    SQLDataSet1pokr: TStringField;
    SQLDataSet1sklad: TSmallintField;
    SQLDataSet1zak: TSmallintField;
    SQLDataSet1sbor: TSmallintField;
    SQLDataSet1obr: TSmallintField;
    SQLDataSet1sbor1: TSmallintField;
    SQLDataSet1sklad1: TSmallintField;
    SQLDataSet1montazh: TSmallintField;
    SQLDataSet1text: TStringField;
    SQLDataSet1ved_mat: TIntegerField;
    SQLDataSet1ved_id: TIntegerField;
    SQLDataSet1sprav_sprav_id: TFloatField;
    ClientDataSet1kod_ved1: TStringField;
    ClientDataSet1ed4: TStringField;
    SQLQuery2: TSQLQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ClientDataSet1VED_MAT_UNIQ: TAutoIncField;
    SQLDataSet1VED_MAT_UNIQ: TAutoIncField;
    Label4: TLabel;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    ComboBox1: TComboBox;
    ClientDataSet1mech_izl: TSmallintField;
    SQLDataSet1mech_izl: TSmallintField;
    ClientDataSet1section: TStringField;
    SQLDataSet1section: TStringField;
    SQLQuery3: TSQLQuery;
    ProgressBar1: TProgressBar;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboboxEh1Change(Sender: TObject);
    procedure DBLookupComboboxEh2Change(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1Columns5EditButtonClick(Sender: TObject;
      var Handled: Boolean);
    procedure DBGridEh1Columns5UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ClientDataSet1CalcFields(DataSet: TDataSet);
    procedure ClientDataSet1NewRecord(DataSet: TDataSet);
    procedure ClientDataSet1BeforeInsert(DataSet: TDataSet);
    procedure ClientDataSet1AfterDelete(DataSet: TDataSet);
    procedure ClientDataSet1AfterPost(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboboxEh2Enter(Sender: TObject);
    procedure DBGridEh1Columns6UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure DBGridEh1Columns7UpdateData(Sender: TObject;
      var Text: String; var Value: Variant; var UseText, Handled: Boolean);
    procedure Button5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ClientDataSet1BeforeDelete(DataSet: TDataSet);

  private
    { Private declarations }
    s1,s2,s3,s4:integer;
    max_string:real;
    k_max:Double;
      zovu:boolean;
    DynArray: array of VAriant;
    KeyValue:OleVariant;
  public
    id_spec,index1,ins_string:Integer;

    { Public declarations }
  end;

var
  Form7: TForm7;

   MutexHandle : THandle;
// TTransactionDesc : packed record;
//TransactionID : longword;
//GlobalID : longword;
//IsolationLevel : TTransactionIsolationLevel;
//CustomIsolation: longword;

 //TD: TTransactionDesc;

const
 MutexName = 'one_inst_demo_mutex';

implementation

uses spec, Unit15, Unit2;

{$R *.dfm}

function find_duble():string;
var k,j,y,i:integer;
 a : array of string;
 t:string;
begin
with Form7 Do Begin
DbGridEh1.DataSource.DataSet.DisableControls;
DBGridEh1.DataSource.DataSet.First;
SetLength(a,DBGridEh1.DataSource.DataSet.RecordCount-1);
k:=0;
While NOT DBGridEh1.DataSource.DataSet.Eof Do
 begin
   if  DBGridEh1.DataSource.DataSet.FieldByName('poz').Value<>'' then
      begin
        a[k] :=DBGridEh1.DataSource.DataSet.FieldByName('poz').Value;
        k:=k+1;
      end;
   DBGridEh1.DataSource.DataSet.Next;
 end;


  for i:=0 to k-1 do
        for j:=i+1 to k do
            if (A[i]>A[j]) then
            begin
            ShowMessage(A[i]+' '+A[j]+' '+IntToStr(i));
                t := A[i];
                A[i] := A[j];
                A[j] := t;
      end;

 ShowMessage(a[k]+' '+IntTostr(k));
 DbGridEh1.DataSource.DataSet.EnableControls;
result:='2,1';
end;
end;
function change_function():boolean;
    var  buttonSelected:integer;
begin
 with FORM7 do begin
 if  DbGridEh1.DataSource.DataSet.Active=true then
    begin
    DBGridEh1.EditorMode:=False;
DbGridEh1.DataSource.DataSet.DisableControls;
         if NOT ClientDataSet1.Eof then
        begin ClientDataSet1.NEXT;ClientDataSet1.Prior;end
        else
        begin
         ClientDataSet1.Prior;
         ClientDataSet1.NEXT;
        end;
DbGridEh1.DataSource.DataSet.ENableControls;
end;
 buttonSelected:=0;
//    if   Form2.SQLConnection1.InTransaction then

 if ClientdataSet1.ChangeCount>0 then
     begin
        buttonSelected:=MessageDlg('Были внесены изменения! ВЫ уверены, что хотите выйти без сохранения?',mtCustom,
                              [mbYes,mbCancel], 0);
      if buttonSelected=mrYes then result:=true
      else result:=false;
      end
else result:=true;
end;

end;

procedure change_number_string_up(Sender: TObject);

begin
 end;




procedure change_number_string(Sender: TObject);
var  buttonSelected:integer;
begin

end;

procedure renew_table(Sender: TObject; order:boolean);
begin

  with Form7 do
    begin
   LAbel4.Caption:=DBLookupComboBoxEH2.ListSource.DataSet.FieldByName(DBLookupComboBoxEH2.KeyField).asstring;
if SQLDATASET1.Active=true then
  SQLDATASET1.Active:=false;

 if  Form2.SQLConnection1.InTransaction=true then ShowMessage('Show Allert');

SQLDATASET1.commandtext:='select * from VED_MAT  where ved_id='+
IntToStr(DBLookupComboBoxEH2.ListSource.DataSet.FieldByName(DBLookupComboBoxEH2.KeyField).Value)+' order by stroka FOR UPDATE ';
SQLDATASET1.Active:=true;     LABEL6.caption:=IntTostr(id_spec);
SQLDATASET1.Open;//SQLDATASET1.Edit;

if ClientDataSet1.Active=true then ClientDataSet1.Active:=false;
ClientDataSet1.Active:=true;
ClientDataSet1.Open;
        DbgridEH1.DataSource.DataSet.Last;
                DbgridEH1.DataSource.DataSet.First;

 DbGridEh1.Columns.Items[11].Visible:=false;
  DbGridEh1.Columns.Items[2].Visible:=false;
 //ShowMEssage(SimpleDataSet2.FieldByName('vid_dok').asString);

 if SimpleDataSet2.FieldByName('vid_dok').asinteger=1 then
begin
  Combobox1.ItemIndex:=1;
  DbGridEh1.Columns.Items[2].Visible:=true;
 end
else
 if SimpleDataSet2.FieldByName('vid_dok').asinteger=2 then
begin
  Combobox1.ItemIndex:=2;   ///механика
   DbGridEh1.Columns.Items[11].Visible:=true;
 end
else
  begin
 Combobox1.ItemIndex:=0;
//   DbGridEh1.Columns.Items[10].Visible:=false;
 end;

if (SimpleDataSet2.FieldByName('SPEC_NAME_BLOCK').asString<>SQLQUERY2.FieldByName('USER_NAME').asString) then
  begin
   if SimpleDataSet2.FieldByName('SPEC_NAME_BLOCK').AsString<>''  then
     begin
      ShowMEssage('В спецификации ведется работа пользователем '+SimpleDataSet2.FieldByName('SPEC_NAME_BLOCK').asString+'! Открываю только на просмотр!!!');
Caption:=Caption+' только просмотр!';
      DBGRIDEH1.ReadOnly:=true;
      Button5.Enabled:=false;
      Combobox1.Enabled:=false;
    end
 else
   begin

      SQLQUERY1.SQL.Text:='UPDATE  SPEC_NAME SET SPEC_NAME_BLOCK ='''+SQLQUERY2.FieldByName('USER_NAME').asString+''' where spec_id='
      +IntToStr(id_spec);
      DBGRIDEH1.ReadOnly:=false;
      SQLQUERY1.ExecSQL();

    DbGridEh1.DataSource.DataSet.DisableControls;
      ClientDataSet1.First;
      While NOT ClientDataSet1.Eof do
        begin
         if ClientDataSet1.FieldByName('VED_MAT_UNIQ').AsFloat>k_max then k_max:=ClientDataSet1.FieldByName('VED_MAT_UNIQ').asFloat;
         ClientDataSet1.NEXT;
        end;
      ClientDataSet1.First;
        DbGridEh1.DataSource.DataSet.EnableControls;  Button5.Enabled:=true;  Combobox1.Enabled:=true;
    //    ShowMEssage(FloatTostr(k_max));
   end;
end;
 // End else //**********************
 // ShowMessage('Nen jnrfn');

  end;

end;



procedure TForm7.FormShow(Sender: TObject);


begin
if  Caption='Form7' then
Caption:=' НОВАЯ    ';
with Combobox1 Do
  begin
    Clear;
    Text:='Общая';
    Items.Add('Общая');
    Items.Add('Корпусная');
    Items.Add('Механическая');
    Enabled:=false;
  end;
   
 // TD.TransactionID := 1 ;
 //  TD.IsolationLevel := xilREADCOMMITTED;
 //  Form2.SQLConnection1.StartTransaction(td);
end;

procedure TForm7.DBLookupComboboxEh1Change(Sender: TObject);
begin

Caption:='НОВАЯ';

if SimpleDataSet2.DATASet.Active=true then
  SimpleDataSet2.DATASet.Active:=false;
if SimpleDataSet2.Active=true then
  SimpleDataSet2.Active:=false;
 SimpleDataSet2.DATASet.CommandText:='Select ddd.nomer, ddd.spec_id, ddd.name,ddd.SPEC_NAME_BLOCK,ddd.vid_dok from'+
 ' ((Select SUBSTRING(nomer,1,100) as nomer, spec_id, name,SPEC_NAME_BLOCK,vid_dok from SPEC_NAME where project_id=1 and (vid_dok <> 3 or vid_dok is null))'+
'union all '+
'(select SUBSTRING(nomer,1,100) as nomer, spec_id, name,SPEC_NAME_BLOCK,vid_dok from SPEC_NAME where project_id='+
IntToStr(DBLookupComboBoxEH1.ListSource.DataSet.FieldByName(DBLookupComboBoxEH1.KeyField).Value)
+' and (vid_dok <> 3 or vid_dok is null)))ddd order by nomer';

 SimpleDataSet2.DAtaSet.Active:=true;
SimpleDataSet2.Active:=true;
   
  SQLQUERY1.SQL.Text:='UPDATE  SPEC_NAME SET SPEC_NAME_BLOCK ='''' where spec_id='+IntToStr(Id_spec);
  SQLQUERY1.ExecSQL();

if DBLookupComboboxEh2.Enabled=false then
DBLookupComboboxEh2.Enabled:=true;
DBLookupComboboxEh2.KeyField:='spec_id';
DBLookupComboboxEh2.ListField:='nomer';
DBLookupComboboxEh2.KeyValue:='1';

end;

procedure TForm7.DBLookupComboboxEh2Change(Sender: TObject);
  var Action: boolean;
begin

if   not VarIsNull(DBLookupComboBoxEH2.ListSource.DataSet.FieldByName('name').Value) then
  begin

    if DBLookupComboBoxEH2.KeyValue<>LAbel4.Caption then
      if change_function()=false  then
         begin
          DBLookupComboBoxEH2.KeyValue:=LAbel4.Caption;
         end
      else
        begin
         Caption:= DBLookupComboBoxEH1.ListSource.DataSet.fieldbyname('project').asString+' '+DBLookupComboBoxEH2.ListSource.DataSet.fieldbyname('nomer').asString;
         if DBGRIDEH1.ReadOnly=false then
            begin
               SQLQUERY1.SQL.Text:='UPDATE  SPEC_NAME SET SPEC_NAME_BLOCK ='''' where spec_id='
                +LAbel4.Caption;
               SQLQUERY1.ExecSQL();
                 MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, false, MutexName);
                    if  MutexHandle<>0 then
                      begin
                      Form1.Close;
                   CloseHandle(MutexHandle);
           end;
            end;
            id_spec:=DBLookupComboBoxEH2.KeyValue;
         renew_table(nil,true);
         end;
end
else Label3.Caption:='';

end;

procedure TForm7.DBGridEh1DblClick(Sender: TObject);
begin
   MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, false, MutexName);

if  (not VarIsNull(DBLookupComboBoxEH2.KeyValue)) then
  begin
  if (DBGridEh1.SelectedField.FieldName='kod') and (MutexHandle=0) and (DBGRIDEH1.ReadOnly=false)
 then
   if  DBGridEh1.DataSource.DataSet.FieldByName('stroka').AsInteger<>0 then
     begin
     Application.CreateForm(TForm1, Form1);
     Form1.Show();
     Form1.Caption:='Заполняем из справочника';
  end
   else ShowMessage('Создайте строчку!!! И повторите попытку!!!!');
 if   (DBGridEh1.SelectedField.FieldName='kod') and (MutexHandle<>0) then
  if (DBGRIDEH1.ReadOnly=false) then
   Form1.Show
  else Form1.Close;
end;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);

begin



if change_function()=true then
   begin
         MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, false, MutexName);
         if  MutexHandle<>0 then
            begin
             Form1.Close;
             CloseHandle(MutexHandle);
           end;
           if DBGRIDEH1.ReadOnly=false then
             begin
              SQLQUERY1.SQL.Text:='UPDATE  SPEC_NAME SET SPEC_NAME_BLOCK ='''' where spec_id='
              +IntToSTR(Id_spec);   LABEL6.caption:=IntTostr(id_spec);
              SQLQUERY1.ExecSQL();
             end;
 //        if  Form2.SQLConnection1.InTransaction then
 //            Form2.SQLConnection1.Commit(TD);
        DbgridEh1.Free;
           DBLOOKUPCOmboboxEh1.Free;
        DBLOOKUPCOmboboxEh2.Free;
        SQLQUERY1.Close;
       SQLQUERY1.Free;
         SQLQUERY2.Close;
         SQLQUERY2.Free;
        SimpleDataSet1.Close;
        SimpleDataSet1.Free;
       SimpleDataSet2.Close;
        SimpleDataSet2.Free;
       SimpleDataSet3.Close;
       SimpleDataSet3.Free;
      SimpleDataSet4.Close;
         SimpleDataSet4.Free;
       SimpleDataSet5.Close;
        SimpleDataSet5.Free;
        id_spec:=0;
          end
       else Action:=caNone;
     end;



procedure TForm7.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var KeyValues : Variant;
  kofi:integer;
   OldCursor:Tcursor;
begin
if Key=VK_DOWN then
if DBGridEh1.DataSource.DataSet.RecNo=0 then
ins_string:=1
else
ins_string:=DBGridEh1.DataSource.DataSet.RecNo;

  if (Key=VK_SPACE) and (DBGridEH1.EditorMode=false) then
  begin
    DBGridEH1.SelectedRows.CurrentRowSelected := true;
    DBGridEH1.DataSource.DataSet.Next;
  end;
if Key=VK_INSERT then
  begin
if DBGridEh1.DataSource.DataSet.RecNo=0 then
ins_string:=1
else
ins_string:=DBGridEh1.DataSource.DataSet.RecNo;
end;


 if (Key=VK_DELETE) and (DBGridEh1.EditorMode=False)
  then
   begin
   if DBGridEh1.DataSource.DataSet.RecordCount=0 then exit;
 if  DBGridEh1.DataSource.DataSet.RecordCount= DBGridEh1.DataSource.DataSet.RecNo then
  begin
      DBGridEh1.DataSource.DataSet.Delete;
     exit;
   end;
if  DBGridEh1.DataSource.DataSet.RecordCount>0 then
KeyValues:=DBGridEh1.DataSource.DataSet.FieldByName('Stroka').Value;
     OldCursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
 Form7.Cursor:= Screen.Cursor;
   kofi:= DBGridEh1.DataSource.DataSet.FieldByName('stroka').Value;
   DBGridEh1.DataSource.DataSet.Delete;
             DbGridEh1.DataSource.DataSet.DisableControls;
    //  DBGridEh1.DataSource.DataSet.last;
 //                   ShowMessage(IntTostr(KeyValues)+' '+IntToStr( DBGridEh1.DataSource.DataSet.RecNo)+' 1 '+IntTostr(kofi));

        While   DBGridEh1.DataSource.DataSet.RecNo<DBGridEh1.DataSource.DataSet.RecordCount Do
          begin
          DBGridEh1.DataSource.DataSet.Edit;
            DBGridEh1.DataSource.DataSet.FieldByName('stroka').Value:= kofi;
            inc(kofi); //(kofi)+1
            DBGridEh1.DataSource.DataSet.POST;
            DBGridEh1.DataSource.DataSet.Next;
          end;
                 DBGridEh1.DataSource.DataSet.EDIT;
                 DBGridEh1.DataSource.DataSet.FieldByName('stroka').Value:= kofi;
                  DBGridEh1.DataSource.DataSet.POST;

try
  DBGridEh1.DataSource.DataSet.Locate('stroka', KeyValues, []);
finally
  DbGridEh1.DataSource.DataSet.EnableControls;
  Screen.Cursor :=crDefault;

      // end;
 end;
 end;
end;



procedure TForm7.Button1Click(Sender: TObject);
var i,max:integer;
begin

 if  ClientdataSet1.ChangeCount>0
   then
     begin
    if   ClientdataSet1.ApplyUpdates(-1)>0 then ShowMessage('error');
  //   if ClientdataSet1.UpdateStatus= usModified then ShowMessage('wait');
        ClientDAtaSet1.Refresh;
        button1.Enabled:=false;
     end;
end;

procedure TForm7.Button2Click(Sender: TObject);
var buttonSelected : Integer;
begin

Form7.Close;


end;

procedure TForm7.DBGridEh1Columns5EditButtonClick(Sender: TObject;
  var Handled: Boolean);
  var t:string;
begin

//if  DBGridEh1.DataSource.DataSet.FieldByName('sprav_sprav_id').value=0 then
//begin
if SimpleDataSet4.Active=true then SimpleDataSet4.Active:=false;
if SimpleDataSet4.DataSet.Active=true then SimpleDataSet4.DataSet.Active:=false;
    SimpleDataSet4.DataSet.CommandText:='select * from koded  where koded_id in (1,2,10,29,19,8) order by koded';
SimpleDataSet4.Active:=true;
SimpleDataSet4.DataSet.Active:=true;

end;

procedure TForm7.DBGridEh1Columns5UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
   if SimpleDataSet4.Active=true then SimpleDataSet4.Active:=false;
if SimpleDataSet4.DataSet.Active=true then SimpleDataSet4.DataSet.Active:=false;
    SimpleDataSet4.DataSet.CommandText:='select * from koded order by koded';
SimpleDataSet4.Active:=true;
SimpleDataSet4.DataSet.Active:=true;
 DBGridEh1.Columns[5].DropDownRows:=7;
end;

procedure TForm7.Button3Click(Sender: TObject);
var Excel: Variant;
e,buttonSelected:integer;
tx:string;
begin

if ClientdataSet1.ChangeCount>0 then
 begin
        buttonSelected:=MessageDlg('Были внесены изменения! Сохраните спецификацию!',mtCustom,
                              [mbYes,mbCancel], 0);
      if buttonSelected=mrYes then  begin ClientdataSet1.ApplyUpdates(-1);  end
      else    exit;

 end;
tx:='Select poz,stroka from VED_MAT where VED_id='+IntToStr(DBLookupComboBoxEH2.ListSource.DataSet.FieldByName(DBLookupComboBoxEH2.KeyField).Value)+
' and poz IN (Select poz from (Select poz,COUNT(*) AS cont  from VED_MAT where VED_id='+IntToStr(DBLookupComboBoxEH2.ListSource.DataSet.FieldByName(DBLookupComboBoxEH2.KeyField).Value)+
' group by poz) as eeee where eeee.cont>1) and poz!='''' and poz!=''#'' order by poz,stroka';
SQLQuery3.SQL.Text:=tx;
  SQLQuery3.Active:=true;

if SQLQuery3.RecordCount>0 then
  begin
  tx:='ВНИМАНИЁ!!!!'+chr(13);
   SQLQuery3.First;
  While SQLQuery3.Eof=false
   do begin
    tx:=tx+'Позиция '+ SQLQUERY3.FieldByName('poz').asString+' срока '+SQLQUERY3.FieldByName('stroka').asString+' повторяется!'+chr(13);
    SQLQUERY3.Next;
   end;
  tx:=tx+chr(13)+'Nicht petchatat!!!!';
  ShowMessage(tx);
  exit;
 end;
SQLQuery3.Active:=false;



Excel := CreateOleObject('Excel.Application');
if SimpleDataSet2.FieldByName('vid_dok').asInteger=2 then
  begin
Excel.Workbooks.Add[ExtractFilePath(Application.ExeName)+'Шаблон\Спецификация_шаблон_механиков.xls'];
///Excel.Workbooks.Add['C:\Спецификация_ШАБЛОН.xlsx'];
Excel.DisplayAlerts:=False;
Excel.Visible := False;
Excel.Worksheets['Спецификация'].Select;
DbGridEh1.DataSource.DataSet.DisableControls;
DBGridEh1.DataSource.DataSet.First;
e:=4;
While NOT DBGridEh1.DataSource.DataSet.Eof Do
  begin
 // text:='A'+IntToStr(e);
 // Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('Stroka').Value;
  text:='B'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('poz').Value;
  text:='C'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('KOD').Value;
  text:='D'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('NAME').Value;
  text:='E'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('ed4').Value;
  text:='F'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('kol').Value;
  text:='G'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mass_ed').Value;
  text:='H'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mass').Value;
    text:='I'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mesto').Value;
      text:='J'+IntToStr(e);
   if  DBGridEh1.DataSource.DataSet.FieldByName('mech_izl').Value=1 then

  Excel.Range[text] := 'Да';


  text:='K'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('Kod_ved1').Value;
   text:='L'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('pokr').Value;


  text:='S'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('text').Value;
  inc(e);
  DBGridEh1.DataSource.DataSet.Next;
 end;

   DbGridEh1.DataSource.DataSet.EnableControls;
   Excel.Visible := True;
 end
//*************Корпусная спецификация
else if SimpleDataSet2.FieldByName('vid_dok').asinteger=1 then
  begin
   Excel.Workbooks.Add[ExtractFilePath(Application.ExeName)+'Шаблон\Шаблон корпус.xlsx'];
Excel.DisplayAlerts:=False;
Excel.Visible := False;
Excel.Worksheets['Спецификация'].Select;
DbGridEh1.DataSource.DataSet.DisableControls;
DBGridEh1.DataSource.DataSet.First;
e:=5;
While NOT DBGridEh1.DataSource.DataSet.Eof Do
  begin
  //позиция//
  text:='B'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('poz').Value;

  //подсекция
  text:='C'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('section').Value;
  //код
  text:='D'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('KOD').Value;
  //наименование
  text:='E'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('NAME').Value;
  //ед изм
  text:='F'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('ed4').Value;
  //  кол
  text:='G'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('kol').Value;
  //масса   ед
  text:='H'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mass_ed').Value;
   //масса
  text:='I'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mass').Value;
  //покрытия
    text:='J'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('pokr').Value;
  //код ведомости заказа
    text:='K'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('Kod_ved1').Value;
 //примечание
  text:='R'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('text').Value;
  inc(e);
  DBGridEh1.DataSource.DataSet.Next;
 end;

   DbGridEh1.DataSource.DataSet.EnableControls;
   Excel.Visible := True;


  end

else
  begin

   Excel.Workbooks.Add[ExtractFilePath(Application.ExeName)+'Шаблон\Шаблон общий.xlsx'];

Excel.DisplayAlerts:=False;

Excel.Visible := False;
Excel.Worksheets['Спецификация'].Select;
DbGridEh1.DataSource.DataSet.DisableControls;
DBGridEh1.DataSource.DataSet.First;
e:=4;
While NOT DBGridEh1.DataSource.DataSet.Eof Do
  begin
  //позиция//
  text:='B'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('poz').Value;


  //код
  text:='C'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('KOD').Value;
  //наименование
  text:='D'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('NAME').Value;
  //ед изм
  text:='E'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('ed4').Value;
  //  кол
  text:='F'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('kol').Value;
  //масса   ед
  text:='G'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mass_ed').Value;
   //масса
  text:='H'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('mass').Value;

  //код ведомости заказа
    text:='J'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('Kod_ved1').Value;
    //покрытия
    text:='K'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('pokr').Value;

 //примечание
  text:='R'+IntToStr(e);
  Excel.Range[text] := DBGridEh1.DataSource.DataSet.FieldByName('text').Value;
  inc(e);
  DBGridEh1.DataSource.DataSet.Next;
 end;

   DbGridEh1.DataSource.DataSet.EnableControls;
   Excel.Visible := True;


  end;



end;

procedure TForm7.Button4Click(Sender: TObject);
var f:textfile;
FName:string;
flags:TReplaceFlags;
eee:integer;
begin
SaveDialog1.FileName := DBLookupComboBoxEH1.ListSource.DataSet.FieldByName('project').Value+'_'+
DBLookupComboBoxEH2.ListSource.DataSet.FieldByName('nomer').Value;
flags:=[ rfReplaceAll, rfIgnoreCase ];
if SaveDialog1.Execute then
 begin
  FName := SaveDialog1.FileName;
// ShowMessage(SaveDialog1.FileName);
AssignFile(f,SaveDialog1.FileName);
Rewrite(f);
DbGridEh1.DataSource.DataSet.DisableControls;
DBGridEh1.DataSource.DataSet.First;
////****zagolovok
 Writeln(f,'#'+Chr(9)+Chr(9)+Chr(9)+DBLookupComboBoxEH2.ListSource.DataSet.FieldByName('nomer').asString+Chr(9)+DBLookupComboBoxEH2.ListSource.DataSet.FieldByName('name').asString+Chr(9)+Chr(9)+Chr(9)+Chr(9));



  While NOT DBGridEh1.DataSource.DataSet.Eof Do
    begin
    if  (trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString)<>'#') and (trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString)<>'')  then
    if   (trim(DBGridEh1.DataSource.DataSet.FieldByName('name').asString)<>'')
      then
        begin
            if (COPY(trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString),1,1)='Ч')
              then
              begin
               if   TryStrToInt(COPY(trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString),2,1),eee)=true then
                  Writeln(f,trim(DBGridEh1.DataSource.DataSet.FieldByName('Stroka').asString)+Chr(9)+
      trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString)+Chr(9)+Chr(9)+Chr(9)+
      trim(DBGridEh1.DataSource.DataSet.FieldByName('KOD').asString)+' '+
      trim(StringReplace(StringReplace(DBGridEh1.DataSource.DataSet.FieldByName('NAME').asString,#13,' ',[rfReplaceAll]),#10,' ',[rfReplaceAll])));
      end
else

           if  TryStrToInt(COPY(trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString),1,1),eee)=true
              then
               if   (COPY(trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString),2,1)='-') then
                  Writeln(f,trim(DBGridEh1.DataSource.DataSet.FieldByName('Stroka').asString)+Chr(9)+
      trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString)+Chr(9)+Chr(9)+Chr(9)+
      trim(DBGridEh1.DataSource.DataSet.FieldByName('KOD').asString)+' '+
      trim(StringReplace(StringReplace(DBGridEh1.DataSource.DataSet.FieldByName('NAME').asString,#13,' ',[rfReplaceAll]),#10,' ',[rfReplaceAll])))





else
  begin
     if  trim(DBGridEh1.DataSource.DataSet.FieldByName('ed4').asString)='' then
            ShowMEssage('ОШИБКА в строке '+DBGridEh1.DataSource.DataSet.FieldByName('Stroka').asString+' у '+
            DBGridEh1.DataSource.DataSet.FieldByName('NAME').asString+' неуказана ед изм');
      Writeln(f,trim(DBGridEh1.DataSource.DataSet.FieldByName('Stroka').asString)+Chr(9)+
      trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString)+Chr(9)+Chr(9)+
      trim(DBGridEh1.DataSource.DataSet.FieldByName('KOD').asString)+Chr(9)+
      trim(StringReplace(StringReplace(DBGridEh1.DataSource.DataSet.FieldByName('NAME').asString,#13,' ',[rfReplaceAll]),#10,' ',[rfReplaceAll]))+Chr(9)+
       trim(DBGridEh1.DataSource.DataSet.FieldByName('ed4').asString)+Chr(9)+
       trim(StringReplace(DBGridEh1.DataSource.DataSet.FieldByName('kol').asString,',','.',flags))+Chr(9)+
       trim(StringReplace(DBGridEh1.DataSource.DataSet.FieldByName('mass_ed').asString,',','.',flags))+Chr(9)+
       trim(StringReplace(DBGridEh1.DataSource.DataSet.FieldByName('mass').asString,',','.',flags))+Chr(9)+Chr(9)+
       DBGridEh1.DataSource.DataSet.FieldByName('Kod_ved1').Value
       );
    end;
  end;



   //   if  (trim(DBGridEh1.DataSource.DataSet.FieldByName('kod').asString)='') and  (trim(DBGridEh1.DataSource.DataSet.FieldByName('name').asString)<>'')
   //   and (trim(DBGridEh1.DataSource.DataSet.FieldByName('poz').asString)<>'#')
   //     then
   //     ShowMEssage('ОШИБКА в строке '+DBGridEh1.DataSource.DataSet.FieldByName('Stroka').asString+' у '+
   //         DBGridEh1.DataSource.DataSet.FieldByName('NAME').asString+' неуказан КОД, транспорт с критической ошибкой! Проставте код и повторите!!!!!' );


     DbGridEh1.DataSource.DataSet.Next;
     end;
    DbGridEh1.DataSource.DataSet.EnableControls;
    CloseFile(F);
 end;

end;

procedure TForm7.ClientDataSet1CalcFields(DataSet: TDataSet);
begin
     //  DBGridEh1.DataSource.DataSet.FieldByName('number_string').Value:=ABS(ClientDATAset1.RecNo);
end;

procedure TForm7.ClientDataSet1NewRecord(DataSet: TDataSet);
var KeyValues : Variant;
OldCursor:Tcursor;
begin
if   DBGRIDEH1.ReadOnly<>true then
  begin
          DBGridEh1.DataSource.DataSet.FieldByName('ved_id').AsFloat:=id_spec;    LABEL6.caption:=IntTostr(id_spec);
         // ShowMessage(intTostr(ins_string));

       DBGridEh1.DataSource.DataSet.FieldByName('poz').value:=' ';
       DBGridEh1.DataSource.DataSet.FieldByName('sbor').value:=0;
       DBGridEh1.DataSource.DataSet.FieldByName('sklad').value:=0;
       DBGridEh1.DataSource.DataSet.FieldByName('zak').value:=0;
       DBGridEh1.DataSource.DataSet.FieldByName('obr').value:=0;
       DBGridEh1.DataSource.DataSet.FieldByName('sklad1').value:=0;
       DBGridEh1.DataSource.DataSet.FieldByName('montazh').value:=0;
       DBGridEh1.DataSource.DataSet.FieldByName('kod_ved').value:=1;
       DBGridEh1.DataSource.DataSet.FieldByName('mech_izl').value:=0;
       k_max:=k_max+1;
       DBGridEh1.DataSource.DataSet.FieldByName('VED_MAT_UNIQ').value:=k_max;
   //    if round(max_string)=1 then max_string:=1;
   //    if max_string=0 then max_string:=1;
    //   if round(max_string)=DBGridEh1.DataSource.DataSet.RecordCount then max_string:=DBGridEh1.DataSource.DataSet.RecordCount+1;

        DBGridEh1.DataSource.DataSet.FieldByName('stroka').value:=ins_string;
           KeyValues:=Round(ins_string)+1;



                 DbGridEh1.DataSource.DataSet.DisableControls;
         OldCursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
 Form7.Cursor:= Screen.Cursor;

      DBGridEh1.DataSource.DataSet.last;
  While  DBGridEh1.DataSource.DataSet.RecNo>ins_string Do
        begin
     DBGridEh1.DataSource.DataSet.Edit;
     DBGridEh1.DataSource.DataSet.FieldByName('stroka').Value:= DBGridEh1.DataSource.DataSet.RecNo;
     DbGridEh1.DataSource.DataSet.post;
          //    ShowMEssage(DBGridEh1.DataSource.DataSet.FieldByName('VED_MAT_UNIQ').asstring);
     DbGridEh1.DataSource.DataSet.Prior;
    end;

try

  DBGridEh1.DataSource.DataSet.Locate('stroka', KeyValues, []);
finally
  DbGridEh1.DataSource.DataSet.EnableControls;
Application.ProcessMessages;
      Screen.Cursor := OldCursor;

       end;
end;
end;

procedure TForm7.ClientDataSet1BeforeInsert(DataSet: TDataSet);
begin
///temp//DBGridEh1.DataSource.DataSet.Next;
///temp//if  Frac(DBGridEh1.DataSource.DataSet.FieldByName('Stroka').asFloat)>0 then
///temp//max_string:=DBGridEh1.DataSource.DataSet.FieldByName('stroka').asFloat-0.001
///temp//else
///temp//max_string:=DBGridEh1.DataSource.DataSet.FieldByName('number_string').asInteger-0.001;
   // ins_string:=DBGridEh1.DataSource.DataSet.FieldByName('number_string').asInteger;
end;

procedure TForm7.ClientDataSet1AfterDelete(DataSet: TDataSet);
begin
 if ClientdataSet1.ChangeCount>0 then Button1.Enabled:=true else Button1.Enabled:=false;

end;

procedure TForm7.ClientDataSet1AfterPost(DataSet: TDataSet);
begin
 if ClientdataSet1.ChangeCount>0 then Button1.Enabled:=true else Button1.Enabled:=false;
end;

procedure TForm7.N1Click(Sender: TObject);
var i,pointer1:integer;
begin
if  DBGridEH1.SelectedRows.Count>0 then
  begin
SetLength(DynArray,DBGridEH1.SelectedRows.Count*6);

i:=0;
while i<DBGridEH1.SelectedRows.Count*6-1 do
begin

   pointer1:=round(i/6);
DBGridEH1.DataSource.DataSet.GotoBookmark(pointer(DBGridEH1.SelectedRows.Items[pointer1]));

if DBGridEH1.DataSource.DataSet.FieldByName('kod').asstring<>'' then
 DynArray[i]:=DBGridEH1.DataSource.DataSet.FieldByName('kod').value;
 if DBGridEH1.DataSource.DataSet.FieldByName('name').value<>'' then
 DynArray[i+1]:=DBGridEH1.DataSource.DataSet.FieldByName('name').value;

 if  DBGridEH1.DataSource.DataSet.FieldByName('kol').asFloat<>0 then
 DynArray[i+2]:=DBGridEH1.DataSource.DataSet.FieldByName('kol').value
 else  DynArray[i+2]:=null;

 if DBGridEH1.DataSource.DataSet.FieldByName('mass').asFloat<>0 then
 DynArray[i+3]:=DBGridEH1.DataSource.DataSet.FieldByName('mass').value
 else DynArray[i+3]:=null;

  if DBGridEH1.DataSource.DataSet.FieldByName('ed').asFloat<>0 then
 DynArray[i+4]:=DBGridEH1.DataSource.DataSet.FieldByName('ed').value
 else DynArray[i+4]:=null;

   if DBGridEH1.DataSource.DataSet.FieldByName('kod_ved').asFloat<>0 then
 DynArray[i+5]:=DBGridEH1.DataSource.DataSet.FieldByName('kod_ved').value
 else DynArray[i+5]:=null;

 i:=i+6;
end;
  DBGridEH1.SelectedRows.Clear;
  end;
//  max_string:=5; DBGridEh1.DataSource.DataSet.Insert;
 //lientDataSet1NewRecord(nil);
end;
procedure TForm7.PopupMenu1Popup(Sender: TObject);
begin
if  Length(DynArray)=0 then  popupMenu1.Items[1].Enabled:=false else popupMenu1.Items[1].Enabled:=true;

end;

procedure TForm7.N2Click(Sender: TObject);
var k:integer;
begin
k:=1;
ShowMEssage('Отключено');


////while Length(DynArray)>k  DO
////   begin
////DbgridEh1.DataSource.DataSet.Insert;
////DbgridEh1.DataSource.DataSet.Edit;
////DbgridEh1.DataSource.DataSet.FieldByName('kod').Value:=DynArray[k-1];
////DbgridEh1.DataSource.DataSet.FieldByName('name').Value:=DynArray[k];
////DbgridEh1.DataSource.DataSet.FieldByName('kol').Value:=DynArray[k+1];
////DbgridEh1.DataSource.DataSet.FieldByName('mass').Value:=DynArray[K+2];
////DbgridEh1.DataSource.DataSet.FieldByName('ed').Value:=DynArray[K+3];
////DbgridEh1.DataSource.DataSet.FieldByName('kod_ved').Value:=DynArray[K+4];
////DbgridEh1.DataSource.DataSet.Post;
////   k:=k+6;

////end;

// SetLength(DynArray,0);//

end;

procedure TForm7.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) and DBGridEH1.EditorMode then
    begin
        DBGridEH1.EditorMode := false;
        DBGridEH1.SelectedIndex := DBGridEH1.SelectedIndex + 1;
    end;

end;

procedure TForm7.DBLookupComboboxEh2Enter(Sender: TObject);
begin
LAbel4.Caption:=DBLookupComboBoxEH2.ListSource.DataSet.FieldByName(DBLookupComboBoxEH2.KeyField).asstring;


end;

procedure TForm7.DBGridEh1Columns6UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin

DbgridEh1.DataSource.DataSet.FieldByName('mass').Value:=Value*
DbgridEh1.DataSource.DataSet.FieldByName('mass_ed').Value;
end;

procedure TForm7.DBGridEh1Columns7UpdateData(Sender: TObject;
  var Text: String; var Value: Variant; var UseText, Handled: Boolean);
begin
DbgridEh1.DataSource.DataSet.FieldByName('mass').Value:=DbgridEh1.DataSource.DataSet.FieldByName('kol').Value*
Value;
end;

procedure TForm7.Button5Click(Sender: TObject);
 var
fileNAm,stroka:string;
Excel: Variant;
index,index2,index3,kl,workbookCount,qq,index_list:integer;
f:double;
OldCursor: TCursor;
begin
With OpenDialog1 Do
 if Execute then
  fileNAm:=FileName;
   try
 Excel := CreateOleObject('Excel.Application');
  except
  begin
   Application.MessageBox('Приложение будет закрыто', 'Ошибка соединения', 0);
     Application.Terminate;
     end;
    end;
    if  fileNAm<>'' then
      begin
         Excel.Workbooks.Add[fileNAm];
         Excel.DisplayAlerts:=False;
         Excel.Visible := false;
         index_list:=0;
         workbookCount:=Excel.Worksheets.Count;
         qq:=0;
         with Form15 Do
           begin
           Caption:='Выберите несущую';
             While workbookCount>qq DO
               Begin
               qq:=qq+1;

               ListBox1.Items.Add(Excel.Sheets[qq].Name);
            end;
            form15.Return_type := true;
            ShowModal();
          if Index1<>0 then
           index_list:=Index1;
           end;
           form15.free; //освобождаем память 
    if index_list<>0 then
      begin
     try
       //  Excel.Worksheets['спецификация'].Select;
         Excel.Worksheets[index_list].Select;
     except
       Excel.Worksheets['Завод'].Select;  //ShowMessage(Excel.Range['A1'].text);
     end;
        index2:=4;kl:=0;
    if (SimpleDataSet2.FieldByName('vid_dok').asinteger=1)  then
    begin
     index2:=5; kl:=1;
    end;
        index:=index2; index3:=index2;
         Label5.Visible:=true;   ProgressBar1.Visible:=true;
     DbGridEh1.DataSource.DataSet.DisableControls;
   While  Excel.Cells[index3,1].Text<>'' Do
    Begin
    index3:=index3+1;
      end;
Application.ProcessMessages;


  OldCursor := Screen.Cursor;
 Screen.Cursor := crHourGlass;
 Form7.Cursor:= Screen.Cursor;
//  ShowMessage(IntToStr(index));;
//       stroka:=Excel.Cells[index,1].Text;
ProgressBar1.Max:=Index3;



//// While index>=index2 Do
 While Excel.Cells[index,1].Text<>'' Do
  begin
  if DbgridEh1.DataSource.DataSet.RecordCount=0 then
ins_string:=1
else ins_string:=DbgridEh1.DataSource.DataSet.RecNo;

       DbgridEh1.DataSource.DataSet.Insert;
DbgridEh1.DataSource.DataSet.Edit;
 if SimpleDataSet2.FieldByName('vid_dok').asinteger=1 then
DbgridEh1.DataSource.DataSet.FieldByName('section').Value:=Excel.Cells[index,3].Text;

DbgridEh1.DataSource.DataSet.FieldByName('kod').Value:=Excel.Cells[index,3+kl].Text;
DbgridEh1.DataSource.DataSet.FieldByName('poz').Value:=Excel.Cells[index,2].Text;

DbgridEh1.DataSource.DataSet.FieldByName('name').Value:=Excel.Cells[index,4+kl].Text;
if ((Excel.Cells[index,6+kl].Text)<>'') and (TryStrToFloat(Excel.Cells[index,6+kl].Text,f)=true)then
DbgridEh1.DataSource.DataSet.FieldByName('kol').Value:=StrToFloat(Excel.Cells[index,6+kl].Text);
//else DbgridEh1.DataSource.DataSet.FieldByName('kol').Value:=0;
if ((Excel.Cells[index,8+kl].Text)<>'') and (TryStrToFloat(Excel.Cells[index,8+kl].Text,f)=true) then
DbgridEh1.DataSource.DataSet.FieldByName('mass').Value:=StrToFloat(Excel.Cells[index,8+kl].Text);
//else DbgridEh1.DataSource.DataSet.FieldByName('mass').Value:=0;

if (Excel.Cells[index,5+kl].Text)<>'' then
begin
DbgridEh1.DataSource.DataSet.FieldByName('ed4').LookupDataSet.First;

While  (not DbgridEh1.DataSource.DataSet.FieldByName('ed4').LookupDataSet.Eof)
 and (DbgridEh1.DataSource.DataSet.FieldByName('ed4').LookupDataSet.FieldByName('koded').Value<>Trim(Excel.Cells[index,5+kl].Text)) do
   begin
     DbgridEh1.DataSource.DataSet.FieldByName('ed4').LookupDataSet.Next;
   end;
if DbgridEh1.DataSource.DataSet.FieldByName('ed4').LookupDataSet.FieldByName('koded').Value=Trim(Excel.Cells[index,5+kl].Text)
 then
DbgridEh1.DataSource.DataSet.FieldByName('ed').value:=
DbgridEh1.DataSource.DataSet.FieldByName('ed4').LookupDataSet.FieldByName('koded_id').Value;
end;

if SimpleDataSet2.FieldByName('vid_dok').asinteger<>2 then
  begin
 if (Excel.Cells[index,10+kl].Text)<>'' then
begin
DbgridEh1.DataSource.DataSet.FieldByName('Kod_ved1').LookupDataSet.First;

While  (not DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.Eof)
 and (DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.FieldByName('kod_ved_zak').Value<>Trim(Excel.Cells[index,10+kl].Text)) do
   begin
     DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.Next;
   end;
 if DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.FieldByName('kod_ved_zak').Value=Trim(Excel.Cells[index,10+kl].Text)
  then
DbgridEh1.DataSource.DataSet.FieldByName('kod_ved').value:=
DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.FieldByName('kod_ved_id').Value;
end;
 end ///ved ne llay 2
 else
 if (Excel.Cells[index,11].Text)<>'' then
begin
DbgridEh1.DataSource.DataSet.FieldByName('Kod_ved1').LookupDataSet.First;
While  (not DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.Eof)
 and (DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.FieldByName('kod_ved_zak').Value<>Trim(Excel.Cells[index,11].Text)) do
   begin
     DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.Next;
   end;
 if DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.FieldByName('kod_ved_zak').Value=Trim(Excel.Cells[index,11].Text)
  then
DbgridEh1.DataSource.DataSet.FieldByName('kod_ved').value:=
DbgridEh1.DataSource.DataSet.FieldByName('kod_ved1').LookupDataSet.FieldByName('kod_ved_id').Value;
 end;



  if ((Excel.Cells[index,7+kl].Text)<>'') and (TryStrToFloat(Excel.Cells[index,7+kl].Text,f)=true)then
DbgridEh1.DataSource.DataSet.FieldByName('mass_ed').Value:=StrToFloat(Excel.Cells[index,7+kl].Text);
//else DbgridEh1.DataSource.DataSet.FieldByName('mass_ed').Value:=0;
 if SimpleDataSet2.FieldByName('vid_dok').asinteger=1
   then
    if (Excel.Cells[index,18].Text)<>'' then
DbgridEh1.DataSource.DataSet.FieldByName('text').Value:=Excel.Cells[index,18].Text
else DbgridEh1.DataSource.DataSet.FieldByName('text').Value:=''
else  if  SimpleDataSet2.FieldByName('vid_dok').asinteger=2
   then
if (Excel.Cells[index,19].Text)<>'' then
DbgridEh1.DataSource.DataSet.FieldByName('text').Value:=Excel.Cells[index,19].Text
else DbgridEh1.DataSource.DataSet.FieldByName('text').Value:=''
 else
if (Excel.Cells[index,18+kl].Text)<>'' then
DbgridEh1.DataSource.DataSet.FieldByName('text').Value:=Excel.Cells[index,18+kl].Text
else DbgridEh1.DataSource.DataSet.FieldByName('text').Value:='';


 if SimpleDataSet2.FieldByName('vid_dok').asinteger=2
   then
  begin
if ( trim(Excel.Cells[index,10].Text)='да') or ( trim(Excel.Cells[index,10].Text)='Да') or ( trim(Excel.Cells[index,10].Text)='ДА')
 then DBGridEh1.DataSource.DataSet.FieldByName('mech_izl').value:=1;
if trim(Excel.Cells[index,12].Text)<>'' then
  DBGridEh1.DataSource.DataSet.FieldByName('pokr').value:=trim(Excel.Cells[index,12].Text);
 end; ///механика


  if SimpleDataSet2.FieldByName('vid_dok').asinteger=1  then
  begin
     if trim(Excel.Cells[index,10].Text)<>'' then
  DBGridEh1.DataSource.DataSet.FieldByName('pokr').value:=trim(Excel.Cells[index,10].Text);
 end;

   if SimpleDataSet2.FieldByName('vid_dok').asinteger=0  then
  begin
     if trim(Excel.Cells[index,11].Text)<>'' then
  DBGridEh1.DataSource.DataSet.FieldByName('pokr').value:=trim(Excel.Cells[index,11].Text);
 end;


////DbgridEh1.DataSource.DataSet.Post;
DbgridEh1.DataSource.DataSet.NEXT;
//ShowMEssage(IntTostr(index));
////ProgressBar1.Position:=ProgressBar1.Max-Index;
     index:=index+1;
     ProgressBar1.Position:=index;
    end;



     end; //file selected
            Label5.Visible:=false;   ProgressBar1.Visible:=false;
   DbGridEh1.DataSource.DataSet.EnableControls;
   DbGridEh1.DataSource.DataSet.First;
//   DbGridEh1.DataSource.DataSet.Delete;
   Excel.Quit;
    Excel:=Unassigned;  form7.Cursor:=crDefault;


  Screen.Cursor := OldCursor;
end;
end;





procedure TForm7.ComboBox1Change(Sender: TObject);
begin
         //  ShowMEssage(IntTostr(Combobox1.ItemIndex));
  // if change_function()=true then
  if MessageDlg('Вы действительно хотите изменить вид спецификации?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
  begin
    change_function();

      SQLQUERY1.SQL.Text:='UPDATE  SPEC_NAME SET vid_dok ='''+IntToStr(ComboBox1.ItemIndex)+''' where spec_id='
      +IntToStr(id_spec);
      SQLQUERY1.ExecSQL();
       SimpleDataSet2.Refresh;
       renew_table(nil,true);


       end;

      
end;

procedure TForm7.ClientDataSet1BeforeDelete(DataSet: TDataSet);
begin
if DBGRIDEH1.ReadOnly=true then exit;
end;

end.
