unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  Vcl.Samples.Spin;
type vector=array[1..5000] of integer;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    StringGrid1: TStringGrid;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  v: vector;
implementation
{$R *.dfm}
procedure qs(var l: vector; n: integer);
var
  l1,l2: vector;
  t1,t2,e: integer;
  i: Integer;
begin
  if (n>1) then
    begin
      e:= l[1];
      t1:= 0;
      t2:= 0;
      for i := 2 to n do
        if l[i]<=e then
          begin
            inc(t1);
            l1[t1]:= l[i];
          end
        else
          begin
            inc(t2);
            l2[t2]:= l[i];
          end;
      qs(l1,t1);
      qs(l2,t2);
      for i := 1 to t1 do
        l[i]:= l1[i];
      l[t1+1]:= e;
      for i := 1 to t2 do
        l[t1+1+i]:= l2[i];
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  stringgrid1.Hide;
  stringgrid1.ColCount:= spinedit1.Value;
  for i := 0 to spinedit1.Value-1 do
    stringgrid1.Cells[i,0]:= inttostr(random(spinedit1.Value*2)+1);
  stringgrid1.Show;
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to stringgrid1.ColCount-1 do
    v[i+1]:= strtoint(stringgrid1.Cells[i,0]);
  qs(v,stringgrid1.ColCount);
  for i := 0 to stringgrid1.ColCount-1 do
    stringgrid1.Cells[i,0]:= inttostr(v[i+1]);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;
end.
