program tres_algoritmos;//Sebasti�n L�pez
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  op: char;
  a,b,c,d,x1,x2: real;
begin
  writeln ('Sebasti�n L�pez');
  Writeln ('Ingrese una de las tres opciones');
  Writeln (' ');
  Writeln ('a) Vietta');
  Writeln ('b) Mayor de tres n�meros');
  Writeln ('c) Vuelto');
  Writeln (' ');
  readln(op);
  case op of
    'a':begin
        writeln ('Ingrese tres n�meros de una ecuaci�n cuadr�tica');
        readln (a,b,c);
        d:= b*b-4*a*c;
        if d<0 then
          writeln ('No hay soluci�n real')
        else
          begin
            x1:= (-b+sqrt(d))/(2*a);
            x2:= (-b-sqrt(d))/(2*a);
          end;
      end;
    'b':begin
        writeln ('Ingrese tres n�meros');
        readln (a,b,c);
        if (a>b) and (b>c) then
          Writeln ('a es el mayor')
        else
          if b>c then
            Writeln ('b es el mayor')
          else
            Writeln ('c es el mayor');
      end;
    'c':begin
        Writeln ('Ingrese el costo total y cuanto pag� el cliente');
        Readln (a,b);
        c:= b-a;
        if c<0 then
          Writeln ('No alcanza')
        else
          Writeln ('El vuelto es: ',c);
      end
  else
    Writeln ('Ingrese una opci�n v�lida');
  end;
  readln
end.
