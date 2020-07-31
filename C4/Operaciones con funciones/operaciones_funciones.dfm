object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Operaciones procedimientos'
  ClientHeight = 385
  ClientWidth = 465
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
    Left = 100
    Top = 78
    Width = 71
    Height = 19
    Caption = 'N'#250'mero 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 100
    Top = 142
    Width = 71
    Height = 19
    Caption = 'N'#250'mero 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 100
    Top = 206
    Width = 69
    Height = 19
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 48
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Suma'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Resta'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 240
    Top = 288
    Width = 83
    Height = 25
    Caption = 'Multiplicaci'#243'n'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 344
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Divisi'#243'n'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Edit1: TEdit
    Left = 248
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 248
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 248
    Top = 208
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object Button5: TButton
    Left = 48
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Suma 2'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 144
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Resta 2'
    TabOrder = 8
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 240
    Top = 328
    Width = 83
    Height = 25
    Caption = 'Multiplicaci'#243'n 2'
    TabOrder = 9
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 344
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Divisi'#243'n 2'
    TabOrder = 10
    OnClick = Button8Click
  end
end
