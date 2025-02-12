unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Math, Vcl.StdCtrls, Types;
type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Button1: TButton;
    Button2: TButton;
    Image6: TImage;
    Image7: TImage;
    RadioGroup1: TRadioGroup;
    Image9: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Button4: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Button5: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Image1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    base,altura,radio,lado,arista,diag1,diag2,base2: real;
    arec,acir,atri,apol,arom,atra,atot: real;
    prec,pcir,ptri,ppol,prom,ptra,ptot: real;
    figura,orden: integer;
    procedure rectangulo(imagen: timage; x,y,b,a: integer);
    procedure circulo(imagen: timage; x,y,r: integer);
    procedure triangulo(imagen: timage; x,y,a: integer);
    procedure poligono(imagen: timage; x,y,a,n: integer);
    procedure rombo(imagen: timage; x,y,a,b: integer);
    procedure trapecio(imagen: timage; x,y,a,b,h: integer);
    procedure regraficar;
  end;
var
  Form1: TForm1;
  cont,t: integer;
  posx,posy,re: array[1..6] of integer;
implementation
{$R *.dfm}
uses Unit2;
procedure tform1.trapecio(imagen: TImage; x: Integer; y: Integer; a: Integer; b: Integer; h: Integer);
var
  puntos: array[0..3] of tpoint;
begin
  puntos[0]:= point(x-a div 2,y+h div 2);
  puntos[1]:= point(x-b div 2,y-h div 2);
  puntos[2]:= point(x+b div 2,y-h div 2);
  puntos[3]:= point(x+a div 2,y+h div 2);
  imagen.Canvas.Polygon(puntos);
end;
procedure tform1.rectangulo(imagen: TImage; x,y,b,a: Integer);
begin
  imagen.Canvas.MoveTo(x,y);
  imagen.Canvas.Rectangle(x,y,x+b,y+a);
end;
procedure tform1.poligono(imagen: TImage; x: Integer; y:Integer; a: Integer; n: Integer);
var
  puntos: array [0..15] of Tpoint;
  b: real;
  i: Integer;
  j: Integer;
begin
  b:= sqrt(a*a+(a*a/4));
  for i := 0 to n-1 do
    puntos[i]:= point(round(x+b*cos(2*pi*i/n)),round(y+b*sin(2*pi*i/n)));
  for j := i to 15 do
    puntos[j]:= point(puntos[0].X,puntos[0].Y);
  imagen.Canvas.Polygon(puntos);
end;
procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  labelededit1.Show;
  labelededit2.Show;
  labelededit3.Show;
  label1.Show;
  label2.Show;
  button4.Show;
  image9.Picture:= nil;
  image9.Canvas.Brush.style:= bsclear;
  case radiogroup1.ItemIndex of
    0:begin
      labelededit2.Hide;
      labelededit3.Hide;
      labelededit1.EditLabel.Caption:= 'Radio';
      image9.Canvas.Ellipse(0,0,400,400);
      image9.Canvas.Ellipse(180,0,220,400);
      image9.Canvas.Ellipse(0,180,400,220);
    end;
    1:begin
      labelededit3.Hide;
      labelededit1.EditLabel.Caption:= 'Radio';
      labelededit2.EditLabel.Caption:= 'Altura';
      image9.Canvas.Ellipse(10,280,390,320);
      image9.Canvas.MoveTo(10,300);
      image9.Canvas.LineTo(200,10);
      image9.Canvas.LineTo(390,300);
    end;
    2:begin
      labelededit1.EditLabel.Caption:= 'Alto';
      labelededit2.EditLabel.Caption:= 'Ancho';
      labelededit3.EditLabel.Caption:= 'Profundidad';
      image9.Canvas.Rectangle(150,50,400,300);
      image9.Canvas.Rectangle(100,100,350,350);
      image9.Canvas.MoveTo(100,100);
      image9.Canvas.LineTo(150,50);
      image9.Canvas.MoveTo(100,350);
      image9.Canvas.LineTo(150,300);
      image9.Canvas.MoveTo(350,100);
      image9.Canvas.LineTo(400,50);
      image9.Canvas.MoveTo(350,350);
      image9.Canvas.LineTo(400,300);
    end;
    3:begin
      labelededit1.EditLabel.Caption:= 'Arista';
      labelededit2.EditLabel.Caption:= 'Altura';
      labelededit3.EditLabel.Caption:= 'Orden';
      image9.Canvas.MoveTo(10,300);
      image9.Canvas.LineTo(190,350);
      image9.Canvas.LineTo(390,300);
      image9.Canvas.LineTo(200,10);
      image9.Canvas.LineTo(10,300);
      image9.canvas.lineto(210,250);
      image9.canvas.lineto(390,300);
      image9.canvas.moveto(200,10);
      image9.canvas.lineto(190,350);
      image9.canvas.moveto(200,10);
      image9.canvas.lineto(210,250);
    end;
  end;
