unit num_perfecto;//Sebasti�n L�pez, C4A
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
procedure TForm1.Button1Click(Sender: TObject);
var
  b,c,d: integer;
begin
  b:= strtoint(edit1.Text);
  c:= 1;
  d:= 0;
  while c<b div 2 do
    begin
      if b mod c=0 then
        d:= d+c;
      inc (c);
    end;
  if d=b then
    showmessage('Es n�mero perfecto')
  else
    showmessage('No es n�mero perfecto');
end;
end.
