unit sinapsis.axon.m.trn.test;

interface
uses
  System.Classes,
  System.SysUtils,
  dorm;


type
  TTrnTest = class
  private
    Sesion : TSession;
  public
    constructor Create();
    procedure Run();
    class function trnTest:TTrnTest;
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

  sinapsis.axon.m.trn
  ;

{ TIntTest }


constructor TTrnTest.Create;
begin
  Sesion := TSession.CreateConfigured(TStreamReader.Create(ConfigFileName),

                                      deTest)
end;

class function TTrnTest.trnTest: TTrnTest;
begin
  Result := TTrnTest.Create;
end;

procedure TTrnTest.Run;
begin
end;

end.
