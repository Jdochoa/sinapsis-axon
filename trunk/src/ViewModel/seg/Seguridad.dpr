program Seguridad;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.Variants,
  System.SysUtils,
  System.Win.ComObj,
  Winapi.ActiveX,
  Spring.Cryptography,
  sinapsis.axn.vm.autorizacion in 'sinapsis.axn.vm.autorizacion.pas';

procedure Test;
Var
  Clase :IAutorizaMaquina;
begin
  Clase := TAutorizaMaquina .Create('','','localhost');
  Clase.Autoriza;
  Clase.Autorizada;
end;

begin
  try
    CoInitialize(nil);
    Test;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
