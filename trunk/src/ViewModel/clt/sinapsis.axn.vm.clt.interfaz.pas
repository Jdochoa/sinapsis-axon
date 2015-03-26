unit sinapsis.axn.vm.clt.interfaz;

interface

uses

  sinapsis.axn.m.clt.interfaz,
  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.vm.interfaz,
  sinapsis.axn.vm.Catalogo.interfaz;

type

  IAxnVMCli0 = interface(IAxnVMCtl)
    ['{FCEFCC11-22DA-4B67-8D08-7BDB161382E3}']
    procedure SetNit(Value:String);
    procedure SetNombres(Value:String);
    procedure SetApellidos(Value:String);
    procedure SetDireccion(Value:String);
    procedure SetAxnMCli0(Value:TAxnMCli0);

    function GetNit:String;
    function GetNombres:String;
    function GetApellidos:String;
    function GetDireccion:String;
    function GetAxnMCli0:TAxnMCli0;

    property NIT: String read GetNIT write SetNIT;
    property Nombres: String read GetNombres write SetNombres;
    property Apellidos: String read GetApellidos write SetApellidos;
    property Direccion: String read GetDireccion write SetDireccion;
    property AxnMPrv: TAxnMCli0 read GetAxnMCli0 write SetAxnMCli0;
  end;

  IAxnSrvClt = Interface (IAxnSrvCtl)
    ['{5065B8C6-7882-4724-8621-E2947E1FBD49}']
    function Id(const Value : Integer):IAxnVMCli0;
    function Codigo(const Value:String):IAxnVMCli0;
    function NIT(const Value:String):IAxnVMCli0;
    function All:IAxnVMCollection<TAxnMCli0>;

  End;


  IAxnPkgClt = interface(IAxnPkg)
    ['{C9BEDB72-0621-4B49-A56B-1E9747465D78}']
  end;


implementation

end.
