program Suma_Memo_;

uses
  Forms,
  Suma_Memo in 'Suma_Memo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
