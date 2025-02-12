unit connect_;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ShellApi;
type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  circ: array[1..7,1..7] of integer;
  gameon, drop, col: boolean;
  p: integer;
implementation
{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
var
  i,j: integer;
begin
  for j := 1 to 6 do
    for i := 1 to 7 do
      circ[i,j]:= 0;
  circ[1,7]:= -1;
  circ[2,7]:= -1;
  circ[3,7]:= -1;
  circ[4,7]:= -1;
  circ[5,7]:= -1;
  circ[6,7]:= -1;
  circ[7,7]:= -1;
  form1.Left:= 300;
  form1.Top:= 200;
  drop:= true;
  gameon:= false;
  col:= true;
end;
procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  p:= 0;
end;
procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i,j,k,j1,k1,conant,gan: integer;
begin
  i:= 1;
  if gameon=true then
    begin
      drop:= true;
      if (x>=195) and (x<=255) then
        p:= 1
      else if (x>=255) and (x<=325) then
        p:= 2
      else if (x>=325) and (x<=385) then
        p:= 3
      else if (x>=385) and (x<=445) then
        p:= 4
      else if (x>=445) and (x<=505) then
        p:= 5
      else if (x>=505) and (x<=565) then
        p:= 6
      else if (x>=565) and (x<=625) then
        p:= 7;
      while ((circ[p,i]=0)) do
        inc(i);
      if (p>0) and (i>1) then
        begin
          form1.Canvas.Ellipse(p*60+140,(i-2)*60+10,p*60+190,(i-2)*60+60);
          if col=true then
            begin
              form1.Canvas.Brush.Color:= clred;
              circ[p,i-1]:= 1
            end
          else
            begin
              form1.Canvas.Brush.Color:= clblack;
              circ[p,i-1]:= 2;
            end;
          col:= not(col);
          if col=false then
            begin
              label2.Show;
              shape2.Show;
              label1.Hide;
              shape1.Hide;
            end
          else
            begin
              label2.Hide;
              shape2.Hide;
              label1.Show;
              shape1.Show;
            end;
        end;
      i:= 1;
      gan:= 0;
      while (i<=7) and (gan<>3) do
        begin
          j:= 1;
          conant:= 0;
          while (j<=6) and (gan<>3) do
            begin
              if circ[i,j]>0 then
                begin
                  if circ[i,j]=conant then
                    inc(gan)
                  else
                    gan:= 0;
                  conant:= circ[i,j];
                end;
              inc(j);
            end;
          inc(i);
        end;
      i:= 1;
      while (i<=6) and (gan<>3) do
        begin
          j:= 1;
          conant:= 0;
          while (j<=7) and (gan<>3) do
            begin
              if circ[j,i]>0 then
                begin
                  if circ[j,i]=conant then
                    inc(gan)
                  else
                    gan:= 0;
                  conant:= circ[j,i];
                end;
              inc(j);
            end;
          inc(i);
        end;
      k:= 4;
      j:= 1;
      while (j<=4) and (gan<>3) do
        begin
          conant:= 0;
          if k>1 then
            dec(k)
          else
            inc(j);
          j1:= j;
          k1:= k;
          while (j1<=7) and (k1<=6) do
            begin
              if circ[j1,k1]>0 then
                begin
                  if circ[j1,k1]=conant then
                    inc(gan)
                  else
                    gan:= 0;
                  conant:= circ[j1,k1];
                end;
              inc(j1);
              inc(k1);
            end;
        end;
      k:= 6;
      j:= 4;
      while (k>=4) and (gan<>3) do
        begin
          conant:= 0;
          if j>1 then
            dec(j)
          else
            dec(k);
          j1:= j;
          k1:= k;
          while (j1<=7) and (k1>=1) do
            begin
              if circ[j1,k1]>0 then
                begin
                  if circ[j1,k1]=conant then
                    inc(gan)
                  else
                    gan:= 0;
                  conant:= circ[j1,k1];
                end;
              inc(j1);
              dec(k1);
            end;
        end;
      if gan=3 then
        begin
          label1.Hide;
          label2.Hide;
          shape1.Hide;
          shape2.Hide;
          if col then
            showmessage('Player 2 has won')
          else
            showmessage('Player 1 has won');
          shellexecute(Handle,'open',pchar(getcurrentdir+'\connect.exe'),nil,nil,SW_SHOWNORMAL);
          application.Terminate;
        end;
    end;
end;
procedure TForm1.Label3Click(Sender: TObject);
var
  i,j: integer;
begin
  form1.Width:= 653;
  form1.Height:= 417;
  label3.Hide;
  label4.Hide;
  label1.Show;
  shape1.Show;
  gameon:= true;
  i:= 0;
  while i<7 do
    begin
      j:= 0;
      while j<6 do
        begin
          form1.Canvas.Ellipse(i*60+200,j*60+10,i*60+250,j*60+60);
          inc(j);
        end;
      inc(i);
    end;
  form1.Canvas.Brush.Color:= clblack;
  form1.Canvas.Pen.Color:= clwhite;
end;
procedure TForm1.Label4Click(Sender: TObject);
begin
  application.Terminate;
end;
end.
