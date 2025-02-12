unit Unit2;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.StdCtrls;
type
  tcuadro = class
    figura: tshape;
    constructor create(t,l,c: integer);
  end;
type
  tpantalla = class
    casillas: array[1..9,0..25] of boolean;
    espacios: array[1..9,1..25] of tcuadro;
    constructor create;
    procedure caida(x,y: integer);
    procedure linea(y: integer);
    private
      procedure check;
      procedure gameover;
  end;
type
  tpieza = class
    meow: array[1..4] of tcuadro;
    constructor create(forma: integer);
    procedure bajar;
    procedure izq;
    procedure der;
    procedure girar;
    private
      tipo,pos: integer;
      procedure recrear;
    public
      cizq,cder,clinea: integer;
  end;
type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
  p: tpieza;
  n: tpantalla;
  mov,velocidad,nivel,punteo,combo,tetris,lineas: integer;
  giro: boolean;
implementation
{$R *.dfm}
constructor tcuadro.create(t: Integer; l: Integer; c: Integer);
begin
  figura:= tshape.create(form2);
  figura.Parent:= form2;
  figura.Shape:= strectangle;
  case c of
    0: figura.Brush.Color:= clblack;
    1: figura.Brush.Color:= clred;
    2: figura.Brush.Color:= clyellow;
    3: figura.Brush.Color:= clblue;
    4: figura.Brush.Color:= clgreen;
    5: figura.Brush.Color:= clfuchsia;
    6: figura.Brush.Color:= clgray;
    7: figura.Brush.Color:= clteal;
  end;
  figura.Pen.Color:= clwhite;
  figura.Top:= t;
  figura.Left:= l;
  figura.Width:= 15;
  figura.Height:= 15;
  if c<>0 then
    n.casillas[l div 15,(t div 15)+1]:= true;
end;
constructor tpantalla.create;
var
  i: Integer;
  j: Integer;
begin
  for i := 1 to 9 do
    casillas[i,0]:= false;
  for i := 1 to 25 do
    for j := 1 to 9 do
      begin
        espacios[j,i]:= tcuadro.create((i-1)*15+1,j*15,0);
        casillas[j,i]:= false;
      end;
end;
procedure tpantalla.caida(x: Integer; y: Integer);
begin
  casillas[x,y]:= true;
  espacios[x,y].figura.Brush.Color:= p.meow[1].figura.Brush.Color;
end;
procedure tpantalla.linea(y: Integer);
var
  i: Integer;
  j: Integer;
begin
  for i := 1 to 9 do
    casillas[i,y]:= false;
  for i := 1 to 9 do
    for j := y downto 2 do
      begin
        casillas[i,j]:= casillas[i,j-1];
        espacios[i,j].figura.brush.Color:= espacios[i,j-1].figura.brush.color;
      end;
  tetris:= tetris+1;
  punteo:= punteo+round(punteo*(combo/10))+75+25*tetris;
  combo:= combo+1;
  inc(lineas);
end;
procedure tpantalla.check;
var
  i: Integer;
  j: Integer;
  ch,c: boolean;
begin
  i:= 25;
  c:= false;
  while i>1 do
    begin
      ch:= true;
      for j := 1 to 9 do
        ch:= ch and casillas[j,i];
      if ch then
        begin
          linea(i);
          c:= true;
        end
      else
        dec(i);
    end;
  if not c then
    combo:= 1;
  tetris:= 0;
end;
procedure tpantalla.gameover;
begin
  form2.timer1.enabled:= false;
  showmessage('HABEIS PERDIDO TIO');
  application.Terminate;
end;
constructor tpieza.create(forma: integer);
var
  i,j: Integer;
