unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
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
procedure meow(s,r: integer);
begin
  if s<r then
    meow(s+1,r);
  form1.Memo1.Lines.Add(inttostr(s));
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  t: integer;
begin
  memo1.Lines.Clear;
  t:= strtoint(edit1.Text);
  meow(1,t);
end;
end.
