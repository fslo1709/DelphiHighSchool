program infix_posfix_;

uses
  Forms,
  infix_posfix in 'infix_posfix.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