end;
procedure tform1.rombo(imagen: TImage; x: Integer; y: Integer; a: Integer; b: Integer);
var
  puntos: array[0..3] of Tpoint;
begin
  puntos[0]:= Point(x-a,y);
  puntos[1]:= Point(x,y-b);
  puntos[2]:= Point(x+a,y);
  puntos[3]:= Point(x,y+b);
  imagen.Canvas.Polygon(puntos);
end;
procedure tform1.regraficar;
var
  i: integer;
begin
  atot:= 0;
  ptot:= 0;
  for i := 1 to 6 do
    begin
      if i<>cont then
      case re[i] of
        1:begin
          rectangulo(image1,posx[i],posy[i],round(base),round(altura));
          atot:= atot+arec;
          ptot:= ptot+prec;
        end;
        2:begin
          circulo(image1,posx[i],posy[i],round(radio));
          atot:= atot+acir;
          ptot:= ptot+pcir;
        end;
        3:begin
          triangulo(image1,posx[i],posy[i],round(lado));
          atot:= atot+atri;
          ptot:= ptot+ptri;
        end;
        4:begin
          poligono(image1,posx[i],posy[i],round(arista),orden);
          atot:= atot+apol;
          ptot:= ptot+ppol;
        end;
        5:begin
          rombo(image1,posx[i],posy[i],round(diag1),round(diag2));
          atot:= atot+arom;
          ptot:= ptot+prom;
        end;
        6:begin
          trapecio(image1,posx[i],posy[i],round(base),round(base2),round(altura));
          atot:= atot+atra;
          ptot:= ptot+ptra;
        end;
      end;
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  form2.show;
  form1.Hide;
  button1.Hide;
  button2.Show;
  button4.Show;
  button5.Show;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  image1.Enabled:= true;
  image2.Enabled:= true;
  image3.Enabled:= true;
  image4.Enabled:= true;
  image5.Enabled:= true;
  image6.Enabled:= true;
  image7.Enabled:= true;
  button2.Hide;
end;
procedure TForm1.Button4Click(Sender: TObject);
var
  a,b,c,r1,r2: real;
begin
  a:= 0;
  b:= 0;
  c:= 0;
  if labelededit1.Text<>'' then
    a:= strtofloat(labelededit1.Text);
  if labelededit2.Text<>'' then
    b:= strtofloat(labelededit2.Text);
  if labelededit3.Text<>'' then
    c:= strtofloat(labelededit3.Text);
  r1:= 0;
  r2:= 0;
  if (a<>0) and (b<>0) and (c<>0) then
    case radiogroup1.ItemIndex of
      0:begin
          r1:= (4*pi*a*a*a)/3;
          r2:= 4*pi*a*a;
      end;
      1:begin
          r1:= (pi*a*a*b)/3;
          r2:= pi*a*a+pi*a*sqrt(a*a+b*b);
      end;
      2:begin
          r1:= a*b*c;
          r2:= 2*(a*b+a*c+b*c);
      end;
      3:begin
          r1:= ((c*b*b/(4*tan(degtorad(180/c))))*b)/3;
          r2:= a*c*sqrt(b*b+a*a)/2+c*b*b/(4*tan(degtorad(180/c)));
      end;
    end;
  label1.Caption:= 'Volumen: '+floattostrf(r1,fffixed,8,4)+ ' cm^3';
  label2.Caption:= 'Superficie: '+floattostrf(r2,fffixed,8,4)+ ' cm^2';
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  button2.Hide;
  button4.Hide;
  image1.Enabled:= false;
  image1.Picture:= nil;
  image2.Enabled:= false;
  image3.Enabled:= false;
  image4.Enabled:= false;
  image5.Enabled:= false;
  image6.Enabled:= false;
  image7.Enabled:= false;
