object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Death Program'
  ClientHeight = 162
  ClientWidth = 220
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 50
    Width = 46
    Height = 16
    Caption = 'Birthday'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 24
    Top = 112
    Width = 177
    Height = 25
    Caption = 'Click here to know your fate'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 16
    Width = 177
    Height = 21
    TabOrder = 1
    Text = 'NAME'
  end
  object ComboBox1: TComboBox
    Left = 81
    Top = 72
    Width = 41
    Height = 21
    TabOrder = 2
    Text = 'DD'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12'
      '13'
      '14'
      '15'
      '16'
      '17'
      '18'
      '19'
      '20'
      '21'
      '22'
      '23'
      '24'
      '25'
      '26'
      '27'
      '28'
      '29'
      '30'
      '31')
  end
  object ComboBox2: TComboBox
    Left = 24
    Top = 72
    Width = 41
    Height = 21
    TabOrder = 3
    Text = 'MM'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
end
