unit sinapsis.axn.m.ctl.sys.interfaz;

interface
uses
  Spring.Collections,
  sinapsis.axn.m.ctl.interfaz;

type
  IAxnMSys = interface (IAxnMCtl)
     ['{254EBE43-B1D5-4E1C-A7E2-105394542DAB}']

  end;
/// <summary>
///  Interfaz de la vista con las empresas autorizada para cada uno de los
///  sistemas vendidos.
/// </summary>
  IAxnMSysEmp = interface (IAxnMCtlV)
    ['{458F2363-9930-469B-8ACF-4DBA4BC001A6}']
    procedure setSYS0(const Value : string);
    procedure setGUID(const Value : string);
    function  getSYS0 : String;
    function  getGUID : String;

    property SYS0: String read getSYS0 write setSYS0;
    property GUID: String read getGUID write setGUID;
  end;

/// <summary>
///  Repositorio de los módulos autorizados para cada uno de los sistemas
///  vendidos.
/// </summary>
  IAxnMSYSEMPRepository <T : IAxnMSysEmp> = interface(IAxnMCtlVRepository<T>)
    ['{CA2DCEA7-2686-426C-8FE1-5893A3AE19D0}']
    function FindBySYS0(const AName: string): T;
    function FindBySYS0Paged(const AName: string; APage: Integer; AItemsPerPage: Integer): IList<T>;
  end;

implementation

end.
