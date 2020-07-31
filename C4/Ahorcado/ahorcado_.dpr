program ahorcado_;

uses
  Forms,
  ahorcado in 'ahorcado.pas' {Form1},
  ahorcado2 in 'ahorcado2.pas' {Form2},
  ahorcado3 in 'ahorcado3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
