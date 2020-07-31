unit Unit1;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
uses Unit2;
procedure TForm1.Label1Click(Sender: TObject);
begin
  form1.hide;
  form2.show;
end;
procedure TForm1.Label2Click(Sender: TObject);
begin
  showmessage('ES TETRIS EXTREMO, NO EXISTE LA AYUDA');
end;
end.
