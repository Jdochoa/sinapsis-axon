unit sinapsis.axn.dorm.generator;

interface
uses
  System.SysUtils,
  dorm.Commons;

type
  TAxonKeyGenerator = class abstract(TdormInterfacedObject,
    IdormKeysGenerator)
  protected
    FPersistStrategy: IdormPersistStrategy;
    function GetSequenceFormatTemplate: String; virtual;// abstract;

  public
    function NewStringKey(const Entity: string): string;
    function NewIntegerKey(const Entity: string): UInt64;
    procedure SetPersistStrategy(const PersistentStrategy
      : IdormPersistStrategy);
    class procedure register;
  end;

implementation

{ TAxonKeyGenerator }

function TAxonKeyGenerator.GetSequenceFormatTemplate: String;
begin
  Result := 'GEN_%s';
end;

function TAxonKeyGenerator.NewIntegerKey(const Entity: string): UInt64;
var
  SequenceName: String;
begin
  SequenceName := Format(GetSequenceFormatTemplate, [Entity]);
  Result := FPersistStrategy.ExecuteAndGetFirst('SELECT ID FROM AXN_GEN_ID(''' + SequenceName+ ''',1)');
end;

function TAxonKeyGenerator.NewStringKey(const Entity: string): string;
begin
  raise EdormException.Create('String keys not supported');
end;

class procedure TAxonKeyGenerator.register;
begin
//
end;

procedure TAxonKeyGenerator.SetPersistStrategy(
  const PersistentStrategy: IdormPersistStrategy);
begin
  FPersistStrategy := PersistentStrategy;
end;


initialization
  TAxonKeyGenerator.register;
end.
