unit recursion_;
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
function fibonacci(n: integer):integer;
begin
  if n>2 then
    fibonacci:= fibonacci(n-1)+fibonacci(n-2)
  else
    if n=2 then
      fibonacci:= 1
    else
      if n=1 then
        fibonacci:= 0;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  n,i,x: integer;
begin
  n:= strtoint(edit1.Text);
  edit1.Text:= '';
  i:= 1;
  while i<=n do
    begin
      x:= fibonacci(i);
      edit1.Text:= edit1.Text+inttostr(x)+' ';
      inc(i);
    end;
end;
end.
