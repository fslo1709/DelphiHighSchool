program Programa_Triple_;

uses
  Forms,
  Programa_Triple in 'Programa_Triple.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
