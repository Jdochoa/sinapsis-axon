unit sinapsis.axn.m.trn;


interface

uses
  dorm.Mappings,
  Spring.Collections.Lists,
  sinapsis.axn.m,
  sinapsis.axn.m.cnf,
  sinapsis.axn.m.org,
  sinapsis.axn.m.est
  ;

type
  TTrnEmp = class;
  TTrnEmps = class(TObjectList<TTrnEmp>)
  end;

  [Entity('TRN_TRN0_TRANSACCION')]
  TTransaccion = class(TAxonCatalogo)
  private
	  FMdl0_Id : integer;
    FAfecta : Char;
    FEst0_Id : integer;
	  FModulo : TModulo;
    FTrnEmps : TTrnEmps;
    FEstado  : TEstado;
  protected
    [Column('MDL0_ID')]
    property Mdl0_ID: Integer read FMdl0_Id write FMdl0_Id;
  public
    [Column('AFECTA')]
    property Afecta : Char  read FAfecta write FAfecta;
    [BelongsTo('MDL0_ID', True)] [Lazy]
    property Modulo: TModulo read FModulo write FModulo;
	  [HasMany('TNR0_ID', True)] [Lazy]
    property TrnEmp: TTrnEmps read FTrnEmps write FTrnEmps;
    [BelongsTo('EST0_ID', True)] [Lazy]
    property Estado: TEstado read FEstado write FEstado;
  end;

  [Entity('TRN_TRN1_TRNEMP')]
  TTrnEmp = class (TAxonModel)
  private
  	FTrn0_Id : integer;
	  FEmp0_Id : Integer;
	  FTransaccion : TTransaccion;
	  FEmpresa : TEmpresa;
  protected
    [Column('TRN0_ID')]
    property Trn0_ID: Integer read FTrn0_Id write FTrn0_Id;
    [Column('EMP_ID')]
    property Emp0_ID: Integer read FEmp0_Id write FEmp0_Id;
  public
    [BelongsTo('TRN0_ID', True)] [Lazy]
    property Transaccion:TTransaccion read FTransaccion write FTransaccion;
    [BelongsTo('EMP0_ID', True)] [Lazy]
    property Empresa:TEmpresa read FEmpresa write FEmpresa;
  end;

  [Entity('TRN_CRR0_CORRELATIVO')]
  TCorrelativo = class(TAxonCatalogo)
  private
    FEmp0_Id : Integer;
    FSerie : string;
    FInicial : Integer;
    FFinal : Integer;
    FSiguiente : Integer;
	  FEmpresa : TEmpresa;
  protected
    [Column('EMP0_ID')]
    property Emp0_Id:integer read FEmp0_Id write FEmp0_Id;
  public
    [BelongsTo('EMP0_ID', True)] [Lazy]
    property Empresa:TEmpresa read FEmpresa write FEmpresa;
    [Column('SERIE')]
    property Serie:string read FSerie write FSerie;
    [Column('INICIAL')]
    property Incial:Integer read FInicial write FInicial;
    [Column('FINAL')]
    property Final:Integer read FFinal write FFinal;
    [Column('SIGUIENTE')]
    property Siguiente:Integer read FSiguiente write FSiguiente;
  end;


implementation


end.
