program rad_a_grados;//Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Math;
var
  a: real;
begin
  Writeln ('Ingrese un ', #160,'ngulo en radianes');
  readln(a);
  a:= a*(180/pi);
  Writeln('El ', #160,'ngulo en grados sexagesimales es: ', a:7:2);
  a:= sin(a*pi/180)/cos(a*pi/180);
  Writeln ('La tangente del n', #163,'mero es: ', a:7:2);
  readln
end.
