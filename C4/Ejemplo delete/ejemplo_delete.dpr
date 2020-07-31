program ejemplo_delete;//Sebastián López, C4A
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  s: string;
begin
  writeln ('Sebastián López');
  s:= 'abcdefghijklmnopqrstuvwxyz';
  delete(s,1,11);
  delete(s,2,8);
  delete(s,3,2);
  delete(s,4,2);
  writeln(s);
  readln
end.
