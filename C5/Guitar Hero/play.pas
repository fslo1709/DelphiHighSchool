unit play;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, StdCtrls, MMSystem;
type
  TForm3 = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    MediaPlayer1: TMediaPlayer;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label2Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure jugar;
  private
    { Private declarations }
    procedure OnIdleHandler(Sender: TObject; var Done: Boolean);
  public
    { Public declarations }
  end;
  TNote= class(tshape)
    private
      checkable: boolean;
      pos: real;
    public
      constructor spawn(col,duration: integer; long: boolean);
      procedure mover(j: boolean);
      procedure check(c:integer; m: boolean);
      destructor delete;
  end;
var
  Form3: TForm3;
  nombre: string;
  cancion: textfile;
  notes: array[0..5000] of tnote;
  tiemponotas,score,esp,negative,minnote,maxnote,line: integer;
  bandera,punteo: array [1..5] of boolean;
  bolesp,gameover: boolean;
implementation
uses guitar_hero;
{$R *.dfm}
constructor tnote.spawn(col,duration: Integer; long: boolean);
begin
  create(form3);
  parent:= form3;
  top:= 0;
  pos:= 0;
  if long=false then
    begin
      shape:= stEllipse;
      height:= 25;
      width:= 73;
      brush.Color:= clblack;
      pen.Width:= 6;
      case col of
        1:  begin
              pen.Color:= clgreen;
              left:= form3.Shape1.Left;
            end;
        2:  begin
              pen.Color:= clred;
              left:= form3.Shape2.Left;
            end;
        3:  begin
              pen.Color:= clyellow;
              left:= form3.Shape3.Left;
            end;
        4:  begin
              pen.Color:= clblue;
              left:= form3.Shape4.Left;
            end;
        5:  begin
              pen.Color:= $000989DF;
              left:= form3.Shape5.Left;
            end;
      end;
    end
  else
    begin
      shape:= stRectangle;
      height:= 25*duration;
      width:= 30;
      pen.Width:= 1;
      top:= 0-(25*duration);
      pen.Color:= clblack;
      case col of
        1:  begin
              brush.Color:= clgreen;
              left:= form3.shape1.Left+21;
            end;
        2:  begin
              brush.Color:= clred;
              left:= form3.Shape2.Left+21;
        end;
        3:  begin
              brush.Color:= clyellow;
              left:= form3.Shape3.Left+21;
        end;
        4: begin
              brush.Color:= clblue;
              left:= form3.Shape4.Left+21;
        end;
        5:  begin
              brush.Color:= $000989DF;
              left:= form3.Shape5.Left+21;
        end;
      end;
    end;
  checkable:= true;
  visible:= true;
  sendtoback;
end;
procedure tnote.check(c: Integer; m: boolean);
begin
  if checkable=true then
  if (m=false) then
  case c of
    1:begin
        if left=80 then
          if (top>429) and (top<469) then
            begin
              if (top>445) and (top<459) then
                begin
                  score:= score+70;
                  negative:= negative-1;
                end
              else
                score:= score+50;
              checkable:= false;
             end
          else
            punteo[1]:= false
          else
            punteo[1]:= false;
    end;
    2:begin
        if left=176 then
          if (top>429) and (top<469) then
            begin
              if (top>445) and (top<459) then
                begin
                  score:= score+70;
                  negative:= negative-1;
                end
              else
                score:= score+50;
               checkable:= false;
             end
          else
            punteo[2]:= false
          else
            punteo[2]:= false;
    end;
    3:begin
        if left=272 then
          if (top>429) and (top<469) then
            begin
              if (top>445) and (top<459) then
                begin
                  score:= score+70;
                  negative:= negative-1;
                end
              else
                score:= score+50;
               checkable:= false;
             end
          else
            punteo[3]:= false
          else
            punteo[3]:= false;
    end;
    4:begin
        if left=368 then
          if (top>429) and (top<469) then
            begin
              if (top>445) and (top<459) then
                begin
                  score:= score+70;
                  negative:= negative-1;
                end
              else
               score:= score+50;
               checkable:= false;
             end
          else
            punteo[4]:= false
          else
            punteo[4]:= false;
    end;
    5:begin
        if left=464 then
          if (top>429) and (top<469) then
            begin
              if (top>445) and (top<459) then
                begin
                  score:= score+70;
                  negative:= negative-1;
                end
              else
                score:= score+50;
               checkable:= false;
             end
          else
            punteo[5]:= false
          else
            punteo[5]:= false;
    end;
  end
  else
    ;
