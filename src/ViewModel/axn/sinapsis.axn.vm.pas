unit sinapsis.axn.vm;


interface

uses
  dorm,
  System.Generics.Collections,
  System.Generics.Defaults,

	Spring.Collections,
  Spring.Collections.Lists,

  sinapsis.axn.common.clases,
  sinapsis.axn.m,
	sinapsis.axn.vm.interfaz;


type

  TAxnVM = class abstract (TInterfacedObjectAxn,IVMAxn)
  private
    procedure SetId(const Value : Integer);
    function GetId:Integer;
  protected
    FAxnM : TAxnM;
    procedure SetAxnM(const Value : TAxnM); virtual;
    function GetAxnM:TAxnM; virtual;
  public
    constructor Create(Value : TAxnM);virtual;
    property AxnM : TAxnM read GetAxnM write SetAxnM;
    property ID: Integer read GetID write SetID;
  end;

  TAxnMVLista<TVM: TAxnVM; TM :TAxnM > = class (TObjectList<TVM>)
  private
  protected
    function NewItem(const Value: TM):TVM; virtual;abstract;
  public
    constructor Create(collection: System.Generics.Collections.TObjectList<TM>; ownsObjects: Boolean = True); overload;
    procedure AddRange(const collection: System.Generics.Collections.TObjectList<TM>); overload; virtual;
  end;


implementation
uses
//  sinapsis.vm.servicios,
  dorm.Filters;
//  DSharp.Core.Reflection
//  ;

{ TAxnVM }

constructor TAxnVM.Create(Value: TAxnM);
begin
  inherited Create;
  AxnM := Value;
end;

function TAxnVM.GetAxnM: TAxnM;
begin
  Result := FAxnM;
end;

function TAxnVM.GetId: Integer;
begin
  Result := FAxnM.Id;
end;

procedure TAxnVM.SetAxnM(const Value: TAxnM);
begin
  ID := Value.Id;
end;

procedure TAxnVM.SetId(const Value: Integer);
begin
  FAxnM.Id := Value;
end;

{ TAxnMVLista<T, T1> }

procedure TAxnMVLista<TVM, TM>.AddRange(
  const collection: System.Generics.Collections.TObjectList<TM>);
var
  item: TM;
begin
  for item in collection do
    Add(NewItem(item));
end;

constructor TAxnMVLista<TVM, TM>.Create(
  collection: System.Generics.Collections.TObjectList<TM>;
  ownsObjects: Boolean);
begin
//  Create(TComparer<TVM>.Default, ownsObjects);
  AddRange(collection);
end;


end.


