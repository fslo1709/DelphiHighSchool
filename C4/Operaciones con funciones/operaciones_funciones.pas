unit operaciones_funciones;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure suma;
begin
  form1.Edit3.Text:= floattostr(strtofloat(form1.Edit1.Text)+strtofloat(form1.Edit2.Text));
end;
procedure resta;
begin
  form1.Edit3.Text:= floattostr(strtofloat(form1.Edit1.Text)-strtofloat(form1.Edit2.Text));
end;
procedure multiplicacion;
begin
  form1.Edit3.Text:= floattostr(strtofloat(form1.Edit1.Text)*strtofloat(form1.Edit2.Text));
end;
procedure division;
begin
  form1.Edit3.Text:= floattostr(strtofloat(form1.Edit1.Text)/strtofloat(form1.Edit2.Text));
end;
procedure suma2(a,b: real);
begin
  form1.Edit3.Text:= floattostr(a+b);
end;
procedure resta2(a,b: real);
begin
  form1.Edit3.Text:= floattostr(a-b);
end;
procedure multiplicacion2(a,b: real);
begin
  form1.Edit3.Text:= floattostr(a*b);
end;
procedure division2(a,b: real);
begin
  form1.Edit3.Text:= floattostr(a/b);
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  suma;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  resta;
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  multiplicacion;
end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  division;
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  suma2(strtofloat(edit1.Text),strtofloat(edit2.Text));
end;
procedure TForm1.Button6Click(Sender: TObject);
begin
  resta2(strtofloat(edit1.Text),strtofloat(edit2.Text));
end;
procedure TForm1.Button7Click(Sender: TObject);
begin
  multiplicacion2(strtofloat(edit1.Text),strtofloat(edit2.Text));
end;
procedure TForm1.Button8Click(Sender: TObject);
begin
  division2(strtofloat(edit1.Text),strtofloat(edit2.Text));
end;
end.
