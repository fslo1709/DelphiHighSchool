program Cuenta_regresiva_;

uses
  Forms,
  Cuenta_regresiva in 'Cuenta_regresiva.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
