unit sinapsis.axn.m.interfaz;

interface
type

  IAxnM = Interface
    ['{8F8D6CA2-E11F-4DB1-9AF4-31C21E17519F}']

    function getId():Integer;
    function getCreatedBy():Integer;
    function getCreatedAt():TDateTime;
    function getModifiedBy():Integer;
    function getModifiedAt():TDateTime;

    property Id:Integer read getId;
    property CreatedBy:Integer read getCreatedBy;
    property CreatedAt:TDateTime read getCreatedAt;
    property ModifiedBy:Integer read getModifiedBy;
    property ModifiedAt:TDateTime read getModifiedAt;
  end;

  IAxnMCtl = interface(IAxnM)
    ['{E2A4A226-AAB9-44D1-8F09-0D53F6D887D4}']
    procedure setCodigo(const Value : string);
    procedure setDescripcion (const Value : string);

    function  getCodigo : String;
    function  getDescripcion : String;

    property Codigo: String read getCodigo write setCodigo;
    property Descripcion: String read getDescripcion write setDescripcion;
  end;

  IAxnMDct = interface(IAxnM)
    ['{C820A84D-3590-4914-8C27-1FC79C4F9A46}']
    procedure setSerie(const Value : string);
    procedure setCorrelativo(const Value : Integer);
    procedure setFecha(const Value : TDate);
    procedure setDescripcion(const Value : string);
    procedure setEmp0_Id(const Value : Integer);
    procedure setTrn0_Id(const Value : Integer);
    procedure setEst0_Id(const Value : Integer);

    function getSerie:string;
    function getCorrelativo:integer;
    function getDocumento:string;
    function getFecha:TDate;
    function getDescripcion:string;
    function getEmp0_Id:Integer;
    function getTrn0_Id:Integer;
    function getEst0_Id:Integer;

    property Serie: String read getSerie write setSerie;
    property Correlativo: Integer read getCorrelativo write setCorrelativo;
    property Documento: string read getDocumento;
    property Fecha: TDate read getFecha write setFecha;
    property Descripcion: String read getDescripcion write setDescripcion;
    property Emp0_Id: Integer read getEmp0_Id write setEmp0_Id;
    property Trn0_Id: Integer read getTrn0_Id write setTrn0_Id;
    property Est0_Id: Integer read getEst0_Id write setEst0_Id;

  end;


implementation

end.
