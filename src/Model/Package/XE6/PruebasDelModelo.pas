unit PruebasDelModelo;

interface
uses
  Spring.Collections,
  Spring.Collections.Lists,
  sinapsis.axn.model.interfaz,
  sinapsis.axn.model,
  sinapsis.axn.model.DORM,
  sinapsis.axn.m,
  sinapsis.axn.m.arc.interfaz,
  sinapsis.axn.m.arc;



Procedure Test1(Modelo:IInterface);

implementation

Procedure Test1(Modelo:IInterface);
//Procedure Test1(Modelo:IAxnModel);
//var
//  Arc0 : TArchivo;
//  Arc0L : IList<TArchivo>;
Begin
//  Arc0L := TCollections.CreateObjectList<TArchivo>(True);
//  Modelo.LoadList(TArchivo ,TObject(Arc0L));
//
//  for Arc0 in Arc0L.Where (function (const Archivo:TArchivo):Boolean
//                           begin
//                                Result := Archivo.Ejecutable = 'F';
//                           end) do
//    WriteLn(Arc0.Codigo+'-'+Arc0.Nombre+'--'+Arc0.Descripcion);
  readln;
End;


end.
