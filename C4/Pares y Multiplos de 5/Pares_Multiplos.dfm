object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'M'#250'ltiplos de cinco y pares - Sebasti'#225'n L'#243'pez, C4A'
  ClientHeight = 432
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 8
    Width = 457
    Height = 425
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Pares entre 1 y 25'
      object Memo1: TMemo
        Left = 96
        Top = 24
        Width = 257
        Height = 337
        TabOrder = 0
      end
      object Button1: TButton
        Left = 371
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Mostrar'
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'M'#250'ltiplos de 5'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 96
        Top = 24
        Width = 257
        Height = 337
        TabOrder = 0
      end
      object Button2: TButton
        Left = 359
        Top = 200
        Width = 75
        Height = 25
        Caption = 'Mostrar'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
  end
end
