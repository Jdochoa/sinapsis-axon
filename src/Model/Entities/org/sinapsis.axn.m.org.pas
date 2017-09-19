unit sinapsis.axn.m.org;

interface

uses
  dorm.Mappings,
  sinapsis.axn.m,
  sinapsis.axn.m.int

  ;

type
  [Entity('ORG_EMP0_EMPRESA')]
  TEmpresa = class(TAxonCatalogo)
  private
	  FPis0_ID : Integer;
	  FMnd0_ID : Integer;
    FPais: TPais;
    FMoneda: TMoneda;
  protected
    [Column('PIS0_ID')]
    property PIS0_ID: Integer read FPis0_ID write FPis0_ID;
    [Column('MND0_ID')]
    property MND0_ID: Integer read FMnd0_ID write FMnd0_ID;
  public
    [BelongsTo('PIS0_ID', True)]
    property Pais: TPais read FPais write FPais;
    [BelongsTo('MND0_ID', True)]
    property Moneda: TMoneda read FMoneda write FMoneda;
  end;

implementation

end.
