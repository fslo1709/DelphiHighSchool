program rango;//Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a: integer;
begin
  Writeln('Sebasti�n L�pez');
  Writeln('Ingrese un n�mero');
  Readln(a);
  if a>0 then
    begin
      if a<100 then
        Writeln('El n�mero est� entre el rango de cero a cien');
    end;
  if a<0 then
    Writeln('El n�mero no est� entre el rango de cero a cien');
  if a>100 then
    Writeln ('El n�mero no est� entre el rango de cero a cien');
  Readln;
end.
