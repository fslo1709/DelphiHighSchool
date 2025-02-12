unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;
type TMeow = procedure(sender: tobject; button: TMouseButton; Shift: TShiftState; x,y: integer) of object;
type TMiau = procedure(Sender: TObject; Shift: TShiftState; X, Y: Integer) of object;
type
  tficha = class (tshape)
    procedure mymousedown(sender: tobject; button: TMouseButton; Shift: TShiftState; x,y: integer);
    procedure mymove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure mymouseup(sender: tobject; button: TMouseButton; Shift: TShiftState; x,y: integer);
    public
      col: boolean;
      px,py,xo,yo: integer;
  end;
type
  tcasilla = class (tshape)
    public
      x,y,x2,y2: integer;
      haschild: boolean;
      valid: boolean;
      fcolor: integer;
  end;
type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fichas: array[1..2,1..12] of tficha;
    tablero: array[1..8,1..8] of tcasilla;
    onedragged: boolean;
    turno: boolean;
    cfv,cfr: integer;
    procedure cambio;
    procedure esconder(x,y: integer);
    function chequear(x,y,xo,yo: integer): boolean;
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure gameover(b: boolean);
begin
  if b then
    showmessage('Gan� el verde')
  else
    showmessage('Gan� el rojo');
  application.Terminate;
end;
procedure tform1.esconder(x: Integer; y: Integer);
var
  i: Integer;
  j: Integer;
  posx,posy: integer;
begin
  for i := 1 to 2 do
    for j := 1 to 12 do
      begin
        posx:= fichas[i,j].px div 50+1;
        posy:= fichas[i,j].py div 50+1;
        if ((posx=x) and (posy=y)) then
          fichas[i,j].Visible:= false;
      end;
end;
function tform1.chequear(x: Integer; y: Integer; xo: Integer; yo: Integer): boolean;
begin
  if ((abs(xo-x)>0) and (abs(yo-y)>0)) then
    if ((abs(xo-x)=1) and (abs(yo-y)=1)) then
      result:= true
    else
      if ((abs(xo-x)=2) and (abs(yo-y)=2)) then
        case xo-x of
          -2: begin
                case yo-y of
                  -2: begin
                        if (not tablero[xo+1,yo+1].valid and not turno) then
                          begin
                            if tablero[xo+1,yo+1].fcolor=2 then
                              begin
                                result:= true;
                                form1.esconder(xo+1,yo+1);
                                tablero[xo+1,yo+1].valid:= true;
                                tablero[xo+1,yo+1].fcolor:= 0;
                                dec(cfv);
                              end
                            else
                              result:= false;
                          end
                        else
                          result:= false;
                      end;
                  2:begin
                      if (not tablero[xo+1,yo-1].valid and turno) then
                        begin
                          if tablero[xo+1,yo-1].fcolor=1 then
                            begin
                              result:= true;
                              form1.esconder(xo+1,yo-1);
                              tablero[xo+1,yo-1].valid:= true;
                              tablero[xo+1,yo-1].fcolor:= 0;
                              dec(cfr);
                            end
                          else
                            result:= false;
                        end
                      else
                        result:= false;
                    end;
                end;
              end;
          2:begin
              case yo-y of
                -2: begin
                      if (not tablero[xo-1,yo+1].valid and not turno) then
                        begin
                          if tablero[xo-1,yo+1].fcolor=2 then
                            begin
                              result:= true;
                              form1.esconder(xo-1,yo+1);
                              tablero[xo-1,yo+1].valid:= true;
                              tablero[xo-1,yo+1].fcolor:= 0;
                              dec(cfv);
                            end
                          else
                            result:= false;
                        end
                      else
                        result:= false;
                    end;
                2:begin
                    if (not tablero[xo-1,yo-1].valid and turno) then
                      begin
                        if tablero[xo-1,yo-1].fcolor=1 then
                          begin
                            result:= true;
                            form1.esconder(xo-1,yo-1);
                            tablero[xo-1,yo-1].valid:= true;
                            tablero[xo-1,yo-1].fcolor:= 0;
                            dec(cfr);
                          end
                        else
                          result:= false;
                      end
                    else
                      result:= false;
                   end;
              end;
            end;
        end
    else
      result:= false
  else
    result:= false;
end;
procedure tficha.mymousedown(sender: TObject; button: TMouseButton; Shift: TShiftState; x: Integer; y: Integer);
begin
  form1.onedragged:= true;
  (sender as tficha).xo:= (sender as tficha).left;
  (sender as tficha).yo:= (sender as tficha).top;
end;
procedure tficha.mymove(Sender: TObject; Shift: TShiftState; X: Integer; Y: Integer);
begin
  if form1.onedragged=true then
    begin
      (sender as tficha).Top:= mouse.CursorPos.Y-form1.Top-50;
      (sender as tficha).py:= (sender as tficha).top+25;
      (sender as tficha).Left:= mouse.CursorPos.X-form1.Left-25;
      (sender as tficha).px:= (sender as tficha).left+25;
    end;
end;
procedure tficha.mymouseup(sender: TObject; button: TMouseButton; Shift: TShiftState; x: Integer; y: Integer);
var
  i: Integer;
  j: Integer;
  b: boolean;
