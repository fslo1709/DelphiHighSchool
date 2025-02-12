unit blackjack_;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, StdCtrls;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image2: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label13Click(Sender: TObject);
    procedure Label14Click(Sender: TObject);
    procedure Shape2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape5MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure play(x: boolean);
    procedure addbet(c: integer);
    procedure apuestas(x: integer; d: boolean);
    procedure limpiar;
  end;
  type
    tcartas = class
    public
      constructor spawn;
      procedure shuffle;
      procedure repartir;
    private
      deck: array [0..103] of integer;
  end;
  type
    tmeow = class(timage)
    public
      constructor spawn(tipo: boolean; ca: boolean);
  end;
  type
    tjuego = class
    public
      lose: boolean;
      suma: integer;
      constructor empezar;
      procedure sumar(valor: integer; xyz: integer);
  end;
var
  Form1: TForm1;
  nombre: string;
  meowdeck: tcartas;
  cards: array[1..28] of tmeow;
  poshouse,posplayer,cash,sp,jh,jp,tp,bet,bet2: integer;
  juegoh,juegop,juego2: array[1..10] of tjuego;
implementation
{$R *.dfm}
procedure tform1.limpiar;
var
  i: integer;
begin
  label8.Caption:= 'Score: ';
  for i := 1 to 10 do
    begin
      juegoh[i].Free;
      juegop[i].Free;
      juego2[i].Free;
    end;
  tp:= 1;
  bet:= 0;
  bet2:= 0;
  poshouse:= 130;
  posplayer:= 363;
  meowdeck.Free;
  label1.Hide;
  edit1.Hide;
  button1.Hide;
  edit1.Text:= 'Player 1';
  label2.Show;
  label2.Caption:= nombre;
  form1.Width:= 818;
  form1.Height:= 542;
  form1.Top:= 100;
  cash:= 1000;
  image2.Show;
  label7.Show;
  shape1.Show;
  shape2.Show;
  shape3.Show;
  shape4.Show;
  shape5.Show;
  label10.Show;
  label11.Show;
  label12.Show;
  label13.Show;
  label14.Show;
  jh:= 0;
  jp:= 0;
  meowdeck:= tcartas.spawn;
end;
procedure tform1.addbet(c: Integer);
begin
  if c<=cash then
    begin
      bet:= bet+c;
      cash:= cash-c;
      label15.Caption:= 'Bet: '+inttostr(bet);
      label9.Caption:= 'Cash: '+inttostr(cash);
      play(true);
    end
  else
    showmessage('No tiene tanto dinero');
end;
procedure tform1.play(x: Boolean);
begin
  if x then
    begin
      label4.Show;
      label5.Show;
      label3.Show;
    end
  else
    begin
      label4.Hide;
      label5.Hide;
      label6.Hide;
      label3.Hide;
    end;
end;
procedure tform1.apuestas(x: Integer; d: boolean);
begin
  if d then
    case x of
      1:begin
          cash:= cash+2*bet2;
          bet2:= 0;
        end;
      2:begin
          bet2:= 0;
        end;
      3:begin
          cash:= cash+(bet2 div 2)*5;
          bet2:= 0;
        end;
    end
  else
    case x of
      1:begin
          cash:= cash+2*bet;
          bet:= 0;
        end;
      2:begin
          bet:= 0;
        end;
      3:begin
          cash:= cash+(bet div 2)*5;
          bet:= 0;
        end;
    end;
  label15.Caption:= 'Bet: 0';
  label9.Caption:= 'Cash: '+inttostr(cash);
end;
procedure TForm1.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  addbet(5);
end;
procedure TForm1.Shape2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  addbet(10);
end;
procedure TForm1.Shape3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  addbet(50);
end;
procedure TForm1.Shape4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  addbet(100);
end;
procedure TForm1.Shape5MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  addbet(1000);
end;
constructor tjuego.empezar;
begin
  suma:= 0;
  lose:= false;
