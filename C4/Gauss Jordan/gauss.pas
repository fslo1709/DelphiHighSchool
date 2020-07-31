unit gauss; //Sebastián López, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  m: array[1..5,1..5] of real;
implementation
{$R *.dfm}
procedure g_gauss;
var
  a: real;
  x,y,z: integer;
begin
  for z := 1 to 5 do
    begin
      a:= m[z,z];
      for x := 1 to 5 do
        m[x,z]:= m[x,z]/a;
      for y := 1 to 5 do
        if y<>z then
          begin
            a:= m[z,y];
            for x := 1 to 5 do
              m[x,y]:= m[x,y]-m[x,z]*a;
          end;
    end;
  for x := 0 to 4 do
    for y := 0 to 4 do
      form1.stringgrid1.cells[x,y]:= floattostr(m[x+1,y+1]);
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      stringgrid1.Cells[i,j]:= inttostr(random(10));
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      m[i+1,j+1]:= strtoint(stringgrid1.Cells[i,j]);
  g_gauss;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;
end.