begin
  tipo:= forma;
  pos:= 0;
  case forma of
    1:begin
        meow[1]:= tcuadro.create(1,60,forma);
        meow[2]:= tcuadro.create(1,75,forma);
        meow[3]:= tcuadro.create(16,60,forma);
        meow[4]:= tcuadro.create(16,75,forma);
        cizq:= 4;
        cder:= 5;
        clinea:= 2;
      end;
    2:begin
        meow[1]:= tcuadro.create(1,60,forma);
        meow[2]:= tcuadro.create(1,75,forma);
        meow[3]:= tcuadro.create(16,75,forma);
        meow[4]:= tcuadro.create(16,90,forma);
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    3:begin
        meow[1]:= tcuadro.create(1,75,forma);
        meow[2]:= tcuadro.create(1,90,forma);
        meow[3]:= tcuadro.create(16,60,forma);
        meow[4]:= tcuadro.create(16,75,forma);
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    4:begin
        meow[1]:= tcuadro.create(1,75,forma);
        meow[2]:= tcuadro.create(16,60,forma);
        meow[3]:= tcuadro.create(16,75,forma);
        meow[4]:= tcuadro.create(16,90,forma);
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    5:begin
        meow[1]:= tcuadro.create(1,60,forma);
        meow[2]:= tcuadro.create(16,60,forma);
        meow[3]:= tcuadro.create(16,75,forma);
        meow[4]:= tcuadro.create(16,90,forma);
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    6:begin
        meow[1]:= tcuadro.create(1,90,forma);
        meow[2]:= tcuadro.create(16,60,forma);
        meow[3]:= tcuadro.create(16,75,forma);
        meow[4]:= tcuadro.create(16,90,forma);
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    7:begin
        for i := 1 to 4 do
          meow[i]:= tcuadro.create(1,45+i*15,forma);
        cizq:= 4;
        cder:= 7;
        clinea:= 1;
      end;
  end;
end;
procedure tpieza.recrear;
var
  forma: integer;
  i: integer;
  t: boolean;
begin
  for i := 1 to 4 do
    n.caida(meow[i].figura.Left div 15,meow[i].figura.Top div 15+1);
  n.check;
  t:= false;
  forma:= random(7)+1;
  tipo:= forma;
  pos:= 0;
  if (lineas>=15) and (nivel<9) then
    begin
      lineas:= 0;
      nivel:= nivel+2;
    end;
  case forma of
    1:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 60;
        meow[2].figura.top:= 1;
        meow[2].figura.left:= 75;
        meow[3].figura.top:= 16;
        meow[3].figura.left:= 60;
        meow[4].figura.top:= 16;
        meow[4].figura.left:= 75;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clred;
        cizq:= 4;
        cder:= 5;
        clinea:= 2;
      end;
    2:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 60;
        meow[2].figura.top:= 1;
        meow[2].figura.left:= 75;
        meow[3].figura.top:= 16;
        meow[3].figura.left:= 75;
        meow[4].figura.top:= 16;
        meow[4].figura.left:= 90;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clyellow;
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    3:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 75;
        meow[2].figura.top:= 1;
        meow[2].figura.left:= 90;
        meow[3].figura.top:= 16;
        meow[3].figura.left:= 60;
        meow[4].figura.top:= 16;
        meow[4].figura.left:= 75;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clblue;
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    4:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 75;
        meow[2].figura.top:= 16;
        meow[2].figura.left:= 60;
        meow[3].figura.top:= 16;
        meow[3].figura.left:= 75;
        meow[4].figura.top:= 16;
        meow[4].figura.left:= 90;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clgreen;
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    5:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 60;
        meow[2].figura.top:= 16;
        meow[2].figura.left:= 60;
        meow[3].figura.top:= 16;
        meow[3].figura.left:= 75;
        meow[4].figura.top:= 16;
        meow[4].figura.left:= 90;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clfuchsia;
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    6:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 90;
        meow[2].figura.top:= 16;
        meow[2].figura.left:= 60;
        meow[3].figura.top:= 16;
        meow[3].figura.left:= 75;
        meow[4].figura.top:= 16;
        meow[4].figura.left:= 90;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clgray;
        cizq:= 4;
        cder:= 6;
        clinea:= 2;
      end;
    7:begin
        meow[1].figura.top:= 1;
        meow[1].figura.left:= 45;
        meow[2].figura.top:= 1;
        meow[2].figura.left:= 60;
        meow[3].figura.top:= 1;
        meow[3].figura.left:= 75;
        meow[4].figura.top:= 1;
        meow[4].figura.left:= 90;
        for i := 1 to 4 do
          meow[i].figura.Brush.Color:= clteal;
        cizq:= 3;
        cder:= 6;
        clinea:= 1;
      end;
  end;
  for i := 1 to 4 do
    if n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1] then
      t:= true
    else
      n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= true;
  if t then
    n.gameover;
