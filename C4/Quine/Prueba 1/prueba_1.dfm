object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ordenar expresiones'
  ClientHeight = 414
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 72
    Top = 40
    Width = 153
    Height = 342
    TabOrder = 0
  end
  object Button1: TButton
    Left = 264
    Top = 40
    Width = 121
    Height = 25
    Caption = 'Generar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 264
    Top = 146
    Width = 121
    Height = 21
    EditLabel.Width = 102
    EditLabel.Height = 13
    EditLabel.Caption = 'Longitud expresiones'
    TabOrder = 2
  end
  object LabeledEdit2: TLabeledEdit
    Left = 264
    Top = 194
    Width = 121
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = 'N'#250'mero expresiones'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 264
    Top = 71
    Width = 121
    Height = 25
    Caption = 'Emparejar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
