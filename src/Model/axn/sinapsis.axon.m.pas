unit sinapsis.axon.m;

interface

uses
  dorm.Mappings;

type
  [Entity('AXN_DATA')]
  TAxonModel = class {$ifndef Debug}abstract {$endif}
  private
    FId: Integer;
	  FCreatedBy : Integer;
	  FCreatedAt : TDateTime;
	  FModifiedBy : Integer;
	  FModifiedAt : TDateTime;
  public
   [Id]
   [Column('ID')]
   property Id:Integer read FId write FId;
   [Column('CREATEDBY')]
   [Transient]
   property CreatedBy:Integer read FCreatedBy write FCreatedBy;
   [Column('CREATEDAT')]
   [Transient]
   property CreatedAt:TDateTime read FCreatedAt write FCreatedAt;
   [Column('MODIFIEDBY')]
   [Transient]
   property ModifiedBy:Integer read FModifiedBy write FModifiedBy;
   [Column('MODIFIEDAT')]
   [Transient]
   property ModifiedAt:TDateTime read FModifiedAt write FModifiedAt;
  end;


  [Entity('AXN_CATALOGO')]
  TAxonCatalogo = class {$ifndef Debug}abstract {$endif} (TAxonModel)
  private
    FCodigo: String;
    FDescripcion: String;
  public
    [Column('CODIGO')]
    property Codigo: String read FCodigo write FCodigo;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
  end;

implementation



end.