end;
procedure tnote.mover(j: boolean);
begin
  if top<=600 then
    begin
      top:= top+trunc(pos/15);
      if (checkable=true) and (top>475) then
        begin
          score:= score-10;
          checkable:= false;
        end;
    end
  else
    j:= false;
end;
destructor tnote.delete;
begin
  hide;
  inc(minnote);
  inherited;
end;
procedure tform3.jugar;
var
  a: string;
begin
  assignfile(cancion,nombre+'.txt');
  reset(cancion);
  while not(eof(cancion)) do
    begin
      readln(cancion,a);
      memo1.Lines.Add(a);
    end;
  closefile(cancion);
  line:= 0;
  label4.Show;
  label5.Show;
  minnote:= 0;
  maxnote:= 0;
  form3.Canvas.MoveTo(76,0);
  form3.Canvas.LineTo(76,475);
  form3.Canvas.MoveTo(156,0);
  form3.Canvas.LineTo(156,475);
  form3.Canvas.MoveTo(256,0);
  form3.Canvas.LineTo(256,475);
  form3.Canvas.MoveTo(356,0);
  form3.Canvas.LineTo(356,475);
  form3.Canvas.MoveTo(456,0);
  form3.Canvas.LineTo(456,475);
  form3.Canvas.MoveTo(556,0);
  form3.Canvas.LineTo(556,475);
  application.OnIdle:= OnIdleHandler;
end;
procedure tform3.OnIdleHandler(Sender: TObject; var Done: Boolean);
const
  loop=50;
var
  tiempo: int64;
  i,t: integer;
  nota,nota2,m: string;
  j,l: boolean;
