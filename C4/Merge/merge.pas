unit merge;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Spin;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    Edit1: TEdit;
    SpinEdit2: TSpinEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
var
  a,i: integer;
begin
  randomize;
  a:= 0;
  for i := 0 to spinedit1.Value-1 do
    begin
      a:= random(6)+a+1;
      stringgrid1.Cells[i,0]:= inttostr(a);
    end;
  a:= 0;
  for i := 0 to spinedit2.Value-1 do
    begin
      a:= random(6)+a+1;
      stringgrid2.Cells[i,0]:= inttostr(a);
    end;
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j,k,l: integer;
  mat1,mat2,mat: array[1..20] of integer;
begin
  i:= 0;
  j:= 0;
  k:= 1;
  while (i<stringgrid1.ColCount) do
    begin
      mat1[i+1]:=strtoint(stringgrid1.Cells[i,0]);
      inc(i);
    end;
  while (j<stringgrid2.ColCount) do
    begin
      mat2[j+1]:=strtoint(stringgrid2.Cells[j,0]);
      inc(j);
    end;
  mat1[i+1]:= mat2[j]+1;
  mat2[j+1]:= mat1[i]+1;
  i:= 1;
  j:= 1;
  while (k<=stringgrid3.ColCount)do
    begin
      if mat1[i]<mat2[j] then
        begin
          mat[k]:= mat1[i];
          inc(i);
        end
      else
        begin
          mat[k]:= mat2[j];
          inc(j);
        end;
      inc(k);
    end;
  for i := 1 to stringgrid3.ColCount do
    stringgrid3.Cells[i-1,0]:= inttostr(mat[i]);
end;
procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  stringgrid1.ColCount:= spinedit1.Value;
  edit1.Text:= inttostr(spinedit1.Value+spinedit2.Value);
  stringgrid3.ColCount:= spinedit1.Value+spinedit2.Value;
end;
procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  stringgrid2.ColCount:= spinedit2.Value;
  edit1.Text:= inttostr(spinedit1.Value+spinedit2.Value);
  stringgrid3.ColCount:= spinedit1.Value+spinedit2.Value
end;
end.
