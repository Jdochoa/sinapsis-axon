unit sinapsis.axn.m.documento.interfaz;

interface
uses
  sinapsis.axn.m.interfaz;

type


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
