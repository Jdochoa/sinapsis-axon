unit sinapsis.axn.m.documento;

interface

uses
  dorm.Mappings,
  Spring.Collections.Lists,

  sinapsis.axn.m,
//  sinapsis.axon.m.int,
//  sinapsis.axon.m.org,
//  sinapsis.axon.m.trn,
//  sinapsis.axon.m.est
  ;
  
type
  TAxonDetalle = class;

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

	  FTransaccion : TTransaccion;
	  FEmpresa : TEmpresa;
  	FEstado : TEstado;
  protected
    [Column('EMP0_ID')]
    property Emp0_Id: Integer read FEmp0_Id write FEmp0_Id;
    [Column('TRN0_ID')]
    property Trn0_Id: Integer read FTrn0_Id write FTrn0_Id;
    [Column('EST0_ID')]
    property Est0_Id: Integer read FEst0_Id write FEst0_Id;
  public
    [Column('SERIE')]
    property Serie: String read FSerie write FSerie;
    [Column('CORRELATIVO')]
    property Correlativo: Integer read FCorrelativo write FCorrelativo;
    [Column('DOCUMENTO')]
    property Documento: string read FDocumento write FDocumento;
    [Column('FECHA')]
    property Fecha: TDate read FFecha write FFecha;
    [Column('DESCRIPCION')]
    property Descripcion: String read FDescripcion write FDescripcion;
  	[BelongsTo('EMP0_ID', True)] [Lazy]
    property Empresa: TEmpresa read FEmpresa write FEmpresa;
	  [BelongsTo('TRN0_ID', True)] [Lazy]
    property Transaccion: TTransaccion read FTransaccion write FTransaccion;
	  [BelongsTo('EST0_ID', True)] [Lazy]
    property Estado: TEstado read FEstado write FEstado;

  end;

  [Entity('AXONDETALLE')]
  TAxonDetalle = class abstract (TAxonModel)
  private
    FDet_Id: Integer;
	FAxonDocumento : TAxonDocumento;
  protected
  public
    [Column('DET_ID')]
    property Det_Id: Integer read FDet_Id write FDet_Id;
	  [BelongsTo('EMP0_ID', True)] [Lazy]
    property AxonDocumento: TAxonDocumento read FAxonDocumento write FAxonDocumento;
  end;
  
implementation


end.
