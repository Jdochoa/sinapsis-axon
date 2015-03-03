unit sinapsis.axn.vm.catalogo;

interface
uses
  Spring.Collections,

  sinapsis.axn.common.clases,
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.Catalogo.interfaz,
  sinapsis.axn.m.Catalogo,

  sinapsis.axn.vm.Interfaz,
  sinapsis.axn.vm,
  sinapsis.axn.vm.Catalogo.Interfaz
  ;

type
//  TAxnVMCtl<T : IAxnMCtl> = class {abstract}(TAxnVMSingle<T>, IAxnVMCtl<T>)
  TAxnVMCtl = class {abstract}(TAxnVMSingle, IAxnVMCtl)
  private
  protected
    procedure SetAxnMCTL(const Value : TAxnMCtl);
    procedure SetCodigo(const Value : String);
    procedure SetDescripcion(const Value : String);

    function GetAxnMCTL:TAxnMCtl;
    function GetCodigo:String;
    function GetDescripcion:String;
//    procedure SetAxnM(const Value: IAxnM); override;

  public
    constructor Create(Value : TAxnMCtl); //overload;
    property Codigo: String read GetCodigo write SetCodigo;
    property Descripcion: String read GetDescripcion write SetDescripcion;
    property AxnMCtl : TAxnMCtl read GetAxnMCTL write SetAxnMCTL;
  end;

  TAxnVMCltColl<T: TAxnMCtl> = class(TAxnVMCollection<T> ,IAxnVMCollection<T>)
  private
  protected
  public
  end;

  TAxnSrvCtl = class (TAxnSrvMdl,IAxnSrvCtl)
  private
  protected
    function InternalCodigo<T: TAxnMCtl, constructor>(const Value:String):T;
  public
    function Id(const Value : Integer):IAxnVMCtl;//<IAxnMCtl>;
    function Codigo(const Value:String):IAxnVMCtl;//<IAxnMCtl>;
  end;

implementation
uses
   sinapsis.axn.model.SORM;

{ TAxnVMCtl}

constructor TAxnVMCtl{<T>}.Create(Value: TAxnMCtl);
begin
  AxnMCTL := TAxnMCTL(Value);
end;

function TAxnVMCtl{<T>}.GetAxnMCTL: TAxnMCtl;
begin
  if AxnM is TAxnMCtl then
    Result := TAxnMCtl(AxnM)
  else
    Result := nil;
end;

function TAxnVMCtl{<T>}.GetCodigo: String;
begin
  Result :=  AxnMCTL.Codigo;
end;

function TAxnVMCtl{<T>}.GetDescripcion: String;
begin
  Result :=  AxnMCTL.Descripcion;
end;

//procedure TAxnVMCtl.SetAxnM(const Value: IAxnM);
//begin
//  inherited;
//  IAxnMCTL(FAxnM).Codigo := IAxnMCTL(Value).Codigo;
//  IAxnMCTL(FAxnM).Descripcion := IAxnMCTL(FAxnM).Descripcion;
//end;

procedure TAxnVMCtl{<T>}.SetAxnMCTL(const Value: TAxnMCtl);
begin
  TAxnMCtl(FAxnM) := Value;
end;

procedure TAxnVMCtl{<T>}.SetCodigo(const Value: String);
begin
  AxnMCTL.Codigo := Value;
end;

procedure TAxnVMCtl{<T>}.SetDescripcion(const Value: String);
begin
  AxnMCTL.Descripcion:= Value;
end;

{ TAxnSrvCtl }

function TAxnSrvCtl.Codigo(const Value: String): IAxnVMCtl;//<IAxnMCtl>;
begin
  Result := TAxnVMCtl.Create(InternalCodigo<TAxnMCtl>(Value));
end;

function TAxnSrvCtl.Id(const Value: Integer): IAxnVMCtl;//<IAxnMCtl>;
begin
  Result := TAxnVMCtl.Create(InternalId<TAxnMCtl>(Value));
end;


function TAxnSrvCtl.InternalCodigo<T>(const Value: String): T;
Var
  D : IList<T>;
begin
  D := Model.Load<T>(Value);
  Result :=  Model.Load<T>(Value).FirstOrDefault;
end;

end.



