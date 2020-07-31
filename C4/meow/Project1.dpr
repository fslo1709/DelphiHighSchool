program primer_programa; //Sebastián López
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a,b: integer;
begin
  writeln('Sebastián López');
  writeln('Ingrese un número');
  readln(a);
  writeln('Ingrese otro n',#163,'mero');
  readln(b);
  writeln('La suma es', a+b);
  readln
end.
