object frmConsulta: TfrmConsulta
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Consulta'
  ClientHeight = 445
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  ScreenSnap = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 492
    Height = 33
    Align = alBottom
    TabOrder = 0
    object btnOK: TcxButton
      Left = 208
      Top = 4
      Width = 75
      Height = 25
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object cxButton2: TcxButton
      Left = 289
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 492
    Height = 412
    Align = alClient
    TabOrder = 1
    object tvConsulta: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Filter.Visible = True
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FilterBox.Visible = fvNever
      FindPanel.ApplyInputDelay = 750
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = 'Ingrese su busqueda...'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object tvConsultaID: TcxGridColumn
        AlternateCaption = 'Id'
        Caption = 'Id'
        DataBinding.ValueType = 'LargeInt'
        Visible = False
      end
      object tvConsultaCODIGO: TcxGridColumn
        AlternateCaption = 'C'#243'digo'
        Caption = 'C'#243'digo'
        MinWidth = 100
        Options.Editing = False
        Options.GroupFooters = False
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object tvConsultaDESCRIPCION: TcxGridColumn
        AlternateCaption = 'Descripci'#243'n'
        Caption = 'Descripci'#243'n'
        MinWidth = 250
        Options.Editing = False
        Options.Moving = False
        Width = 250
      end
      object tvConsultaColumn1: TcxGridColumn
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tvConsulta
    end
  end
  object acConsulta: TActionList
    Left = 328
    Top = 8
    object acOK: TAction
      Caption = '&OK'
    end
  end
end
