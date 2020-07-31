program empleados;//Sebastián López, C4A
{$APPTYPE CONSOLE}
uses
  SysUtils;

var
  n1,n2,n3,n4,n5: string;
  h1,h2,h3,h4,h5,s1,s2,s3,s4,s5,em,he,st: real;
begin
  Writeln ('Sebastián López');
  Writeln ('Ingrese el nombre de cinco empleados, sus horas trabajadas y su sueldo por hora');
  Writeln ('Empleado 1');
  Write ('Nombre: ');
  Readln (n1);
  Write ('Horas: ');
  Readln (h1);
  Write ('Sueldo por hora: ');
  Readln (s1);
  Writeln ('Empleado 2');
  Write ('Nombre: ');
  Readln (n2);
  Write ('Horas: ');
  Readln (h2);
  Write ('Sueldo por hora: ');
  Readln (s2);
  Writeln ('Empleado 3');
  Write ('Nombre: ');
  Readln (n3);
  Write ('Horas: ');
  Readln (h3);
  Write ('Sueldo por hora: ');
  Readln (s3);
  Writeln ('Empleado 4');
  Write ('Nombre: ');
  Readln (n4);
  Write ('Horas: ');
  Readln (h4);
  Write ('Sueldo por hora: ');
  Readln (s4);
  Writeln ('Empleado 5');
  Write ('Nombre: ');
  Readln (n5);
  Write ('Horas: ');
  Readln (h5);
  Write ('Sueldo por hora: ');
  Readln (s5);
  Writeln ('Ingrese el número del empleado a consultar');
  readln (em);
  if em=1 then
    begin
      Writeln (n1);
      Writeln (h1:6:2);
      Writeln (s1:6:2);
      if h1>40 then
        begin
          he:= h1-40;
          st:= (40*s1)+(he*s1*1.5);
        end
      else
        st:= h1*s1;
      Writeln (st:6:2);
    end
  else
    if em=2 then
      begin
        Writeln (n2);
        Writeln (h2:6:2);
        Writeln (s2:6:2);
        if h2>40 then
          begin
            he:= h2-40;
            st:= (40*s2)+(he*s2*1.5);
          end
        else
          st:= h2*s2;
        Writeln (st:6:2);
      end
    else
      if em=3 then
        begin
          Writeln (n3);
          Writeln (h3:6:2);
          Writeln (s3:6:2);
          if h3>40 then
            begin
              he:= h3-40;
              st:= (40*s3)+(he*s3*1.5);
            end
          else
            st:= h3*s3;
          Writeln (st:6:2);
        end
      else
        if em=4 then
          begin
            Writeln (n4);
            Writeln (h4:6:2);
            Writeln (s4:6:2);
            if h4>40 then
              begin
                he:= h4-40;
                st:= (40*s4)+(he*s4*1.5);
              end
            else
              st:= h4*s4;
            Writeln (st:6:2);
          end
        else
          if em=5 then
            begin
              Writeln (n5);
              Writeln (h5:6:2);
              Writeln (s5:6:2);
              if h5>40 then
                begin
                  he:= h1-40;
                  st:= (40*s5)+(he*s5*1.5);
                end
              else
                st:= h5*s5;
              Writeln (st:6:2);
            end
          else
            writeln('Ingrese un número de empleado válido');
  readln
end.
