unit quine;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  valed: string;
  lim,limlet,lim2,distintos: integer;
  ex: array [1..1000] of string;
  exord: array[1..26,1..100] of string;
  let: array [1..26] of boolean;
  exnum: array[1..26,1..100] of string;
  imp: array[1..26,1..100] of string;
  implprim: array [1..100] of string;
implementation
{$R *.dfm}
function verificar: boolean;
var
  error: boolean;
  ed: string;
  i,len,posm: integer;
begin
  error:= false;
  ed:= form1.Edit1.Text;
  i:= 1;
  len:= length(ed);
  while i<=len do
    begin
      posm:= pos('+',ed);
      if (posm=1) or ((posm=0) and (length(ed)=0)) then
        error:= true
      else
        delete(ed,1,posm);
      if pos('+',ed)=1 then
        error:= true;
      inc(i);
    end;
  ed:= form1.Edit1.Text;
  i:= 1;
  while i<=len do
    begin
      posm:= pos(#39,ed);
      if (posm=1) then
        error:= true
      else
        if (posm-1=pos('+',ed)) then
          error:= true
        else
          delete(ed,1,posm);
      if pos(#39,ed)=1 then
        error:= true;
      inc(i);
    end;
  verificar:= error;
end;
procedure expresiones;
var
  ed: string;
  ex2: array[1..100] of string;
  i,posm: integer;
begin
  lim:= 1;
  ed:= form1.Edit1.Text;
  for i := 1 to length(ed) do
    if ed[i]='+' then
      inc(lim);
  i:= 1;
  while i<=lim do
    begin
      posm:= pos('+',ed);
      if posm=0 then
        begin
          ex[i]:= copy(ed,1,length(ed));
          delete(ed,1,length(ed));
        end
      else
        begin
          ex[i]:= copy(ed,1,posm-1);
          delete(ed,1,posm);
        end;
      inc(i);
    end;
end;
procedure letras;
var
  i: integer;
  ed: string;
begin
  limlet:= 0;
  ed:= form1.Edit1.Text;
  for i := 1 to length(ed) do
    if (ed[i]<>'+') and (ed[i]<>#39) then
      let[ord(ed[i])-96]:= true;
  for i := 1 to 26 do
    if let[i]=true then
      inc(limlet);
end;
procedure ordenar;
var
  a1,a2,i,j,k,l,len: integer;
  c: string;
  ch1,ch2: char;
  temp,ex2: array [1..26] of string;
begin
  for i := 1 to lim do
    begin
      for l := 1 to 26 do
        temp[l]:= '';
      k:= 1;
      j:= 1;
      len:= length(ex[i]);
      for l := 1 to lim do
        ex2[l]:= ex[l];
      while j<=len do
        begin
          if pos(#39,ex2[i])=2 then
            begin
              temp[k]:= ex[i][j]+ex[i][j+1];
              delete(ex2[i],1,2);
              inc(j); inc(j);
            end
          else
            begin
              temp[k]:= ex[i][j];
              delete(ex2[i],1,1);
              inc(j);
            end;
          inc(k);
        end;
      if k<>1 then
        begin
          j:=2;
          l:=2;
          while j<k do
            begin
              if (l>=2) then
                begin
                  ch1:= temp[l][1];
                  a1:= ord(ch1);
                  ch2:= temp[l-1][1];
                  a2:= ord(ch2);
                  if (a1<a2) then
                    begin
                      c:= temp[l-1];
                      temp[l-1]:= temp[l];
                      temp[l]:= c;
                      dec(l);
                    end
                  else
                    begin
                      inc(j);
                      l:= j;
                    end;
                end
              else
                begin
                  inc(j);
                  l:= j;
                end;
            end;
        end;
      for j := 1 to k-1 do
        exord[j,i]:= temp[j];
    end;
end;
procedure numerizar;
var
  i,j,l,m: integer;
  k: char;
  ex2,exx: array[1..1000,1..26] of string;
  prueba: string;
begin
  for i := 1 to lim do
    for j := 1 to 26 do
      exx[i,j]:= exord[j,i];
  for i := 1 to lim do
    begin
      l:= 1;
      m:= 1;
      for j := 1 to 26 do
        begin
          k:= char(96+j);
          case let[j] of
            true: begin
                    if pos(k,exx[i,m])>0 then
                      begin
                        if pos(#39,exx[i,m])=2 then
                          exnum[i,l]:= '0'
                        else
                          exnum[i,l]:= '1';
                        inc(m);
                      end
                    else
                      exnum[i,l]:= '_';
                    inc(l);
                  end;
            false: ;
          end;
        end;
    end;
  lim2:= lim;
end;
procedure expandir(i,j: integer);
var
  k: integer;
begin
  if exnum[i,j]='_' then
    begin
      inc(lim2);
      exnum[i,j]:= '1';
      for k := 1 to limlet do
        exnum[lim2,k]:= exnum[i,k];
      exnum[lim2,j]:= '0';
    end;
end;
procedure repetidos;
var
  i,j,k: integer;
  comp: array[1..1000] of string;
begin
  k:= 1;
  for i := 1 to lim2 do
    for j := 1 to limlet do
      comp[i]:= comp[i]+exnum[i,j];
  for i := 1 to lim2-1 do
    begin
      j:= i+1;
      while j<=lim2 do
        begin
          if comp[i]=comp[j] then
            comp[j]:= '';
          inc(j);
        end;
    end;
  for i := 1 to lim2 do
    begin
      for j := 1 to limlet do
        if comp[i]<>'' then
          exnum[k,j]:= comp[i][j];
      inc(k);
    end;
  lim2:= k-1;
end;
procedure simplificar;
var
  a,i,j,k,cont,pos,posprim,posl,lim22: integer;
  extab,exnum2: array [1..1000,1..26] of string;
  prueba: string;
  implicantes: array [1..100] of boolean;
  erro: boolean;
begin
  lim22:= lim2;
  for i := 1 to lim22 do
    for j := 1 to limlet do
      exnum2[i,j]:= exnum[i,j];
  for i := 1 to 1000 do
    for j := 1 to 26 do
      extab[i,j]:= '';
  for i := 1 to 100 do
    implprim[i]:= '';
  distintos:=1;
  posprim:= 1;
  for i := 1 to 100 do
    implicantes[i]:= false;
  while distintos<=limlet do
    begin
      posl:= 1;
      for i := 1 to lim22-1 do
        begin
          k:= i+1;
          while k<=lim22 do
            begin
              cont:= 0;
              pos:= 0;
              for j := 1 to limlet do
                begin
                  if exnum2[i,j]<>exnum2[k,j] then
                    begin
                      inc(cont);
                      pos:= j;
                    end;
                end;
              if cont=1 then
                begin
                  for j := 1 to limlet do
                    if j<>pos then
                      extab[posl,j]:= exnum2[i,j]
                    else
                      extab[posl,j]:= '_';
                  implicantes[i]:= true;
                  implicantes[k]:= true;
                  inc(posl);
                end;
              inc(k);
            end;
        end;
      for i := 1 to lim22 do
        begin
          if implicantes[i]=false then
            begin
              prueba:= '';
              for j := 1 to limlet do
                prueba:= prueba+exnum2[i,j];
              implprim[posprim]:= prueba;
              inc(posprim);
            end;
        end;
      for i := 1 to lim22 do
        for j := 1 to limlet do
          exnum2[i,j]:= '';
      for i := 1 to lim22 do
        implicantes[i]:= false;
      lim22:= posl-1;
      for i := 1 to lim22 do
        for j := 1 to limlet do
          begin
            exnum2[i,j]:= extab[i,j];
            extab[i,j]:= '';
          end;
      inc(distintos);
    end;
  lim2:= posprim-1;
end;
procedure repimp;
var
  i,j,k: integer;
  comp: array[1..100] of string;
begin
  k:= 1;
  for i := 1 to lim2 do
    comp[i]:= implprim[i];
  for i := 1 to lim2-1 do
    begin
      j:= i+1;
      while j<=lim2 do
        begin
          if comp[i]=comp[j] then
            comp[j]:= '';
          inc(j);
        end;
    end;
  for i := 1 to lim2 do
    if comp[i]<>'' then
      begin
        implprim[k]:= comp[i];
        inc(k);
      end;
  lim2:= k-1;
end;
procedure mostrar;
var
  i,j: integer;
begin
  for i := 1 to lim2 do
    begin
      for j := 1 to limlet do
        begin
          case implprim[i][j] of
            '0': form1.Edit2.Text:= form1.Edit2.Text+chr(96+j)+#39;
            '1': form1.Edit2.Text:= form1.Edit2.Text+chr(96+j);
            '_': ;
          end;
        end;
      if not(i=lim2) then
        form1.Edit2.Text:= form1.Edit2.Text+'+';
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  er: boolean;
  i,j: integer;
begin
  er:= verificar;
  if er=true then
    showmessage('Syntax Error')
  else
    begin
      expresiones;
      letras;
      ordenar;
      numerizar;
      i:= 1;
      repeat
        for j := 1 to limlet do
          expandir(i,j);
        inc(i);
      until (i=lim2);
      repetidos;
      simplificar;
      repimp;
      stringgrid1.ColCount:= limlet;
      stringgrid1.Rowcount:= lim2;
      for i := 1 to limlet do
        for j := 1 to lim2 do
          stringgrid1.Cells[i-1,j-1]:= (implprim[j][i]);
      stringgrid1.Show;
      mostrar;
    end;
end;
procedure TForm1.Edit1Change(Sender: TObject);
var
  i,len: integer;
  error: boolean;
begin
  error:= false;
  i:= 1;
  len:= length(edit1.Text);
  while (i<=len) and (error=false) do
    begin
      case edit1.Text[i] of
        'a'..'z': ;
        '+': ;
        #39: ;
      else
        error:= true;
      end;
      inc(i);
    end;
  if error=true then
    begin
      edit1.Text:= valed;
      edit1.SelStart:= i-2;
    end
  else
    valed:= edit1.Text;
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  valed:= '';
  for i := 1 to 26 do
    let[i]:= false;
  distintos:= 1;
end;
end.
