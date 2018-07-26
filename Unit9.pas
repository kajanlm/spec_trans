unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FMTBcd, DB, SqlExpr, GridsEh, DBGridEh, DBClient,
  SimpleDS;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SQLDataSet1: TSQLDataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    SimpleDataSet1: TSimpleDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    k:integer;
  end;

var
  Form9: TForm9;
 // A1: array of String;
implementation

{$R *.dfm}

type
FArray = array of real;

function checkElem(var B2,A1,A2,AK:FArray; index:integer): integer;
var K:integer;
begin
k:=0;
 while K<Length(A1) Do
    begin
      if k<>index then
         begin
           if A1[k]=B2[index] then ShowMessage('FFFFF ');
           if A2[k]=B2[index] then begin ShowMessage('FFFFF '+FloatToStr(A2[k])+'---'+FloatToStr(A1[k])+' k '+FloatToStr(1/AK[k]));
                                result:=k; break; end;
         end;

    K:=k+1;
    end;
end;

procedure addElem( var B1,B2,BK: FArray; Index: integer; A1,A2,AK: real);
var Len : integer;
begin
   Len:= Length(B1);
   setLength(B1,Len+1);
   setLength(B2,Len+1);
   setLength(BK,Len+1);
  b1[len]:=a1;
  b2[len]:=a2;
  bK[len]:=aK;
end;

procedure delElem(var A1,A2,AK: FArray; Index:integer );
var Last : integer;
begin
  Last:= high(A1); //  ShowMessage(IntTostr(Length(A1))+'!!!!!!!!!!!!!!!!!!!');
   if (Index < Last) and (Last>1) then  begin
     move( A1[Index+1], A1[Index],(Last-Index)*sizeof(A1[Index]));setLength(A1,LAST);
     move(A2[Index+1], A2[Index],(Last-Index) * sizeof(A2[Index]));setLength(A2,Last);
     move(AK[Index+1], AK[Index],(Last-Index) * sizeof(AK[Index]));setLength(AK,Last);
//  setLength(A1,5);
    ShowMessage(IntTostr(Length(A1))+' '+IntToStr(Last)+' '+IntToStr(index));
  end;

end;

procedure TForm9.FormShow(Sender: TObject);
var tx: string;
A1,A2,AK,B1,B2,BK:FArray;
flag1:boolean;
k,k1,dddd,e,len:integer;
temp:real;
ed_from,ed_to:integer;
begin

if SQLDataSet1.Active=true then SQLDataSet1.Active:=false;
tx:='';
tx:='Select mass,(Select namek from spec.koded where koded_id=spr.koded_id) as koded_koded_id, ';
tx:=tx+'(Select namek from spec.koded where koded_id=spr.koded_koded_id_koded2) as koded_koded_id_koded2, ';
tx:=tx+' (Select namek from spec.koded where koded_id=spr.koded_koded_id2) as koded_koded_id2 ';
tx:=tx+'  from spec.SPRAV as spr where spr_id='+intTostr(k);
SQLDataSet1.CommandText:=tx;

SQLDataSet1.Active:=true;
 Label6.Caption:=SQLDataSet1.FieldByName('koded_koded_id').asString ;
 Label7.Caption:=SQLDataSet1.FieldByName('koded_koded_id2').asString ;
  Label8.Caption:=SQLDataSet1.FieldByName('koded_koded_id_koded2').asString ;
  tx:='';
if SimpleDataSet1.Active=true then SimpleDataSet1.Active:=false;
if SimpleDataSet1.dataset.Active=true then SimpleDataSet1.dataset.Active:=false;

//tx:='   SELECT KOF K,KODED_ID  E1,KODED_KODED_ID E2  FROM spec.koded WHERE KODED_KODED_ID!=0 ';
//tx:=tx+'   UNION ALL ';
tx:=tx+'   SELECT KOF K,KODED_KODED_ID E1 ,KODED_KODED_ID_KOF_SP E2  FROM spec.kof_koded WHERE SPRAV_SPRAV_ID=673000';
tx:=tx+'    and kof_sp_id !=-99999';
//tx:=tx+'  union';
//tx:=tx+'   select mass,k796.koded_id,k166.koded_id';
//tx:=tx+'   from spec.koded as k166,spec.koded as k796,spec.SPRAV s';
//tx:=tx+'   where k166.koded=''166''';
//tx:=tx+'   and k796.koded=''796''';
//tx:=tx+'   and s.spr_id=673000';
//tx:=tx+'   and s.mass!=0';

//tx:=tx+ '   and s.mass=-100000 ';
//tx:=tx+'      and not exists ';
//tx:=tx+'      (select 1 from spec.kof_koded ';
//tx:=tx+'     where SPRAV_SPRAV_ID=673000 ';
//tx:=tx+'      and ';
//tx:=tx+'      ( ';
//tx:=tx+'        ( ';
////tx:=tx+'         KODED_KODED_ID in (select koded_id from spec.koded where koded in(''796'',''798'')) ';
//tx:=tx+'         and KODED_KODED_ID_KOF_SP in (select koded_id from spec.koded where koded in(''166'',''168'',''163'')) ';
//tx:=tx+'      ) ';
//tx:=tx+'      or ';
//tx:=tx+'      ( ';
//tx:=tx+'       KODED_KODED_ID in (select koded_id from spec.koded where koded in(''166'',''168'',''163'')) ';
//tx:=tx+'       and KODED_KODED_ID_KOF_SP in (select koded_id from spec.koded where koded in(''796'',''798'')) ';
//tx:=tx+'       ) ';
//tx:=tx+'    ) ';
//tx:=tx+'   ) ';

 SimpleDataSet1.DATASet.CommandText:=tx;
 SimpleDataSet1.DATASET.Active:=true;
  SimpleDataSet1.Active:=true;
 SetLength(A1, SimpleDataSet1.RecordCount);
 SetLength(A2, SimpleDataSet1.RecordCount);
  SetLength(AK, SimpleDataSet1.RecordCount);
