object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Form1'
  ClientHeight = 445
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 543
    Height = 445
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 766
    ExplicitHeight = 431
    object cxGrid1ServerModeTableView1: TcxGridServerModeTableView
      DragMode = dmAutomatic
      Navigator.Buttons.CustomButtons = <>
      FilterBox.Position = fpTop
      FilterBox.Visible = fvAlways
      DataController.DataSource = dxServerModeDBXDataSource1
      DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull]
      DataController.Filter.Active = True
      DataController.Options = [sdcoAssignGroupingValues, sdcoImmediatePost, sdcoKeepFocusedRowOnUpdate, sdcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.ColumnFilteredItemsList = True
      Filtering.ColumnPopup.ApplyMultiSelectChanges = fpacOnButtonClick
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderFilterButtonShowMode = fbmButton
      OptionsView.Indicator = True
      object cxGrid1ServerModeTableView1ID: TcxGridServerModeColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cxGrid1ServerModeTableView1CODIGO: TcxGridServerModeColumn
        DataBinding.FieldName = 'CODIGO'
        Width = 50
      end
      object cxGrid1ServerModeTableView1DESCRIPCION: TcxGridServerModeColumn
        DataBinding.FieldName = 'DESCRIPCION'
        Width = 250
      end
    end
    object cxGrid1TableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1ServerModeTableView1
    end
  end
  object dxServerModeDBXDataSource1: TdxServerModeDBXDataSource
    KeyFieldNames = 'ID'
    SQLAdapterClassName = 'TdxServerModeFirebirdAdapter'
    TableName = 'CLT_CLI0_CLIENTE'
    Connection = SQLConnection1
    Left = 448
    Top = 16
    Fields = ()
  end
  object dxServerModeDBXQueryDataSource1: TdxServerModeDBXQueryDataSource
    KeyFieldNames = 'ID'
    SQLAdapterClassName = 'TdxServerModeFirebirdAdapter'
    SQL.Strings = (
      'select Id, Codigo, Descripcion '
      'from Clt_Cli0_Cliente')
    Connection = SQLConnection1
    Left = 232
    Top = 8
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      'Database=C:\Sinapsis\axn\dxn\Multicolor\Antigua\MULTICOLOR.DXN'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 80
    Top = 16
  end
end
