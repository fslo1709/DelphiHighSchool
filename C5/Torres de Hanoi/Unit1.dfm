object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Torres de Hanoi'
  ClientHeight = 562
  ClientWidth = 740
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 120
    Top = 22
    Width = 132
    Height = 19
    Caption = 'N'#250'mero de Anillos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SpinEdit1: TSpinEdit
    Left = 272
    Top = 19
    Width = 49
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 10
    MinValue = 1
    ParentFont = False
    TabOrder = 0
    Value = 1
  end
  object Button1: TButton
    Left = 368
    Top = 19
    Width = 131
    Height = 29
    Caption = 'Comenzar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
