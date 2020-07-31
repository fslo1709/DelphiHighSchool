program Descomposicion_numeros;//Sebastián López
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a,b,c,d,e,f: integer;
begin
  writeln('Sebastian Lopez');
  writeln('Ingrese un numero de 6 cifras');
  readln(a);
  b:= a div 100000;
  a:= a-((a div 100000)*100000);
  c:= a div 10000;
  a:= a-((a div 10000)*10000);
  d:= a div 1000;
  a:= a-((a div 1000)*1000);
  e:= a div 100;
  a:= a-((a div 100)*100);
  f:= a div 10;
  a:= a-((a div 10)*10);
  writeln (b);
  writeln (c);
  writeln (d);
  writeln (e);
  writeln (f);
  writeln (a);
  readln;
end.
