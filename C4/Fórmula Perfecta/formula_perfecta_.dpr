program formula_perfecta_;

uses
  Forms,
  Formula_perfecta in 'Formula_perfecta.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
