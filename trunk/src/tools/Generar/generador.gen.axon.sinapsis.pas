unit generador.gen.axon.sinapsis;

interface
uses
  System.Classes,
  System.SysUtils,
  System.StrUtils,
  spring;

type
  TMetodo = class
  private
    const Codigo =  '<Tipo> <Clase>.<Nombre>() '#10#13+
                    'begin'#10#13+
                    'end'#10#13#10#13;
    var
    FNombre: string;
  protected
    function GetCodigo:String; virtual;
  public
    property Nombre: string read FNombre write FNombre;
  end;

  TFuncion = class(TMetodo)
  private
    FRetorna: string;
  protected
    function GetCodigo: string; override;
  public
    property Retorna: string read FRetorna write FRetorna;
  end;

  TProcedimiento = class(TMetodo)
  private
  protected
    function GetCodigo: string; override;
  public
  end;

  TPropiedad =  class
  private
  public
  end;


  TClase = class
  private
  public
  end;

  TArchivo = class
  private
    FNombre: String;
    FMemo: TMemoryStream;
  public
    property Nombre: String read FNombre;
    property Memo: TMemoryStream read FMemo write FMemo;
    constructor Create(const aNombre:string);
    destructor Destroy; override;
    procedure Grabar;
  end;


//  TGenerador = class;
  TGenerador = class(TObject)
  private
    const
    FEmpresa: string = 'sinapsis';
    FSistema: string= 'axn';
    FComponente: string = 'm';
    var
    FModulo: string;
    FClase: string;
    function GetNombre: string;
  protected
    const Ubicacion = 'E:\Sinapsis\sinapsis.axon\trunk\src\Model\';
    procedure GeneraInterfaz( Archivo :TArchivo);
    procedure GeneraImplementacion(Archivo :TArchivo);
    function NombreArchivo(Sufijo:string):string;
  public
//    property Empresa: string read FEmpresa;
//    property Sistema: string read FSistema;
    property Modulo: string read FModulo write FModulo;
//    property Componente: string read FComponente write FComponente;
    property Clase: string read FClase write FClase;
    property Nombre: string read GetNombre;

    constructor Create;
    class function Nuevo(const Modulo : string; const Componente :string; const Clase:string):TGenerador;

    procedure GeneraClase;


  end;

implementation

{ TGenerador }

constructor TGenerador.Create;
begin
  inherited;
//  FEmpresa    := 'sinapsis';
//  FSistema    := 'axn';
  FModulo     := 'cnf';
//  FComponente := 'm';
  FClase      := 'Catalogo';
end;

procedure TGenerador.GeneraClase;
begin
//  GeneraInterfaz;
//  GeneraImplementacion;
end;

procedure TGenerador.GeneraImplementacion(Archivo :TArchivo);
begin
end;

procedure TGenerador.GeneraInterfaz(Archivo :TArchivo);
begin
end;

function TGenerador.GetNombre: string;
begin
//  Result := Componente+'.'+Modulo+'.'+FSistema+'.'+FEmpresa;
  Result := FEmpresa+'.'+FSistema+'.'+FComponente+'.'+Modulo;
end;


function TGenerador.NombreArchivo(Sufijo: string): string;
begin
  if Sufijo <> '' then
    Sufijo := '.'+Sufijo;
  Result :=    Ubicacion+'\'+Modulo+'\'+GetNombre+Sufijo+'.pas'
end;

class function TGenerador.Nuevo(const Modulo, Componente,
  Clase: string): TGenerador;
begin
  Result := TGenerador.Create;
  Result.Modulo := Modulo;
  Result.Clase := Clase;
end;


{ TArchivo }

constructor TArchivo.Create(const aNombre: string);
begin
  inherited Create;
  FNombre := aNombre;
  FMemo := TMemoryStream.Create;
  if FileExists(Nombre) then
    FMemo.LoadFromFile(Nombre);
end;

destructor TArchivo.Destroy;
begin
  FMemo.Destroy;
  inherited;
end;

procedure TArchivo.Grabar;
begin
  FMemo.SaveToFile(Nombre);
end;

{ TMetodo }

function TMetodo.GetCodigo: String;
begin
  Result :=  ReplaceStr(Codigo,'<Nombre>',Nombre);
end;

{ TProcedimiento }

function TProcedimiento.GetCodigo: string;
begin
  Result := ReplaceStr(inherited GetCodigo,'<Tipo>','Procedure');
end;

{ TFuncion }

function TFuncion.GetCodigo: string;
begin
  Result := ReplaceStr(inherited GetCodigo,'<Tipo>','Function')+ ': '+Retorna;
end;

end.
