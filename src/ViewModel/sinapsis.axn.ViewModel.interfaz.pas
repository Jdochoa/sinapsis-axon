unit sinapsis.axn.ViewModel.interfaz;

interface

uses
  Spring,
  Spring.Collections,
  Sinapsis.axn.model.interfaz;


type
  IAxnViewModel = interface
    ['{E2B1C129-2593-43FC-9DE3-CB829E76E207}']
    function GetModel : IAxnModel;
    procedure SetModel (const AValue : IAxnModel);
    property Model: IAxnModel read GetModel write SetModel;

  end;

implementation

end.
