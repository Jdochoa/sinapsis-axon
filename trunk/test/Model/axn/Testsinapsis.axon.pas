unit Testsinapsis.axon;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework,
  sinapsis.axn.m.intefaz,
  sinapsis.axon.m,
  dorm.Mappings;

type
  // Test methods for class TAxonModel

  TestTAxonModel = class(TTestCase)
  strict private
    FAxonModel: IAxnM;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TAxonCatalogo

  TestTAxonCatalogo = class(TTestCase)
  strict private
    FAxonCatalogo: TAxnCtl;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TAxonDocumento

  TestTAxonDocumento = class(TTestCase)
  strict private
    FAxonDocumento: TAxonDocumento;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;
  // Test methods for class TAxonDetalle

  TestTAxonDetalle = class(TTestCase)
  strict private
    FAxonDetalle: TAxonDetalle;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  end;

implementation

procedure TestTAxonModel.SetUp;
begin
  FAxonModel := TAxnM.Create;
end;

procedure TestTAxonModel.TearDown;
begin

  FAxonModel._Release;
  FAxonModel := nil;
end;

procedure TestTAxonCatalogo.SetUp;
begin
  FAxonCatalogo := TAxnCtl.Create;
end;

procedure TestTAxonCatalogo.TearDown;
begin
  FAxonCatalogo.Free;
  FAxonCatalogo := nil;
end;

procedure TestTAxonDocumento.SetUp;
begin
  FAxonDocumento := TAxonDocumento.Create;
end;

procedure TestTAxonDocumento.TearDown;
begin
  FAxonDocumento.Free;
  FAxonDocumento := nil;
end;

procedure TestTAxonDetalle.SetUp;
begin
  FAxonDetalle := TAxonDetalle.Create;
end;

procedure TestTAxonDetalle.TearDown;
begin
  FAxonDetalle.Free;
  FAxonDetalle := nil;
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTAxonModel.Suite);
  RegisterTest(TestTAxonCatalogo.Suite);
  RegisterTest(TestTAxonDocumento.Suite);
  RegisterTest(TestTAxonDetalle.Suite);
end.
