unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type pnodo=^nodo;
  nodo=record
  iz:pnodo;
  ele:string;
  de:pnodo;
end;

var
  Form1: TForm1;
  quitar,xx,yy:integer;
  raiz:pnodo;
  archivo:Textfile;
  linea,res:string;
  a,b,c,d,e,f,g,h,i,ii,j,k,l,m,n,ñ,o,p,q,r,s,t,u,v,w,x,y,z:integer;
implementation

{$R *.dfm}

procedure InsOrd(var p:pnodo;e:string);
var
letras:string;
begin

letras:='ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';

if p=nil then
 begin
   new(p);
   p^.iz:=nil;
   p^.de:=nil;
   p^.ele:=e;
 end
 else
 if (pos(p^.ele,letras)>pos(e,letras)) then
     InsOrd(p^.iz,e)
    else
      InsOrd(p^.de,e);
end;

procedure graficar(p:pnodo;e:string;x,y,quitar:integer);
var
letras:string;
begin

letras:='ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';
form1.Image1.Canvas.Font.Height:=15;

if p=nil then
begin
  form1.image1.Canvas.Ellipse(x-10,y+10,x+10,y-10);
  form1.Image1.Canvas.TextOut(x-2,y-7,e);
end
else
  if pos(p^.ele,letras)>pos(e,letras) then
     graficar(p^.iz,e,x-quitar,y+50,quitar div 2)
    else
      graficar(p^.de,e,x+quitar,y+50,quitar div 2);
end;

function InOrder(p:pnodo):string;
begin
  if (p=nil) then
    inorder:=''
  else
  inorder:=inorder(p^.iz)+ p^.ele+','+inorder(p^.de);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  graficar(raiz,edit1.Text,xx,yy,quitar);
  insord(raiz,edit1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
var ii:integer; ss:string;
begin

ss:='ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';

if opendialog1.Execute=true then
  begin
    assignfile(archivo,opendialog1.FileName);
    reset(archivo);


    repeat
      readln(archivo,linea);
        for ii := 1 to length(linea) do
          begin
            graficar(raiz,linea[ii],xx,yy,quitar);
            InsOrd(raiz,linea[ii]);
          end;
    until eof(archivo);

    closefile(archivo);



  res:=inorder(raiz);


  for ii := 1 to length(res) do
      case res[ii] of
    'a':a:=a+1;
    'á':a:=a+1;
    'A':a:=a+1;
    'Á':a:=a+1;
    'b':b:=b+1;
    'B':b:=b+1;
    'c':c:=c+1;
    'C':c:=c+1;
    'd':d:=d+1;
    'D':d:=d+1;
    'e':e:=e+1;
    'é':e:=e+1;
    'E':e:=e+1;
    'É':e:=e+1;
    'f':f:=f+1;
    'F':f:=f+1;
    'g':g:=g+1;
    'G':g:=g+1;
    'h':g:=g+1;
    'H':h:=h+1;
    'i':i:=i+1;
    'í':i:=i+1;
    'I':i:=i+1;
    'Í':i:=i+1;
    'j':j:=j+1;
    'J':j:=j+1;
    'k':k:=k+1;
    'K':k:=k+1;
    'l':l:=l+1;
    'L':l:=l+1;
    'm':m:=m+1;
    'M':m:=m+1;
    'n':n:=n+1;
    'N':n:=n+1;
    'ñ':ñ:=ñ+1;
    'Ñ':ñ:=ñ+1;
    'o':o:=o+1;
    'ó':o:=o+1;
    'O':o:=o+1;
    'Ó':o:=o+1;
    'p':p:=p+1;
    'P':p:=p+1;
    'q':q:=q+1;
    'Q':q:=q+1;
    'r':r:=r+1;
    'R':r:=r+1;
    's':s:=s+1;
    'S':s:=s+1;
    't':t:=t+1;
    'T':t:=t+1;
    'u':u:=u+1;
    'ú':u:=u+1;
    'ü':u:=u+1;
    'U':u:=u+1;
    'Ú':u:=u+1;
    'Ü':u:=u+1;
    'v':v:=v+1;
    'V':v:=v+1;
    'w':w:=w+1;
    'W':w:=w+1;
    'x':x:=x+1;
    'X':x:=x+1;
    'y':y:=y+1;
    'Y':y:=y+1;
    'z':z:=z+1;
    'Z':z:=z+1;

    end;

    end;
end;





procedure TForm1.FormCreate(Sender: TObject);
begin
 xx:=image1.Width div 2;
 yy:=10;
 quitar:=image1.Width div 4;
 raiz:=nil;

 a:=0;
b:=0;
c:=0;
d:=0;
e:=0;
f:=0;
g:=0;
h:=0;
i:=0;
j:=0;
k:=0;
l:=0;
m:=0;
n:=0;
ñ:=0;
o:=0;
p:=0;
q:=0;
r:=0;
s:=0;
t:=0;
u:=0;
v:=0;
w:=0;
x:=0;
y:=0;
z:=0;

end;

end.
