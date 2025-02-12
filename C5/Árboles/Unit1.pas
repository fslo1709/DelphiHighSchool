unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
type
  pnodo = ^nodo;
    nodo=record
      ele: integer;
      izq,der: pnodo;
    end;
type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  raiz: pnodo;
implementation
{$R *.dfm}
function busca(p: pnodo; e: integer): boolean;
begin
  if p=nil then
    busca:= false
  else
    if p^.ele=e then
      busca:= true
    else
      if p^.ele>e then
        busca:= busca(p^.izq, e)
      else
        busca:= busca(p^.der, e);
end;
procedure insabb(var p: pnodo; e: integer);
begin
  if p=nil then
    begin
      new(p);
      p^.ele:= e;
      p^.izq:= nil;
      p^.der:= nil;
    end
  else
    if e>p^.ele then
      insabb(p^.der,e)
    else
      insabb(p^.izq,e);
end;
function inorder(p: pnodo): string;
begin
  if p=nil then
    inorder:= ''
  else
    inorder:= inorder(p^.izq)+strtoint(p^.ele)+','+inorder(p^.der);
end;
function hojas(p: pnodo): integer;
begin
  if p=nil then
    hojas:= 0
  else
    if (p^.izq=nil) and (p^.der=nil) then
      hojas:= 1
    else
      hojas:= hojas(p^.izq)+ hojas(p^.der);
end;
function prof(p: pnodo): integer;
var
  a,b: integer;
begin
  if p=nil then
  else
    begin
      a:= prof(p^.izq);
      b:= prof(p^.der);
      if a>b then
        prof:= a+1
      else
        prof:= b+1;
    end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  raiz:= nil;
end;
end.
