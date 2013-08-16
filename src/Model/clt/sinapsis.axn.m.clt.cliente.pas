unit sinapsis.axn.m.clt.cliente;

interface
uses
  dorm.Mappings,
  sinapsis.axn.m.catalogo,

  sinapsis.axn.m.clt.interfaz;
type
  [Entity('CLT_CLI0_CLIENTE')]
  [NoAutomapping]
  TAxnMClt = class(TAxnCtl,IAxnMClt)
  private
    FNIT :string;
    FDireccion :string;
    FNombre :string;
    FApellido :string;
    FSexo :string;
    FIdentificacion :string;

  protected
    procedure SetNIT(Value:String);
    procedure SetDireccion(Value:String);
    procedure SetNombre(Value:String);
    procedure SetApellido(Value:String);
    procedure SetSexo(Value:String);
    procedure SetIdentificacion(Value:String);

    function GetNIT :string;
    function GetDireccion :string;
    function GetNombre :string;
    function GetApellido :string;
    function GetSexo :string;
    function GetIdentificacion :string;
    function GetDescripcion: String;

  public
    [Column('NIT')]
    property NIT: String read GetNIT write SetNIT;
    [Column('DIRECCION')]
    property Direccion : string read GetDireccion write SetDireccion;
    [Column('NOMBRE')]
    property Nombre:String read GetNombre write SetNombre;
    [Column('APELLIDO')]
    property Apellido:string read GetApellido write SetApellido;
    [Column('SEXO')]
    property Sexo:String read GetSexo write SetSexo;
    [Column('IDENTIFICACION')]
    property Identificacion: string read GetIdentificacion write SetIdentificacion;
    [Transient]
    property Descripcion: String read GetDescripcion;
  end;

implementation

{ TAxnMClt }
uses
  System.Rtti,
  dorm.Utils
  ;

function TAxnMClt.GetApellido: string;
begin
  Result := FApellido;
end;

function TAxnMClt.GetDescripcion: String;
begin

end;

function TAxnMClt.GetDireccion: string;
begin
  Result := FDireccion;
end;

function TAxnMClt.GetIdentificacion: string;
begin
  Result := FIdentificacion;
end;

function TAxnMClt.GetNIT: string;
begin
  Result := FNIT;
end;

function TAxnMClt.GetNombre: string;
begin
  Result := FNombre;
end;

function TAxnMClt.GetSexo: string;
begin
  Result := FSexo;
end;

procedure TAxnMClt.SetApellido(Value: String);
begin
  FApellido := Value;
end;

procedure TAxnMClt.SetDireccion(Value: String);
begin
  FDireccion := Value;
end;

procedure TAxnMClt.SetIdentificacion(Value: String);
begin
  FIdentificacion := Value;
end;

procedure TAxnMClt.SetNIT(Value: String);
begin
  FNIT := Value;
end;

procedure TAxnMClt.SetNombre(Value: String);
begin
  FNombre := Value;
end;

procedure TAxnMClt.SetSexo(Value: String);
begin
  FSexo := Value;
end;

end.
