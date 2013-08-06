program Generador;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  generador.gen.axon.sinapsis in 'generador.gen.axon.sinapsis.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
