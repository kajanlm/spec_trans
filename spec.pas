unit spec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, GridsEh, DBGridEh, StdCtrls,
  MemTableDataEh, MemTableEh, DataDriverEh, MidasLib,
  DBXpress, SqlExpr, FMTBcd, DBClient, Provider, DBAccess, Ora, SimpleDS,
  Menus;

type
  TForm1 = class(TForm)
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Label1: TLabel;
    DBGridEh2: TDBGridEh;
    SimpleDataSet1: TSimpleDataSet;
    DataSource1: TDataSource;
    SQLQuery1: TSQLQuery;
    MemTableEh1: TMemTableEh;
    DataSetDriverEh1: TDataSetDriverEh;
    SimpleDataSet2: TSimpleDataSet;
    DataSource2: TDataSource;
    Edit1: TEdit;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit2: TEdit;
    Button3: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Button4: TButton;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SQLQuery2: TSQLQuery;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2CellClick(Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
     MutexHandle : THandle;
const
 MutexName = 'one_inst_demo_mutex';
implementation

uses Unit2, Unit9, Unit7;

{$R *.dfm}


function ExtractWord(const AString: string; const ADelimiter: Char; const ANumber: integer): string;
var
  i, j, k: integer;
begin
  i := 1;
  k := 1;
  while k <> ANumber do
  begin
    if AString[i] = ADelimiter then
    begin
      Inc(k);
    end;
    Inc(i);
  end;
  j := i + 1;
  while (j <= Length(AString)) and (AString[j] <> ADelimiter) do
    Inc(j);
  Result := Copy(AString, i, j - i);
end;

procedure TForm1.Button1Click(Sender: TObject);
var str,name,tree_id,tree_tr_id,full_name,sprav_id,kod,koded_id,koded,kof,namek,koded_koded_id,mass,koded_koded_id2,koded_koded_id_koded2:string;
kof_sp_id,koded_koded_id_kof_sp,sprav_sprav_id,chertezh,L_OGRAN:string;
count,k:integer;
f:textfile;
begin
//  if str='dsdsa' then
 //   begin
//  if tree_id='dxfsdfsd' then

AssignFile(f,'C:\1111\BAZE\sprav_tree.txt');
  Reset(f);
    Count:=0;
  while not EOF(f) do
  begin
    Readln(f);
    Inc(Count);
  end;

 Reset(f);
  k:=0;
  // SimpleDataSet1.DataSet.CommandText:='set names cp1251';
 While not eof(f) do
    begin
    k:=k+1;
     readln(f, str);
     name:=ExtractWord(str, '|', 1);
     tree_id:=ExtractWord(str, '|', 2);
     tree_tr_id:=ExtractWord(str, '|', 3);


     LABEL1.Caption:='Загружаю '+IntToStr(k)+' из '+IntToStr(count);
      Application.ProcessMessages;
    SQLQuery1.Sql.Clear;

      try                                                                               //+Utf8toANSI(name)+''
       SQLQuery1.Sql.Text:='INSERT INTO SPRAV_TREE_TR (name,tree_id,tree_tr_id) Values('''+name+''','''+tree_id+''','''+tree_tr_id+chr(39)+')';
    //       ShowMessage(SQLQuery1.Sql.Text); AnsiToUtf8
       SQLQuery1.ExecSQL;
       except
         ShowMessage(SQLQuery1.Sql.Text); ShowMessage('!');
      end;

     //  SQLQuery1.Sql.Text:='INSERT INTO spec.SPRAV_TREE_TR (name,tree_id,tree_tr_id) Values(''FRODO'',''120'',''130'')';
   //    SQLQuery1.ExecSQL;
      end;
  CloseFile(f);


//////////////******************************************

AssignFile(f,'C:\1111\BAZE\sprav.txt');
  Reset(f);
    Count:=0;
     k:=0;
  while not EOF(f) do
  begin
    Readln(f);
    Inc(Count);
  end;
      Reset(f);
 While not eof(f) do
    begin
    k:=k+1;
     readln(f, str);
     kod:=ExtractWord(str, '|', 1);
     name:=ExtractWord(str, '|', 2);
     full_name:=ExtractWord(str, '|', 3);
     sprav_id:=ExtractWord(str, '|', 4);
     tree_id:=ExtractWord(str, '|', 5);
     mass:=ExtractWord(str, '|', 6);
     koded_id:=ExtractWord(str, '|', 7);
     koded_koded_id2:=ExtractWord(str, '|', 8);
     koded_koded_id_koded2:=ExtractWord(str, '|', 9);
      chertezh:=ExtractWord(str, '|', 11);
      L_OGRAN:=ExtractWord(str, '|', 10);
     LABEL1.Caption:='Загружаю '+IntToStr(k)+' из '+IntToStr(count);
      Application.ProcessMessages;
        SQLQuery1.Sql.Clear;
      try                                                                                              //'''+Utf8toANSI(name)+
       SQLQuery1.Sql.Text:='INSERT INTO SPRAV (kod,name,fullname,spr_id,tree_id,mass,koded_id,koded_koded_id2,koded_koded_id_koded2,chertezh,L_OGRAN) Values('''+kod+''','''+(name)+''','''+(full_name)+''','''+ sprav_id+''','''+tree_id+''','''+mass+''','''+koded_id+''','''+koded_koded_id2
       +''','''+koded_koded_id_koded2+''','''+chertezh+''','''+L_OGRAN+chr(39)+')';
       SQLQuery1.ExecSQL;
       except
         ShowMessage(SQLQuery1.Sql.Text); ShowMessage('!');
      end;


 end;
  CloseFile(f);
 //   end; //// затычка убрать потом
  AssignFile(f,'C:\1111\BAZE\koded.txt');
  Reset(f);
    Count:=0;
     k:=0;
  while not EOF(f) do
  begin
    Readln(f);
    Inc(Count);
  end;
      Reset(f);
 While not eof(f) do
    begin
    k:=k+1;
     readln(f, str);
     koded_id:=ExtractWord(str, '|', 1);
     koded:=ExtractWord(str, '|', 2);
     kof:=ExtractWord(str, '|', 3);
     name:=ExtractWord(str, '|', 4);
     namek:=ExtractWord(str, '|', 5);
     koded_koded_id:=ExtractWord(str, '|', 6);

     LABEL1.Caption:='Загружаю '+IntToStr(k)+' из '+IntToStr(count);
      Application.ProcessMessages;
        SQLQuery1.Sql.Clear;
      try
       SQLQuery1.Sql.Text:='INSERT INTO koded (koded_id,koded,kof,name,namek,koded_koded_id) Values('''+koded_id+''','''+(koded)+''','''+kof+''','''+(name)+''','''+(namek)+''','''+koded_koded_id+chr(39)+')';
  //     ShowMessage(SQLQuery1.Sql.Text+' '+name);
      SQLQuery1.ExecSQL;
       except
         ShowMessage(SQLQuery1.Sql.Text); ShowMessage('!');
      end;
     end;
       CloseFile(f);

      AssignFile(f,'C:\1111\BAZE\kof_koded.txt');
  Reset(f);
    Count:=0;
     k:=0;
  while not EOF(f) do
  begin
    Readln(f);
    Inc(Count);
  end;
      Reset(f);
 While not eof(f) do
    begin
    k:=k+1;
     readln(f, str);
     kof_sp_id:=ExtractWord(str, '|', 1);
     koded_koded_id:=ExtractWord(str, '|', 2);
     koded_koded_id_kof_sp:=ExtractWord(str, '|', 3);
     sprav_sprav_id:=ExtractWord(str, '|', 4);
     kof:=ExtractWord(str, '|', 5);

     LABEL1.Caption:='Загружаю '+IntToStr(k)+' из '+IntToStr(count);
      Application.ProcessMessages;
        SQLQuery1.Sql.Clear;
      try
       SQLQuery1.Sql.Text:='INSERT INTO kof_koded (kof_sp_id,koded_koded_id,koded_koded_id_kof_sp,sprav_sprav_id,kof) Values('''+kof_sp_id+''','''+koded_koded_id+''','''+koded_koded_id_kof_sp+''','''+sprav_sprav_id+''','''+kof+chr(39)+')';
  //     ShowMessage(SQLQuery1.Sql.Text+' '+name);
      SQLQuery1.ExecSQL;
       except
         ShowMessage(SQLQuery1.Sql.Text); ShowMessage('!');
      end;
     end;
       CloseFile(f);


    end;
procedure TForm1.FormCreate(Sender: TObject);
var s:string;
begin
 //
  MutexHandle := CreateMutex(nil, false, MutexName);

//  if  Form2.SQLConnection1.Params.Values['username']='ya' then
// begin
 //  ShowMessage('Добро пожаловать хозяин!');
    Button1.Enabled:=true;
// end;
 if  SimpleDataSet1.Active=false then
 SimpleDataSet1.Active:=true;
 if SimpleDataSet1.DataSet.Active=false then
 SimpleDataSet1.DataSet.Active:=true;
 if memtableEh1.Active=false then
 memtableEh1.Active:=true;

end;







procedure TForm1.DBGridEh1DblClick(Sender: TObject);
var tx:string;
begin
 SimpleDAtaset2.Active:=false;
 SimpleDAtaset2.DataSet.Active:=false;
  tx:='Select SUBSTRING(KOD,1,15) KOD ,SUBSTRING(fullname,1,200) fullname, spr_id,tree_id,L_OGRAN,chertezh  from  SPRAV where tree_id='+DBGridEh1.DataSource.DataSet.FieldByName('tree_id').asString;
  if CheckBox1.Checked=true then
 tx:=tx+' and L_OGRAN=1';
 tx:=tx+ '  order by name' ;
 SimpleDAtaset2.DataSet.CommandText:=tx;

 SimpleDAtaset2.DataSet.Active:=true;
  SimpleDAtaset2.Active:=active;
end;

procedure TForm1.Button2Click(Sender: TObject);
var tx:string;
begin
   SimpleDAtaset2.Active:=false;
 SimpleDAtaset2.DataSet.Active:=false;
// ShowMessage('Select SUBSTRING(KOD,1,15) KOD ,SUBSTRING(fullname,1,200) fullname, spr_id,tree_id,L_OGRAN  from  SPRAV where KOD Rlike '+chr(39)+EDIT1.TEXT+chr(39)+' order by name' );
 tx:='Select SUBSTRING(KOD,1,15) KOD ,SUBSTRING(fullname,1,200) fullname, spr_id,tree_id,L_OGRAN,chertezh  from  SPRAV where KOD like '+chr(39)+EDIT1.TEXT+chr(39);
 if CheckBox1.Checked=true then
 tx:=tx+' and L_OGRAN=1';
 tx:=tx+ ' order by name';

 SimpleDAtaset2.DataSet.CommandText:=tx;

 SimpleDAtaset2.DataSet.Active:=true;
  SimpleDAtaset2.Active:=active;
 // ShowMessage('tree_id,'+DBGridEh2.DataSource.DataSet.FieldByName('tree_id').asString);
// if   DBGridEH1.DataSource.DataSet.Locate('tree_id',DBGridEh2.DataSource.DataSet.FieldByName('tree_id').asString,[loCaseInsensitive, loPartialKey])
 //  then
 //  ShowMessage('!!!!');
// DBGridEH1.DataSource.DataSet.Locate('tree_id',DBGridEh2.DataSource.DataSet.FieldByName('tree_id').asString,[loCaseInsensitive, loPartialKey]);

end;

procedure TForm1.N1Click(Sender: TObject);
begin
 Application.CreateForm(TForm9, Form9);
 Form9.Label2.Caption:=DBGRIDEH2.DataSource.DataSet.FieldByName('fullname').Value;
 Form9.Caption:=DBGRIDEH2.DataSource.DataSet.FieldByName('kod').Value+' '+DBGRIDEH2.DataSource.DataSet.FieldByName('fullname').Value;
 Form9.K:=DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').Value ;
  Form9.ShowModal();


end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 CloseHandle(MutexHandle);
end;

procedure TForm1.DBGridEh2DblClick(Sender: TObject);
begin

if  Caption='Заполняем из справочника' then
 begin
if   dbgridEh2.SelectedField.FieldName='KOD' then
  begin
Form7.DbgridEH1.DataSource.DataSet.EDIT;
Form7.DbgridEH1.DataSource.DataSet.FieldByName('kod').AsString:=DBGRIDEH2.DataSource.DataSet.FieldByName('kod').Value;
Form7.DbgridEH1.DataSource.DataSet.FieldByName('name').AsString:=DBGRIDEH2.DataSource.DataSet.FieldByName('fullname').Value;
//Form7.DbgridEH1.DataSource.DataSet.FieldByName('sprav_sprav_id').AsString:=DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').Value;
Form7.DbgridEH1.DataSource.DataSet.Post;
Form7.Show();
end;
if   dbgridEh2.SelectedField.FieldName='fullname' then
  begin
  if DBGRIDEH2.DataSource.DataSet.FieldByName('chertezh').Value<>'' then
     begin
        Form7.DbgridEH1.DataSource.DataSet.EDIT;
        Form7.DbgridEH1.DataSource.DataSet.FieldByName('kod').AsString:=DBGRIDEH2.DataSource.DataSet.FieldByName('chertezh').Value;
        Form7.DbgridEH1.DataSource.DataSet.FieldByName('name').AsString:=DBGRIDEH2.DataSource.DataSet.FieldByName('fullname').Value;
        Form7.DbgridEH1.DataSource.DataSet.Post;
        Form7.Show();
     end;
end;
end;

end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
if  Edit1.Text='Введите тут для поиска по коду' then
 Edit1.Text:='';
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin

if  Edit2.Text='Поиск по чертежу' then
 Edit2.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
var tx:string;
begin
   SimpleDAtaset2.Active:=false;
 SimpleDAtaset2.DataSet.Active:=false;
  tx:='Select SUBSTRING(KOD,1,15) KOD ,SUBSTRING(fullname,1,200) fullname, spr_id,tree_id,chertezh,L_OGRAN  from  SPRAV where chertezh like '+chr(39)+EDIT2.TEXT+chr(39);
  if CheckBox1.Checked=true then
 tx:=tx+' and L_OGRAN=1';
 tx:=tx+ ' order by name';
 SimpleDAtaset2.DataSet.CommandText:=tx;

 SimpleDAtaset2.DataSet.Active:=true;
  SimpleDAtaset2.Active:=active;
end;

procedure TForm1.Button4Click(Sender: TObject);
var tx:string;
begin
   SimpleDAtaset2.Active:=false;
 SimpleDAtaset2.DataSet.Active:=false;
 tx:=('Select SUBSTRING(KOD,1,15) KOD ,SUBSTRING(fullname,1,200) fullname, spr_id,tree_id,chertezh,L_OGRAN  from  SPRAV where fullname like' +chr(39)+EDIT3.TEXT+chr(39));
 if CheckBox1.Checked=true then
 tx:=tx+' and L_OGRAN=1';
 tx:=tx+ ' order by name' ;
 SimpleDAtaset2.DataSet.CommandText:=tx;
 SimpleDAtaset2.DataSet.Active:=true;
  SimpleDAtaset2.Active:=active;

end;

procedure TForm1.Edit3Click(Sender: TObject);
begin
  if  Edit3.Text='ВВедите часть названия' then
 Edit3.Text:='';
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then Button4Click(nil);
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=#13) then Button2Click(nil);
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) then Button3Click(nil);
end;

