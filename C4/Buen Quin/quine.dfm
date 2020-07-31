object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Quine McCluskey'
  ClientHeight = 536
  ClientWidth = 569
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
    Left = 32
    Top = 136
    Width = 141
    Height = 19
    Caption = 'Implicantes Primos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 32
    Top = 49
    Width = 121
    Height = 41
    Caption = 'Reducir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 32
    Top = 16
    Width = 509
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 32
    Top = 96
    Width = 509
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 161
    Width = 509
    Height = 272
    DefaultColWidth = 50
    FixedCols = 0
    FixedRows = 0
    TabOrder = 3
    Visible = False
  end
end
