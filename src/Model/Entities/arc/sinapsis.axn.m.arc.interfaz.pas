unit sinapsis.axn.m.arc.interfaz;

interface
uses
  Spring.Collections,
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.Catalogo.interfaz
  ;
type
  TArch = (acExe, acFDB, acFBK, acBLP);
  TArcs = set of TArch;

  IAxnUbicacion = Interface(IAxnMCtl)
    ['{ECB29B0D-BF41-4D75-9E1F-8DE98F512245}']
  End;


  IAxnArchivo = interface(IAxnMCtl)
    ['{575DC666-5B37-47B3-A68C-A0684EAAECD1}']
    function GetNombre:string;
    procedure SetNombre(const aValue :String);
    function GetFormato:TArch;
    procedure SetFormato(const aValue:TArch);
    function GetUbicacion:IAxnUbicacion;
    procedure SetUbicacion(const aValue:IAxnUbicacion);
    function GetUbi0_Id:Integer;
    procedure SetUbi0_Id(const aValue:Integer);
    property Nombre: String read GetNombre write SetNombre;
    property Formato: TArch read GetFormato write SetFormato;
    property Ubi0_Id: Integer read GetUbi0_Id write SetUbi0_Id;
    property Ubicacion: IAxnUbicacion read GetUbicacion write SetUbicacion;

  end;


  IArchUbi = interface (IAxnM)
    ['{F8D830B7-D743-486D-8A5F-86FA52040161}']
    function GetARC0_ID:integer;
    procedure SetARC0_ID (const aValue :Integer);
    function GetUBI0_ID:integer;
    procedure SetUBI0_ID (const aValue :Integer);
    property ARC0_ID: Integer read GetARC0_ID write SetARC0_ID;
    property UBI0_ID: Integer read GetUBI0_ID write SetUBI0_ID;
  end;

  IDependencia = interface(IAxnM)
    ['{80719157-0E7A-4CD3-BD5F-49D5ADDD1E94}']
    function GetARC0_ID:integer;
    procedure SetARC0_ID (const aValue :Integer);
    function GetARC0_ID_DEP0:integer;
    procedure SetARC0_ID_DEP0 (const aValue :Integer);
    property ARC0_ID: Integer read GetARC0_ID write SetARC0_ID;
    property ARC0_ID_DEP0: Integer read GetARC0_ID_DEP0 write SetARC0_ID_DEP0;
  end;

implementation

end.
