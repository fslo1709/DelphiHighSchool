unit Primos;//Sebastián López, C4A
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
  a: boolean;
  b,c: integer;
begin
  a:= true;
  b:= strtoint(edit1.Text);
  c:= 2;
  while c<=b-1 and a do
    begin
      if b mod c=0 then
        a:= false;
      inc (c);
    end;
  if a=false then
    showmessage ('No es primo')
  else
    showmessage ('Es primo');
end;
end.
