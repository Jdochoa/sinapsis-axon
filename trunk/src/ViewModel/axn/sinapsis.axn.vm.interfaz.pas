unit sinapsis.axn.vm.interfaz;

interface

uses
  Spring.Collections,
  sinapsis.axn.model.interfaz,
  sinapsis.axn.model,
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m
  ;
type

  IAxnVMEdit = Interface
    ['{7147B716-8C96-4641-9B94-006B1DAC9484}']
    function Create : Boolean;
    function Read   : Boolean;
    function Update : Boolean;
    function Delete : Boolean;
  End;

  IAxnVM = interface
    ['{F2071437-AB33-4E3A-BE37-092D3CF9A979}']
    function GetModel : TAxnModel;
    procedure SetModel(const Value : TAxnModel);
    property Model: TAxnModel read GetModel write SetModel;
  end;

//  IAxnVMSingle<T: IAxnM> = interface//(IAxnVM)
  IAxnVMSingle = interface//(IAxnVM)
    ['{E48D0BD8-B3A8-4F50-B787-53EC2D393CA9}']
    function GetAxnM : TAxnM;
    procedure SetAxnM(const Value : TAxnM);
    procedure SetId(const Value : Integer);
    function GetId:Integer;
    property ID: Integer read GetID write SetID;
    property AxnM : TAxnM read GetAxnM write SetAxnM;
  end;

  IAxnVMCollection<T: TAxnM> = interface//(IAxnVM)
    ['{E6DEB531-AFF1-4083-9D15-EF0BF75513B4}']
    function GetLista:ICollection<T>;
    function GetClase : TClass;
    procedure SetLista(const Value :ICollection<T>);
    procedure SetClase(const Value :TClass);
    property Lista: ICollection<T> read GetLista write SetLista;
    property Clase : TClass read GetClase write SetClase;
  end;

  IAxnSrvMdl = Interface(IAxnVM)
//  IAxnVMSubModulo = Interface(IAxnVM)
    ['{8DCD035D-7AE4-443F-96D3-8F96DD559F9A}']
    function Id(const Value : Integer):IAxnVMSingle;
    function All:IAxnVMCollection<TAxnM>;
  End;

  IAxnPkg = Interface(IAxnVM)
//  IAxnVMModulo = Interface(IAxnVM)
    ['{1561DC3A-FD07-449F-B10F-08B5A468D5B0}']
//    procedure SetSrvMdl(Index : String; Value:IAxnSrvMdl);
    function GetSrvMdl(Index:String):IAxnSrvMdl;
    property SrvMdl[Index:String]:IAxnSrvMdl read GetSrvMdl;// write SetSrvMdl;
  End;



implementation

end.
