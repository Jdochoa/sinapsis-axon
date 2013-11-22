unit sinapsis.axn.vm.mdl;

interface
uses
  System.SysUtils,
  Vcl.ActnList,
  System.Generics.Collections,
  System.Generics.Defaults,
  dorm,
  dorm.Collections,
  dorm.Commons,
  dorm.Filters,

  Spring.DesignPatterns,

  sinapsis.axn.m.mdl,
  sinapsis.axn.m.catalogo,

  sinapsis.axn.common.axnFile,
  sinapsis.axn.vm,
  sinapsis.axn.vm.catalogo
  ;

const
   _ConfFile =  'E:\Sinapsis\axn\cnf\axn.sqlite3.conf';
   _Origen = 'Origen';
   _Destino = 'Destino';

type

  IVMMdl = Interface
  ['{D412105B-E74B-4C7E-AB85-1BC11564288B}']
  end;


  TVMModulo = class (TAxnVMCtl)
  private
//    FModulo : TModulo;
    FAxnFile : TAxnFile;
    function GetModulo: TModulo;
    procedure SetModulo(const Value: TModulo);
    procedure ActualizaDependencias();
    procedure ActualizaModulo();
    function Ubicacion(strTipo:String):string;
  public
    constructor Create(const Value : TModulo);
    destructor Destroy; override;

    property Modulo: TModulo read GetModulo write SetModulo;
    procedure Ejecutar();
  end;

  TVMUbicacion = class
  private
    FUbicacion : TUbicacion;
    function GetUbicacion: TUbicacion;
    procedure SetUbicacion(const Value: TUbicacion);
  public
    constructor Create(const Value : TUbicacion);
    property Ubicacion: TUbicacion read GetUbicacion write SetUbicacion;
  end;

  TVMModUbic = class
  private
    FModUbic :TModUbic;
    function GetModUbic: TModUbic;
    procedure SetModUbic(const Value: TModUbic);
    function GetUbicacion(): TVMUbicacion;
  public
    constructor Create ( const Value : TModUbic);
    property ModUbic: TModUbic read GetModUbic write SetModUbic;
    property Ubicacion: TVMUbicacion read GetUbicacion;
  end;

  TVMMdl = class(TInterfacedObject,IVMMdl)
  private
    FSession : TSession;
//    FHanleMenu : TDictionary<string,HMODULE>;
  public
    function GetModulo(Index : string): TVMModulo; overload;
    function GetModulo(Index : ICriteria): TVMModulo; overload;
    function GetModulo(Index : integer): TVMModulo; overload;
//    function GetModulos: TObjectList<TVMModulo>;
    function GetUbicacion (Index:String):TVMUbicacion; overload;
    function GetUbicacion (Index:integer):TVMUbicacion; overload;
    function GetUbicacion (Index: ICriteria):TVMUbicacion; overload;
    function GetUbicacionModulo(Index:TVMModulo):TObjectList<TVMModUbic>;
    function GetDependencias(Index:TVMModulo):TObjectList<TDependencia>;
//    function GetMenus(Index:ICriteria):TObjectList<TVMMenu>;
//    function GetMenu(Index:string):TObjectList<TVMMenu>;
//    function GetSubMenu(Index:TVMMenu):TObjectList<TVMMenu>;
  protected
  public
    constructor Create();
    destructor Destroy; override;

    property Modulo[Index:ICriteria]:TVMModulo read GetModulo;
//    property Modulos: TObjectList<TVMModulo> read GetModulos;
    property Ubicacion[Index:ICriteria]:TVMUbicacion  read GetUbicacion;
    property UbicacionModulo[Index:TVMModulo] : TObjectList<TVMModUbic> read GetUbicacionModulo;
    property Dependencias[Index:TVMModulo] :TObjectList<TDependencia>  read GetDependencias;
//    property Menus[Index:ICriteria] :TObjectList<TVMMenu> read GetMenus;
//    property Menu[Index:String]:TObjectList<TVMMenu> read GetMenu;
//    property SubMenu[Index:TVMMenu]:TObjectList<TVMMenu> read GetSubMenu;

    procedure Ejecutar(Sender:TObject);

    procedure LoadRelation(AObject: TObject;
      ARelationsSet       : TdormRelations = [drBelongsTo, drHasMany, drHasOne];
      AConsiderLazyLoading: boolean = true);
  end;

implementation

Uses
  Winapi.Windows;
{ TVMWin }


destructor TVMMdl.Destroy;
begin
  FSession.Free;
  inherited;
