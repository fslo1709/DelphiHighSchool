object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Opciones de juego'
  ClientHeight = 238
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 88
    Height = 25
    Caption = 'Dificultad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = Label1Click
  end
  object Button1: TButton
    Left = 24
    Top = 64
    Width = 113
    Height = 49
    Caption = 'F'#225'cil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 119
    Width = 113
    Height = 49
    Caption = 'Normal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 174
    Width = 113
    Height = 49
    Caption = 'Dif'#237'cil'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button3Click
  end
  object RadioGroup1: TRadioGroup
    Left = 168
    Top = 24
    Width = 129
    Height = 199
    Caption = 'Tiempo por letra'
    ItemIndex = 2
    Items.Strings = (
      '5'
      '7'
      '10'
      '12'
      'Infinito')
    TabOrder = 3
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 303
    Top = 24
    Width = 98
    Height = 199
    Caption = 'Intentos'
    ItemIndex = 1
    Items.Strings = (
      '4'
      '5'
      '6'
      '7')
    TabOrder = 4
    OnClick = RadioGroup2Click
  end
end
