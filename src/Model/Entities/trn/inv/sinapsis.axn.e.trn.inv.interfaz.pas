unit sinapsis.axn.e.trn.inv.interfaz;

interface
uses
  sinapsis.axn.e.trn.interfaz
  ;

type

  IETrn0Inv0 = interface(IETrn0)
    ['{50827080-7FFB-413B-998C-0B8C2AB8E173}']
    procedure SetInvAfecta (const Value : Integer);

    function GetInvAfecta:Integer;


    property InvAfecta: Integer read GetInvAfecta write SetInvAfecta;
  end;

implementation

end.
