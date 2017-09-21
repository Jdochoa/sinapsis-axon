unit sinapsis.axn.e.ctl;

interface
{.$I Model.inc}
uses
  {$IFDEF Marshmallow}
    Spring.Persistence.Mapping.Attributes,
  {$ELSE}
   {$IFDEF DORM}
    dorm.Mappings,
   {$ENDIF}
  {$ENDIF}
    sinapsis.axn.e,
    sinapsis.axn.e.ctl.Interfaz
    ;

type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('AXN_CATALOGO','AXN')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('AXN_CATALOGO')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnECtl = class {$ifndef Debug}abstract {$endif} (TAxnE, IAxnECtl)
  private
    FCodigo: String;
    FDescripcion: String;
    FDefault :String;
  protected
    procedure setCodigo(const Value : string);
    procedure setDescripcion (const Value : string); virtual;
    procedure setPorDefecto (const Value : string);
    function  getCodigo : String;
    function  getDescripcion : String; virtual;
    function  getPorDefecto : String;
  public
  {$IFDEF Marshmallow}
     [Column('CODIGO', [cpRequired, cpNotNull], 20, -1, -1, 'Código')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('CODIGO')]
   {$ENDIF}
  {$ENDIF}
    property Codigo: String read getCodigo write setCodigo;
  {$IFDEF Marshmallow}
     [Column('DESCRIPCION', [], 100, -1, -1, 'Descripción')]
  {$ELSE}
   {$IFDEF DORM}
//    [Transient]
    [Column('DESCRIPCION')]
   {$ENDIF}
  {$ENDIF}
    property Descripcion: String read getDescripcion write setDescripcion;
  {$IFDEF Marshmallow}
     //[Column('DEFECTO', [cpRequired, cpNotNull], 1, -1, -1, 'Por Defecto')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('DEFECTO')]
   {$ENDIF}
  {$ENDIF}
    property PorDefecto: string read GetPorDefecto write SetPorDefecto;
  end;




implementation

{ TAxonCatalogo }

function TAxnECtl.getCodigo: String;
begin
  Result := FCodigo;
end;

function TAxnECtl.getPorDefecto: String;
begin
  Result := FDefault;
end;

function TAxnECtl.getDescripcion: String;
begin
  Result := FDescripcion;
end;

procedure TAxnECtl.setCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TAxnECtl.setPorDefecto(const Value: string);
begin
  FDefault := Value;
end;

procedure TAxnECtl.setDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;


end.
