program sinapsis.axn.model.Test;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Spring.Collections,
  sinapsis.axn.model.interfaz in '..\sinapsis.axn.model.interfaz.pas',
  sinapsis.axn.model.base in '..\sinapsis.axn.model.base.pas',
  sinapsis.axn.modelDORM in '..\sinapsis.axn.modelDORM.pas',
  sinapsis.axn.m.mdl in '..\mdl\sinapsis.axn.m.mdl.pas',
  sinapsis.axn.m.catalogo in '..\axn\sinapsis.axn.m.catalogo.pas',
  sinapsis.axn.m.interfaz in '..\axn\sinapsis.axn.m.interfaz.pas',
  sinapsis.axn.m in '..\axn\sinapsis.axn.m.pas',
  sinapsis.axn.common.clases in '..\..\Common\sinapsis.axn.common.clases.pas';

Procedure Test1;
var
  Modelo:IAxnModel;
  Mod0 : TModulo;
  Mod0L : IList<TModulo>;
Begin
  Modelo := TAxnModels.CreateAxnModel(deDevelopment,'C:\Sinapsis\axn\cnf\axn.sqlite3.conf');
  Mod0L := TCollections.CreateObjectList<TModulo>(True);
  Modelo.LoadList(TModulo,TObject(Mod0L));
  for Mod0 in Mod0L do
    WriteLn(Mod0.Nombre);
  readln;
End;

begin
  try
    Test1;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