end;
procedure tform1.circulo(imagen: TImage; x: Integer; y: Integer; r: Integer);
var
  i: real;
  px,py: real;
begin
  imagen.Canvas.Ellipse(x,y,x+2*r,y+2*r);
end;
procedure tform1.triangulo(imagen: TImage; x: Integer; y: Integer; a: Integer);
var
  i: integer;
  puntos: array [0..2] of tpoint;
begin
  puntos[0]:= Point(x+(a div 2),y+(a div 2));
  puntos[1]:= Point(x-(a div 2),y+(a div 2));
  puntos[2]:= Point(x,y-(a div 2));
  imagen.Canvas.Polygon(puntos);
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  image9.Canvas.Brush.style:= bsclear;
  image1.Canvas.Brush.style:= bsclear;
  rectangulo(image2,0,0,100,100);
  circulo(image3,0,0,50);
  triangulo(image4,50,50,100);
  poligono(image5,50,50,40,6);
  rombo(image6,50,50,30,50);
  trapecio(image7,50,50,70,40,60);
  figura:= 0;
  base:= 100;
  altura:= 100;
  radio:= 50;
  lado:= 100;
  arista:= 100;
  orden:= 5;
  top:= 0;
  left:= 100;
  for I := 1 to 5 do
    begin
      posx[i]:= 0;
      posy[i]:= 0;
      re[i]:= 0;
    end;
  cont:= 1;
  t:= 0;
end;
procedure TForm1.Image1Click(Sender: TObject);
begin
  if figura>0 then
    begin
      re[cont]:= figura;
      inc(t);
      cont:= t mod 6+1;
      regraficar;
      figura:= 0;
      label17.Caption:= '�rea total: '+floattostrf(atot,fffixed,5,3);
      label18.Caption:= 'Per�metro total: '+floattostrf(ptot,fffixed,5,3);
    end;
end;
procedure TForm1.Image1MouseLeave(Sender: TObject);
begin
  image1.Picture:= nil;
  regraficar;
end;
procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  image1.picture:= nil;
  regraficar;
  case figura of
    1:begin
      rectangulo(image1,x-(round(base) div 2),y-(round(altura) div 2),round(base),round(altura));
      posx[cont]:= x-(round(base) div 2);
      posy[cont]:= y-(round(altura) div 2);
    end;
    2:begin
      circulo(image1,round(x-radio),round(y-radio),round(radio));
      posx[cont]:= round(x-radio);
      posy[cont]:= round(y-radio);
    end;
    3:begin
      triangulo(image1,x,y,round(lado));
      posx[cont]:= x;
      posy[cont]:= y;
    end;
    4:begin
      poligono(image1,x,y,round(arista),orden);
      posx[cont]:= x;
      posy[cont]:= y;
    end;
    5:begin
      rombo(image1,x,y,round(base),round(altura));
      posx[cont]:= x;
      posy[cont]:= y;
    end;
    6:begin
      trapecio(image1,x,y,round(base),round(base2),round(altura));
      posx[cont]:= x;
      posy[cont]:= y;
    end;
  end;
end;
procedure TForm1.Image2Click(Sender: TObject);
begin
  figura:= 1;
  re[cont]:= figura;
end;
procedure TForm1.Image3Click(Sender: TObject);
begin
  figura:= 2;
  re[cont]:= figura;
end;
procedure TForm1.Image4Click(Sender: TObject);
begin
  figura:= 3;
  re[cont]:= figura;
end;
procedure TForm1.Image5Click(Sender: TObject);
begin
  figura:= 4;
  re[cont]:= figura;
end;
procedure TForm1.Image6Click(Sender: TObject);
begin
  figura:= 5;
  re[cont]:= figura;
end;
procedure TForm1.Image7Click(Sender: TObject);
begin
  figura:= 6;
  re[cont]:= figura;
end;
end.
