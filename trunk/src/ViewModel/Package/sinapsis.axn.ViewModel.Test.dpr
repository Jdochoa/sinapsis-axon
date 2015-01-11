program sinapsis.axn.ViewModel.Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Collections,
  Spring.Collections.Base,
  Spring.Collections.Lists,
  Spring.Services,
  Spring.Container,
  Spring.Container.Common,

  sinapsis.axn.model.interfaz,
  sinapsis.axn.modelDORM,

  sinapsis.axn.m.catalogo.interfaz,
  sinapsis.axn.m.catalogo,
  sinapsis.axn.m.arc.interfaz,
  sinapsis.axn.m.arc,

  sinapsis.axn.vm.catalogo.interfaz,
  sinapsis.axn.vm.catalogo
  ;

procedure RegistraContenedor;
begin
  GlobalContainer.RegisterType<TAxnModelFactoryDORM>.Implements<IAxnModelFactory>('DORM').AsSingleton();
  GlobalContainer.Build;
end;
Procedure Test1(Fabrica:IAxnModelFactory);
var
  VistaModelo:TAxnVMCltColl<TAxnMCtl>;
  Modelo:IAxnModel;
  Arc0 : TAxnMCtl;
  Arc0L : IList<IAxnMCtl>;
//  Arc0L : ICollection<IAxnMCtl>;
Begin
  VistaModelo := TAxnVMCltColl<TAxnMCtl>.Create();
  VistaModelo.Model:= Fabrica.CreateAxnModel(deDevelopment,'\Sinapsis\axn\cnf\axn.sqlite3.conf');
  VistaModelo.Clase := TArchivo;
  if VistaModelo.Read then
  begin

//  VistaModelo.Lista.w
//      Arc0L := VistaModelo.Lista;
//  Arc0L := TCollections.CreateObjectList<TArchivo>(True);
////  Arc0L := TCollections.CreateInterfaceList<IArchivo>();
//
//  Modelo.LoadList(TArchivo,TObject(Arc0L));
//
  for Arc0 in VistaModelo.Lista.Where(function (const Archivo:TAxnMCtl):Boolean
                           begin
                                Result := True;//Archivo.Ejecutable = 'F';
                           end) do
    WriteLn(Arc0.Codigo+'-'+Arc0.Descripcion);
  end;
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
