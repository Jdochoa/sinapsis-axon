unit sinapsis.axn.m.catalogo;

interface
uses
    dorm.Mappings,
    sinapsis.axn.m.Interfaz,
    sinapsis.axn.m;

type
  [Entity('AXN_CATALOGO')]
  [NoAutomapping]
  TAxnCtl = class {$ifndef Debug}abstract {$endif} (TAxnM, IAxnMCtl)
  private
    FCodigo: String;
    FDescripcion: String;
  protected
    procedure setCodigo(const Value : string);
    procedure setDescripcion (const Value : string); virtual;
    function  getCodigo : String;
    function  getDescripcion : String;
  public
    [Column('CODIGO')]
    property Codigo: String read getCodigo write setCodigo;
    [Transient]
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
  end;

implementation

{ TAxonCatalogo }

function TAxnCtl.getCodigo: String;
begin
  Result := FCodigo;
end;

function TAxnCtl.getDescripcion: String;
begin
  Result := FDescripcion;
end;

procedure TAxnCtl.setCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TAxnCtl.setDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

end.
