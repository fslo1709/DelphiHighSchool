unit ahorcado;//Sebastián López, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    entrada: textfile;
    palabras: array[1..15] of string;
    palabra_string: string;
    r: integer;
  end;
procedure abrir;
var
  Form1: TForm1;
implementation
uses ahorcado2, ahorcado3;
{$R *.dfm}
procedure abrir;
var i: integer;
begin
  with form1 do
    begin
      if opendialog1.Execute then
        begin
          assignfile(entrada,opendialog1.FileName);
          i:= 0;
          reset(entrada);
          while (not(eof(entrada))) do
            begin
              readln(entrada,palabra_string);
              inc(i);
              palabras[i]:= palabra_string;
            end;
          r:= random(i)+1;
          form3.Show;
          form1.Hide;
        end
      else
        showmessage('Adios');
    end;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;
procedure TForm1.Image2Click(Sender: TObject);
begin
  abrir;
end;
procedure TForm1.Label1Click(Sender: TObject);
begin
  showmessage('Chipi Pro lml');
end;
end.
