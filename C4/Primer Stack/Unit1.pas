unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Tstack= class
    private
      data: array[0..9] of integer;
      sp: integer;
    public
      constructor makenull;
      procedure push(r: integer);
      function top: integer;
      function pop: integer;
      function empty: boolean;
      function mtop: integer;
    protected
  end;
var
  Form1: TForm1;
  sp:integer;
  stack:array[0..99] of string;
  st: tstack;
implementation
constructor tstack.makenull;
begin
  sp:= 0;
end;
function tstack.top: integer;
begin
  top:= strtoint(stack[sp]);
end;
procedure tstack.push(r:integer);
begin
  if sp<100 then
    begin
      stack[sp]:=inttostr(r);
      inc(sp);
    end
  else
    showmessage('Stack Overflow');
end;
function tstack.pop:integer;
begin
  if (sp>0) then
    begin
      dec(sp);
      pop:=strtoint(stack[sp]);
    end
  else
    showmessage('Stack Underflow');
end;
function tstack.mtop:integer;
begin
  if sp>0 then
    mtop:=strtoint(stack[sp-1])
  else
    showmessage('Stack Underflow');
end;
function tstack.empty: boolean;
begin
  empty:= sp=0;
end;
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
begin
  st.push(strtoint(edit1.Text));
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  showmessage(inttostr(st.pop));
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  showmessage(inttostr(st.mtop));
end;
procedure TForm1.Button4Click(Sender: TObject);
begin
  if st.empty=true then
    showmessage('Est� vac�o')
  else
    showmessage('Est� ocupado')
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  st.makenull;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  st:= tstack.makenull;
  st.makenull;
end;
end.
