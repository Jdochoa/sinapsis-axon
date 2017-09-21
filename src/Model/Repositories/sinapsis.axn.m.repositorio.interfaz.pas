unit sinapsis.axn.m.repositorio.interfaz;

interface

uses
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Mapping.Attributes
  ;

type

  ICrudRepository<TEntity: class, constructor; TKey> = interface(IPagedRepository<TEntity, TKey>)
    ['{C9D40D3E-56AB-49FA-A5F3-40E27A1061CF}']
  end;

  ICtlRepository<TEntity: class, constructor; TKey> = interface(ICrudRepository<TEntity, TKey>)
    ['{D5030DBD-9A20-4BDD-8F11-8D10B4E7D5EA}']

    [Query('SELECT * FROM  AXN_CATALOGO WHERE CODIGO = :0')]
    function FindByCodigo(const ACodigo : string):TEntity;
  end;


implementation

end.
