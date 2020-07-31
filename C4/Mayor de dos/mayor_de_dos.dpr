program mayor_de_dos;//Sebastián López
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a,b: integer;
begin
  Writeln('Sebastián López');
  Writeln('Ingrese un número');
  Readln(a);
  Writeln('Ingrese otro número');
  Readln(b);
  if a>b then
    writeln('El mayor es a');
  if b>a then
    writeln('El mayor es b');
  Readln
end.
