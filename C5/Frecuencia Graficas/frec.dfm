object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Frecuencia de Letras'
  ClientHeight = 549
  ClientWidth = 779
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
    Left = 8
    Top = 8
    Width = 500
    Height = 533
  end
  object Label1: TLabel
    Left = 514
    Top = 80
    Width = 110
    Height = 16
    Caption = 'L'#237'nea menos larga:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 514
    Top = 102
    Width = 96
    Height = 16
    Caption = 'L'#237'nea m'#225's larga:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 514
    Top = 8
    Width = 257
    Height = 57
    Caption = 'Cargar Archivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 514
    Top = 124
    Width = 257
    Height = 417
    TabOrder = 1
  end
end
