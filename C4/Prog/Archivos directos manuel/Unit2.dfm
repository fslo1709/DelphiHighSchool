object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 390
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 131
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 24
    Top = 171
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label3: TLabel
    Left = 24
    Top = 211
    Width = 24
    Height = 13
    Caption = 'Email'
  end
  object Label4: TLabel
    Left = 24
    Top = 251
    Width = 43
    Height = 13
    Caption = 'Direccion'
  end
  object Label5: TLabel
    Left = 24
    Top = 291
    Width = 26
    Height = 13
    Caption = 'Saldo'
  end
  object Edit1: TEdit
    Left = 105
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 22
    Width = 81
    Height = 35
    Caption = 'Buscar codigo'
    TabOrder = 1
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 248
    Top = 22
    Width = 353
    Height = 43
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 72
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 72
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit4: TEdit
    Left = 72
    Top = 208
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit5: TEdit
    Left = 72
    Top = 248
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Edit6: TEdit
    Left = 72
    Top = 288
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Button2: TButton
    Left = 72
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Modificar'
    TabOrder = 8
  end
end
