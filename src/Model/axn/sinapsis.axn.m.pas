unit sinapsis.axn.m;

interface
{$I Model.inc}
uses
  {$IFDEF Marshmallow}
    Spring.Persistence.Mapping.Attributes,
  {$ELSE}
   {$IFDEF DORM}
    dorm.Mappings,
   {$ENDIF}
  {$ENDIF}
  sinapsis.axn.m.interfaz;

type
  {$IFDEF Marshmallow}
    [Entity]
    [Table('AXN_DATA','AXN')]
  {$ELSE}
   {$IFDEF DORM}
    [Entity('AXN_DATA')]
    [NoAutomapping]
   {$ENDIF}
  {$ENDIF}
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
    procedure setId(Value:Integer);
    procedure setCreatedBy(Value :Integer);
    procedure setCreatedAt(Value :TDateTime);
    procedure setModifiedBy(Value :Integer);
    procedure setModifiedAt(Value :TDateTime);

  public
  {$IFDEF Marshmallow}
     [Id]
     [Column('ID', [cpRequired, cpPrimaryKey, cpNotNull], -1, -1, -1, 'Primary Key')]
  {$ELSE}
    {$IFDEF DORM}
     [Id]
     [Column('ID')]
    {$ENDIF}
  {$ENDIF}
   property Id:Integer read getId write setId;
  {$IFDEF Marshmallow}
     //[Column('CREATEDBY', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Create by')]
  {$ELSE}
    {$IFDEF DORM}
     [Transient]
     [Column('CREATEDBY')]
    {$ENDIF}
  {$ENDIF}
   property CreatedBy:Integer read getCreatedBy;
  {$IFDEF Marshmallow}
     //[Column('CREATEDAT', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Created at')]
  {$ELSE}
    {$IFDEF DORM}
     [Transient]
     [Column('CREATEDAT')]
    {$ENDIF}
  {$ENDIF}
   property CreatedAt:TDateTime read getCreatedAt;
  {$IFDEF Marshmallow}
     //[Column('MODIFIEDBY', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Modified by')]
  {$ELSE}
    {$IFDEF DORM}
     [Transient]
     [Column('MODIFIEDBY')]
    {$ENDIF}
  {$ENDIF}
   property ModifiedBy:Integer read getModifiedBy;
  {$IFDEF Marshmallow}
     //[Column('MODIFIEDAT', [cpDontInsert,cpDontUpdate], -1, -1, -1, 'Modified at')]
  {$ELSE}
    {$IFDEF DORM}
     [Transient]
     [Column('MODIFIEDAT')]
    {$ENDIF}
  {$ENDIF}
   property ModifiedAt:TDateTime read getModifiedAt;
  end;

//  TAxnMList<T:TAxnM> = class(TObjectList<T>, IAxnMList<T>)
//  private
//  protected
//  public
//  end;


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

procedure TAxnM.setCreatedAt(Value: TDateTime);
begin
  FCreatedAt := Value;
end;

procedure TAxnM.setCreatedBy(Value: Integer);
begin
  FCreatedBy := Value;
end;

procedure TAxnM.setId(Value: Integer);
begin
  FId := Value;
end;

procedure TAxnM.setModifiedAt(Value: TDateTime);
begin
  FModifiedAt := Value;
end;

procedure TAxnM.setModifiedBy(Value: Integer);
begin
  FModifiedBy := Value;
end;

end.
