unit sinapsis.axon.m.org.test;

interface
uses
  System.Classes,
  System.SysUtils,
  dorm;


type
  TOrgTest = class
  private
    Sesion : TSession;
    procedure Empresa;
  public
    constructor Create();
    procedure Run();
    class function orgTest:TOrgTest;
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

  sinapsis.axon.m.int,
  sinapsis.axon.m.org
  ;

{ TIntTest }


constructor TOrgTest.Create;
begin
  Sesion := TSession.CreateConfigured(TStreamReader.Create(ConfigFileName),

                                      deTest)
end;

class function TOrgTest.orgTest: TOrgTest;
begin
  Result := TOrgTest.Create;
end;


procedure TOrgTest.Empresa;
var
   Axon :TEmpresa;
   Pis0 :TPais;
   Mnd0 :TMoneda;
begin
//  Sesion.StartTransaction;
//  Axon := Sesion.Load<TEmpresa>(TdormCriteria.NewCriteria('CODIGO',coEqual,'001') );
//  Sesion.DisableLazyLoad(TPais, 'Moneda');
//  Sesion.LoadRelations(Axon);
//  Sesion.Commit(False);


  Sesion.StartTransaction;
  Pis0 := Sesion.Load<TPais>(TdormCriteria.NewCriteria('CODIGO',coEqual,'GTM') );
  Mnd0 := Sesion.Load<TMoneda>(TdormCriteria.NewCriteria('CODIGO',coEqual,'GTQ') );
  Sesion.Commit(False);

  Axon := TEmpresa.Create;
  Axon.Codigo := '001';
  Axon.Descripcion := 'Sinapsis';
  Axon.Pais := Pis0;
  Axon.Moneda := Mnd0;


  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(False);

  FreeAndNil(Axon);

end;

procedure TOrgTest.Run;
begin
  Empresa;
end;

end.
