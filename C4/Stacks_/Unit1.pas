unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;
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
//    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Tstack= class(tstringgrid)
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
  stack:array[0..99] of integer;
  st: tstack;
implementation
constructor tstack.makenull;
begin
  sp:= 0;
  create(form1);
  parent:= form1;
  colcount:= 1;
  rowcount:= 1;
  height:= 120;
  width:= 30;
end;
procedure tstack.push(r:integer);
begin
  if sp<100 then
    begin
      stack[sp]:=r;
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
      pop:=stack[sp];
    end
  else
    showmessage('Stack Underflow');
end;
function tstack.mtop:integer;
begin
  if sp>0 then
    mtop:=stack[sp-1]
  else
    showmessage('Stack Underflow');
end;
function empty:boolean;
begin
  empty:= sp=0;
end;
{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
begin
  st.push(random(100));
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
  if empty=true then
    showmessage('Est� vac�o')
  else
    showmessage('Est� ocupado')
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  st.makenull;
end;


{procedure TForm1.Button6Click(Sender: TObject);
var
  i: integer;
  b: boolean;
  d: string;
begin
  i:= 1;
  b:= false;
  while (i<=length(edit2.Text)) and (b=false) do
    begin
      if (edit2.Text[i]='{') or (edit2.Text[i]='[') or (edit2.Text[i]='<') or (edit2.Text[i]='(') then
        st.push(edit2.Text[i]);
      if (edit2.Text[i]='}{') or (edit2.Text[i]=']') or (edit2.Text[i]='>') or (edit2.Text[i]=')') then
        begin
          if sp=0 then
            b:= true
          else
            case st.pop of
              '{': if edit2.Text[i]<>'}{' then b:= true;
              '[': if edit2.Text[i]<>']' then b:= true;
              '(': if edit2.Text[i]<>')' then b:= true;
              '<': if edit2.Text[i]<>'>' then b:= true;
            end;
        end;
      inc(i);
    end;
  if sp>0 then
    b:= true;
  if b=true then
    showmessage('Error')
  else
    showmessage('OK');
end;                                    }
procedure TForm1.FormCreate(Sender: TObject);
begin
  st:= tstack.makenull;
  st.makenull;
end;
end.
