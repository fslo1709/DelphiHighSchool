program guitar_hero_;

uses
  Forms,
  guitar_hero in 'guitar_hero.pas' {Form1},
  compositor in 'compositor.pas' {Form2},
  play in 'play.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
