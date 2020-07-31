object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Reloj - Sebasti'#225'n L'#243'pez, C4A'
  ClientHeight = 348
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 16
    Top = 24
    Width = 300
    Height = 300
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 248
    Top = 16
  end
end
