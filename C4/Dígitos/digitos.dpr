program digitos;//Sebastián López, C4A
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  a: char;
begin
  Writeln ('Sebastián López, C4A');
  Writeln ('Ingrese un caracter');
  Readln (a);
  case a of
    'a'..'z': Writeln ('Letra minúscula');
    'A'..'Z': Writeln ('Letra mayúscula');
    '0'..'9': Writeln ('Dígito');
    else
      Writeln ('Caracter especial');
  end;
  Readln
end.
