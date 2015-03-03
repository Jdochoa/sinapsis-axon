unit sinapsis.axn.model;

interface
uses
  System.SysUtils,
  Spring.Collections,
//  Spring.Container,
  sinapsis.axn.model.Interfaz
  ;
Type
  TAxnModelType = (amtLocal, amtData);

  TAxnModelFactory = class abstract(TInterfacedObject, IAxnModelFactory)
  public
//    class function AxnModelFactory:IAxnModelFactory;
//    function CreateAxnModel(Enviroment: TAxnModelEnviroment): IAxnModel; overload; virtual; abstract;
    function CreateAxnModel({Enviroment:TAxnModelEnviroment;}strFile:TFileName):IAxnModel;overload;virtual; abstract;
  end;

//  TAxnModel = class abstract(TInterfacedObject, IAxnModel)
  TAxnModel = class //abstract
  private
  protected
    FSession :TObject;
  public
    function LoadList<T:Class, constructor>:IList<T>;
    function Load<T:Class, constructor>():IList<T>; overload;
    function Load<T:Class, constructor>(Id : Integer):IList<T>; overload;
    function Load<T:Class, constructor>(Codigo:String):IList<T>; overload;
    function Load<T:Class, constructor>(Params :IList<TAxnParam>):IList<T>;overload;
    function Load<T:Class, constructor>(const SQL:string; const params: array of const):IList<T>;overload;
  end;


function AxnModel(const Value :TAxnModelType):IAxnModel;

//function AxnModelContainer:TContainer;


implementation

//Type
//  TAxnModelContainer = class
//  strict private
//      class var FContainer : TContainer;
//  public
//    class function ServiceLocator: TContainer;
//    destructor Destroy; override;
//  end;

function AxnModel(const Value :TAxnModelType):IAxnModel;
const
  strLocal = 'DORM';
  strUbicacion = '\Sinapsis\axn\cnf\axn.sqlite3.conf';

begin
//  Result :=
//  AxnModelContainer.RegisterType<TAxnModelFactoryDORM>.Implements<IAxnModelFactory>('DORM').AsSingleton();
//  AxnModelContainer.Build;
//  result := AxnModelContainer.Resolve<IAxnModelFactory>(strLocal).CreateAxnModel({deDevelopment,}'\Sinapsis\axn\cnf\axn.sqlite3.conf')
end;

//function AxnModelContainer:TContainer;
//begin
//  Result := TAxnModelContainer.ServiceLocator;
//  Result := GlobalContainer;
//end;


{ TAxnModelFactory }

//class function TAxnModelFactory.AxnModelFactory: IAxnModelFactory;
//begin
//
//end;

{ TAxnModelContainer }

//destructor TAxnModelContainer.Destroy;
//begin
//  if assigned(FContainer) then
//    FContainer.Free;
//  inherited;
//end;
//
//class function TAxnModelContainer.ServiceLocator: TContainer;
//begin
//  if Not Assigned(FContainer) then
//    FContainer := TContainer.Create;
//  Result := FContainer;
//end;


{ TAxnModel }

function TAxnModel.Load<T>(Id: Integer): IList<T>;
begin
  Result := nil;
end;

function TAxnModel.Load<T>(Codigo: String): IList<T>;
begin
   Result := nil;
end;

function TAxnModel.Load<T>: IList<T>;
begin
  Result := nil;
end;

function TAxnModel.Load<T>(Params: IList<TAxnParam>): IList<T>;
begin
  Result := nil;
end;

function TAxnModel.LoadList<T>: IList<T>;
begin
  Result := nil;
end;

function TAxnModel.Load<T>(const SQL:String; const params: array of const): IList<T>;
begin
  Result := nil;
end;

end.
