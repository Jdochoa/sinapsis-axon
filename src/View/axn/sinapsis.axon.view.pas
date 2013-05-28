unit sinapsis.axon.view;

interface
uses
  System.Classes,
  System.Bindings.Helper,
  System.Bindings.Outputs,

  Vcl.Controls,
  Vcl.Bind.DBEngExt,


  Data.Bind.EngExt,
  Data.Bind.Components,
  Data.Bind.ObjectScope,

  sinapsis.axon.m,
  sinapsis.axn.v.livebinding
  ;
type
  IAxnMVCatalogo = interface
    ['{EC1193B9-9239-4518-A67A-B6009B315257}']

  end;

  TAxnMVCatalogo = class//(TInterfacedObject, IAxnMVCatalogo)
  private
    FCodigo: String;
    FDescripcion: String;
  public
    property Codigo: String read FCodigo write FCodigo;
    property Descripcion: String read FDescripcion write FDescripcion;
  end;


  IAxnVCatalogo = interface(IInterface)
    ['{80EFF51A-674C-48D8-9EEE-A7D3CC15E105}']
    function GetParent: TWinControl;
    procedure SetParent(const Value: TWinControl);
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
    function GetLeft: Integer;
    procedure SetLeft(const Value: Integer);
    procedure SetCatalogo(const Value: IAxnMVCatalogo);
    function GetCatalogo : IAxnMVCatalogo;
    property Parent: TWinControl read GetParent write SetParent;
    property Height: Integer read GetHeight write SetHeight;
    property Left: Integer read GetLeft write SetLeft;
    property Catalogo: IAxnMVCatalogo read GetCatalogo write SetCatalogo;


  end;


//  TAxnVCatalogo = class abstract(TComponent,IAxnVCatalogo)
  TAxnVCatalogo = class abstract(TInterfacedObject,IAxnVCatalogo)
//  TAxnVCatalogo = class abstract(TAggregationObject,IAxnVCatalogo)
  private
    FLabel :TControl;
    FEdit  :TControl;
    FDisplay : TControl;
    FCatalogo :IAxnMVCatalogo;
    FBinding  :IAxnBindManager;
    function GetParent: TWinControl;
    procedure SetParent(const Value: TWinControl);
    function GetHeight: Integer;
    procedure SetHeight(const Value: Integer);
    function GetLeft: Integer;
    procedure SetLeft(const Value: Integer);
    procedure SetCatalogo(const Value: IAxnMVCatalogo);
    function GetCatalogo : IAxnMVCatalogo;
    function GetBinding: IAxnBindManager;
    procedure SetBinding(const Value: IAxnBindManager);
  protected
  public
    constructor Create(AOwner: TComponent); Virtual;//override;
    destructor Destroy; override;
    property Parent: TWinControl read GetParent write SetParent;
    property Height: Integer read GetHeight write SetHeight;
    property Left: Integer read GetLeft write SetLeft;
    property Catalogo: IAxnMVCatalogo read GetCatalogo write SetCatalogo;
    property Binding: IAxnBindManager read GetBinding write SetBinding;
  end;

  TAxonVCatalogoVCL = class( TAxnVCatalogo)
  private
  protected
  public
    constructor Create(AOwner :TComponent); override;
    class function AxonVCatalogoVCL (const AOwner: TComponent):IAxnVCatalogo;
  end;

implementation
uses
  System.SysUtils,
  Vcl.stdCtrls
  ;
const
  _iSpace = 5;
  _iHeight = 15;
  _strFLabel = 'FLabel';
  _strFEdit  = 'FEdit';
  _strFDisplay = 'FDisplay';


constructor TAxnVCatalogo.Create(AOwner: TComponent);
var
  FieldDef : TGeneratorFieldDef;
begin
  inherited Create;//(AOwner);
  FLabel.Name := _strFLabel;
  FEdit.Name  := _strFEdit;
  FDisplay.Name := _strFDisplay;
  SetHeight(_iHeight);
  SetLeft(_iSpace);
end;

destructor TAxnVCatalogo.Destroy;
begin
  FreeAndNil(FLabel);
  FreeAndNil(FEdit);
  FreeAndNil(FDisplay);
  inherited;
end;

function TAxnVCatalogo.GetBinding: IAxnBindManager;
begin
  Result := FBinding;
end;

function TAxnVCatalogo.GetCatalogo: IAxnMVCatalogo;
begin
  Result := FCatalogo;
end;

function TAxnVCatalogo.GetHeight: Integer;
begin
  Result := FLabel.Height;
end;

function TAxnVCatalogo.GetLeft: Integer;
begin
  Result := FLabel.Left;
end;

function TAxnVCatalogo.GetParent: TWinControl;
begin
  Result := FLabel.Parent;
end;


procedure TAxnVCatalogo.SetBinding(const Value: IAxnBindManager);
begin
  FBinding := Value;
end;

procedure TAxnVCatalogo.SetCatalogo(const Value: IAxnMVCatalogo);
begin
  FCatalogo := Value;
end;

procedure TAxnVCatalogo.SetHeight(const Value: Integer);
begin
  FLabel.Height := Value;
  FEdit.Height  := Value;
  FDisplay.Height := Value;
end;

procedure TAxnVCatalogo.SetLeft(const Value: Integer);
begin
  FLabel.Left   := Value;
  FEdit.Left    := Value + _iSpace + FLabel.Width + _iSpace;
  FDisplay.Left := Value + _iSpace + FLabel.Width + _iSpace + FEdit.Width + _iSpace;
end;

procedure TAxnVCatalogo.SetParent(const Value: TWinControl);
begin
  FLabel.Parent := Value;
  FEdit.Parent := Value;
  FDisplay.Parent := Value;
end;

{ TAxonVCatalogoVCL }

class function TAxonVCatalogoVCL.AxonVCatalogoVCL(
  const AOwner: TComponent): IAxnVCatalogo;
begin
  Result := TAxonVCatalogoVCL.Create(AOwner);
  //Result.Catalogo.Codigo := '2012';
end;

constructor TAxonVCatalogoVCL.Create(AOwner :TComponent);
begin
  FLabel := TLabel.Create(AOwner);
  FEdit  := TEdit.Create(AOwner);
  FDisplay := TEdit.Create(AOwner);
  inherited Create(AOwner);

end;

end.
