program Arra_y;//Sebasti�n L�pez, C4A
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
  i,s,n: integer;
  vec: array[1..10] of integer;
begin
  write ('Ingrese cuantos valores son: ');
  readln(n);
  s:= 0;
  for i := 1 to n do
    begin
      write ('Ingrese el ', i,'� n�mero: ');
      readln (vec[i]);
      s:= s+vec[i];
    end;
  s:= s div n;
  for i := 1 to n do
    if vec[i]>s then
      writeln (vec[i]);
  readln
end.
