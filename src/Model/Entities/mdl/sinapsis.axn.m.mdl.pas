unit sinapsis.axn.m.mdl;

interface
uses
  System.SysUtils,
  Generics.Collections,

  dorm.Mappings,
  dorm.Collections,
  dorm.Commons,
  dorm.ObjectStatus,

  sinapsis.axn.m,
  sinapsis.axn.m.Catalogo;

type
  TModUbic = class;
  TUbicacion = class;
  TDependencia = class;

  [ListOf('sinapsis.axn.m.mdl.TModUbic')]
  TUbicaciones = class (TObjectList<TModUbic>)
  private
    function GetUbicacion(Index: string): TUbicacion;
  public
    property Ubicacion[Index:string]: TUbicacion read GetUbicacion;

  end;

  [ListOf('sinapsis.axn.m.mdl.TDependencia')]
  TDependencias = class (TObjectList<TDependencia>)
  private
  public
  end;

  [Entity('MDL_MOD0_MODULO')]
  TModulo = class (TAxnMCTL)
  private
    FNombre: String;
    FEjecutale: Integer;
    FObjStatus: TdormObjectStatus;
    FUbicaciones :  TUbicaciones;
    FDependencias : TDependencias;
  protected
  public
    constructor Create;
    [Column('DESCRIPCION')]
    property Descripcion: String read GetDescripcion write SetDescripcion;
    [Column('NOMBRE')]
    property Nombre: String read FNombre write FNombre;
    [Column('EJECUTABLE')]
    property Ejecutale: Integer read FEjecutale write FEjecutale;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
    [HasMany('Ubi0_ID',True)]
    property Ubicaciones: TUbicaciones read FUbicaciones;
    [HasMany('Mod0_ID',True)]
    property Dependencias: TDependencias read FDependencias;

  end;

  [Entity('MDL_UBI0_UBICACION')]
  TUbicacion = class(TAxnMCTL)
  private
    FObjStatus: TdormObjectStatus;
  protected
  public
    [Column('DESCRIPCION')]
    property Descripcion: String read getDescripcion write setDescripcion;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
  end;

  [Entity('MDL_MOD1_MOD0_UBIC0')]
  TModUbic = class(TAxnM)
  private
    FMod0_Id :Integer;
    FUbi0_Id : Integer;
    FTipo : String;
    FObjStatus: TdormObjectStatus;
    FUbicacion : TUbicacion;
    FModulo : TModulo;
  protected
  public
    [Column('TIPO')]
    property Tipo: String read FTipo write FTipo;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
    [HasOne('UBI0_ID')]
    property Ubicacion: TUbicacion read FUbicacion write FUbicacion;
    [Column('UBI0_ID')]
    property Ubi0_Id :Integer read FUbi0_Id write FUbi0_Id;
//    [HasOne('MOD0_ID')]
//    property Modulo: TModulo read FModulo;
    [Column('Mod0_ID')]
    property Mod0_Id :Integer read FMod0_Id write FMod0_Id;
  end;

  [Entity('MDL_DEP0_DEPENDENCIA')]
  TDependencia = class(TAxnM)
  private
    FMod0_Id :Integer;
    FMod0_Id_Dep0 : Integer;
    FObjStatus: TdormObjectStatus;
  protected
  public
    [Column('Mod0_ID')]
    property Mod0_Id :Integer read FMod0_Id write FMod0_Id;
    [Column('Mod0_Id_Dep0')]
    property Mod0_Id_Dep0 :Integer read FMod0_Id_Dep0 write FMod0_Id_Dep0;
  end;


implementation



{ TModulo }

constructor TModulo.Create;
begin
  FUbicaciones := TUbicaciones.Create(True);
  FDependencias := TDependencias.Create(True);
end;

{ TUbicaciones }

function TUbicaciones.GetUbicacion(Index: string): TUbicacion;
var
  ModUbic :TModUbic;
begin
  for ModUbic in List do
  begin
    if CompareText(ModUbic.Tipo,Index) = 0 then
      Break
  end;
  Result := ModUbic.Ubicacion;
end;


end.
