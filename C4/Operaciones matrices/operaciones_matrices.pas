unit operaciones_matrices; //Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  mat1,mat2,mat3: array [0..4,0..4] of integer;
implementation
{$R *.dfm}
procedure copiar_matriz;
var
  i,j: integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      begin
        mat1[i,j]:= strtoint(form1.StringGrid1.cells[i,j]);
        mat2[i,j]:= strtoint(form1.StringGrid2.cells[i,j]);
      end;
end;
procedure mostrar_matriz;
var
  i,j: integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      form1.StringGrid3.Cells[i,j]:= inttostr(mat3[i,j]);
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  i,j: integer;
begin
  copiar_matriz;
  for i := 0 to 4 do
    for j := 0 to 4 do
      mat3[i,j]:= mat1[i,j]+mat2[i,j];
  mostrar_matriz;
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j: integer;
begin
  copiar_matriz;
  for i := 0 to 4 do
    for j := 0 to 4 do
      mat3[i,j]:= mat1[i,j]-mat2[i,j];
  mostrar_matriz;
end;
procedure TForm1.Button3Click(Sender: TObject);
var
  i,j,k,s: integer;
begin
  copiar_matriz;
  for i := 0 to 4 do
    for j := 0 to 4 do
      begin
        s:= 0;
        for k := 0 to 4 do
          s:= s+mat1[k,j]*mat2[i,k];
        mat3[i,j]:= s;
      end;
  mostrar_matriz;
end;
procedure TForm1.Button4Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      stringgrid1.Cells[i,j]:= inttostr(random(100)-50);
end;
procedure TForm1.Button5Click(Sender: TObject);
var
  i,j: integer;
begin
  for i := 0 to 4 do
    for j := 0 to 4 do
      stringgrid2.Cells[i,j]:= inttostr(random(100)-50);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;
end.
