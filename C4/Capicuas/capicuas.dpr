program capicuas;//Sebastián López
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a,b,c,d,e: integer;
begin
  Writeln ('Sebastián López');
  Writeln ('Ingrese un número de cuatro cifras');
  Readln(a);
  b:= a div 1000;
  c:= (a mod 1000) div 100;
  d:= ((a mod 1000) mod 100) div 10;
  e:= ((a mod 1000) mod 100) mod 10;
  if b=e then
    if c=d then
      Writeln('Es capicúa');
  if b<>e then
    Writeln ('No es capicúa');
  Readln;
end.
