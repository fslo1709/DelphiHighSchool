unit conteo; //Sebasti�n L�pez, C5A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Memo1: TMemo;
    Label5: TLabel;
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
const
  meow=['a'..'z','A'..'z','�','�','�','�','�'];
  numeros=['0'..'9'];
var
  k: topendialog;
  archivo: textfile;
  oracion, pal: string;
  ormax,ormin,i,j,l,palabras,cont,incr,pos: integer;
  largomax: real;
  largo: array [1..50] of integer;
begin
  image1.Picture:= nil;
  memo1.Lines.Clear;
  ormin:= 0;
  ormax:= 0;
  oracion:= '';
  k:= topendialog.Create(self);
  k.InitialDir:= getcurrentdir;
  k.Filter:= 'Archivos de texto|*.txt';
  k.FilterIndex:= 1;
  palabras:=0;
  j:= 0;
  for i := 1 to 50 do
    largo[i]:= 0;
  if k.Execute then
    begin
      assignfile(archivo,k.FileName);
      reset(archivo);
      while length(oracion)=0 do
        readln(archivo,oracion);
      ormin:= length(oracion);
      ormax:= length(oracion);
      reset(archivo);
      while not(eof(archivo)) do
        begin
          i:=1;
          readln(archivo,oracion);
          if (length(oracion)<>0) and (length(oracion)<ormin) then
            ormin:= length(oracion);
          if length(oracion)>(ormax) then
            ormax:= length(oracion);
          for i := 1 to length(oracion) do
            begin
              inc(j);
              if not(oracion[i] in meow) or (i=length(oracion)) then
                begin
                  if j<>0 then
                    begin
                      if not(length(pal)=0)  then
                        inc (palabras);
                      inc(largo[j]);
                      j:= 0;
                      pal:= '';
                    end;
                end
              else
                pal:= pal+oracion[i];
            end;
        end;
      label3.Caption:= inttostr(ormax);
      label4.Caption:= inttostr(ormin);
      label1.Show;
      label2.Show;
      label3.Show;
      label4.Show;
      label5.Show;
      label5.Caption:= inttostr(palabras);
      cont:= 0;
      largomax:= largo[i];
      for i := 1 to 50 do
        if largo[i]<>0 then
          begin
            if largomax<largo[i] then
              largomax:= largo[i];
            memo1.lines.add(inttostr(i)+' '+inttostr(largo[i]));
            inc(cont);
          end;
      incr:= 380 div cont;
      pos:= 10;
      for i := 1 to 50 do
        if largo[i]<>0 then
          begin
            image1.Canvas.TextOut(pos,350,inttostr(i));
            image1.Canvas.Rectangle(pos,340,pos+5,340-trunc(((largo[i]*1.0)/largomax)*339)-1);
            pos:= pos+incr;
          end;
    end
  else
    showmessage('Seleccione un archivo v�lido');
end;
end.
