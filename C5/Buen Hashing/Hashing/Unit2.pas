unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit4: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  talu=record
    cod:string[6];
    nom:string[40];
    edad:integer;
    dir:string[50];
  end;

var
  Form2: TForm2;
  reg : talu;
  ar: file of talu;

implementation
{$R *.dfm}
function hash(s:string) :integer;
var
  r,i:integer;
begin
  r:=0;
  for i := 1 to length(s) do
    r:=r+ord(s[i]); //c�digo ascii
  hash:=r mod 30 + 1; //El mod 30 es porque son 30 archivos
end;

procedure crear;
var
  i:integer;
begin
  assignfile(ar, 'alumnos.c5'  );
  reset(ar);
  reg.cod:='*';
  for i := 1 to 37 do
    write(ar,reg);   //llenar el c�digo
end;

function buscar(cod:string):integer;
var
  p,r:integer;
  re: talu;
begin
  r:=-1;
  p:=hash(cod);
  repeat
    seek(ar,p);
    read(ar,re);
    if re.cod=cod then
      r:=p
    else
      inc(p);
  until (re.cod=cod)or(re.cod='*')or(p>filesize(ar));
  buscar:=r;
end;

procedure agregar;
var
  t:talu;
  p:integer;
begin
  reg.cod:= form2.Edit4.Text;
  reg.nom:=form2.Edit1.text;
  reg.edad:=strtoint(form2.Edit2.Text);
  reg.dir:=form2.Edit3.Text;
  reset(ar);
  if buscar(reg.nom)=-1 then
    begin
      p:=hash(reg.cod)-1;
        repeat
          inc(p);
          seek(ar,p);
          read(ar,t);
        until (t.cod='*')or (t.cod='-') or (p=filesize(ar));
      seek(ar,p);
      write(ar,reg);
    end;
end;
procedure borrar;
var
p:integer;
begin
  reset(ar);
  p:=buscar(form2.Edit4.Text);
  if p<>-1 then
    begin
      seek(ar,p);
      reg.cod:='-';
      write(ar,reg);
    end;
end;
procedure TForm2.Button1Click(Sender: TObject);
var
  dev:integer;
begin
  reset(ar);
  dev:=buscar(edit4.Text);
  if dev=-1 then
    showmessage('No se encontr�')
  else
    begin
      seek(ar,dev);
      read(ar,reg);
      edit4.Text:=reg.cod;
      edit1.Text:=reg.nom;
      edit2.Text:=inttostr(reg.edad);
      edit3.Text:=reg.dir;
    end;
end;
procedure TForm2.Button2Click(Sender: TObject);
begin
  agregar;
end;
procedure TForm2.Button3Click(Sender: TObject);
begin
  borrar;
end;
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  closefile(ar);
end;
procedure TForm2.FormCreate(Sender: TObject);
begin
  assignfile(ar, 'alumnos.c5');
  crear;
end;
end.
