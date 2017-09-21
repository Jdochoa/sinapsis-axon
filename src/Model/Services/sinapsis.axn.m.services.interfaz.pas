unit sinapsis.axn.m.services.interfaz;

interface

uses
  Spring.Collections,
  Spring.Persistence.Criteria.Interfaces,
  sinapsis.axn.m.repositorio.interfaz
  ;

type
  ICrudService<TEntity: class, constructor; TKey; IRepository: ICrudRepository<TEntity, TKey>> = interface(IInvokable)
    ['{7C1CA501-1547-4C37-AD85-259BC9FAFBD0}']
    function Count: Integer;

    function FindOne(const id: TKey): TEntity;
    function FindAll: IList<TEntity>;

    function FindWhere: ICriteria<TEntity>; overload;
    function FindWhere(const expression: ICriterion): IList<TEntity>; overload;


    function Exists(const id: TKey): Boolean;

    procedure Insert(const entity: TEntity); overload;
    procedure Insert(const entities: IEnumerable<TEntity>); overload;

    function Save(const entity: TEntity): TEntity; overload;
    function Save(const entities: IEnumerable<TEntity>): IEnumerable<TEntity>; overload;
    procedure SaveCascade(const entity: TEntity);

    procedure Delete(const entity: TEntity); overload;
    procedure Delete(const entities: IEnumerable<TEntity>); overload;
    procedure DeleteAll;
  end;

  ICtlService<TEntity: class, constructor; TKey; IRepository: ICtlRepository<TEntity, TKey>> = interface(ICrudService<TEntity,TKey,IRepository>)
    ['{CE40FA1E-EEE1-498B-A43C-491B589C171B}']
    function FindByCodigo(const ACodigo : string):TEntity;
  end;

implementation

end.
