unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  archivo = record
    nombre: string[20];
    direccion: string[30];
    telefono: string[13];
    email: string[20];
  end;
var
  Form1: TForm1;
  arch: file of archivo;
  actual: integer;
implementation
{$R *.dfm}
function hash(a: string):integer;
var
  i,value: integer;
begin
  value:=0;
  for i := 1 to length(a) do
    begin
      value:=value+ord(a[i]);
    end;
  result:=value mod 30;
end;
procedure creararchivo;
begin
  if form1.OpenDialog1.Execute then
  begin
    assignfile(arch,form1.OpenDialog1.FileName);
    reset(arch);
    closefile(arch);
  end;
end;
  {
var
  directorio: string;
  archvar: archivo;
begin
  archvar.nombre:='-1';
  archvar.direccion:='';
  archvar.telefono:='';
  archvar.email:='';
  directorio:= getcurrentdir;
  assignfile(arch,directorio+'\registro.hola');
  rewrite(arch);
  for i:= 0 to 29 do
    begin
      seek(arch,i);
      archvar.direccion:= inttostr(i);
      write(arch,archvar);
    end;
  closefile(arch);
end;
  }
procedure ingresar;
var
  arch1,arch2: archivo;
  p: integer;
begin
  reset(arch);
  arch1.nombre:=form1.Edit1.Text;
  arch1.direccion:=form1.Edit2.Text;
  arch1.telefono:=form1.Edit3.Text;
  arch1.email:=form1.Edit4.Text;
  p:=hash(arch1.nombre)-1;
  repeat
    inc(p);
    seek(arch,p);
    read(arch,arch2);
  until(arch2.nombre='-1')or(p=29)or(arch2.nombre='-2');
  if (arch2.nombre='-1') or (arch2.nombre='-2') then
    begin
      seek(arch,p);
      write(arch,arch1);
      showmessage('Ingresado correctamente');
    end
  else
    showmessage('No hay espacio en el archivo.');
  closefile(arch);
end;
procedure borrar;
var
  arch1,arch2: archivo;
  p: integer;
begin
  reset(arch);
  arch1.nombre:=form1.Edit1.Text;
  arch1.direccion:=form1.Edit2.Text;
  arch1.telefono:=form1.Edit3.Text;
  arch1.email:=form1.Edit4.Text;
  p:=hash(arch1.nombre)-1;
  repeat
    inc(p);
    seek(arch,p);
    read(arch,arch2);
  until(arch2.nombre=arch1.nombre)or(p=29);
  if (arch2.nombre=arch1.nombre) then
    begin
      arch1.nombre:='-2';
      seek(arch,p);
      write(arch,arch1);
    end
  else
    showmessage('Los datos no existen.');
  closefile(arch);
end;
procedure buscar;
var
  arch1,arch2: archivo;
  p: integer;
begin
  reset(arch);
  arch1.nombre:= form1.Edit1.Text;
  arch1.direccion:= form1.Edit2.Text;
  arch1.telefono:= form1.Edit3.Text;
  arch1.email:= form1.Edit4.Text;
  p:= hash(arch1.nombre)-1;
  repeat
    inc(p);
    seek(arch,p);
    read(arch,arch2);
  until (arch2.nombre=arch1.nombre) or (p=29);
  if arch2.nombre=arch1.nombre then
    begin
      form1.Edit1.Text:= arch2.nombre;
      form1.Edit2.Text:= arch2.direccion;
      form1.Edit3.Text:= arch2.telefono;
      form1.Edit4.Text:= arch2.email;
      actual:= p;
      form1.Button3.hide;
      form1.Button1.Hide;
      form1.Button2.Hide;
      form1.Button4.Show;
    end
  else
    showmessage('Los datos no existen');
  closefile(arch);
end;
procedure modificar;
var
  arch1: archivo;
  i: integer;
begin
  reset(arch);
  arch1.nombre:= form1.Edit1.Text;
  arch1.direccion:= form1.Edit2.Text;
  arch1.telefono:= form1.Edit3.Text;
  arch1.email:= form1.Edit4.Text;
  seek(arch,actual);
  write(arch,arch1);
  closefile(arch);
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  ingresar;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  borrar;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  buscar;
end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  modificar;
  button3.Show;
  button1.Show;
  button2.Show;
  button4.Hide;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  creararchivo;
end;
end.
