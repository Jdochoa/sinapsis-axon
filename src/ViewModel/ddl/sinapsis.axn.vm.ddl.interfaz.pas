unit sinapsis.axn.vm.ddl.interfaz;

interface

uses
  spring.Collections,
  sinapsis.axn.m.ddl.interfaz,
  sinapsis.axn.m.ddl,
  sinapsis.axn.vm.interfaz,
  sinapsis.axn.vm.Catalogo.interfaz;

type

  IAxnVMDdl = Interface (IAxnVMCtl)
    ['{8CB7B28C-B181-4748-914C-C15EB58252F8}']
    procedure SetAxnMDdl(Value:TAxnMDdl);
    function GetAxnMDdl:TAxnMDdl;
    function DDLCreate:string;
    function DDLAlter:string;
    function DDLDrop:string;

    property AxnMDdl: TAxnMDdl read GetAxnMDdl write SetAxnMDdl;
  End;

  IAxnVMTdt0 = interface(IAxnVMDdl)
    ['{03F8CF41-AD6C-4FFE-8D86-48D40515B389}']
    procedure SetAxnMTdt0(Value:TAxnMTdt0);
    function GetAxnMTdt0:TAxnMTdt0;

    property AxnMTdt0: TAxnMTdt0 read GetAxnMTdt0 write SetAxnMTdt0;
  end;

  IAxnVMAtr0 = interface(IAxnVMDdl)
    ['{8C20EE65-A56B-4E07-B092-B4A025286083}']
    procedure SetAxnMAtr0(Value:TAxnMAtr0);
    function GetAxnMAtr0:TAxnMAtr0;

    property AxnMAtr0: TAxnMAtr0 read GetAxnMAtr0 write SetAxnMAtr0;
  end;

  IAxnVMCls0 = interface(IAxnVMDdl)
    ['{61EDF246-62F4-4CAF-BA5C-231A14E7E8AA}']
    procedure SetAxnMCls0(Value:TAxnMCls0);
    function GetAxnMCls0:TAxnMCls0;

    property AxnMCls0: TAxnMCls0 read GetAxnMCls0 write SetAxnMCls0;
  end;


  IAxnVMPkg0 = interface(IAxnVMDdl)
    ['{BDAC38F0-996A-439B-858F-429C8772D755}']
    procedure SetAxnMPkg0(Value:TAxnMPkg0);
    function GetAxnMPkg0:TAxnMPkg0;

    property AxnMPkg0: TAxnMPkg0 read GetAxnMPkg0 write SetAxnMPkg0;
  end;


implementation

end.
