unit sinapsis.axn.common.spring.container;

interface

uses
  Spring.Container
//  Spring.DesignPatterns,
  ;
type
  IAxnContainer = interface
    ['{8207D8DB-B74A-4742-B0E7-238CC92152CA}']
    function ServiceLocator:TContainer;
  end;

  TAxnContainer = class(TInterfacedObject,IAxnContainer)
  private
    FContainer : TContainer;
  protected
  public
    constructor Create;
    destructor Done;
    function ServiceLocator: TContainer;
  end;

  TAxnModelContainer = class
  strict private
      class var FContainer : TContainer;
  public
    class function ServiceLocator: TContainer;
    destructor Destroy; override;

  end;


implementation

{ TAxnContainer }

constructor TAxnContainer.Create;
begin
  FContainer := TContainer.Create;
end;

destructor TAxnContainer.Done;
begin
  FContainer.Free;
end;

function TAxnContainer.ServiceLocator: TContainer;
begin
  Result := FContainer;
end;

{ TAxnModelContainer }

destructor TAxnModelContainer.Destroy;
begin
  FContainer.Free;
  inherited;
end;

class function TAxnModelContainer.ServiceLocator: TContainer;
begin
  if not Assigned(FContainer) then
  begin
    FContainer := TContainer.Create;

  end;
  Result := FContainer;

end;

end.
