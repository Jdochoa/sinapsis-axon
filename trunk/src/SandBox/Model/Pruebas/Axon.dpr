program Axon;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  sinapsys.axon.common.generator in '..\..\..\Common\sinapsys.axon.common.generator.pas',
  sinapsis.axon.m in '..\..\..\Model\axn\sinapsis.axon.m.pas',
  sinapsis.axon.m.int in '..\..\..\Model\int\sinapsis.axon.m.int.pas',
  sinapsis.axon.m.int.test in '..\..\..\..\test\Model\int\sinapsis.axon.m.int.test.pas',
  sinapsis.axon.m.org in '..\..\..\Model\org\sinapsis.axon.m.org.pas',
  sinapsis.axon.m.org.test in '..\..\..\..\test\Model\org\sinapsis.axon.m.org.test.pas',
  sinapsis.axon.m.cnf in '..\..\..\Model\cnf\sinapsis.axon.m.cnf.pas',
  sinapsis.axon.m.cnf.test in '..\..\..\..\test\Model\cnf\sinapsis.axon.m.cnf.test.pas',
  sinapsis.axon.m.trn in '..\..\..\Model\trn\sinapsis.axon.m.trn.pas',
  sinapsis.axon.m.trn.test in '..\..\..\..\test\Model\trn\sinapsis.axon.m.trn.test.pas',
  sinapsis.axon.m.est in '..\..\..\Model\est\sinapsis.axon.m.est.pas',

  sinapsis.axon.m.axn.documento in '..\..\..\Model\axn\sinapsis.axon.m.axn.documento.pas'
  ;

procedure RunInt();
var
  AxonTest : TIntTest;
begin
  AxonTest := TIntTest.Create;
  try
    AxonTest.run();
  finally
    AxonTest.Free;
  end;
end;

procedure RunOrg();
var
  AxonTest : TOrgTest;
begin
  AxonTest := TOrgTest.orgTest;
  try
    AxonTest.run();
  finally
    AxonTest.Free;
  end;
end;

procedure RunCnf();
var
  AxonTest : TCnfTest;
begin
  AxonTest := TCnfTest.cnfTest;
  try
    AxonTest.run();
  finally
    AxonTest.Free;
  end;
end;

begin
  try
    RunCnf();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
