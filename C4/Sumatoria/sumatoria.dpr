program sumatoria;//Pedro Armas, C4
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  cont,sum,num: integer;
begin
  writeln ('Pedro Armas');
  writeln ('Ingrese un número');
  readln (num);
  cont:= 0;
  sum:= 0;
  repeat
    inc(cont);
    sum:= sum+cont;
  until (cont=sum);
  writeln ('La suma es: ',num);
  readln
end.
