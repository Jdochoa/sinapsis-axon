unit UfrmConsulta;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Bind.DBEngExt,
  System.Rtti,
  System.Bindings.Outputs,
  Data.Bind.Components,
  Vcl.ComCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Bind.Grid,
  Vcl.Bind.Editors,
  Vcl.ExtCtrls,
  Data.Bind.EngExt,
  Data.Bind.Grid,
  Data.Bind.DBScope,
  Data.Bind.ObjectScope,
  cxFilterControl, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DBXFirebird, Data.DB, Data.SqlExpr, dxServerModeData,
  dxServerModeDBXDataSource, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridServerModeTableView, cxClasses, cxGridCustomView,
  cxGrid, cxTextEdit, cxGridDBTableView, cxDBdata, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList;

const
  CM_APPLYFILTER = WM_USER + 1;


type
  TfrmConsulta = class(TForm)
    cxgCNivel: TcxGridLevel;
    cxgConsulta: TcxGrid;
    cxgCConsultaSM: TcxGridServerModeTableView;
    dsConsulta: TdxServerModeDBXQueryDataSource;
    cxgCConsultaSMID: TcxGridServerModeColumn;
    cxgCConsultaSMCODIGO: TcxGridServerModeColumn;
    cxgCConsultaSMDESCRIPCION: TcxGridServerModeColumn;
    cxgConsultaTableView1: TcxGridTableView;
    Panel1: TPanel;
    btnOK: TcxButton;
    cxButton2: TcxButton;
    acConsulta: TActionList;
    acOK: TAction;
    procedure cxgCConsultaSMInitEditValue(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var AValue: Variant);
    procedure cxgCConsultaSMEditChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
  private
    FilterString: string;
    procedure CMApplyFilter(var Msg: TMessage); message CM_APPLYFILTER;
    function GetConnection: TSQLConnection;
    procedure SetConnection(const Value: TSQLConnection);
    function GetId: Integer;
    function GetSQL: String;
    procedure SetSQL(const Value: String);
  public
    { Public declarations }
    function Execute:Integer;
    property Connection: TSQLConnection read GetConnection write SetConnection;
    property Id: Integer read GetId;
    property SQL: String read GetSQL write SetSQL;
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}


{ TForm1 }


procedure TfrmConsulta.CMApplyFilter(var Msg: TMessage);
begin
  if TObject(Msg.WParam) is TcxDataFilterCriteria then
    with TObject(Msg.WParam) as TcxDataFilterCriteria do
    begin
     // Clear;
      FilterString :=  FilterString + '%';
      Root.BoolOperatorKind := fboOr;
      Root.AddItem(TObject(Msg.LParam), foLike, FilterString, FilterString);
      FilterString :=  '% ' + FilterString;
      Root.AddItem(TObject(Msg.LParam), foLike, FilterString, FilterString);
    end;
    keybd_event(VK_RIGHT, 1, 0, 0)
end;

procedure TfrmConsulta.cxgCConsultaSMEditChanged(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem);
begin
  if Sender.Controller.FocusedRecord is TcxGridFilterRow then  // Filter row is focused
  begin
    FilterString := TcxTextEdit(Sender.Controller.EditingController.Edit).EditingValue;
    PostMessage(Handle, CM_APPLYFILTER, Integer(Sender.DataController.Filter), Integer(AItem));
  end;
end;

procedure TfrmConsulta.cxgCConsultaSMInitEditValue(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var AValue: Variant);
var
  EditingText: string;
begin
  if Sender.Controller.FocusedRecord is TcxGridFilterRow then  // Filter row is focused
  begin
    EditingText := TcxTextEdit(AEdit).EditingText;
    StringReplace(EditingText, '%', '', [rfReplaceAll, rfIgnoreCase]);
    TcxTextEdit(AEdit).EditingText := EditingText;
  end;

end;



function TfrmConsulta.Execute: Integer;
begin
//  Assert((not Assigned(dsConsulta.Connection)),'¡No se ha inicializado la conexcion a la DB!');
  dsConsulta.Active := True;
  cxgCConsultaSM.DataController.Filter.Options := [fcoCaseInsensitive];
  cxgCConsultaSM.FilterRow.ApplyChanges := fracImmediately;
  Result := ShowModal;
end;

function TfrmConsulta.GetConnection: TSQLConnection;
begin
  Result := dsConsulta.Connection;
end;

function TfrmConsulta.GetId: Integer;
var
  RecIdx : Integer;
  ColIdx : Integer;
begin
  Result := -1;
  if cxgCConsultaSM.Controller.SelectedRecordCount > 0 then
  begin
    if cxgCConsultaSM.Controller.SelectedRecordCount = 1 then
    begin
      RecIdx := cxgCConsultaSM.Controller.SelectedRecords[0].RecordIndex;
      ColIdx := cxgCConsultaSM.DataController.GetItemByFieldName('ID').Index;
      Result := cxgCConsultaSM.DataController.Values[RecIdx,ColIdx];
    end
    else
      raise Exception.Create('¡Solo de puede seleccionar un elemento a la vez!');

  end
  else
    raise Exception.Create('¡No se selecciono ningún dato!');

end;

function TfrmConsulta.GetSQL: String;
begin
  Result := dsConsulta.SQL.ToString;
end;

procedure TfrmConsulta.SetConnection(const Value: TSQLConnection);
begin
  dsConsulta.Close;
  dsConsulta.Connection := Value;
end;


procedure TfrmConsulta.SetSQL(const Value: String);
begin
  dsConsulta.Close;
  dsConsulta.SQL.Clear;
  dsConsulta.SQL.Add(Value);
end;

end.
