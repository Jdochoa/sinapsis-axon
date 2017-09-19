unit sinapsis.axn.model.SORM;

interface

uses
  System.SysUtils,
  Spring.Collections,
  uib,

  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Core.ConnectionFactory,

  sinapsis.axn.m,
  sinapsis.axn.model,
  sinapsis.axn.model.interfaz

  ;
type
//  TAxnModelSORM = class helper for TAxnModel
  TAxnModelSORM = class
  private
    FSession : TObject;
  protected
    function GetSession:TSession;
  public
    constructor Create; overload;
    constructor Create(Driver: TDBDriverType;strFile:String); overload;
    constructor Create(AConnection: IDBConnection); overload;
    function LoadList<T:TAxnM, constructor>:IList<T>;
    function Load<T:Class , constructor>():IList<T>; overload;
    function Load<T:Class, constructor>(Id : Integer):IList<T>; overload;
    function Load<T:Class, constructor>(Codigo:String):IList<T>; overload;
    function Load<T:Class, constructor>(Params :IList<TAxnParam>):IList<T>;overload;
    function Load<T:Class, constructor>(const SQL:String; const params: array of const):IList<T>;overload;

    procedure CrearModelo(entityClass: TClass);
    property Session : TSession read GetSession;

  end;

implementation

uses
   System.Classes,
   System.JSON,
   System.Rtti,

   Spring,
   Spring.Persistence.Criteria.Properties,
   Spring.Persistence.Criteria.Interfaces,
   Spring.Persistence.Criteria.Restrictions,
   Spring.Persistence.Criteria.Criterion.Conjunction,
   Spring.Persistence.Criteria.Criterion.Disjunction ,
//   Spring.Persistence.Adapters.SQLite,
//   SQLiteTable3,
   Spring.Persistence.Adapters.UIB//,
//   uib
//   Spring.Persistence.SQL.Commands.TableCreator,

;


{ TAxnModel }

constructor TAxnModelSORM.Create;
//var
//  FConnection: IDBConnection;
//  FDatabase: TSQLiteDatabase;

begin
//  FDatabase := TSQLiteDatabase.Create();
//  FDatabase.Filename := 'C:\Sinapsis\axn\dxn\axn.sqlite3';
//  FConnection := TSQLiteConnectionAdapter.Create(FDatabase);
//
//  FConnection.AutoFreeConnection := True;
//  FConnection.Connect;
//  FSession := TSession.Create(FConnection);
end;

function TAxnModelSORM.Load<T>(Id: Integer): IList<T>;
begin
  Result := Session.FindWhere<T>(Prop.Create('ID') = Id);//.ToList;
end;

procedure TAxnModelSORM.CrearModelo(entityClass: TClass);
//var
//  Model: TTableCreateExecutor;
//  strDML :string;
begin
//  Model := TTableCreateExecutor.Create;
//  Model.Connection := Session.Connection;
//  try
//    Model.Build(entityClass);
//    Model.Execute(nil);
//    strdml := Model.ToString;
//  finally
//    Model.Free;
//  end;
end;

constructor TAxnModelSORM.Create(Driver: TDBDriverType; strFile: String);
var
  FConnection: IDBConnection;
//  FDatabase: TUIBDataBase;
begin
//  FDatabase := TUIBDataBase.Create(nil);
//  FDatabase.DatabaseName := '127.0.0.1:C:\Sinapsis\axn\dxn\Multicolor\Escuintla\Axon.DXN';
//  FDatabase.UserName := 'sysdba';
//  FDatabase.PassWord := 'masterkey';
//  FConnection :=  TUIBConnectionAdapter.Create(FDatabase);

  FConnection := TConnectionFactory.GetInstanceFromFile(Driver, strFile);
  FSession := TSession.Create(FConnection);
end;

function TAxnModelSORM.Load<T>(Codigo: String): IList<T>;
begin
  Result := Session.CreateCriteria<T>.Add(Restrictions.Eq('CODIGO', Codigo)).ToList;
end;

function TAxnModelSORM.Load<T>: IList<T>;
begin
  Result := Session.FindWhere<T>(Prop.Create('Defecto') = 'T');//.ToList;
end;

function TAxnModelSORM.Load<T>(Params :IList<TAxnParam>): IList<T>;
Var
  CrL, CrR: ICriterion;
  P : TAxnParam;
begin
  for P in params do
  begin
    if (not Assigned(CrL)) then
      CrL := Restrictions.Eq(P.Nombre,p.Valor)
    else
    begin
      CrR := Restrictions.Eq(P.Nombre,p.Valor);
      case P.Operador of
        opAnd: CrL := Restrictions.&And(CrL,CrR) ;
        opOr:  CrL := Restrictions.&Or(CrL,CrR)
      end;
    end;
  end;
  Result := Session.CreateCriteria<T>.Add(CrL).ToList;
end;

function TAxnModelSORM.LoadList<T>: IList<T>;
begin
  Result := Session.FindAll<T>;
end;

function TAxnModelSORM.GetSession: TSession;
begin
  Result := TSession(FSession);
end;

constructor TAxnModelSORM.Create(AConnection: IDBConnection);
begin
  FSession := TSession.Create(AConnection);
end;

function TAxnModelSORM.Load<T>(const SQL:String; const params: array of const): IList<T>;
begin
  Result := Session.GetList<T>(SQL, []);
end;

end.
