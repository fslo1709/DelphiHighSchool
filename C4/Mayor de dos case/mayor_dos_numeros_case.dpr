program mayor_dos_numeros_case;//Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  a,b: integer;
begin
  writeln ('Sebasti�n L�pez');
  Writeln ('Ingrese dos n�meros');
  Readln (a,b);
  case a - b of
    -9999999999999..-1: writeln('El mayor es b');
    0: Writeln ('Son iguales');
  else
    Writeln ('El mayor es a');
  end;
  Readln
end.
