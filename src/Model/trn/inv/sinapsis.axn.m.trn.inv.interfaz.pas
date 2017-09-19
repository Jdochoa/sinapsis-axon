unit sinapsis.axn.m.trn.inv.interfaz;

interface
uses
  sinapsis.axn.m.interfaz,
  sinapsis.axn.m.trn.interfaz
  ;

type

  IAxnMTrnInv = interface(IAxnMTrn)
    ['{50827080-7FFB-413B-998C-0B8C2AB8E173}']
    procedure SetInvAfecta (const Value : Integer);

    function GetInvAfecta:Integer;


    property InvAfecta: Integer read GetInvAfecta write SetInvAfecta;
  end;

implementation

end.
