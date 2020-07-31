object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 367
  ClientWidth = 332
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
    Left = 64
    Top = 80
    Width = 219
    Height = 257
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 64
    Top = 30
    Width = 121
    Height = 25
    TabOrder = 1
  end
  object Button1: TButton
    Left = 208
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Ingresar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
  end
end
