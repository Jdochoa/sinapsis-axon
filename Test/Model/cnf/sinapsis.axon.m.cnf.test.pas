unit sinapsis.axon.m.cnf.test;

interface
uses
  System.Classes,
  System.SysUtils,
  dorm;


type
  TCnfTest = class
  private
    Sesion : TSession;
    procedure Modulo;
  public
    constructor Create();
    procedure Run();
    class function cnfTest:TCnfTest;
  end;

const
  ConfigFileName = 'E:\sinapsis.axon\trunk\src\SandBox\axon.conf';
  MapingFileName = '';

implementation
uses
  dorm.Commons,
  dorm.loggers.FileLog,
  dorm.adapter.UIB.Firebird,
  dorm.Filters,

  sinapsis.axon.m.cnf
  ;

{ TIntTest }


constructor TCnfTest.Create;
begin
  Sesion := TSession.CreateConfigured(TStreamReader.Create(ConfigFileName),

                                      deTest)
end;

procedure TCnfTest.Modulo;
var
  Axon :TModulo;
begin
  Axon := TModulo.Create;
  Axon.Codigo := 'TRN';
  Axon.Descripcion := 'Transacciones';
  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(False);

end;

class function TCnfTest.cnfTest: TCnfTest;
begin
  Result := TCnfTest.Create;
end;

procedure TCnfTest.Run;
begin
  Modulo;
end;

end.
