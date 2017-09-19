program ddl;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  sinapsis.axn.vm.ddl.interfaz in '..\..\ddl\sinapsis.axn.vm.ddl.interfaz.pas',
  sinapsis.axn.vm.ddl in '..\..\ddl\sinapsis.axn.vm.ddl.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
