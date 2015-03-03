program sinapsis.axn.model.Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  PruebasDelModelo in 'PruebasDelModelo.pas';

//Procedure Test1(Modelo:IInterface);
//Procedure Test1(Modelo:IAxnModel);
//var
//  Arc0 : TArchivo;
//  Arc0L : IList<TArchivo>;
//Begin
//  Arc0L := TCollections.CreateObjectList<TArchivo>(True);
//  Modelo.LoadList(TArchivo ,TObject(Arc0L));
//
//  for Arc0 in Arc0L.Where (function (const Archivo:TArchivo):Boolean
//                           begin
//                                Result := Archivo.Ejecutable = 'F';
//                           end) do
//    WriteLn(Arc0.Codigo+'-'+Arc0.Nombre+'--'+Arc0.Descripcion);
//  readln;
//End;

begin
  try
    //Test1(AxnModel(amtLocal));
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