end;
procedure tpieza.bajar;
var
  i: Integer;
  ch: boolean;
  cas: array[1..4] of boolean;
begin
  case tipo of
    1:begin
        cas[1]:= false;
        cas[2]:= false;
        cas[3]:= n.casillas[meow[3].figura.left div 15,(meow[3].figura.top div 15)+2];
        cas[4]:= n.casillas[meow[4].figura.left div 15,(meow[4].figura.top div 15)+2];
      end;
    2:begin
        case pos of
          0,2:begin
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[2]:= false;
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
          1,3:begin
              cas[1]:= false;
              cas[2]:= false;
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
        end;
      end;
    3:begin
        case pos of
          0,2:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
          1,3:begin
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[2]:= false;
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
        end;
      end;
      4:begin
        case pos of
          0:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
          1:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
          2:begin
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
            end;
          3:begin
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= false;
              cas[4]:= false;
            end;
        end;
      end;
      5:begin
        case pos of
          0:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          1:begin
              cas[2]:= false;
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          2:begin
              cas[2]:= false;
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          3:begin
              cas[3]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[4]:= false;
          end;
        end;
      end;
      6:begin
        case pos of
          0:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          1:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          2:begin
              cas[1]:= false;
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          3:begin
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[2]:= false;
          end;
        end;
      end;
      7:begin
        case pos of
          1,3:begin
              cas[1]:= false;
              cas[2]:= false;
              cas[3]:= false;
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
          0,2:begin
              cas[1]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
              cas[2]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15 +2];
              cas[3]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15 +2];
              cas[4]:= n.casillas[meow[4].figura.left div 15,meow[4].figura.top div 15 +2];
          end;
        end;
      end;
  end;
  ch:= true;
  for i := 1 to 4 do
    ch:= ch and not(cas[i]);
  if ch then
    begin
      for i := 1 to 4 do
        n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= false;
      for i := 1 to 4 do
        meow[i].figura.Top:= meow[i].figura.Top+15;
      for i := 1 to 4 do
        n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= true;
      inc(clinea);
    end
  else
    p.recrear;
end;
procedure tpieza.izq;
var
  ch: boolean;
  i: integer;
  cas: array[1..4] of boolean;
begin
  ch:= true;
  if cizq>1 then
    begin
      case tipo of
        1:begin
            cas[1]:= n.casillas[meow[1].figura.left div 15 -1,meow[1].figura.top div 15 +1];
            cas[2]:= false;
            cas[3]:= n.casillas[meow[3].figura.left div 15 -1,meow[3].figura.top div 15 +1];
            cas[4]:= false;
          end;
        2:begin
            case pos of
              0,2:begin
                  cas[1]:= n.casillas[meow[1].figura.left div 15 -1,meow[1].figura.top div 15+1];
                  cas[2]:= false;
                  cas[3]:= n.casillas[meow[3].figura.left div 15 -1,meow[3].figura.top div 15+1];
                  cas[4]:= false;
                end;
              1,3:begin
                  cas[1]:= n.casillas[meow[1].figura.left div 15 -1,meow[1].figura.top div 15+1];
                  cas[2]:= n.casillas[meow[2].figura.left div 15 -1,meow[2].figura.top div 15+1];
                  cas[3]:= n.casillas[meow[3].figura.left div 15 -1,meow[3].figura.top div 15+1];
                  cas[4]:= false;
                end;
            end;
          end;
        3:begin
            case pos of
              0,2:begin
                  cas[1]:= n.casillas[meow[1].figura.left div 15 -1,meow[1].figura.top div 15+1];
                  cas[2]:= false;
                  cas[3]:= n.casillas[meow[3].figura.left div 15 -1,meow[3].figura.top div 15+1];
                  cas[4]:= false;
              end;
              1,3:begin
                  cas[1]:= n.casillas[meow[1].figura.left div 15 -1,meow[1].figura.top div 15+1];
                  cas[2]:= n.casillas[meow[2].figura.left div 15 -1,meow[2].figura.top div 15+1];
                  cas[4]:= n.casillas[meow[4].figura.left div 15 -1,meow[4].figura.top div 15+1];
                  cas[3]:= false;
                end;
            end;
          end;
          4:begin
            case pos of
              0:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= false;
              end;
              1:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                cas[4]:= false;
              end;
              2:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= false;
              end;
              3:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15-1,meow[4].figura.top div 15+1];
              end;
            end;
          end;
          5:begin
            case pos of
              0:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= false;
              end;
              1:begin
                cas[1]:= false;
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15-1,meow[4].figura.top div 15+1];
              end;
              2:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15-1,meow[4].figura.top div 15+1];
              end;
              3:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15-1,meow[4].figura.top div 15+1];
              end;
            end;
          end;
          6:begin
            case pos of
              0:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= false;
              end;
              1:begin
                cas[4]:= false;
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
              end;
              2:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[4]:= false;
                cas[3]:= false;
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
              end;
              3:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15-1,meow[4].figura.top div 15+1];
              end;
            end;
          end;
          7:begin
            case pos of
              1,3:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15-1,meow[2].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15-1,meow[4].figura.top div 15+1];
              end;
              0,2:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= false;
                cas[4]:= false;
              end;
            end;
          end;
      end;
      for i := 1 to 4 do
        ch:= ch and not(cas[i]);
      if ch then
        begin
          for i := 1 to 4 do
            n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= false;
          for i := 1 to 4 do
            meow[i].figura.Left:= meow[i].figura.Left-15;
          for i := 1 to 4 do
            n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= true;
          cizq:= cizq-1;
          cder:= cder-1;
        end;
    end;
