object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Gr'#225'ficas'
  ClientHeight = 521
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = -1
    Width = 689
    Height = 522
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Histograma'
      object Image1: TImage
        Left = 3
        Top = 3
        Width = 675
        Height = 446
      end
      object Image3: TImage
        Left = 3
        Top = 448
        Width = 595
        Height = 43
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gr'#225'fica Pie'
      ImageIndex = 1
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 598
        Height = 489
      end
      object Image4: TImage
        Left = 604
        Top = 0
        Width = 74
        Height = 491
      end
    end
  end
end
