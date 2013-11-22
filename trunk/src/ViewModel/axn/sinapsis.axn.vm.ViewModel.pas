unit sinapsis.axn.vm.ViewModel;

interface
uses
  System.SysUtils,

  dorm,
  dorm.Filters,
  dorm.Commons,

  Spring.DesignPatterns,
  Spring.Services,
  Spring.Container,

  sinapsis.axn.vm.interfaz,
  sinapsis.axn.vm
  ;

type
  TViewModel = class
  private
    FSession : TSession;
  protected
    property Session: TSession read FSession write FSession;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadRelation(AObject: TObject;
      ARelationsSet       : TdormRelations = [drBelongsTo, drHasMany, drHasOne];
      AConsiderLazyLoading: boolean = true);
    function Id<T:TAxnVM>(const Value: Integer):T;
    function Codigo<T:TAxnVM>(const Value :String):T;
  end;

implementation

{ TViewModel }

function TViewModel.Codigo<T>(const Value: String): T;
begin

end;

constructor TViewModel.Create;
var
  i : IInterface;
begin
//  FSession := TSession(ServiceLocator.GetService<IInterface>('Base'))
  if not ServiceLocator.TryGetService<IInterface>('Base',I) then
    raise Exception.Create('¡No se ha inicializado la base de datos')
  else
    FSession := TSession(i);
end;

destructor TViewModel.Destroy;
begin

  inherited;
end;


function TViewModel.Id<T>(const Value: Integer): T;
begin

end;

procedure TViewModel.LoadRelation(AObject: TObject;
  ARelationsSet: TdormRelations; AConsiderLazyLoading: boolean);
begin
  Session.LoadRelations(AObject,ARelationsSet,AConsiderLazyLoading);
end;

end.
