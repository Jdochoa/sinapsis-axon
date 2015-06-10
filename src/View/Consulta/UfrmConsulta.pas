unit UfrmConsulta;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Actions,
  Vcl.ActnList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxGridLevel, cxGrid, cxButtons,

  Spring.Collections,
  sinapsis.axn.vm.catalogo.interfaz

  ;

const
  CM_APPLYFILTER = WM_USER + 1;


type
  TGenerateColumns = reference to procedure (tvonsulta: TcxGridTableView);
  TfrmConsulta = class(TForm)
    Panel1: TPanel;
    btnOK: TcxButton;
    cxButton2: TcxButton;
    acConsulta: TActionList;
    acOK: TAction;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    tvConsulta: TcxGridTableView;
    tvConsultaID: TcxGridColumn;
    tvConsultaCODIGO: TcxGridColumn;
    tvConsultaDESCRIPCION: TcxGridColumn;
    tvConsultaColumn1: TcxGridColumn;
  private
    FDatos : IList<IAxnVMCtl>;
    function GetId: Integer;
    function GetDatos: IList<IAxnVMCtl>;
    procedure SetDatos(const Value: IList<IAxnVMCtl>);
    function GetAxnVMCtl: IAxnVMCtl;
  protected
    procedure RefrescaInfo;
  public
    { Public declarations }

    function Execute:Integer;
    procedure GenerateColumns(Value : TGenerateColumns);
    property Datos: IList<IAxnVMCtl> read GetDatos write SetDatos;
    property Id: Integer read GetId;
    property AxnVMCtl:IAxnVMCtl read GetAxnVMCtl;
  end;


implementation

{$R *.dfm}


{ TForm1 }





procedure TfrmConsulta.GenerateColumns(Value : TGenerateColumns);
begin
  with tvConsulta as TcxGridTableView do
  begin
    ClearItems;
    Value(tvConsulta);
  end;
  //tvCustomers.DataController.CustomDataSource := CustomerDataSource;
end;

function TfrmConsulta.Execute: Integer;
begin
  Result := ShowModal;
end;


function TfrmConsulta.GetAxnVMCtl: IAxnVMCtl;
var
  LId : Integer;
begin
  LId := Id;
  Datos.TryGetSingle(Result,function (const Value:IAxnVMCtl ):Boolean
                            begin
                                Result := Value.ID = LId;
                            end);

end;

function TfrmConsulta.GetDatos: IList<IAxnVMCtl>;
begin
  Result := FDatos;
end;

function TfrmConsulta.GetId: Integer;
begin
  Result := -1;
  if tvConsulta.Controller.SelectedRecordCount > 0 then
  begin
    if tvConsulta.Controller.SelectedRecordCount = 1 then
    begin
      Result := tvConsulta.Controller.SelectedRecords[0].Values[0];
    end
    else
      raise Exception.Create('¡Solo de puede seleccionar un elemento a la vez!');
  end
  else
    raise Exception.Create('¡No se selecciono ningún dato!');
end;

procedure TfrmConsulta.RefrescaInfo;
var
  Ctl0 : IAxnVMCtl;
  I : Integer;
  S:STRING;
begin
  I := 0;
  with tvConsulta.DataController as TcxGridDataController do
  begin
    BeginUpdate;
    ClearDetails;
    RecordCount := FDatos.Count;
    try
      for Ctl0 in FDatos do
      begin
        Values[I, 0] := Ctl0.ID;
        Values[I, 1] := Ctl0.Codigo;
        Values[I, 2] := Ctl0.Descripcion;
//        if (Ctl0 is TAxnVMCli0) then
//          S :=TAxnVMCli0(Ctl0).Direccion;
//        Values[I, 3] :=  S;
        Inc(I);
      end;
    finally
      EndUpdate;
    end;
  end;
  tvConsulta.FindPanel.GridView.Focused;
end;

procedure TfrmConsulta.SetDatos(const Value: IList<IAxnVMCtl>);
begin
  FDatos := Value;
  RefrescaInfo;
end;

end.
