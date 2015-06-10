unit sinapsis.axn.v.consulta;

interface
uses
  Vcl.Controls,
  Spring.Collections,
  sinapsis.axn.vm.interfaz,

  sinapsis.axn.v.consulta.interfaz;

type
  TAxnVCns = class (TInterfacedObject,IAxnVCns)
  private
  protected
    procedure SetId(const Value:Integer);
    procedure SetData(const Value: IList<IAxnVMSingle>);
    function GetId:Integer;
    function GetData:IList<IAxnVMSingle>;

  public
    function Execute:TModalResult;

    property Id: Integer read GetId write SetId;
    property Data: IList<IAxnVMSingle> read GetData write SetData;

  end;

implementation

{ TAxnVCns }

function TAxnVCns.Execute: TModalResult;
begin

end;

function TAxnVCns.GetData: IList<IAxnVMSingle>;
begin

end;

function TAxnVCns.GetId: Integer;
begin

end;

procedure TAxnVCns.SetData(const Value: IList<IAxnVMSingle>);
begin

end;

procedure TAxnVCns.SetId(const Value: Integer);
begin

end;

end.
