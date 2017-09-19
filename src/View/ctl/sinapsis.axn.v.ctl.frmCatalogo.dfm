object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 508
  Height = 21
  TabOrder = 0
  object lblNombre: TcxLabel
    Left = 0
    Top = 0
    AutoSize = False
    Caption = '<<Nombre>>'
    FocusControl = edtCodigo
    Height = 21
    Width = 110
  end
  object edtCodigo: TcxTextEdit
    Left = 115
    Top = 0
    TabOrder = 1
    Text = '<<Codigo>>'
    Width = 80
  end
  object lblDescripcion: TcxLabel
    Left = 198
    Top = 0
    AutoSize = False
    Caption = '<<Descripcion>>'
    FocusControl = edtCodigo
    ParentColor = False
    ParentFont = False
    Style.Color = clCream
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Height = 21
    Width = 307
  end
end
