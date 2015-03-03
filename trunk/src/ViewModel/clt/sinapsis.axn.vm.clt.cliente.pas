unit sinapsis.axn.vm.clt.cliente;

interface

uses
  sinapsis.axn.m.clt.interfaz,
  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.vm.clt.interfaz,
  sinapsis.axn.vm,
  sinapsis.axn.vm.catalogo.interfaz,
  sinapsis.axn.vm.catalogo;

type

  TAxnVMCli0 = class (TAxnVMCtl, IAxnVMCli0)
  private
  protected
    procedure SetNit(Value:String);
    procedure SetNombres(Value:String);
    procedure SetApellidos(Value:String);
    procedure SetDireccion(Value:String);
    procedure SetAxnMCli0(Value:TAxnMCli0);

    function GetNit:String;
    function GetNombres:String;
    function GetApellidos:String;
    function GetDireccion:String;
    function GetAxnMCli0:TAxnMCli0;
  public
    property NIT: String read GetNIT write SetNIT;
    property Nombres: String read GetNombres write SetNombres;
    property Apellidos: String read GetApellidos write SetApellidos;
    property Direccion: String read GetDireccion write SetDireccion;
    property AxnMCli0: TAxnMCli0 read GetAxnMCli0 write SetAxnMCli0;
  end;

  TAxnSrvClt = Class (TAxnSrvCtl, IAxnSrvClt)
  private
  protected
    function InternalId_<T: class, constructor>(const Value:Integer; out V : T):T;
    function InternalNIT<T: TAxnMCli0, constructor>(const Value:String):T;
  public
    function Id(const Value : Integer):IAxnVMCli0; overload;
    function Codigo(const Value:String):IAxnVMCli0;
    function NIT(const Value:String):IAxnVMCli0;
  End;

  TAxnPkgClt = class (TAxnPkg, IAxnPkgClt)
  private
  protected
  public
    constructor Create; override;
  end;



implementation

uses
  Spring.Collections,
  sinapsis.axn.model.interfaz,
  sinapsis.axn.model.SORM,
  System.SysUtils,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Mapping.RttiExplorer;


{ TAxnVMPrv }

function TAxnVMCli0.GetApellidos: String;
begin
  Result := AxnMCli0.Apellido;
end;

function TAxnVMCli0.GetAxnMCli0: TAxnMCli0;
begin
  Result := TAxnMCli0(AxnM);
end;

function TAxnVMCli0.GetDireccion: String;
begin
  Result := AxnMCli0.Direccion;
end;

function TAxnVMCli0.GetNit: String;
begin
  Result := AxnMCli0.NIT;
end;

function TAxnVMCli0.GetNombres: String;
begin
  Result := AxnMCli0.Nombre;
end;

procedure TAxnVMCli0.SetApellidos(Value: String);
begin
  AxnMCli0.Apellido := Value;
end;

procedure TAxnVMCli0.SetAxnMCli0(Value: TAxnMCli0);
begin
  AxnM := Value;
end;

procedure TAxnVMCli0.SetDireccion(Value: String);
begin
  AxnMCli0.Direccion := Value;
end;

procedure TAxnVMCli0.SetNit(Value: String);
begin
  AxnMCli0.NIT := Value;
end;

procedure TAxnVMCli0.SetNombres(Value: String);
begin
  AxnMCli0.Nombre := Value;
end;

{ TAxnSrvPrv }

function TAxnSrvClt.Codigo(const Value: String): IAxnVMCli0;
begin
  Result := TAxnVMCli0.Create(InternalCodigo<TAxnMCli0>(Value));
end;

function TAxnSrvClt.Id(const Value: Integer): IAxnVMCli0;
Var
 C, V : TAxnMCli0;
 R : IAxnVMCli0;
begin
  V := TAxnMCli0.Create;
  C := InternalId<TAxnMCli0>(Value);
  C := TAxnMCli0(V);
  c := Model.Load<TAxnMCli0>(Value).FirstOrDefault;

  R := TAxnVMCli0.Create(C);
  Result := R;
end;

function TAxnSrvClt.InternalId_<T>(const Value: Integer; out V: T): T;
var
  str:String;
  cls:IList<T>;
  Cl : T;
begin
  Str := Format('select * from %s where Id = %d',[TRttiExplorer.GetTable(T).TableName,Value]);
  cls :=Model.Load<T>(Str,[]);
  cl := cls.FirstOrDefault;
  V :=Cl;
//  Temp := Cl;
  Result := cl;
  cls.Clear;
//  Result :=  Model.Load<T>(Value).FirstOrDefault;

end;

function TAxnSrvClt.InternalNIT<T>(const Value: String): T;
var
  P : IList<TAxnParam>;
  R:TAxnParam;
begin
   P := TCollections.CreateList<TAxnParam>;
   R.Nombre:= 'NIT';
   R.Valor := Value;
   R.Operador := opAnd;
   P.Add(R);
   Result :=  Model.Load<T>(P).FirstOrDefault;
end;

function TAxnSrvClt.NIT(const Value: String): IAxnVMCli0;
begin
  Result := TAxnVMCli0.Create(InternalNIT<TAxnMCli0>(Value));
end;

{ TAxnPkgPrv }

constructor TAxnPkgClt.Create;
begin
  inherited;
  FSrvMdl.AddOrSetValue('CLI0',TAxnSrvClt.Create(Model));
end;

end.
