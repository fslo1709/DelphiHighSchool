unit delete_;//Sebastián López, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label4: TLabel;
    Label5: TLabel;
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
function largo(s:string):integer;
var
  i: integer;
begin
  i:= 1;
  while s[i]<>#0 do
    i:= i+1;
  largo:= i-1;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  a: string;
  b,c,c1,c2,i: integer;
begin
  a:= '';
  val(edit2.Text,b,c1);
  val(edit3.Text,c,c2);
  if (c1<>0) and (c2<>0) and (edit1.Text<>'') and (largo(edit1.Text)>b) and (largo(edit1.Text)>b+c) and (b>0) and (c>0) then
    begin
      for i := 1 to largo(edit1.Text) do
        if (i>=b) and (i<b+c) then
        else
          a:= a+edit1.Text[i];
      label5.Caption:= a;
    end
  else
    showmessage('Error');
end;
end.
