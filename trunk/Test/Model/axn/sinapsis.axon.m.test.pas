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
  ConfigFileName = 'C:\Sistemas\src\sinapsis.axon\trunk\src\SandBox\axon.conf';
  MapingFileName = '';

implementation
uses
  dorm.Commons,
  dorm.loggers.FileLog,

  dorm.adapter.UIB.Firebird,
  dorm.Filters,
  sinapsis.axn.m.intefaz,
  sinapsis.axon.m
  ;

{ TAxonTest }

class function TAxonTest.AxonTest: TAxonTest;
begin
  Result := TAxonTest.Create;
end;

procedure TAxonTest.Catalogo;
var
  Axon : IAxnMCtl;
  Axn  : IAxnMCtl;
//  Crterio :

begin
  Axon := TAxnCtl.Create;
  Axon.Codigo := '01';
  Axon.Descripcion := 'Axon Test';

  Sesion.StartTransaction;
  Sesion.Persist(TObject(Axon));
  Sesion.Commit(True);

  Sesion.StartTransaction;
  Axn := Sesion.Load<TAxnCtl>(TdormCriteria.NewCriteria('CODIGO',coEqual,'01') );
  Sesion.Commit(False);

  Sesion.StartTransaction;
  Sesion.Delete(TObject(Axn));
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
  Axon : IAxnM;
  Axn  : IAxnM;
begin
  Axon := TAxnM.Create;
  Sesion.StartTransaction;
  Sesion.Persist(TObject(Axon));
  Sesion.Commit(False);

  Sesion.StartTransaction;
  Axn := Sesion.Load<TAxnM>(Axon.Id);
  Sesion.Commit(False);

  Sesion.StartTransaction;
  Sesion.Delete(TObject(Axn));
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
