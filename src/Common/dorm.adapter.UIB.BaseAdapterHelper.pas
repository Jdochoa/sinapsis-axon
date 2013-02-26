unit dorm.adapter.UIB.BaseAdapterHelper;

interface

uses dorm.adapter.UIB.BaseAdapter;

Type
  TUIBFirebirdTableProcedure = class  (TUIBBaseTableSequence)
  public
    function NewIntegerKey(const Entity: string): UInt64; reintroduce;
    class procedure register;
  end;

implementation

{ TUIBBaseTableSequenceHelpAxon }

function TUIBFirebirdTableProcedure.NewIntegerKey(
  const Entity: string): UInt64;
begin
  Result := FPersistStrategy.ExecuteAndGetFirst('SELECT ID from Axon_Get_Id(' + Entity
    + ')');

end;

class procedure TUIBFirebirdTableProcedure.register;
begin

end;

initialization

TUIBFirebirdTableProcedure.register;

finalization
end.