end;
procedure tpieza.der;
var
  ch: boolean;
  cas: array[1..4] of boolean;
  i: integer;
begin
  ch:= true;
  if cder<9 then
    begin
      case tipo of
        1:begin
            cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15 +1];
            cas[1]:= false;
            cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15 +1];
            cas[3]:= false;
          end;
        2:begin
            case pos of
              0,2:begin
                  cas[1]:= false;
                  cas[2]:= n.casillas[meow[2].figura.left div 15 +1,meow[2].figura.top div 15+1];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[4].figura.left div 15 +1,meow[4].figura.top div 15+1];
                end;
              1,3:begin
                  cas[1]:= n.casillas[meow[1].figura.left div 15 +1,meow[1].figura.top div 15+1];
                  cas[2]:= false;
                  cas[3]:= n.casillas[meow[3].figura.left div 15 +1,meow[3].figura.top div 15+1];
                  cas[4]:= n.casillas[meow[4].figura.left div 15 +1,meow[4].figura.top div 15+1];
                end;
            end;
          end;
          3:begin
            case pos of
              0,2:begin
                  cas[1]:= false;
                  cas[2]:= n.casillas[meow[2].figura.left div 15 +1,meow[2].figura.top div 15+1];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[4].figura.left div 15 +1,meow[4].figura.top div 15+1];
                end;
              1,3:begin
                  cas[2]:= n.casillas[meow[2].figura.left div 15 +1,meow[2].figura.top div 15+1];
                  cas[1]:= false;
                  cas[3]:= n.casillas[meow[3].figura.left div 15 +1,meow[3].figura.top div 15+1];
                  cas[4]:= n.casillas[meow[4].figura.left div 15 +1,meow[4].figura.top div 15+1];
                end;
            end;
          end;
          4:begin
            case pos of
              0:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              1:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              2:begin
                cas[1]:= false;
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              3:begin
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[1]:= false;
                cas[3]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
            end;
          end;
          5:begin
            case pos of
              0:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              1:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                cas[2]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              2:begin
                cas[4]:= false;
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
              end;
              3:begin
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[1]:= false;
                cas[3]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
            end;
          end;
          6:begin
            case pos of
              0:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              1:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                cas[2]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              2:begin
                cas[1]:= false;
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              3:begin
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[1]:= false;
                cas[3]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
            end;
          end;
          7:begin
            case pos of
              1,3:begin
                cas[1]:= n.casillas[meow[1].figura.left div 15+1,meow[1].figura.top div 15+1];
                cas[2]:= n.casillas[meow[2].figura.left div 15+1,meow[2].figura.top div 15+1];
                cas[3]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
              end;
              0,2:begin
                cas[4]:= n.casillas[meow[4].figura.left div 15+1,meow[4].figura.top div 15+1];
                cas[2]:= false;
                cas[3]:= false;
                cas[1]:= false;
              end;
            end;
          end;
      end;
      for i := 1 to 4 do
        ch:= ch and not(cas[i]);
      if ch then
        begin
          for i := 1 to 4 do
            n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= false;
          for i := 1 to 4 do
            meow[i].figura.Left:= meow[i].figura.Left+15;
          for i := 1 to 4 do
            n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= true;
          cizq:= cizq+1;
          cder:= cder+1;
        end;
    end;
