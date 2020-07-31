unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button2: TButton;
    StringGrid3: TStringGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StringGrid4: TStringGrid;
    StringGrid5: TStringGrid;
    StringGrid6: TStringGrid;
    StringGrid7: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n:integer;
  v:array[0..100] of integer;
  v2:array[0..100] of integer;
  v3:array[0..100] of integer;
  v4:array[0..100] of integer;
  v5:array[0..100] of integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i,x:integer;
begin
n:=strtoint(edit1.Text);
stringgrid1.ColCount:=n;
stringgrid2.ColCount:=n;
stringgrid4.ColCount:=n;
v3[0]:=random(100);
v4[0]:=random(100);
stringgrid1.Cells[0,0]:=inttostr(v3[0]);
stringgrid2.Cells[0,0]:=inttostr(v4[0]);
for i := 1 to n do
 begin
   x:=random(10);
   v3[i]:=(v3[i-1])+(x);
   v4[i]:=(v4[i-1])+(x);
   stringgrid1.Cells[i,0]:=inttostr(v3[i]);
   stringgrid2.Cells[i,0]:=inttostr(v4[i]);
 end;
for i := 0 to n-1 do
  begin
    x:=random(100);
    stringgrid4.Cells[i,0]:=inttostr(x);
    v[i]:=x;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var cont1,cont2,i,j:integer;
begin
n:=strtoint(edit1.Text);
stringgrid3.ColCount:=n*2;
cont1:=0; cont2:=0;
v3[n]:=v3[n-1]+v4[n-1];
v4[n]:=v3[n-1]+v4[n-1];
for i := 0 to (n*2)-1 do
  begin
   if(v3[cont1]<v4[cont2]) then
   begin
     v5[i]:=v3[cont1];
     inc(cont1);
   end
   else
   begin
     v5[i]:=v4[cont2];
     inc(cont2);
   end;
  end;
  for i := 0 to n*2-1 do
  stringgrid3.Cells[i,0]:=inttostr(v5[i]);
end;

procedure TForm1.Button3Click(Sender: TObject);
var i,j,t,cont:integer;
begin
n:=strtoint(edit1.Text);
for i := 0 to n-1 do
  begin
    cont:=0;
    for j := 0 to n-1 do
      begin
        if (v[i]>v[j]) then     //Compara si el segundo es mas grande que el primero
         begin
           inc(cont);
         end;
      end;
      v2[cont]:=v[i];
      stringgrid6.Cells[cont,0]:=inttostr(v2[cont]);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,j,t:integer;
begin
for i := 0 to n-1 do
  begin
    for j := i+1 to n-1 do
      begin
        If v[j]<v[i] then    //Compara si el primero es mas grande que el segundo
        begin
         t:=v[i];
         v[i]:=v[j];
         v[j]:=t;
        end;
      end;
  end;
for i := 0 to n-1 do
 stringgrid5.Cells[i,0]:=inttostr(v[i]);
end;

procedure TForm1.Button5Click(Sender: TObject);
var i,j,t:integer;
begin
for i := 0 to n-1 do
begin
  for j := i downto 1 do
    begin
      if (v[j-1]>v[j]) then     //Compara si el primero es mas grande que el segundo
       begin
         t:=v[j];
         v[j-1]:=v[j];
         v[j-1]:=t;
       end;
    end;
    stringgrid7.Cells[i,0]:=inttostr(v[i]);
end;
end;

end.
