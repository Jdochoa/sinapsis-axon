program Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Collections,
  Spring.Persistence.Core.Interfaces,
  Spring.Persistence.Core.Session,
  Spring.Persistence.Core.DatabaseManager,
  Spring.Persistence.Core.ConnectionFactory,
  Spring.Persistence.Criteria.Properties,
  Spring.Persistence.Adapters.SQLite,
//  SQLiteTable3,
//  uib,
  sinapsis.axn.m.arc.interfaz,
  sinapsis.axn.m.arc,
  Sinapsis.axn.m.trn,
  sinapsis.axn.m.clt.cliente,
  sinapsis.axn.model in '..\..\sinapsis.axn.model.pas',
  sinapsis.axn.model.SORM in '..\..\sinapsis.axn.model.SORM.pas';

procedure PruebaSqLite;
var
  ORM : TAxnModel;
  Arc0s: IList<TAxnArchivo>;
  Arc0 : TAxnArchivo;
  Obj : TObject;
//  iArc0 : IAxnArchivo;
begin
  Orm := TAxnModel.Create;
//  Arc0s := Orm.LoadList<TAxnArchivo>;
//  for Arc0 in Arc0s do
//  begin
//    Writeln(Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
//  end;
//  Arc0 := ORM.Load<TAxnArchivo>().FirstOrDefault;
//  if Assigned(Arc0) then
//    Writeln('1'+Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
//  Arc0 := ORM.Load<TAxnArchivo>(19).FirstOrDefault;
//  if Assigned(Arc0) then
//    Writeln('2'+Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
//  Arc0 := ORM.Load<TAxnArchivo>('axn').FirstOrDefault;
//  if Assigned(Arc0) then
//    Writeln('3'+Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
end;

Procedure PruebaFirebird;
var
  ORM : TAxnModel;
  Trn0:TAxnMTrn;
   Clt0s : IList<TAxnMCli0>;
   Cli0 : TAxnMCli0;
begin
  Orm := TAxnModel.Create(dtUIB, 'C:\Sinapsis\axn\cnf\axn.firebird.json');
  try
//    ORM.CrearModelo(TAxnMTrn);
    Clt0s := Orm.LoadList<TAxnMCli0>;
    for Cli0 in Clt0s do
    begin
      Writeln(Cli0.Codigo+'-'+Cli0.NIT+'-->'+Cli0.Descripcion);
    end;
//    Trn0 := ORM.Load<TAxnMTrn>(1).FirstOrDefault;
//    if Assigned(Trn0) then
//      Writeln(Trn0.Codigo +'\'+Trn0.Descripcion);
  finally
    Orm.Free;
  end;

end;

//procedure TORM.load;
//Var
//  Arc0s: IList<TAxnArchivo>;
//  Arc0 : TAxnArchivo;
//  Defecto : Prop;
//begin
//  Arc0s := FSession.FindAll<TAxnArchivo>;
//  for Arc0 in Arc0s do
//  begin
//    Writeln(Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
//  end;
////  Writeln('');
////  Writeln('');
////  Writeln('');
////  Defecto := GetProp('Defecto');
////  for Arc0 in FSession.FindWhere<TAxnArchivo>(Defecto = 'T').ToList do
////  begin
////    Writeln(Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
////  end;
////  Writeln('');
////  Writeln('');
////  Arc0 := FSession.FindWhere<TAxnArchivo>(Defecto = 'T').ToList.First;
////  Writeln(Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
////
////  Writeln('');
////  Writeln('');
////  Arc0 := FSession.FindOne<TAxnArchivo>(Integer(28));
////  Writeln(Arc0.Ubicacion.Descripcion +'\'+Arc0.Nombre);
////  Writeln('');
////  Writeln('');
//
//
//end;

begin
  try
//    PruebaSqLite;
  PruebaFirebird;
  readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

