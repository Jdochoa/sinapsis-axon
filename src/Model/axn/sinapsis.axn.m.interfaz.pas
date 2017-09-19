/// <summary>
/// Interfaces principales del modelo, esto es el ORM hacia la base de datos
/// </summary>
unit sinapsis.axn.m.interfaz;

interface

uses
 Spring.Collections
 ;

type
/// <summary>
///  Clase principal de la base de datos, todas las entidades deben tener
///  un identificador único de tipo entero
/// </summary>
  IAxnMBase = Interface
    ['{A7507176-EE49-4A1D-ABCA-DB377AA40276}']
    function getId(): Int64;
    procedure setId(Value: Int64);
    property Id: Int64 read getId write setId;
    function InterfaceClone: IAxnMBase;
  End;

/// <summary>
///  Clase que define los últimos accesos a todos los registros de la base de
///  de datos.
/// </summary>
  IAxnM = Interface(IAxnMBase)
    ['{8F8D6CA2-E11F-4DB1-9AF4-31C21E17519F}']
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
