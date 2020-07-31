unit opendialog;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  entrada,salida: textfile;
implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
begin
  opendialog1.execute;
  assignfile(entrada,opendialog1.FileName);
  edit1.Text:= opendialog1.FileName;
  assignfile(salida,'salida.txt');
  rewrite(salida);
end;
end.
