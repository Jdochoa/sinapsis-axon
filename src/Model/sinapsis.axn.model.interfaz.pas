unit sinapsis.axn.model.interfaz;

interface
uses
  System.SysUtils,
  Spring.Collections,
  System.Rtti
  ;


type
  TAxnOperator  = (opAnd, opOr);
  TAxnModelEnviroment = (deDevelopment, deTest, deRelease);

  IAxnModel = interface
    ['{AA819A0D-4B30-4937-856E-E4914ABA9D1D}']
  end;

  IAxnModelFactory = interface
    ['{010448F8-AE56-48F7-99E0-69E8DF8FB00A}']
  end;

  TAxnParam = record
    Nombre:String;
    Valor:TValue;
    Operador:TAxnOperator;
  end;

  TAxnParams = Interface(IList<TAxnParam>)
  End;

  TSQL = String;

implementation


end.
