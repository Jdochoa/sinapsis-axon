unit sinapsis.axon.m.int.test;

interface
uses
  System.Classes,
  System.SysUtils,
  dorm;


type
  TIntTest = class
  private
    Sesion : TSession;
    procedure Continente;
    procedure Moneda;
    procedure Pais;
  public
    constructor Create();
    procedure Run();
    class function intTest:TIntTest;
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
  Spring.Collections,

  sinapsis.axon.m.int
  ;

{ TIntTest }

procedure TIntTest.Continente;
var
   Axon :TContinente;
begin
  Sesion.StartTransaction;
  Axon := Sesion.Load<TContinente>(TdormCriteria.NewCriteria('CODIGO',coEqual,'LA') );
  Sesion.Commit(False);
  if Assigned(Axon) then
  begin
    Sesion.StartTransaction;
    Sesion.Delete(Axon);
    Sesion.Commit(False);
  end;


  Axon := TContinente.Create;
  Axon.Codigo := 'LA';
  Axon.Descripcion := 'Latinoamérica';

  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(False);

  FreeAndNil(Axon);
end;

constructor TIntTest.Create;
begin
  Sesion := TSession.CreateConfigured(TStreamReader.Create(ConfigFileName),

                                      deTest)
end;

class function TIntTest.intTest: TIntTest;
begin
  Result := TIntTest.Create;
end;

procedure TIntTest.Moneda;
var
   Axon :TMoneda;
begin
  Sesion.StartTransaction;
  Axon := Sesion.Load<TMoneda>(TdormCriteria.NewCriteria('CODIGO',coEqual,'GTQ') );
  Sesion.Commit(False);
  if Assigned(Axon) then
  begin
    Sesion.StartTransaction;
    Sesion.Delete(Axon);
    Sesion.Commit(False);
  end;

  Axon := TMoneda.Create;
  Axon.Codigo := 'GTQ';
  Axon.Descripcion := 'Quétzales';

  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(False);

  FreeAndNil(Axon);
end;

procedure TIntTest.Pais;
var
   Axon :TPais;
   Cnt0 :TContinente;
   Mnd0 :TMoneda;
begin
  Sesion.StartTransaction;
  Axon := Sesion.Load<TPais>(TdormCriteria.NewCriteria('CODIGO',coEqual,'GTM') );
  Sesion.DisableLazyLoad(TPais, 'Moneda');
  Sesion.LoadRelations(Axon);
  Sesion.Commit(False);


  Sesion.StartTransaction;
  Cnt0 := Sesion.Load<TContinente>(TdormCriteria.NewCriteria('CODIGO',coEqual,'LA') );
  Mnd0 := Sesion.Load<TMoneda>(TdormCriteria.NewCriteria('CODIGO',coEqual,'GTQ') );
  Sesion.Commit(False);

  Axon := TPais.Create;
  Axon.Codigo := 'GTM';
  Axon.Descripcion := 'Guatemala';
  Axon.Continente := Cnt0;
  Axon.Moneda := Mnd0;


  Sesion.StartTransaction;
  Sesion.Persist(Axon);
  Sesion.Commit(False);

  FreeAndNil(Axon);

end;

procedure TIntTest.Run;
begin
  //Continente;
  //Moneda;
  Pais;
end;

end.
