unit sinapsis.axn.m.services.est.interfaz;

interface

uses
  sinapsis.axn.m.services.interfaz,
  sinapsis.axn.m.repositorio.est.interfaz,
  sinapsis.axn.e.est
  ;

type

  IEst0Service = interface(ICtlService<TEEst0, Int64, IEst0Repository{<TEEst0, Int64>}>)
    ['{E7FC8B57-1157-4EF9-8081-4A4CCE2ECF22}']
  end;

implementation

end.
