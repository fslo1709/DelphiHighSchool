unit infix_posfix;      //Sebasti�n L�pez, C5A
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  tpostfix=class
    private
      op: string;
      num: array [1..500] of extended;
    public
      error: string;
      constructor create(exp: string);
      function eval(x,y,z: extended): extended;
  end;
var
  Form1: TForm1;
implementation
{$R *.dfm}
constructor tpostfix.create(exp: string);
var
  i,vc: integer;
  ts: boolean;
  t: string;
  n: extended;
function jer(c: char): integer;
begin
  jer:= pos('(+-*/^',c) div 2;
end;
procedure signo(c:char);
begin
  while (not(empty)) and ((jer(top))>=jer(c)) do
    op:= op+pop;
  push(c);
end;
begin
  makenull;
  i:= 1;
  ts:= false;
  op:= '';
  exp:= uppercase(exp);
  while (error='') and (i<=length(exp)) do
    begin
      case exp[i] of
        'x','y','z':begin
                      if ts then
                        signo('*');
                      op:= op+exp[i];
                      inc(i);
                      ts:= true;
                    end;
        '+','-','*','/','^':begin
                              if not(ts) then
                                if exp[1]='-' then
                                  signo('�')
                                else
                                  error:='Revise sus signos en posici�n '+inttostr(i)
                              else
                                signo(exp[i]);
                              inc(i);
                            end;
        '(':begin
              push('(');
              inc(i);
            end;
        ')':begin
              while (not(empty)) and ((top<>'(')) do
                op:= op+top;
              pop;
              inc(i);
            end;
        '0'..'9': begin
                    t:= copy(exp,i,length(exp));
                    val(t,n,vc);
                    if vc<>0 then
                      begin
                        t:= copy(t,1,vc-1);
                        i:= i+vc-1;
                        val(t,n,vc);
                      end
                    else
                      i:= length(exp[i]);
                    op:= op+'#';
                    num[length(op)]:= n;
                  end;
        else
          error:= 'Error en la posici�n '+inttostr(i);
      end;
    end;
  while not(empty) do
    op:= op+pop;
end;
end.
