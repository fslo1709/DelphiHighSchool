unit frec; //Sebasti�n L�pez, C5A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  t: topendialog;
  archivo: textfile;
  palabra: string;
  j,p: char;
  i: integer;
  x,y,z,lmin,lmax,b: integer;
  letras: array['A'..'Z'] of integer;
  letmax,cletmax: integer;
  procedure myuppercase(p:char);
    begin
      case p of
        '�','�': p:= 'A';
        '�','�': p:= 'E';
        '�','�': p:= 'I';
        '�','�': p:= 'O';
        '�','�','�','�': p:= 'U';
      end;
      uppercase(p);
    end;
begin
  lmax:= 0;
  x:= 0;
  y:= 0;
  z:= 0;
  for j := 'A' to 'Z' do
    letras[j]:= 0;
  t:= topendialog.Create(self);
  t.initialdir:= getcurrentdir;
  t.filter:= 'Archivos de texto|*.txt';
  t.FilterIndex:= 1;
  if t.Execute then
    begin
      assignfile(archivo,t.FileName);
      reset(archivo);
      readln(archivo,palabra);
      lmin:= length(palabra);
      reset(archivo);
      while not(eof(archivo)) do
        begin
          i:= 1;
          readln(archivo,palabra);
          if (lmin>length(palabra)) and (length(palabra)<>0) then
            lmin:= length(palabra);
          if lmax<length(palabra) then
            lmax:= length(palabra);
          while i<=length(palabra) do
            begin
            p:= palabra[i];
            myuppercase(p);
            if p='�' then
              inc(x)
            else
              inc(letras[p]);
            inc(i);
            end;
        end;
      label1.Caption:= label1.Caption+inttostr(lmin);
      label2.Caption:= label2.Caption+inttostr(lmax);
      for j:= 'A' to 'N' do
        if not(letras[j]=0) then
          memo1.Lines.Add('Hay '+inttostr(letras[j])+' letras '+j);
      if not(x=0) then
        memo1.Lines.Add('Hay '+inttostr(x)+' letras �');
      for j:= 'O' to 'Z' do
        if not(letras[j]=0) then
          memo1.Lines.Add('Hay '+inttostr(letras[j])+' letras '+j);
      letmax:= 1;
      cletmax:= letras['A'];
      for j := 'B' to 'Z' do
        if cletmax<letras[j] then
          begin
            letmax:= ord(j)-96;
            cletmax:= letras[j];
          end;
      if cletmax<x then
        begin
          letmax:= 27;
          cletmax:= x;
        end;
      for i := 1 to 14 do
        begin
          b:= letras[char(i+64)];
          image1.canvas.Rectangle(17*(i-1),500-trunc(499*b/cletmax)+1,17*(i-1)+10,500);
          image1.Canvas.TextOut(17*(i-1)+2,510,char(i+64));
        end;
      image1.canvas.Rectangle(270,500-trunc(499*x/cletmax)+1,280,500);
      image1.Canvas.TextOut(272,510,'�');
      for i := 15 to 26 do
        begin
          b:= letras[char(i+64)];
          image1.canvas.Rectangle(17*(i+2),500-trunc(499*b/cletmax)+1,17*(i+2)+10,500);
          image1.Canvas.TextOut(17*(i+2)+2,510,char(i+64));
        end;
    end
  else
    showmessage('No seleccion� un archivo de texto');
  t.Free;
  closefile(archivo);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  form1.Top:= 50;
  form1.Left:= 100;
end;
end.
