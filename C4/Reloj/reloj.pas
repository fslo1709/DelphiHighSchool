unit reloj;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  cx,cy: integer;
implementation
{$R *.dfm}
procedure contorno;
var
  i,x,y: integer;
  r,a,paso: real;
begin
  form1.image1.canvas.pen.Width:= 3;
  r:= 100;
  a:= -pi/2;
  paso:= pi/30;
  form1.image1.Canvas.Ellipse(cx-120,cy-120,cx+120,cy+120);
  for i := 1 to 60 do
    begin
      a:= a+paso;
      x:= trunc(r*cos(a)+cx);
      y:= trunc(r*sin(a)+cy);
      if i mod 5=0 then
        form1.image1.Canvas.Ellipse(x-2,y-2,x+2,y+2)
      else
        form1.Image1.Canvas.Ellipse(x-1,y-1,x+1,y+1);
    end;
  form1.Image1.Canvas.Pen.Width:= 2;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  cx:= image1.width div 2;
  cy:= image1.height div 2;
end;
procedure TForm1.Timer1Timer(Sender: TObject);
var
  hh,mm,ss,ms: word;
  a,r: real;
  x,y: integer;
begin
  image1.Canvas.Pen.Color:= clblack;
  image1.Canvas.Pen.Width:= 2;
  contorno;
  image1.Canvas.Ellipse(cx-80,cy-80,cx+80,cy+80);
  image1.Canvas.TextOut(image1.Width div 2 -15, image1.Height*2 div 3,'LOPEX');
  decodetime(now,hh,mm,ss,ms);
  image1.Canvas.Pen.Color:= clred;
  image1.Canvas.Pen.Width:= 2;
  a:= (ss+ms/1000)*2*pi/60-pi/2;
  r:= 75;
  x:= trunc(r*cos(a)+cx);
  y:= trunc(r*sin(a)+cy);
  image1.Canvas.MoveTo(cx,cy);
  image1.Canvas.LineTo(x,y);
  image1.Canvas.Pen.Color:= clblue;
  image1.Canvas.Pen.Width:= 3;
  a:= (mm+ss/60)*2*pi/60-pi/2;
  r:= 65;
  x:= trunc(r*cos(a)+cx);
  y:= trunc(r*sin(a)+cy);
  image1.Canvas.MoveTo(cx,cy);
  image1.Canvas.LineTo(x,y);
  image1.Canvas.Pen.Color:= clblack;
  image1.Canvas.Pen.Width:= 3;
  a:= (hh+mm/60)*2*pi/12-pi/2;
  r:= 50;
  x:= trunc(r*cos(a)+cx);
  y:= trunc(r*sin(a)+cy);
  image1.Canvas.MoveTo(cx,cy);
  image1.Canvas.LineTo(x,y);
end;
end.
