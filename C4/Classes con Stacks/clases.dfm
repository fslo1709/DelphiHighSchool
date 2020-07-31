object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Stacks'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Push'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 96
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Pop'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 184
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Top'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 273
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Empty'
    TabOrder = 3
    OnClick = Button4Click
  end
end
