unit sinapsis.axn.vm.catalogo.interfaz;

interface

uses
  sinapsis.axn.m.catalogo.interfaz,
  sinapsis.axn.vm.interfaz
  ;

type
  IAxnVMCtl = interface(IAxnVMSingle)
    ['{12F18BD0-AF93-4B53-A4EF-019E35E8D2FB}']
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);

    function GetCodigo:String;
    function GetDescripcion:String;

    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;
  end;

  IAxnVMCltColl<T: IAxnMCtl> = interface(IAxnVMCollection<T>)
    ['{F71E6B4C-DBB1-4F6D-9DB9-A334ACB92972}']
  end;

implementation

end.
