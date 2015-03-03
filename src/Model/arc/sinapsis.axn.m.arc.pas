unit sinapsis.axn.m.arc;

interface
{$I Model.inc}
uses
  {$IFDEF Marshmallow}
    Spring.Persistence.Mapping.Attributes,
  {$ELSE}
   {$IFDEF DORM}
    dorm.Mappings,
   {$ENDIF}
  {$ENDIF}
  sinapsis.axn.m,
  sinapsis.axn.m.Catalogo,
  sinapsis.axn.m.arc.interfaz;
type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('ARC_UBI0_UBICACION','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('ARC_UBI0_UBICACION')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnUbicacion = class(TAxnMCTL, IAxnUbicacion)
  private
  protected
  public
  end;


  {$IFDEF Marshmallow}
    [Entity]
    [Table('ARC_ARC0_ARCHIVO','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('ARC_ARC0_ARCHIVO')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnArchivo = class(TAxnMCTL,IAxnArchivo)
  private
    FNombre :String;
    FFormato :TArch;
    FUbi0_Id : Integer;
    FUbicacion : TAxnUbicacion;
  protected
    function GetNombre:string;
    procedure SetNombre(const aValue :String);
    function GetFormato:TArch;
    procedure SetFormato(const aValue:TArch);
    function GetUbi0_Id:Integer;
    procedure SetUbi0_Id(const aValue:Integer);
    function GetUbicacion : IAxnUbicacion;
    procedure SetUbicacion(const aValue:IAxnUbicacion);
  public
  {$IFDEF Marshmallow}
     [Column('NOMBRE', [cpRequired, cpNotNull], 100, -1, -1, 'Por Defecto')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('NOMBRE')]
   {$ENDIF}
  {$ENDIF}
    property Nombre: String read GetNombre write SetNombre;
  {$IFDEF Marshmallow}
     [Column('FORMATO', [cpRequired, cpNotNull], 100, -1, -1, 'Formato')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('FORMATO')]
   {$ENDIF}
  {$ENDIF}
    property Formato: TArch read GetFormato write SetFormato;
  {$IFDEF Marshmallow}
    // [Column('DESCRIPCION', [cpRequired, cpNotNull], 100, -1, -1, 'Por Defecto')]
  {$ELSE}
   {$IFDEF DORM}
    [Transient]
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
   {$ENDIF}
  {$ENDIF}
  {$IFDEF Marshmallow}
    [Column('UBI0_ID', [], 0, 0, 0, '')]
    [ForeignJoinColumn('UBI0_ID', 'ARC_UBI0_UBICACION', 'ID', [])]
  {$ELSE}
   {$IFDEF DORM}
    [Column('UBI0_ID')]
   {$ENDIF}
  {$ENDIF}
    property Ubi0_Id: Integer read GetUbi0_Id write SetUbi0_Id;
  {$IFDEF Marshmallow}
     [ManyToOne(False, [ckCascadeAll], 'UBI0_ID')]
  {$ELSE}
   {$IFDEF DORM}
    [BelongsTo('UBI0_ID', True)]
   {$ENDIF}
  {$ENDIF}
    property Ubicacion: TAxnUbicacion read FUbicacion write FUbicacion;
  end;


  {$IFDEF Marshmallow}
    [Entity]
    [Table('ARC_ARUB1_ARCHIVOUBICACION','ARC')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('ARC_ARUB1_ARCHIVOUBICACION')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TArchUbi = class(TAxnM, IArchUbi)
  private
    FArc0_Id : Integer;
    FUbi0_Id : Integer;
  protected
    function GetARC0_ID:integer;
    procedure SetARC0_ID (const aValue :Integer);
    function GetUBI0_ID:integer;
    procedure SetUBI0_ID (const aValue :Integer);
  public
    [Column('ARC0_ID')]
    property ARC0_ID: Integer read GetARC0_ID write SetARC0_ID;
    [Column('UBI0_ID')]
    property UBI0_ID: Integer read GetUBI0_ID write SetUBI0_ID;
  end;

  {$IFDEF Marshmallow}
    [Entity]
    [Table('ARC_DEP0_DEPENDENCIA','ARC')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('ARC_DEP0_DEPENDENCIA')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TDependencia = class(TAxnM, IDependencia)
  private
    FArc0_Id : Integer;
    FArc0_Id_Dep0 : Integer;
  protected
    function GetARC0_ID:integer;
    procedure SetARC0_ID (const aValue :Integer);
    function GetARC0_ID_DEP0:integer;
    procedure SetARC0_ID_DEP0 (const aValue :Integer);
  public
    [Column('ARC0_ID')]
    property ARC0_ID: Integer read GetARC0_ID write SetARC0_ID;
    [Column('ARC0_ID_DEP0')]
    property ARC0_ID_DEP0: Integer read GetARC0_ID_DEP0 write SetARC0_ID_DEP0;
  end;


implementation

{ TAxnArchivo }

function TAxnArchivo.GetFormato: TArch;
begin
  Result := FFormato;
end;

function TAxnArchivo.GetNombre: string;
begin
  Result := FNombre;
end;

function TAxnArchivo.GetUbi0_Id: Integer;
begin
  Result := FUbi0_Id;
end;

function TAxnArchivo.GetUbicacion: IAxnUbicacion;
begin
  Result := FUbicacion;
end;

procedure TAxnArchivo.SetFormato(const aValue: TArch);
begin
  FFormato := aValue;
end;

procedure TAxnArchivo.SetNombre(const aValue: String);
begin
  FNombre := aValue;
end;


procedure TAxnArchivo.SetUbi0_Id(const aValue: Integer);
begin
  FUbi0_Id := aValue;
end;

procedure TAxnArchivo.SetUbicacion(const aValue: IAxnUbicacion);
begin
  FUbicacion := TAxnUbicacion(aValue);
end;

{ TArchUbi }

function TArchUbi.GetARC0_ID: integer;
begin
  Result := FArc0_Id;
end;

function TArchUbi.GetUBI0_ID: integer;
begin
  Result := FUbi0_Id;
end;

procedure TArchUbi.SetARC0_ID(const aValue: Integer);
begin
  FArc0_Id := aValue;
end;

procedure TArchUbi.SetUBI0_ID(const aValue: Integer);
begin
  FUbi0_Id := aValue;
end;

{ TDependencia }

function TDependencia.GetARC0_ID: integer;
begin
  Result := FArc0_Id;
end;

function TDependencia.GetARC0_ID_DEP0: integer;
begin
  Result := FArc0_Id_Dep0;
end;

procedure TDependencia.SetARC0_ID(const aValue: Integer);
begin
  FArc0_Id := aValue;
end;

procedure TDependencia.SetARC0_ID_DEP0(const aValue: Integer);
begin
  FArc0_Id_Dep0 := aValue;
end;

end.
