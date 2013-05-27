unit sinapsis.axon.m.test;

interface
uses
  System.Classes,
  System.SysUtils,
  dorm;

type
  TAxonTest = class
  private
    Sesion : TSession;
    procedure Model;
    procedure Catalogo;
  public
    constructor Create();
    procedure Run();
    class function AxonTest:TAxonTest;
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
  sinapsis.axon.m
  ;

{ TAxonTest }

class function TAxonTest.AxonTest: TAxonTest;
begin
  Result := TAxonTest.Create;
end;

procedure TAxonTest.Catalogo;
var
  Axon : TAxonCatalogo;
  Axn  : TAxonCatalogo;
//  Crterio :

begin
  Axon := TAxonCatalogo.Create;
  Axon.Codigo := '01';
  Axon.Descripcion := 'Axon Test';

  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(True);

  Sesion.StartTransaction;
  Axn := Sesion.Load<TAxonCatalogo>(TdormCriteria.NewCriteria('CODIGO',coEqual,'01') );
  Sesion.Commit(False);

  Sesion.StartTransaction;
  Sesion.Delete(Axn);
  Sesion.Commit(False);

  FreeAndNil(Axon);
  FreeAndNil(Axn);

end;

constructor TAxonTest.Create();
begin
  Sesion := TSession.CreateConfigured(TStreamReader.Create(ConfigFileName),

                                      deTest)
end;

procedure TAxonTest.Model;
var
  Axon : TAxonModel;
  Axn  : TAxonModel;
begin
  Axon := TAxonModel.Create;
  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(False);

  Sesion.StartTransaction;
  Axn := Sesion.Load<TAxonModel>(Axon.Id);
  Sesion.Commit(False);

  Sesion.StartTransaction;
  Sesion.Delete(Axn);
  Sesion.Commit(False);


  FreeAndNil(Axon);
  FreeAndNil(Axn);

end;

procedure TAxonTest.Run;
begin
  Model;
  Catalogo;
end;

end.
