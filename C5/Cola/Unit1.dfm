object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Colas'
  ClientHeight = 90
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 40
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 200
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Ingresar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 288
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Mostrar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 136
    Top = 7
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
end
