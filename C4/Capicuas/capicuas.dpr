program capicuas;//Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a,b,c,d,e: integer;
begin
  Writeln ('Sebasti�n L�pez');
  Writeln ('Ingrese un n�mero de cuatro cifras');
  Readln(a);
  b:= a div 1000;
  c:= (a mod 1000) div 100;
  d:= ((a mod 1000) mod 100) div 10;
  e:= ((a mod 1000) mod 100) mod 10;
  if b=e then
    if c=d then
      Writeln('Es capic�a');
  if b<>e then
    Writeln ('No es capic�a');
  Readln;
end.
