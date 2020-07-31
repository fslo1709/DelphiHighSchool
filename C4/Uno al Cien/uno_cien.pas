unit uno_cien;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure TForm1.Button10Click(Sender: TObject);
var
  x,y: integer;
begin
  for x := 0 to 9 do
    for y := 0 to 9 do
      stringgrid1.Cells[x,y]:= inttostr(y*10+x+1);
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to 99 do
    if ((i div 10)+(i mod 10)) mod 2=0 then
      stringgrid1.cells[i div 10 , i mod 10]:= '0'
    else
      stringgrid1.cells[i div 10 , i mod 10]:= '1';
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to 9 do
    for j := 0 to 9 do
      stringgrid1.Cells[i,j]:= '';
end;
procedure TForm1.Button3Click(Sender: TObject);
var
  i,j,k: integer;
begin
  for i := 1 to 5 do
    for j := -1+i to 10-i do
      for k := -1+i to 10-i do
        stringgrid1.Cells[j,k]:= inttostr(i);
end;
procedure TForm1.Button4Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to 99 do
    stringgrid1.Cells[i mod 10, i div 10]:= inttostr(i+1);
end;
procedure TForm1.Button5Click(Sender: TObject);
var
  i,j: integer;
  k: string;
begin
  for i := 0 to 4 do
    for j := 0 to 9 do
      begin
        k:= stringgrid1.Cells[9-i,j];
        stringgrid1.Cells[9-i,j]:= stringgrid1.Cells[i,j];
        stringgrid1.Cells[i,j]:= k;
      end;
end;
procedure TForm1.Button6Click(Sender: TObject);
var
  i,j,l: integer;
  k: string;
begin
  for l := 0 to 4 do
    for i := 0 to 8-l do
      for j := 0 to 8-l do
        begin
          k:= stringgrid1.Cells[i,j];
          stringgrid1.Cells[i,j]:= stringgrid1.Cells[9-j,9-i];
          stringgrid1.Cells[9-j,9-i]:= k;
        end;
end;
procedure TForm1.Button7Click(Sender: TObject);
var
  i,j: integer;
  k: string;
begin
  for i := 0 to 9 do
    for j := 0 to 4 do
      begin
        k:= stringgrid1.Cells[i,9-j];
        stringgrid1.Cells[i,9-j]:= stringgrid1.Cells[i,j];
        stringgrid1.Cells[i,j]:= k;
      end;
end;
procedure TForm1.Button8Click(Sender: TObject);
var
  x,y: integer;
  k: string;
begin
  for y := 0 to 8 do
    for x := y+1 to 9 do
      begin
        k:= stringgrid1.Cells[x,y];
        stringgrid1.Cells[x,y]:= stringgrid1.Cells[y,x];
        stringgrid1.Cells[y,x]:= k;
      end;
end;
procedure TForm1.Button9Click(Sender: TObject);
var
  i,x,y: integer;
begin
  x:= 0;
  y:= 0;
  for i := 0 to 99 do
    begin
      stringgrid1.Cells[x,y]:= inttostr(i+1);
      inc(x);
      if x=10 then
        begin
          inc(y);
          x:= 0;
        end;
    end;
end;
end.
