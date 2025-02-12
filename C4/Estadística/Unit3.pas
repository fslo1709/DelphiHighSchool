unit Unit3;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Math;
type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form3: TForm3;
implementation

uses Unit1;
{$R *.dfm}
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.show;
  form3.Hide;
end;
procedure TForm3.FormShow(Sender: TObject);
var
  cx,cy,i,meow,dis,a,pos: integer;
  x,b: real;
  frecuencias: array [1..10000] of integer;
begin
  cx:= 250;
  cy:= 250;
  for i := 1 to form1.StringGrid1.RowCount-1 do
    frecuencias[i]:= strtoint(form1.StringGrid1.Cells[3,i]);
  image1.Picture:= nil;
  image2.Picture:= nil;
  image3.Picture:= nil;
  image4.Picture:= nil;
  image1.Canvas.Pen.Width:= 3;
  image1.Canvas.Pen.Color:= rgb(random(225),random(225),random(225));
  x:= 0;
  image2.Canvas.MoveTo(cx+200,cy);
  while (x<=(2*pi)) do
    begin
      image2.Canvas.LineTo(round(cx+200*cos(x)),round(cy+200*sin(x)));
      x:= x+0.001;
    end;
  dis:= round((image1.Height-20)/(form1.StringGrid1.RowCount-1));
  for i := 1 to form1.StringGrid1.RowCount-1 do
    begin
      meow:= round(strtoint(form1.StringGrid1.Cells[3,i])*image1.Height/form1.total);
      image1.Canvas.MoveTo(dis*i+10,image1.Height);
      image1.Canvas.LineTo(dis*i+10,image1.Height-meow);
      image3.Canvas.TextOut(dis*i+5,10,inttostr(i));
      image1.Canvas.Pen.Color:= rgb(random(255),random(255),random(255));
    end;
  x:= 0;
  a:= 1;
  b:= round((frecuencias[1]/(form1.total))*2*pi*10000);
  pos:= 0;
  while (a<form1.StringGrid1.RowCount) do
    begin
      if b=round(x*10000) then
        begin
          image4.Canvas.Pen.Color:= image2.Canvas.Pen.Color;
          image4.Canvas.Brush.Color:= image2.Canvas.Pen.Color;
          image4.canvas.Rectangle(0,pos,20,pos+20);
          image4.Canvas.Brush.Color:= clwhite;
          image4.Canvas.TextOut(30,pos,inttostr(a));
          inc(a);
          pos:= pos+40;
          if a<=form1.StringGrid1.RowCount-1 then
            image2.Canvas.Pen.Color:= rgb(random(225),random(225),random(225));
          b:= b+round((frecuencias[a]/(form1.total))*2*pi*10000);
        end
      else
        if b=0 then
          begin
            image4.Canvas.Brush.Color:= clwhite;
            image4.Canvas.TextOut(30,pos,inttostr(a));
            inc(a);
            pos:= pos+40;
            if a<=form1.StringGrid1.RowCount-1 then
              image2.Canvas.Pen.Color:= rgb(random(225),random(225),random(225));
            b:= b+round((frecuencias[a]/(form1.total))*2*pi*10000);
          end;
      image2.Canvas.MoveTo(cx,cy);
      image2.Canvas.LineTo(round(cx+200*cos(x)),round(cy+200*sin(x)));
      x:= x+0.00001;
    end;
end;
end.
