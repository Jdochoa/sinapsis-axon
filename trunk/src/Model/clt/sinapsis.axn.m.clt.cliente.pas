unit sinapsis.axn.m.clt.cliente;

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
  sinapsis.axn.m.catalogo,
  sinapsis.axn.m.clt.interfaz;
type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('CLT_CLI0_CLIENTE','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('CLT_CLI0_CLIENTE')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
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
  {$IFDEF Marshmallow}
     [Column('NIT', [cpRequired, cpNotNull], -1, -1, -1, 'N.I.T.')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('NIT')]
   {$ENDIF}
  {$ENDIF}
    property NIT: String read GetNIT write SetNIT;
  {$IFDEF Marshmallow}
     [Column('DIRECCION', [], -1, -1, -1, 'Dirección')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('DIRECCION')]
   {$ENDIF}
  {$ENDIF}
    property Direccion : string read GetDireccion write SetDireccion;
  {$IFDEF Marshmallow}
     [Column('NOMBRE', [], -1, -1, -1, 'Nombres')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('NOMBRE')]
   {$ENDIF}
  {$ENDIF}
    property Nombre:String read GetNombre write SetNombre;
  {$IFDEF Marshmallow}
     [Column('APELLIDO', [], -1, -1, -1, 'Apellidos')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('APELLIDO')]
   {$ENDIF}
  {$ENDIF}
    property Apellido:string read GetApellido write SetApellido;
  {$IFDEF Marshmallow}
     [Column('SEXO', [cpRequired, cpNotNull], -1, -1, -1, 'Sexo')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('SEXO')]
   {$ENDIF}
  {$ENDIF}
    property Sexo:String read GetSexo write SetSexo;
  {$IFDEF Marshmallow}
     [Column('IDENTIFICACION', [], -1, -1, -1, 'Identificación')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('IDENTIFICACION)]
   {$ENDIF}
  {$ENDIF}
    property Identificacion: string read GetIdentificacion write SetIdentificacion;
//  {$IFDEF Marshmallow}
//     [Column('DESCRIPCION', [cpDontInsert, cpDontUpdate], -1, -1, -1, 'Nombres y Apellidos')]
//  {$ELSE}
//   {$IFDEF DORM}
//    [Transient]
//    [Column('DESCRIPCION')]
//   {$ENDIF}
//  {$ENDIF}
//    property Descripcion: String read GetDescripcion;
  end;

//  TAxnMListCli0 = class (TAxnMListCTL, IAxnMListCli0)
//  end;


implementation

{ TAxnMClt }
uses
  System.Rtti
//  dorm.Utils
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
