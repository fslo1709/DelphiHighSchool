unit Intercambio_2;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
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
  a,b: integer;
begin
  a:= strtoint(edit1.text);
  b:= strtoint(edit2.text);
  a:= b-a;
  b:= b-a;
  a:= a+b;
  edit1.Text:= inttostr(a);
  edit2.Text:= inttostr(b);
end;
end.
