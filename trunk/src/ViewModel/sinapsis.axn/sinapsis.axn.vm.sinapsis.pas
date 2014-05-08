unit sinapsis.axn.vm.sinapsis;

interface
uses
  Vcl.ActnList,

  System.SysUtils,
  System.Generics.Collections,
  System.Generics.Defaults,

  dorm,
  dorm.Filters,
  dorm.Commons,

  sinapsis.axn.m.mdl,
  sinapsis.axn.vm.mdl

  ;
const
   _ConfFile =  'E:\Sinapsis\axn\cnf\axn.sqlite3.conf';
   _Origen = 'Origen';
   _Destino = 'Destino';


type
  TVMSinapsis = class
  private
    FSession : TSession;
  protected
    function GetModulos: TObjectList<TVMModulo>;
    function GetModulo(Index : integer): TVMModulo; overload;
    function GetModulo(Index : ICriteria): TVMModulo; overload;

  public
    constructor Create;
    destructor Destroy; override;

    property Modulos: TObjectList<TVMModulo> read GetModulos;
    procedure Ejecutar(Sender:TObject);
    property Modulo[Index:ICriteria]:TVMModulo read GetModulo;

  end;

implementation

{ TVMSinapsis }

constructor TVMSinapsis.Create;
begin
  FSession := TSession.CreateConfigured(_ConfFile,deDevelopment);
end;

destructor TVMSinapsis.Destroy;
begin
  FSession.Free;
  inherited;
end;

procedure TVMSinapsis.Ejecutar(Sender: TObject);
begin
  if Sender is TAction then
    GetModulo(TAction(Sender).Tag).Ejecutar;
end;

function TVMSinapsis.GetModulo(Index: integer): TVMModulo;
begin
  Result := GetModulo(TdormCriteriaItem.NewCriteria('id',coEqual,Index));
end;

function TVMSinapsis.GetModulo(Index: ICriteria): TVMModulo;
begin
  if Assigned(Index) then
    Result := TVMModulo.Create(FSession.Load<TModulo>(Index))
  else
    Result := nil;
end;

function TVMSinapsis.GetModulos: TObjectList<TVMModulo>;
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

end.
