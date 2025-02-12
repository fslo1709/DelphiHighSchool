unit frecuencia;//Sebasti�n L�pez, C4
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,shellapi;
type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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
  m: topendialog;
  archivo,salida: textfile;
  palabra: string;
  i,x: integer;
  j: char;
  letras: array ['a'..'z'] of integer;
begin
  for j := 'a' to 'z' do
    letras[j]:= 0;
  x:= 0;
  m:= topendialog.Create(self);
  m.InitialDir:= getcurrentdir;
  m.Filter:= 'Archivos de texto|*.txt';
  m.FilterIndex:= 1;
  if m.Execute then
    begin
      assignfile(archivo,m.FileName);
      reset(archivo);
      assignfile(salida,'salida.txt');
      rewrite(salida);
      while not(eof(archivo)) do
        begin
          readln(archivo,palabra);
          for i := 1 to length(palabra) do
            case palabra[i] of
              'a','A',#225,#193: inc(letras['a']);
              'b','B': inc(letras['b']);
              'c','C': inc(letras['c']);
              'd','D': inc(letras['d']);
              'e','E',#233,#201: inc(letras['e']);
              'f','F': inc(letras['f']);
              'g','G': inc(letras['g']);
              'h','H': inc(letras['h']);
              'i','I',#237,#205: inc(letras['i']);
              'j','J': inc(letras['j']);
              'k','K': inc(letras['k']);
              'l','L': inc(letras['l']);
              'm','M': inc(letras['m']);
              'n','N': inc(letras['n']);
              #209,#241: inc(x);
              'o','O',#243,#211: inc(letras['o']);
              'p','P': inc(letras['p']);
              'q','Q': inc(letras['q']);
              'r','R': inc(letras['r']);
              's','S': inc(letras['s']);
              't','T': inc(letras['t']);
              'u','U',#250,#218: inc(letras['u']);
              'v','V': inc(letras['v']);
              'w','W': inc(letras['w']);
              'x','X': inc(letras['x']);
              'y','Y': inc(letras['y']);
              'z','Z': inc(letras['z']);
            end;
        end;
      for j:= 'a' to 'n' do
        if not(letras[j]=0) then
          writeln(salida,'Hay ',letras[j],' letras ',j);
      if not(x=0) then
        writeln(salida,'Hay ',x,' letras �');
      for j:= 'o' to 'z' do
        if not(letras[j]=0) then
          writeln(salida,'Hay ',letras[j],' letras ',j);
    end
  else
    showmessage('Seleccione un archivo de texto v�lido');
  m.Free;
  closefile(salida);
  closefile(archivo);
end;
end.
