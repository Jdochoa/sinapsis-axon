unit frmConsulta;

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
  cxGrid;


type
  TForm1 = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1ServerModeTableView1: TcxGridServerModeTableView;
    dxServerModeDBXDataSource1: TdxServerModeDBXDataSource;
    dxServerModeDBXQueryDataSource1: TdxServerModeDBXQueryDataSource;
    SQLConnection1: TSQLConnection;
    cxGrid1ServerModeTableView1ID: TcxGridServerModeColumn;
    cxGrid1ServerModeTableView1CODIGO: TcxGridServerModeColumn;
    cxGrid1ServerModeTableView1DESCRIPCION: TcxGridServerModeColumn;
    cxGrid1TableView1: TcxGridTableView;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  DSharp.Collections.ObservableCollection;

{ TForm1 }


end.
