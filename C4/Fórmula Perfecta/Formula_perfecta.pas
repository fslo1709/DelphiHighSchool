unit Formula_perfecta;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Image1: TImage;
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
  a: real;
  r,cx,cy,x,y: integer;
begin
  r:= 100;
  cx:= image1.Width div 2;
  cy:= image1.Height div 2;
  a:= 0;
  image1.Canvas.MoveTo(trunc(r+cx),trunc(cy));
  while a<2*pi do
    begin
      application.ProcessMessages;
      a:= a+(2*pi/6);
      x:= trunc(cx+r*cos(a));
      y:= trunc(cy+r*sin(a));
      image1.canvas.LineTo(x,y);
      //sleep(10);
    end;
end;
end.
