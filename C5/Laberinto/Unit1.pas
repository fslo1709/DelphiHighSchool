unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xo,yo,fx,fy: integer;
    c: array[1..40,1..40] of char;
    d: array[1..40,1..40] of boolean;
    e: array[1..40,1..40] of boolean;
    procedure mover(cx,cy: integer);
    function resolver(x,y: integer): boolean;
    procedure finalizar;
  end;
var
  Form1: TForm1;
  t: textfile;
implementation
{$R *.dfm}
function tform1.resolver(x,y: integer): boolean;
begin
  if ((x=fx) and (y=fy)) then
    begin
      resolver:= true;
      exit;
    end;
  if ((c[x,y]='1') or d[x,y]) then
    begin
      resolver:= false;
      exit;
    end
  else
    begin
      d[x,y]:= true;
      if ((x>1) and (x<40)) then
        begin
          if (resolver(x-1,y)) then
            begin
              e[x,y]:= true;
              resolver:= true;
              exit;
            end;
          if (resolver(x+1,y)) then
            begin
              e[x,y]:= true;
              resolver:= true;
              exit;
            end;
        end;
      if ((y>1) and (y<40)) then
        begin
          if (resolver(x,y-1)) then
            begin
              e[x,y]:= true;
              resolver:= true;
              exit;
            end;
          if (resolver(x,y+1)) then
            begin
              e[x,y]:= true;
              resolver:= true;
              exit;
            end;
        end;
      resolver:= false;
      exit;
    end;
end;
procedure tform1.finalizar;
var
  p: boolean;
begin
  p:= false;
  repeat
    if (e[xo+1,yo]) then
      begin
        mover(1,0);
        e[xo-1,yo]:= false;
      end
    else if (e[xo-1,yo]) then
      begin
        mover(-1,0);
        e[xo+1,yo]:= false;
      end
    else if (e[xo,yo+1]) then
      begin
        mover(0,1);
        e[xo,yo-1]:= false;
      end
    else if (e[xo,yo-1]) then
      begin
        mover(0,-1);
        e[xo,yo+1]:= false;
      end
    else
      p:= true;
    application.ProcessMessages;
    sleep(50);
  until p;
  if c[xo-1,yo]='*' then
    mover(-1,0)
  else
  if c[xo+1,yo]='*' then
    mover(1,0)
  else
  if c[xo,yo-1]='*' then
    mover(0,-1)
  else
  if c[xo,yo+1]='*' then
    mover(0,1);
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  o: topendialog;
  i,j: integer;
  s: string;
begin
  for i := 1 to 40 do
    for j := 1 to 40 do
      begin
        d[i,j]:= false;
        e[i,j]:= false;
      end;
  o:= topendialog.Create(self);
  o.DefaultExt:= 'C:\Users\Victor Lopez\Desktop\Programas\C5\Laberinto\Win32\Debug';
  if o.Execute then
    begin
      assignfile(t,o.FileName);
      reset(t);
      j:= 1;
      while not(eof(t)) do
        begin
          i:= 1;
          readln(t,s);
          while (i<=40) do
            begin
              c[i,j]:= s[i];
              inc(i);
            end;
          inc(j);
        end;
      closefile(t);
      xo:= 2;
      yo:= 2;
      for i := 1 to 40 do
        for j := 1 to 40 do
          begin
            image1.Canvas.Brush.color:= clblack;
            image1.Canvas.Pen.Color:= clblack;
            if (i=xo) and (j=yo) then
              begin
                image1.Canvas.Brush.Color:= clblue;
                image1.Canvas.Pen.Color:= clblue;
                image1.Canvas.Rectangle((i-1)*10,(j-1)*10,i*10,j*10);
                c[i,j]:= '0';
              end;
            if c[i,j]='*' then
              begin
                image1.Canvas.Brush.Color:= clred;
                image1.Canvas.Pen.Color:= clred;
                fx:= i;
                fy:= j;
              end;
            if c[i,j]<>' ' then
              image1.Canvas.Rectangle((i-1)*10,(j-1)*10,i*10,j*10);
          end;
    end;
end;
procedure tform1.mover(cx,cy: integer);
begin
  with image1.Canvas do
    begin
      Brush.Color:= clwhite;
      Pen.Color:= clwhite;
      Rectangle((xo-1)*10,(yo-1)*10,xo*10,yo*10);
    end;
  xo:= xo+cx;
  yo:= yo+cy;
  with image1.Canvas do
    begin
      Brush.Color:= clblue;
      Pen.Color:= clblue;
      Rectangle((xo-1)*10,(yo-1)*10,xo*10,yo*10);
    end;
end;
procedure TForm1.Timer1Timer(Sender: TObject);
var
  ok: boolean;
  i: Integer;
  j: Integer;
begin
  if getkeystate(vk_return)<0 then
    begin
      timer1.Enabled:= false;
      ok:= resolver(xo,yo);
      if ok then
        finalizar;
    end;
  if getkeystate(vk_up)<0 then
    if c[xo,yo-1]<>'1' then
      begin
        c[xo,yo]:= ' ';
        mover(0,-1);
        c[xo,yo]:= '0';
      end;
  if getkeystate(vk_down)<0 then
    if c[xo,yo+1]<>'1' then
      begin
        c[xo,yo]:= ' ';
        mover(0,1);
        c[xo,yo]:= '0';
      end;
  if getkeystate(vk_left)<0 then
    if c[xo-1,yo]<>'1' then
      begin
        c[xo,yo]:= ' ';
        mover(-1,0);
        c[xo,yo]:= '0';
      end;
  if getkeystate(vk_right)<0 then
    if c[xo+1,yo]<>'1' then
      begin
        c[xo,yo]:= ' ';
        mover(1,0);
        c[xo,yo]:= '0';
      end;
  if c[xo,yo]='*' then
    begin
      showmessage('Ganó');
      timer1.Enabled:= false;
    end;
end;
end.
