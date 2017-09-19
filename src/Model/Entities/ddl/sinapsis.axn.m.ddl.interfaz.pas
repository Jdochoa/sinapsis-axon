unit sinapsis.axn.m.ddl.interfaz;

interface

uses
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.catalogo.interfaz;

type
  IAxnMDdl = interface (IAxnMCtl)
    ['{E30F3833-38C7-4680-B001-7F8E99D52E03}']
  end;

  IAxnMTdt0 = interface (IAxnMDdl)
    ['{1F950209-40FB-421B-A0F5-2CCD217B3BB3}']
  end;

  IAxnMPkg0 = interface (IAxnMDdl)
    ['{D1BDC48B-B060-41E4-AB1C-DECDA6262A34}']
  end;

  IAxnMCls0 = interface (IAxnMDdl)
    ['{9BDA2850-A538-4CF5-8A10-7B1AA0DD9EDD}']
    procedure setPkg0_Id(const Value : integer);
    procedure setCls0_Id(const Value : integer);
    procedure setAbstract(const Value : boolean);
    function  getPkg0_Id : integer;
    function  getCls0_Id : integer;
    function  getAbstract: boolean;

    property Pkg0_Id : integer read getPkg0_Id write setPkg0_Id;
    property Cls0_Id : integer read getCls0_Id write setCls0_Id;
    property Abstract : Boolean read getAbstract write setAbstract;
  end;

  IAxnMAtr0 = interface (IAxnMDdl)
    ['{C77BEC4B-8AD4-4FCA-B8C9-2B0D03585FD1}']
    procedure setTdt0_Id(const Value : integer);
    procedure setCls0_Id(const Value : integer);
    function  getTdt0_Id : integer;
    function  getCls0_Id : integer;

    property Tdt0_Id : integer read getTdt0_Id write setTdt0_Id;
    property Cls0_Id : integer read getCls0_Id write setCls0_Id;
  end;


implementation

end.
