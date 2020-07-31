unit triangulo; //Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
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
procedure equilatero;
begin
  with form1.image1 do
    begin
      canvas.MoveTo(100,200);
      canvas.LineTo(200,200);
      canvas.LineTo(150,113);
      canvas.LineTo(100,200);
    end;
  showmessage ('Es equil�tero');
end;
procedure escaleno;
begin
  with form1.image1 do
    begin
      canvas.MoveTo(100,200);
      canvas.LineTo(240,200);
      canvas.LineTo(140,100);
      canvas.LineTo(100,200);
    end;
  showmessage ('Es escaleno');
end;
procedure isoceles;
begin
  with form1.Image1 do
    begin
      canvas.MoveTo(100,200);
      canvas.LineTo(200,200);
      canvas.LineTo(150,50);
      canvas.LineTo(100,200);
    end;
  showmessage ('Es is�celes');
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  a,b,c: integer;
begin
  image1.Picture:= nil;
  a:= strtoint (edit1.Text);
  b:= strtoint (edit2.Text);
  c:= strtoint (edit3.Text);
  if (a=b) and (b=c) then
    equilatero
  else
    if ((a=b) and (b<>c)) or ((b=c) and (c<>a)) or ((a=c) and (b<>c)) then
      isoceles
    else
      escaleno;
end;
end.
