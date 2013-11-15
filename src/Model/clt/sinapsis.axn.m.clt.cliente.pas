unit sinapsis.axn.m.clt.cliente;

interface
uses
  dorm.Mappings,
  sinapsis.axn.m.catalogo,

  sinapsis.axn.m.clt.interfaz;
type
  [Entity('CLT_CLI0_CLIENTE')]
  [NoAutomapping]
  TAxnMCli0 = class(TAxnMCtl,IAxnMCli0)
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
    function getDescripcion: string; override;


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
//    [Transient]
//    [Column('DESCRIPCION')]
    property Descripcion: String read GetDescripcion;
  end;

//  TAxnMListCli0 = class (TAxnMListCTL, IAxnMListCli0)
//  end;


implementation

{ TAxnMClt }
uses
  System.Rtti,
  dorm.Utils
  ;

function TAxnMCli0.GetApellido: string;
begin
  Result := FApellido;
end;

function TAxnMCli0.GetDescripcion: String;
begin
  Result := Nombre+', '+ Apellido;
end;

function TAxnMCli0.GetDireccion: string;
begin
  Result := FDireccion;
end;

function TAxnMCli0.GetIdentificacion: string;
begin
  Result := FIdentificacion;
end;

function TAxnMCli0.GetNIT: string;
begin
  Result := FNIT;
end;

function TAxnMCli0.GetNombre: string;
begin
  Result := FNombre;
end;

function TAxnMCli0.GetSexo: string;
begin
  Result := FSexo;
end;

procedure TAxnMCli0.SetApellido(Value: String);
begin
  FApellido := Value;
end;

procedure TAxnMCli0.SetDireccion(Value: String);
begin
  FDireccion := Value;
end;

procedure TAxnMCli0.SetIdentificacion(Value: String);
begin
  FIdentificacion := Value;
end;

procedure TAxnMCli0.SetNIT(Value: String);
begin
  FNIT := Value;
end;

procedure TAxnMCli0.SetNombre(Value: String);
begin
  FNombre := Value;
end;

procedure TAxnMCli0.SetSexo(Value: String);
begin
  FSexo := Value;
end;

end.