begin
  form1.onedragged:= false;
  b:= false;
  i:= px div 50+1;
  j:= py div 50+1;
  if form1.tablero[i,j].valid then
    if form1.chequear(i,j,xo div 50+1,yo div 50+1) then
      b:= true;
  if b then
    begin
      (sender as tficha).top:= form1.tablero[i,j].y;
      (sender as tficha).left:= form1.tablero[i,j].x;
      form1.tablero[i,j].haschild:= true;
      form1.tablero[i,j].valid:= false;
      if form1.turno then
        form1.tablero[i,j].fcolor:= 2
      else
        form1.tablero[i,j].fcolor:= 1;
      form1.tablero[(xo div 50)+1,(yo div 50)+1].haschild:= false;
      form1.tablero[(xo div 50)+1,(yo div 50)+1].valid:= true;
      form1.tablero[(xo div 50)+1,(yo div 50)+1].fcolor:= 0;
      form1.cambio;
    end
  else
    begin
      (sender as tficha).top:= (sender as tficha).yo;
      (sender as tficha).left:= (sender as tficha).xo;
    end;
  if form1.cfv=0 then
    gameover(true)
  else if form1.cfr=0 then
    gameover(false);
end;
procedure tform1.cambio;
var
  i: Integer;
begin
  turno:= not turno;
  if turno then
    for i := 1 to 12 do
      begin
        fichas[1,i].Enabled:= false;
        fichas[2,i].Enabled:= true;
      end
  else
    for i := 1 to 12 do
      begin
        fichas[1,i].Enabled:= true;
        fichas[2,i].Enabled:= false;
      end
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
  j: Integer;
  k: integer;
  px,py: integer;
begin
  onedragged:=false;
  for i := 1 to 8 do
    for j := 1 to 8 do
      begin
        tablero[i,j]:= tcasilla.create(form1);
        tablero[i,j].Parent:= form1;
        tablero[i,j].Shape:= strectangle;
        tablero[i,j].height:= 50;
        tablero[i,j].Width:= 50;
        px:= (i-1)*50;
        py:= (j-1)*50;
        tablero[i,j].Left:= px;
        tablero[i,j].Top:= py;
        tablero[i,j].x:= px;
        tablero[i,j].y:= py;
        tablero[i,j].x2:= px+50;
        tablero[i,j].y2:= py+50;
        if ((i+j) mod 2) = 0 then
          begin
            tablero[i,j].Brush.Color:= clwhite;
            tablero[i,j].Pen.Color:= clwhite;
            tablero[i,j].valid:= false;
          end
        else
          begin
            tablero[i,j].Brush.Color:= clblack;
            tablero[i,j].Pen.Color:= clblack;
            tablero[i,j].valid:= true;
          end;
        tablero[i,j].fcolor:= 0;
        tablero[i,j].haschild:= false;
      end;
  for i := 1 to 4 do
    for j := 1 to 3 do
      begin
        fichas[1,(i-1)*3+j]:= tficha.create(form1);
        fichas[1,(i-1)*3+j].Parent:= form1;
        fichas[1,(i-1)*3+j].Shape:= stellipse;
        fichas[1,(i-1)*3+j].Width:= 50;
        fichas[1,(i-1)*3+j].Height:= 50;
        px:= 100*(i-1)+50*(j mod 2);
        py:= 50*(j-1);
        fichas[1,(i-1)*3+j].Top:= py;
        fichas[1,(i-1)*3+j].Left:= px;
        fichas[1,(i-1)*3+j].px:= px;
        fichas[1,(i-1)*3+j].py:= py;
        fichas[1,(i-1)*3+j].Brush.Color:= clred;
        fichas[1,(i-1)*3+j].Pen.Color:= clred;
        fichas[1,(i-1)*3+j].col:= true;
        tablero[(px div 50)+1, (py div 50)+1].haschild:= true;
        tablero[(px div 50)+1, (py div 50)+1].valid:= false;
        tablero[i,j].fcolor:= 1;
        fichas[1,(i-1)*3+j].Enabled:=false;
        fichas[1,(i-1)*3+j].OnMouseDown:= fichas[1,(i-1)*3+j].mymousedown;
        fichas[1,(i-1)*3+j].OnMouseMove:= fichas[1,(i-1)*3+j].mymove;
        fichas[1,(i-1)*3+j].OnMouseUp:= fichas[1,(i-1)*3+j].mymouseup;
      end;
  for i := 1 to 4 do
    for j := 1 to 3 do
      begin
        fichas[2,(i-1)*3+j]:= tficha.create(form1);
        fichas[2,(i-1)*3+j].Parent:= form1;
        fichas[2,(i-1)*3+j].Shape:= stellipse;
        fichas[2,(i-1)*3+j].Width:= 50;
        fichas[2,(i-1)*3+j].Height:= 50;
        px:= 100*(i-1)+50*((j-1) mod 2);
        py:= 350-50*(j-1);
        fichas[2,(i-1)*3+j].Top:= py;
        fichas[2,(i-1)*3+j].Left:= px;
        fichas[2,(i-1)*3+j].px:= px;
        fichas[2,(i-1)*3+j].py:= py;
        fichas[2,(i-1)*3+j].Brush.Color:= clgreen;
        fichas[2,(i-1)*3+j].Pen.Color:= clgreen;
        fichas[2,(i-1)*3+j].col:= false;
        tablero[(px div 50)+1, (py div 50)+1].haschild:= true;
        tablero[(px div 50)+1, (py div 50)+1].valid:= false;
        tablero[i,j].fcolor:= 2;
        fichas[2,(i-1)*3+j].OnMouseDown:= fichas[2,(i-1)*3+j].mymousedown;
        fichas[2,(i-1)*3+j].OnMouseMove:= fichas[2,(i-1)*3+j].mymove;
        fichas[2,(i-1)*3+j].OnMouseUp:= fichas[2,(i-1)*3+j].mymouseup;
      end;
  cfv:= 12;
  cfr:= 12;
  turno:= true;
end;
end.
