unit Programa_Triple;//Sebasti�n L�pez, C4A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Button2: TButton;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    Button3: TButton;
    Label4: TLabel;
    Label5: TLabel;
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
implementation
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
var
  a,b,e,i: integer;
begin
  val(edit1.Text,a,e);
  if e<>0 then
    showmessage('Error')
  else
    if (a<17) and (a>0) then
      begin
        b:= 1;
        for i := 1 to a do
          b:= b*i;
        label1.Caption:= inttostr(b);
      end
    else
      showmessage('Error');
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  a,b,e1,e2,i,c: integer;
begin
  val(edit2.Text,a,e1);
  val(edit3.Text,b,e2);
  c:= 1;
  if (e1<>0) or (e2<>0) then
    showmessage ('Error')
  else
    begin
      for i := 1 to b do
        c:= c*a;
      label3.Caption:= floattostr(c);
    end;
end;
procedure TForm1.Button3Click(Sender: TObject);
var
  a,c,i,j,e: integer;
  b: real;
begin
  val (labelededit1.Text,a,e);
  if e<>0 then
    showmessage('Error')
  else
    begin
      b:= 0;
      for i := 1 to a do
        begin
          c:= 1;
          for j := 1 to i do
            c:= c*2;
          b:= (i/c)+b;
        end;
      label5.Caption:= floattostr(b);
    end;
end;
end.
