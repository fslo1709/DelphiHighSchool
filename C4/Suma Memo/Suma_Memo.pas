unit Suma_Memo;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Memo1: TMemo;
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
  s,r,may,men: integer;
begin
  s:= 0;
  r:= 0;
  may:= 0;
  men:= 0;
  while r<memo1.Lines.Count do
    begin
      s:= strtoint(memo1.Lines[r])+s;
      if strtoint(memo1.Lines[r])<0 then
        inc(men)
      else
        if strtoint(memo1.Lines[r])>0 then
          inc(may);
      inc(r);
    end;
  showmessage ('La suma es '+inttostr(s)+', hay '+inttostr(may)+' mayores y '+inttostr(men)+' menores a cero');
end;
end.
