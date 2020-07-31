unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Label2: TLabel;
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
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tlista = class abstract
  public
    procedure insertar(e:string; p:integer); virtual; abstract;
    procedure borrar(p:integer);virtual; abstract;
    function primero:integer; virtual; abstract;
    function siguiente(p:integer):integer; virtual; abstract;
    function obtener(p:integer):string; virtual; abstract;
    function ultimo:integer; virtual; abstract;
    function anterior(p:integer):integer; virtual; abstract;
  end;
  tlista1 = class(tlista)
    private
    data:string;
    public
    constructor crearlista;
    procedure insertar(e:string; p:integer); override;
    procedure borrar(p:integer); override;
    function primero:integer; override;
    function siguiente(p:integer):integer; override;
    function obtener(p:integer):string; override;
    function ultimo:integer; override;
    function anterior(p:integer):integer; override;
  end;
  tlista2 = class(tlista)
    private
    data:array [1..100] of string;
    ne:integer;
    public
    constructor crearlista;
    procedure insertar(e:string; p:integer); override;
    procedure borrar(p:integer); override;
    function primero:integer; override;
    function siguiente(p:integer):integer; override;
    function obtener(p:integer):string; override;
    function ultimo:integer; override;
    function anterior(p:integer):integer; override;
  end;
  tlista3 = class(tlista)
    protected
    ele:array [1..100] of string;
    sig:array [1..100] of integer;
    inicio,sl,gc:integer;
    function getfree:integer;
    procedure setfree(p:integer);
    public
    constructor crearlista;
    procedure insertar(e:string; p:integer); override;
    procedure borrar(p:integer); override;
    function primero:integer; override;
    function siguiente(p:integer):integer; override;
    function obtener(p:integer):string; override;
    function ultimo:integer; override;
    function anterior(p:integer):integer; override;
  end;
  tlista4 = class(tlista3)
    private
    ant:array [1..100] of integer;
    fin:integer;
    public
    constructor crearlista;
    procedure insertar(e:string; p:integer); override;
    procedure borrar(p:integer); override;
    function anterior(p:integer):integer; override;
  end;
var
  Form1: TForm1;
  lista:tlista;
  l1:tlista1;
  l2:tlista2;
  l3:tlista3;
  l4:tlista4;
  actual:integer;
implementation
{$R *.dfm}
constructor Tlista1.crearlista;
begin
  data:='';
end;
procedure tlista1.insertar(e: string; p: Integer);
begin
  insert(e+'|',data,p);
end;
function Tlista1.primero:integer;
begin
  primero:=1;
end;
function Tlista1.ultimo:integer;
begin
  ultimo:=length(data)+1;
end;
function Tlista1.anterior(p: Integer):integer;
var
  t:integer;
begin
  t:=p;
  while (t>2) and (data[t-2]<>'|') do
    dec(t);
  anterior:=t-1;
end;
procedure Tlista1.borrar(p:integer);
begin
  if p<>lista.ultimo then
    delete(data,p,lista.siguiente(p)-p);
end;
function Tlista1.siguiente(p: Integer):integer;
var
  t:integer;
begin
  t:=p;
  while data[t]<>'|' do
    inc(t);
  siguiente:=t+1;
end;
function Tlista1.obtener(p: Integer):string;
begin
  obtener:=copy(data,p,siguiente(p)-p-1)
end;
constructor Tlista2.crearlista;
begin
  ne:=0;
end;
procedure Tlista2.insertar(e: string; p: Integer);
var
  i:integer;
begin
  inc(ne);
  for i := ne downto p+1 do
    data[i]:=data[i-1];
  data[p]:=e;
end;
procedure Tlista2.borrar(p: Integer);
var
  i:integer;
begin
  if p<>lista.ultimo then
    begin
      dec(ne);
      for i := p to ne do
        data[i]:=data[i+1];
    end;
end;
function Tlista2.primero:integer;
begin
  primero:=1;
end;
function Tlista2.siguiente(p: Integer):integer;
begin
  siguiente:=p+1;
end;
function Tlista2.obtener(p: Integer):string;
begin
  obtener:=data[p];
end;
function TLista2.ultimo:integer;
begin
  ultimo:=ne+1;
end;
function Tlista2.anterior(p: Integer):integer;
begin
  anterior:=p-1;
end;
constructor Tlista3.crearlista;
begin
  sl:=1;
  inicio:=0;
  gc:=0;
end;
procedure Tlista3.insertar(e: string; p: Integer);
var
  t,a:integer;
begin
  t:=getfree;
  ele[t]:=e;
  if p<>inicio then
    begin
      a:=anterior(p);
      sig[t]:=p;
      sig[a]:=t;
    end
  else
    begin
      sig[t]:=inicio;
      inicio:=t;
    end;
  actual:=anterior(p);
