unit sinapsis.axon.m;

interface

uses
  dorm.Mappings,
  dorm.ObjectStatus;

type
  [Entity('AXONDATA')]
  TAxonModel = class {$ifndef Debug}abstract {$endif}
  private
    FId: Integer;
	  FCreatedBy : Integer;
	  FCreatedAt : TDateTime;
	  FModifiedBy : Integer;
	  FModifiedAt : TDateTime;
    FObjStatus: TdormObjectStatus;
    procedure SetObjStatus(const Value : TdormObjectStatus);
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
   [Transient]
   property ObjStatus: TdormObjectStatus read FObjStatus write SetObjStatus;
  end;

  [Entity('AXONCATALOGO')]
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

  [Entity('AXONDOCUMENTO')]
  TAxonDocumento = class {$ifndef Debug}abstract {$endif}(TAxonModel)
  private
    FPrefijo: String;
    FCorrelativo: Integer;
    FFecha: TDate;
    FDescripcion: String;
    FEmp_Id: Integer;
  published
    [Column('PREFIJO')]
    property Prefijo: String read FPrefijo write FPrefijo;
    [Column('CORRELATIVO')]
    property Correlativo: Integer read FCorrelativo write FCorrelativo;
    [Column('FECHA')]
    property Fecha: TDate read FFecha write FFecha;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
    [Column('EMP_ID')]
    property Emp_Id: Integer read FEmp_Id write FEmp_Id;
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


{ TAxonModel }


{ TAxonModel }

procedure TAxonModel.SetObjStatus(const Value: TdormObjectStatus);
begin
  FObjStatus := Value;
end;

end.
