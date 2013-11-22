unit sinapsis.axn.vm.Catalogo;

interface
uses
  sinapsis.axn.common.clases,
  sinapsis.axn.m,
  sinapsis.axn.m.Catalogo,

  sinapsis.axn.vm.Interfaz,
  sinapsis.axn.vm;

type
  TAxnVMCtl = class abstract(TAxnVM, IVMCatalogo)
  private
  protected
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);
    procedure SetAxnMCTL(const Value : TAxnMCTL);

    function GetCodigo:String;
    function GetDescripcion:String;
    function GetAxnMCTL:TAxnMCTL;
    procedure SetAxnM(const Value: TAxnM); override;

    property AxnMCTL : TAxnMCtl read GetAxnMCTL write SetAxnMCTL;
  public
    constructor Create(Value : TAxnM);override;
    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;
  end;

  TAxnVMCtlLista<TVM: TAxnVMCtl; TM :TAxnMCtl > = class(TAxnMVLista<TVM,TM>)
  private
  protected
    function NewItem(const Value: TM):TVM; override;
  public
  end;

implementation

{ TAxnVMCtl}

constructor TAxnVMCtl.Create(Value: TAxnM);
begin
  inherited Create(Value);
  AxnMCTL := TAxnMCTL(Value);
end;

function TAxnVMCtl.GetAxnMCTL: TAxnMCTL;
begin
  Result := TAxnMCTL(AxnM);
end;

function TAxnVMCtl.GetCodigo: String;
begin
  Result :=  AxnMCTL.Codigo;
end;

function TAxnVMCtl.GetDescripcion: String;
begin
  Result :=  AxnMCTL.Descripcion;
end;

procedure TAxnVMCtl.SetAxnM(const Value: TAxnM);
begin
  inherited;
  TAxnMCTL(FAxnM).Codigo := TAxnMCTL(Value).Codigo;
  TAxnMCTL(FAxnM).Descripcion := TAxnMCTL(FAxnM).Descripcion;
end;

procedure TAxnVMCtl.SetAxnMCTL(const Value: TAxnMCTL);
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


{ TAxnVMCtlLista<T, T1> }


{ TAxnVMCtlLista<TVM, TM> }

function TAxnVMCtlLista<TVM, TM>.NewItem(const Value: TM): TVM;
begin
  Result := TAxnVMCtl.Create(Value);
end;

end.