end;
procedure Tlista3.borrar(p: Integer);
begin
  if p=primero then
    inicio:=sig[p]
  else
    sig[anterior(p)]:=sig[p];
  actual:=sig[p];
  setfree(p);
end;
function Tlista3.primero:integer;
begin
  primero:=inicio;
end;
function Tlista3.siguiente(p: Integer):integer;
begin
  siguiente:=sig[p];
end;
function Tlista3.obtener(p: Integer):string;
begin
  obtener:=ele[p];
end;
function Tlista3.ultimo:integer;
begin
  ultimo:=0;
end;
function TLista3.anterior(p: Integer):integer;
var
  ant:integer;
begin
  ant:=inicio;
  while p <> sig[ant] do
    ant:=sig[ant];
  anterior:=ant;
end;
function Tlista3.getfree:integer;
begin
  if gc=0 then
    begin
      getfree:=sl;
      inc(sl);
    end
  else
    begin
      getfree:=gc;
      gc:=sig[gc];
    end;
end;
procedure Tlista3.setfree(p:integer);
begin
  sig[p]:=gc;
  gc:=p;
end;
constructor Tlista4.crearlista;
begin
  inherited crearlista;
  fin:=0;
end;
procedure Tlista4.insertar(e: string; p: Integer);
var
  t:integer;
begin
  t:=getfree;
  ele[t]:=e;
  if p=inicio then
    begin
      ant[t]:=0;
      sig[t]:=p;
      if p<>0 then
        ant[p]:=t
      else
        fin:=t;
      inicio:=t;
    end
  else
    if p=0 then
      begin
        ant[t]:=fin;
        sig[t]:=0;
        sig[fin]:=t;
        fin:=t;
      end
    else
      begin
        ant[t]:=ant[p];
        sig[t]:=p;
        sig[ant[p]]:=t;
        ant[p]:=t;
      end;
  actual:=anterior(p);
end;
procedure Tlista4.borrar(p: Integer);
begin
  if p=primero then
    begin
      inicio:=sig[p];
      ant[siguiente(p)]:=inicio;
    end
  else
    begin
      sig[anterior(p)]:=sig[p];
      ant[siguiente(p)]:=ant[p];
    end;
  setfree(p);
end;
function Tlista4.anterior(p: Integer):integer;
begin
  if p=0 then
    anterior:=fin
  else
    anterior:=ant[p];
end;
procedure mostrar(x:tlista);
var
  s:string;
  p:integer;
begin
  p:=x.primero;
  s:='';
  while p<>x.ultimo do
    begin
      if p=actual then
        s:=s+'[';
      s:=s+x.obtener(p);
      if p=actual then
        s:=s+']';
      s:=s+', ';
      p:=x.siguiente(p);
    end;
  form1.label1.caption:=s;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  lista.insertar(edit1.Text,actual);
  edit1.Text:='';
  mostrar(lista);
  edit1.SetFocus;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  if actual<>lista.ultimo then
    begin
      actual:=lista.siguiente(actual);
      mostrar(lista);
    end;
  edit1.SetFocus;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  actual:=lista.primero;
  mostrar(lista);
  edit1.SetFocus;
end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  if actual<>lista.primero then
    begin
      actual:=lista.anterior(actual);
      mostrar(lista);
    end;
  edit1.SetFocus;
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  actual:=lista.ultimo;
  mostrar(lista);
  edit1.SetFocus;
end;
procedure TForm1.Button6Click(Sender: TObject);
begin
  lista.borrar(actual);
  mostrar(lista);
  edit1.SetFocus;
end;
procedure TForm1.Button7Click(Sender: TObject);
begin
  lista:= l1;
  actual:= lista.primero;
  mostrar(lista);
  label2.Caption:= '--> Lista1';
  edit1.SetFocus;
end;
procedure TForm1.Button8Click(Sender: TObject);
begin
  lista:= l2;
  actual:= lista.primero;
  mostrar(lista);
  label2.Caption:= '--> Lista2';
  edit1.SetFocus;
end;
procedure TForm1.Button9Click(Sender: TObject);
begin
  lista:= l3;
  actual:= lista.primero;
  mostrar(lista);
  label2.Caption:= '--> Lista3';
  edit1.SetFocus;
end;
procedure TForm1.Button10Click(Sender: TObject);
begin
  lista:= l4;
  actual:= lista.primero;
  mostrar(lista);
  label2.Caption:= '--> Lista4';
  edit1.SetFocus;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  l1:= tlista1.crearlista;
  l2:= tlista2.crearlista;
  l3:= tlista3.crearlista;
  l4:= tlista4.crearlista;
  lista:= l1;
  actual:= lista.primero;
  label2.Caption:= '--> Lista1';
end;
end.