procedure TForm1.DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin

   if Column.Field.DataSet.FieldByName('L_OGRAN').value>0 then
      begin

         Background :=clAqua;
      end

    // TextOut(Rect.Left+2,Rect.Top+2,Column.Field.Text);
   //   Background := clTeal;

end;

procedure TForm1.DBGridEh2CellClick(Column: TColumnEh);
var tx:string;
begin
//  tx:='Select namek0, koded0, namek1, koded1, namek2, koded2 from (  ';
//  tx:=tx+'(Select namek as namek0 from koded where koded_id=(Select koded_id from SPRAV where spr_id='
//   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')) as namek,';
//  tx:=tx+' (Select koded as koded0 from koded where koded_id=(Select koded_id from SPRAV where spr_id='
//   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')) as koded,';

//    tx:=tx+'(Select namek as namek1 from koded where koded_id=(Select koded_koded_id2 from SPRAV where spr_id='
// +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')) namek1,';
// tx:=tx+' (Select koded as koded1 from koded where koded_id=(Select koded_koded_id2 from SPRAV where spr_id='
//  +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')) koded1, ';

//   tx:=tx+'(Select namek as namek2 from koded where koded_id=(Select koded_koded_id_koded2 from SPRAV where spr_id='
// +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')) namek2,';
// tx:=tx+' (Select koded as koded2 from koded where koded_id=(Select koded_koded_id_koded2 from SPRAV where spr_id='
//  +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')) koded2 ';


