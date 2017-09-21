unit sinapsis.axn.m.services.est;

interface
uses
  sinapsis.axn.m.services,
  sinapsis.axn.m.repositorio.est.interfaz,
  sinapsis.axn.e.est,
  sinapsis.axn.m.services.est.interfaz
  ;

type
  TEst0Service = class(TCtlService<TEEst0, Int64, IEst0Repository{<TEEst0, Int64>}>, IEst0Service)
  strict private
    { private declarations }
  strict protected
    { protected declarations }
  public
    { public declarations }
  end;

implementation

end.
