unit Button;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses YOUR_FATE_IS;

{$R *.dfm}
var
  er: boolean;
  d,m,n: integer;
  name: string;
procedure TForm1.Button1Click(Sender: TObject);
begin
  er:= false;
  case combobox2.ItemIndex of
    -1: begin
          showmessage('PLEASE SELECT A MONTH');
          er:= true;
        end;
    0: m:= 1;
    1: m:= 2;
    2: m:= 3;
    3: m:= 4;
    4: m:= 5;
    5: m:= 6;
    6: m:= 7;
    7: m:= 8;
    8: m:= 9;
    9: m:= 10;
    10: m:= 11;
    11: m:= 12;
  end;
  if er=false then
  case combobox1.ItemIndex of
    -1: begin
          showmessage('PLEASE SELECT A DAY');
          er:= true;
        end;
    0: d:= 1;
    1: d:= 2;
    2: d:= 3;
    3: d:= 4;
    4: d:= 5;
    5: d:= 6;
    6: d:= 7;
    7: d:= 8;
    8: d:= 9;
    9: d:= 10;
    10: d:= 11;
    11: d:= 12;
    12: d:= 13;
    13: d:= 14;
    14: d:= 15;
    15: d:= 16;
    16: d:= 17;
    17: d:= 18;
    18: d:= 19;
    19: d:= 20;
    20: d:= 21;
    21: d:= 22;
    22: d:= 23;
    23: d:= 24;
    24: d:= 25;
    25: d:= 26;
    26: d:= 27;
    27: d:= 28;
    28: begin
          if m=2 then
            begin
              showmessage('YOU WERE BORN ON THE 29TH, LOSER');
              er:= true;
            end;
          d:= 29;
        end;
    29: begin
          if m=2 then
            begin
              showmessage('THERE IS NO FEBRUARY 30TH, DUMBASS!');
              er:= true;
            end
          else
            d:= 30;
        end;
    30: begin
          if m=2 then
            begin
              showmessage('THERE IS NO FEBRUARY 30TH, DUMBASS!');
              er:= true;
            end
          else
            if (m=4) or (m=6) or (m=9) or (m=11) then
              begin
                showmessage('THIS MONTH HAS NO 31ST, LEARN TO READ A CALENDAR, ANALPHABET!');
                er:= true;
              end
            else
              d:= 31;
        end;
  end;
  name:= edit1.Text;
  n:= length(edit1.Text);
  if er=false then
    begin
      form2.Show;
      form1.Hide;
    end;
end;
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  showmessage('YOU WILL DIE FOR NOT PLAYING THIS GAME!');
  application.Terminate;
end;
end.
