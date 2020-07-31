unit tablas; //Sebastián López, C5A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw;
type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
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
  ar: textfile;
  i,r,n: integer;
begin
  assignfile(ar,'tablas.html');
  rewrite(ar);
  writeln(ar,'<html><head></head>');
  writeln(ar,'<body>');
  i:= 1;
  n:= strtoint(labelededit1.Text);
  while i <= 10 do
    begin
      r:= n*i;
      writeln(ar,inttostr(n)+'*'+inttostr(i)+'='+inttostr(r)+'<br>');
      inc(i);
    end;
  writeln(ar,'</body></html>');
  closefile(ar);
  webbrowser1.Navigate('C:\Users\Victor Lopez\Desktop\Programas\C5\Tablas\Debug\Win32\tablas.html');
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  ta: textfile;
  i,j,n: integer;
  m: array [1..100,1..100] of integer;
begin
  assignfile(ta,'triangulo.html');
  rewrite(ta);
  writeln(ta,'<html><font size="6"><center><head>Triángulo</head></center></font><body bgcolor= "green"><br>');
  n:= strtoint(labelededit1.Text);
  for i := 1 to n do
    for j := 1 to n do
      m[i,j]:= 0;
  for i := 1 to n do
    m[i,1]:= 1;
  for i := 2 to n do
    for j := 2 to n do
      m[i,j]:= m[i-1,j-1]+m[i-1,j];
  for i := 1 to n do
    begin
      write(ta,'<center>');
      for j := 1 to n do
        if m[i,j]<>0 then
          write(ta,inttostr(m[i,j])+' ');
      writeln(ta,'</center>');
    end;
  writeln(ta,'</body></html>');
  closefile(ta);
  webbrowser1.Navigate('C:\Users\Victor Lopez\Desktop\Programas\C5\Tablas\Debug\Win32\triangulo.html');
end;
end.
