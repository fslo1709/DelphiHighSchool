unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Math;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Image1: TImage;
    ScrollBox1: TScrollBox;
    Button7: TButton;
    Button8: TButton;
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  pnodo = ^nodo;
  nodo = record
    ele: integer;
    iz,de: pnodo;
  end;

var
  Form1: TForm1;
  raiz: pnodo;

implementation

{$R *.dfm}

procedure insabb(var t: pnodo; e: integer);
begin
  if (t = nil) then
  begin
    new(t);
    //showmessage(inttostr(e));
    t^.ele:=e;
    t^.de:=nil;
    t^.iz:=nil;
  end else
    if (t^.ele<=e) then
      insabb(t^.de,e) else
      insabb(t^.iz,e);
end;

function eperabb(var t: pnodo; e: integer): boolean;
begin
  if (t = nil) then
  begin
    eperabb:=false;
  end else
    if (t^.ele = e) then
    begin
      eperabb:=true;
    end else
      if (t^.ele>e) then
        eperabb:=eperabb(t^.iz,e) else
        eperabb:=eperabb(t^.de,e);
end;

function preorder(t: pnodo): string;
begin
  if t = nil then
    preorder:=''
  else
    preorder:=inttostr(t^.ele)+', '+preorder(t^.iz)+preorder(t^.de);
end;

function inorder(t: pnodo): string;
begin
  if t = nil then
    inorder:=''
  else
    inorder:=inorder(t^.iz)+inttostr(t^.ele)+', '+inorder(t^.de);
end;

function postorder(t: pnodo): string;
begin
  if t = nil then
    postorder:=''
  else
    postorder:=postorder(t^.iz)+postorder(t^.de)+inttostr(t^.ele)+', ';
end;

function numele(t: pnodo): integer;
begin
  if t = nil then
    numele:=0
  else
    numele:=1+numele(t^.iz)+numele(t^.de);
end;

function profundidad(t: pnodo): integer;
var
  a,b:integer;
begin
  if t=nil then
    profundidad:=0
  else
    begin
      a:=profundidad(t^.iz);
      b:=profundidad(t^.de);
      if a>b then
        profundidad:=a+1
      else
        profundidad:=b+1;
    end;
end;

function numhojas(t: pnodo): integer;
begin
  if t=nil then
    numhojas:=0
  else
    if (t^.iz = nil) and (t^.de = nil) then
      numhojas:=1
    else
      numhojas:=numhojas(t^.iz)+numhojas(t^.de);
end;

procedure graficar(distancia: integer; prof: integer; arbol: pnodo);
var
  c: integer;
begin
  if arbol<>nil then
  begin
    //showmessage(inttostr(arbol^.ele));
    form1.Image1.Canvas.Ellipse(distancia-5,trunc((form1.Image1.Height)/(profundidad(raiz)+1)* prof-5),distancia+10,trunc((form1.Image1.Height)/(profundidad(raiz)+1)* prof+10));
    form1.Image1.Canvas.TextOut(distancia-1,trunc((form1.Image1.Height)/(profundidad(raiz)+1)* prof-4),inttostr(arbol^.ele));
    if (arbol^.iz<>nil) then
    begin
      c:= trunc(distancia - form1.Image1.Width / (power(2,prof+1)));
      form1.Image1.Canvas.MoveTo(distancia,trunc((form1.Image1.Height)/(profundidad(raiz)+1)* prof+10));
      form1.Image1.Canvas.LineTo(c,trunc((form1.Image1.Height)/(profundidad(raiz)+1)* (prof+1)-5));
      graficar(c, (prof+1),arbol^.iz);
    end;
    if (arbol^.de<>nil) then
    begin
      form1.Image1.Canvas.MoveTo(distancia,trunc((form1.Image1.Height)/(profundidad(raiz)+1)* prof+10));
      form1.Image1.Canvas.LineTo(trunc((form1.Image1.Width /(power(2,prof+1))) + distancia),trunc((form1.Image1.Height)/(profundidad(raiz)+1)* (prof+1)-5));
      graficar(trunc((form1.Image1.Width /(power(2,prof+1))) + distancia), (prof+1),arbol^.de);
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  insabb(raiz,strtoint(edit1.Text));
  image1.Picture:=nil;
  graficar(image1.Width div 2, 1, raiz);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if eperabb(raiz,strtoint(edit1.Text)) then
    showmessage('Si pertenece.')
  else
    showmessage('No pertenece');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  edit1.Text:=preorder(raiz);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  edit1.Text:=inorder(raiz);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  edit1.Text:=postorder(raiz);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  edit1.Text:=(inttostr(numele(raiz)));
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  edit1.Text:=inttostr(profundidad(raiz));
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  edit1.Text:=inttostr(numhojas(raiz));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //new(raiz);
  //raiz^.ele:=5;
  //raiz^.iz:=nil;
  //raiz^.de:=nil;
end;

end.
