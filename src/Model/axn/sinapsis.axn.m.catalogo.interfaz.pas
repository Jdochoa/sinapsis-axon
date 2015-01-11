unit sinapsis.axn.m.catalogo.interfaz;

interface

uses
  sinapsis.axn.m.interfaz;

type

  IAxnMCtl = interface(IAxnM)
    ['{E2A4A226-AAB9-44D1-8F09-0D53F6D887D4}']
    procedure setCodigo(const Value : string);
    procedure setDescripcion (const Value : string);

    function  getCodigo : String;
    function  getDescripcion : String;

    property Codigo: String read getCodigo write setCodigo;
    property Descripcion: String read getDescripcion write setDescripcion;
  end;

implementation

end.
