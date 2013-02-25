unit sinapsis.vm.servicios;

interface
uses
  dorm,
  Spring.Services,
  Spring.Container;

function AxonContainer: TContainer;
function AxonServiceLocator: TServiceLocator;
function AxonSession : TSession;

implementation

uses
  System.SysUtils,
  System.Classes,

  dorm.Commons
  ;

const
  ConfigFileName = '';
  MapingFileName = 'samples.mapping';

var
  _AxonContainer: TContainer;
  _AxonServiceLocator: IServiceLocator;

function AxonContainer: TContainer;
begin
  Result := _AxonContainer;
end;

function AxonServiceLocator: TServiceLocator;
begin
  Result := TServiceLocator.Instance;
end;

function AxonSession : TSession;
begin
  result :=   AxonServiceLocator.GetService<TSession>;
end;


procedure InitializeAxonContainer;
begin
  _AxonContainer := TContainer.Create;
  _AxonServiceLocator := TServiceLocatorAdapter.Create(_AxonContainer);
  AxonServiceLocator.Initialize(
    function: IServiceLocator
    begin
      Result := _AxonServiceLocator;
    end
  );


end;

initialization
  InitializeAxonContainer;
  AxonContainer.RegisterType<TSession>.DelegateTo(
     function:TSession
     begin
       Result := TSession.CreateConfigured(
                    TStreamReader.Create(ConfigFileName),
                    TStreamReader.Create(MapingFileName),
                    deDevelopment);
     end
  ).AsSingleton;


finalization
  _AxonServiceLocator := nil;
  FreeAndNil(_AxonContainer);

end.
