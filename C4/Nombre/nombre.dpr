program nombre;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  s1,s2: string;
begin
  writeln ('Sebastián López');
  writeln ('Ingrese su nombre');
  Readln (s1);
  s2:= 'Hola como estás?';
  Writeln (copy(s2,1,5),s1,' ',copy(s2,6,17));
  Readln
end.
