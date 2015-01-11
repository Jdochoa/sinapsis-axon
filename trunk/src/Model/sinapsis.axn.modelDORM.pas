unit sinapsis.axn.modelDORM;

interface
uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils,
  Spring.Collections,
  dorm,
  sinapsis.axn.m,
  sinapsis.axn.model.interfaz;

type

  TAxnModelFactoryDORM = class(TInterfacedObject, IAxnModelFactory)
    function CreateAxnModel(Enviroment:TAxnModelEnviroment):IAxnModel; overload;
    function CreateAxnModel(Enviroment:TAxnModelEnviroment;strFile:TFileName):IAxnModel; overload;
  end;


  TAxnModelDORM = class (TInterfacedObject, IAxnModel)
  private
    FSession: TSession;
  protected
  public
    constructor Create(strFile: TFileName);
    Procedure LoadList(AClassType: TClass; List : TObject);overload;
    Procedure LoadList(AClassType: TInterfacedClass; List : TObject);overload;
    procedure LoadList<T: class>(List : TObject);overload;
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

Procedure TAxnModelDORM.LoadList(AClassType: TClass; List : TObject);
begin
  FSession.LoadList(AClassType,nil,List);
end;


procedure TAxnModelDORM.LoadList(AClassType: TInterfacedClass; List: TObject);
begin
  FSession.LoadList(AClassType,nil,List);
end;

procedure TAxnModelDORM.LoadList<T>(List: TObject);
begin
  FSession.LoadList<T>(nil,List);
end;

{ TAxnModelFactoryDORM }

function TAxnModelFactoryDORM.CreateAxnModel(
  Enviroment: TAxnModelEnviroment): IAxnModel;
begin

end;

function TAxnModelFactoryDORM.CreateAxnModel(Enviroment: TAxnModelEnviroment;
  strFile: TFileName): IAxnModel;
begin
  Result := TAxnModelDORM.Create(strFile);
end;

end.
