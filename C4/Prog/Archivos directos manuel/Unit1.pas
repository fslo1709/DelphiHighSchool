unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,unit2;

type
 treg = record
   cod:integer;
   nom:string[30];
   email:string[30];
   dir:string[30];
   saldo:real;
 end;
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ar: file of treg;
  dato:treg;
  i:integer;
implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
begin
form1.Hide;
form2.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
dato.cod:=strtoint(edit1.Text);
dato.nom:=edit2.Text;
dato.email:=edit3.Text;
dato.dir:=edit4.Text;
dato.saldo:=strtofloat(edit5.Text);
edit1.Text:='';
edit2.Text:='';
edit3.Text:='';
edit4.Text:='';
edit5.Text:='';
button2.Enabled:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
assignfile(ar,'datos.c5');
reset(ar);
seek(ar,filesize(ar));
write(ar,dato);
   stringgrid1.Cells[0,filesize(ar)]:=inttostr(dato.cod);
   stringgrid1.Cells[1,filesize(ar)]:=dato.nom;
   stringgrid1.Cells[2,filesize(ar)]:=dato.email;
   stringgrid1.Cells[3,filesize(ar)]:=dato.dir;
   stringgrid1.Cells[4,filesize(ar)]:=floattostr(dato.saldo);
stringgrid1.RowCount:=filesize(ar)+1;
closefile(ar);
button2.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
rewrite(ar);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,j:integer; a,b:treg;
begin
 reset(ar);
 i:=0;
 while i<filesize(ar) do
  begin
   j:=i+1;
   seek(ar,i);
   read(ar,a);
    while j<filesize(ar) do
     begin
      seek(ar,j);
      read(ar,b);
     If(b.cod<a.cod) then
      begin
       seek(ar,j);
       write(ar,a);
       seek(ar,i);
       write(ar,b);
       a:=b;
      end;
     inc(j);
    end;
   inc(i);
 end;
 reset(ar);
 if filesize(ar)<>0 then
 begin
   for i := 1 to filesize(ar) do
   begin
     read(ar,dato);
     stringgrid1.Cells[0,i]:=inttostr(dato.cod);
     stringgrid1.Cells[1,i]:=dato.nom;
     stringgrid1.Cells[2,i]:=dato.email;
     stringgrid1.Cells[3,i]:=dato.dir;
     stringgrid1.Cells[4,i]:=floattostr(dato.saldo);
   end;
 end;
closefile(ar);
end;

procedure TForm1.Button5Click(Sender: TObject);
var a,b:treg; i,j:integer;
begin

end;

procedure TForm1.Button7Click(Sender: TObject);
var i,j:integer; a,b:treg;
begin
 reset(ar);
 i:=0;
 while i<filesize(ar) do
  begin
   j:=i+1;
   seek(ar,i);
   read(ar,a);
    while j<filesize(ar) do
     begin
      seek(ar,j);
      read(ar,b);
     If(ansiuppercase(b.nom)<ansiuppercase(a.nom)) then
      begin
       seek(ar,j);
       write(ar,a);
       seek(ar,i);
       write(ar,b);
       a:=b;
      end;
     inc(j);
    end;
   inc(i);
 end;
 reset(ar);
 if filesize(ar)<>0 then
 begin
   for i := 1 to filesize(ar) do
   begin
     read(ar,dato);
     stringgrid1.Cells[0,i]:=inttostr(dato.cod);
     stringgrid1.Cells[1,i]:=dato.nom;
     stringgrid1.Cells[2,i]:=dato.email;
     stringgrid1.Cells[3,i]:=dato.dir;
     stringgrid1.Cells[4,i]:=floattostr(dato.saldo);
   end;
 end;
closefile(ar);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
assignfile(ar,'datos.c5');
reset(ar);
stringgrid1.ColCount:=5;
stringgrid1.Cells[0,0]:='Codigo';
stringgrid1.Cells[1,0]:='Nombre';
stringgrid1.Cells[2,0]:='Email';
stringgrid1.Cells[3,0]:='Direccion';
stringgrid1.Cells[4,0]:='Saldo';
stringgrid1.RowCount:=filesize(ar)+1;
if filesize(ar)<>0 then
 begin
   for i := 1 to filesize(ar) do
   begin
     read(ar,dato);
     stringgrid1.Cells[0,i]:=inttostr(dato.cod);
     stringgrid1.Cells[1,i]:=dato.nom;
     stringgrid1.Cells[2,i]:=dato.email;
     stringgrid1.Cells[3,i]:=dato.dir;
     stringgrid1.Cells[4,i]:=floattostr(dato.saldo);
   end;
 end;
 closefile(ar);
end;

end.
