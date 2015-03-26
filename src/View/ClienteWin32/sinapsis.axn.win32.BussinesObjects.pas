unit sinapsis.axn.win32.BussinesObjects;

interface
uses
  Generics.Collections,
  dorm.Mappings,
  dorm.Collections,
  dorm.Commons,
  dorm.ObjectStatus;

type
  TModUbic = class;
  TUbicaciones = class(TObjectList<TModUbic>)
  end;

 [Entity('MDL_MOD0_MODULO')]
  TModulo = class
  private
    FId: Integer;
    FCodigo: String;
    FDescripcion: String;
    FNombre: String;
    FEjecutale: Integer;
    FObjStatus: TdormObjectStatus;
    FUbicaciones : TUbicaciones;
  protected
  public
    constructor Create;
    [Column('ID')]
    property Id: Integer read FId write FId;
    [Column('CODIGO')]
    property Codigo: String read FCodigo write FCodigo;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
    [Column('NOMBRE')]
    property Nombre: String read FNombre write FNombre;
    [Column('EJECUTABLE')]
    property Ejecutale: Integer read FEjecutale write FEjecutale;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
    [HasMany('UBI0_ID')]
    property Ubicaciones: TUbicaciones read FUbicaciones;
  end;

 [Entity('MDL_UBI0_UBICACION')]
  TUbicacion = class
  private
    FId: Integer;
    FCodigo: String;
    FDescripcion: String;
    FObjStatus: TdormObjectStatus;
  protected
  public
    [Column('ID')]
    property Id: Integer read FId write FId;
    [Column('CODIGO')]
    property Codigo: String read FCodigo write FCodigo;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
  end;

 [Entity('MDL_MOD1_MOD0_UBIC0')]
  TModUbic = class
  private
    FId: Integer;
    FMod0_Id :Integer;
    FUbi0_Id : Integer;
    FTipo : String;
    FObjStatus: TdormObjectStatus;
    FUbicacion : TUbicacion;
    FModulo : TModulo;
  protected
  public
    [Column('ID')]
    property Id: Integer read FId write FId;
    [Column('TIPO')]
    property Tipo: String read FTipo write FTipo;
    [Transient]
    property ObjStatus: TdormObjectStatus read FObjStatus write FObjStatus;
    [HasOne('UBI0_ID')]
    property Ubicacion: TUbicacion read FUbicacion;
    [Column('UBI0_ID')]
    property Ubi0_Id :Integer read FUbi0_Id write FUbi0_Id;
    [HasOne('MOD0_ID')]
    property Modulo: TModulo read FModulo;
    [Column('Mod0_ID')]
    property Mod0_Id :Integer read FMod0_Id write FMod0_Id;
  end;

  [Entity('MDL_DEP0_DEPENDENCIA')]
  TDependencia = class
  private
    FId: Integer;
    FMod0_Id :Integer;
    FMod0_Id_Dep0 : Integer;
    FObjStatus: TdormObjectStatus;
  protected
  public
    [Column('ID')]
    property Id: Integer read FId write FId;
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
end;

end.
