program ddl;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,

  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Mapping.RttiExplorer,


  sinapsis.axn.m.ddl.interfaz,
  sinapsis.axn.m.ddl,

  sinapsis.axn.model,
  sinapsis.axn.model.sorm,

  uib,

  SQLiteTable3,
  Spring.Persistence.Adapters.SQLite
  ;


procedure TestModelo;
var
  ORM : TAxnModel;
  Obj : TObject;
  FConnection: IDBConnection;
  FDatabase: TSQLiteDatabase;

begin
  FDatabase := TSQLiteDatabase.Create();
  FDatabase.Filename := 'C:\Sinapsis\axn\dxn\axn.sqlite3';
  FConnection := TSQLiteConnectionAdapter.Create(FDatabase);
  Orm := TAxnModel.Create(dtSQLite,'C:\Sinapsis\axn\cnf\axn.metadata.SQLite.json');

//  Orm := TAxnModel.Create(dtSQLite,'C:\Sinapsis\axn\cnf\axn.metadata.SQLite.json');
//  Orm := TAxnModel.Create(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json');

  try

  finally
    Orm.Free;
  end;
end;

procedure TestVistaModelo;
begin

end;


begin
  TestModelo;
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
