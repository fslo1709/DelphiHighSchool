program factorizacion; //Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  x1,x2,y1,y2,r: integer;
begin
  writeln ('ingrese datos para resolver (x2-x1)^2+(y2-y1)^2');
  readln(x2);
  readln(x1);
  readln(y2);
  readln(y1);
  r:= (sqr(x2-x1))+(sqr(y2-y1));
  writeln ('el resultado es ',r);
  readln
end.
