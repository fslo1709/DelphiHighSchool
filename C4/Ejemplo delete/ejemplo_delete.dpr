program ejemplo_delete;//Sebasti�n L�pez, C4A
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  s: string;
begin
  writeln ('Sebasti�n L�pez');
  s:= 'abcdefghijklmnopqrstuvwxyz';
  delete(s,1,11);
  delete(s,2,8);
  delete(s,3,2);
  delete(s,4,2);
  writeln(s);
  readln
end.
