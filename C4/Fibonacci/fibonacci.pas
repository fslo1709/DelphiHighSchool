unit fibonacci;//Sebasti�n L�pez, C4A
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
procedure f_fibonacci(lim: integer);
var
  i,a,b,c: integer;
  s: string;
begin
  if lim<=0 then
    showmessage('Error')
  else
    if lim=1 then
      showmessage ('0')
    else
      if lim=2 then
        showmessage ('0 1 ')
      else
        begin
          a:= 0;
          b:= 1;
          s:= '0 1 ';
          for i := 3 to lim do
            begin
              s:= s+inttostr(a+b)+' ';
              c:= a+b;
              a:= b;
              b:= c;
            end;
          showmessage (s);
        end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  f_fibonacci (strtoint(edit1.Text));
end;
end.
