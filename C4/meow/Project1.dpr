program primer_programa; //Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a,b: integer;
begin
  writeln('Sebasti�n L�pez');
  writeln('Ingrese un n�mero');
  readln(a);
  writeln('Ingrese otro n',#163,'mero');
  readln(b);
  writeln('La suma es', a+b);
  readln
end.
