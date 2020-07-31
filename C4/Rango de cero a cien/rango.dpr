program rango;//Sebastián López
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  a: integer;
begin
  Writeln('Sebastián López');
  Writeln('Ingrese un número');
  Readln(a);
  if a>0 then
    begin
      if a<100 then
        Writeln('El número está entre el rango de cero a cien');
    end;
  if a<0 then
    Writeln('El número no está entre el rango de cero a cien');
  if a>100 then
    Writeln ('El número no está entre el rango de cero a cien');
  Readln;
end.
