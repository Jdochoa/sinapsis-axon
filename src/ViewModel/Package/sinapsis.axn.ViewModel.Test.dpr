program sinapsis.axn.ViewModel.Test;

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
  Spring.Persistence.Criteria.Properties,
  Spring.Persistence.Criteria.Restrictions,
  Spring.Persistence.Criteria.Criterion.Conjunction,
  Spring.Persistence.Criteria.Criterion.Disjunction,
  Spring.Persistence.Adapters.UIB,
  uib,




  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.vm.catalogo.interfaz in '..\axn\sinapsis.axn.vm.catalogo.interfaz.pas',
  sinapsis.axn.vm.Catalogo in '..\axn\sinapsis.axn.vm.Catalogo.pas',
  sinapsis.axn.vm.interfaz in '..\axn\sinapsis.axn.vm.interfaz.pas',
  sinapsis.axn.vm in '..\axn\sinapsis.axn.vm.pas',
  sinapsis.axn.vm.clt.cliente in '..\clt\sinapsis.axn.vm.clt.cliente.pas',
  sinapsis.axn.vm.clt.interfaz in '..\clt\sinapsis.axn.vm.clt.interfaz.pas',
  sinapsis.axn.model.interfaz in '..\..\Model\sinapsis.axn.model.interfaz.pas',
  sinapsis.axn.model in '..\..\Model\sinapsis.axn.model.pas',
  sinapsis.axn.model.SORM in '..\..\Model\sinapsis.axn.model.SORM.pas';

procedure Test;
var
  Pkg : IAxnPkgClt;
  Mdl : IAxnSrvClt;
  Cli0   : IAxnVMCli0;
  Model : TAxnModel;
  Cl : TAxnMCli0;
  cls : IList<TAxnMCli0>;

  FConnection: IDBConnection;
  FDatabase: TUIBDataBase;
  FSession : TSession;

begin

//  FConnection := TConnectionFactory.GetInstanceFromFilename(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json');
//  FSession := TSession.Create(FConnection);
//  Cls := fSession.FindWhere<TAxnMCli0>(GetProp('ID') = '2').ToList;
//  cls := FSession.GetList<TAxnMCli0>('Select * from Clt_cli0_cliente where id = 2', []);
////  Cls := FSession.FindAll<TAxnMCli0>;


  Model := TAxnModel.Create(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json');
//  Cls :=  Model.Load<TAxnMCli0>('select * from clt_cli0_cliente where id = 2',[]);
  Cls :=  Model.Load<TAxnMCli0>(2);
  Cl := Cls.FirstOrDefault;
//  writeln(Cl.NIT);
  Cli0 := TAxnVMCli0.Create(Cl);
  writeln(Cli0.NIT);

//  Pkg := TAxnPkgClt.Create;
//  Mdl := TAxnSrvClt(Pkg.SrvMdl['CLI0']);
  Mdl := TAxnSrvClt.Create(Model);
  Cli0 := Mdl.Id(2);
  writeln(Cli0.Nit);


end;


begin
  try
    Test;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
