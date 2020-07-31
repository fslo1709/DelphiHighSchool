program Intercambio_2_;

uses
  Forms,
  Intercambio_2 in 'Intercambio_2.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
