/// <summary>
/// Interfaces principales del modelo, esto es el ORM hacia la base de datos
/// </summary>
unit sinapsis.axn.e.interfaz;

interface

type
/// <summary>
///  Clase principal de la base de datos, todas las entidades deben tener
///  un identificador único de tipo entero
/// </summary>
  IAxnEBase = Interface
    ['{A7507176-EE49-4A1D-ABCA-DB377AA40276}']
    function getId(): Int64;
    procedure setId(Value: Int64);
    property Id: Int64 read getId write setId;
    function InterfaceClone: IAxnEBase;
  End;

/// <summary>
///  Clase que define los últimos accesos a todos los registros de la base de
///  de datos.
/// </summary>
  IAxnE = Interface(IAxnEBase)
    ['{71C2FB95-0B78-4501-B2CC-77F21BE8BB2F}']
    function getCreatedBy(): Integer;
    function getCreatedAt(): TDateTime;
    function getModifiedBy(): Integer;
    function getModifiedAt(): TDateTime;
    procedure setCreatedBy(Value: Integer);
    procedure setCreatedAt(Value: TDateTime);
    procedure setModifiedBy(Value: Integer);
    procedure setModifiedAt(Value: TDateTime);

    property CreatedBy: Integer read getCreatedBy write setCreatedBy;
    property CreatedAt: TDateTime read getCreatedAt write setCreatedAt;
    property ModifiedBy: Integer read getModifiedBy write setModifiedBy;
    property ModifiedAt: TDateTime read getModifiedAt write setModifiedAt;
  end;


implementation



end.
