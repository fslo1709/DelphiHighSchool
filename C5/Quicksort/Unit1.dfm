object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Quicksort'
  ClientHeight = 171
  ClientWidth = 501
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
    Left = 136
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Ordenar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Left = 40
    Top = 16
    Width = 433
    Height = 57
    ColCount = 10
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    Visible = False
  end
  object SpinEdit1: TSpinEdit
    Left = 136
    Top = 88
    Width = 75
    Height = 22
    MaxValue = 5000
    MinValue = 1
    TabOrder = 3
    Value = 10
  end
end
