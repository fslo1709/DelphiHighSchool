unit compositor;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MPlayer, StdCtrls, MMSystem;
type
  TForm2 = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Image2: TImage;
    MediaPlayer1: TMediaPlayer;
    Label1: TLabel;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
    procedure OnIdleHandler(Sender: TObject; var Done: Boolean);
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
  cancion: textfile;
  nombre: string;
  duraciong,duracionr,duraciony,duracionb,duraciono,t,r,s,u,v,notas: integer;
  valido1,validog,validor,validoy,validob,validoo,terminar: boolean;
implementation
uses guitar_hero, play;
{$R *.dfm}
procedure tform2.OnIdleHandler(Sender: TObject; var Done: Boolean);
const
  loop=50;
var
  tiempo: int64;
  x1,x2,x3,x4,x5: string;
begin
  if terminar=false then  begin
  tiempo:= timegettime;
  if getasynckeystate(81)<>0 then   //Letra Q
    begin
      if validog=true then
        begin
          shape1.Brush.Color:= clwhite;
          validog:= false;
          memo1.Lines.Add(inttostr(notas)+'G');
          r:= memo1.Lines.Count-1;
        end
      else
        inc(duraciong);
    end
  else
    begin
      shape1.Brush.Color:= clblack;
      validog:= true;
      x1:= copy(memo1.Lines[r],1,length(memo1.Lines[r])-1);
      if duraciong>4000 then
        memo1.Lines[r]:= x1+'-'+inttostr(strtoint(x1)+duraciong)+'G';
      duraciong:= 0;
    end;
  if getasynckeystate(87)<>0 then   //Letra W
    begin
      if validor=true then
        begin
          shape2.Brush.Color:= clwhite;
          validor:= false;
          memo1.Lines.Add(inttostr(notas)+'R');
          s:= memo1.Lines.Count-1;
        end
      else
        inc(duracionr);
    end
  else
    begin
      shape2.Brush.Color:= clblack;
      validor:= true;
      x2:= copy(memo1.Lines[s],1,length(memo1.Lines[s])-1);
      if duracionr>4000 then
        memo1.Lines[s]:= x2+'-'+inttostr(strtoint(x2)+duracionr)+'R';
      duracionr:= 0;
    end;
  if getasynckeystate(69)<>0 then   //Letra E
    begin
      if validoy=true then
        begin
          shape3.Brush.Color:= clwhite;
          validoy:= false;
          memo1.Lines.Add(inttostr(notas)+'Y');
          t:= memo1.Lines.Count-1;
        end
      else
        inc(duraciony);
    end
  else
    begin
      shape3.Brush.Color:= clblack;
      validoy:= true;
      x3:= copy(memo1.Lines[t],1,length(memo1.Lines[t])-1);
      if duraciony>4000 then
        memo1.Lines[t]:= x3+'-'+inttostr(strtoint(x3)+duraciony)+'Y';
      duraciony:= 0;
    end;
  if getasynckeystate(82)<>0 then   //Letra R
    begin
      if validob=true then
        begin
          shape4.Brush.Color:= clwhite;
          validob:= false;
          memo1.Lines.Add(inttostr(notas)+'B');
          u:= memo1.Lines.Count-1;
        end
      else
        inc(duracionb);
    end
  else
    begin
      shape4.Brush.Color:= clblack;
      validob:= true;
      x4:= copy(memo1.Lines[u],1,length(memo1.Lines[u])-1);
      if duracionb>4000 then
        memo1.Lines[u]:= x4+'-'+inttostr(strtoint(x4)+duracionb)+'B';
      duracionb:= 0;
    end;
  if getasynckeystate(84)<>0 then   //Letra T
    begin
      if validoo=true then
        begin
          shape5.Brush.Color:= clwhite;
          validoo:= false;
          memo1.Lines.Add(inttostr(notas)+'O');
          v:= memo1.Lines.Count-1;
        end
      else
        inc(duraciono);
    end
  else
    begin
      shape5.Brush.Color:= clblack;
      validoo:= true;
      x5:= copy(memo1.Lines[v],1,length(memo1.Lines[v])-1);
      if duraciono>4000 then
        memo1.Lines[v]:= x5+'-'+inttostr(strtoint(x5)+duraciono)+'O';
      duraciono:= 0;
    end;
  while (timegettime-tiempo<loop) do ;
  end
  else
    ;
  inc(notas);
  Done:= false;
end;
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;
procedure TForm2.FormCreate(Sender: TObject);
begin
  image2.Canvas.MoveTo(10,0);
  image2.Canvas.LineTo(10,500);
  image2.Canvas.MoveTo(100,0);
  image2.Canvas.LineTo(100,500);
  image2.Canvas.MoveTo(200,0);
  image2.Canvas.LineTo(200,500);
  image2.Canvas.MoveTo(300,0);
  image2.Canvas.LineTo(300,500);
  image2.Canvas.MoveTo(400,0);
  image2.Canvas.LineTo(400,500);
  image2.Canvas.MoveTo(490,0);
  image2.Canvas.LineTo(490,500);
  r:= 0;
  s:= 0;
  t:= 0;
  u:= 0;
  v:= 0;
  opendialog1.DefaultExt:= extractfilepath('guitar_hero_.exe');
end;
procedure TForm2.FormShow(Sender: TObject);
begin
  image1.Show;
  form2.Top:= 50;
  form2.Left:= 100;
  validog:= false;
  validor:= false;
  validoy:= false;
  validob:= false;
  validoo:= false;
end;
procedure TForm2.Label1Click(Sender: TObject);
var
  n: string;
begin
  if opendialog1.execute then
    begin
      mediaplayer1.FileName:= opendialog1.FileName;
      nombre:= copy(opendialog1.FileName,1,pos('.',opendialog1.FileName)-1);
      while pos('\',nombre)>0 do
        delete(nombre,1,pos('\',nombre));
      n:= nombre;
      mediaplayer1.Open;
      label1.Hide;
      label2.Show;
      validog:= true;
      validor:= true;
      validoy:= true;
      validob:= true;
      validoo:= true;
    end;
end;
procedure TForm2.Label2Click(Sender: TObject);
begin
  application.ProcessMessages;
  sleep(1000);
  mediaplayer1.Play;
  terminar:= false;
  notas:= 0;
  application.OnIdle:= OnIdleHandler;
  label2.Hide;
  label3.Show;
end;
procedure TForm2.Label3Click(Sender: TObject);
var
  i: integer;
begin
  terminar:= true;
  assignfile(cancion,nombre+'.txt');
  rewrite(cancion);
  for i := 0 to memo1.Lines.Count do
    writeln(cancion,memo1.Lines[i]);
  closefile(cancion);
  label3.Hide;
  label1.Show;
  mediaplayer1.Stop;
end;
procedure TForm2.Label4Click(Sender: TObject);
begin
  if mediaplayer1.FileName<>'' then
    mediaplayer1.Stop;
  form2.Hide;
  form1.show;
end;
end.
