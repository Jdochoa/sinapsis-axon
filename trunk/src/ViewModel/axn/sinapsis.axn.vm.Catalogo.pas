unit sinapsis.axn.vm.Catalogo;

interface
uses
  sinapsis.axn.common.clases,
  sinapsis.axn.m,
  sinapsis.axn.m.Catalogo,

  sinapsis.axn.vm.Interfaz,
  sinapsis.axn.vm;

type
  TAxnCTLVM = class abstract(TAxnVM, IVMCatalogo)
  private
  protected
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);
    procedure SetAxnMCTL(const Value : TAxnMCTL);

    function GetCodigo:String;
    function GetDescripcion:String;
    function GetAxnMCTL:TAxnMCTL;

    property AxnMCTL : TAxnMCTL read GetAxnMCTL write SetAxnMCTL;
  public
    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;

  end;


implementation

{ TAxnCTLVM }

function TAxnCTLVM.GetAxnMCTL: TAxnMCTL;
begin
  Result := TAxnMCTL(AxnM);
end;

function TAxnCTLVM.GetCodigo: String;
begin
  Result :=  AxnMCTL.Codigo;
end;

function TAxnCTLVM.GetDescripcion: String;
begin
  Result :=  AxnMCTL.Descripcion;
end;

procedure TAxnCTLVM.SetAxnMCTL(const Value: TAxnMCTL);
begin
  AxnM := TAxnM(Value);
  AxnMCTL.Codigo := Value.Codigo;
  AxnMCTL.Descripcion := Value.Descripcion;
end;

procedure TAxnCTLVM.SetCodigo(const Value: String);
begin
  AxnMCTL.Codigo := Value;
end;

procedure TAxnCTLVM.SetDescripcion(const Value: String);
begin
  AxnMCTL.Descripcion:= Value;
end;

end.
