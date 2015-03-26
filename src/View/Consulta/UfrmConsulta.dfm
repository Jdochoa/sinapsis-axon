object frmConsulta: TfrmConsulta
  Left = 0
  Top = 0
  ActiveControl = cxgConsulta
  BorderStyle = bsToolWindow
  Caption = 'Consulta'
  ClientHeight = 445
  ClientWidth = 390
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
  object cxgConsulta: TcxGrid
    Left = 0
    Top = 0
    Width = 390
    Height = 412
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 408
    ExplicitHeight = 445
    object cxgCConsultaSM: TcxGridServerModeTableView
      DragMode = dmAutomatic
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Enabled = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Visible = True
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvAlways
      OnEditChanged = cxgCConsultaSMEditChanged
      OnInitEditValue = cxgCConsultaSMInitEditValue
      DataController.DataSource = dsConsulta
      DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare, fcoIgnoreNull]
      DataController.Filter.Active = True
      DataController.Options = [sdcoAssignGroupingValues, sdcoImmediatePost, sdcoKeepFocusedRowOnUpdate, sdcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnFilteredItemsList = True
      Filtering.ColumnPopup.ApplyMultiSelectChanges = fpacOnButtonClick
      FilterRow.InfoText = 'Click ac'#225' para filtrar la informaci'#243'n'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.CopyRecordsToClipboard = False
      OptionsBehavior.IncSearch = True
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = '<No hay datos>'
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      object cxgCConsultaSMID: TcxGridServerModeColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cxgCConsultaSMCODIGO: TcxGridServerModeColumn
        Caption = 'C'#243'digo'
        DataBinding.FieldName = 'CODIGO'
        Width = 50
      end
      object cxgCConsultaSMDESCRIPCION: TcxGridServerModeColumn
        Caption = 'Descripci'#243'n'
        DataBinding.FieldName = 'DESCRIPCION'
        Width = 250
      end
    end
    object cxgConsultaTableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxgCNivel: TcxGridLevel
      GridView = cxgCConsultaSM
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 390
    Height = 33
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 411
    ExplicitWidth = 408
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
  object dsConsulta: TdxServerModeDBXQueryDataSource
    KeyFieldNames = 'CODIGO'
    SQLAdapterClassName = 'TdxServerModeFirebirdAdapter'
    SQL.Strings = (
      'select Id, Codigo, Descripcion '
      'from Clt_Cli0_Cliente')
    Left = 80
    Top = 176
  end
  object acConsulta: TActionList
    Left = 328
    Top = 8
    object acOK: TAction
      Caption = '&OK'
    end
  end
end
