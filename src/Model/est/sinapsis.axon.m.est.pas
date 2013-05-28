unit sinapsis.axon.m.est;

interface

uses
  dorm.Mappings,
  sinapsis.axon.m
  ;

type
  [Entity('TRN_TRN0_TRANSACCION')]
  TEstado = class(TAxonCatalogo)
  private
    FAfecta : Char;
  protected
  public
    [Column('AFECTA')]
    property Afecta : Char  read FAfecta write FAfecta;
  end;

implementation

end.
