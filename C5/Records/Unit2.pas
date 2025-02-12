unit Unit2;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit1;
type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
  p: integer;
implementation
{$R *.dfm}
procedure limpiar;
begin
  with form2 do
    begin
      edit1.Text:= '0';
      edit2.Text:= '0';
      edit3.Text:= '';
      edit4.Text:= '';
      edit5.Text:= '';
      edit6.Text:= '0';
    end;
end;
procedure esconder;
begin
  with form2 do
    begin
      button2.hide;
      button3.hide;
      button4.Hide;
      edit2.Hide;
      edit3.Hide;
      edit4.Hide;
      edit5.Hide;
      edit6.Hide;
      button1.Show;
      edit1.Show;
    end;
  limpiar;
end;
procedure mostrar;
begin
  with form2 do
    begin
      button2.show;
      button3.show;
      button4.show;
      edit2.show;
      edit3.show;
      edit4.show;
      edit5.show;
      edit6.show;
      button1.hide;
      edit1.hide;
    end;
  limpiar;
end;
procedure TForm2.Button1Click(Sender: TObject);
var
  m: boolean;
  dato: tnombres;
  x: integer;
begin
  m:= false;
  x:= strtoint(edit1.Text);
  reset(form1.ar);
  while (not(eof(form1.ar))) and (m=false) do
    begin
      read(form1.ar,dato);
      if dato.Codigo=x then
        begin
          m:= true;
          mostrar;
          edit2.Text:= inttostr(dato.Codigo);
          edit3.Text:= dato.Nombre;
          edit4.Text:= dato.Direccion;
          edit5.Text:= dato.Email;
          edit6.Text:= floattostr(dato.saldo);
          p:= filepos(form1.ar);
        end;
    end;
  closefile(form1.ar);
  if m=false then
    begin
      showmessage('Archivo no encontrado');
      esconder;
    end;
end;
procedure TForm2.Button2Click(Sender: TObject);
var
  dato: tnombres;
begin
  reset(form1.ar);
  seek(form1.ar,p-1);
  dato.Codigo:= strtoint(edit2.Text);
  dato.Nombre:= edit3.Text;
  dato.Direccion:= edit4.Text;
  dato.Email:= edit5.Text;
  dato.saldo:= strtofloat(edit6.Text);
  write(form1.ar,dato);
  closefile(form1.ar);
  esconder;
  form1.abrir;
  form1.Show;
  form2.Hide;
end;
procedure TForm2.Button3Click(Sender: TObject);
var
  dato: tnombres;
  ar2: file of tnombres;
begin
  assignfile(ar2,'datos2.c5');
  rewrite(ar2);
  reset(form1.ar);
  while not(eof(form1.ar)) do
    begin
      read(form1.ar,dato);
      if filepos(form1.ar)<>p then
        write(ar2,dato);
    end;
  rewrite(form1.ar);
  reset(ar2);
  while not(eof(ar2)) do
    begin
      read(ar2,dato);
      write(form1.ar,dato);
    end;
  closefile(form1.ar);
  closefile(ar2);
  erase(ar2);
  esconder;
  form1.abrir;
  form1.Show;
  form2.Hide;
end;
procedure TForm2.Button4Click(Sender: TObject);
begin
  form1.Show;
  form2.Hide;
  esconder;
end;
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;
procedure TForm2.FormCreate(Sender: TObject);
begin
  esconder;
end;
end.
