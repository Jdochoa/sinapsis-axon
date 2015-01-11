unit sinapsis.axn.vm.interfaz;

interface

uses
  Spring.Collections,
  sinapsis.axn.model.interfaz,
  sinapsis.axn.m.interfaz
  ;
type
  IAxnVM = interface
    ['{F2071437-AB33-4E3A-BE37-092D3CF9A979}']
    function GetModel : IAxnModel;
    procedure SetModel(const Value : IAxnModel);
//    function Create : Boolean;
    function Read   : Boolean;
//    function Update : Boolean;
//    function Delete : Boolean;
    property Model: IAxnModel read GetModel write SetModel;
  end;

  IAxnVMSingle = interface(IAxnVM)
    ['{E48D0BD8-B3A8-4F50-B787-53EC2D393CA9}']
    procedure SetId(const Value : Integer);
    function GetId:Integer;
    function Read(const Id : Integer)   : Boolean;
    property ID: Integer read GetID write SetID;
  end;

  IAxnVMCollection<T: IAxnM> = interface(IAxnVM)
    ['{E6DEB531-AFF1-4083-9D15-EF0BF75513B4}']
    function GetLista:ICollection<T>;
    function GetClase : TClass;
    procedure SetLista(const Value :ICollection<T>);
    procedure SetClase(const Value :TClass);
    property Lista: ICollection<T> read GetLista write SetLista;
    property Clase : TClass read GetClase write SetClase;
  end;
(*

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
*)
implementation

end.
