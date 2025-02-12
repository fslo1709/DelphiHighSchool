unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
type
  treg=record
    pal: string[20];
    sig: integer;
  end;
type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  ar: file of treg;
  re: treg;
  const letras='ABCDEFGHIJKLMN�OPQRSTUVWXYZ�����';
implementation
{$R *.dfm}
procedure init;
var
  i: integer;
begin
  rewrite(ar);
  re.pal:= '+';
  for i := 1 to 100 do
    write(ar,re);
  closefile(ar);
end;
function hash(p:string): integer;
var
  r,i: integer;
begin
  r:= 0;
  for i := 1 to length(p) do
    r:= r+ord(p[i]);
  hash:= r mod 100;
end;
function buscar(p: string): integer;
var
  r,pos: integer;
  re: treg;
begin
  r:= -1;
  pos:= hash(p);
  repeat
    seek(ar,pos);
    read(ar,re);
    if re.pal=p then
      r:= pos
    else if re.sig=0 then
      r:= -1
    else
      pos:= re.sig;
  until r<>-1;
  buscar:= r;
end;
procedure agregar(p: string);
var
  pos: integer;
begin
  reset(ar);
  pos:= hash(p);
  seek(ar,pos);
  read(ar,re);
  if re.pal='+' then
    begin
      re.pal:= p;
      re.sig:= 0;
      seek(ar,pos);
      write(ar,re);
    end
  else
    begin
      while re.sig<>0 do
        begin
          pos:= re.sig;
          seek(ar,pos);
          read(ar,re);
        end;
      re.sig:= filesize(ar);
      seek(ar,pos);
      write(ar,re);
      re.pal:= p;
      re.sig:= 0;
      seek(ar,filesize(ar));
      write(ar,re);
    end;
  closefile(ar);
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  at: textfile;
  p,c: string;
begin
  if opendialog1.Execute then
    begin
      assignfile(at,opendialog1.FileName);
      reset(at);
      reset(ar);
      p:= '';
      while not eof(at) do
        begin
          read(at,c);
          c:= ansiuppercase(c);
          if pos(c,letras)<>0 then
            p:= p+c
          else
            if p<>'' then
              begin
                if buscar(p)=-1 then
                  if messagedlg('La palabra '+p+' no existe en el diccionario. �Desea agregarlo?',mtcustom,[mbyes,mbno],0)=mryes then
                    agregar(p);
                  p:= '';
              end;
        end;
      closefile(at);
      closefile(ar);
    end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  assignfile(ar,'diccionario.c5');
  init;
end;
end.
