unit insercion;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Grids;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
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
  i: integer;
begin
  randomize;
  for i := 0 to stringgrid1.ColCount-1 do
    stringgrid1.Cells[i,0]:= inttostr(random(21)+1);
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j,c: integer;
  m: array[1..10] of integer;
begin
  for i := 0 to stringgrid1.ColCount-1 do
    m[i+1]:= strtoint(stringgrid1.Cells[i,0]);
  i:= 2;
  j:= 2;
  while i<=stringgrid1.ColCount do
    begin
      if (m[j]<m[j-1]) and (j>=2) then
        begin
          c:=m[j-1];
          m[j-1]:= m[j];
          m[j]:= c;
          dec(j);
        end
      else
        begin
          inc(i);
          j:= i;
        end;
    end;
  for i := 0 to stringgrid1.ColCount-1 do
    stringgrid2.Cells[i,0]:= inttostr(m[i+1]);
end;
procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  stringgrid1.ColCount:= spinedit1.Value;
  stringgrid2.ColCount:= spinedit1.Value;
end;
end.
