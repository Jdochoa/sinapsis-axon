program sinapsis.axn.model.Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Collections,
  Spring.Collections.Lists,
  Spring.Services,
  Spring.Container,
  Spring.Container.Common,

  sinapsis.axn.model.interfaz,
  sinapsis.axn.modelDORM,
  sinapsis.axn.m.arc.interfaz,
  sinapsis.axn.m.arc;

procedure RegistraContenedor;
begin
  GlobalContainer.RegisterType<TAxnModelFactoryDORM>.Implements<IAxnModelFactory>('DORM').AsSingleton();
  GlobalContainer.Build;
end;
Procedure Test1(Fabrica:IAxnModelFactory);
var
  Modelo:IAxnModel;
  Arc0 : TArchivo;
  Arc0L : IList<TArchivo>;
Begin
  Modelo := Fabrica.CreateAxnModel(deDevelopment,'\Sinapsis\axn\cnf\axn.sqlite3.conf');
  Arc0L := TCollections.CreateObjectList<TArchivo>(True);
//  Arc0L := TCollections.CreateInterfaceList<IArchivo>();


  Modelo.LoadList(IArchivo as TInterfacedClass ,TObject(Arc0L));

  for Arc0 in Arc0L.Where (function (const Archivo:TArchivo):Boolean
                           begin
                                Result := Archivo.Ejecutable = 'F';
                           end) do
    WriteLn(Arc0.Nombre);
  readln;
End;

begin
  try
    RegistraContenedor;
    Test1(ServiceLocator.GetService<IAxnModelFactory>('DORM'));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
