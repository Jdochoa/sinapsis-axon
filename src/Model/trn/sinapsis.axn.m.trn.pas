unit sinapsis.axn.m.trn;


interface
{$I Model.inc}

uses
  {$IFDEF Marshmallow}
    Spring.Persistence.Mapping.Attributes,
  {$ELSE}
   {$IFDEF DORM}
    dorm.Mappings,
   {$ENDIF}
  {$ENDIF}
  sinapsis.axn.m,
  sinapsis.axn.m.Catalogo,
  sinapsis.axn.m.Trn.interfaz
  ;

type
 { TTrnEmp = class;
  TTrnEmps = class(TObjectList<TTrnEmp>)
  end;}
  {$IFDEF Marshmallow}
    [Entity]
    [Table('TRN_TRN0_TRANSACCION','')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('TRN_TRN0_TRANSACCION')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
  TAxnMTrn = class(TAxnMCTL, IAxnMTrn)
  private
    FFAfecta : TFAfecta;
    FLineas : Integer;
//	  FMdl0_Id : integer;
//    FEst0_Id : integer;
//	  FModulo : TModulo;
//    FTrnEmps : TTrnEmps;
//    FEstado  : TEstado;
  protected
    procedure setFAfecta (const Value : TFAfecta);
    procedure setLineas (const Value : Integer);

    function  getFAfecta : TFAfecta;
    function  getLineas : Integer;
//    [Column('MDL0_ID')]
//    property Mdl0_ID: Integer read FMdl0_Id write FMdl0_Id;
  public
  {$IFDEF Marshmallow}
     [Column('FAFECTA', [cpRequired, cpNotNull], -1, -1, -1, 'Forma Afecta')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('FAFECTA')]
   {$ENDIF}
  {$ENDIF}
    property FAfecta : TFAfecta read getFAfecta write setFAfecta;
  {$IFDEF Marshmallow}
     [Column('LINEAS', [cpRequired, cpNotNull], -1, -1, -1, 'Número de Lineas')]
  {$ELSE}
   {$IFDEF DORM}
    [Column('LINEAS')]
   {$ENDIF}
  {$ENDIF}
    property Lineas : Integer read getLineas write setLineas;

//    [BelongsTo('MDL0_ID', True)] [Lazy]
//    property Modulo: TModulo read FModulo write FModulo;
//	  [HasMany('TNR0_ID', True)] [Lazy]
//    property TrnEmp: TTrnEmps read FTrnEmps write FTrnEmps;
//    [BelongsTo('EST0_ID', True)] [Lazy]
//    property Estado: TEstado read FEstado write FEstado;
  end;
{
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
}

implementation


{ TAxnMTrn }

function TAxnMTrn.getFAfecta: TFAfecta;
begin
  Result := FFAfecta;
end;

function TAxnMTrn.getLineas: Integer;
begin
  Result := FLineas;
end;

procedure TAxnMTrn.setFAfecta(const Value: TFAfecta);
begin
  FFAfecta := Value;
end;

procedure TAxnMTrn.setLineas(const Value: Integer);
begin
  FLineas := Value;
end;

end.