end;

function TVMMdl.GetDependencias(Index: TVMModulo): TObjectList<TDependencia>;
var
  C : ICriteria;
begin
  C := TdormCriteriaItem.NewCriteria('mod0_id',coEqual,Index.Modulo.Id);
  Result := FSession.LoadList<TDependencia>(C)
end;

function TVMMdl.GetModulo(Index : string): TVMModulo;
begin
  Result := GetModulo(TdormCriteriaItem.NewCriteria('Codigo',coEqual,Index));
end;

function TVMMdl.GetModulo(Index: ICriteria): TVMModulo;
begin
  if Assigned(Index) then
    Result := TVMModulo.Create(FSession.Load<TModulo>(Index))
  else
    Result := nil;
end;
{
function TVMMdl.GetMenu(Index: string): TObjectList<TVMMenu>;
var
  Mod0:TModulo;
begin
  Mod0 := FSession.Load<TModulo>(TdormCriteriaItem.NewCriteria('Codigo',coEqual,Index));
  if Assigned(Mod0) then
  begin
    Result := Menus[TdormCriteriaItem.NewCriteria('Mod0_Id',coEqual,Mod0.Id).
        _And('Men0_Id',coIsNull,'0')];
  end
  else
    Result := nil;

end;

function TVMMdl.GetMenus(Index:ICriteria): TObjectList<TVMMenu>;
var
  Men0:TMenu;
begin
  if Assigned(Index) then
  begin
    Result := TObjectList<TVMMenu>.Create();
    for Men0  in FSession.LoadList<TMenu>(Index) do
      Result.Add(TVMMenu.Create(Men0));
    Result.Sort(TComparer<TVMMenu>.Construct( function (const L, R : TVMMenu):integer
                                              begin
                                                if (Assigned(L.Menu) and Assigned(R.Menu)) then
                                                  Result := L.Menu.Codigo.CompareTo(R.Menu.Codigo)
                                                else
                                                  Result := 0;
                                              end
                                            )
                );
  end
  else
    Result := nil;

end;
}
function TVMMdl.GetModulo(Index: integer): TVMModulo;
begin
  Result := GetModulo(TdormCriteriaItem.NewCriteria('id',coEqual,Index));
end;
{
function TVMMdl.GetModulos: TObjectList<TVMModulo>;
var
 C:ICriteria;
 Modulos:TObjectList<TModulo>;
 Modulo :TModulo;
begin
  C := TdormCriteriaItem.NewCriteria('Ejecutable',coEqual ,1);
  Modulos := FSession.LoadList<TModulo>();
  Result := TObjectList<TVMModulo>.Create();
  for Modulo  in Modulos do
    Result.Add(TVMModulo.Create(Modulo));

  Result.Sort(TComparer<TVMModulo>.Construct( function (const L, R : TVMModulo):integer
                                              begin
                                               Result := L.Modulo.Codigo.CompareTo(R.Modulo.Codigo);
                                              end
                                            )
              );
end;
}
{
function TVMMdl.GetSubMenu(Index: TVMMenu): TObjectList<TVMMenu>;
begin
    Result := Menus[TdormCriteriaItem.NewCriteria('Men0_Id',coEqual,Index.Menu.Id)];
end;
}
function TVMMdl.GetUbicacion(Index: String): TVMUbicacion;
begin
  Result := GetUbicacion(TdormCriteriaItem.NewCriteria('Codigo',coEqual,Index))
end;

function TVMMdl.GetUbicacion(Index: integer): TVMUbicacion;
begin
  Result := GetUbicacion(TdormCriteriaItem.NewCriteria('id',coEqual,Index))
end;

function TVMMdl.GetUbicacionModulo(Index: TVMModulo): TObjectList<TVMModUbic>;
var
  C : ICriteria;
  ModUbic :TModUbic;
  ModUbicaciones :TObjectList<TModUbic>;
begin
  C := TdormCriteriaItem.NewCriteria('mod0_id',coEqual,Index.Modulo.Id);
  ModUbicaciones := FSession.LoadList<TModUbic>(C);
  Result := TObjectList<TVMModUbic>.Create();
  for ModUbic  in ModUbicaciones do
    Result.Add(TVMModUbic.Create(ModUbic));

end;

procedure TVMMdl.LoadRelation(AObject: TObject; ARelationsSet: TdormRelations;
  AConsiderLazyLoading: boolean);
begin
  FSession.LoadRelations(AObject, ARelationsSet, AConsiderLazyLoading);
