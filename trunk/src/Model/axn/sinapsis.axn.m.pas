unit sinapsis.axn.m;

interface
uses
//  System.Generics.Collections,

  dorm.Mappings,
  spring,
  spring.Collections,
  spring.Collections.Lists,

  sinapsis.axn.common.clases,
  sinapsis.axn.m.interfaz;

type

  [Entity('AXN_DATA')]
  [NoAutomapping]
  TAxnM = class {$ifndef Debug}abstract {$endif}(TInterfacedObjectAxn,IAxnM)
  private
    FId: Integer;
	  FCreatedBy : Integer;
	  FCreatedAt : TDateTime;
	  FModifiedBy : Integer;
	  FModifiedAt : TDateTime;
  protected
    function getId():Integer;
    function getCreatedBy():Integer;
    function getCreatedAt():TDateTime;
    function getModifiedBy():Integer;
    function getModifiedAt():TDateTime;
    procedure setId(Value:Integer);
  public
   [Id]
   [Column('ID')]
   property Id:Integer read getId write setId;
   [Transient]
   [Column('CREATEDBY')]
   property CreatedBy:Integer read getCreatedBy;
   [Transient]
   [Column('CREATEDAT')]
   property CreatedAt:TDateTime read getCreatedAt;
   [Transient]
   [Column('MODIFIEDBY')]
   property ModifiedBy:Integer read getModifiedBy;
   [Transient]
   [Column('MODIFIEDAT')]
   property ModifiedAt:TDateTime read getModifiedAt;
  end;

  {TAxnMList<T:TAxnM> = class(TObjectList<T>, IAxnMList<T>)
  private
  protected
    procedure setLista(const Value :TObjectList<T>);
    function getLista:TObjectList<T>;
  public
    property Lista:TObjectList<T> read getLista write setLista;
  end;}


implementation

{ TAxonModel }

function TAxnM.getCreatedAt: TDateTime;
begin
  Result := FCreatedAt;
end;

function TAxnM.getCreatedBy: Integer;
begin
  Result := FCreatedBy;
end;

function TAxnM.getId: Integer;
begin
  Result := FId;
end;

function TAxnM.getModifiedAt: TDateTime;
begin
  Result := FModifiedAt;
end;

function TAxnM.getModifiedBy: Integer;
begin
  Result := FModifiedBy;
end;



procedure TAxnM.setId(Value: Integer);
begin
  FId := Value;
end;

end.
