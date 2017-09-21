unit sinapsis.axn.e.trn.interfaz;

interface
uses
//  sinapsis.axn.e.interfaz,
  sinapsis.axn.e.ctl.interfaz
  ;

const
  faNinguno = char(' ');
  faCargo = char('+');
  faAbono = char('-');

type
  TFAfecta = set of char;//(faNinguno, faCargo, faAbono);
//  TFafectas = set of TFAfecta;

  IETrn0 = interface(IAxnECtl)
    ['{FA9E115A-0E0A-499C-ACC6-AFAA6F98B633}']
    procedure setFAfecta (const Value : TFAfecta);
    procedure setLineas (const Value : Integer);

    function  getFAfecta : TFAfecta;
    function  getLineas : Integer;

    property FAfecta : TFAfecta read getFAfecta write setFAfecta;
    property Lineas : Integer read getLineas write setLineas;
  end;

implementation

end.
