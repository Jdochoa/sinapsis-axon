object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Modulo Versi'#243'n X.XX.XXX'
  ClientHeight = 262
  ClientWidth = 447
  Color = clAppWorkSpace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenu
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object acMenu: TActionList
    Left = 232
    Top = 72
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'Salida'
      Enabled = False
      Hint = 'Close'
    end
    object aMenu: TAction
      Category = 'Menu'
      Caption = 'Menu'
      OnExecute = aMenuExecute
    end
  end
  object mmMenu: TMainMenu
    Left = 136
    Top = 48
    object Menu1: TMenuItem
      Action = aMenu
      object Salida1: TMenuItem
        Action = WindowClose1
      end
    end
  end
end
