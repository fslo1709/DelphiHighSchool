object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 47
    Width = 51
    Height = 18
    Caption = 'Nombre'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Kristen ITC'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 98
    Width = 32
    Height = 18
    Caption = 'Edad'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Kristen ITC'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 149
    Width = 69
    Height = 18
    Caption = 'Direcci'#243'n '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Kristen ITC'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = -4
    Width = 46
    Height = 18
    Caption = 'C'#243'digo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Kristen ITC'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 71
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 24
    Top = 122
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 24
    Top = 173
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 176
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 272
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Agregar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 364
    Top = 46
    Width = 75
    Height = 25
    Caption = 'Borrar'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit4: TEdit
    Left = 24
    Top = 20
    Width = 121
    Height = 21
    TabOrder = 6
  end
end
