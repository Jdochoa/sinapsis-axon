unit sinapsis.axn.vm;


interface

uses
	Spring.Collections,
  Spring.Collections.Lists,

  sinapsis.axn.model.interfaz,
  sinapsis.axn.common.clases,
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m,
	sinapsis.axn.vm.interfaz;


type
  TAxnMV = class abstract (TInterfacedObjectAxn,IAxnVM)
  private
    function GetModel: IAxnModel;
    procedure SetModel(const Value: IAxnModel);
  protected
    FAxnModel : IAxnModel;
  public
//    function Create : Boolean; virtual; abstract;
    function Read   : Boolean; virtual; abstract;
//    function Update : Boolean; virtual; abstract;
//    function Delete : Boolean; virtual; abstract;

    property Model: IAxnModel read GetModel write SetModel;
  end;

  TAxnVMSingle = class abstract (TAxnMV,IAxnVMSingle)
  private
    procedure SetId(const Value : Integer);
    function GetId:Integer;
  protected
    FAxnM : IAxnM;
    procedure SetAxnM(const Value : IAxnM); virtual;
    function GetAxnM:IAxnM; virtual;
  public
    constructor Create(Value : IAxnM); virtual;
    function Read(const Id : Integer)   : Boolean; overload; virtual;
    property AxnM : IAxnM read GetAxnM write SetAxnM;
    property ID: Integer read GetID write SetID;
  end;

  TAxnVMCollection<T: IAxnM> = class abstract (TAxnMV, IAxnVMCollection<T>)
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
    function Read   : Boolean; override;
    property Lista: ICollection<T> read GetLista write SetLista;
    property Clase : TClass read GetClase write SetClase;
  end;

implementation

{ TAxnVMSingle }

constructor TAxnVMSingle.Create(Value: IAxnM);
begin
  inherited Create;
  AxnM := Value;
end;

function TAxnVMSingle.GetAxnM: IAxnM;
begin
  Result := FAxnM;
end;

function TAxnVMSingle.GetId: Integer;
begin
  Result := FAxnM.Id;
end;

function TAxnVMSingle.Read(const Id: Integer): Boolean;
begin
   Result :=  True;
end;

procedure TAxnVMSingle.SetAxnM(const Value: IAxnM);
begin
  FAxnM := Value;
end;
procedure TAxnVMSingle.SetId(const Value: Integer);
begin
  FAxnM.Id := Value;
end;

{ TAxnMV }

function TAxnMV.GetModel: IAxnModel;
begin
  Result := FAxnModel;
end;

procedure TAxnMV.SetModel(const Value: IAxnModel);
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

function TAxnVMCollection<T>.Read: Boolean;
begin
  if not Assigned(FLista) then
    FLista := TCollections.CreateList<T>;
  FLista.Clear;
  FAxnModel.LoadList(FClase,TObject(FLista));
//  FAxnModel.LoadList(T,TObject(FLista));
  Result := not Lista.IsEmpty;
end;

procedure TAxnVMCollection<T>.SetClase(const Value: TClass);
begin
  FClase := Value;
end;

procedure TAxnVMCollection<T>.SetLista(const Value: ICollection<T>);
begin
  FLista := IList<T>(Value);
end;

end.


