unit Cuenta_regresiva; //Sebastián López, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  a: integer;
implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
var
  c: integer;
begin
  a:= strtoint (edit1.text);
  listbox1.Show;
  if a>1 then
    begin
      c:= a;
      while a>=1 do
        begin
          listbox1.Items.Create;
          listbox1.items[c-a-1]:= inttostr(a);
          a:= a-1;
        end;
    end
  else
    showmessage('Ingrese un número mayor a 1');
end;
end.
