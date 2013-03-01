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
  published
   [Id]
   [Column('ID')]
   property Id:Integer read FId write FId;
   [Column('CreatedBy')]
   property CreatedBy:Integer read FCreatedBy write FCreatedBy;
   [Column('CreatedAt')]
   property CreatedAt:TDateTime read FCreatedAt write FCreatedAt;
   [Column('ModifiedBy')]
   property ModifiedBy:Integer read FModifiedBy write FModifiedBy;
   [Column('ModifiedAt')]
   property ModifiedAt:TDateTime read FModifiedAt write FModifiedAt;
  end;

  [Entity('AXN_CATALOGO')]
  TAxonCatalogo = class {$ifndef Debug}abstract {$endif} (TAxonModel)
  private
    FCodigo: String;
    FDescripcion: String;
  published
    [Column('CODIGO')]
    property Codigo: String read FCodigo write FCodigo;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
  end;

  [Entity('AXN_DOCUMENTO')]
  TAxonDocumento = class {$ifndef Debug}abstract {$endif}(TAxonModel)
  private
    FSerie: String;
    FCorrelativo: Integer;
    FDocumento: String;
    FFecha: TDate;
    FDescripcion: String;
    FEmp0_Id: Integer;
    FTrn0_Id: Integer;
    FEst0_Id: Integer;
  published
    [Column('SERIE')]
    property Serie: String read FSerie write FSerie;
    [Column('CORRELATIVO')]
    property Correlativo: Integer read FCorrelativo write FCorrelativo;
    [Column('DOCUMENTO')]
    property Documento: Integer read FDocumento write FDocumento;
    [Column('FECHA')]
    property Fecha: TDate read FFecha write FFecha;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
    [Column('EMP0_ID')]
    property Emp0_Id: Integer read FEmp0_Id write FEmp0_Id;
    [Column('TRN0_ID')]
    property Trn0_Id: Integer read FTrn0_Id write FTrn0_Id;
    [Column('EST0_ID')]
    property Est0_Id: Integer read FEst0_Id write FEst0_Id;
  end;

  [Entity('AXONDETALLE')]
  TAxonDetalle = class abstract (TAxonModel)
  private
    FDet_Id: Integer;
  published
    [Column('DET_ID')]
    property Det_Id: Integer read FDet_Id write FDet_Id;
  end;

implementation

{ TAxonData }


end.
