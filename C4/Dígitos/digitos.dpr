program digitos;//Sebasti�n L�pez, C4A
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  a: char;
begin
  Writeln ('Sebasti�n L�pez, C4A');
  Writeln ('Ingrese un caracter');
  Readln (a);
  case a of
    'a'..'z': Writeln ('Letra min�scula');
    'A'..'Z': Writeln ('Letra may�scula');
    '0'..'9': Writeln ('D�gito');
    else
      Writeln ('Caracter especial');
  end;
  Readln
end.
