unit sinapsis.vm.axn;


interface

uses
  dorm,
	Spring.Collections,
  sinapsis.axn.common.clases,

  sinapsis.axn.m,

	sinapsis.vm.axn.interfaz;


type

  TVMAxn = class(TInterfacedObjectAxn,IVMAxn)
  private
    FAxnM : TAxnM;
    procedure SetId(const Value : Integer);
    function GetId:Integer;
  protected
  public
    property ID: Integer read GetID write SetID;

  end;



  TAxonData = class;

  IData = Interface
  end;
  TData = class(TInterfacedObject, IData)
  end;
  TAxonData = class

  end;

{
	TVMAxon = class(TInterfacedObject, IVMAxn)
	private
    FData : TAxonData;
    FOldData: TAxonData;
    FIsEdited:Boolean;
    FIsNew : Boolean;
    FIsDeleted : Boolean;
  protected
    function InternalSave:Boolean;
		function getId : Integer;
		procedure setId (const Value : Integer);
    function getIsEdited:Boolean;
    function getIsNew:Boolean;
    function getIsDeleted:Boolean;
    procedure Read();overload; virtual;

	public
		// CRUD Create; Read; Update; Delete
		function Update:Integer;
		function Delete:Boolean;
		function Read(Id:Integer):Boolean; overload;

		function Editar:Boolean;
		function Cancelar:Boolean;

    function Save: Boolean;

		constructor Create(); overload;
		constructor Create(Id:Integer); overload;
	end;
 }
{ 	TVMAxonList<T: IVMAxon> = class(TInterfacedObject, IVMAxonList<T>)
	private
		FList : IList<T>;
	protected
//    function InternalSave:Boolean;
	public
	// CRUD Create; Read; Update; Delete
		function Update:Integer;
		function Delete:Boolean;
		function Create:Boolean;
		function Read:Boolean;

		function Editar:Boolean;
		function Cancelar:Boolean;

//		property List : IList<T>  read getList;

//		constructor Create(); overload;

	end;


  TVMAxonCatalogo = class(TVMAxon)
  private
  public
    function Read(Codigo:String):Boolean;

    function getCodigo : string;
    procedure setCodigo (const Value : String);

    function getDescripcion : string;
    procedure setDescripcion (const Value : String);

	  constructor Create(Codigo:string); overload;
   end;
}
implementation
uses
//  sinapsis.vm.servicios,
  dorm.Filters;
//  DSharp.Core.Reflection
//  ;

{ TVMAxon }
{
function TVMAxon.Cancelar: Boolean;
begin
  FisEdited := False;
  FData := AxonSession.Clone<TAxonData>(FOldData);
end;


constructor TVMAxon.Create(Id: Integer);
begin
  Create();
  Read(Id);
end;

constructor TVMAxon.Create;
begin
  FisEdited := True;
  FIsNew := True;
  FIsDeleted := False;
  FData := TAxonData.Create;
  FOldData := AxonSession.Clone<TAxonData>(FData);
end;

function TVMAxon.Delete: Boolean;
begin
  FIsDeleted := True;
end;

function TVMAxon.Editar: Boolean;
begin
  FisEdited := True;
end;

function TVMAxon.getId: Integer;
begin
  Result := FData.GetProperty('Id').GetValue(FData).AsInteger;
end;

function TVMAxon.getIsDeleted: Boolean;
begin
  Result := FIsDeleted;
end;

function TVMAxon.getIsEdited: Boolean;
begin
  result := FisEdited;
end;

function TVMAxon.getisNew: Boolean;
begin
  Result := FIsNew;
end;


function TVMAxon.InternalSave: Boolean;
begin
  if FIsNew then
    AxonSession.Insert(FData)
  else
  if FIsEdited then
    AxonSession.Update(FData)
  else
  if FIsDeleted then
    AxonSession.Delete(FData);
end;

procedure TVMAxon.Read;
begin
  FisEdited := False;
  FIsNew := False;
  FIsDeleted := False;

end;

function TVMAxon.Save: Boolean;
begin
  if AxonSession.IsInTransaction then
    try
      AxonSession.StartTransaction;
      Result := InternalSave;
      AxonSession.Commit();
    except
      AxonSession.Rollback;
      raise;
    end
  else
    Result := InternalSave;
end;

function TVMAxon.Read(Id: Integer): Boolean;
Var
 X: ICriteria;
begin
//  FData := AxonSession.Load(X);
//  FOldData := AxonSession.Clone<TData>(FData);
end;

procedure TVMAxon.setId(const Value: Integer);
begin
  FData.GetProperty('Id').SetValue(FData,Value);
end;

function TVMAxon.Update: Integer;
begin
  if AxonSession.IsInTransaction then
    try
      AxonSession.StartTransaction;
//      Result := InternalSave;
      AxonSession.Commit();
    except
      AxonSession.Rollback;
      raise;
    end
  else
//    Result := InternalSave;
end;
}
{ TVMAxonList<T> }
{
function TVMAxonList<T>.Cancelar: Boolean;
begin

end;

function TVMAxonList<T>.Create: Boolean;
begin

end;

function TVMAxonList<T>.Delete: Boolean;
begin

end;

function TVMAxonList<T>.Editar: Boolean;
begin

end;

function TVMAxonList<T>.Read: Boolean;
begin

end;

function TVMAxonList<T>.Update: Integer;
begin
  if AxonSession.IsInTransaction then
    try
      AxonSession.StartTransaction;
//      Result := InternalUpdate;
      AxonSession.Commit();
    except
      AxonSession.Rollback;
      raise;
    end
  else
//    Result := InternalUpdate;
end;
}
{ TVMAxonCatalogo }
{
constructor TVMAxonCatalogo.Create(Codigo: string);
begin
  Create();
  Read(Codigo);
end;

function TVMAxonCatalogo.getCodigo: string;
begin
  Result := FData.GetProperty('Codigo').GetValue(FData).AsString;
end;

function TVMAxonCatalogo.getDescripcion: string;
begin
  Result := FData.GetProperty('Descripcion').GetValue(FData).AsString;
end;

function TVMAxonCatalogo.Read(Codigo: String): Boolean;
begin
end;

procedure TVMAxonCatalogo.setCodigo(const Value: String);
begin
  FData.GetProperty('Codigo').SetValue(FData,Value);
end;

procedure TVMAxonCatalogo.setDescripcion(const Value: String);
begin
  FData.GetProperty('Descripcion').SetValue(FData,Value);
end;
}
{ TVMAxn }

function TVMAxn.GetId: Integer;
begin
  Result := FAxnM.Id;
end;

procedure TVMAxn.SetId(const Value: Integer);
begin
  FAxnM.Id := Value;
end;

end.


