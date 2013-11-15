unit sinapsis.axn.dorm.helper;

interface
uses
  System.Generics.Collections,

  sinapsis.axn.m.interfaz,
  sinapsis.axn.m,

  dorm,
  dorm.Filters
  ;
type
  TAxnSesion = class helper for TSession
    procedure AxnPersist(x:IInterface);

  end;

implementation

{ TAxnSesion }


procedure TAxnSesion.AxnPersist(x: IInterface);
begin
  Persist(TObject(x));
end;

{ TAxnSesion }


end.
