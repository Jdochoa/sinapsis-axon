program Servicios;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  sinapsis.vm.axon.interfaz in 'axon\sinapsis.vm.axon.interfaz.pas',
  sinapsis.vm.axon.axon in 'axon\sinapsis.vm.axon.axon.pas',
  sinapsis.vm.servicios in '..\..\ViewModel\sinapsis.vm.servicios.pas';

begin
  try
//    AxonContainer.Build;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
