unit sinapsis.axn.model.DORM;

interface
uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils,
  Spring.Collections,
  dorm,
  sinapsis.axn.m,
  sinapsis.axn.model.interfaz,
  sinapsis.axn.model;

type

  TAxnModelFactoryDORM = class(TAxnModelFactory)
//    function CreateAxnModel(Enviroment:TAxnModelEnviroment):IAxnModel; overload;
    function CreateAxnModel({Enviroment:TAxnModelEnviroment;}strFile:TFileName):TAxnModel; overload;
  end;


  TAxnModelDORM = class (TAxnModel)
  private
    FSession: TSession;
  protected
  public
    constructor Create(strFile: TFileName);

  end;

implementation

uses
  System.Classes,
  dorm.Commons
  ;


{ TAxnModelDORM }

constructor TAxnModelDORM.Create(strFile: TFileName);
begin
  FSession := TSession.CreateConfigured(TStreamReader.Create(strFile), deDevelopment);
end;


{ TAxnModelFactoryDORM }

//function TAxnModelFactoryDORM.CreateAxnModel(
//  Enviroment: TAxnModelEnviroment): IAxnModel;
//begin
//
//end;

function TAxnModelFactoryDORM.CreateAxnModel({Enviroment: TAxnModelEnviroment;}
  strFile: TFileName): TAxnModel;
begin
  Result := TAxnModelDORM.Create(strFile);
end;

Initialization
  //AxnModelContainer.RegisterType<TAxnModelFactoryDORM>.Implements<IAxnModelFactory>('DORM').AsSingleton();
//  AxnModelContainer.RegisterType<TAxnModelDORM>.Implements<IAxnModel>('DORM').AsSingleton();

end.
