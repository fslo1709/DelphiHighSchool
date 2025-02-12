unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Vcl.StdCtrls;
type
  tcola = class
    data: array[1..10] of string;
    cp: integer;
    constructor makenull;
    function empty: boolean;
    procedure queue(e: string);
    function dequeue: string;
  end;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  cola: tcola;
implementation
{$R *.dfm}
constructor tcola.makenull;
begin
  cp:= 1;
end;
function tcola.empty;
begin
  result:= cp=0;
end;
procedure tcola.queue(e: string);
begin
  data[cp]:= e;
  inc(cp);
end;
function tcola.dequeue;
var
  i: Integer;
begin
  result:= data[1];
  for i := 1 to cp-1 do
    data[i]:= data[i+1];
  data[i]:= '';
  dec(cp);
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  cola.queue(edit1.Text);
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  showmessage(cola.dequeue);
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  cola:= tcola.makenull;
end;
end.
