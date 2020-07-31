unit Orbita;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;
type
  TForm1 = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Timer1: TTimer;
    Shape3: TShape;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  r1,a1,cx,cy,r,a: real;
implementation
{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  cx:= 250;
  cy:= 250;
  r:= 175;
  a:= 0;
  r1:= 40;
  a1:= 0;
end;
procedure TForm1.Timer1Timer(Sender: TObject);
var
  cx1,cy1: real;
  x,y,x1,y1: integer;
begin
  cy1:= shape2.Top;
  cx1:= shape2.Left;
  a:= a+0.01;
  a1:= a1+0.05;
  x1:= trunc(cx1+cos(a1)*r1);
  y1:= trunc(cy1+sin(a1)*r1);
  y:= trunc(cy+sin(a)*r+shape2.Height*sin(a));
  x:= trunc(cx+cos(a)*r+shape2.Width*cos(a));
  shape2.top:= y;
  shape2.left:= x;
  shape3.Top:= y1;
  shape3.Left:= x1;
end;
end.
