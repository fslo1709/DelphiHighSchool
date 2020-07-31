program Desea_continuar_;

uses
  Forms,
  Desea_continuar in 'Desea_continuar.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
