object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 226
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Visible = True
  WindowState = wsMinimized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TrayIcon1: TTrayIcon
    Animate = True
    PopupMenu = PopupMenu1
    Visible = True
    OnDblClick = TrayIcon1DblClick
    Left = 72
    Top = 64
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 72
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 120
    object Action11: TMenuItem
      Action = acSalida
    end
  end
  object ActionList1: TActionList
    Left = 72
    Top = 168
    object acSalida: TAction
      Category = 'Window'
      Caption = 'Salida'
      OnExecute = acSalidaExecute
    end
  end
end
