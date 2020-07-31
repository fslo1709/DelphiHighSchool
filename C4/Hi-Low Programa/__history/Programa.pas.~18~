unit Programa;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
var
  num,veces: integer;
procedure TForm1.Button1Click(Sender: TObject);
begin
  randomize;
  num:= random(501);
  label1.Caption:= 'Adivine un número entre 0 y 500';
  veces:= 0;
  label1.Show;
  labelededit1.Enabled:= true;
  button2.Enabled:= true;
  button1.Enabled:= false;
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  num2: integer;
begin
  inc (veces);
  num2:= strtoint(labelededit1.Text);
  if num>num2 then
    label1.Caption:= 'El número que ingresó es menor';
  if num<num2 then
    label1.Caption:= 'El número que ingresó es mayor';
  if num=num2 then
    begin
      label1.Caption:= 'Es usted un ganador!! Acertó en '+inttostr(veces)+' veces!!';
      labelededit1.Enabled:= false;
      button2.Enabled:= false;
      button1.Enabled:= true;
    end;
end;
end.
