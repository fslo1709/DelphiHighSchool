object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 201
  ClientWidth = 701
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
  object Button1: TButton
    Left = 24
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 72
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button2: TButton
    Left = 105
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Preorder'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 105
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Inorder'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 186
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Postorder'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 186
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Num Ele'
    TabOrder = 6
    OnClick = Button6Click
  end
  object ScrollBox1: TScrollBox
    Left = 280
    Top = 8
    Width = 409
    Height = 185
    VertScrollBar.Position = 1
    TabOrder = 7
    object Image1: TImage
      Left = -2
      Top = -3
      Width = 386
      Height = 185
    end
  end
  object Button7: TButton
    Left = 24
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Profundidad'
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 105
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Num Hojas'
    TabOrder = 9
    OnClick = Button8Click
  end
end
