unit copia;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TStack= class(tstringgrid)
  private
    sp: integer;
    flechita: tlabel;
    function getsp: integer;
    procedure setsp(v:integer);
    property bsp: integer read getsp write setsp;
  public
    constructor makenull (x,y: integer);
    procedure push(e: integer);
    function pop: string;
    function top: string;
    function empty: boolean;
    procedure kliq(s: tobject);
  end;
var
  Form1: TForm1;
  st: tstack;
implementation
{$R *.dfm}
constructor tstack.makenull(x: Integer; y: Integer);
begin
  sp:= 0;
  create(form1);
  parent:= form1;
  colcount:= 1;
  rowcount:= 5;
  height:= 130;
  width:= 90;
  inherited top:= y;
  left:= x;
  fixedrows:= 0;
  fixedcols:= 0;
  onclick:= kliq;
  flechita:= tlabel.Create(form1);
  flechita.Parent:= form1;
  flechita.Caption:= '<--';
  flechita.Left:= left+width+3;
  bsp:= 0;
end;
function tstack.getsp;
begin
  getsp:= sp;
end;
procedure tstack.setsp(v: Integer);
begin
  sp:= v;
  flechita.Top:= inherited top + v*24+5;
end;
function tstack.top;
begin
  if sp>0 then
    top:= cells[0,sp-1]
  else
    top:= 'Stack Underflow';
end;
function tstack.pop;
begin
  if sp>0 then
    begin
      dec(sp);
      pop:= cells[0,sp];
    end
  else
    pop:= 'Stack Underflow';
end;
function tstack.empty;
begin
  empty:= sp=0;
end;
procedure tstack.push(e: Integer);
begin
  if sp<5 then
    begin
      cells[0,sp]:= inttostr(e);
      inc(sp);
    end
  else
    showmessage('Stack Overflow');
end;
procedure tstack.kliq(s: TObject);
begin
  st:= s as tstack;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  st.push(random(100));
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
  showmessage(st.pop);
end;
procedure TForm1.Button3Click(Sender: TObject);
begin
  showmessage(st.top);
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  st:= tstack.makenull(10,20);
end;
procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  st:= tstack.makenull(x,y);
end;
end.
