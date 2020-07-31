unit Unit2;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Math;
type
  TForm2 = class(TForm)
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    LabeledEdit3: TLabeledEdit;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form2: TForm2;
implementation
{$R *.dfm}
uses Unit1;
procedure TForm2.Button1Click(Sender: TObject);
var
  b,c: real;
begin
  try
  form1.orden:= spinedit1.Value;
  case radiogroup1.ItemIndex of
    0:begin
       form1.base:= strtofloat(labelededit1.Text);
       form1.altura:= strtofloat(labelededit2.Text);
       if form1.base<form1.altura then
         form1.radio:= form1.base/2
       else
         form1.radio:= form1.altura/2;
       form1.diag1:= form1.base;
       form1.diag2:= form1.altura;
       form1.lado:= form1.base;
       form1.arista:= form1.base*4/form1.orden;
       form1.base2:= form1.base/2;
      end;
    1:begin
       form1.radio:= strtofloat(labelededit1.Text);
       form1.base:= form1.radio*2;
       form1.altura:= form1.radio*2;
       form1.diag1:= form1.radio*2;
       form1.diag2:= form1.radio*2;
       form1.lado:= form1.radio*2;
       form1.arista:= form1.base*4/form1.orden;
       form1.base2:= form1.base/2;
    end;
    2:begin
       form1.lado:= strtofloat(labelededit1.Text);
       form1.base:= form1.lado;
       form1.altura:= form1.lado;
       form1.radio:= form1.lado/2;
       form1.diag1:= form1.radio*2;
       form1.diag2:= form1.radio*2;
       form1.arista:= form1.base*4/form1.orden;
       form1.base2:= form1.base/2;
    end;
    3:begin
       form1.arista:= strtofloat(labelededit1.Text);
       form1.base:= form1.arista*form1.orden/4;
       form1.altura:= form1.base;
       form1.radio:= form1.lado/2;
       form1.diag1:= form1.radio*2;
       form1.diag2:= form1.radio*2;
       form1.lado:= form1.radio*2;
       form1.base2:= form1.base/2;
    end;
    4:begin
      form1.diag1:= strtofloat(labelededit1.Text);
      form1.diag2:= strtofloat(labelededit2.Text);
      form1.base:= form1.diag1;
      form1.altura:= form1.diag2;
      if form1.base<form1.altura then
        form1.radio:= form1.base/2
      else
        form1.radio:= form1.altura/2;
      form1.lado:= form1.base;
      form1.arista:= form1.base*4/form1.orden;
      form1.base2:= form1.base/2;
    end;
    5:begin
       form1.base:= strtofloat(labelededit1.Text);
       form1.altura:= strtofloat(labelededit2.Text);
       form1.base2:= strtofloat(labelededit3.Text);
       if form1.base<form1.altura then
         form1.radio:= form1.base/2
       else
         form1.radio:= form1.altura/2;
       form1.diag1:= form1.base;
       form1.diag2:= form1.altura;
       form1.lado:= form1.base;
       form1.arista:= form1.base*4/form1.orden;
    end;
  end;
  form1.arec:= form1.base*form1.altura;
  form1.prec:= form1.base*2+form1.altura*2;
  form1.acir:= form1.radio*form1.radio*pi;
  form1.pcir:= form1.radio*2*pi;
  form1.atri:= sqrt(form1.base*form1.base-(form1.base*form1.base/4));
  form1.ptri:= form1.base*3;
  b:= form1.base;
  c:= form1.orden;
  form1.apol:= ((c*b*b/(4*tan(degtorad(180/c))))*b)/3;
  form1.ppol:= b*c;
  form1.arom:= form1.base*form1.altura/2;
  form1.prom:= form1.base*2+form1.altura*2;
  form1.atra:= ((form1.base+(form1.base/2))*form1.altura)/2;
  form1.ptra:= form1.base+form1.base/2+sqrt((form1.base*form1.base/16)+(form1.altura*form1.altura))*2;
  while form1.base/10 < 1 do
    begin
      form1.base:= form1.base*10;
      form1.altura:= form1.altura*10;
      form1.radio:= form1.radio*10;
      form1.diag1:= form1.diag1*10;
      form1.diag2:= form1.diag2*10;
      form1.lado:= form1.lado*10;
      form1.arista:= form1.arista*10;
      form1.base2:= form1.base2*10;
    end;
  while form1.base/10 > 10 do
    begin
      form1.base:= form1.base/10;
      form1.altura:= form1.altura/10;
      form1.radio:= form1.radio/10;
      form1.diag1:= form1.diag1/10;
      form1.diag2:= form1.diag2/10;
      form1.lado:= form1.lado/10;
      form1.arista:= form1.arista/10;
      form1.base2:= form1.base2/10;
    end;
  form1.Show;
  form1.PageControl1.ActivePageIndex:= 0;
  with form1 do
    begin
      label3.Caption:= 'Área: '+floattostrf(arec,fffixed,5,3);
      label4.Caption:= 'Perímetro: '+floattostrf(prec,fffixed,5,3);
      label5.Caption:= 'Área: '+floattostrf(acir,fffixed,5,3);
      label6.Caption:= 'Perímetro: '+floattostrf(pcir,fffixed,5,3);
      label7.Caption:= 'Área: '+floattostrf(atri,fffixed,5,3);
      label8.Caption:= 'Perímetro: '+floattostrf(ptri,fffixed,5,3);
      label9.Caption:= 'Área: '+floattostrf(apol,fffixed,5,3);
      label10.Caption:= 'Perímetro: '+floattostrf(ppol,fffixed,5,3);
      label11.Caption:= 'Área: '+floattostrf(arom,fffixed,5,3);
      label12.Caption:= 'Perímetro: '+floattostrf(prom,fffixed,5,3);
      label13.Caption:= 'Área: '+floattostrf(atra,fffixed,5,3);
      label14.Caption:= 'Perímetro: '+floattostrf(ptra,fffixed,5,3);
    end;
  form2.Hide;
  form1.Image5.Picture:= nil;
  form1.poligono(form1.image5,50,50,40,form1.orden);
  except
    showmessage('Error');
  end;
end;
procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  application.Terminate;
end;
procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  button1.Show;
  labelededit3.hide;
  spinedit1.Show;
  label1.Show;
  case radiogroup1.ItemIndex of
    0:begin
      labelededit1.EditLabel.Caption:= 'Base';
      labelededit2.EditLabel.Caption:= 'Altura';
      labelededit1.Show;
      labelededit2.Show;
    end;
    1:begin
      labelededit1.EditLabel.Caption:= 'Radio';
      labelededit1.Show;
      labelededit2.Hide;
    end;
    2:begin
      labelededit1.EditLabel.Caption:= 'Lado';
      labelededit1.Show;
      labelededit2.Hide;
    end;
    3:begin
      labelededit1.Show;
      labelededit1.editlabel.caption:= 'Arista';
      labelededit2.Hide;
    end;
    4:begin
      labelededit1.EditLabel.Caption:= 'Diagonal 1';
      labelededit2.EditLabel.Caption:= 'Diagonal 2';
      labelededit1.Show;
      labelededit2.Show;
    end;
    5:begin
      labelededit1.EditLabel.Caption:= 'Base mayor';
      labelededit1.EditLabel.Caption:= 'Altura';
      labelededit1.Show;
      labelededit2.Show;
      labelededit3.show;
    end;
  end;
end;
end.
