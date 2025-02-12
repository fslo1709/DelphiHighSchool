unit Unit1;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls;
type
  TNombres = record
    Codigo: integer;
    Nombre: string[30];
    Direccion: string[30];
    Email: string[40];
    saldo: real;
  end;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    LabeledEdit5: TLabeledEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ar: file of tnombres;
    procedure abrir;
  end;
var
  Form1: TForm1;
implementation
uses Unit2;
{$R *.dfm}
procedure tform1.abrir;
var
  d: tnombres;
  i: integer;
begin
  i:= 1;
  reset(ar);
  while not(eof(ar)) do
    begin
      read(ar,d);
      stringgrid1.Cells[0,i]:= inttostr(d.Codigo);
      stringgrid1.Cells[1,i]:= d.Nombre;
      stringgrid1.Cells[2,i]:= d.Direccion;
      stringgrid1.Cells[3,i]:= d.Email;
      stringgrid1.Cells[4,i]:= floattostr(d.saldo);
      inc(i);
    end;
  closefile(ar);
  stringgrid1.RowCount:= i;
end;
procedure TForm1.Button1Click(Sender: TObject);
var
  d: tnombres;
begin
  reset(ar);
  seek(ar,filesize(ar));
  d.Codigo:= strtoint(labelededit5.Text);
  d.Nombre:= labelededit1.Text;
  d.Direccion:= labelededit2.Text;
  d.Email:= labelededit3.Text;
  d.saldo:= strtofloat(labelededit4.Text);
  write(ar,d);
  closefile(ar);
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  d,e: tnombres;
  i,j: integer;
begin
  reset(ar);
  i:= 0;
  while i<filesize(ar) do
    begin
      seek(ar,i);
      read(ar,d);
      j:= i+1;
      while j<filesize(ar) do
        begin
          seek(ar,j);
          read(ar,e);
          if e.Codigo<=d.Codigo then
            begin
              seek(ar,j);
              write(ar,d);
              seek(ar,i);
              write(ar,e);
              d:=e;
            end;
          inc(j);
        end;
      inc(i);
    end;
  reset(ar);
  i:= 1;
  while not(eof(ar)) do
    begin
      read(ar,d);
      stringgrid1.Cells[0,i]:= inttostr(d.Codigo);
      stringgrid1.Cells[1,i]:= d.Nombre;
      stringgrid1.Cells[2,i]:= d.Direccion;
      stringgrid1.Cells[3,i]:= d.Email;
      stringgrid1.Cells[4,i]:= floattostr(d.saldo);
      inc(i);
    end;
  closefile(ar);
end;
procedure TForm1.Button3Click(Sender: TObject);
var
  d,e: tnombres;
  i,j: integer;
begin
  reset(ar);
  i:= 0;
  while i<filesize(ar) do
    begin
      seek(ar,i);
      read(ar,d);
      j:= i+1;
      while j<filesize(ar) do
        begin
          seek(ar,j);
          read(ar,e);
          if AnsiUpperCase(e.Nombre)<=AnsiUpperCase(d.Nombre) then
            begin
              seek(ar,j);
              write(ar,d);
              seek(ar,i);
              write(ar,e);
              d:=e;
            end;
          inc(j);
        end;
      inc(i);
    end;
  reset(ar);
  i:= 1;
  while not(eof(ar)) do
    begin
      read(ar,d);
      stringgrid1.Cells[0,i]:= inttostr(d.Codigo);
      stringgrid1.Cells[1,i]:= d.Nombre;
      stringgrid1.Cells[2,i]:= d.Direccion;
      stringgrid1.Cells[3,i]:= d.Email;
      stringgrid1.Cells[4,i]:= floattostr(d.saldo);
      inc(i);
    end;
  closefile(ar);
end;
procedure TForm1.Button4Click(Sender: TObject);
var
  k,i,j: integer;
begin
  k:= MessageDlg('�Est� seguro que quiere borrar todos los registros?',mtWarning,mbOKCancel,0);
  if k=mrOK then
    begin
      rewrite(ar);
      closefile(ar);
      for i := 1 to stringgrid1.RowCount-1 do
        for j := 0 to 4 do
          stringgrid1.Cells[j,i]:= '';
      stringgrid1.RowCount:= 1;
    end;
end;
procedure TForm1.Button5Click(Sender: TObject);
begin
  abrir;
end;
procedure TForm1.Button6Click(Sender: TObject);
begin
  form2.show;
  form1.Hide;
end;
procedure TForm1.FormCreate(Sender: TObject);
var
  d: tnombres;
  i: integer;
begin
  i:= 1;
  assignfile(ar,'datos.c5');
  reset(ar);
  stringgrid1.RowCount:= filesize(ar)+1;
  stringgrid1.FixedRows:= 1;
  if filesize(ar)>0 then
    while not(eof(ar)) do
      begin
        read(ar,d);
        stringgrid1.Cells[0,i]:= inttostr(d.Codigo);
        stringgrid1.Cells[1,i]:= d.Nombre;
        stringgrid1.Cells[2,i]:= d.Direccion;
        stringgrid1.Cells[3,i]:= d.Email;
        stringgrid1.Cells[4,i]:= floattostr(d.saldo);
        inc(i);
      end;
  closefile(ar);
  stringgrid1.Cells[0,0]:= 'C�digo';
  stringgrid1.Cells[1,0]:= 'Nombre';
  stringgrid1.Cells[2,0]:= 'Direcci�n';
  stringgrid1.Cells[3,0]:= 'E-mail';
  stringgrid1.Cells[4,0]:= 'Saldo';
end;
end.
