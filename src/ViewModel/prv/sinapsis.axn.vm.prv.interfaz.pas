unit sinapsis.axn.vm.prv.interfaz;

interface

uses

  sinapsis.axn.m.prv.interfaz,
  sinapsis.axn.vm.interfaz,
  sinapsis.axn.vm.Catalogo.interfaz;

type

  IAxnVMPrv = interface(IAxnVMCtl)
    ['{FCEFCC11-22DA-4B67-8D08-7BDB161382E3}']
    procedure SetNit(Value:String);
    procedure SetNombres(Value:String);
    procedure SetApellidos(Value:String);
    procedure SetDireccion(Value:String);
    procedure SetAxnMPrv(Value:IAxnMPrv);

    function GetNit:String;
    function GetNombres:String;
    function GetApellidos:String;
    function GetDireccion:String;
    function GetAxnMPrv:IAxnMPrv;

    property NIT: String read GetNIT write SetNIT;
    property Nombres: String read GetNombres write SetNombres;
    property Apellidos: String read GetApellidos write SetApellidos;
    property Direccion: String read GetDireccion write SetDireccion;
    property AxnMPrv: IAxnMPrv read GetAxnMPrv write SetAxnMPrv;
  end;

  IAxnSrvPrv = Interface (IAxnSrvCtl)
    ['{5065B8C6-7882-4724-8621-E2947E1FBD49}']
    function Id(const Value : Integer):IAxnVMPrv;
    function Codigo(const Value:String):IAxnVMPrv;
    function NIT(const Value:String):IAxnVMPrv;
  End;


  IAxnPkgPrv = interface(IAxnPkg)
    ['{C9BEDB72-0621-4B49-A56B-1E9747465D78}']
  end;


implementation

end.
