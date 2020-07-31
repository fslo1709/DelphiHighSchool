program base_dos;   //Sebastián López

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a: integer;
  b,c,d,e,f,g,h: integer;
begin
  a:= 80;
  b:= a mod 2;
  a:= a div 2;
  c:= a mod 2;
  a:= a div 2;
  d:= a mod 2;
  a:= a div 2;
  e:= a mod 2;
  a:= a div 2;
  f:= a mod 2;
  a:= a div 2;
  g:= a mod 2;
  a:= a div 2;
  h:= a mod 2;
  writeln('80 en base 2 es', h,g,f,e,d,c,b);
  readln
end.
