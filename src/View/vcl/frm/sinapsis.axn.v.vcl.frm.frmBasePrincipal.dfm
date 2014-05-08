object frmBasePrincipal: TfrmBasePrincipal
  Left = 0
  Top = 0
  Caption = 'Forma Principal Base'
  ClientHeight = 202
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object acPrincipal: TActionList
    Left = 16
    Top = 16
    object acSalida: TAction
      Category = 'Window'
      Caption = 'Salida'
      OnExecute = acSalidaExecute
    end
  end
  object apePrincipal: TApplicationEvents
    Left = 384
    Top = 8
  end
end
