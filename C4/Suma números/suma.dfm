object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Suma dos n'#250'meros - Sebasti'#225'n L'#243'pez C4A'
  ClientHeight = 176
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 103
    Top = 43
    Width = 8
    Height = 13
    Caption = '+'
  end
  object Label2: TLabel
    Left = 188
    Top = 43
    Width = 8
    Height = 13
    Caption = '='
  end
  object Edit1: TEdit
    Left = 32
    Top = 40
    Width = 65
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 117
    Top = 40
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 202
    Top = 40
    Width = 65
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 32
    Top = 88
    Width = 235
    Height = 80
    Caption = 'Sumar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
end
