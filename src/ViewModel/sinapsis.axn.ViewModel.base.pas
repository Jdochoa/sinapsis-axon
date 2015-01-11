unit sinapsis.axn.ViewModel.base;

interface

uses
  sinapsis.axn.model.interfaz,
  sinapsis.axn.ViewModel.interfaz;

type
  TAxnViewModel = class (TInterfacedObject, IAxnViewModel)
  private
    FModel : IAxnViewModel;
  protected
    function GetModel : IAxnModel;
    procedure SetModel (const AValue : IAxnModel);
  public
    property Model: IAxnModel read GetModel write SetModel;
  end;


implementation

{ TAxnViewModel }

function TAxnViewModel.GetModel: IAxnModel;
begin

end;

procedure TAxnViewModel.SetModel(const AValue: IAxnModel);
begin

end;

end.
