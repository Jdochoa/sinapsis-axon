unit sinapsis.axn.vm.clt.cliente;

interface

uses
  sinapsis.axn.m.clt.interfaz,
  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.vm.clt.interfaz,
  sinapsis.axn.vm,
  sinapsis.axn.vm.interfaz,
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
    constructor Create(Value: TAxnMCli0);

    property NIT: String read GetNIT write SetNIT;
    property Nombres: String read GetNombres write SetNombres;
    property Apellidos: String read GetApellidos write SetApellidos;
    property Direccion: String read GetDireccion write SetDireccion;
    property AxnMCli0: TAxnMCli0 read GetAxnMCli0 write SetAxnMCli0;
  end;

  TAxnSrvClt = Class (TAxnSrvCtl, IAxnSrvClt)
  private
  protected
    function InternalNIT<T: TAxnMCli0, constructor; T2: TAxnVMCli0, constructor>(const Value:string):T2;
  public
    function Id(const Value : Integer):IAxnVMCli0; overload;
    function Codigo(const Value:String):IAxnVMCli0;
    function NIT(const Value:String):IAxnVMCli0;

    function All:IAxnVMCollection<TAxnMCli0>;

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

constructor TAxnVMCli0.Create(Value: TAxnMCli0);
begin
//  inherited;
  AxnMCli0 := Value;
end;

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
  AxnM := TAxnMCli0(Value.ObjectClone);
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

function TAxnSrvClt.All: IAxnVMCollection<TAxnMCli0>;
begin
  Result := InternalAll<TAxnMCli0,TAxnVMCli0>;
end;

function TAxnSrvClt.Codigo(const Value: String): IAxnVMCli0;
begin
  Result := InternalCodigo<TAxnMCli0, TAxnVMCli0>(Value);
end;

function TAxnSrvClt.Id(const Value: Integer): IAxnVMCli0;
begin
  Result := InternalId<TAxnMCli0, TAxnVMCli0>(Value);
end;


function TAxnSrvClt.InternalNIT<T, T2>(const Value: string): T2;
var
  D : T;
  P : IList<TAxnParam>;
  R:TAxnParam;
begin
  Result := nil;
  P := TCollections.CreateList<TAxnParam>;
  R.Nombre:= 'NIT';
  R.Valor := Value;
  R.Operador := opAnd;
  P.Add(R);
  Result := Retorno<T,T2>(Model.Load<T>(P).FirstOrDefault);
end;


function TAxnSrvClt.NIT(const Value: String): IAxnVMCli0;
begin
  Result := InternalNIT<TAxnMCli0, TAxnVMCli0>(Value);
end;

{ TAxnPkgPrv }

constructor TAxnPkgClt.Create;
begin
  inherited;
  FSrvMdl.AddOrSetValue('CLI0',TAxnSrvClt.Create(Model));
end;

end.
