object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Geometr'#237'a'
  ClientHeight = 679
  ClientWidth = 763
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 769
    Height = 681
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Figuras Geom'#233'tricas'
      object Image1: TImage
        Left = 3
        Top = 170
        Width = 480
        Height = 480
        Enabled = False
        OnClick = Image1Click
        OnMouseLeave = Image1MouseLeave
        OnMouseMove = Image1MouseMove
      end
      object Image2: TImage
        Left = 3
        Top = 3
        Width = 101
        Height = 101
        Enabled = False
        OnClick = Image2Click
      end
      object Image3: TImage
        Left = 246
        Top = 3
        Width = 101
        Height = 101
        Enabled = False
        OnClick = Image3Click
      end
      object Image4: TImage
        Left = 489
        Top = 3
        Width = 101
        Height = 101
        Enabled = False
        OnClick = Image4Click
      end
      object Image5: TImage
        Left = 489
        Top = 170
        Width = 101
        Height = 101
        Enabled = False
        OnClick = Image5Click
      end
      object Image6: TImage
        Left = 489
        Top = 289
        Width = 101
        Height = 101
        Enabled = False
        OnClick = Image6Click
      end
      object Image7: TImage
        Left = 489
        Top = 404
        Width = 101
        Height = 101
        Enabled = False
        OnClick = Image7Click
      end
      object Label3: TLabel
        Left = 3
        Top = 110
        Width = 44
        Height = 19
        Caption = #193'rea: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 3
        Top = 145
        Width = 80
        Height = 19
        Caption = 'Per'#237'metro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 246
        Top = 110
        Width = 44
        Height = 19
        Caption = #193'rea: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 246
        Top = 145
        Width = 80
        Height = 19
        Caption = 'Per'#237'metro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 489
        Top = 110
        Width = 44
        Height = 19
        Caption = #193'rea: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 489
        Top = 145
        Width = 80
        Height = 19
        Caption = 'Per'#237'metro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 596
        Top = 198
        Width = 44
        Height = 19
        Caption = #193'rea: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 596
        Top = 233
        Width = 80
        Height = 19
        Caption = 'Per'#237'metro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 596
        Top = 313
        Width = 44
        Height = 19
        Caption = #193'rea: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 596
        Top = 348
        Width = 80
        Height = 19
        Caption = 'Per'#237'metro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 596
        Top = 430
        Width = 44
        Height = 19
        Caption = #193'rea: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 596
        Top = 465
        Width = 80
        Height = 19
        Caption = 'Per'#237'metro: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 505
        Top = 511
        Width = 80
        Height = 19
        Caption = #193'rea total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 505
        Top = 546
        Width = 116
        Height = 19
        Caption = 'Per'#237'metro total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Button1: TButton
        Left = 505
        Top = 579
        Width = 100
        Height = 29
        Caption = 'Opciones'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 641
        Top = 579
        Width = 100
        Height = 29
        Caption = 'Comenzar'
        TabOrder = 1
        Visible = False
        OnClick = Button2Click
      end
      object Button5: TButton
        Left = 576
        Top = 614
        Width = 100
        Height = 29
        Caption = 'Reiniciar'
        TabOrder = 2
        Visible = False
        OnClick = Button5Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Figuras 3D'
      ImageIndex = 1
      object Image9: TImage
        Left = 160
        Top = 0
        Width = 400
        Height = 400
      end
      object Label1: TLabel
        Left = 176
        Top = 472
        Width = 89
        Height = 25
        Caption = 'Volumen:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 176
        Top = 512
        Width = 100
        Height = 25
        Caption = 'Superficie:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object RadioGroup1: TRadioGroup
        Left = 3
        Top = 0
        Width = 134
        Height = 569
        Caption = 'Seleccione una figura'
        Items.Strings = (
          'Esfera'
          'Cono'
          'Paralelep'#237'pedo'
          'Pir'#225'mide')
        TabOrder = 0
        OnClick = RadioGroup1Click
      end
      object Button4: TButton
        Left = 528
        Top = 472
        Width = 123
        Height = 49
        Caption = 'Calcular'
        TabOrder = 1
        Visible = False
        OnClick = Button4Click
      end
      object LabeledEdit1: TLabeledEdit
        Left = 160
        Top = 430
        Width = 121
        Height = 21
        EditLabel.Width = 19
        EditLabel.Height = 13
        EditLabel.Caption = 'Alto'
        TabOrder = 2
        Visible = False
      end
      object LabeledEdit2: TLabeledEdit
        Left = 328
        Top = 430
        Width = 121
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Ancho'
        TabOrder = 3
        Visible = False
      end
      object LabeledEdit3: TLabeledEdit
        Left = 498
        Top = 430
        Width = 121
        Height = 21
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Profundidad'
        TabOrder = 4
        Visible = False
      end
    end
  end
end
