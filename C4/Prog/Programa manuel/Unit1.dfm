object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 539
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 24
    Top = 363
    Width = 377
    Height = 33
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    ColWidths = (
      64)
  end
  object StringGrid2: TStringGrid
    Left = 24
    Top = 402
    Width = 377
    Height = 33
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 3
  end
  object Button2: TButton
    Left = 24
    Top = 441
    Width = 89
    Height = 43
    Caption = 'Merge'
    TabOrder = 4
    OnClick = Button2Click
  end
  object StringGrid3: TStringGrid
    Left = 24
    Top = 490
    Width = 569
    Height = 47
    RowCount = 1
    FixedRows = 0
    TabOrder = 5
  end
  object Button3: TButton
    Left = 440
    Top = 191
    Width = 75
    Height = 41
    Caption = 'Conteo'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 440
    Top = 119
    Width = 75
    Height = 41
    Caption = 'Bubble'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 440
    Top = 274
    Width = 75
    Height = 41
    Caption = 'Insercion'
    TabOrder = 8
    OnClick = Button5Click
  end
  object StringGrid4: TStringGrid
    Left = 24
    Top = 53
    Width = 393
    Height = 41
    RowCount = 1
    FixedRows = 0
    TabOrder = 9
  end
  object StringGrid5: TStringGrid
    Left = 24
    Top = 119
    Width = 393
    Height = 41
    RowCount = 1
    FixedRows = 0
    TabOrder = 10
  end
  object StringGrid6: TStringGrid
    Left = 24
    Top = 191
    Width = 393
    Height = 41
    RowCount = 1
    FixedRows = 0
    TabOrder = 11
  end
  object StringGrid7: TStringGrid
    Left = 24
    Top = 274
    Width = 393
    Height = 41
    RowCount = 1
    FixedRows = 0
    TabOrder = 12
  end
end
