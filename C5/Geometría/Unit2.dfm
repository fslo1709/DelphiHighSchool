object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Dimensiones'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 134
    Width = 71
    Height = 13
    Caption = 'Lados pol'#237'gono'
    Visible = False
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 177
    Height = 186
    Caption = 'Seleccione la figura geom'#233'trica'
    Items.Strings = (
      'Rect'#225'ngulo'
      'C'#237'rculo'
      'Tr'#237'angulo'
      'Pol'#237'gono'
      'Rombo'
      'Trapecio')
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object Button1: TButton
    Left = 208
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Continuar'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 304
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Salir'
    TabOrder = 2
  end
  object LabeledEdit1: TLabeledEdit
    Left = 208
    Top = 48
    Width = 121
    Height = 21
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = 'Base'
    TabOrder = 3
    Visible = False
  end
  object LabeledEdit2: TLabeledEdit
    Left = 208
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 29
    EditLabel.Height = 13
    EditLabel.Caption = 'Altura'
    TabOrder = 4
    Visible = False
  end
  object SpinEdit1: TSpinEdit
    Left = 288
    Top = 131
    Width = 41
    Height = 22
    MaxValue = 16
    MinValue = 5
    TabOrder = 5
    Value = 5
    Visible = False
  end
  object LabeledEdit3: TLabeledEdit
    Left = 335
    Top = 48
    Width = 91
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Base menor'
    TabOrder = 6
    Visible = False
  end
end
