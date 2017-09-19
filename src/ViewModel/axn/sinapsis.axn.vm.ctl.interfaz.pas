unit sinapsis.axn.vm.ctl.interfaz;

interface

uses
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.catalogo.interfaz,
    sinapsis.axn.m.catalogo,
  sinapsis.axn.vm.interfaz
  ;

type
//  IAxnVMCtl<T : IAxnMCtl> = interface(IAxnVMSingle<T>)
  IAxnVMCtl= interface(IAxnVMSingle)
    ['{12F18BD0-AF93-4B53-A4EF-019E35E8D2FB}']
    procedure SetAxnMCTL(const Value : TAxnMCtl);
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);

    function GetAxnMCTL:TAxnMCtl;
    function GetCodigo:String;
    function GetDescripcion:String;

    property AxnMCTL : TAxnMCtl read GetAxnMCTL write SetAxnMCTL;
    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;
  end;

  IAxnVMCltColl<T: TAxnMCtl> = interface(IAxnVMCollection<T>)
    ['{F71E6B4C-DBB1-4F6D-9DB9-A334ACB92972}']
  end;


  IAxnSrvCtl = Interface(IAxnSrvMdl)
    ['{8DCD035D-7AE4-443F-96D3-8F96DD559F9A}']
    function Id(const Value : Integer):IAxnVMCtl;
    function Codigo(const Value:String):IAxnVMCtl;
    function All:IAxnVMCollection<TAxnMCtl>;
  End;



implementation

end.
