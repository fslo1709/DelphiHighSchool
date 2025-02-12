unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
type tlista = class abstract
  public
    procedure insertar(e: string; p: integer); virtual; abstract;
    function primero: integer; virtual; abstract;
    function siguiente(p: integer): integer; virtual; abstract;
    function obtener(p: integer) : string; virtual; abstract;
    function ultimo: integer; virtual; abstract;
    function anterior(p: integer): integer; virtual; abstract;
    procedure borrar(p: integer); virtual; abstract;
end;
type tlista1 = class (tlista)
  private
    data: string;
  public
    constructor bob;
    procedure insertar(e: string; p: integer); override;
    function primero: integer; override;
    function siguiente(p: integer): integer; override;
    function obtener(p: integer) : string; override;
    function ultimo: integer; override;
    function anterior(p: integer): integer; override;
    procedure borrar(p: integer); override;
end;
type tlista2 = class (tlista)
  private
    data: array[1..100] of string;
    ne: integer;
  public
    constructor bob;
    procedure insertar(e: string; p: integer); override;
    function primero: integer; override;
    function siguiente(p: integer): integer; override;
    function obtener(p: integer) : string; override;
    function ultimo: integer; override;
    function anterior(p: integer): integer; override;
    procedure borrar(p: integer); override;
end;
type tlista3 = class(tlista)
  protected
    sl,inicio,gc: integer;
    constructor bob;
end;
type tlista4 = class(tlista3)
  private
    ant: array[1..100] of integer;
    fin: integer;
    constructor bob;
    procedure insertar(e: string; p: integer);
end;
type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  l: tlista;
  actual: integer;
implementation
{$R *.dfm}
constructor tlista1.bob;
begin
  data:= '';
end;
constructor tlista2.bob;
begin
  ne:= 0;
end;
constructor tlista3.bob;
begin
  sl:= 1;
  inicio:= 0;
  gc:= 0;
end;
constructor tlista4.bob;
begin
  inherited bob;
  fin:= 0;
end;
procedure tlista4.insertar(e: string; p: Integer);
begin
  {if p = inicio then
    begin
      t:= getfree;
      data[t]:= e;
      ant[t]:= 0;
      sig[t]:= p;
      ant[p]:= t;
      inicio:= t;
    end
  else
    if p=0 then
      begin
        t:= getfree;
        data[t]:= e;
        ant[t]:= fin;
        sig[t]:= 0;
        sig[fin]:= t;
        fin:= t;
      end;          }
end;
procedure tlista2.insertar(e: string; p: Integer);
var
  i: Integer;
begin
  inc(ne);
  for i := ne downto p+1 do
    data[i]:= data[i-1];
  data[p]:= e;
end;
procedure tlista2.borrar(p: Integer);
var
  i: Integer;
begin
  dec(ne);
  for i := p to ne do
    data[i]:= data[i+1];
end;
function tlista2.primero: integer;
begin
  primero:= 1;
end;
function tlista2.siguiente(p: Integer): integer;
begin
  siguiente:= p+1;
end;
function tlista2.obtener(p: Integer): string;
begin
  obtener:= data[p];
end;
function tlista2.ultimo: integer;
begin
  ultimo:= ne+1;
end;
function tlista2.anterior(p: Integer): integer;
begin
  anterior:= p-1;
end;
procedure tlista1.insertar(e: string; p: Integer);
begin
  insert(e+'|',data,p);
end;
function tlista1.primero: integer;
begin
  result:= 1;
end;
function tlista1.siguiente(p: Integer): integer;
var
  t: integer;
begin
  t:= p;
  while (data[t]<>'|') do
    t:= t+1;
  result:= t+1;
end;
function tlista1.anterior(p: integer): integer;
var
  t: integer;
begin
  t:= p-2;
  while (t>0) and (data[t]<>'|')  do
    t:= t-1;
  result:= t+1;
end;
procedure tlista1.borrar(p: Integer);
begin
  if length(data)>0 then
    delete(data,p,siguiente(p)-p);
end;
function tlista1.obtener(p: Integer): string;
var
  t: integer;
begin
  obtener:= copy(data,p,siguiente(p)-p-1);
end;
function tlista1.ultimo;
begin
  result:= length(data)+1;
end;
procedure mostrar(x: tlista);
var
  s: string; p: integer;
begin
  p:= x.primero;
  s:= '';
  while p<>x.ultimo do
    begin
      if p=actual then
        s:= s+'[';
        s:= s+x.obtener(p);
      if p=actual then
        s:= s+']';
      s:= s+',';
      p:= x.siguiente(p);
    end;
    form1.label1.caption:= s;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  l.insertar(edit1.Text,actual);
  mostrar(l);
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  if actual<>l.ultimo then
    begin
      actual:= l.siguiente(actual);
      mostrar(l);
    end;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  if actual<>l.primero then
    begin
      actual:= l.anterior(actual);
      mostrar(l);
    end;
end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  actual:= l.ultimo;
  mostrar(l);
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  l.borrar(actual);
  mostrar(l);
end;
procedure TForm1.Button6Click(Sender: TObject);
begin
  if actual<>l.ultimo then
    begin
      actual:= l.siguiente(actual);
      mostrar(l);
    end;
end;
procedure TForm1.Button7Click(Sender: TObject);
begin
  actual:= l.primero;
  mostrar(l);
end;
procedure TForm1.Button8Click(Sender: TObject);
begin
  l:= tlista1.bob;
end;
procedure TForm1.Button9Click(Sender: TObject);
begin
  l:= tlista2.bob;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  l:= tlista2.bob;
  actual:= l.primero;
end;
end.
