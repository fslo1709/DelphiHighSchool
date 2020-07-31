unit Unit2;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm2 = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
implementation
uses Unit1;
{$R *.dfm}
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.show;
end;
procedure TForm2.FormShow(Sender: TObject);
var
  i,iles,j: integer;
  il,fa,fan,li,d: real;
begin
  iles:= strtoint(form1.Edit4.Text);
  memo1.Lines.Clear;
  memo1.Hide;
  for i := 1 to iles-1 do
    begin
      il:= (i*form1.x)/iles;
      j:= 1;
      fa:= strtofloat(form1.StringGrid1.Cells[4,1]);
      while il>fa do
        begin
          inc(j);
          fa:= strtofloat(form1.StringGrid1.Cells[4,j]);
        end;
      if j=1 then
        fan:= 0
      else
        fan:= strtofloat(form1.StringGrid1.Cells[4,j-1]);
      li:= strtofloat(form1.StringGrid1.Cells[0,j]);
      d:= li+((il-fan)/fa)*form1.amp;
      memo1.Lines.Add(inttostr(i)+'. '+floattostrf(d,fffixed,8,3));
    end;
  memo1.Show;
end;
end.
