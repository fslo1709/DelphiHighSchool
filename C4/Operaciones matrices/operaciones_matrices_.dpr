program operaciones_matrices_;

uses
  Forms,
  operaciones_matrices in 'operaciones_matrices.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
