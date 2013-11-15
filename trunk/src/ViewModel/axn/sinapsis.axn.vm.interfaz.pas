unit sinapsis.axn.vm.interfaz;

interface

uses
  Spring.Collections;
type
  IVMAxn = interface
    ['{E48D0BD8-B3A8-4F50-B787-53EC2D393CA9}']
    procedure SetId(const Value : Integer);
    function GetId:Integer;
    property ID: Integer read GetID write SetID;
  end;

  IVMCatalogo = interface(IVMAxn)
    ['{12F18BD0-AF93-4B53-A4EF-019E35E8D2FB}']
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);

    function GetCodigo:String;
    function GetDescripcion:String;

    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;
  end;

  IVMLCatalogo = IDictionary<string,IVMCatalogo>;

  IVMDetalle = interface
    ['{3A9A9505-9407-4342-9327-15FEC0FF9B21}']
    procedure SetId(const Value : Integer);

    function GetId:Integer;

    property Id: Integer read GetId write SetId;
  end;

  IVMLDetalle = IDictionary<string,IVMDetalle>;
  IVMLDetalles = IDictionary<string,IVMDetalle>;

  IVMDocumento = interface
    ['{CB4FEBF1-180B-4EE8-A932-443B62EDCDE6}']
    procedure SetId(const Value : Integer);
    procedure SetSerie(const Value : String);
    procedure SetCorrelativo(const Value : Integer);
    procedure SetDocumento(const Value : String);
    procedure SetFecha(const Value : TDate);
    procedure SetDescripcion(const Value : String);
    procedure SetCatalogo(const Value : IVMLCatalogo);
    procedure SetDetalle (const Value : IVMLDetalles);


    function GetId : Integer;
    function GetSerie : String;
    function GetCorrelativo : Integer;
    function GetDocumento : String;
    function GetFecha : TDate;
    function GetDescripcion : String;
    function GetCatalogo : IVMLCatalogo;
    function GetDetalle : IVMLDetalles;

    property Id: Integer read GetId write SetId;
    property Serie: String read GetSerie write SetSerie;
    property Correlativo: Integer read GetCorrelativo write SetCorrelativo;
    property Documento: String read GetDocumento write SetDocumento;
    property Fecha: TDate read GetFecha write SetFecha;
    property Descripcion: String read GetDescripcion write SetDescripcion;
    property Catalogo: IVMLCatalogo read GetCatalogo write SetCatalogo;
    property Detalle: IVMLDetalles read GetDetalle write SetDetalle;

  end;

implementation

end.
