unit Espacio;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;
type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure TForm1.Timer1Timer(Sender: TObject);
var
  x,y,c,b: integer;
begin
  x:= 40+random (clientwidth-79);
  y:= 40+random (clientheight-79);
  c:= random (16777216);
  canvas.Brush.Color:= c;
  canvas.Pen.Color:= c;
  b:= random(5)+1;
  canvas.Ellipse(x,y,x+b,y+b);
end;
end.
