unit infix_;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  TPostfix=class
    private
      op: string;
      num: array[1..500] of double;
    public
      error: string;
      constructor create(ex: string);
      function eval(px,py,pz: double): double;
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
constructor tpostfix.create(ex: string);
var
  stack: array[1..100] of char;
  vc, i ,sp: integer;
  n: double;
  ts: boolean;
  t: string;
  procedure makenull;
    begin
      sp:= 0;
    end;
  function empty: boolean;
    begin
      empty:= sp=0;
    end;
  procedure push(e: char);
    begin
      if sp<500 then
        begin
          stack[sp]:= (e);
          inc(sp);
        end
      else
        showmessage('Stack Overflow');
    end;
  function pop: string;
    begin
      if sp>0 then
        begin
          dec(sp);
          pop:= stack[sp];
        end
      else
        pop:= 'Stack Underflow';
    end;
  function top: char;
    begin
      if sp>0 then
        top:= stack[sp-1]
      else
        top:= ' ';
    end;
  function jer(c:char): integer;
    begin
      case c of
        '+','-': jer:= 1;
        '*','/': jer:= 2;
        '^': jer:= 3;
        '(': jer:= 0;
        '~': jer:= 4;
      end;
    end;
  procedure signo(c:char);
    begin
      while (not empty) and (jer(top)>=jer(c)) do
        op:= op+pop;
      push(c);
    end;
begin
  makenull;
  error:= '';
  op:= '';
  i:= 1;
  ts:= false;
  ex:= lowercase(ex);
  while (error='') and (i<=length(ex)) do
    case ex[i] of
      'x','y','z':begin
                    if ts then
                      signo('*');
                    op:= op+ex[i];
                    inc(i);
                    ts:= true;
                  end;
      '+','-','*','/','^':begin
                            if not (ts) then
                              if ex[i]='-' then
                                signo('~')
                              else
                                error:= 'Expresión incorrecta'
                            else
                              signo(ex[i]);
                            inc(i);
                            ts:= false;
                          end;
      ' ': inc(i);
      '(':begin
            if ts then
              signo('*');
            push('(');
            inc(i);
          end;
      ')':begin
            while (not empty) and (pop<>'(') do
              op:= op+pop;
            pop;   //validar underflow
            inc(i);
          end;
      '0'..'9': begin
                  t:= copy(ex,i,length(ex));
                  val(t,n,vc);
                  if vc<>0 then
                    begin
                      t:= copy(t,1,vc-1);
                      i:= i+vc-1;
                      val(t,n,vc);
                    end
                  else
                    i:= length(ex)+1;
                  op:= op+'#';
                  num[length(ex)]:= n;
                  ts:= true;
                end;
    else
      error:= '?';
  end;
  while not empty do
    op:= op+pop;
end;
function tpostfix.eval(px: Double; py: Double; pz: Double): double;
var
  stack: array[1..500] of double;
  i,sp: integer;
  a,b: double;
  procedure push(e: double);
    begin

    end;
  function pop: double;
    begin
      if sp>0 then
        begin
          dec(sp);
          pop:= stack[sp];
        end
      else

    end;
begin
  for i := 1 to length(op) do
    case op[i] of
      'x': push(px);
      'y': push(py);
      'z': push(pz);
      '+': push(pop+pop);
      '-': push(-pop+pop);
      '*': push(pop*pop);
      '/':begin
            b:= pop;
            a:= pop;
            if b=0 then
              error:= '?'
            else
              push(a/b);
          end;
      '^':begin
            b:= pop;
            a:= pop;
            if b<0 then
              push(1/power(a,abs(b)))
            else
              push(power(a,b));
          end;
      '~':begin
            push(-pop);
          end;
      '#':begin
            push(num[i]);
          end;
    end;
  eval:= pop;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  f: TPostfix;
  y: double;
  vx: integer;
begin
  f:= TPostfix.create(edit1.Text);
  y:= f.eval(2,0,0);
  showmessage(floattostr(y));
  vx:= -10;
  while vx<10 do
    begin
      y:= f.eval(vx,0,0);
      if f.error<>'' then
        ;
      inc(vx);
    end;
end;
end.
