object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Stacks'
  ClientHeight = 230
  ClientWidth = 562
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
  object Edit1: TEdit
    Left = 16
    Top = 18
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 143
    Top = 8
    Width = 105
    Height = 41
    Caption = 'Push'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 143
    Top = 55
    Width = 105
    Height = 41
    Caption = 'Pop'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 254
    Top = 8
    Width = 105
    Height = 41
    Caption = 'Top'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 254
    Top = 55
    Width = 105
    Height = 41
    Caption = 'Empty'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 365
    Top = 8
    Width = 105
    Height = 41
    Caption = 'Make Null'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 143
    Top = 144
    Width = 105
    Height = 41
    Caption = 'Verificar'
    TabOrder = 6
  end
  object Edit2: TEdit
    Left = 16
    Top = 154
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '{[3+2*(7-4)-<4/5>]}'
  end
end
