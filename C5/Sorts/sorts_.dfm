object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Sorts'
  ClientHeight = 193
  ClientWidth = 358
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 32
    Width = 265
    Height = 51
    ColCount = 1000
    DefaultColWidth = 25
    DefaultRowHeight = 25
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 136
    Width = 103
    Height = 41
    Caption = 'Bubble Sort'
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 117
    Top = 136
    Width = 103
    Height = 41
    Caption = 'Inserci'#243'n'
    TabOrder = 2
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 226
    Top = 136
    Width = 103
    Height = 41
    Caption = 'Conteo'
    TabOrder = 3
    Visible = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 117
    Top = 89
    Width = 103
    Height = 41
    Caption = 'Generar'
    TabOrder = 4
    OnClick = Button4Click
  end
  object SpinEdit1: TSpinEdit
    Left = 279
    Top = 32
    Width = 66
    Height = 33
    EditorEnabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxValue = 1000
    MinValue = 2
    ParentFont = False
    TabOrder = 5
    Value = 1000
    OnChange = SpinEdit1Change
  end
end
