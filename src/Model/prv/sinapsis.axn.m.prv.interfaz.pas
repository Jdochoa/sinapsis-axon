unit sinapsis.axn.m.prv.interfaz;

interface
uses
  sinapsis.axn.m.ctl.interfaz;

type
  IAxnMPrv = interface(IAxnMCtl)
    ['{00E292A3-473F-4CE1-A88F-4D6232638CD1}']
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

    property NIT: String read GetNIT write SetNIT;
    property Direccion : string read GetDireccion write SetDireccion;
    property Nombre:String read GetNombre write SetNombre;
    property Apellido:string read GetApellido write SetApellido;
    property Sexo:String read GetSexo write SetSexo;
    property Identificacion: string read GetIdentificacion write SetIdentificacion;
  end;


implementation

end.
