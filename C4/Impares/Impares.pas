unit Impares;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
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
  a: array [1..100] of integer;
  i,n: integer;
begin
  randomize;
  memo1.Clear;
  n:= strtoint(edit1.Text);
  for i := 1 to n do
    begin
      a[i]:= random(999)+1;
      //if a[i] mod 2=1 then
        memo1.Lines.Add(inttostr(a[i]));
    end;
  edit1.Text:= inttostr(memo1.Lines.Count);
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  a,i,b: integer;
begin
  a:= strtoint(memo1.Lines[0]);
  b:= 1;
  for i := 0 to memo1.Lines.Count-1 do
    if strtoint(memo1.Lines[i])>a then
      begin
        a:= strtoint(memo1.Lines[i]);
        b:= i+1;
      end;
  showmessage(inttostr(a)+' en la posici�n '+ inttostr(b));
end;
procedure ordenar(posm: integer);
var
  c: string;
  a,b,i: integer;
begin
  with form1 do
    begin
      a:= strtoint(memo1.Lines[0]);
      b:= 0;
      for i := 0 to posm do
        if strtoint(memo1.lines[i])>a then
          begin
            a:= strtoint(memo1.Lines[i]);
            b:= i;
          end;
      c:= memo1.Lines[b];
      memo1.Lines[b]:= memo1.Lines[posm];
      memo1.Lines[posm]:= c;
    end;
end;
procedure TForm1.Button3Click(Sender: TObject);
var
  i: integer;
begin
  for i := memo1.Lines.Count-1 downto 0 do
    ordenar(i);
end;
procedure TForm1.Button4Click(Sender: TObject);
var
  i,c: integer;
  a: string;
begin
  c:= memo1.Lines.Count-1;
  for i := 0 to c div 2 do
    begin
      a:= memo1.Lines[i];
      memo1.Lines[i]:= memo1.Lines[c-i];
      memo1.Lines[c-i]:= a;
    end;
end;
procedure TForm1.Button5Click(Sender: TObject);
var
  a: real;
  i: integer;
begin
  a:= 0;
  for i := 0 to memo1.Lines.Count-1 do
    a:= strtofloat(memo1.Lines[i])+a;
  a:= a/memo1.Lines.Count;
  showmessage(floattostr(a));
end;
procedure TForm1.Button6Click(Sender: TObject);
var
  i,a: integer;
begin
  a:= 0;
  for i := 0 to memo1.Lines.Count-1 do
    a:= strtoint(memo1.Lines[i])+a;
  showmessage(inttostr(a));
end;
procedure TForm1.Button7Click(Sender: TObject);
var
  a: string;
  c: boolean;
  b,i,j: integer;
begin
  a:= edit1.Text;
  b:= 0;
  i:= 0;
  j:= 1;
  while c=false do
    begin
      if pos(a,memo1.Lines[b])<>0 then
        begin
          j:= b+1;
          c:= true;
        end
      else
        inc(i);
      inc(b);
    end;
  if i=memo1.Lines.Count then
    showmessage('No est�')
  else
    showmessage('Busc� '+inttostr(i)+' veces y est� en la posici�n '+inttostr(j));
end;
end.
