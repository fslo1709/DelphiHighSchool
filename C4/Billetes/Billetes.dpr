program Billetes;//Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  a: real;
  b,c,d,e,f,g,h,i,j,k,l,m,n: integer;
begin
  writeln ('Sebasti�n L�pez');
  writeln ('Ingrese una cifra en quetzales');
  readln(a);
  b:= trunc (a);
  c:= b div 200;
  b:= b-((b div 200)*200);
  d:= b div 100;
  b:= b-((b div 100)*100);
  e:= b div 50;
  b:= b-((b div 50)*50);
  f:= b div 20;
  b:= b-((b div 20)*20);
  g:= b div 10;
  b:= b-((b div 10)*10);
  h:= b div 5;
  b:= b-((b div 5)*5);
  i:= b;
  a:= a-trunc(a);
  a:= round(a*100);
  b:= trunc(a);
  j:= b div 50;
  b:= b-((b div 50)*50);
  k:= b div 25;
  b:= b-((b div 25)*25);
  l:= b div 10;
  b:= b-((b div 10)*10);
  m:= b div 5;
  b:= b-((b div 5)*5);
  writeln (c,' billetes de 200');
  writeln (d,' billetes de 100');
  writeln (e,' billetes de 50');
  writeln (f,' billetes de 20');
  writeln (g,' billetes de 10');
  writeln (h,' billetes de 5');
  writeln (i,' billetes de 1');
  writeln (j,' fichas de 50');
  writeln (k,' fichas de 25');
  writeln (l,' fichas de 10');
  writeln (m,' fichas de 5');
  writeln (b,' fichas de 1');
  readln
end.
