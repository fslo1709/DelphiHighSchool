unit length;//Sebastián López, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
  s: string;
begin
  s:= edit1.Text;
  i:= 0;
  if s='' then
    showmessage('Vacío')
  else
    begin
      repeat
        inc(i);
      until (s[i]=#0);
      dec(i);
      showmessage(inttostr(i));
    end;
end;
end.
