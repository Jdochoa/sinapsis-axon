unit sinapsis.axn.m;

interface
uses
  dorm.Mappings,
  sinapsis.axn.common.clases,
  sinapsis.axn.m.interfaz;

type

  [Entity('AXN_DATA')]
  [NoAutomapping]
  TAxnM = class {$ifndef Debug}abstract {$endif}(TInterfacedObject,IAxnM)
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
  public
   [Id]
   [Column('ID')]
   property Id:Integer read getId;
   [Column('CREATEDBY')]
   [Transient]
   property CreatedBy:Integer read getCreatedBy;
   [Column('CREATEDAT')]
   [Transient]
   property CreatedAt:TDateTime read getCreatedAt;
   [Column('MODIFIEDBY')]
   [Transient]
   property ModifiedBy:Integer read getModifiedBy;
   [Column('MODIFIEDAT')]
   [Transient]
   property ModifiedAt:TDateTime read getModifiedAt;
  end;

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


end.
