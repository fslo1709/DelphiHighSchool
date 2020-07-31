program Death_Program;

uses
  Forms,
  Button in 'Button.pas' {Form1},
  YOUR_FATE_IS in 'YOUR_FATE_IS.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
