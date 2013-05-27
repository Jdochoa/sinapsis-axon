unit sinapsis.axon.m.int;

interface

uses
  dorm.Mappings,
  Spring.Collections.Lists,

  sinapsis.axon.m

  ;

type
  TPais  = class;
  TPaises = class(TObjectList<TPais>)
  end;

  TEstado = class;
  TEstados = class(TObjectList<TEstado>)
  end;

  TMunicipio = class;
  TMunicipios = class(TObjectList<TMunicipio>)
  end;

  [Entity('INT_CNT0_CONTINENTE')]
  TContinente = class(TAxonCatalogo)
  private
  protected
  public
  end;

  [Entity('INT_MND0_MONEDA')]
  TMoneda = class(TAxonCatalogo)
  private
  protected
  public
  end;


  [Entity('INT_PIS0_PAIS')]
  TPais = class(TAxonCatalogo)
  private
	  FCnt0_ID : Integer;
	  FMnd0_ID : Integer;
    FContinente: TContinente;
    FMoneda: TMoneda;
    [Column('CNT0_ID')]
    property CNT0_ID: Integer read FCnt0_ID write FCnt0_ID;
    [Column('MND0_ID')]
    property MND0_ID: Integer read FMnd0_ID write FMnd0_ID;
  protected
  public
    [BelongsTo('CNT0_ID', True)]  [Lazy]
    property Continente: TContinente read FContinente write FContinente;
    [HasOne('MND0_ID', True)] [Lazy]
    property Moneda: TMoneda read FMoneda write FMoneda;
  end;

  [Entity('INT_EST0_ESTADO')]
  TEstado = class(TAxonCatalogo)
  private
  protected
  public
  end;

  [Entity('INT_MNC0_MUNICIPIO')]
  TMunicipio = class(TAxonCatalogo)
  private
  protected
  public
  end;
  
implementation

end.
