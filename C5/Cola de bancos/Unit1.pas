unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;
type
  cajeros = class
    clientes: array[1..5] of integer;
    im: array[0..4] of timage;
    cp,ip: integer;
    constructor makenull(j: integer);
    function empty: boolean;
    procedure queue;
    procedure dequeue;
  end;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  caja: array [1..5] of cajeros;
  dif: integer;
implementation
{$R *.dfm}
constructor cajeros.makenull(j: integer);
var
  i: Integer;
begin
  cp:= 0;
  ip:= 0;              
  for i := 0 to 4 do
    begin
      clientes[i+1]:= 0;
      im[i]:= timage.Create(form1);
      im[i].Parent:= form1;
      im[i].Top:= 650;    
      im[i].Left:= 50+145*(j-1);
      im[i].Width:= 100;
      im[i].Height:= 100;
      im[i].Visible:= false;
      im[i].Stretch:= true;
      im[i].Picture.LoadFromFile('stick.bmp');
    end;
end;
function cajeros.empty;
begin
  result:= cp=0;
end;
procedure cajeros.queue;
var
  p: integer;
begin
  if cp=5 then
    begin
      form1.timer1.enabled:= false;
      showmessage('Perdi�');
    end
  else
    begin
      inc(cp);
      p:= ip mod 5;
      clientes[cp]:= p;
      im[p].Top:= 0+100*cp;
      im[p].Visible:= true;
      inc(ip);
    end;
end;
procedure cajeros.dequeue;
var
  i: Integer;
begin
  if empty then
    //underflow
  else
    begin
      im[clientes[1]].Top:= 650;
      im[clientes[1]].Visible:= false;
      for i := 1 to cp-1 do
        begin
          clientes[i]:= clientes[i+1];
          im[clientes[i]].top:= im[clientes[i]].Top-100;
        end;
      clientes[i]:= 0; 
      dec(cp);
    end;
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 5 do
    caja[i]:= cajeros.makenull(i);
  randomize;
  top:= 0;
  dif:= 1;
end;
procedure TForm1.Image1Click(Sender: TObject);
begin
  caja[1].dequeue;
end;
procedure TForm1.Image2Click(Sender: TObject);
begin
  caja[2].dequeue;
end;
procedure TForm1.Image3Click(Sender: TObject);
begin
  caja[3].dequeue;
end;
procedure TForm1.Image4Click(Sender: TObject);
begin
  caja[4].dequeue;
end;
procedure TForm1.Image5Click(Sender: TObject);
begin
  caja[5].dequeue;
end;
procedure TForm1.Timer1Timer(Sender: TObject);
var
  r: integer;
begin
  r:= random(9)+1;
  if r<6 then
    caja[r].queue;
  if (dif mod 5 = 0) and (timer1.Interval>50) then
    timer1.Interval:= timer1.Interval-20;
  inc(dif);
end;
end.
