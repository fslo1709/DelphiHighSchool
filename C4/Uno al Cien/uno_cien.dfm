object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'String Grid'
  ClientHeight = 416
  ClientWidth = 287
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
    Left = 8
    Top = 8
    Width = 265
    Height = 265
    ColCount = 10
    DefaultColWidth = 24
    FixedCols = 0
    RowCount = 10
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 110
    Top = 289
    Width = 75
    Height = 25
    Caption = 'Llenar 1 y 0'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Borrar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Profundidad'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 289
    Width = 96
    Height = 25
    Caption = 'Llenar 1 al 100'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 351
    Width = 75
    Height = 25
    Caption = 'Invertir x'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 89
    Top = 352
    Width = 112
    Height = 25
    Caption = 'Invertir diagonal'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 170
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Invertir y'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 383
    Width = 113
    Height = 25
    Caption = 'Invertir diagonal 2'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 127
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Llenar 3'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 208
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Llenar 2'
    TabOrder = 10
    OnClick = Button10Click
  end
end
