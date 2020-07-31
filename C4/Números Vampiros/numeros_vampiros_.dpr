program numeros_vampiros_;

uses
  Forms,
  numeros_vampiros in 'numeros_vampiros.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