end;
procedure tpieza.girar;
var
  i: Integer;
  ch: boolean;
  cas: array[1..4] of boolean;
begin
  ch:= true;
  case tipo of
    2:begin
        case pos of
          0,2:begin
                cas[1]:= n.casillas[meow[2].figura.left div 15 +1,meow[2].figura.top div 15];
                cas[2]:= false;
                cas[3]:= false;
                cas[4]:= n.casillas[meow[4].figura.left div 15,meow[2].figura.top div 15 +1];
                for i := 1 to 4 do
                  ch:= ch and not(cas[i]);
                if ch then
                  begin
                    for i := 1 to 4 do
                      n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15+1]:= false;
                    meow[1].figura.left:= meow[2].figura.left+15;
                    meow[1].figura.top:= meow[2].figura.top-15;
                    meow[4].figura.top:= meow[2].figura.top;
                    cizq:= cizq+1;
                    inc(pos);
                    pos:= pos mod 4;
                  end;
            end;
          1,3:begin
              if cizq>1 then
                begin
                  cas[1]:= n.casillas[meow[2].figura.left div 15 -1,meow[2].figura.top div 15];
                  cas[2]:= false;
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[4].figura.left div 15,meow[3].figura.top div 15 +1];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.left:= meow[2].figura.left-15;
                      meow[1].figura.top:= meow[2].figura.top;
                      meow[4].figura.top:= meow[3].figura.top;
                      cizq:= cizq-1;
                      inc(pos);
                      pos:= pos mod 4;
                    end;
                end;
            end;
        end;
      end;
    3:begin
        case pos of
          0,2:begin
              cas[1]:= false;
              cas[2]:= false;
              cas[3]:= n.casillas[meow[1].figura.left div 15, meow[1].figura.top div 15];
              cas[4]:= n.casillas[meow[2].figura.left div 15, meow[2].figura.top div 15+2];
              for i := 1 to 4 do
                ch:= ch and not(cas[i]);
              if ch then
                begin
                  for i := 1 to 4 do
                    n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15+1]:= false;
                  meow[2].figura.top:= meow[1].figura.top-15;
                  meow[2].figura.left:= meow[1].figura.left;
                  meow[3].figura.left:= meow[1].figura.left+15;
                  meow[3].figura.top:= meow[1].figura.top;
                  meow[4].figura.left:= meow[3].figura.left;
                  meow[4].figura.top:= meow[3].figura.top+15;
                  cizq:= cizq+1;
                  inc(pos);
                  pos:= pos mod 4;
                end;
            end;
          1,3:begin
              if cizq>1 then
                begin
                  cas[1]:= false;
                  cas[2]:= n.casillas[meow[1].figura.left div 15,meow[1].figura.top div 15 +2];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[1].figura.left div 15-1,meow[1].figura.top div 15+2];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15+1]:= false;
                      meow[2].figura.top:= meow[1].figura.top;
                      meow[2].figura.left:= meow[1].figura.left+15;
                      meow[3].figura.top:= meow[1].figura.top+15;
                      meow[3].figura.left:= meow[1].figura.left-15;
                      meow[4].figura.top:= meow[3].figura.top;
                      meow[4].figura.left:= meow[1].figura.left;
                      cizq:= cizq-1;
                      inc(pos);
                      pos:= pos mod 4;
                    end;
                end;
            end;
        end;
      end;
    4:begin
        case pos of
          0:begin
              if clinea<25 then
                begin
                  cas[1]:= false;
                  cas[2]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15+2];
                  cas[3]:= false;
                  cas[4]:= false;
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15+1]:= false;
                      meow[2].figura.top:= meow[3].figura.top+15;
                      meow[2].figura.left:= meow[3].figura.left;
                      inc(pos);
                      pos:= pos mod 4;
                      cizq:= cizq+1;
                      clinea:= clinea+1;
                    end;
                end;
            end;
          1:begin
              if cizq>1 then
                begin
                  cas[1]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                  cas[2]:= false;
                  cas[3]:= false;
                  cas[4]:= false;
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.left:= meow[3].figura.left-15;
                      meow[1].figura.top:= meow[3].figura.top;
                      inc(pos);
                      pos:= pos mod 4;
                      cizq:= cizq-1;
                    end;
                end;
            end;
          2:begin
              cas[1]:= false;
              cas[2]:= false;
              cas[3]:= false;
              cas[4]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15];
              for i := 1 to 4 do
                ch:= ch and not(cas[i]);
              if ch then
                begin
                  for i := 1 to 4 do
                    n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                  meow[4].figura.left:= meow[3].figura.left;
                  meow[4].figura.top:= meow[3].figura.top-15;
                  inc(pos);
                  pos:= pos mod 4;
                  cder:= cder-1;
                end;
            end;
          3:begin
              if cder<9 then
                begin
                  cas[1]:= false;
                  cas[2]:= false;
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.top:= meow[3].figura.top-15;
                      meow[1].figura.left:= meow[3].figura.left;
                      meow[2].figura.left:= meow[3].figura.left-15;
                      meow[2].figura.top:= meow[3].figura.top;
                      meow[4].figura.top:= meow[3].figura.top;
                      meow[4].figura.left:= meow[3].figura.left+15;
                      inc(pos);
                      pos:= pos mod 4;
                      cder:= cder+1;
                      clinea:= clinea-1;
                    end;
                end;
            end;
        end;
      end;
    5:begin
        case pos of
          0:begin
              if clinea<25 then
                begin
                  cas[1]:= n.casillas[meow[3].figura.left div 15, meow[3].figura.top div 15];
                  cas[2]:= n.casillas[meow[3].figura.left div 15+1, meow[3].figura.top div 15];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[3].figura.left div 15, meow[3].figura.top div 15+2];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15 +1]:= false;
                      meow[1].figura.top:= meow[3].figura.top-15;
                      meow[1].figura.left:= meow[3].figura.left+15;
                      meow[2].figura.top:= meow[3].figura.top-15;
                      meow[2].figura.left:= meow[3].figura.left;
                      meow[4].figura.top:= meow[3].figura.top+15;
                      meow[4].figura.left:= meow[3].figura.left;
                      inc(pos);
                      pos:= pos mod 4;
                      cizq:= cizq+1;
                      clinea:= clinea+1;
                    end;
                end;
            end;
          1:begin
              if cizq>1 then
                begin
                  cas[1]:= n.casillas[meow[1].figura.left div 15,meow[4].figura.top div 15+1];
                  cas[2]:= n.casillas[meow[1].figura.left div 15,meow[3].figura.top div 15+1];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+1];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.top:= meow[3].figura.top+15;
                      meow[2].figura.top:= meow[3].figura.top;
                      meow[2].figura.left:= meow[3].figura.left+15;
                      meow[4].figura.top:= meow[3].figura.top;
                      meow[4].figura.left:= meow[3].figura.left-15;
                      inc(pos);
                      pos:= pos mod 4;
                      cizq:= cizq-1;
                    end;
                end;
            end;
          2:begin
              cas[1]:= n.casillas[meow[4].figura.left div 15,meow[1].figura.top div 15+1];
              cas[2]:= n.casillas[meow[3].figura.left div 15,meow[1].figura.top div 15+1];
              cas[3]:= false;
              cas[4]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15];
              for i := 1 to 4 do
                ch:= ch and not(cas[i]);
              if ch then
                begin
                  for i := 1 to 4 do
                    n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                  meow[1].figura.left:= meow[3].figura.left-15;
                  meow[2].figura.top:= meow[3].figura.top+15;
                  meow[2].figura.left:= meow[3].figura.left;
                  meow[4].figura.top:= meow[3].figura.top-15;
                  meow[4].figura.left:= meow[3].figura.left;
                  inc(pos);
                  pos:= pos mod 4;
                  cder:= cder-1;
                end;
            end;
          3:begin
              if cder<9 then
                begin
                  cas[1]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+1];
                  cas[2]:= n.casillas[meow[3].figura.left div 15-1,meow[4].figura.top div 15+1];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[1].figura.left div 15,meow[4].figura.top div 15+1];
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.top:= meow[3].figura.top-15;
                      meow[2].figura.left:= meow[3].figura.left-15;
                      meow[2].figura.top:= meow[3].figura.top;
                      meow[4].figura.top:= meow[3].figura.top;
                      meow[4].figura.left:= meow[4].figura.left+15;
                      inc(pos);
                      pos:= pos mod 4;
                      cder:= cder+1;
                      clinea:= clinea-1;
                    end;
                end;
            end;
        end;
      end;
    6:begin
        case pos of
          0:begin
              if clinea<25 then
                begin
                  cas[1]:= n.casillas[meow[3].figura.Left div 15, meow[3].figura.top div 15];
                  cas[2]:= n.casillas[meow[3].figura.left div 15, meow[3].figura.top div 15+2];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15+2];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.left:= meow[3].figura.left;
                      meow[1].figura.top:= meow[3].figura.top-15;
                      meow[2].figura.top:= meow[3].figura.top+15;
                      meow[2].figura.left:= meow[3].figura.left;
                      meow[4].figura.top:= meow[3].figura.top+15;
                      inc(pos);
                      pos:= pos mod 4;
                      cizq:= cizq+1;
                      clinea:= clinea+1;
                    end;
                end;
            end;
          1:begin
              if cizq>1 then
                begin
                  cas[1]:= n.casillas[meow[3].figura.Left div 15+1, meow[3].figura.top div 15+1];
                  cas[2]:= n.casillas[meow[3].figura.left div 15-1, meow[3].figura.top div 15+1];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[3].figura.left div 15-1,meow[3].figura.top div 15+2];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.top:= meow[3].figura.top;
                      meow[1].figura.left:= meow[3].figura.left-15;
                      meow[2].figura.left:= meow[3].figura.left-15;
                      meow[2].figura.top:= meow[3].figura.top+15;
                      meow[4].figura.top:= meow[3].figura.top;
                      inc(pos);
                      pos:= pos mod 4;
                      cizq:= cizq-1;
                    end;
                end;
            end;
          2:begin
              cas[1]:= n.casillas[meow[3].figura.Left div 15-1, meow[3].figura.top div 15];
              cas[2]:= n.casillas[meow[3].figura.left div 15, meow[3].figura.top div 15];
              cas[3]:= false;
              cas[4]:= n.casillas[meow[3].figura.left div 15,meow[3].figura.top div 15+2];
              for i := 1 to 4 do
                ch:= ch and not(cas[i]);
              if ch then
                begin
                  for i := 1 to 4 do
                    n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                  meow[1].figura.top:= meow[3].figura.top-15;
                  meow[2].figura.top:= meow[3].figura.top-15;
                  meow[2].figura.left:= meow[3].figura.left;
                  meow[4].figura.left:= meow[3].figura.left;
                  meow[4].figura.top:= meow[3].figura.top+15;
                  inc(pos);
                  pos:= pos mod 4;
                  cder:= cder-1;
                end;
            end;
          3:begin
              if cder<9 then
                begin
                  cas[1]:= n.casillas[meow[3].figura.Left div 15-1, meow[3].figura.top div 15+1];
                  cas[2]:= n.casillas[meow[3].figura.left div 15+1, meow[3].figura.top div 15+1];
                  cas[3]:= false;
                  cas[4]:= n.casillas[meow[3].figura.left div 15+1,meow[3].figura.top div 15];
                  for i := 1 to 4 do
                    ch:= ch and not(cas[i]);
                  if ch then
                    begin
                      for i := 1 to 4 do
                        n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                      meow[1].figura.left:= meow[3].figura.left+15;
                      meow[2].figura.top:= meow[3].figura.top;
                      meow[2].figura.left:= meow[3].figura.left-15;
                      meow[4].figura.left:= meow[3].figura.left+15;
                      meow[4].figura.top:= meow[3].figura.top;
                      inc(pos);
                      pos:= pos mod 4;
                      cder:= cder+1;
                      clinea:= clinea-1;
                    end;
                end;
            end;
        end;
      end;
    7:begin
        case pos of
          1,3:begin
                if (cizq>1) and (cder<8) then
                  begin
                    cas[1]:= n.casillas[meow[1].figura.left div 15-1,meow[3].figura.top div 15];
                    cas[2]:= false;
                    cas[3]:= n.casillas[meow[2].figura.left div 15+1,meow[3].figura.top div 15];
                    cas[4]:= n.casillas[meow[2].figura.left div 15+2,meow[3].figura.top div 15];
                    for i := 1 to 4 do
                      ch:= ch and not(cas[i]);
                    if ch then
                      begin
                        for i := 1 to 4 do
                          n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                        meow[1].figura.top:= meow[2].figura.top;
                        meow[3].figura.top:= meow[2].figura.top;
                        meow[4].figura.top:= meow[2].figura.top;
                        meow[1].figura.left:= meow[2].figura.left-15;
                        meow[3].figura.left:= meow[2].figura.left+15;
                        meow[4].figura.left:= meow[2].figura.left+30;
                        inc(pos);
                        pos:= pos mod 4;
                        cizq:= cizq-1;
                        cder:= cder+2;
                        clinea:= clinea-2;
                      end;
                  end;
              end;
          0,2:begin
                if clinea<24 then
                  begin
                    cas[1]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15];
                    cas[2]:= false;
                    cas[3]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15+2];
                    cas[4]:= n.casillas[meow[2].figura.left div 15,meow[2].figura.top div 15+3];
                    for i := 1 to 4 do
                      ch:= ch and not(cas[i]);
                    if ch then
                      begin
                        for i := 1 to 4 do
                          n.casillas[meow[i].figura.Left div 15,meow[i].figura.Top div 15+1]:= false;
                        meow[1].figura.top:= meow[2].figura.top-15;
                        meow[3].figura.top:= meow[2].figura.top+15;
                        meow[4].figura.top:= meow[2].figura.top+30;
                        meow[1].figura.left:= meow[2].figura.left;
                        meow[3].figura.left:= meow[2].figura.left;
                        meow[4].figura.left:= meow[2].figura.left;
                        inc(pos);
                        pos:= pos mod 4;
                        cizq:= cizq+1;
                        cder:= cder-2;
                        clinea:= clinea+2;
                      end;
                  end;
              end;
        end;
      end;
  end;
  for i := 1 to 4 do
    n.casillas[meow[i].figura.Left div 15, meow[i].figura.Top div 15 +1]:= true;
