object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 459
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
  object Button1: TButton
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Texto'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 112
    Top = 24
    Width = 225
    Height = 169
    ColCount = 3
    FixedCols = 0
    RowCount = 100000000
    FixedRows = 0
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 16
  end
end
