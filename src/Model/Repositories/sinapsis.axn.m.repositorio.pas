unit sinapsis.axn.m.repositorio;

interface
uses
  Spring.Persistence.Core.Repository.Simple,
  sinapsis.axn.m.repositorio.interfaz;


type

  TCrudRepository<TEntity: class, constructor; TKey> = class(TSimpleRepository<TEntity, TKey>, ICrudRepository<TEntity, TKey>)
  strict private
    { private declarations }
  strict protected
    { protected declarations }
  public
    { public declarations }
  end;

  TCtlRepository<TEntity: class, constructor; TKey> = class(TCrudRepository<TEntity, TKey>, ICtlRepository<TEntity, TKey>)
  strict private
    { private declarations }
  strict protected
    { protected declarations }
  public
    { public declarations }
    function FindByCodigo(const ACodigo : string):TEntity; virtual; abstract;

  end;

implementation

end.
