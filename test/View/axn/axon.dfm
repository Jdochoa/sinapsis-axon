object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 96
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 120
    Top = 169
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object tbZoomy: TTrackBar
    Left = 200
    Top = 8
    Width = 150
    Height = 45
    Position = 2
    TabOrder = 1
    OnChange = tbZoomyChange
  end
  object edtZoomyValue: TEdit
    Left = 264
    Top = 93
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'edtZoomyValue'
    OnChange = edtZoomyValueChange
  end
  object Panel1: TPanel
    Left = 8
    Top = 122
    Width = 431
    Height = 41
    Caption = 'Panel1'
    TabOrder = 3
  end
end
