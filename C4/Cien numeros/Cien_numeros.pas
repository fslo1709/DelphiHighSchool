unit Cien_numeros;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
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
procedure TForm1.Button1Click(Sender: TObject);
var
  a,b,c,i: integer;
begin
  a:= 1;
  b:= 1000;
  c:= 0;
  for i := 1 to 100 do
    begin
      c:= random(1000)+1;
      if i=1 then
        begin
          a:= c;
          b:= c;
        end
      else
        begin
          if c<a then
            a:= c
          else
            if c>b then
              b:= c;
        end;
    end;
  showmessage (inttostr(a)+' '+inttostr(b));
end;
end.