end;
constructor tmeow.spawn(tipo: boolean; ca: boolean);
begin
  create(form1);
  parent:= form1;
  if tipo=true then
    begin
      left:= poshouse;
      top:= 100;
      poshouse:= poshouse+30;
    end
  else
    begin
      left:= posplayer;
      top:= 350;
      posplayer:= posplayer+30;
    end;
  height:= 73;
  width:= 57;
  visible:= true;
  bringtofront;
  if ca=false then
    picture.LoadFromFile(getcurrentdir+'\Cartas\0.png')
  else
    picture.LoadFromFile(getcurrentdir+'\Cartas\'+form1.Memo1.Lines[sp]+'.bmp');
  if sp=0 then
    sp:= 103
  else
    dec(sp);
  bringtofront;
end;
constructor tcartas.spawn;
var
  i: integer;
begin
  for i:= 0 to 103 do
    deck[i]:= i;
  sp:= 103;
  poshouse:= 130;
  posplayer:= 363;
  shuffle;
  repartir;
end;
procedure tcartas.shuffle;
var
  i,j,a: integer;
begin
  form1.Memo1.Lines.Clear;
  i:= 103;
  while i>0 do
    begin
      j:= random(i);
      a:= deck[j];
      deck[j]:= deck[i];
      deck[i]:= a;
      dec(i);
    end;
  for i := 0 to 103 do
    form1.Memo1.Lines.Add(inttostr((deck[i] div 8) +1)+char((deck[i] mod 4)+97));
  for i := 1 to 28 do
    cards[i].Free;
end;
procedure tjuego.sumar(valor: Integer; xyz: integer);
begin
  if valor>9 then
    suma:= suma+10
  else
    if valor=1 then
      begin
        if xyz=1 then
          begin
            inc(jh);
            juegoh[jh]:= tjuego.empezar;
            juegoh[jh].suma:= suma+1;
            if juegoh[jh].suma>21 then
              juegoh[jh].lose:= true;
          end;
        if xyz=2 then
          begin
            inc(jp);
            juegop[jp]:= tjuego.empezar;
            juegop[jp].suma:= suma+1;
            if juegop[jp].suma>21 then
              juegop[jp].lose:= true;
          end;
        suma:= suma+11;
      end
    else
      suma:= suma+valor;
  if suma>21 then
    lose:= true;
end;
procedure tcartas.repartir;
var
  i,j: integer;
begin
  jh:= 1;
  juegoh[jh]:= tjuego.empezar;
  jp:= 1;
  juegop[jp]:= tjuego.empezar;
  i:= 1;
  j:= jh;
  while i<=j do
    begin
      juegoh[i].sumar((deck[sp] div 8)+1,1);
      inc(i);
    end;
  cards[1]:= tmeow.spawn(true, false);
  i:= 1;
  j:= jp;
  while i<=j do
    begin
      juegop[i].sumar((deck[sp] div 8)+1,2);
      inc(i);
    end;
  cards[2]:= tmeow.spawn(false, true);
  i:= 1;
  j:= jh;
  while i<=j do
    begin
      juegoh[i].sumar((deck[sp] div 8)+1,1);
      inc(i);
    end;
  cards[3]:= tmeow.spawn(true, true);
  i:= 1;
  j:= jp;
  while i<=j do
    begin
      juegop[i].sumar((deck[sp] div 8)+1,2);
      inc(i);
    end;
  cards[4]:= tmeow.spawn(false, true);
  i:= 1;
  form1.Label8.Caption:= 'Score: ';
  while i<=jp do
    begin
      form1.Label8.Caption:= form1.Label8.Caption+inttostr(juegop[i].suma)+' ';
      inc(i);
    end;
  tp:= 5;
  if juegoh[1].suma=21 then
    begin
      showmessage('Perdi�!');
      form1.apuestas(2,false);
      form1.limpiar;
    end;
  if juegop[1].suma=21 then
    begin
      showmessage('Blackjack!');
      form1.apuestas(3,false);
      form1.limpiar;
    end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  nombre:= edit1.Text;
  image1.Picture.LoadFromFile('blackjack.png');
  label1.Hide;
  edit1.Hide;
  button1.Hide;
  edit1.Text:= 'Player 1';
  label2.Show;
  label2.Caption:= nombre;
  form1.Width:= 818;
  form1.Height:= 542;
  form1.Top:= 100;
  cash:= 1000;
  image2.Show;
  label7.Show;
  shape1.Show;
  shape2.Show;
  shape3.Show;
  shape4.Show;
  shape5.Show;
  label10.Show;
  label11.Show;
  label12.Show;
  label13.Show;
  label14.Show;
  meowdeck:= tcartas.spawn;
end;
procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  form1.Height:= 300;
  form1.Width:= 300;
  form1.Left:= 150;
  form1.Top:= 150;
  jh:= 0;
  jp:= 0;
  doublebuffered:= true;
end;
procedure TForm1.FormShow(Sender: TObject);
begin
  button1.SetFocus;
end;
procedure TForm1.Label10Click(Sender: TObject);
begin
  addbet(5);
end;
procedure TForm1.Label11Click(Sender: TObject);
begin
  addbet(10);
end;
procedure TForm1.Label12Click(Sender: TObject);
begin
  addbet(50);
end;
procedure TForm1.Label13Click(Sender: TObject);
begin
  addbet(100);
end;
procedure TForm1.Label14Click(Sender: TObject);
begin
  addbet(1000);
end;
procedure TForm1.Label3Click(Sender: TObject);
var
  i,j,lose: integer;
begin
  i:= 1;
  j:= jp;
  while i<=j do
    begin
      juegop[i].sumar((meowdeck.deck[sp] div 8)+1,2);
      inc(i);
    end;
  cards[tp]:= tmeow.spawn(false,true);
  inc(tp);
  i:= 1;
  lose:= 0;
  while i<=jp do
    begin
      if (juegop[i].lose)=true then
        inc(lose);
      inc(i);
    end;
  form1.Label8.Caption:= 'Score: ';
  i:= 1;
  j:= jp;
  while i<=j do
    begin
      form1.Label8.Caption:= form1.Label8.Caption+inttostr(juegop[i].suma)+' ';
      inc(i);
    end;
  if lose=jp then
    begin
      showmessage('Perdi�');
      form1.limpiar;
    end;
end;
procedure TForm1.Label4Click(Sender: TObject);
var
  i,j,mp,mh: integer;
begin
  label3.Hide;
  label4.Hide;
  label5.Hide;
  label6.Hide;
  while juegoh[jh].suma<17 do
    begin
      i:= 1;
      j:= jh;
      while i<=j do
        begin
          juegoh[i].sumar((meowdeck.deck[sp] div 8)+1,2);
          inc(i);
        end;
      cards[tp]:= tmeow.spawn(true,true);
      inc(tp);
    end;
  sp:= 103;
  cards[tp]:= tmeow.spawn(true,true);
  cards[1].hide;
  mp:= 0;
  mh:= 0;
  i:= 1;
  j:= jp;
  while i<=j do
    begin
      if ((juegop[i].lose=false) and (juegop[i].suma>mp)) then
        mp:= juegop[i].suma;
      inc(i);
    end;
  i:= 1;
  j:= jh;
  while i<=j do
    begin
      if ((juegoh[i].lose=false) and (juegoh[i].suma>mh)) then
        mh:= juegoh[i].suma;
      inc(i);
    end;
  if mp>mh then
    begin
      showmessage('Gan�');
      apuestas(1,false);
    end
  else
    begin
      showmessage('Perdi�');
      apuestas(2,false);
    end;
  limpiar;
  tp:= 1;
end;
procedure TForm1.Label5Click(Sender: TObject);
var
  i,j,lose,mh,mp: integer;
begin
  label3.Hide;
  label4.Hide;
  label5.Hide;
  label6.Hide;
  i:= 1;
  j:= jp;
  while i<=j do
    begin
      juegop[i].sumar((meowdeck.deck[sp] div 8)+1,2);
      inc(i);
    end;
  cards[tp]:= tmeow.spawn(false,true);
  inc(tp);
  i:= 1;
  lose:= 0;
  while i<=jp do
    begin
      if (juegop[i].lose)=true then
        inc(lose);
      inc(i);
    end;
  i:= 1;
  form1.Label8.Caption:= 'Score: ';
  while i<=jp do
    begin
      form1.Label8.Caption:= form1.Label8.Caption+inttostr(juegop[i].suma)+' ';
      inc(i);
    end;
  if lose=jp then
    showmessage('Perdi�')
  else
    begin
      while juegoh[jh].suma<17 do
        begin
          i:= 1;
          j:= jh;
          while i<=j do
            begin
              juegoh[i].sumar((meowdeck.deck[sp] div 8)+1,2);
              inc(i);
            end;
          cards[tp]:= tmeow.spawn(true,true);
          inc(tp);
        end;
      cards[tp]:= tmeow.spawn(true,true);
      cards[1].Hide;
      mp:= 0;
      mh:= 0;
      i:= 1;
      j:= jp;
      while i<=j do
        begin
          if ((juegop[i].lose=false) and (juegop[i].suma>mp)) then
            mp:= juegop[i].suma;
          inc(i);
        end;
      i:= 1;
      j:= jh;
      while i<=j do
        begin
          if ((juegoh[i].lose=false) and (juegoh[i].suma>mh)) then
            mh:= juegoh[i].suma;
          inc(i);
        end;
      if mp>mh then
        showmessage('Gan�')
      else
        showmessage('Perdi�');
    end;
end;
procedure TForm1.Label6Click(Sender: TObject);
begin
  juego2[1]:= tjuego.empezar;
  juego2[1].suma:= 10;
end;
end.
