unit sinapsis.axn.dorm.helper;

interface
uses
  dorm;
type
  TAxnSesion = class helper for TSession
    procedure PersistIntf(x:IInterface);
  end;

implementation

{ TAxnSesion }


{ TAxnSesion }

procedure TAxnSesion.PersistIntf(x: IInterface);
begin
  Persist(TObject(x));
end;

{ TAxnSesion }


end.
