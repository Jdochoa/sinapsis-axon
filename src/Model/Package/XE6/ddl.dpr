program ddl;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Sinapsis.axn.m.ddl.interfaz,
  sinapsis.axn.m.ddl;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
