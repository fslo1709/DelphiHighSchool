unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin;
type
  ttorres = class
    base, altura: tshape;
    constructor create(x: integer);
    procedure push(meow: tobject; m: integer);
    procedure pop(meow: tobject; torre: ttorres; m: integer);
    public
      stack: array[1..10] of integer;
      sp: integer;
      l: integer;
  end;
type
  TForm1 = class(TForm)
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure hanoi(n: integer; t1,t2,t3: ttorres);
  end;
var
  Form1: TForm1;
  torre: array[1..3] of ttorres;
  anillos: array [1..10] of tshape;
implementation
{$R *.dfm}
procedure tform1.hanoi(n: Integer; t1: ttorres; t2: ttorres; t3: ttorres);
begin
  if n=1 then
    begin
      t1.pop(anillos[t1.stack[t1.sp]],t3,t1.stack[t1.sp]);
    end
  else
    begin
      hanoi(n-1,t1,t3,t2);
      hanoi(1,t1,t2,t3);
      hanoi(n-1,t2,t1,t3);
    end;
end;
constructor ttorres.create(x: Integer);
begin
  base:= tshape.Create(form1);
  base.Parent:= form1;
  base.Shape:= strectangle;
  base.Left:= x;
  base.Top:= 550;
  base.Width:= 200;
  base.Height:= 5;
  base.Brush.Color:= clgray;
  l:= x;
  altura:= tshape.Create(form1);
  altura.Parent:= form1;
  altura.Shape:= strectangle;
  altura.Left:= x+98;
  altura.Top:= 200;
  altura.Width:= 5;
  altura.Height:= 350;
  altura.Brush.Color:= clgray;
  sp:= 0;
end;
procedure ttorres.push(meow: tobject; m: integer);
begin
  inc(sp);
  while ((meow as tshape).Top<(550-sp*20)) do
    begin
      application.ProcessMessages;
      (meow as tshape).Top:= (meow as tshape).Top+10;
      sleep(15);
    end;
  stack[sp]:= m;
end;
procedure ttorres.pop(meow: tobject; torre: ttorres; m: integer);
begin
  stack[sp]:= 0;
  dec(sp);
  while ((meow as tshape).Top>100) do
    begin
      application.ProcessMessages;
      (meow as tshape).Top:= (meow as tshape).Top-10;
      sleep(15);
    end;
  if ((meow as tshape).Left<(torre.l+100-((meow as tshape).Width div 2))) then
    while ((meow as tshape).Left<(torre.l+100-((meow as tshape).Width div 2))) do
      begin
        application.ProcessMessages;
        (meow as tshape).Left:= (meow as tshape).Left+10;
        sleep(15);
      end
  else
    while ((meow as tshape).Left>(torre.l+100-((meow as tshape).Width div 2))) do
      begin
        application.ProcessMessages;
        (meow as tshape).Left:= (meow as tshape).Left-10;
        sleep(15);
      end;
  torre.push(meow,m);
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  i,j: integer;
begin
  button1.Hide;
  label1.Caption:= inttostr(spinedit1.Value)+' anillos';
  spinedit1.Hide;
  for i := 1 to 3 do
    for j := 1 to 10 do
      torre[i].stack[j]:= 0;
  for i := 1 to spinedit1.value do
    begin
      anillos[i]:= tshape.Create(form1);
      anillos[i].Parent:= form1;
      anillos[i].Shape:= strectangle;
      anillos[i].Height:= 20;
      anillos[i].Width:= (10-torre[1].sp)*20;
      anillos[i].Left:= 50+(torre[1].sp)*10;
      anillos[i].Top:= 100;
      anillos[i].Brush.Color:= clwhite;
      torre[1].push(anillos[i],i);
    end;
  hanoi(spinedit1.Value,torre[1],torre[2],torre[3]);
  showmessage('Terminado');
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  doublebuffered:= true;
  form1.Top:= 80;
  form1.Left:= 300;
  for i := 1 to 3 do
    torre[i]:= ttorres.create((i-1)*220+50);
end;
end.
