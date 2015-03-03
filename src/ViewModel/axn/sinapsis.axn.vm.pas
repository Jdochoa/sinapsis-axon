unit sinapsis.axn.vm;


interface

uses
	Spring.Collections,
  Spring.Collections.Lists,

  sinapsis.axn.model.interfaz,
  sinapsis.axn.model ,
  sinapsis.axn.model.SORM,

  sinapsis.axn.m.interfaz,
  sinapsis.axn.m,

	sinapsis.axn.vm.interfaz;


type
  TAxnMV = class abstract (TInterfacedObject,IAxnVM)
  private
    function GetModel: TAxnModel;
    procedure SetModel(const Value: TAxnModel);
  protected
    FAxnModel : TAxnModel;
  public
    constructor Create(Value:TAxnModel);
    property Model: TAxnModel read GetModel write SetModel;
  end;

//  TAxnVMSingle<T: IAxnM> = class {abstract} (TAxnMV,IAxnVMSingle<T>)
//  TAxnVMSingle = class {abstract} (TAxnMV,IAxnVMSingle)
  TAxnVMSingle = class {abstract} (TInterfacedObject,IAxnVMSingle)
  private
    procedure SetAxnM(const Value : TAxnM); virtual;
    function GetId:Integer;
    function GetAxnM:TAxnM; virtual;
    procedure SetId(const Value : Integer);
  protected
    FAxnM : TAxnM;
  public
    constructor Create(Value : TAxnM); virtual;
    property AxnM : TAxnM read GetAxnM write SetAxnM;
    property Id: Integer read GetId write SetId;
  end;

//  TAxnVMCollection<T: IAxnM> = class abstract (TAxnMV, IAxnVMCollection<T>)
  TAxnVMCollection<T: TAxnM> = class abstract (TInterfacedObject, IAxnVMCollection<T>)
  private
    function GetLista:ICollection<T>;
    function GetClase : TClass;
    procedure SetLista(const Value :ICollection<T>);
    procedure SetClase(const Value :TClass);
  protected
    FLista : ICollection<T>;
    FClase : TClass;
  public
    constructor Create();virtual;
    property Lista: ICollection<T> read GetLista write SetLista;
    property Clase : TClass read GetClase write SetClase;
  end;

  TAxnSrvMdl = class(TAxnMV, IAxnSrvMdl)
  private
  protected
    function InternalId<T: class, constructor>(const Value:Integer):T; //virtual;
  public
    function Id(const Value : Integer):IAxnVMSingle; overload;//<IAxnM>; virtual;
    function All(const Value: Integer):IAxnVMCollection<TAxnM>;
  End;

  TAxnPkg = class (TAxnMV, IAxnPkg)
  private
  protected
    FSrvMdl : IDictionary<String,IAxnSrvMdl>;
    procedure SetSrvMdl(Index : String; Value:IAxnSrvMdl);
    function GetSrvMdl(Index:String):IAxnSrvMdl;
  public
    constructor Create; virtual;
    destructor Done;
    property SrvMdl[Index:String]:IAxnSrvMdl read GetSrvMdl;// write SetSrvMdl;
  End;




implementation

uses
  System.SysUtils,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Mapping.RttiExplorer;

{ TAxnMV }

constructor TAxnMV.Create(Value: TAxnModel);
begin
  FAxnModel := Value;
end;

function TAxnMV.GetModel: TAxnModel;
begin
  Result := FAxnModel;
end;

procedure TAxnMV.SetModel(const Value: TAxnModel);
begin
  FAxnModel := Value;
end;

{ TAxnVMCollection<T> }

constructor TAxnVMCollection<T>.Create;
begin
  if not Assigned(FLista) then
    FLista := TCollections.CreateList<T>;
end;

function TAxnVMCollection<T>.GetClase: TClass;
begin
  Result := FClase;
end;

function TAxnVMCollection<T>.GetLista: ICollection<T>;
begin
  Result := FLista;
end;

//function TAxnVMCollection<T>.Read: Boolean;
//begin
//  if not Assigned(FLista) then
//    FLista := TCollections.CreateList<T>;
//  FLista.Clear;
////  FAxnModel.LoadList(FClase,TObject(FLista));
////  FAxnModel.LoadList(T,TObject(FLista));
//  Result := not Lista.IsEmpty;
//end;

procedure TAxnVMCollection<T>.SetClase(const Value: TClass);
begin
  FClase := Value;
end;

procedure TAxnVMCollection<T>.SetLista(const Value: ICollection<T>);
begin
  FLista := IList<T>(Value);
end;

{ TAxnVMSingle<T> }

constructor TAxnVMSingle{<T>}.Create(Value: TAxnM);
begin
  inherited Create;
  AxnM := Value;
end;

function TAxnVMSingle{<T>}.GetAxnM: TAxnM;//T;
begin
  Result := FAxnM;
end;

function TAxnVMSingle{<T>}.GetId: Integer;
begin
  Result := FAxnM.Id;
end;

procedure TAxnVMSingle{<T>}.SetAxnM(const Value: TAxnM);
begin
  FAxnM := Value;
end;

procedure TAxnVMSingle{<T>}.SetId(const Value: Integer);
begin
  FAxnM.Id := Value;
end;

{ TAxnSrvMdl }

function TAxnSrvMdl.All(const Value: Integer): IAxnVMCollection<TAxnM>;
begin
end;


function TAxnSrvMdl.Id(const Value: Integer): IAxnVMSingle;//<IAxnM>;
begin
  Result := TAxnVMSingle{<IAxnM>}.Create(InternalId<TAxnM>(Value));
end;

function TAxnSrvMdl.InternalId<T>(const Value: Integer): T;
var
  str:String;
  cls:IList<T>;
  Cl : T;

begin
  cls := TCollections.CreateList<T>;
  cls :=Model.Load<T>(Value);
  cl := cls.FirstOrDefault;

  Result := cl;
  cls.Clear;
//  Result :=  Model.Load<T>(Value).FirstOrDefault;
end;


{ TAxnPkg }

constructor TAxnPkg.Create;
begin
  inherited Create(TAxnModel.Create(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json'));
  FSrvMdl := TCollections.CreateDictionary<String, IAxnSrvMdl>;
end;

destructor TAxnPkg.Done;
begin

end;

function TAxnPkg.GetSrvMdl(Index: String): IAxnSrvMdl;
begin
  if FSrvMdl.ContainsKey(Index) then
    FSrvMdl.TryGetValue(Index,Result)
end;

procedure TAxnPkg.SetSrvMdl(Index: String; Value: IAxnSrvMdl);
begin
  if not FSrvMdl.ContainsKey(Index) then
    FSrvMdl.AddOrSetValue(Index,Value);

end;

end.


