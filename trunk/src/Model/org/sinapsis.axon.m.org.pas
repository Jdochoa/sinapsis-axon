unit sinapsis.axon.m.org;

interface

uses
  sinapsis.axon.m
  ,dorm.Mappings
  ;

type
  TAxonPais  = class;

  TAxonDepartamento = class(TAxonCatalogo)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;

  TAxonPais = class(TAxonCatalogo)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;


  TAxonEmpresa = class;
  TAxonSucursal = class(TAxonCatalogo)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;

  TAxonEmpresa = class(TAxonCatalogo)
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }

  published
    { published declarations }
  end;


implementation

end.
