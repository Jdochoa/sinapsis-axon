unit sinapsis.axn.m.catalogo;

interface
uses
    dorm.Mappings,
    sinapsis.axn.m.Interfaz,
    sinapsis.axn.m;

type
  [Entity('AXN_CATALOGO')]
  [NoAutomapping]
  TAxnMCTL = class {$ifndef Debug}abstract {$endif} (TAxnM, IAxnMCtl)
  private
    FCodigo: String;
    FDescripcion: String;
  protected
    procedure setCodigo(const Value : string);
    procedure setDescripcion (const Value : string); virtual;
    function  getCodigo : String;
    function  getDescripcion : String; virtual;
  public
    [Column('CODIGO')]
    property Codigo: String read getCodigo write setCodigo;
    [Transient]
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
  end;

//  TAxnMListCtl = Class(TAxnMList, IAxnMListCtl)
//  End;

implementation

{ TAxonCatalogo }

function TAxnMCTL.getCodigo: String;
begin
  Result := FCodigo;
end;

function TAxnMCTL.getDescripcion: String;
begin
  Result := FDescripcion;
end;

procedure TAxnMCTL.setCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TAxnMCTL.setDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

end.
