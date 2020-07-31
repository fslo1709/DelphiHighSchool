unit numeros_vampiros;//Sebasti�n L�pez, C4
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
var
  vam: boolean;
  c: array [1..12] of string;
procedure arreglo(num:string);
var
  a,b,cont: integer;
begin
  a:= 1;
  b:= 1;
  cont:= 1;
  while a<=length(num) do
    begin
      while b<=length(num) do
        begin
          if a<>b then
            begin
              c[cont]:= num[a]+num[b];
              inc(cont);
            end;
          inc(b);
        end;
      inc(a);
      b:=1;
    end;
end;
procedure verificacion(num: string);
var
  cont1,cont2,d,e,r: integer;
begin
  cont1:= 1;
  cont2:= 2;
  d:= 0;
  e:= 0;
  r:= 0;
  vam:= false;
  while cont1<12 do
    begin
      while cont2<12 do
        begin
          d:= strtoint(c[cont1]);
          e:= strtoint(c[cont2]);
          r:= d*e;
          if r=strtoint(num) then
            vam:= true;
          inc(cont2);
        end;
      inc(cont1);
      cont2:= cont1+1;
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  num: string;
  a,b,p,cont1,cont2,d,e,r: integer;
begin
  num:= edit1.Text;
  arreglo(num);
  verificacion(num);
  if vam=true then
    showmessage('Es vampiro')
  else
    showmessage('No es vampiro');
end;
end.
