program Pruebas;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Collections,
  Spring.Collections.Base,
  Spring.Collections.Lists,

  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Core.DatabaseManager,
  Spring.Persistence.Core.ConnectionFactory,

  Spring.Persistence.Core.Repository.Proxy,
  Spring.Persistence.Core.Repository.Simple,

  Spring.Persistence.Criteria.Interfaces,
  Spring.Persistence.Criteria.Properties,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.Criterion.Conjunction,
  Spring.Persistence.Criteria.Criterion.Disjunction,

  Spring.Persistence.Adapters.UIB,
  uib,
  sinapsis.axn.m.clt.cliente
  ;

type
  ICustomerRepository = interface(IPagedRepository<TAxnMCli0, Integer>)
    ['{C306C170-AB69-4993-AEBB-8E530988095D}']

    [Query('SELECT * FROM CLT_CLI0_CLIENTE WHERE Codigo = :0')]
    function FindByCodigo(const AName: string): TAxnMCli0;

    [Query('SELECT * FROM CLT_CLI0_CLIENTE WHERE Codigo = :0')]
    function FindByNamePaged(const AName: string; APage: Integer; AItemsPerPage: Integer): IDBPage<TAxnMCli0>;
  end;



procedure PruebaORM;
var
  FConnection: IDBConnection;
  FDatabase: TUIBDataBase;
  FSession : TSession;
  Cls :IList<TAxnMCli0>;
  P : Prop;
  C : ICriterion;
  FCustomerRepository: ICustomerRepository;
  Cli0: TAxnMCli0;
begin
  FConnection := TConnectionFactory.GetInstanceFromFilename(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json');
  FSession := TSession.Create(FConnection);
//  P := GetProp('ID');
//  Cls := fSession.FindWhere<TAxnMCli0>(P = '2').ToList;
//  writeln(cls.FirstOrDefault.NIT)

  FCustomerRepository := TProxyRepository<TAxnMCli0, Integer>.Create(FSession, TypeInfo(ICustomerRepository)) as ICustomerRepository;
  Cli0 := FCustomerRepository.FindByCodigo('02');
  writeln(Cli0.NIT);
  Cli0 := FCustomerRepository.FindOne(2);
  writeln(Cli0.NIT);


end;



begin
  try
    PruebaORM;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
