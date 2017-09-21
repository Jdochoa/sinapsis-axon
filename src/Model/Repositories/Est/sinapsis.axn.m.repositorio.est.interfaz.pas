unit sinapsis.axn.m.repositorio.est.interfaz;

interface
uses
  Spring.Persistence.Mapping.Attributes,
  sinapsis.axn.m.repositorio.interfaz,
  sinapsis.axn.e.ctl.interfaz,
  sinapsis.axn.e.ctl,
  sinapsis.axn.e.est.interfaz,
  sinapsis.axn.e.est
  ;
type

  IEst0Repository{<TEntity: class, constructor; TKey>} = interface(ICtlRepository<TEEst0, Int64>)
    ['{413E20AD-BC2C-4DCE-90C4-4EEDA7BAD0BA}']

    [Query('SELECT * FROM EST_EST0_ESTADO WHERE CODIGO = :0')]
    function FindByCodigo(const ACodigo : string):TEEst0;
  end;


implementation

end.
