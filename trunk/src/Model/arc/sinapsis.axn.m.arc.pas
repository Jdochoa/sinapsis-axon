unit sinapsis.axn.m.arc;

interface

uses
  dorm.Mappings,

  sinapsis.axn.m,
  sinapsis.axn.m.Catalogo,
  sinapsis.axn.m.arc.interfaz;
type
  [Entity('ARC_ARC0_ARCHIVO')]
  TArchivo = class(TAxnMCTL,IArchivo)
  private
    FNombre :String;
    FEjecutable :String;
  protected
    function GetNombre:string;
    procedure SetNombre(const aValue :String);
    function GetEjecutable:string;
    procedure SetEjecutable(const aValue:String);
  public
    [Column('NOMBRE')]
    property Nombre: String read GetNombre write SetNombre;
    [Column('EJECUTABLE')]
    property Ejecutable: String read GetEjecutable write SetEjecutable;
  end;

  [Entity('ARC_UBI0_UBICACION')]
  TUbicacion = class(TAxnMCTL, IUbicacion)
  private
    FOrigen : string;
  protected
    function GetOrigen:String;
    procedure SetOrigen (const aValue : String);
  public
    [Column('ORIGEN')]
    property Origen: String read GetOrigen write SetOrigen;
  end;

  [Entity('ARC_ARUB1_ARCHIVOUBICACION')]
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

  [Entity('ARC_DEP0_DEPENDENCIA')]
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

{ TArchivo }

function TArchivo.GetEjecutable: string;
begin
  Result := FEjecutable;
end;

function TArchivo.GetNombre: string;
begin
  Result := FNombre;
end;

procedure TArchivo.SetEjecutable(const aValue: String);
begin
  FEjecutable := aValue;
end;

procedure TArchivo.SetNombre(const aValue: String);
begin
  FNombre := aValue;
end;

{ TUbicacion }

function TUbicacion.GetOrigen: String;
begin
  Result := FOrigen;
end;

procedure TUbicacion.SetOrigen(const aValue: String);
begin
  FOrigen := aValue;
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
