object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 224
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 40
    Top = 56
    Width = 265
    Height = 33
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object StringGrid2: TStringGrid
    Left = 40
    Top = 160
    Width = 265
    Height = 33
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
  end
  object SpinEdit1: TSpinEdit
    Left = 168
    Top = 112
    Width = 41
    Height = 22
    MaxValue = 10
    MinValue = 2
    TabOrder = 2
    Value = 5
    OnChange = SpinEdit1Change
  end
  object Button1: TButton
    Left = 392
    Top = 56
    Width = 75
    Height = 33
    Caption = 'Generar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 392
    Top = 160
    Width = 75
    Height = 33
    Caption = 'Ordenar'
    TabOrder = 4
    OnClick = Button2Click
  end
end
