unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;
type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type plista=^tlista;
    tlista=record
      linea:integer;
      sig:plista;
    end;
  type pnodo=^nodo;
    nodo=record
      iz:pnodo;
      de:pnodo;
      palabra:string;
      frecuencia:integer;
      linea:plista;
    end;
var
  Form1: TForm1;
  archivo: textfile;
  linea: string;
  raiz: pnodo;
  cont: integer;
implementation
{$R *.dfm}
procedure insertarlista(var p:plista;linea:integer);
begin
  if p=nil then
    begin
      new(p);
      p.linea:=linea;
      p.sig:=nil;
    end
  else
    insertarlista(p.sig,linea);
end;
procedure Insertar(var p:pnodo; e:string; linea:integer);
begin
  if p=nil then
    begin
      new(p);
      p^.linea:=nil;
      p^.iz:=nil;
      p^.de:=nil;
      p^.palabra:=e;
      p^.frecuencia:=1;
    end
  else
    if p^.palabra=e then
      begin
        inc(p^.frecuencia);
        insertarlista(p.linea,linea);
      end
    else
      begin
        if e<p^.palabra then
          insertar(p^.iz,e,linea)
        else
          insertar(p^.de,e,linea);
      end;
end;
function sacarlista(p:plista):string;
var
  s:string;
begin
  if p=nil then
    sacarlista:=''
  else
    begin
      while p<>nil do
        begin
          s:= inttostr(p.linea)+', '+s;
          p:= p.sig;
        end;
      sacarlista:=s;
    end;
end;
procedure Inorder(p:pnodo);
begin
  if p<>nil then
    begin
      inorder(p^.iz);
      form1.StringGrid1.Cells[0,cont]:=p^.palabra;
      form1.StringGrid1.Cells[1,cont]:=inttostr(p^.frecuencia);
     // form1.StringGrid1.Cells[2,cont]:=sacarlista(p^.linea);
      cont:=cont+1;
      inorder(p^.de);
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  cont,contli:integer;
  pal,s:string;
begin
  s:='������������';
  if OpenDialog1.Execute=true then
    begin
      assignfile(archivo,opendialog1.FileName);
      reset(archivo);
      cont:=1;
      pal:='';
      contli:=0;
      repeat
        cont:=1;
        readln(archivo,linea);
        inc(contli);
        for cont := 1 to length(linea) do
          begin
            case linea[cont] of
              'A'..'Z','a'..'z':pal:=pal+linea[cont];
            end;
            if pos(linea[cont],s)>0 then
              pal:=pal+linea[cont];
            if (linea[cont]=' ') and (length(pal)>1) and (length(pal)<21) then
              begin
                pal:= ansilowercase(pal);
                insertar(raiz,pal,contli);
                pal:='';
              end;
          end;
        if (length(pal)>1) and (length(pal)<21) then
          begin
            insertar(raiz,pal,contli);
            pal:='';
          end;
      until (eof(archivo));
      inorder(raiz);
    end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  raiz:=nil;
end;
end.
