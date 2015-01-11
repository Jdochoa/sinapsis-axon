unit sinapsis.axn.vm.Catalogo;

interface
uses
  sinapsis.axn.common.clases,
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.Catalogo.interfaz,
  sinapsis.axn.m.Catalogo,

  sinapsis.axn.vm.Interfaz,
  sinapsis.axn.vm,
  sinapsis.axn.vm.Catalogo.Interfaz
  ;

type
  TAxnVMCtl = class abstract(TAxnVMSingle, IAxnVMCtl)
  private
  protected
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);
    procedure SetAxnMCTL(const Value : IAxnMCTL);

    function GetCodigo:String;
    function GetDescripcion:String;
    function GetAxnMCTL:IAxnMCTL;
//    procedure SetAxnM(const Value: IAxnM); override;

    property AxnMCTL : IAxnMCtl read GetAxnMCTL write SetAxnMCTL;
  public
    constructor Create(Value : IAxnM);override;
    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;
  end;

  TAxnVMCltColl<T: IAxnMCtl> = class(TAxnVMCollection<T> ,IAxnVMCollection<T>)
  private
  protected
  public
  end;

implementation

{ TAxnVMCtl}

constructor TAxnVMCtl.Create(Value: IAxnM);
begin
  inherited Create(Value);
  AxnMCTL := IAxnMCTL(Value);
end;

function TAxnVMCtl.GetAxnMCTL: IAxnMCTL;
begin
  Result := IAxnMCTL(AxnM);
end;

function TAxnVMCtl.GetCodigo: String;
begin
  Result :=  AxnMCTL.Codigo;
end;

function TAxnVMCtl.GetDescripcion: String;
begin
  Result :=  AxnMCTL.Descripcion;
end;

//procedure TAxnVMCtl.SetAxnM(const Value: IAxnM);
//begin
//  inherited;
//  IAxnMCTL(FAxnM).Codigo := IAxnMCTL(Value).Codigo;
//  IAxnMCTL(FAxnM).Descripcion := IAxnMCTL(FAxnM).Descripcion;
//end;

procedure TAxnVMCtl.SetAxnMCTL(const Value: IAxnMCTL);
begin
  AxnM := Value;
end;

procedure TAxnVMCtl.SetCodigo(const Value: String);
begin
  AxnMCTL.Codigo := Value;
end;

procedure TAxnVMCtl.SetDescripcion(const Value: String);
begin
  AxnMCTL.Descripcion:= Value;
end;

end.