begin
  tiempo:= timegettime;
  t:= tiemponotas;
  if tiemponotas=128 then
    mediaplayer1.Play;
  if gameover=false then begin
  for i := minnote to maxnote-1 do
    notes[i].pos:= notes[i].pos+1;
  if not(line=memo1.Lines.Count-1) then
  if pos('-',memo1.Lines[line])<>0 then
    begin
      m:= copy(memo1.Lines[line],1,length(memo1.Lines[line]));
      nota:= copy(m,1,pos('-',m)-1);
      delete(m,1,pos('-',m));
      nota2:= copy(m,1,length(m)-1);
      if strtoint(nota)=tiemponotas then  begin
      if pos('G',memo1.Lines[line])<>0 then
        begin
          m:= copy(memo1.Lines[line],1,length(memo1.Lines[line]));
          nota:= copy(m,1,pos('-',m)-1);
          delete(m,1,pos('-',m));
          nota2:= copy(m,1,length(m)-1);
          notes[maxnote]:= tnote.spawn(1,strtoint(nota2)-strtoint(nota),true);
          inc(maxnote);
          inc(line);
        end;
      if pos('R',memo1.Lines[line])<>0 then
        begin
          m:= copy(memo1.Lines[line],1,length(memo1.Lines[line]));
          nota:= copy(m,1,pos('-',m)-1);
          delete(m,1,pos('-',m));
          nota2:= copy(m,1,length(m)-1);
          notes[maxnote]:= tnote.spawn(2,strtoint(nota2)-strtoint(nota),true);
          inc(maxnote);
          inc(line);
        end;
      if pos('Y',memo1.Lines[line])<>0 then
        begin
          m:= copy(memo1.Lines[line],1,length(memo1.Lines[line]));
          nota:= copy(m,1,pos('-',m)-1);
          delete(m,1,pos('-',m));
          nota2:= copy(m,1,length(m)-1);
          notes[maxnote]:= tnote.spawn(3,strtoint(nota2)-strtoint(nota),true);
          inc(maxnote);
          inc(line);
        end;
      if pos('B',memo1.Lines[line])<>0 then
        begin
          m:= copy(memo1.Lines[line],1,length(memo1.Lines[line]));
          nota:= copy(m,1,pos('-',m)-1);
          delete(m,1,pos('-',m));
          nota2:= copy(m,1,length(m)-1);
          notes[maxnote]:= tnote.spawn(4,strtoint(nota2)-strtoint(nota),true);
          inc(maxnote);
          inc(line);
        end;
      if pos('O',memo1.Lines[line])<>0 then
        begin
          m:= copy(memo1.Lines[line],1,length(memo1.Lines[line]));
          nota:= copy(m,1,pos('-',m)-1);
          delete(m,1,pos('-',m));
          nota2:= copy(m,1,length(m)-1);
          notes[maxnote]:= tnote.spawn(5,strtoint(nota2)-strtoint(nota),true);
          inc(maxnote);
          inc(line);
        end;
      end;
    end
  else
    begin
      nota:= copy(memo1.Lines[line],1,length(memo1.Lines[line])-1);
      if pos('G',memo1.Lines[line])<>0 then                             //Q
        if tiemponotas=strtoint(nota) then
          begin
            notes[maxnote]:= tnote.spawn(1,0,false);
            inc(maxnote);
            inc(line);
          end;
      nota:= copy(memo1.Lines[line],1,length(memo1.Lines[line])-1);     //W
      if pos('R',memo1.Lines[line])<>0 then
        if tiemponotas=strtoint(nota) then
          begin
            notes[maxnote]:= tnote.spawn(2,0,false);
            inc(maxnote);
            inc(line);
          end;
      nota:= copy(memo1.Lines[line],1,length(memo1.Lines[line])-1);     //E
      if pos('Y',memo1.Lines[line])<>0 then
        if tiemponotas=strtoint(nota) then
          begin
            notes[maxnote]:= tnote.spawn(3,0,false);
            inc(maxnote);
            inc(line);
          end;
      nota:= copy(memo1.Lines[line],1,length(memo1.Lines[line])-1);     //R
      if pos('B',memo1.Lines[line])<>0 then
        if tiemponotas=strtoint(nota) then
          begin
            notes[maxnote]:= tnote.spawn(4,0,false);
            inc(maxnote);
            inc(line);
          end;
      nota:= copy(memo1.Lines[line],1,length(memo1.Lines[line])-1);     //T
      if pos('O',memo1.Lines[line])<>0 then
        if tiemponotas=strtoint(nota) then
          begin
            notes[maxnote]:= tnote.spawn(5,0,false);
            inc(maxnote);
            inc(line);
          end;
    end;
  if (getasynckeystate(81)<>0) then   //Letra Q
    begin
      if bandera[1]=true then begin
      shape1.Brush.Color:= clwhite;
      bandera[1]:= false;
      punteo[1]:= true;
      for i := minnote to maxnote-1 do
        begin
          notes[i].check(1,false);
        end;
      if punteo[1]=false then
        begin
          score:= score-10;
          negative:= negative+1;
        end
      end;
    end
  else
    begin
      shape1.Brush.Color:= clblack;
      bandera[1]:= true;
    end;
  if (getasynckeystate(87)<>0) then   //Letra W
    begin
      if bandera[2]=true then begin
      bandera[2]:= false;
      shape2.Brush.Color:= clwhite;
      punteo[2]:= true;
      for i := minnote to maxnote-1 do
        begin
          notes[i].check(2,false);
        end;
      if punteo[2]=false then
        begin
          score:= score-10;
          negative:= negative+1;
        end
      end;
    end
  else
    begin
      shape2.Brush.Color:= clblack;
      bandera[2]:=true;
    end;
  if getasynckeystate(69)<>0 then   //Letra E
    begin
      if bandera[3]=true then begin
      shape3.Brush.Color:= clwhite;
      bandera[3]:= false;
      punteo[3]:= true;
      for i := minnote to maxnote-1 do
        begin
          notes[i].check(3,false);
        end;
      if punteo[3]=false then
        begin
          score:= score-10;
          negative:= negative+1;
        end
      end;
    end
  else
    begin
      shape3.Brush.Color:= clblack;
      bandera[3]:= true;
    end;
  if getasynckeystate(82)<>0 then   //Letra R
    begin
      if bandera[4]=true then begin
      bandera[4]:= false;
      shape4.Brush.Color:= clwhite;
      punteo[4]:= true;
      for i := minnote to maxnote-1 do
        begin
          notes[i].check(4,false);
        end;
      if punteo[4]=false then
        begin
          score:= score-10;
          negative:= negative+1;
        end
      end;
    end
  else
    begin
      shape4.Brush.Color:= clblack;
      bandera[4]:= true;
    end;
  if getasynckeystate(84)<>0 then   //Letra T
    begin
      if bandera[5]=true then begin
      shape5.Brush.Color:= clwhite;
      bandera[5]:= false;
      punteo[5]:= true;
      for i := minnote to maxnote-1 do
        begin
          notes[i].check(5,false);
        end;
      if punteo[5]=false then
        begin
          score:= score-10;
          negative:= negative+1;
        end
      end;
    end
  else
    begin
      shape5.Brush.Color:= clblack;
      bandera[5]:= true;
    end;
  i:= minnote;
  while i < maxnote do
    begin
      j:= true;
      notes[i].mover(j);
      if j=false then
        begin
          notes[i].delete;
          notes[i]:= nil;
          inc(minnote);
        end;
      inc(i);
    end;
  while (timegettime-tiempo<loop) do ;
  if line=memo1.Lines.Count then
    begin
      if bolesp=true then
        begin
          bolesp:= false;
          esp:= tiemponotas;
        end;
      if tiemponotas=esp+160 then
        mediaplayer1.Stop;
    end;
  if negative=300 then
    gameover:= true;
  end
  else
    begin
      for i := minnote to maxnote-1 do
        begin
          notes[i].hide;
        end;
      shape1.Hide;
      shape2.Hide;
      shape3.Hide;
      shape4.Hide;
      shape5.Hide;
      form3.Canvas.Pen.Style:= psclear;
      form3.Canvas.Rectangle(0,0,600,600);
      form3.Canvas.Pen.Style:= pssolid;
      label3.Hide;
      mediaplayer1.Stop;
      label2.Left:= 277;
      label1.Show;
      label1.Left:= 224;
      label1.Top:= 200;
      showmessage('Game Over');
      application.Terminate;
    end;
  label5.Caption:= inttostr(score);
  inc(tiemponotas);
  Done:= false;