//   tx:=tx+')';
//   ShowMessage(tx);

//   LABEL5.Caption:=SQLQuery2.FieldByName('koded0').AsString+'  '+SQLQuery2.FieldByName('namek0').AsString;
//   LABEL7.Caption:=SQLQuery2.FieldByName('koded1').AsString+'  '+SQLQuery2.FieldByName('namek1').AsString;
//   LABEL9.Caption:=SQLQuery2.FieldByName('koded2').AsString+'  '+SQLQuery2.FieldByName('namek2').AsString;

 tx:=' Select ''aa0'' as aa, namek as namek0 from koded where koded_id=(Select koded_id from SPRAV where spr_id='
   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')';
 tx:=tx+' union ';
 tx:=tx+'  Select ''aa1'' as aa, koded as koded0 from koded where koded_id=(Select koded_id from SPRAV where spr_id='
+DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')';
 tx:=tx+' union ';
 tx:=tx+' Select ''bb0'' as aa,namek as namek1 from koded where koded_id=(Select koded_koded_id2 from SPRAV where spr_id='
   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')';
 tx:=tx+' union ';
 tx:=tx+' Select ''bb1'' as aa,koded as koded1 from koded where koded_id=(Select koded_koded_id2 from SPRAV where spr_id='
   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')';
 tx:=tx+' union ';
 tx:=tx+' Select ''cc0'' as aa,namek as namek2 from koded where koded_id=(Select  koded_koded_id_koded2 from SPRAV where spr_id='
   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')';
 tx:=tx+' union  ';
 tx:=tx+' Select ''cc1'' as aa, koded as koded2 from koded where koded_id=( Select  koded_koded_id_koded2 from SPRAV where spr_id='
   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring+')';
 tx:=tx+' union  ';
 tx:=tx+' Select ''dd0'' as aa, CAN_DO_SELF as namek0 from SPRAV where spr_id='
   +DBGRIDEH2.DataSource.DataSet.FieldByName('spr_id').asstring;//+')';
     // ShowMessage(tx);
 SQLQuery2.Sql.Text:=tx;
      SQLQuery2.Open;
           SQLQuery2.First;
 LABEL5.Caption:='';
 LABEL7.Caption:='';
 LABEL9.Caption:='';
 while  NOT SQLQuery2.EOF DO
   begin
     if SQLQuery2.FieldByName('aa').AsString='aa0' then  LABEL5.Caption:=SQLQuery2.FieldByName('namek0').AsString;
     if SQLQuery2.FieldByName('aa').AsString='aa1' then  LABEL5.Caption:=LABEL5.Caption+' '+SQLQuery2.FieldByName('namek0').AsString;
     if SQLQuery2.FieldByName('aa').AsString='bb0' then  LABEL7.Caption:=SQLQuery2.FieldByName('namek0').AsString;
     if SQLQuery2.FieldByName('aa').AsString='bb1' then  LABEL7.Caption:=LABEL7.Caption+' '+SQLQuery2.FieldByName('namek0').AsString;
     if SQLQuery2.FieldByName('aa').AsString='cc0' then  LABEL9.Caption:=SQLQuery2.FieldByName('namek0').AsString;
     if SQLQuery2.FieldByName('aa').AsString='cc1' then  LABEL9.Caption:=LABEL9.Caption+' '+SQLQuery2.FieldByName('namek0').AsString;
    if SQLQuery2.FieldByName('aa').AsString='dd0' then
       if SQLQuery2.FieldByName('namek0').AsString='1' then  LABEL12.Caption:='МСЧ'
       else LABEL12.Caption:='*';
   SQLQuery2.NEXT;
   end;

   LABEL10.Caption:=DBGRIDEH2.DataSource.DataSet.FieldByName('fullname').asstring
end;

end.