//ShowMessage(Inttostr(Length(B1)));
 k:=0;
 SimpleDataSet1.First;
 while k<Length(A1) do
    begin
  //  ShowMessage('цикл  '+IntToStr(k)+' длина масс '+IntTostr(Length(A1))+' длина датасета '+IntTostr( SimpleDataSet1.RecordCount)+' к '+SimpleDataSet1.FieldByName('K').asstring+' '+SimpleDataSet1.FieldByName('E1').asstring );
   AK[k]:=StrToFloat(StringReplace(SimpleDataSet1.FieldByName('K').asString,'.',',',[rfReplaceAll, rfIgnoreCase]));

    A1[k]:=SimpleDataSet1.FieldByName('E1').asFloat ;
    A2[k]:=SimpleDataSet1.FieldByName('E2').asFloat ;
     SimpleDataSet1.Next;
      k:=k+1;
    end;
    k:=0;k1:=0;  ShowMessage(IntTostr(Length(A1)));
    ed_from:=1;
    ed_to:=29;
 /////////////////********************************
    while k<Length(A1) do
     begin
 //     ShowMessage(IntTostr(Length(A1)));
       if  A1[k]=ed_from then
 begin
      SetLength(B1,1);
      SetLength(B2,1);
      SetLength(BK,1 );
      B1[k1]:=A1[k];
      B2[k1]:=A2[k];
      BK[k1]:=AK[k];
     ShowMEssage('!!!!!!!!!!!!!!! '+FloatToStr(B1[k1])+' '+FloatToStr(B2[k1])+' зачепился '+IntTosTR(k));
      delElem (A1,A2,AK,K);

 end
 else if A2[K]=ed_from then
    begin
         SetLength(B1,1);
      SetLength(B2,1);
      SetLength(BK,1 );
      B1[k1]:=A2[k];
      B2[k1]:=A1[k];
      BK[k1]:=1/AK[k];
      delElem (A1,A2,AK,K);
      ShowMEssage('! '+FloatToStr(B1[k1])+' '+FloatToStr(B2[k1])+' зачепился'+IntTosTR(k));
   end;
      e:=0;
         while (e<length(A1)) and (Length(B1)>0) do
            begin
       //       ShowMEssage('! '+FloatToStr(B2[high(B2)])+' '+FloatToStr(B1[e])+' ищю '+IntTosTR(e));
              if B2[high(B2)]=A1[e] then
                  begin
                      Len:= Length(B1);
                      setLength(B1,Len+1);
                      setLength(B2,Len+1);
                      setLength(BK,Len+1);
                      ShowMessage('!!');
                     B1[high(B1)]:=A1[e];
                     B2[high(B1)]:=A2[e];
                     BK[high(B1)]:=AK[e];
                     ShowMEssage('Добавляю 1 '+FloatToStr(A1[e])+' '+FloatToStr(A2[e]));
                     delElem (A1,A2,AK,e);e:=e-1;
                  end;
              if B2[high(B2)]=A2[e] then
                  begin
                     Len:= Length(B1);
                     setLength(B1,Len+1);
                     setLength(B2,Len+1);
                     setLength(BK,Len+1);
                      ShowMessage('!');
                     B1[high(B1)]:=A2[e];
                     B2[high(B1)]:=A1[e];
                     BK[high(B1)]:=1/AK[e];
                     ShowMEssage('Добавляю '+FloatToStr(A2[e])+' '+FloatToStr(A1[e]));
                     delElem (A1,A2,AK,e);e:=e-1;
                  end;
             e:=e+1;
            end;  ShowMessage('!');
      k:=k+1;
       //     end;
     end;

  //    if (ed_from=A1[k])   then
  //       begin
  //         addElem( B1,B2,BK,k1,A1[k],A2[k],AK[k]);
 //          dddd:=checkElem(B2,A1,A2,AK,k);  //ShowMessage(IntToStr(dddd));
 //       while   dddd>0 do
  //           begin
  //              addElem(B1,B2,BK,length(B1)+1,A2[dddd],A1[dddd],1/AK[dddd]);
  //              delElem (A1,A2,AK,dddd);
  //              ShowMessage(' checkElem('+FloatToStr(B2[high(B2)])+',A1,A2,AK,'+InttoStr(k1)+')');
  //              dddd:=checkElem(B2,A1,A2,AK,high(B1));
  //              if dddd=0 then
  //                 begin
 //                     delElem (b1,b2,bK,high(B1));
  //                    ShowMessage('Тупик');
   //                   ShowMessage(' checkElem('+FloatToStr(B2[high(B2)])+',A1,A2,AK,'+InttoStr(high(B1))+')');
   //                     dddd:=checkElem(B2,A1,A2,AK,high(B1));
  //                 end;
  //           end;

    //     end;




//     ShowMessage(FloatToStr(A1[k])+' DELETE '+FloatToStr(A2[k])+' '+FloatToStr(AK[k])+'  '+IntTosTr(k)+'  '+IntToStr(Length(A1)));
k:=0;
 while k<Length(B1) do begin
  ShowMessage(FloatToStr(B1[k])+'  '+FloatToStr(B2[k])+' '+FloatToStr(BK[k])+'  '+IntTosTr(k)+'  '+IntToStr(Length(B1))+'  '+IntToStr(Length(a1)));
  k:=k+1;
 end;
//   ShowMessage(IntTostr(Length(A1)));


end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
var A1,A2,AK: FArray;
begin
 A1:=NIL;
 A2:=NIL;
 AK:=NIL;

end;

end.
