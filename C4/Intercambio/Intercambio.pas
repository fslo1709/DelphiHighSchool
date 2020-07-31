unit Intercambio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
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

procedure TForm1.FormCreate(Sender: TObject);
var
  a,b,c: string;
begin
  a:= 'Hola';
  b:= 'Hello';
  showmessage(a+' '+b);
  c:= a;
  a:= b;
  b:= c;
  showmessage(a+' '+b);
end;
end.
