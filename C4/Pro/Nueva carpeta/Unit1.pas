unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  pnodo=^nodo;
  nodo=record
    l: string;
    f: integer;
    iz,de: pnodo;
  end;
var
  Form1: TForm1;
  raiz: pnodo;
  letras: array[1..27] of integer;
implementation
{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
  raiz:= nil;
end;
end.
