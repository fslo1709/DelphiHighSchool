unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;
type
  pnodo = ^nodo;
    nodo=record
      ele: integer;
      sig: pnodo;
    end;
type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  p,inicio: pnodo;
implementation
{$R *.dfm}
procedure insini(e: integer);
var
  t: pnodo;
begin
  new(t);
  t^.ele:= e;
  t^.sig:= inicio;
  inicio:= t;
end;
procedure insfin(e: integer);
var
  t: pnodo;
begin
  if inicio=nil then
    begin
      new(inicio);
      inicio^.ele:= e;
      inicio^.ele:= nil;
    end
  else
    begin
      t:= inicio;
      while t^.sig<>nil do
        t:= t^.sig;
      new(t^.sig);
      t^.sig^.ele:= e;
      t.sig.sig:= nil;
    end;
end;
procedure insfinr(var t:pnodo; e: integer);
begin
  if t=nil then
    begin
      new(t);
      t^.ele:= e;
      t^.sig:= nil;
    end
  else
    insfinr(t^.sig,e);
end;
procedure insordr(var p: pnodo; e: integer);
var
  t: pnodo;
begin
  if (p=nil) or (p^.ele) then
    begin
      new(t);
      t^.ele:= e;
      t^.sig:= p;
      p:= t;
    end
  else
    insordr(p^.sig,e);
end;
end.