end;
procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;
procedure TForm3.FormCreate(Sender: TObject);
begin
  score:= 0;
  negative:= 0;
  form3.Top:= 50;
  form3.Left:= 100;
  tiemponotas:= 0;
  opendialog1.DefaultExt:= extractfilepath('guitar_hero_.exe');
end;
procedure TForm3.Label1Click(Sender: TObject);
var
  i: integer;
begin
  if opendialog1.Execute then
    begin
      label1.Left:= 0;
      label1.Top:= 600;
      label2.left:= 0;
      label1.Hide;
      shape1.Show;
      shape2.Show;
      shape3.Show;
      shape4.Show;
      shape5.Show;
      label3.Show;
      nombre:= opendialog1.FileName;
      while pos('\',nombre)>0 do
        delete(nombre,1,pos('\',nombre));
      label3.Caption:=copy(nombre,1,pos('.',nombre)-1);
      mediaplayer1.FileName:= label3.Caption+'.mp3';
      mediaplayer1.Open;
      nombre:= label3.caption;
      for i := 1 to 5 do
        bandera[i]:= true;
      for i := 1 to 5 do
        punteo[i]:= true;
      gameover:= false;
      form3.jugar;
    end;
end;
procedure TForm3.Label2Click(Sender: TObject);
begin
  if mediaplayer1.FileName<>'' then
    mediaplayer1.Stop;
  form3.Hide;
  form1.show;
end;
end.
