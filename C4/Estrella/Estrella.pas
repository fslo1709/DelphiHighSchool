unit Estrella;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;
type
  TForm1 = class(TForm)
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  a,b: integer;
implementation
{$R *.dfm}
procedure cuad1;
begin
  with form1 do
    begin
      canvas.Pen.Color:= rgb(b,0,0);
      canvas.moveto(clientwidth div 2, a);
      canvas.LineTo(clientwidth div 2 + a,clientheight div 2);
    end;
end;
procedure cuad2;
begin
  with form1 do
    begin
      canvas.Pen.Color:= rgb(0,b,0);
      canvas.MoveTo(clientwidth div 2, a);
      canvas.LineTo(clientwidth div 2 - a, clientheight div 2);
    end;
end;
procedure cuad3;
begin
  with form1 do
    begin
      canvas.Pen.Color:= rgb(0,0,b);
      canvas.MoveTo(clientwidth div 2, clientheight - a);
      canvas.LineTo(clientwidth div 2 - a, clientheight div 2);
    end;
end;
procedure cuad4;
begin
  with form1 do
    begin
      canvas.Pen.Color:= rgb(b,b,b);
      canvas.MoveTo(clientwidth div 2, clientheight - a);
      canvas.LineTo(clientwidth div 2 + a, clientheight div 2);
    end;
end;
procedure TForm1.FormClick(Sender: TObject);
begin
  a:= 10;
  b:= 0;
  repeat
    begin
      application.ProcessMessages;
      sleep(20);
      cuad1;
      cuad2;
      cuad3;
      cuad4;
      a:= a+10;
      b:= b+7;
    end;
  until (a=clientwidth div 2);
end;
end.