end;
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;
procedure TForm2.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  randomize;
  n:= tpantalla.create;
  p:= tpieza.create(random(7)+1);
  mov:= 0;
  velocidad:= 16;
  nivel:= 1;
  giro:= true;
  punteo:= 0;
  combo:= 1;
  tetris:= 0;
end;
procedure TForm2.FormShow(Sender: TObject);
begin
  timer1.Enabled:= true;
end;
procedure TForm2.Label5Click(Sender: TObject);
begin
  showmessage('NADIE SABE QUE PIEZA VIENE EN UN TETRIS EXTREMO');
end;
procedure TForm2.Timer1Timer(Sender: TObject);
var
  i: Integer;
  j: Integer;
begin
  inc(mov);
  if getkeystate(vk_down)<0 then
    if nivel<4 then
      velocidad:= 3
    else
      if nivel<8 then
        velocidad:= 2
      else
        velocidad:= 1
  else
    velocidad:= 9-nivel;
  if mov>=velocidad then
    if p.clinea<25 then
      begin
        p.bajar;
        mov:= 0;
      end
    else
      begin
        mov:= 0;
        p.recrear;
      end;
  if getkeystate(vk_left)<0 then
    p.izq;
  if getkeystate(vk_right)<0 then
    p.der;
  if getkeystate(vk_up)<0 then
    begin
      if giro=true then
        p.girar;
      giro:= false;
    end
  else
    giro:= true;
  label2.Caption:= inttostr(punteo);
  label4.Caption:= 'x'+inttostr(combo);
end;
end.