end;

procedure TVMMdl.Ejecutar(Sender: TObject);
begin
  if Sender is TAction then
    GetModulo(TAction(Sender).Hint).Ejecutar;
end;

constructor TVMMdl.Create;
begin
  FSession := TSession.CreateConfigured(_ConfFile,deDevelopment);
end;

function TVMMdl.GetUbicacion(Index: ICriteria): TVMUbicacion;
begin
  if Assigned(Index) then
    Result := TVMUbicacion.Create(FSession.Load<TUbicacion>(Index))
  else
    Result := nil;
end;

{ TVMModulo }

procedure TVMModulo.ActualizaDependencias();
var
  Dependencia :TDependencia;
  Mod0 : TVMModulo;
begin
  for Dependencia  in TSingleton.GetInstance<TVMMdl>.Dependencias[Self] do
  begin
    Mod0 := TSingleton.GetInstance<TVMMdl>.Modulo[TdormCriteriaItem.NewCriteria('id',coEqual,Dependencia.Mod0_Id_Dep0)];
    Mod0.ActualizaModulo();
  end;
end;

procedure TVMModulo.ActualizaModulo();
begin
  if not Assigned(FaxnFile) then
    FAxnFile := TAxnFile.Create(Modulo.Ubicaciones.Ubicacion[_Destino].Descripcion,
      Modulo.Descripcion);
  FaxnFile.ActualizaArchivo(Modulo.Ubicaciones.Ubicacion[_Origen].Descripcion);
  ActualizaDependencias();
end;

constructor TVMModulo.Create(const Value : TModulo);
begin
  Modulo := Value;
end;

destructor TVMModulo.Destroy;
begin
//  FreeAndNil(FModulo);
  if Assigned(FAxnFile) then
    FreeAndNil(FAxnFile);
  inherited;
end;

procedure TVMModulo.Ejecutar;
begin
  TSingleton.GetInstance<TVMMdl>.LoadRelation(Modulo, [drHasMany], False);
  if Assigned(FAxnFile) then
    FreeAndNil(FAxnFile);
  FaxnFile := TAxnFile.Create(Modulo.Ubicaciones.Ubicacion[_Destino].Descripcion,
    Modulo.Descripcion);
  ActualizaModulo();
  if Modulo.Ejecutale = 1 then
    FAxnFile.EjecutaArhivo;
end;

function TVMModulo.GetModulo: TModulo;
begin
  Result := TModulo(AxnMCTL);
end;

procedure TVMModulo.SetModulo(const Value: TModulo);
begin
  SetAxnMCTL(TAxnMCTL(Value));
  Modulo.Ejecutale := Value.Ejecutale;
  Modulo.Nombre := Value.Nombre;
//  Modulo.Ubicaciones := Value.Ubicaciones;
//  Modulo.Menus := Value.Menus;
//  Modulo.Dependencias := Value.Dependencias;
  if Assigned(FaxnFile) then
  begin
    FreeAndNil(FaxnFile);
  end;
end;

function TVMModulo.Ubicacion(strTipo: String): string;
var
  ModUbic: TVMModUbic;
  strOrigen  : string;
begin
  strOrigen := '';
  for ModUbic in TSingleton.GetInstance<TVMMdl>.UbicacionModulo[Self] do
  begin
    if ModUbic.ModUbic.Tipo.Equals(strTipo) then
      strOrigen := ModUbic.Ubicacion.Ubicacion.Descripcion;
  end;
  Result := strOrigen;
end;

{ TVMUbicacion }

constructor TVMUbicacion.Create(const Value: TUbicacion);
begin
  Ubicacion := Value;
end;

function TVMUbicacion.GetUbicacion: TUbicacion;
begin
  Result := FUbicacion;
end;

procedure TVMUbicacion.SetUbicacion(const Value: TUbicacion);
begin
  FUbicacion := Value;
end;

{ TVMModUbic }

constructor TVMModUbic.Create(const Value: TModUbic);
begin
  ModUbic := Value;
end;

function TVMModUbic.GetModUbic: TModUbic;
begin
  Result := FModUbic;
end;

function TVMModUbic.GetUbicacion(): TVMUbicacion;
begin
  result := TSingleton.GetInstance<TVMMdl>.Ubicacion[TdormCriteriaItem.NewCriteria('id',coEqual,ModUbic.Ubi0_Id)];
end;

procedure TVMModUbic.SetModUbic(const Value: TModUbic);
begin
  FModUbic := Value;
end;


end.
