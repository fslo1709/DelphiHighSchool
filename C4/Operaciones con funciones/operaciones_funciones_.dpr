program operaciones_funciones_;

uses
  Forms,
  operaciones_funciones in 'operaciones_funciones.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
