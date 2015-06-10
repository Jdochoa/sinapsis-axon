unit sinapsis.axn.v.consulta.interfaz;

interface
uses
  Vcl.Controls,
  Spring.Collections,
  sinapsis.axn.vm.interfaz;

type
  IAxnVCns = interface
    ['{5629F5FF-8EFB-4039-8246-86D61C94A953}']
    procedure SetId(const Value:Integer);
    procedure SetData(const Value: IList<IAxnVMSingle>);
    function GetId:Integer;
    function GetData:IList<IAxnVMSingle>;

    function Execute:TModalResult;

    property Id: Integer read GetId write SetId;
    property Data: IList<IAxnVMSingle> read GetData write SetData;
  end;
  IAxnVConCtl = interface(IAxnVCns)
    ['{5E72ADF5-8013-43BD-9690-D1C4025FE4E2}']
  end;
  IAxnVConMvm = interface(IAxnVCns)
    ['{66104F8E-B5C5-4A9D-A8A8-487155A835AA}']
  end;

implementation

end.
