unit sinapsis.axn.vm.prv.proveedor;

interface

uses
  sinapsis.axn.m.prv.interfaz,
  sinapsis.axn.m.prv.proveedor,
  sinapsis.axn.vm.prv.interfaz,
  sinapsis.axn.vm,
  sinapsis.axn.vm.catalogo.interfaz,
  sinapsis.axn.vm.catalogo;

type

  TAxnVMPrv = class (TAxnVMCtl, IAxnVMPrv)
  private
  protected
    procedure SetNit(Value:String);
    procedure SetNombres(Value:String);
    procedure SetApellidos(Value:String);
    procedure SetDireccion(Value:String);
    procedure SetAxnMPrv(Value:IAxnMPrv);

    function GetNit:String;
    function GetNombres:String;
    function GetApellidos:String;
    function GetDireccion:String;
    function GetAxnMPrv:IAxnMPrv;
  public
    property NIT: String read GetNIT write SetNIT;
    property Nombres: String read GetNombres write SetNombres;
    property Apellidos: String read GetApellidos write SetApellidos;
    property Direccion: String read GetDireccion write SetDireccion;
    property AxnMPrv: IAxnMPrv read GetAxnMPrv write SetAxnMPrv;
  end;

  TAxnSrvPrv = Class (TAxnSrvCtl, IAxnSrvPrv)
  private
  protected
    function InternalNIT<T: TAxnMPrv, constructor>(const Value:String):T;
  public
    function Id(const Value : Integer):IAxnVMPrv;
    function Codigo(const Value:String):IAxnVMPrv;
    function NIT(const Value:String):IAxnVMPrv;
  End;

  TAxnPkgPrv = class (TAxnPkg, IAxnPkgPrv)
  private
  protected
  public
    constructor Create; override;
  end;



implementation

uses
  Spring.Collections,
  sinapsis.axn.model.interfaz,
  sinapsis.axn.model.SORM;

{ TAxnVMPrv }

function TAxnVMPrv.GetApellidos: String;
begin
  Result := AxnMPrv.Apellido;
end;

function TAxnVMPrv.GetAxnMPrv: IAxnMPrv;
begin
  Result := IAxnMPrv(AxnM);
end;

function TAxnVMPrv.GetDireccion: String;
begin
  Result := AxnMPrv.Direccion;
end;

function TAxnVMPrv.GetNit: String;
begin
  Result := AxnMPrv.NIT;
end;

function TAxnVMPrv.GetNombres: String;
begin
  Result := AxnMPrv.Nombre;
end;

procedure TAxnVMPrv.SetApellidos(Value: String);
begin
  AxnMPrv.Apellido := Value;
end;

procedure TAxnVMPrv.SetAxnMPrv(Value: IAxnMPrv);
begin
  AxnM := Value;
end;

procedure TAxnVMPrv.SetDireccion(Value: String);
begin
  AxnMPrv.Direccion := Value;
end;

procedure TAxnVMPrv.SetNit(Value: String);
begin
  AxnMPrv.NIT := Value;
end;

procedure TAxnVMPrv.SetNombres(Value: String);
begin
  AxnMPrv.Nombre := Value;
end;

{ TAxnSrvPrv }

function TAxnSrvPrv.Codigo(const Value: String): IAxnVMPrv;
begin
  Result := TAxnVMPrv.Create(InternalCodigo<TAxnMPrv>(Value));
end;

function TAxnSrvPrv.Id(const Value: Integer): IAxnVMPrv;
begin
  Result := TAxnVMPrv.Create(InternalId<TAxnMPrv>(Value));
end;

function TAxnSrvPrv.InternalNIT<T>(const Value: String): T;
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

function TAxnSrvPrv.NIT(const Value: String): IAxnVMPrv;
begin
  Result := TAxnVMPrv.Create(InternalNIT<TAxnMPrv>(Value));
end;

{ TAxnPkgPrv }

constructor TAxnPkgPrv.Create;
begin
  inherited;
  FSrvMdl.AddOrSetValue('PRV',TAxnSrvPrv.Create(Model));
end;

end.
