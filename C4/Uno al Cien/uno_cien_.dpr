program uno_cien_;

uses
  Forms,
  uno_cien in 'uno_cien.pas' {Form1};

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
