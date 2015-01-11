unit sinapsis.axn.model.interfaz;

interface
uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils,
  Spring,
  Spring.Collections
  ;


type
  TAxnModelEnviroment = (deDevelopment, deTest, deRelease);

  IAxnModel = interface
    ['{AA819A0D-4B30-4937-856E-E4914ABA9D1D}']
    procedure LoadList(AClassType: TClass; List : TObject); overload;
//    procedure LoadList(List : TObject);overload;
  end;

  IAxnModelFactory = interface
    ['{010448F8-AE56-48F7-99E0-69E8DF8FB00A}']
    function CreateAxnModel(Enviroment:TAxnModelEnviroment):IAxnModel; overload;
    function CreateAxnModel(Enviroment:TAxnModelEnviroment;strFile:TFileName):IAxnModel; overload;
  end;


implementation

uses sinapsis.axn.modelDORM;

end.
